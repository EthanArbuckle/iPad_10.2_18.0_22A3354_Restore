@implementation BSXPCServiceConnectionEventHandler

- (_QWORD)initWithAssertionTarget:(void *)a1
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)BSXPCServiceConnectionEventHandler;
  v3 = objc_msgSendSuper2(&v9, sel_init);
  if (v3)
  {
    v4 = objc_msgSend(a2, "copy");
    v5 = (void *)v3[1];
    v3[1] = v4;

    *((_DWORD *)v3 + 4) = 0;
    +[BSServiceQuality utility](BSServiceQuality, "utility");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v3[21];
    v3[21] = v6;

  }
  return v3;
}

- (void)connection:(uint64_t)a3 handleMessage:
{
  void *v4;
  os_unfair_lock_s *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  _QWORD v12[8];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(void **)(a1 + 160);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("targetDispatchingQueue must be set"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_connection_handleMessage_);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v14 = v9;
        v15 = 2114;
        v16 = v11;
        v17 = 2048;
        v18 = a1;
        v19 = 2114;
        v20 = CFSTR("BSXPCServiceConnectionEventHandler.m");
        v21 = 1024;
        v22 = 310;
        v23 = 2114;
        v24 = v8;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A1004);
    }
    objc_msgSend(v4, "assertBarrierOnQueue");
    if (*(_QWORD *)(a1 + 136))
      v7 = *(os_unfair_lock_s **)(a1 + 136);
    else
      v7 = a2;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__BSXPCServiceConnectionEventHandler_connection_handleMessage___block_invoke;
    v12[3] = &unk_1E390D238;
    v12[4] = a2;
    v12[5] = a3;
    v12[6] = a1;
    v12[7] = sel_connection_handleMessage_;
    BSXPCServiceConnectionExecuteCallOut(a2, v7, (uint64_t)v12);
  }
}

