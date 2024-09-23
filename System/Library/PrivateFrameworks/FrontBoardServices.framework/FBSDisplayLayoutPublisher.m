@implementation FBSDisplayLayoutPublisher

- (id)transitionAssertionWithReason:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  NSMutableOrderedSet *transitionReasons;
  const __CFString *v8;
  NSMutableOrderedSet *v9;
  NSMutableOrderedSet *v10;
  id v11;
  void *v12;
  id result;
  void *v14;
  _QWORD v15[5];

  v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = v5;
  if (!v6)
  {
    ++self->_transitionsCount;
    v8 = CFSTR("<nil>");
LABEL_8:
    v11 = objc_alloc((Class)off_1E38E9EA0);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__FBSDisplayLayoutPublisher_transitionAssertionWithReason___block_invoke;
    v15[3] = &unk_1E38ED890;
    v15[4] = self;
    v12 = (void *)objc_msgSend(v11, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.frontboard.layout.publisher.transition"), v8, v15);

    return v12;
  }
  NSClassFromString(CFSTR("NSString"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    transitionReasons = self->_transitionReasons;
    ++self->_transitionsCount;
    if (transitionReasons)
    {
      -[NSMutableOrderedSet removeObject:](transitionReasons, "removeObject:", v6);
      -[NSMutableOrderedSet addObject:](self->_transitionReasons, "addObject:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObject:", v6);
      v9 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      v10 = self->_transitionReasons;
      self->_transitionReasons = v9;

    }
    v8 = v6;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSDisplayLayoutPublisher transitionAssertionWithReason:].cold.1();
  objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t __59__FBSDisplayLayoutPublisher_transitionAssertionWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endTransition");
}

- (void)flush
{
  FBSDisplayLayout *mutableLayout;
  FBSDisplayLayout *v4;
  OS_xpc_object *v5;
  OS_xpc_object *xLayout;
  OS_xpc_object *v7;
  FBSDisplayLayout *v8;
  FBSDisplayLayout *currentLayout;
  void *v10;
  void *v11;
  uint64_t i;
  NSObject *v13;
  OS_xpc_object *v14;
  id v15;
  NSHashTable *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  FBSDisplayLayout *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD block[5];
  OS_xpc_object *v29;
  id v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (self->_dirty)
  {
    self->_dirty = 0;
    -[FBSDisplayLayout finalizeLayout](self->_mutableLayout, "finalizeLayout");
    if (self->_suppressionCount)
      mutableLayout = 0;
    else
      mutableLayout = self->_mutableLayout;
    v4 = mutableLayout;
    if (!BSEqualObjects() || v4 && !self->_xLayout)
    {
      v5 = (OS_xpc_object *)BSCreateSerializedBSXPCEncodableObject();
      xLayout = self->_xLayout;
      self->_xLayout = v5;

      v7 = v5;
      v8 = (FBSDisplayLayout *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
      currentLayout = self->_currentLayout;
      self->_currentLayout = v8;

      v23 = v4;
      if (-[NSMutableOrderedSet count](self->_transitionReasons, "count"))
      {
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setTransitionReasons:", self->_transitionReasons);
        v11 = (void *)BSCreateSerializedBSXPCEncodableObject();
      }
      else
      {
        v11 = 0;
        v10 = 0;
      }
      for (i = 0; i != 3; ++i)
      {
        v13 = self->_queuesByQOS[i];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __34__FBSDisplayLayoutPublisher_flush__block_invoke;
        block[3] = &unk_1E38ED8B8;
        block[4] = self;
        v31 = i;
        v14 = v7;
        v29 = v14;
        v15 = v11;
        v30 = v15;
        dispatch_async(v13, block);

      }
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v16 = self->_observers;
      v17 = -[NSHashTable countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
            -[FBSDisplayLayoutPublisher currentLayout](self, "currentLayout");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "publisher:didUpdateLayout:withTransition:", self, v22, v10);

          }
          v18 = -[NSHashTable countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v18);
      }

      v4 = v23;
    }

  }
}

- (FBSDisplayLayout)currentLayout
{
  BSDispatchQueueAssertMain();
  return self->_currentLayout;
}

