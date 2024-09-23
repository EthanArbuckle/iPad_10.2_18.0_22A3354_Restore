@implementation FBSWorkspace

- (void)monitor:(id)a3 didReceiveEndpoint:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__FBSWorkspace_monitor_didReceiveEndpoint___block_invoke;
  block[3] = &unk_1E38EAE08;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __36__FBSWorkspace_sceneWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("FBSWorkspaceCalloutScenesSourceKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE3B7AE8))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "scenes", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32));

          if (v12)
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v10);
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)_calloutQueue_executeCalloutFromSource:(id)a3 withBlock:(id)a4
{
  void (**v6)(_QWORD);
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v6)
  {
    v7 = v6;
    -[FBSSerialQueue assertOnQueue](self->_callOutQueue, "assertOnQueue");
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "threadDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKey:", CFSTR("FBSWorkspaceCalloutScenesSourceKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x19AECA15C](objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("FBSWorkspaceCalloutScenesSourceKey")));
    v7[2](v7);
    objc_autoreleasePoolPop(v11);
    if (v10)
      objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("FBSWorkspaceCalloutScenesSourceKey"));
    else
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("FBSWorkspaceCalloutScenesSourceKey"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("callout"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspace _calloutQueue_executeCalloutFromSource:withBlock:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

id __43__FBSWorkspace_monitor_didReceiveEndpoint___block_invoke(uint64_t a1)
{
  return -[FBSWorkspace _queue_scenesClientForEndpoint:creatingIfNecessary:](*(void ***)(a1 + 32), *(void **)(a1 + 40), 1);
}

- (id)_queue_scenesClientForEndpoint:(int)a3 creatingIfNecessary:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id *v11;
  id *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id *v24;
  NSObject *v25;
  void *v27;
  int v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    BSDispatchQueueAssert();
    +[FBSWorkspaceScenesClient sourceIdentifierForHostEndpoint:]((uint64_t)FBSWorkspaceScenesClient, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    v9 = v7;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    if (!v11 && a3)
    {
      v12 = -[FBSWorkspaceScenesClient initWithEndpoint:queue:calloutQueue:workspace:]((id *)[FBSWorkspaceScenesClient alloc], v5, a1[4], a1[1], a1);
      if (v12)
      {
        v11 = v12;
        objc_msgSend(a1[5], "objectForKey:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_opt_class();
        v15 = v13;
        if (v14)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v15;
          else
            v16 = 0;
        }
        else
        {
          v16 = 0;
        }
        v24 = v16;

        if (v11 != v24)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("source must be registered immediately"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBSWorkspace _queue_scenesClientForEndpoint:creatingIfNecessary:].cold.2();
          objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A6EDD84);
        }
        FBLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 138412290;
          v29 = v5;
          _os_log_impl(&dword_19A6D4000, v25, OS_LOG_TYPE_DEFAULT, "FBSWorkspace connected to endpoint : %@", (uint8_t *)&v28, 0xCu);
        }

        -[FBSWorkspaceScenesClient queue_activate]((uint64_t)v11);
      }
      else
      {
        FBLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[FBSWorkspace _queue_scenesClientForEndpoint:creatingIfNecessary:].cold.1((uint64_t)v5, v17, v18, v19, v20, v21, v22, v23);

        v11 = 0;
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_initWithOptions:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  Class v45;
  NSObject *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_super v53;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("options"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSWorkspace _initWithOptions:].cold.1();
      objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      goto LABEL_32;
    }
    objc_msgSend(v3, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[options delegate]"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSWorkspace _initWithOptions:].cold.2();
      objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6EE844);
    }
    v53.receiver = a1;
    v53.super_class = (Class)FBSWorkspace;
    a1 = (void **)objc_msgSendSuper2(&v53, sel_init);
    if (a1)
    {
      objc_msgSend(v4, "delegate");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = a1[3];
      a1[3] = (void *)v6;

      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = a1[5];
      a1[5] = v8;

      +[FBSWorkspaceScenesClient serviceQuality]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E38E9DF8, "serial");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "serviceClass:relativePriority:", objc_msgSend(v10, "serviceClass"), objc_msgSend(v10, "relativePriority"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = BSDispatchQueueCreate();
      v14 = a1[4];
      a1[4] = (void *)v13;

      objc_msgSend(v4, "callOutQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = v15;
        v18 = a1[1];
        a1[1] = v17;
      }
      else
      {
        v18 = (void *)BSDispatchQueueCreate();
        +[FBSSerialQueue _queueWithSerialDispatchQueue:](FBSSerialQueue, "_queueWithSerialDispatchQueue:", v18);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = a1[1];
        a1[1] = (void *)v19;

      }
      v21 = -[FBSWorkspaceServiceDispatchingQueue _initWithTargetQueue:callOutQueue:]((id *)[FBSWorkspaceServiceDispatchingQueue alloc], a1[4], a1[1]);
      v22 = a1[2];
      a1[2] = v21;

      +[FBSWorkspaceServiceSpecification identifier](FBSWorkspaceServiceSpecification, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E38E9E70, "monitorForService:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = a1[6];
      a1[6] = (void *)v24;

      objc_msgSend(a1[6], "setDelegate:", a1);
      objc_msgSend(off_1E38E9E20, "environmentAliases");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E38E9E68, "defaultShellMachName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "resolveMachService:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      +[FBSWorkspaceServiceSpecification identifier](FBSWorkspaceServiceSpecification, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E38E9E68, "endpointForMachName:service:instance:", v28, v29, 0);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = a1[7];
      a1[7] = (void *)v30;

      if (!a1[7])
      {
        FBLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[FBSWorkspace _initWithOptions:].cold.5((uint64_t)v28, v32, v33, v34, v35, v36, v37, v38);

      }
      objc_msgSend(off_1E38E9E88, "bootstrapConfiguration");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[FBSWorkspaceServiceSpecification identifier](FBSWorkspaceServiceSpecification, "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "domainsContainingServiceIdentifier:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v41, "count"))
        goto LABEL_21;
      if (objc_msgSend(v41, "count") == 1)
      {
        objc_msgSend(v41, "anyObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "loadRBSLaunchIdentifiers");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "containsObject:", CFSTR("com.apple.frontboard.workspace-service"));

        if (v44)
        {
          v45 = NSClassFromString(CFSTR("FBWorkspaceDomain"));
          if (v45)
          {
            -[objc_class startListener](v45, "startListener");
          }
          else
          {
            FBLogCommon();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              -[FBSWorkspace _initWithOptions:].cold.3(v46);

          }
        }

LABEL_21:
        goto LABEL_22;
      }
      v50 = (void *)MEMORY[0x1E0CB3940];
      +[FBSWorkspaceServiceSpecification identifier](FBSWorkspaceServiceSpecification, "identifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "stringWithFormat:", CFSTR("must have one and only one domain specify %@ : domains=%@"), v51, v41);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSWorkspace _initWithOptions:].cold.4();
      objc_msgSend(objc_retainAutorelease(v52), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
LABEL_32:
      JUMPOUT(0x19A6EE7E0);
    }
  }
LABEL_22:

  return a1;
}

- (id)sceneWithIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__FBSWorkspace_sceneWithIdentifier___block_invoke;
  v9[3] = &unk_1E38EB628;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (FBSWorkspaceDelegate)delegate
{
  return self->_delegate;
}

- (void)_queue_registerSource:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *queue_identifierToScenesSource;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssert();
  FBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_19A6D4000, v5, OS_LOG_TYPE_DEFAULT, "FBSWorkspace registering source: %@", (uint8_t *)&v9, 0xCu);

  }
  queue_identifierToScenesSource = self->_queue_identifierToScenesSource;
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](queue_identifierToScenesSource, "setObject:forKey:", v4, v8);

}