void __63__BSXPCServiceConnectionEventHandler_connection_handleMessage___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  NSString *v29;
  NSString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _QWORD *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[4];
  NSObject *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  id v68;
  uint8_t buf[4];
  id v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  id v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[22];
  v3 = v2;
  v54 = v3;
  if (!objc_msgSend(*(id *)(a1 + 32), "_isClientInvalidated"))
  {
    -[BSXPCServiceConnectionMessage _subMessages](*(void **)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v8;
    v53 = objc_msgSend(v8, "count");
    if (v53)
    {
      objc_msgSend(*(id *)(a1 + 40), "createReply");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D016E8];
      v11 = objc_msgSend(v8, "count");
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __63__BSXPCServiceConnectionEventHandler_connection_handleMessage___block_invoke_24;
      v66[3] = &unk_1E390D430;
      v12 = v9;
      v67 = v12;
      v68 = v54;
      objc_msgSend(v10, "sentinelWithSignalCount:signalHandler:", v11, v66);
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = v54;
    }
    else
    {
      v4 = 0;
    }
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    if (v51)
    {
      v13 = v51;
    }
    else
    {
      v77 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
    if (!v15)
    {
LABEL_66:

      goto LABEL_67;
    }
    v58 = *(_QWORD *)v63;
    v57 = v14;
LABEL_16:
    v59 = v15;
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v63 != v58)
        objc_enumerationMutation(v14);
      v17 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v16);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 80);
      if (!v18)
      {
        v26 = objc_msgSend(v3, "isServer");
        v27 = *(void **)(*(_QWORD *)(a1 + 48) + 176);
        if (v26)
          objc_msgSend(v27, "server");
        else
          objc_msgSend(v27, "client");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[BSXPCServiceConnectionMessage selectorName](v17);
        v29 = (NSString *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          objc_msgSend(v28, "methodForSelector:", NSSelectorFromString(v29));
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 56) && v31)
          {
            v33 = (void *)MEMORY[0x19AECA850]();
            if (v53)
            {
              BSServiceXPCBatchLog();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                if (v3)
                  v46 = (void *)v3[1];
                else
                  v46 = 0;
                v47 = v46;
                *(_DWORD *)buf = 138412546;
                v70 = v47;
                v71 = 2112;
                v72 = (uint64_t)v30;
                _os_log_debug_impl(&dword_19A799000, v34, OS_LOG_TYPE_DEBUG, "%@ invoking batched method %@", buf, 0x16u);

              }
            }
            v55 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56);
            v35 = *(_QWORD **)(a1 + 32);
            v60[0] = MEMORY[0x1E0C809B0];
            v60[1] = 3221225472;
            v60[2] = __63__BSXPCServiceConnectionEventHandler_connection_handleMessage___block_invoke_27;
            v60[3] = &unk_1E390D210;
            v61 = v4;
            +[BSXPCServiceConnectionProxy invokeMethod:onTarget:withMessage:forConnection:completion:]((uint64_t)BSXPCServiceConnectionProxy, v32, v55, v17, v35, (uint64_t)v60);

            v3 = v54;
            objc_autoreleasePoolPop(v33);
          }
          else
          {
            if (v31)
            {
              BSServiceXPCErrorsLog();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                if (v3)
                  v38 = (void *)v3[1];
                else
                  v38 = 0;
                v39 = v38;
                objc_msgSend(v28, "name");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v70 = v39;
                v71 = 2112;
                v72 = (uint64_t)v30;
                v73 = 2112;
                v74 = v40;
                _os_log_error_impl(&dword_19A799000, v37, OS_LOG_TYPE_ERROR, "%{public}@ Dropping message. No interfaceTarget for @selector(%@) in @protocol(%@).", buf, 0x20u);

              }
            }
            else
            {
              objc_msgSend(v28, "methods");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "bs_map:", &__block_literal_global_1);
              v37 = objc_claimAutoreleasedReturnValue();

              BSServiceXPCErrorsLog();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                if (v3)
                  v48 = (void *)v3[1];
                else
                  v48 = 0;
                v56 = v48;
                objc_msgSend(v28, "name");
                v49 = (id)objc_claimAutoreleasedReturnValue();
                -[NSObject componentsJoinedByString:](v37, "componentsJoinedByString:", CFSTR("\n"));
                v50 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v70 = v56;
                v71 = 2112;
                v72 = (uint64_t)v30;
                v73 = 2112;
                v74 = v49;
                v75 = 2112;
                v52 = (void *)v50;
                v76 = v50;
                _os_log_error_impl(&dword_19A799000, v42, OS_LOG_TYPE_ERROR, "%{public}@ Dropping message. No method found for @selector(%@) in @protocol(%@)\n{\n%@\n}.", buf, 0x2Au);

              }
            }

            -[NSObject signal](v4, "signal");
          }

        }
        else
        {
          BSServiceXPCErrorsLog();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            if (v3)
              v43 = (void *)v3[1];
            else
              v43 = 0;
            v44 = v43;
            objc_msgSend(v28, "name");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v70 = v44;
            v71 = 2112;
            v72 = (uint64_t)v45;
            _os_log_error_impl(&dword_19A799000, v36, OS_LOG_TYPE_ERROR, "%{public}@ Dropping message. Missing selectorName on incoming message in protocol(%@).", buf, 0x16u);

          }
          -[NSObject signal](v4, "signal");
        }

        v14 = v57;
        v25 = v59;
        goto LABEL_48;
      }
      v19 = *(_QWORD *)(a1 + 32);
      BSServiceXPCLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        break;
LABEL_25:

      v14 = v57;
      (*(void (**)(uint64_t, uint64_t, void *))(v18 + 16))(v18, v19, v17);
      v25 = v59;
      -[NSObject signal](v4, "signal");
