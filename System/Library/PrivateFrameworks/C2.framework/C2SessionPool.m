@implementation C2SessionPool

- (BOOL)_cleanUp_job
{
  id v3;
  C2SessionPool *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  C2SessionPool *v15;
  NSObject *v16;
  C2SessionPool *v17;
  NSMutableDictionary *sessionGroupForSessionConfigurationName;
  uint64_t v19;
  BOOL v20;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionPool.m"), 270, CFSTR("cleanup allocation failure, crash."));

  }
  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_cleanUp_running)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("C2SessionPool.m"), 272, CFSTR("sanity check."));

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSMutableDictionary allValues](v4->_sessionGroupForSessionConfigurationName, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "sessions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        v15 = v4;
        objc_sync_enter(v15);
        if (-[C2SessionPool _unsafe_isCreating:](v15, "_unsafe_isCreating:", v14))
        {
          if (C2_DEFAULT_LOG_BLOCK_7 != -1)
            dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_74);
          v16 = C2_DEFAULT_LOG_INTERNAL_7;
          if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v35 = v14;
            _os_log_impl(&dword_1D4DC3000, v16, OS_LOG_TYPE_DEFAULT, "session (%{public}@) in use, not eligable for cleanup.", buf, 0xCu);
          }
        }
        else if (objc_msgSend(v14, "shouldInvalidateAndCancel"))
        {
          -[C2SessionPool _unsafe_removeSession:](v15, "_unsafe_removeSession:", v14);
          objc_sync_exit(v15);

          objc_msgSend(v14, "invalidateAndCancel");
          goto LABEL_25;
        }
        objc_sync_exit(v15);

LABEL_25:
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v11);
  }

  v17 = v4;
  objc_sync_enter(v17);
  sessionGroupForSessionConfigurationName = v4->_sessionGroupForSessionConfigurationName;
  if (!sessionGroupForSessionConfigurationName)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("C2SessionPool.m"), 296, CFSTR("_sessionGroupForSessionConfigurationName must be initialized."));

    sessionGroupForSessionConfigurationName = v4->_sessionGroupForSessionConfigurationName;
  }
  v19 = -[NSMutableDictionary count](sessionGroupForSessionConfigurationName, "count");
  if (!v19)
    v4->_cleanUp_running = 0;
  v20 = v19 != 0;
  objc_sync_exit(v17);

  return v20;
}

- (BOOL)_unsafe_isCreating:(id)a3
{
  id v5;
  BOOL v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionPool.m"), 230, CFSTR("_unsafe_isCreating object cannot be nil"));

  }
  v6 = NSMapGet(self->_useCountByObject, v5) != 0;

  return v6;
}

- (void)_unsafe_removeSession:(id)a3
{
  id v5;
  void *v6;
  NSMutableDictionary *sessionGroupForSessionConfigurationName;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionPool.m"), 246, CFSTR("session should not be nil"));

    v5 = 0;
  }
  objc_msgSend(v5, "sessionConfigurationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionPool.m"), 248, CFSTR("sessionIdentifier should not be nil"));

  }
  sessionGroupForSessionConfigurationName = self->_sessionGroupForSessionConfigurationName;
  if (!sessionGroupForSessionConfigurationName)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionPool.m"), 249, CFSTR("_sessionGroupForSessionConfigurationName must be initialized."));

    sessionGroupForSessionConfigurationName = self->_sessionGroupForSessionConfigurationName;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](sessionGroupForSessionConfigurationName, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "removeSession:", v14) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionPool.m"), 252, CFSTR("Could not identify session (%@) in sessionGroup (%@)"), v14, v8);

  }
  if (objc_msgSend(v8, "removeSession:", v14))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionPool.m"), 254, CFSTR("Session (%@) still in sessionGroup (%@)"), v14, v8);

  }
  -[C2SessionPool _unsafe_removeSessionGroupIfEmpty:](self, "_unsafe_removeSessionGroupIfEmpty:", v8);

}