- (FBSWorkspace)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSWorkspace *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSWorkspace *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is unavailable on FBSWorkspace"));
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
    v16 = CFSTR("FBSWorkspace.m");
    v17 = 1024;
    v18 = 134;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSWorkspace *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBSWorkspace)initWithSerialQueue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  FBSWorkspace *result;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  FBSWorkspace *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-initWithQueue: is unavailable on FBSWorkspace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = CFSTR("FBSWorkspace.m");
    v19 = 1024;
    v20 = 144;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (FBSWorkspace *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  FBSWorkspace *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dealloc is not allowed on FBSWorkspace"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138544642;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    v14 = 2114;
    v15 = CFSTR("FBSWorkspace.m");
    v16 = 1024;
    v17 = 195;
    v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

+ (id)_sharedWorkspaceIfExists
{
  return (id)__sharedInstance;
}

- (void)_consumeSharedLock_activateWithAlreadyHeldLock:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2)
      os_unfair_lock_assert_owner(&__sharedInstanceLock);
    else
      os_unfair_lock_lock(&__sharedInstanceLock);
    v3 = (id)__sharedInstanceInitializationBlocks;
    v4 = (void *)__sharedInstanceInitializationBlocks;
    __sharedInstanceInitializationBlocks = 0;

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 48), "activate");
      if (*(_QWORD *)(a1 + 56))
        objc_msgSend((id)a1, "monitor:didReceiveEndpoint:", *(_QWORD *)(a1 + 48));
      os_unfair_lock_unlock(&__sharedInstanceLock);
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
    else
    {
      os_unfair_lock_unlock(&__sharedInstanceLock);
    }

  }
}