LABEL_48:
      if (v25 == ++v16)
      {
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
        if (!v15)
          goto LABEL_66;
        goto LABEL_16;
      }
    }
    if (v19)
    {
      v21 = *(id *)(v19 + 176);
      v22 = v21;
      if (v21)
      {
        v23 = (void *)*((_QWORD *)v21 + 1);
LABEL_24:
        v24 = v23;
        *(_DWORD *)buf = 138543362;
        v70 = v24;
        _os_log_impl(&dword_19A799000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ [callout] connection:handleMessage:", buf, 0xCu);

        goto LABEL_25;
      }
    }
    else
    {
      v22 = 0;
    }
    v23 = 0;
    goto LABEL_24;
  }
  BSServiceXPCLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (v3)
      v5 = (void *)v3[1];
    else
      v5 = 0;
    v6 = v5;
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543618;
    v70 = v6;
    v71 = 2080;
    v72 = objc_msgSend(v7, "UTF8String");
    _os_log_error_impl(&dword_19A799000, v4, OS_LOG_TYPE_ERROR, "%{public}@ BLOCKING %s BECAUSE THE CLIENT INVALIDATED THE CONNECTION", buf, 0x16u);

  }
LABEL_67:

}

- (void)connectionInitialized:(int)a3 withActivationGeneration:(void *)a4 activeXPCConnection:(void *)a5 xpcConnectionTargetQueue:
{
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!*(_QWORD *)(a1 + 160))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_targetDispatchingQueue cannot be nil"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_connectionInitialized_withActivationGeneration_activeXPCConnection_xpcConnectionTargetQueue_);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138544642;
        v15 = v11;
        v16 = 2114;
        v17 = v13;
        v18 = 2048;
        v19 = a1;
        v20 = 2114;
        v21 = CFSTR("BSXPCServiceConnectionEventHandler.m");
        v22 = 1024;
        v23 = 256;
        v24 = 2114;
        v25 = v10;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v14, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A3FB8);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_storeStrong((id *)(a1 + 24), a2);
    *(_DWORD *)(a1 + 20) = a3;
    objc_storeStrong((id *)(a1 + 32), a4);
    objc_storeStrong((id *)(a1 + 40), a5);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

- (void)setInitiatingContext:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 184), a2);
}

- (void)connection:(uint64_t)a3 handleConnection:
{
  void *v4;
  os_unfair_lock_s *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  _QWORD v12[7];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(void **)(a1 + 160);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("targetDispatchingQueue must be set"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_connection_handleConnection_);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v14 = v9;
        v15 = 2114;
        v16 = v11;
        v17 = 2048;
        v18 = a1;
        v19 = 2114;
        v20 = CFSTR("BSXPCServiceConnectionEventHandler.m");
        v21 = 1024;
        v22 = 278;
        v23 = 2114;
        v24 = v8;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A44BCLL);
    }
    objc_msgSend(v4, "assertBarrierOnQueue");
    if (*(_QWORD *)(a1 + 136))
      v7 = *(os_unfair_lock_s **)(a1 + 136);
    else
      v7 = a2;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__BSXPCServiceConnectionEventHandler_connection_handleConnection___block_invoke;
    v12[3] = &unk_1E390D4A0;
    v12[4] = a1;
    v12[5] = a2;
    v12[6] = a3;
    BSXPCServiceConnectionExecuteCallOut(a2, v7, (uint64_t)v12);
  }
}

uint64_t __58__BSXPCServiceConnectionEventHandler_connectionActivated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
  BSServiceXPCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (v1)
    {
      v4 = *(id *)(v1 + 176);
      v5 = v4;
      if (v4)
      {
        v6 = (void *)*((_QWORD *)v4 + 1);
LABEL_5:
        v7 = v6;
        v9 = 138543362;
        v10 = v7;
        _os_log_impl(&dword_19A799000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ [callout] connectionActivated:", (uint8_t *)&v9, 0xCu);

        goto LABEL_6;
      }
    }
    else
    {
      v5 = 0;
    }
    v6 = 0;
    goto LABEL_5;
  }
LABEL_6:

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v1);
}