- (void)_unsafe_removeSessionGroupIfEmpty:(id)a3
{
  id v5;
  NSObject *v6;
  NSMutableDictionary *sessionGroupForSessionConfigurationName;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[C2SessionPool _unsafe_isCreating:](self, "_unsafe_isCreating:", v5))
  {
    if (C2_DEFAULT_LOG_BLOCK_7 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_58);
    v6 = C2_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v5;
      _os_log_impl(&dword_1D4DC3000, v6, OS_LOG_TYPE_DEFAULT, "session group (%{public}@) in use, not eligable for cleanup.", buf, 0xCu);
    }
  }
  else if (objc_msgSend(v5, "isEmpty"))
  {
    sessionGroupForSessionConfigurationName = self->_sessionGroupForSessionConfigurationName;
    objc_msgSend(v5, "configurationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](sessionGroupForSessionConfigurationName, "setObject:forKeyedSubscript:", 0, v8);

    v9 = self->_sessionGroupForSessionConfigurationName;
    objc_msgSend(v5, "configurationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "configurationName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionPool.m"), 238, CFSTR("sessionIdentifer(%@) should no longer be present"), v13);

    }
  }

}

- (id)createDataTaskWithRequestIdentifer:(id)a3 request:(id)a4 options:(id)a5 delegate:(id)a6 sessionHandle:(id *)a7
{
  C2SessionPool *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  C2SessionPool *v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(void);
  void *v32;
  uint64_t v33;
  NSObject *cleanUp_queue;
  const __CFString *v35;
  void *v36;
  char v37;
  NSObject *v38;
  NSObject *v39;
  C2SessionPool *v40;
  id v41;
  NSObject *v42;
  const __CFString *v43;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  NSObject *queue;
  void *v50;
  id v51;
  void *v52;
  C2SessionPool *obj;
  void *v54;
  C2SessionGroup *v55;
  _QWORD v56[5];
  C2SessionGroup *v57;
  __CFString *v58;
  id v59;
  id v60;
  uint64_t *v61;
  __int128 *v62;
  SEL v63;
  _QWORD block[5];
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint8_t buf[4];
  C2SessionPool *v72;
  __int16 v73;
  const __CFString *v74;
  __int16 v75;
  void *v76;
  __int128 v77;
  uint64_t v78;
  BOOL v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v13 = (C2SessionPool *)a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = v16;
  v18 = 0;
  if (v13 && v14 && v15 && v16)
  {
    objc_msgSend(v14, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "host");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v15, "setOriginalHost:", v20);
      v18 = (id)objc_msgSend(v15, "copyAndDecorateRequest:", v14);

      if (v18)
      {
        if (!objc_msgSend(v15, "allowRouting"))
        {
          v51 = v18;
          v18 = v20;
          v21 = 0;
          goto LABEL_14;
        }
        v14 = -[C2RoutingTable copyAndDecorateRequest:](self->_routingTable, "copyAndDecorateRequest:", v18);

        if (v14)
        {
          objc_msgSend(v14, "URL");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "host");
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
LABEL_59:

            goto LABEL_60;
          }
          v51 = v14;
          v21 = v54;
LABEL_14:
          v54 = v21;
          if (v21)
            v22 = v21;
          else
            v22 = v19;
          objc_msgSend(v15, "setInvokedURL:", v22);
          v50 = v18;
          objc_msgSend(v15, "sessionConfigurationNameWithRouteHost:", v18);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v52;
          if (!v52)
          {
            v18 = 0;
LABEL_58:

            v14 = v51;
            goto LABEL_59;
          }
          v65 = 0;
          v66 = &v65;
          v67 = 0x3032000000;
          v68 = __Block_byref_object_copy_;
          v69 = __Block_byref_object_dispose_;
          v70 = 0;
          v24 = self;
          objc_sync_enter(v24);
          obj = v24;
          -[NSMutableDictionary objectForKeyedSubscript:](v24->_sessionGroupForSessionConfigurationName, "objectForKeyedSubscript:", v52);
          v55 = (C2SessionGroup *)objc_claimAutoreleasedReturnValue();
          if (!v55)
          {
            v55 = -[C2SessionGroup initWithConfigurationName:]([C2SessionGroup alloc], "initWithConfigurationName:", v52);
            if (!v55)
            {
              if (C2_DEFAULT_LOG_BLOCK_7 != -1)
                dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_21_1);
              v45 = C2_DEFAULT_LOG_INTERNAL_7;
              if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v77) = 138543362;
                *(_QWORD *)((char *)&v77 + 4) = obj;
                _os_log_impl(&dword_1D4DC3000, v45, OS_LOG_TYPE_ERROR, "%{public}@ can't create a new session group", (uint8_t *)&v77, 0xCu);
              }
              objc_sync_exit(obj);

              v55 = 0;
              v18 = 0;
              goto LABEL_57;
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](v24->_sessionGroupForSessionConfigurationName, "setObject:forKeyedSubscript:", v55, v52);
          }
          -[C2SessionGroup configurationName](v55, "configurationName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqual:", v52);

          if ((v26 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[C2SessionGroup configurationName](v55, "configurationName");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, obj, CFSTR("C2SessionPool.m"), 117, CFSTR("Expected session group with configurationName (%@) but found (%@)"), v52, v48);

          }
          -[C2SessionGroup sessionForOptions:](v55, "sessionForOptions:", v15);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v66[5];
          v66[5] = v27;

          if (v66[5])
          {
            -[C2SessionPool _unsafe_willCreate:](obj, "_unsafe_willCreate:");
            if (-[C2SessionPool _unsafe_isCreating:](obj, "_unsafe_isCreating:", v66[5]))
              goto LABEL_29;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, obj, CFSTR("C2SessionPool.m"), 121, CFSTR("Expected session to be outstanding."));
          }
          else
          {
            -[C2SessionPool _unsafe_willCreate:](obj, "_unsafe_willCreate:", v55);
            if (-[C2SessionPool _unsafe_isCreating:](obj, "_unsafe_isCreating:", v55))
              goto LABEL_29;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, obj, CFSTR("C2SessionPool.m"), 124, CFSTR("Expected session group to be outstanding."));
          }