+ (void)_registerBlockForWorkspaceCreation:(id)a3
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void (**v9)(id, uint64_t);

  v9 = (void (**)(id, uint64_t))a3;
  os_unfair_lock_lock(&__sharedInstanceLock);
  v3 = (void *)__sharedInstanceInitializationBlocks;
  if (__sharedInstance)
    v4 = __sharedInstanceInitializationBlocks == 0;
  else
    v4 = 0;
  if (v4)
  {
    os_unfair_lock_unlock(&__sharedInstanceLock);
    v9[2](v9, __sharedInstance);
  }
  else
  {
    if (__sharedInstanceInitializationBlocks)
    {
      v5 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v3, "addObject:", v5);
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C99DE8];
      v5 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v6, "arrayWithObject:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)__sharedInstanceInitializationBlocks;
      __sharedInstanceInitializationBlocks = v7;

    }
    os_unfair_lock_unlock(&__sharedInstanceLock);
  }

}

- (id)defaultService
{
  void *v3;
  void *v4;

  -[FBSWorkspace defaultShellEndpoint](self, "defaultShellEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSWorkspace serviceForEndpoint:withIdentifier:](self, "serviceForEndpoint:withIdentifier:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)defaultServiceForEndpoint:(id)a3
{
  return -[FBSWorkspace serviceForEndpoint:withIdentifier:](self, "serviceForEndpoint:withIdentifier:", a3, 0);
}

- (id)serviceForEndpoint:(id)a3 withIdentifier:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;
  id result;
  void *v12;

  v5 = a3;
  v6 = a4;
  +[FBSWorkspace _sharedWorkspaceIfExists](FBSWorkspace, "_sharedWorkspaceIfExists");
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    -[FBSWorkspace _scenesClientForEndpoint:](v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = -[FBSWorkspaceService _initWithTarget:identifier:]([FBSWorkspaceService alloc], "_initWithTarget:identifier:", v9, v6);
    else
      v10 = 0;

    return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBSWorkspaceService cannot be used until the core FBSWorkspace is initialized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspace serviceForEndpoint:withIdentifier:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (_QWORD)_scenesClientForEndpoint:(_QWORD *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__4;
    v15 = __Block_byref_object_dispose__4;
    v16 = 0;
    if (v3)
    {
      v5 = a1[4];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__FBSWorkspace__scenesClientForEndpoint___block_invoke;
      block[3] = &unk_1E38EBE20;
      v10 = &v11;
      block[4] = a1;
      v9 = v3;
      dispatch_sync(v5, block);

      v6 = (void *)v12[5];
    }
    else
    {
      v6 = 0;
    }
    a1 = v6;
    _Block_object_dispose(&v11, 8);

  }
  return a1;
}

- (void)requestSceneFromEndpoint:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  FBSSerialQueue *callOutQueue;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FBSWorkspace defaultServiceForEndpoint:](self, "defaultServiceForEndpoint:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "requestSceneWithOptions:completion:", v9, v10);
  }
  else
  {
    callOutQueue = self->_callOutQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__FBSWorkspace_requestSceneFromEndpoint_withOptions_completion___block_invoke;
    v14[3] = &unk_1E38EB888;
    v16 = v10;
    v15 = v8;
    -[FBSSerialQueue performAsync:](callOutQueue, "performAsync:", v14);

  }
}

void __64__FBSWorkspace_requestSceneFromEndpoint_withOptions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  id v9;

  v8 = *(_QWORD *)(a1 + 40);
  FBSWorkspaceErrorCreate(0, 3uLL, CFSTR("could not connect to endpoint %@"), a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v9);

}