- (id)_addElement:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  v8 = v6;
  NSClassFromString(CFSTR("FBSDisplayLayoutElement"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayLayoutPublisher _addElement:forKey:].cold.1();
LABEL_26:
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E6EDCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSDisplayLayoutElementClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayLayoutPublisher _addElement:forKey:].cold.1();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E6F40);
  }

  v9 = v7;
  if (v9)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSDisplayLayoutPublisher _addElement:forKey:].cold.4();
      goto LABEL_26;
    }
  }

  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[element identifier] != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayLayoutPublisher _addElement:forKey:].cold.2();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E6FA4);
  }
  -[FBSDisplayLayout addElement:](self->_mutableLayout, "addElement:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@:%p %@>"), v14, v11, v15);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[NSMutableSet containsObject:](self->_mutableElementKeys, "containsObject:", v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("already have an element with identifier=%@"), v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayLayoutPublisher _addElement:forKey:].cold.3();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6E7000);
  }
  -[NSMutableSet addObject:](self->_mutableElementKeys, "addObject:", v9);
  self->_dirty = 1;
  if (!self->_transitionsCount)
    -[FBSDisplayLayoutPublisher flush](self, "flush");
  v16 = objc_alloc((Class)off_1E38E9EA0);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __48__FBSDisplayLayoutPublisher__addElement_forKey___block_invoke;
  v25[3] = &unk_1E38ED8E0;
  v25[4] = self;
  v26 = v11;
  v27 = v9;
  v17 = v9;
  v18 = v11;
  v19 = (void *)objc_msgSend(v16, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.frontboard.layout.publisher.add-element"), v17, v25);

  return v19;
}

void __34__FBSDisplayLayoutPublisher_flush__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8 * *(_QWORD *)(a1 + 56) + 48), *(id *)(a1 + 40));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8 * *(_QWORD *)(a1 + 56) + 72);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v19;
    *(_QWORD *)&v4 = 138412290;
    v17 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0D87D68];
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "remoteProcess", v17, (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "pid"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleForIdentifier:error:", v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v13, "isDaemon") & 1) != 0
          || (objc_msgSend(v13, "currentState"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v14, "taskState"),
              v14,
              v15 != 3))
        {
          objc_msgSend(v8, "remoteTarget");
          v16 = objc_claimAutoreleasedReturnValue();
          -[NSObject updateLayout:withTransition:](v16, "updateLayout:withTransition:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        }
        else
        {
          FBLogCommon();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v17;
            v23 = v13;
            _os_log_impl(&dword_19A6D4000, v16, OS_LOG_TYPE_INFO, "not sending layout update to suspended process %@", buf, 0xCu);
          }
        }

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v5);
  }

}

- (id)addElement:(id)a3
{
  return -[FBSDisplayLayoutPublisher _addElement:forKey:](self, "_addElement:forKey:", a3, 0);
}

uint64_t __48__FBSDisplayLayoutPublisher__addElement_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeElement:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  BSDispatchQueueAssertMain();
  if (-[FBSDisplayLayout interfaceOrientation](self->_mutableLayout, "interfaceOrientation") != a3)
  {
    -[FBSDisplayLayout setInterfaceOrientation:](self->_mutableLayout, "setInterfaceOrientation:", a3);
    self->_dirty = 1;
    if (!self->_transitionsCount)
      -[FBSDisplayLayoutPublisher flush](self, "flush");
  }
}

void __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned int v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  __int128 v8;
  char v9;

  v3 = *(char *)(a1 + 48);
  v4 = a2;
  objc_msgSend(off_1E38E9E80, "serviceWithClass:", _QOSClassForFBSDisplayLayoutQOS(v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v5);

  objc_msgSend(v4, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * *(char *)(a1 + 48) + 24));
  +[FBSDisplayLayoutMonitor interface](FBSDisplayLayoutMonitor, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v6);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke_3;
  v7[3] = &unk_1E38ED908;
  v9 = *(_BYTE *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v4, "setInvalidationHandler:", v7);

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  unsigned __int8 v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  unsigned __int8 v17;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.frontboardservices.display-layout-monitor"));

  if (v11 && (v12 = objc_msgSend(v9, "decodeInt64ForKey:", CFSTR("qos")), v12 <= 2u))
  {
    v13 = self->_queuesByQOS[(char)v12];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke;
    v14[3] = &unk_1E38ED958;
    v14[4] = self;
    v17 = v12;
    v15 = v8;
    v16 = a2;
    dispatch_async(v13, v14);

  }
  else
  {
    objc_msgSend(v8, "invalidate");
  }

}