uint64_t __61__BSXPCServiceConnectionEventHandler_connection_handleError___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1[4];
  v2 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 88);
  BSServiceXPCLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v1)
    {
      v5 = *(id *)(v1 + 176);
      v6 = v5;
      if (v5)
      {
        v7 = (void *)*((_QWORD *)v5 + 1);
LABEL_5:
        v8 = v7;
        v10 = 138543362;
        v11 = v8;
        _os_log_impl(&dword_19A799000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [callout] connection:handleError:", (uint8_t *)&v10, 0xCu);

        goto LABEL_6;
      }
    }
    else
    {
      v6 = 0;
    }
    v7 = 0;
    goto LABEL_5;
  }
LABEL_6:

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v3, v1, v2);
}

uint64_t __66__BSXPCServiceConnectionEventHandler_connection_handleConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    BSServiceXPCLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v12 = *(void **)(a1 + 40);
      v14 = 138543362;
      v15 = v12;
      _os_log_error_impl(&dword_19A799000, v2, OS_LOG_TYPE_ERROR, "%{public}@ Invalidating incoming connection because there is no event handler", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_5;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_isClientInvalidated"))
  {
    BSServiceXPCLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 40);
      v14 = 138543362;
      v15 = v13;
      _os_log_error_impl(&dword_19A799000, v2, OS_LOG_TYPE_ERROR, "%{public}@ Invalidating incoming connection because the root has already been invalidated", (uint8_t *)&v14, 0xCu);
    }
LABEL_5:

    return objc_msgSend(*(id *)(a1 + 48), "invalidate");
  }
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  BSServiceXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v5)
    {
      v8 = *(id *)(v5 + 176);
      v9 = v8;
      if (v8)
      {
        v10 = (void *)*((_QWORD *)v8 + 1);
LABEL_13:
        v11 = v10;
        v14 = 138543362;
        v15 = v11;
        _os_log_impl(&dword_19A799000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [callout] connection:handleConnection:", (uint8_t *)&v14, 0xCu);

        goto LABEL_14;
      }
    }
    else
    {
      v9 = 0;
    }
    v10 = 0;
    goto LABEL_13;
  }
LABEL_14:

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v5, v4);
}

- (void)setTargetQueue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 152), a2);
}

- (void)setTargetDispatchingQueue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 160), a2);
}

- (void)setContext:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 136), a2);
}

- (void)setInterfaceTarget:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (uint64_t)encodeInitiatingContext:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;

  if (result && a2)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 184);
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0D018A0]);
      v6 = *(void **)(v3 + 184);
      *(_QWORD *)(v3 + 184) = v5;

      v4 = *(_QWORD *)(v3 + 184);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v4);
  }
  return result;
}

- (void)connectionActivated:(_QWORD *)a1
{
  void *v3;
  os_unfair_lock_s *v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  _QWORD *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (void *)a1[20];
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("targetDispatchingQueue must be set"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_connectionActivated_);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v12 = v7;
        v13 = 2114;
        v14 = v9;
        v15 = 2048;
        v16 = a1;
        v17 = 2114;
        v18 = CFSTR("BSXPCServiceConnectionEventHandler.m");
        v19 = 1024;
        v20 = 391;
        v21 = 2114;
        v22 = v6;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A8F48);
    }
    objc_msgSend(v3, "assertBarrierOnQueue");
    if (a1[12] && (-[os_unfair_lock_s _isClientInvalidated](a2, "_isClientInvalidated") & 1) == 0)
    {
      if (a1[17])
        v5 = (os_unfair_lock_s *)a1[17];
      else
        v5 = a2;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __58__BSXPCServiceConnectionEventHandler_connectionActivated___block_invoke;
      v10[3] = &unk_1E390D478;
      v10[4] = a2;
      v10[5] = a1;
      BSXPCServiceConnectionExecuteCallOut(a2, v5, (uint64_t)v10);
    }
  }
}

