@implementation _FBSDisplayLayoutService

- (id)currentLayout
{
  os_unfair_lock_s *p_lock;
  FBSDisplayLayout *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_layout;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)updateLayout:(id)a3 withTransition:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
  v7 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_layout)
    v9 = 0;
  else
    v9 = v6 == 0;
  if (v9 && v7 == 0)
  {
    v13 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_lock_layout, v6);
    ++self->_lock_layoutGeneration;
    -[NSMapTable objectEnumerator](self->_lock_keyedObservers, "objectEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

  }
  os_unfair_lock_unlock(p_lock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (void)removeObserverForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    os_unfair_lock_lock(&self->_lock);
    -[NSMapTable removeObjectForKey:](self->_lock_keyedObservers, "removeObjectForKey:", v6);
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("key"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_FBSDisplayLayoutService removeObserverForKey:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)addObserver:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  os_unfair_lock_s *p_lock;
  NSMapTable *lock_keyedObservers;
  void *v12;
  unint64_t lock_layoutGeneration;
  NSObject *callOutQueue;
  id v15;
  id v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  unint64_t v21;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("observer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_FBSDisplayLayoutService addObserver:forKey:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6F41A8);
  }
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("key"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_FBSDisplayLayoutService addObserver:forKey:].cold.2();
    goto LABEL_9;
  }
  v9 = (void *)objc_msgSend(v6, "copy");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_keyedObservers = self->_lock_keyedObservers;
  v12 = (void *)MEMORY[0x19AECA324](v9);
  -[NSMapTable setObject:forKey:](lock_keyedObservers, "setObject:forKey:", v12, v8);

  lock_layoutGeneration = self->_lock_layoutGeneration;
  callOutQueue = self->_callOutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___FBSDisplayLayoutService_addObserver_forKey___block_invoke;
  block[3] = &unk_1E38EC768;
  block[4] = self;
  v19 = v8;
  v20 = v9;
  v21 = lock_layoutGeneration;
  v15 = v9;
  v16 = v8;
  dispatch_async(callOutQueue, block);
  os_unfair_lock_unlock(p_lock);

}

- (id)endpoint
{
  return self->_endpoint;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSMapTable *lock_keyedObservers;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_keyedObservers = self->_lock_keyedObservers;
  self->_lock_keyedObservers = 0;

  os_unfair_lock_unlock(p_lock);
  -[BSServiceConnection invalidate](self->_connection, "invalidate");
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_FBSDisplayLayoutService;
  -[_FBSDisplayLayoutService dealloc](&v3, sel_dealloc);
}

- (id)_initWithEndpoint:(id)a3 qos:(char)a4
{
  unsigned int v4;
  id v7;
  _FBSDisplayLayoutService *v8;
  _FBSDisplayLayoutService *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  OS_dispatch_queue *callOutQueue;
  uint64_t v22;
  uint64_t v23;
  BSServiceConnection *connection;
  BSServiceConnection *v25;
  _FBSDisplayLayoutService *v26;
  uint64_t v27;
  NSMapTable *lock_keyedObservers;
  _QWORD v30[4];
  _FBSDisplayLayoutService *v31;
  char v32;
  _QWORD v33[4];
  char v34;
  objc_super v35;

  v4 = a4;
  v7 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_FBSDisplayLayoutService;
  v8 = -[_FBSDisplayLayoutService init](&v35, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endpoint, a3);
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "targetDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "instance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _NSStringFromFBSDisplayLayoutQOS(v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%@-%@-%@"), v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E38E9DF8, "serial");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v4 >= 3)
      v18 = 9;
    else
      v18 = 4 * v4 + 17;
    objc_msgSend(v16, "serviceClass:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = BSDispatchQueueCreate();
    callOutQueue = v9->_callOutQueue;
    v9->_callOutQueue = (OS_dispatch_queue *)v20;

    v22 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __50___FBSDisplayLayoutService__initWithEndpoint_qos___block_invoke;
    v33[3] = &__block_descriptor_33_e25_v16__0___BSXPCEncoding__8l;
    v34 = v4;
    objc_msgSend(off_1E38E9E60, "connectionWithEndpoint:clientContextBuilder:", v7, v33);
    v23 = objc_claimAutoreleasedReturnValue();
    connection = v9->_connection;
    v9->_connection = (BSServiceConnection *)v23;

    v25 = v9->_connection;
    v30[0] = v22;
    v30[1] = 3221225472;
    v30[2] = __50___FBSDisplayLayoutService__initWithEndpoint_qos___block_invoke_2;
    v30[3] = &unk_1E38EC740;
    v32 = v4;
    v26 = v9;
    v31 = v26;
    -[BSServiceConnection configureConnection:](v25, "configureConnection:", v30);
    v26->_lock._os_unfair_lock_opaque = 0;
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
    lock_keyedObservers = v26->_lock_keyedObservers;
    v26->_lock_keyedObservers = (NSMapTable *)v27;

    -[BSServiceConnection activate](v9->_connection, "activate");
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_layout, 0);
  objc_storeStrong((id *)&self->_lock_keyedObservers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)addObserver:forKey:.cold.1()
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

- (void)addObserver:forKey:.cold.2()
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

- (void)removeObserverForKey:.cold.1()
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