LABEL_29:
          objc_sync_exit(obj);

          objc_msgSend(v15, "testBehavior_sessionGroupCreated");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend(v15, "testBehavior_sessionGroupCreated");
            v31 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v31[2]();

          }
          *(_QWORD *)&v77 = 0;
          *((_QWORD *)&v77 + 1) = &v77;
          v78 = 0x2020000000;
          v32 = (void *)v66[5];
          v79 = v32 != 0;
          if (!v32)
          {
            v33 = MEMORY[0x1E0C809B0];
            cleanUp_queue = obj->_cleanUp_queue;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_31;
            block[3] = &unk_1E98986D0;
            block[4] = obj;
            dispatch_async(cleanUp_queue, block);
            queue = obj->_sessionCreation_queue;
            v56[0] = v33;
            v56[1] = 3221225472;
            v56[2] = __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_2;
            v56[3] = &unk_1E9899220;
            v56[4] = obj;
            v57 = v55;
            v35 = v52;
            v63 = a2;
            v58 = (__CFString *)v35;
            v61 = &v65;
            v59 = v15;
            v62 = &v77;
            v60 = v50;
            dispatch_sync(queue, v56);

            v32 = (void *)v66[5];
            if (!v32)
            {
              if (C2_DEFAULT_LOG_BLOCK_7 != -1)
                dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_37);
              v46 = C2_DEFAULT_LOG_INTERNAL_7;
              if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v72 = obj;
                v73 = 2114;
                v74 = v35;
                _os_log_impl(&dword_1D4DC3000, v46, OS_LOG_TYPE_ERROR, "%{public}@ can't create a new session with name: %{public}@", buf, 0x16u);
              }
              v18 = 0;
              goto LABEL_56;
            }
          }
          objc_msgSend(v32, "createTaskWithOptions:delegate:", v15, v17);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            objc_msgSend((id)v66[5], "addTask:withDescription:request:", v36, v13, v51);
            v18 = (id)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v37 = 0;