- (id)remoteTargetWithHandshake:(void *)a3 assertionAttributes:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = objc_msgSend(a3, "count");
  v7 = v6;
  if (a2 && !v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("handshake is only supported if there are launching attributes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_remoteTargetWithHandshake_assertionAttributes_);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v23 = v19;
      v24 = 2114;
      v25 = v21;
      v26 = 2048;
      v27 = a1;
      v28 = 2114;
      v29 = CFSTR("BSXPCServiceConnectionEventHandler.m");
      v30 = 1024;
      v31 = 202;
      v32 = 2114;
      v33 = v18;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A9ACCLL);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (v7 || (v12 = *(id *)(a1 + 48)) == 0)
  {
    v8 = *(_QWORD *)(a1 + 24);
    if (v8)
    {
      v9 = *(id *)(v8 + 176);
      v10 = objc_msgSend(v9, "isServer");
      v11 = *(void **)(a1 + 176);
      if (v10)
        objc_msgSend(v11, "client");
      else
        objc_msgSend(v11, "server");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "methods");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        if (v7)
          v16 = a3;
        else
          v16 = 0;
        +[BSXPCServiceConnectionProxy proxyForConnection:handshake:withProtocol:activationGeneration:activeXPCConnection:xpcConnectionTargetQueue:replyQueue:target:attributes:assertionProvider:]((uint64_t)BSXPCServiceConnectionProxy, *(_QWORD **)(a1 + 24), a2, v13, *(_DWORD *)(a1 + 20), *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 160), *(void **)(a1 + 8), v16, 0);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v7)
          objc_storeStrong((id *)(a1 + 48), v12);
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatingContext, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_serviceQuality, 0);
  objc_storeStrong((id *)&self->_targetDispatchingQueue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong(&self->_batchingHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_activationHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong(&self->_noMoreChildrenHandler, 0);
  objc_storeStrong(&self->_connectionHandler, 0);
  objc_storeStrong(&self->_interfaceTarget, 0);
  objc_storeStrong((id *)&self->_lock_remoteTarget, 0);
  objc_storeStrong((id *)&self->_lock_xpcConnectionTargetQueue, 0);
  objc_storeStrong((id *)&self->_lock_activeXPCConnection, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_assertionTarget, 0);
}

void __61__BSXPCServiceConnectionEventHandler__connectionInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112);
  BSServiceXPCLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    goto LABEL_6;
  if (!v2)
  {
    v6 = 0;
    goto LABEL_10;
  }
  v5 = *(id *)(v2 + 176);
  v6 = v5;
  if (!v5)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_5;
  }
  v7 = (void *)*((_QWORD *)v5 + 1);
LABEL_5:
  v8 = v7;
  v10 = 138543362;
  v11 = v8;
  _os_log_impl(&dword_19A799000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [callout] connectionInvalidated:", (uint8_t *)&v10, 0xCu);

LABEL_6:
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    -[BSXPCServiceConnection _clientInvalidateExplicitly:](v9, 0);
}

- (void)connectionDisconnected:(uint64_t)a1
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v3 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    v4 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    v5 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;

    v6 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    os_unfair_lock_unlock(v2);
  }
}

- (void)connection:(void *)a3 handleError:
{
  void *v4;
  os_unfair_lock_s *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  _QWORD v12[7];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  _QWORD *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (void *)a1[20];
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("targetDispatchingQueue must be set"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_connection_handleError_);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v14 = v9;
        v15 = 2114;
        v16 = v11;
        v17 = 2048;
        v18 = a1;
        v19 = 2114;
        v20 = CFSTR("BSXPCServiceConnectionEventHandler.m");
        v21 = 1024;
        v22 = 376;
        v23 = 2114;
        v24 = v8;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B0D60);
    }
    objc_msgSend(v4, "assertBarrierOnQueue");
    if (a1[11] && (-[os_unfair_lock_s _isClientInvalidated](a2, "_isClientInvalidated") & 1) == 0)
    {
      if (objc_msgSend(a3, "isBSServiceConnectionError") && objc_msgSend(a3, "code") == 1)
        -[BSXPCServiceConnection _makingInterruptCallout](a2);
      if (a1[17])
        v7 = (os_unfair_lock_s *)a1[17];
      else
        v7 = a2;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __61__BSXPCServiceConnectionEventHandler_connection_handleError___block_invoke;
      v12[3] = &unk_1E390D4A0;
      v12[4] = a2;
      v12[5] = a3;
      v12[6] = a1;
      BSXPCServiceConnectionExecuteCallOut(a2, v7, (uint64_t)v12);
    }
  }
}