- (NSArray)scenes
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  NSArray *v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __22__FBSWorkspace_scenes__block_invoke;
  v9[3] = &unk_1E38EAE08;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(queue, v9);
  v6 = v10;
  v7 = (NSArray *)v5;

  return v7;
}

void __22__FBSWorkspace_scenes__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __22__FBSWorkspace_scenes__block_invoke_2;
  v3[3] = &unk_1E38EBD48;
  v4 = v1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __22__FBSWorkspace_scenes__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "scenes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

- (void)enumerateScenesWithBlock:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[FBSWorkspace scenes](self, "scenes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__FBSWorkspace_enumerateScenesWithBlock___block_invoke;
    v6[3] = &unk_1E38EBD70;
    v7 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  }
}

uint64_t __41__FBSWorkspace_enumerateScenesWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestSceneCreationWithInitialClientSettings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BSServiceConnectionEndpoint *defaultShellEndpoint;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setInitialClientSettings:", v7);

  defaultShellEndpoint = self->_defaultShellEndpoint;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__FBSWorkspace_requestSceneCreationWithInitialClientSettings_completion___block_invoke;
  v11[3] = &unk_1E38EBD98;
  v12 = v6;
  v10 = v6;
  -[FBSWorkspace requestSceneFromEndpoint:withOptions:completion:](self, "requestSceneFromEndpoint:withOptions:completion:", defaultShellEndpoint, v8, v11);

}

uint64_t __73__FBSWorkspace_requestSceneCreationWithInitialClientSettings_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestSceneCreationWithIdentifier:(id)a3 initialClientSettings:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BSServiceConnectionEndpoint *defaultShellEndpoint;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setIdentifier:", v10);

  objc_msgSend(v11, "setInitialClientSettings:", v9);
  defaultShellEndpoint = self->_defaultShellEndpoint;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__FBSWorkspace_requestSceneCreationWithIdentifier_initialClientSettings_completion___block_invoke;
  v14[3] = &unk_1E38EBD98;
  v15 = v8;
  v13 = v8;
  -[FBSWorkspace requestSceneFromEndpoint:withOptions:completion:](self, "requestSceneFromEndpoint:withOptions:completion:", defaultShellEndpoint, v11, v14);

}

uint64_t __84__FBSWorkspace_requestSceneCreationWithIdentifier_initialClientSettings_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestDestructionOfScene:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  FBSSerialQueue *callOutQueue;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    callOutQueue = self->_callOutQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__FBSWorkspace_requestDestructionOfScene_withCompletion___block_invoke;
    v8[3] = &unk_1E38EB3B8;
    v9 = v5;
    -[FBSSerialQueue performAsync:](callOutQueue, "performAsync:", v8);

  }
}

uint64_t __57__FBSWorkspace_requestDestructionOfScene_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)serviceQueue
{
  return self->_serviceQueue;
}

- (void)_registerSourceEndpoint:(id)a3
{
  -[FBSWorkspace monitor:didReceiveEndpoint:](self, "monitor:didReceiveEndpoint:", self->_connectionEndpointMonitor, a3);
}

- (void)_registerSourcePeer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  FBSWorkspace *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FBSWorkspace__registerSourcePeer___block_invoke;
  block[3] = &unk_1E38EAE08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __36__FBSWorkspace__registerSourcePeer___block_invoke(uint64_t a1)
{
  FBSWorkspaceScenesClient *v2;
  void *v3;
  void **v4;
  id *v5;
  id *v6;
  id *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = [FBSWorkspaceScenesClient alloc];
  v3 = *(void **)(a1 + 32);
  v4 = *(void ***)(a1 + 40);
  v5 = (id *)(a1 + 32);
  v6 = -[FBSWorkspaceScenesClient initWithPeer:queue:calloutQueue:workspace:]((id *)&v2->super.isa, v3, v4[4], v4[1], v4);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    FBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v8;
      _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "FBSWorkspace connected to peer : %@", (uint8_t *)&v17, 0xCu);
    }

    -[FBSWorkspaceScenesClient queue_activate]((uint64_t)v7);
  }
  else
  {
    FBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __36__FBSWorkspace__registerSourcePeer___block_invoke_cold_1((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);

    objc_msgSend(*v5, "invalidate");
  }

}