LABEL_45:
              v40 = obj;
              objc_sync_enter(v40);
              -[C2SessionPool _unsafe_didCreate:](v40, "_unsafe_didCreate:", v66[5]);
              objc_sync_exit(v40);

              if ((v37 & 1) == 0)
              {
                v41 = (id)objc_msgSend(v15, "decorateTask:", v18);
                -[C2SessionPool ensureCleanUpRunning](v40, "ensureCleanUpRunning");
                if (C2_DEFAULT_LOG_BLOCK_7 != -1)
                  dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_43_0);
                v42 = C2_DEFAULT_LOG_INTERNAL_7;
                if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEFAULT))
                {
                  if (*(_BYTE *)(*((_QWORD *)&v77 + 1) + 24))
                    v43 = CFSTR("T");
                  else
                    v43 = CFSTR("F");
                  *(_DWORD *)buf = 138543874;
                  v72 = v13;
                  v73 = 2114;
                  v74 = v43;
                  v75 = 2114;
                  v76 = v52;
                  _os_log_impl(&dword_1D4DC3000, v42, OS_LOG_TYPE_DEFAULT, "created task (%{public}@). nsurlsessionCached (%{public}@). configurationName (%{public}@).", buf, 0x20u);
                }
                if (a7)
                {
                  objc_msgSend((id)v66[5], "session");
                  *a7 = (id)objc_claimAutoreleasedReturnValue();
                }
              }

LABEL_56:
              _Block_object_dispose(&v77, 8);
LABEL_57:
              _Block_object_dispose(&v65, 8);

              v23 = v52;
              goto LABEL_58;
            }
          }
          else
          {
            if (C2_DEFAULT_LOG_BLOCK_7 != -1)
              dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_39_0);
            v38 = C2_DEFAULT_LOG_INTERNAL_7;
            if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v72 = obj;
              _os_log_impl(&dword_1D4DC3000, v38, OS_LOG_TYPE_ERROR, "%{public}@ failed to create task", buf, 0xCu);
            }
          }
          if (C2_DEFAULT_LOG_BLOCK_7 != -1)
            dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_41_0);
          v39 = C2_DEFAULT_LOG_INTERNAL_7;
          if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v72 = obj;
            _os_log_impl(&dword_1D4DC3000, v39, OS_LOG_TYPE_ERROR, "%{public}@ failed to add task", buf, 0xCu);
          }
          objc_msgSend(v36, "invalidate");

          v18 = 0;
          v36 = 0;
          v37 = 1;
          goto LABEL_45;
        }
        v18 = 0;

      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v18 = 0;
    }
LABEL_60:

  }
  return v18;
}

- (void)ensureCleanUpRunning
{
  C2SessionPool *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_cleanUp_running)
  {
    objc_sync_exit(obj);

  }
  else
  {
    obj->_cleanUp_running = 1;
    objc_sync_exit(obj);

    if (!obj->_testBehavior_disableAutomaticCleanup)
      -[C2SessionPool _cleanUp_schedule](obj, "_cleanUp_schedule");
  }
}

- (void)_unsafe_willCreate:(id)a3
{
  id v5;
  char *v6;
  void *v7;
  void *key;

  v5 = a3;
  key = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionPool.m"), 211, CFSTR("_unsafe_willCreate object cannot be nil"));

    v5 = 0;
  }
  v6 = (char *)NSMapGet(self->_useCountByObject, v5);
  NSMapInsert(self->_useCountByObject, key, v6 + 1);

}

- (void)_unsafe_didCreate:(id)a3
{
  id v5;
  char *v6;
  NSMapTable *useCountByObject;
  void *v8;
  void *v9;
  void *key;

  v5 = a3;
  key = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionPool.m"), 218, CFSTR("_unsafe_didCreate object cannot be nil"));

    v5 = 0;
  }
  v6 = (char *)NSMapGet(self->_useCountByObject, v5);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionPool.m"), 220, CFSTR("_unsafe_didCreate invariant broken"));

  }
  useCountByObject = self->_useCountByObject;
  if (v6 == (char *)1)
    NSMapRemove(useCountByObject, key);
  else
    NSMapInsert(useCountByObject, key, v6 - 1);

}

uint64_t __34__C2SessionPool__cleanUp_schedule__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cleanUp_job");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_cleanUp_schedule");
  return result;
}

- (OS_dispatch_queue)underlyingDelegateQueue
{
  return self->_underlyingDelegateQueue;
}