- (void)_connectionInvalidated:(_QWORD *)a1
{
  void *v3;
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[6];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  _QWORD *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (void *)a1[20];
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("targetDispatchingQueue must be set"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__connectionInvalidated_);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v20 = v15;
        v21 = 2114;
        v22 = v17;
        v23 = 2048;
        v24 = a1;
        v25 = 2114;
        v26 = CFSTR("BSXPCServiceConnectionEventHandler.m");
        v27 = 1024;
        v28 = 433;
        v29 = 2114;
        v30 = v14;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B0FACLL);
    }
    objc_msgSend(v3, "assertBarrierOnQueue");
    if (a1[14] && (-[os_unfair_lock_s _isClientInvalidated](a2, "_isClientInvalidated") & 1) == 0)
    {
      if (a1[17])
        v5 = (os_unfair_lock_s *)a1[17];
      else
        v5 = a2;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __61__BSXPCServiceConnectionEventHandler__connectionInvalidated___block_invoke;
      v18[3] = &unk_1E390D478;
      v18[4] = a2;
      v18[5] = a1;
      BSXPCServiceConnectionExecuteCallOut(a2, v5, (uint64_t)v18);
    }
    v6 = (void *)a1[10];
    a1[10] = 0;

    v7 = (void *)a1[8];
    a1[8] = 0;

    v8 = (void *)a1[9];
    a1[9] = 0;

    v9 = (void *)a1[11];
    a1[11] = 0;

    v10 = (void *)a1[12];
    a1[12] = 0;

    v11 = (void *)a1[13];
    a1[13] = 0;

    v12 = (void *)a1[14];
    a1[14] = 0;

    v13 = (void *)a1[15];
    a1[15] = 0;

  }
}

- (void)connectionHandleNoMoreChildren:(_QWORD *)a1
{
  void *v3;
  os_unfair_lock_s *v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  _QWORD *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (void *)a1[20];
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("targetDispatchingQueue must be set"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_connectionHandleNoMoreChildren_);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v12 = v7;
        v13 = 2114;
        v14 = v9;
        v15 = 2048;
        v16 = a1;
        v17 = 2114;
        v18 = CFSTR("BSXPCServiceConnectionEventHandler.m");
        v19 = 1024;
        v20 = 298;
        v21 = 2114;
        v22 = v6;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B35C4);
    }
    objc_msgSend(v3, "assertBarrierOnQueue");
    if (a1[9] && (-[os_unfair_lock_s _isClientInvalidated](a2, "_isClientInvalidated") & 1) == 0)
    {
      if (a1[17])
        v5 = (os_unfair_lock_s *)a1[17];
      else
        v5 = a2;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __69__BSXPCServiceConnectionEventHandler_connectionHandleNoMoreChildren___block_invoke;
      v10[3] = &unk_1E390D478;
      v10[4] = a2;
      v10[5] = a1;
      BSXPCServiceConnectionExecuteCallOut(a2, v5, (uint64_t)v10);
    }
  }
}

uint64_t __69__BSXPCServiceConnectionEventHandler_connectionHandleNoMoreChildren___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
  BSServiceXPCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (v1)
    {
      v4 = *(id *)(v1 + 176);
      v5 = v4;
      if (v4)
      {
        v6 = (void *)*((_QWORD *)v4 + 1);
LABEL_5:
        v7 = v6;
        v9 = 138543362;
        v10 = v7;
        _os_log_impl(&dword_19A799000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ [callout] connectionHandleNoMoreChildren:", (uint8_t *)&v9, 0xCu);

        goto LABEL_6;
      }
    }
    else
    {
      v5 = 0;
    }
    v6 = 0;
    goto LABEL_5;
  }