void __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  char v11;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "hasBeenSignalled");
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "invalidate");
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke_2;
    v10[3] = &unk_1E38ED930;
    v11 = *(_BYTE *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v4;
    objc_msgSend(v3, "configureConnection:", v10);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8 * *(char *)(a1 + 56) + 72);
    if (v5)
    {
      objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", *(_QWORD *)(a1 + 40));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32) + 8 * *(char *)(a1 + 56);
      v8 = *(void **)(v7 + 72);
      *(_QWORD *)(v7 + 72) = v6;

    }
    objc_msgSend(*(id *)(a1 + 40), "activate");
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * *(char *)(a1 + 56) + 48))
    {
      objc_msgSend(*(id *)(a1 + 40), "remoteTarget");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateLayout:withTransition:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * *(char *)(a1 + 56) + 48), 0);

    }
  }
}

void __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8 * *(char *)(a1 + 48) + 72);
  v12 = v3;
  if (!v4)
  {
LABEL_4:
    objc_msgSend(v4, "removeObject:", v3);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8 * *(char *)(a1 + 48) + 72), "count"))
    {
      v7 = *(_QWORD *)(a1 + 32) + 8 * *(char *)(a1 + 48);
      v8 = *(void **)(v7 + 72);
      *(_QWORD *)(v7 + 72) = 0;

    }
    return;
  }
  v5 = objc_msgSend(v4, "containsObject:", v3);
  v6 = *(char *)(a1 + 48);
  if (v5)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8 * v6 + 72);
    v3 = v12;
    goto LABEL_4;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  _NSStringFromFBSDisplayLayoutQOS(v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("could not find connection=%@ in tracked(%@)=%@"), v12, v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * *(char *)(a1 + 48) + 72));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke_3_cold_1();
  objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (FBSDisplayLayoutPublisher)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSDisplayLayoutPublisher *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSDisplayLayoutPublisher *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on FBSDisplayLayoutPublisher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBSDisplayLayoutPublisher.m");
    v17 = 1024;
    v18 = 46;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSDisplayLayoutPublisher *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithConfiguration:(id)a3
{
  id v4;
  FBSDisplayLayoutPublisher *v5;
  uint64_t v6;
  BSAtomicSignal *invalidatedSignal;
  id v8;
  FBSDisplayLayoutPublisher *v9;
  uint64_t v10;
  BSServiceConnectionListener *listener;
  uint64_t v12;
  FBSDisplayLayout *mutableLayout;
  uint64_t v14;
  NSMutableSet *mutableElementKeys;
  void *v16;
  uint64_t v17;
  FBSDisplayLayout *currentLayout;
  uint64_t v19;
  OS_dispatch_queue **queuesByQOS;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  OS_dispatch_queue *v27;
  FBSDisplayLayoutPublisher *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  FBSDisplayLayoutPublisher *v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)FBSDisplayLayoutPublisher;
  v5 = -[FBSDisplayLayoutPublisher init](&v34, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    invalidatedSignal = v5->_invalidatedSignal;
    v5->_invalidatedSignal = (BSAtomicSignal *)v6;

    v31[1] = 3221225472;
    v31[2] = __52__FBSDisplayLayoutPublisher__initWithConfiguration___block_invoke;
    v31[3] = &unk_1E38ED848;
    v30 = v4;
    v31[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    v32 = v8;
    v29 = v5;
    v9 = v5;
    v33 = v9;
    objc_msgSend(off_1E38E9E78, "listenerWithConfigurator:", v31);
    v10 = objc_claimAutoreleasedReturnValue();
    listener = v9->_listener;
    v9->_listener = (BSServiceConnectionListener *)v10;

    v12 = objc_opt_new();
    mutableLayout = v9->_mutableLayout;
    v9->_mutableLayout = (FBSDisplayLayout *)v12;

    -[FBSDisplayLayout finalizeLayout](v9->_mutableLayout, "finalizeLayout");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    mutableElementKeys = v9->_mutableElementKeys;
    v9->_mutableElementKeys = (NSMutableSet *)v14;

    v16 = (void *)BSCreateSerializedBSXPCEncodableObject();
    v17 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
    currentLayout = v9->_currentLayout;
    v9->_currentLayout = (FBSDisplayLayout *)v17;

    v19 = 0;
    queuesByQOS = v9->_queuesByQOS;
    do
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "domainIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "instanceIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _NSStringFromFBSDisplayLayoutQOS((char)v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("com.apple.frontboard.layout.publisher[%@:%@](%@)"), v22, v23, v24);
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v25, "UTF8String");
      _QOSClassForFBSDisplayLayoutQOS((char)v19);
      v26 = BSDispatchQueueCreateWithQualityOfService();
      v27 = queuesByQOS[v19];
      queuesByQOS[v19] = (OS_dispatch_queue *)v26;

      ++v19;
    }
    while (v19 != 3);

    v5 = v29;
    v4 = v30;
  }

  return v5;
}