- (C2SessionTLSCache)sessionTLSCache
{
  return self->_sessionTLSCache;
}

- (void)_cleanUp_schedule
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *cleanUp_queue;
  _QWORD block[5];
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_1D4DC3000, "c2-session-pool-cleanup", MEMORY[0x1E0C80FE0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = dispatch_time(0, 60000000000);
  cleanUp_queue = self->_cleanUp_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__C2SessionPool__cleanUp_schedule__block_invoke;
  block[3] = &unk_1E98986D0;
  block[4] = self;
  dispatch_after(v4, cleanUp_queue, block);
  os_activity_scope_leave(&state);

}

- (C2SessionPool)init
{
  C2SessionPool *v2;
  C2RoutingTable *v3;
  C2RoutingTable *routingTable;
  C2SessionTLSCache *v5;
  C2SessionTLSCache *sessionTLSCache;
  NSMutableDictionary *v7;
  NSMutableDictionary *sessionGroupForSessionConfigurationName;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *cleanUp_queue;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *sessionCreation_queue;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *underlyingDelegateQueue;
  uint64_t v18;
  NSMapTable *useCountByObject;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint8_t v24[16];
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)C2SessionPool;
  v2 = -[C2SessionPool init](&v25, sel_init);
  if (!v2)
    goto LABEL_27;
  v3 = objc_alloc_init(C2RoutingTable);
  routingTable = v2->_routingTable;
  v2->_routingTable = v3;

  if (!v2->_routingTable)
  {
    if (C2_DEFAULT_LOG_BLOCK_7 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_13);
    v20 = C2_DEFAULT_LOG_INTERNAL_7;
    if (!os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)v24 = 0;
    v21 = "failed to create C2RoutingTable for C2SessionPool";
    goto LABEL_26;
  }
  v5 = objc_alloc_init(C2SessionTLSCache);
  sessionTLSCache = v2->_sessionTLSCache;
  v2->_sessionTLSCache = v5;

  if (!v2->_sessionTLSCache)
  {
    if (C2_DEFAULT_LOG_BLOCK_7 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_6);
    v20 = C2_DEFAULT_LOG_INTERNAL_7;
    if (!os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)v24 = 0;
    v21 = "failed to create C2SessionTLSCache for C2SessionPool";
    goto LABEL_26;
  }
  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  sessionGroupForSessionConfigurationName = v2->_sessionGroupForSessionConfigurationName;
  v2->_sessionGroupForSessionConfigurationName = v7;

  if (!v2->_sessionGroupForSessionConfigurationName)
  {
    if (C2_DEFAULT_LOG_BLOCK_7 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_9_1);
    v20 = C2_DEFAULT_LOG_INTERNAL_7;
    if (!os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)v24 = 0;
    v21 = "failed to create NSMutableDictionary for C2SessionPool";
    goto LABEL_26;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_queue_create("c2-session-pool-cleanup", v9);
  cleanUp_queue = v2->_cleanUp_queue;
  v2->_cleanUp_queue = (OS_dispatch_queue *)v10;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create("c2-session-creation", v12);
  sessionCreation_queue = v2->_sessionCreation_queue;
  v2->_sessionCreation_queue = (OS_dispatch_queue *)v13;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = dispatch_queue_create("c2-delegate", v15);
  underlyingDelegateQueue = v2->_underlyingDelegateQueue;
  v2->_underlyingDelegateQueue = (OS_dispatch_queue *)v16;

  if (!v2->_underlyingDelegateQueue || !v2->_sessionCreation_queue || !v2->_cleanUp_queue)
  {
    if (C2_DEFAULT_LOG_BLOCK_7 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_14_1);
    v20 = C2_DEFAULT_LOG_INTERNAL_7;
    if (!os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)v24 = 0;
    v21 = "failed to create dispatch_queue for C2SessionPool";
    goto LABEL_26;
  }
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 1282, 0);
  useCountByObject = v2->_useCountByObject;
  v2->_useCountByObject = (NSMapTable *)v18;

  if (v2->_useCountByObject)
  {
    v2->_testBehavior_disableAutomaticCleanup = 0;
    return v2;
  }
  if (C2_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_17_2);
  v20 = C2_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v24 = 0;
    v21 = "failed to create NSMapTable for C2SessionPool";