LABEL_6:

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v1);
}

- (BSXPCServiceConnectionEventHandler)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSXPCServiceConnectionEventHandler *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSXPCServiceConnectionEventHandler *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BSXPCServiceConnectionEventHandler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
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
    v16 = CFSTR("BSXPCServiceConnectionEventHandler.m");
    v17 = 1024;
    v18 = 109;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSXPCServiceConnectionEventHandler *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __63__BSXPCServiceConnectionEventHandler_connection_handleMessage___block_invoke_24(uint64_t a1, void *a2)
{
  NSObject *v4;
  _QWORD *v5;
  _QWORD *v6;
  int v7;
  _QWORD *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "isComplete"))
  {
    objc_msgSend(*(id *)(a1 + 32), "send");
    if (objc_msgSend(a2, "isFailed"))
    {
      BSServiceXPCBatchLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(_QWORD **)(a1 + 40);
        if (v5)
          v5 = (_QWORD *)v5[1];
        v6 = v5;
        v7 = 138543362;
        v8 = v6;
        _os_log_error_impl(&dword_19A799000, v4, OS_LOG_TYPE_ERROR, "%{public}@ One or more completions for a message batch were not called.", (uint8_t *)&v7, 0xCu);

      }
    }
  }
}

uint64_t __63__BSXPCServiceConnectionEventHandler_connection_handleMessage___block_invoke_27(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

id __63__BSXPCServiceConnectionEventHandler_connection_handleMessage___block_invoke_28(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  NSStringFromSelector((SEL)objc_msgSend(a2, "selector"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a2, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("name:"), "stringByAppendingString:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)connectionInterruptedFromXPCError:(_QWORD *)a1
{
  void *v3;
  os_unfair_lock_s *v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  _QWORD *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (void *)a1[20];
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("targetDispatchingQueue must be set"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_connectionInterruptedFromXPCError_);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v12 = v7;
        v13 = 2114;
        v14 = v9;
        v15 = 2048;
        v16 = a1;
        v17 = 2114;
        v18 = CFSTR("BSXPCServiceConnectionEventHandler.m");
        v19 = 1024;
        v20 = 403;
        v21 = 2114;
        v22 = v6;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7C4EF4);
    }
    objc_msgSend(v3, "assertBarrierOnQueue");
    if (a1[13] && (-[os_unfair_lock_s _isClientInvalidated](a2, "_isClientInvalidated") & 1) == 0)
    {
      -[BSXPCServiceConnection _makingInterruptCallout](a2);
      if (a1[17])
        v5 = (os_unfair_lock_s *)a1[17];
      else
        v5 = a2;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __72__BSXPCServiceConnectionEventHandler_connectionInterruptedFromXPCError___block_invoke;
      v10[3] = &unk_1E390D478;
      v10[4] = a2;
      v10[5] = a1;
      BSXPCServiceConnectionExecuteCallOut(a2, v5, (uint64_t)v10);
    }
  }
}

uint64_t __72__BSXPCServiceConnectionEventHandler_connectionInterruptedFromXPCError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104);
  BSServiceXPCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (v1)
    {
      v4 = *(id *)(v1 + 176);
      v5 = v4;
      if (v4)
      {
        v6 = (void *)*((_QWORD *)v4 + 1);
LABEL_5:
        v7 = v6;
        v9 = 138543362;
        v10 = v7;
        _os_log_impl(&dword_19A799000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ [callout] connectionInterrupted:", (uint8_t *)&v9, 0xCu);

        goto LABEL_6;
      }
    }
    else
    {
      v5 = 0;
    }
    v6 = 0;
    goto LABEL_5;
  }
LABEL_6:

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v1);
}

@end