- (void)_registerSource:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__FBSWorkspace__registerSource___block_invoke;
  block[3] = &unk_1E38EAE08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __32__FBSWorkspace__registerSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_registerSource:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_unregisterSource:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *queue_identifierToScenesSource;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssert();
  FBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_19A6D4000, v5, OS_LOG_TYPE_DEFAULT, "FBSWorkspace unregistering source: %@", (uint8_t *)&v9, 0xCu);

  }
  queue_identifierToScenesSource = self->_queue_identifierToScenesSource;
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](queue_identifierToScenesSource, "removeObjectForKey:", v8);

}

- (void)_activate
{
  -[FBSWorkspace _consumeSharedLock_activateWithAlreadyHeldLock:]((uint64_t)self, 0);
}

- (void)monitor:(id)a3 willLoseEndpoint:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  FBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19A6D4000, v5, OS_LOG_TYPE_DEFAULT, "FBSWorkspace lost endpoint : %@", (uint8_t *)&v6, 0xCu);
  }

}

- (NSString)debugDescription
{
  return (NSString *)-[FBSWorkspace descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSWorkspace descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD block[5];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__FBSWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke;
  block[3] = &unk_1E38EAE08;
  block[4] = self;
  v7 = v5;
  v35 = v7;
  dispatch_sync(queue, block);
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    v27 = v4;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = objc_opt_class();
          v16 = v14;
          if (v15)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v17 = v16;
            else
              v17 = 0;
          }
          else
          {
            v17 = 0;
          }
          v19 = v17;

          objc_msgSend(v19, "instance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v19, "targetDescription");
            v22 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "stringWithFormat:", CFSTR("%@:%@"), v22, v20);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (id)v22;
          }
          else
          {
            objc_msgSend(v19, "targetDescription");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }

          v4 = v27;
        }
        else
        {
          objc_msgSend(v14, "description");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v7, "objectForKey:", v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "allObjects");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sortedArrayUsingComparator:", &__block_literal_global_158);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v25, v18, v4, 0);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v11);
  }

  return v29;
}

void __54__FBSWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__FBSWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v3[3] = &unk_1E38EBD48;
  v4 = v1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __54__FBSWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(a3, "scenes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "setObject:forKey:", v6, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, v8);

  }
}

uint64_t __54__FBSWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  objc_class *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = a2;
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v10 = objc_msgSend(v5, "compare:", v4);
  }
  else
  {
    v7 = (objc_class *)objc_opt_class();

    NSStringFromClass(v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "compare:", v9);

  }
  return v10;
}

uint64_t __54__FBSWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSWorkspace succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
}

void __41__FBSWorkspace__scenesClientForEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[FBSWorkspace _queue_scenesClientForEndpoint:creatingIfNecessary:](*(void ***)(a1 + 32), *(void **)(a1 + 40), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_callOutQueue
{
  return self->_callOutQueue;
}

- (BSServiceConnectionEndpoint)defaultShellEndpoint
{
  return self->_defaultShellEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultShellEndpoint, 0);
  objc_storeStrong((id *)&self->_connectionEndpointMonitor, 0);
  objc_storeStrong((id *)&self->_queue_identifierToScenesSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
}

- (void)_initWithOptions:.cold.1()
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

- (void)_initWithOptions:.cold.2()
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

- (void)_initWithOptions:(os_log_t)log .cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
}

- (void)_initWithOptions:.cold.4()
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

- (void)_initWithOptions:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_1(&dword_19A6D4000, a2, a3, "Failed to resolve default shell endpoint for %{public}@. This workspace way have limited functionality.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_21();
}

- (void)serviceForEndpoint:withIdentifier:.cold.1()
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

void __36__FBSWorkspace__registerSourcePeer___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_1(&dword_19A6D4000, a2, a3, "FBSWorkspace cannot connect peer because it is corrupted (likely crashed before the connect was processed) : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_21();
}

- (void)_calloutQueue_executeCalloutFromSource:withBlock:.cold.1()
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

- (void)_queue_scenesClientForEndpoint:(uint64_t)a3 creatingIfNecessary:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_1(&dword_19A6D4000, a2, a3, "Unable to connect to endpoint : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_21();
}

- (void)_queue_scenesClientForEndpoint:creatingIfNecessary:.cold.2()
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

@end