LABEL_26:
    _os_log_impl(&dword_1D4DC3000, v20, OS_LOG_TYPE_ERROR, v21, v24, 2u);
  }
LABEL_27:
  if (C2_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_19_2);
  v22 = C2_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_1D4DC3000, v22, OS_LOG_TYPE_ERROR, "failed to create C2SessionPool", v24, 2u);
  }

  return 0;
}

void __21__C2SessionPool_init__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __21__C2SessionPool_init__block_invoke_5()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __21__C2SessionPool_init__block_invoke_8()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __21__C2SessionPool_init__block_invoke_13()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __21__C2SessionPool_init__block_invoke_16()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __21__C2SessionPool_init__block_invoke_18()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_31(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpEmptySessionGroup_job_withThreshold:", 3);
}

void __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  C2Session *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id obj;
  id obja;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 88);
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(v23 + 64), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v22, v23, CFSTR("C2SessionPool.m"), 141, CFSTR("Expected session group (%@) but found (%@)."), v24, v25);

  }
  objc_msgSend(*(id *)(a1 + 40), "sessionForOptions:", *(_QWORD *)(a1 + 56));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_unsafe_didCreate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_unsafe_willCreate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    if ((objc_msgSend(*(id *)(a1 + 32), "_unsafe_isCreating:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), CFSTR("C2SessionPool.m"), 147, CFSTR("Expected session to be outstanding."));

    }
  }
  objc_sync_exit(obj);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v7 = -[C2Session initWithSessionConfigurationName:routeHost:options:sessionDelegate:]([C2Session alloc], "initWithSessionConfigurationName:routeHost:options:sessionDelegate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 56), "useNWLoaderOverride");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10
        || (v11 = (void *)v10,
            objc_msgSend(*(id *)(a1 + 56), "useNWLoaderOverride"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v12, "BOOLValue"),
            v12,
            v11,
            (v13 & 1) == 0))
      {
        objc_msgSend(*(id *)(a1 + 32), "sessionTLSCache");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sessionForOptions:", *(_QWORD *)(a1 + 56));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "session");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_useTLSSessionCacheFromSession:", v15);

        }
      }
      obja = *(id *)(a1 + 32);
      objc_sync_enter(obja);
      v17 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 != v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(a1 + 88);
        v29 = *(_QWORD *)(a1 + 32);
        v30 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(v29 + 64), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v28, v29, CFSTR("C2SessionPool.m"), 160, CFSTR("Expected session group (%@) but found (%@)."), v30, v31);

      }
      objc_msgSend(*(id *)(a1 + 40), "sessionForOptions:", *(_QWORD *)(a1 + 56));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = *(_QWORD *)(a1 + 88);
        v34 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "sessionForOptions:", *(_QWORD *)(a1 + 56));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v33, v34, CFSTR("C2SessionPool.m"), 161, CFSTR("Expected nil session but found (%@)."), v35);

      }
      objc_msgSend(*(id *)(a1 + 40), "setSession:forOptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 32), "_unsafe_didCreate:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_unsafe_willCreate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      if ((objc_msgSend(*(id *)(a1 + 32), "_unsafe_isCreating:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), CFSTR("C2SessionPool.m"), 165, CFSTR("Expected session to be outstanding."));

      }
    }
    else
    {
      obja = *(id *)(a1 + 32);
      objc_sync_enter(obja);
      objc_msgSend(*(id *)(a1 + 32), "_unsafe_didCreate:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_unsafe_removeSessionGroupIfEmpty:", *(_QWORD *)(a1 + 40));
    }
    objc_sync_exit(obja);

  }
}

void __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_38()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_40()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __91__C2SessionPool_createDataTaskWithRequestIdentifer_request_options_delegate_sessionHandle___block_invoke_42()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __51__C2SessionPool__unsafe_removeSessionGroupIfEmpty___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

- (void)removeSession:(id)a3
{
  C2SessionPool *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[C2SessionPool _unsafe_removeSession:](v4, "_unsafe_removeSession:", v5);
  objc_sync_exit(v4);

}