void __52__FBSDisplayLayoutPublisher__initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v3, "domainIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDomain:", v4);

  +[FBSDisplayLayoutMonitor serviceIdentifier](FBSDisplayLayoutMonitor, "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setService:", v5);

  objc_msgSend(*(id *)(a1 + 32), "instanceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInstance:", v6);

  objc_msgSend(v7, "setDelegate:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (id)publisherWithConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  NSClassFromString(CFSTR("FBSDisplayLayoutPublisherConfiguration"));
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSDisplayLayoutPublisher publisherWithConfiguration:].cold.1();
LABEL_25:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A73F5F4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSDisplayLayoutPublisherConfigurationClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSDisplayLayoutPublisher publisherWithConfiguration:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A73F658);
  }

  objc_msgSend(v3, "domainIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("NSString"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSDisplayLayoutPublisher publisherWithConfiguration:].cold.2();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A73F6BCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSDisplayLayoutPublisher publisherWithConfiguration:].cold.2();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A73F720);
  }

  objc_msgSend(v3, "instanceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSDisplayLayoutPublisher publisherWithConfiguration:].cold.3();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A73F784);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSDisplayLayoutPublisher publisherWithConfiguration:].cold.3();
    goto LABEL_25;
  }

  v6 = -[FBSDisplayLayoutPublisher _initWithConfiguration:]([FBSDisplayLayoutPublisher alloc], "_initWithConfiguration:", v3);
  return v6;
}

- (void)activate
{
  -[BSServiceConnectionListener activate](self->_listener, "activate");
}

- (void)invalidate
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  char v7;

  if (-[BSAtomicSignal signal](self->_invalidatedSignal, "signal"))
  {
    -[BSServiceConnectionListener invalidate](self->_listener, "invalidate");
    v3 = 0;
    v4 = MEMORY[0x1E0C809B0];
    do
    {
      v5 = self->_queuesByQOS[v3];
      v6[0] = v4;
      v6[1] = 3221225472;
      v6[2] = __39__FBSDisplayLayoutPublisher_invalidate__block_invoke;
      v6[3] = &unk_1E38ED388;
      v6[4] = self;
      v7 = v3;
      dispatch_async(v5, v6);
      ++v3;
    }
    while (v3 != 3);
  }
}

void __39__FBSDisplayLayoutPublisher_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8 * *(char *)(a1 + 40) + 72), "enumerateObjectsUsingBlock:", &__block_literal_global_28);
  v2 = *(_QWORD *)(a1 + 32) + 8 * *(char *)(a1 + 40);
  v3 = *(void **)(v2 + 72);
  *(_QWORD *)(v2 + 72) = 0;

}

uint64_t __39__FBSDisplayLayoutPublisher_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

- (id)suppressLayoutForReason:(id)a3
{
  id v4;
  unint64_t transitionsCount;
  id v6;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  BSDispatchQueueAssertMain();
  transitionsCount = self->_transitionsCount;
  ++self->_suppressionCount;
  self->_dirty = 1;
  if (!transitionsCount)
    -[FBSDisplayLayoutPublisher flush](self, "flush");
  v6 = objc_alloc((Class)off_1E38E9EA0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__FBSDisplayLayoutPublisher_suppressLayoutForReason___block_invoke;
  v9[3] = &unk_1E38ED890;
  v9[4] = self;
  v7 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("FBSDisplayLayoutPublisher Suppression"), v4, v9);

  return v7;
}

uint64_t __53__FBSDisplayLayoutPublisher_suppressLayoutForReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endSuppression");
}

- (FBSDisplayConfiguration)displayConfiguration
{
  BSDispatchQueueAssertMain();
  return -[FBSDisplayLayout displayConfiguration](self->_mutableLayout, "displayConfiguration");
}

- (void)setDisplayConfiguration:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  BSDispatchQueueAssertMain();
  -[FBSDisplayLayout displayConfiguration](self->_mutableLayout, "displayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[FBSDisplayLayout setDisplayConfiguration:](self->_mutableLayout, "setDisplayConfiguration:", v6);
    self->_dirty = 1;
    if (!self->_transitionsCount)
      -[FBSDisplayLayoutPublisher flush](self, "flush");
  }

}

- (int64_t)interfaceOrientation
{
  BSDispatchQueueAssertMain();
  return -[FBSDisplayLayout interfaceOrientation](self->_mutableLayout, "interfaceOrientation");
}

- (int64_t)backlightLevel
{
  BSDispatchQueueAssertMain();
  return -[FBSDisplayLayout displayBacklightLevel](self->_mutableLayout, "displayBacklightLevel");
}

- (void)setBacklightLevel:(int64_t)a3
{
  BSDispatchQueueAssertMain();
  if (-[FBSDisplayLayout displayBacklightLevel](self->_mutableLayout, "displayBacklightLevel") != a3)
  {
    -[FBSDisplayLayout setDisplayBacklightLevel:](self->_mutableLayout, "setDisplayBacklightLevel:", a3);
    self->_dirty = 1;
    if (!self->_transitionsCount)
      -[FBSDisplayLayoutPublisher flush](self, "flush");
  }
}

- (BOOL)isTransitioning
{
  BSDispatchQueueAssertMain();
  return self->_transitionsCount != 0;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    BSDispatchQueueAssertMain();
    if (!-[NSHashTable containsObject:](self->_observers, "containsObject:", v9))
    {
      observers = self->_observers;
      if (!observers)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
        v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v7 = self->_observers;
        self->_observers = v6;

        observers = self->_observers;
      }
      -[NSHashTable addObject:](observers, "addObject:", v9);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("observer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayLayoutPublisher addObserver:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)removeObserver:(id)a3
{
  void *v4;
  NSUInteger v5;
  NSHashTable *observers;
  id v7;

  v7 = a3;
  BSDispatchQueueAssertMain();
  v4 = v7;
  if (v7)
  {
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v7);
    v5 = -[NSHashTable count](self->_observers, "count");
    v4 = v7;
    if (!v5)
    {
      observers = self->_observers;
      self->_observers = 0;

      v4 = v7;
    }
  }

}

- (void)setBacklightState:(int64_t)a3
{
  BSDispatchQueueAssertMain();
  if (-[FBSDisplayLayout backlightState](self->_mutableLayout, "backlightState") != a3)
  {
    -[FBSDisplayLayout setBacklightState:](self->_mutableLayout, "setBacklightState:", a3);
    self->_dirty = 1;
    if (!self->_transitionsCount)
      -[FBSDisplayLayoutPublisher flush](self, "flush");
  }
}

- (void)_endTransition
{
  unint64_t v3;
  NSMutableOrderedSet *transitionReasons;

  BSDispatchQueueAssertMain();
  v3 = self->_transitionsCount - 1;
  self->_transitionsCount = v3;
  if (!v3)
  {
    -[FBSDisplayLayoutPublisher flush](self, "flush");
    transitionReasons = self->_transitionReasons;
    self->_transitionReasons = 0;

  }
}

- (void)_endSuppression
{
  unint64_t v3;

  BSDispatchQueueAssertMain();
  v3 = self->_suppressionCount - 1;
  self->_suppressionCount = v3;
  if (!v3)
  {
    self->_dirty = 1;
    if (!self->_transitionsCount)
      -[FBSDisplayLayoutPublisher flush](self, "flush");
  }
}

- (void)_removeElement:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  BSDispatchQueueAssertMain();
  if ((-[NSMutableSet containsObject:](self->_mutableElementKeys, "containsObject:", v6) & 1) != 0)
  {
    -[NSMutableSet removeObject:](self->_mutableElementKeys, "removeObject:", v6);
    -[FBSDisplayLayout removeElement:](self->_mutableLayout, "removeElement:", v8);
    self->_dirty = 1;
    if (!self->_transitionsCount)
      -[FBSDisplayLayoutPublisher flush](self, "flush");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing an element with identifier=%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayLayoutPublisher _removeElement:forKey:].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;

  objc_storeStrong((id *)&self->_transitionReasons, 0);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_xLayout, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_mutableElementKeys, 0);
  objc_storeStrong((id *)&self->_mutableLayout, 0);
  for (i = 0; i != -3; --i)
    objc_storeStrong((id *)&self->_queues_connectionsByQOS[i + 2], 0);
  for (j = 0; j != -3; --j)
    objc_storeStrong((id *)&self->_queues_xLayoutByQOS[j + 2], 0);
  for (k = 40; k != 16; k -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + k), 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_invalidatedSignal, 0);
}

+ (void)publisherWithConfiguration:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)publisherWithConfiguration:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)publisherWithConfiguration:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)transitionAssertionWithReason:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)addObserver:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_addElement:forKey:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_addElement:forKey:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_addElement:forKey:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_addElement:forKey:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_removeElement:forKey:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __71__FBSDisplayLayoutPublisher_listener_didReceiveConnection_withContext___block_invoke_3_cold_1()
{
  uint64_t v0;
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(*(SEL *)(v0 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

@end