void __29__C2SessionPool__cleanUp_job__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

- (void)_cleanUpEmptySessionGroup_job_withThreshold:(unint64_t)a3
{
  C2SessionPool *v5;
  unint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  unint64_t v22;
  uint64_t v23;
  C2SessionPool *v24;
  C2SessionPool *v25;
  NSObject *v26;
  C2SessionPool *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  C2SessionPool *v33;
  unint64_t v34;
  C2SessionPool *obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  C2SessionPool *v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  uint64_t v50;
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionPool.m"), 311, CFSTR("Sanity check. Threshold should be positive."));

  }
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[NSMutableDictionary count](v5->_sessionGroupForSessionConfigurationName, "count");
  objc_sync_exit(v5);
  v33 = v5;

  if (v6 > a3)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("C2SessionPool.m"), 320, CFSTR("cleanup allocation failure, crash."));

    }
    obj = v5;
    objc_sync_enter(obj);
    v34 = -[NSMutableDictionary count](v5->_sessionGroupForSessionConfigurationName, "count");
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[NSMutableDictionary allValues](v5->_sessionGroupForSessionConfigurationName, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v42 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v12, "sessions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
          if (v14)
          {
            v15 = *(_QWORD *)v38;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v38 != v15)
                  objc_enumerationMutation(v13);
                v17 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
                if (v17 && objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "emptyTimestamp") != -1)
                  objc_msgSend(v7, "addObject:", v17);
              }
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
            }
            while (v14);
          }

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      }
      while (v9);
    }

    objc_sync_exit(obj);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("emptyTimestamp"), 1);
    v51 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingDescriptors:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34 > a3)
    {
      v22 = 0;
      v23 = 0;
      *(_QWORD *)&v21 = 138543362;
      v32 = v21;
      while (1)
      {
        if (v22 >= objc_msgSend(v20, "count", v32))
          goto LABEL_35;
        objc_msgSend(v20, "objectAtIndexedSubscript:", v22);
        v24 = (C2SessionPool *)objc_claimAutoreleasedReturnValue();
        v25 = obj;
        objc_sync_enter(v25);
        if (-[C2SessionPool _unsafe_isCreating:](v25, "_unsafe_isCreating:", v24))
          break;
        if (!-[C2SessionPool shouldRemoveEmptySession](v24, "shouldRemoveEmptySession"))
          goto LABEL_33;
        -[C2SessionPool _unsafe_removeSession:](v25, "_unsafe_removeSession:", v24);
        objc_sync_exit(v25);

        -[C2SessionPool invalidateAndCancel](v24, "invalidateAndCancel");
        ++v23;
LABEL_34:

        ++v22;
        if (v34 - v23 <= a3)
          goto LABEL_35;
      }
      if (C2_DEFAULT_LOG_BLOCK_7 != -1)
        dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_81);
      v26 = C2_DEFAULT_LOG_INTERNAL_7;
      if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v32;
        v46 = v24;
        _os_log_impl(&dword_1D4DC3000, v26, OS_LOG_TYPE_DEFAULT, "session (%{public}@) in use, not eligable for cleanup.", buf, 0xCu);
      }
LABEL_33:
      objc_sync_exit(v25);

      goto LABEL_34;
    }
LABEL_35:
    v27 = obj;
    objc_sync_enter(v27);
    if (-[NSMutableDictionary count](v33->_sessionGroupForSessionConfigurationName, "count") > a3)
    {
      if (C2_DEFAULT_LOG_BLOCK_7 != -1)
        dispatch_once(&C2_DEFAULT_LOG_BLOCK_7, &__block_literal_global_83);
      v28 = (id)C2_DEFAULT_LOG_INTERNAL_7;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v29 = -[NSMutableDictionary count](v33->_sessionGroupForSessionConfigurationName, "count");
        *(_DWORD *)buf = 138543874;
        v46 = v27;
        v47 = 2048;
        v48 = a3;
        v49 = 2048;
        v50 = v29;
        _os_log_impl(&dword_1D4DC3000, v28, OS_LOG_TYPE_DEBUG, "%{public}@ was unable to restrict number of C2SessionGroups to threshold of %llu. Current session group count is %llu.", buf, 0x20u);
      }

    }
    objc_sync_exit(v27);

  }
}

void __61__C2SessionPool__cleanUpEmptySessionGroup_job_withThreshold___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __61__C2SessionPool__cleanUpEmptySessionGroup_job_withThreshold___block_invoke_82()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_7;
  C2_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

- (BOOL)testBehavior_cleanUp
{
  void *v4;
  C2SessionPool *v5;
  void *v7;

  v4 = (void *)MEMORY[0x1D8269840]();
  if (!self->_testBehavior_disableAutomaticCleanup)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionPool.m"), 395, CFSTR("Testing invariant."));

  }
  v5 = self;
  objc_sync_enter(v5);
  v5->_cleanUp_running = 1;
  objc_sync_exit(v5);

  LOBYTE(v5) = -[C2SessionPool _cleanUp_job](v5, "_cleanUp_job");
  objc_autoreleasePoolPop(v4);
  return (char)v5;
}

- (void)testBehavior_cleanUpWithThreshold:(unint64_t)a3
{
  void *v6;
  void *v7;

  v6 = (void *)MEMORY[0x1D8269840]();
  if (!self->_testBehavior_disableAutomaticCleanup)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionPool.m"), 413, CFSTR("Testing invariant."));

  }
  -[C2SessionPool _cleanUpEmptySessionGroup_job_withThreshold:](self, "_cleanUpEmptySessionGroup_job_withThreshold:", a3);
  objc_autoreleasePoolPop(v6);
}

- (void)C2Session:(id)a3 originalHost:(id)a4 updatedRoute:(id)a5
{
  -[C2RoutingTable updateOriginalHostname:destinationHostname:](self->_routingTable, "updateOriginalHostname:destinationHostname:", a4, a5);
}

- (void)setUnderlyingDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingDelegateQueue, a3);
}

- (OS_dispatch_queue)sessionCreation_queue
{
  return self->_sessionCreation_queue;
}

- (void)setSessionCreation_queue:(id)a3
{
  objc_storeStrong((id *)&self->_sessionCreation_queue, a3);
}

- (OS_dispatch_queue)cleanUp_queue
{
  return self->_cleanUp_queue;
}

- (void)setCleanUp_queue:(id)a3
{
  objc_storeStrong((id *)&self->_cleanUp_queue, a3);
}

- (BOOL)cleanUp_running
{
  return self->_cleanUp_running;
}

- (void)setCleanUp_running:(BOOL)a3
{
  self->_cleanUp_running = a3;
}

- (C2RoutingTable)routingTable
{
  return self->_routingTable;
}

- (void)setRoutingTable:(id)a3
{
  objc_storeStrong((id *)&self->_routingTable, a3);
}

- (void)setSessionTLSCache:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTLSCache, a3);
}

- (NSMapTable)useCountByObject
{
  return self->_useCountByObject;
}

- (void)setUseCountByObject:(id)a3
{
  objc_storeStrong((id *)&self->_useCountByObject, a3);
}

- (NSMutableDictionary)sessionGroupForSessionConfigurationName
{
  return self->_sessionGroupForSessionConfigurationName;
}

- (void)setSessionGroupForSessionConfigurationName:(id)a3
{
  objc_storeStrong((id *)&self->_sessionGroupForSessionConfigurationName, a3);
}

- (BOOL)testBehavior_disableAutomaticCleanup
{
  return self->_testBehavior_disableAutomaticCleanup;
}

- (void)setTestBehavior_disableAutomaticCleanup:(BOOL)a3
{
  self->_testBehavior_disableAutomaticCleanup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionGroupForSessionConfigurationName, 0);
  objc_storeStrong((id *)&self->_useCountByObject, 0);
  objc_storeStrong((id *)&self->_sessionTLSCache, 0);
  objc_storeStrong((id *)&self->_routingTable, 0);
  objc_storeStrong((id *)&self->_cleanUp_queue, 0);
  objc_storeStrong((id *)&self->_sessionCreation_queue, 0);
  objc_storeStrong((id *)&self->_underlyingDelegateQueue, 0);
}

@end
