@implementation GEOServiceRequester

void __129__GEOServiceRequester__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;

  v5 = (id *)(a1 + 48);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v10 = WeakRetained;
  if (v6)
    v9 = 0;
  else
    v9 = v7;
  objc_msgSend(WeakRetained, "_request:completed:error:completion:", *(_QWORD *)(a1 + 32), v9, v6, *(_QWORD *)(a1 + 40));

}

- (void)_addOperation:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  uint8_t v14[16];
  uint8_t buf[2];
  __int16 v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v16 = 0;
    v11 = MEMORY[0x1E0C81028];
    v12 = "Assertion failed: operation != ((void *)0)";
    v13 = (uint8_t *)&v16;
LABEL_13:
    _os_log_fault_impl(&dword_1885A9000, v11, OS_LOG_TYPE_FAULT, v12, v13, 2u);
    goto LABEL_8;
  }
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v11 = MEMORY[0x1E0C81028];
    v12 = "Assertion failed: request != ((void *)0)";
    v13 = buf;
    goto LABEL_13;
  }
  -[GEOServiceRequester _keyForRequest:](self, "_keyForRequest:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    os_unfair_lock_lock_with_options();
    -[NSMapTable objectForKey:](self->_pendingRequests, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](self->_pendingRequests, "setObject:forKey:", v10, v9);
    }
    objc_msgSend(v10, "addObject:", v6);
    os_unfair_lock_unlock(&self->_pendingRequestsLock);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: requestKey != ((void *)0)", v14, 2u);
  }

LABEL_8:
}

- (void)_startWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 completionHandler:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *global_queue;
  void *v41;
  id obj;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD block[4];
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  uint8_t v65[128];
  uint8_t buf[4];
  id v67;
  __int16 v68;
  __CFString *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v45 = a7;
  v44 = a9;
  v47 = a10;
  v48 = v14;
  v49 = v17;
  v50 = v15;
  v18 = objc_msgSend(v17, "dataRequestKindForRequest:traits:", v14, v15);
  v46 = v16;
  objc_msgSend(v16, "offlineCohortId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  -[GEOServiceRequester _operationClassForTraits:requestKind:forCohort:config:error:](self, "_operationClassForTraits:requestKind:forCohort:config:error:", v15, v18, v19, v17, &v64);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v64;

  v21 = objc_msgSend(v41, "count");
  GEOGetServiceRequesterLog();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21)
  {
    v24 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

    if (v24)
    {
      objc_msgSend(v41, "_geo_map:", &__block_literal_global_193);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      GEOGetServiceRequesterLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        GEODataRequestKindAsString(v18);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v15, "requestMode");
        if (v28 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v28);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = off_1E1C20568[(int)v28];
        }
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v67 = v27;
        v68 = 2112;
        v69 = v29;
        v70 = 2112;
        v71 = v30;
        _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_DEBUG, "Request %@ mode was %@, will use operations: %@", buf, 0x20u);

      }
    }

    objc_initWeak((id *)buf, self);
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v41;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v61;
      v33 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v61 != v32)
            objc_enumerationMutation(obj);
          v35 = objc_alloc(*(Class *)(*((_QWORD *)&v60 + 1) + 8 * i));
          v58[0] = v33;
          v58[1] = 3221225472;
          v58[2] = __129__GEOServiceRequester__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler___block_invoke_66;
          v58[3] = &unk_1E1C20500;
          objc_copyWeak(&v59, (id *)buf);
          v54[0] = v33;
          v54[1] = 3221225472;
          v54[2] = __129__GEOServiceRequester__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler___block_invoke_2;
          v54[3] = &unk_1E1C20528;
          objc_copyWeak(&v57, (id *)buf);
          v36 = v48;
          v55 = v36;
          v56 = v47;
          v37 = (void *)objc_msgSend(v35, "initWithRequest:traits:auditToken:config:throttleToken:options:willSendRequestHandler:validationHandler:completionHandler:", v36, v50, v46, v49, v45, a8, v44, v58, v54);
          -[GEOServiceRequester _addOperation:forRequest:](self, "_addOperation:forRequest:", v37, v36);

          objc_destroyWeak(&v57);
          objc_destroyWeak(&v59);
        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v31);
    }

    -[GEOServiceRequester _currentOperationForRequest:](self, "_currentOperationForRequest:", v48);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      objc_msgSend(v38, "start");
    }
    else
    {
      global_queue = geo_get_global_queue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __129__GEOServiceRequester__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler___block_invoke_3;
      block[3] = &unk_1E1C01F48;
      v53 = v47;
      dispatch_async(global_queue, block);

    }
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v20;
      _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_ERROR, "No operations created: %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, id))v47 + 2))(v47, 0, v20);
  }

}

- (void)_request:(id)a3 completed:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, id);
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  _BOOL4 v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id, id))a6;
  -[GEOServiceRequester _takeCurrentOperationForRequest:](self, "_takeCurrentOperationForRequest:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOServiceRequester _currentOperationForRequest:](self, "_currentOperationForRequest:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    GEOGetServiceRequesterLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v22) = 0;
      v19 = "No more operations to try";
      v20 = v17;
      v21 = 2;
LABEL_10:
      _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_DEBUG, v19, (uint8_t *)&v22, v21);
    }
LABEL_11:

    -[GEOServiceRequester _removeAllOperationsForRequest:](self, "_removeAllOperationsForRequest:", v10);
    v13[2](v13, v11, v12);
    goto LABEL_12;
  }
  v16 = -[GEOServiceRequester _shouldTryNextOperation:forError:fromOperation:](self, "_shouldTryNextOperation:forError:fromOperation:", v15, v12, v14);
  GEOGetServiceRequesterLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (!v16)
  {
    if (v18)
    {
      v22 = 138412290;
      v23 = v12;
      v19 = "NOT trying next operation. Error was: %@";
      v20 = v17;
      v21 = 12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v18)
  {
    v22 = 138412290;
    v23 = v12;
    _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEBUG, "Trying next operation due to error: %@", (uint8_t *)&v22, 0xCu);
  }

  objc_msgSend(v15, "start");
LABEL_12:

}

- (id)_takeCurrentOperationForRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  -[GEOServiceRequester _keyForRequest:](self, "_keyForRequest:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    -[NSMapTable objectForKey:](self->_pendingRequests, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectAtIndex:", 0);
    if (!objc_msgSend(v5, "count"))
      -[NSMapTable removeObjectForKey:](self->_pendingRequests, "removeObjectForKey:", v4);
    os_unfair_lock_unlock(&self->_pendingRequestsLock);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: requestKey != ((void *)0)", v8, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (id)_currentOperationForRequest:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_pendingRequestsLock;
  void *v6;
  void *v7;
  uint8_t v9[16];

  -[GEOServiceRequester _keyForRequest:](self, "_keyForRequest:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    p_pendingRequestsLock = &self->_pendingRequestsLock;
    os_unfair_lock_lock_with_options();
    -[NSMapTable objectForKey:](self->_pendingRequests, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_pendingRequestsLock);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: requestKey != ((void *)0)", v9, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (id)_keyForRequest:(id)a3
{
  return a3;
}

- (void)_removeAllOperationsForRequest:(id)a3
{
  void *v4;
  uint8_t v5[16];

  -[GEOServiceRequester _keyForRequest:](self, "_keyForRequest:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    -[NSMapTable removeObjectForKey:](self->_pendingRequests, "removeObjectForKey:", v4);
    os_unfair_lock_unlock(&self->_pendingRequestsLock);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: requestKey != ((void *)0)", v5, 2u);
  }

}

- (id)_operationClassForTraits:(id)a3 requestKind:(id)a4 forCohort:(id)a5 config:(id)a6 error:(id *)a7
{
  id v12;
  __CFString *v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  char v20;
  BOOL v21;
  unsigned int v22;
  unsigned int v23;
  void *v24;
  unsigned int v25;
  objc_class *v26;
  void *v27;
  objc_class **v28;
  unsigned int v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v46;
  void *v47;
  unsigned int v48;
  objc_class *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  NSObject *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  objc_class *v57;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  objc_class *v69;
  uint8_t buf[4];
  __CFString *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  const __CFString *v75;
  objc_class *v76;
  const __CFString *v77;
  void *v78;
  const __CFString *v79;
  _QWORD v80[2];

  v80[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (__CFString *)a5;
  v14 = a6;
  if (!+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
    goto LABEL_43;
  if (!objc_msgSend(v12, "requestMode"))
  {
    if (objc_msgSend(v14, "supportsOffline"))
    {
      if (+[GEOOfflineStateManager isOfflineAvailable](GEOOfflineStateManager, "isOfflineAvailable"))
      {
        +[GEOOfflineStateManager shared](GEOOfflineStateManager, "shared");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "cohortId:shouldAttemptFailoverForRequest:", v13, a4);

        if (v16)
        {
          GEOGetServiceRequesterLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            GEODataRequestKindAsString(*(_QWORD *)&a4);
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v71 = v18;
            _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_INFO, "Opting request %@ into ONLINE_OFFLINE_FAILOVER to check connectivity", buf, 0xCu);

          }
          objc_msgSend(v12, "setRequestMode:", 1);
        }
      }
    }
  }
  if (-[__CFString length](v13, "length")
    && (_getValue(GeoOfflineConfig_CohortAllowList, (uint64_t)off_1EDF4E878, 1, 0, 0, 0),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "containsObject:", v13),
        v19,
        (v20 & 1) != 0))
  {
    v21 = +[GEOOfflineStateManager isOfflineAvailable](GEOOfflineStateManager, "isOfflineAvailable");
    v22 = objc_msgSend(v12, "requestMode");
    if (v21)
    {
      if (v22 >= 5)
        v23 = 0;
      else
        v23 = v22;
      switch(v23)
      {
        case 0u:
          -[GEOServiceRequester offlineStateManager](self, "offlineStateManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "activeStateForCohortId:", v13);

          if (v25 < 2u)
            goto LABEL_43;
          if (v25 == 2)
          {
            v26 = -[GEOServiceRequester _offlineOperationClassForState:](self, "_offlineOperationClassForState:", v25);
            if (objc_msgSend(v14, "supportsOffline") && v26)
            {
              v76 = v26;
              v27 = (void *)MEMORY[0x1E0C99D20];
              v28 = &v76;
              goto LABEL_62;
            }
            v65 = (void *)MEMORY[0x1E0CB35C8];
            v77 = CFSTR("GEODataRequestKind");
            GEODataRequestKindAsString(*(_QWORD *)&a4);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = v35;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "GEOErrorWithCode:reason:userInfo:", -6, CFSTR("Request type is not supported offline"), v66);
            *a7 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_29;
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v71) = v25;
            goto LABEL_75;
          }
          goto LABEL_43;
        case 1u:
          -[GEOServiceRequester offlineStateManager](self, "offlineStateManager");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "activeStateForCohortId:", v13);

          v49 = -[GEOServiceRequester _offlineOperationClassForState:](self, "_offlineOperationClassForState:", v48);
          if (objc_msgSend(v14, "supportsOffline") && v49)
          {
            -[GEOServiceRequester networkOperationClasses](self, "networkOperationClasses");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "arrayByAddingObject:", v49);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_45;
          }
          GEOGetServiceRequesterLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            goto LABEL_42;
          GEODataRequestKindAsString(*(_QWORD *)&a4);
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v71 = v39;
          v43 = "Request %@ does not support offline and/or no offline operation types are available, return online operations only";
          goto LABEL_41;
        case 2u:
          -[GEOServiceRequester offlineStateManager](self, "offlineStateManager");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "activeStateForCohortId:", v13);

          if (v52 < 2u)
            goto LABEL_43;
          if (v52 == 2)
          {
            GEOGetServiceRequesterLog();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              GEOOfflineStateAsString(v52);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v71 = v13;
              v72 = 2114;
              v73 = v54;
              v74 = 2114;
              v75 = CFSTR("ONLINE_FAST_FAIL");
              _os_log_impl(&dword_1885A9000, v53, OS_LOG_TYPE_ERROR, "Cohort \"%{public}@\" mode is %{public}@ but request explicitly set to %{public}@, failing", buf, 0x20u);

            }
            v40 = (void *)MEMORY[0x1E0CB35C8];
            v42 = -9;
            v41 = 0;
            goto LABEL_58;
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v71) = v52;
LABEL_75:
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
          }
          goto LABEL_43;
        case 3u:
          goto LABEL_43;
        case 4u:
          -[GEOServiceRequester offlineStateManager](self, "offlineStateManager");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "activeStateForCohortId:", v13);

          v57 = -[GEOServiceRequester _offlineOperationClassForState:](self, "_offlineOperationClassForState:", v56);
          if (!objc_msgSend(v14, "supportsOffline") || !v57)
          {
            v60 = (void *)MEMORY[0x1E0CB35C8];
            v67 = CFSTR("GEODataRequestKind");
            GEODataRequestKindAsString(*(_QWORD *)&a4);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v61;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "GEOErrorWithCode:reason:userInfo:", -6, CFSTR("Request type is not supported offline"), v62);
            *a7 = (id)objc_claimAutoreleasedReturnValue();

            v36 = (void *)MEMORY[0x1E0C9AA60];
            goto LABEL_45;
          }
          v69 = v57;
          v27 = (void *)MEMORY[0x1E0C99D20];
          v28 = &v69;
LABEL_62:
          objc_msgSend(v27, "arrayWithObjects:count:", v28, 1);
          v44 = objc_claimAutoreleasedReturnValue();
          break;
        default:
          GEOGetServiceRequesterLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            goto LABEL_42;
          v46 = objc_msgSend(v12, "requestMode");
          if (v46 >= 5)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v46);
            v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v39 = off_1E1C20568[(int)v46];
          }
          *(_DWORD *)buf = 138412290;
          v71 = v39;
          v43 = "Unsupported request mode %@, returning online operations only";
          goto LABEL_41;
      }
      goto LABEL_44;
    }
    if (v22 < 4)
    {
      GEOGetServiceRequesterLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        goto LABEL_42;
      *(_WORD *)buf = 0;
      v31 = "Returning online-only operations, offline is not available";
      v32 = v30;
      v33 = 2;
      goto LABEL_25;
    }
    if (v22 != 4)
    {
      GEOGetServiceRequesterLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      v59 = objc_msgSend(v12, "requestMode");
      if (v59 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v59);
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = off_1E1C20568[(int)v59];
      }
      *(_DWORD *)buf = 138412290;
      v71 = v39;
      v43 = "Invalid request mode %@, returning online-only operations";
      goto LABEL_41;
    }
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = CFSTR("Offline Maps is not available");
    v42 = -6;
LABEL_58:
    objc_msgSend(v40, "GEOErrorWithCode:reason:", v42, v41);
    v36 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = objc_msgSend(v12, "requestMode");
    if (v29 < 4)
    {
      GEOGetServiceRequesterLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
LABEL_42:

LABEL_43:
        -[GEOServiceRequester networkOperationClasses](self, "networkOperationClasses");
        v44 = objc_claimAutoreleasedReturnValue();
LABEL_44:
        v36 = (void *)v44;
        goto LABEL_45;
      }
      *(_DWORD *)buf = 138412290;
      v71 = v13;
      v31 = "Returning online-only operations, unsupported offline cohort \"%@\";
      v32 = v30;
      v33 = 12;
LABEL_25:
      _os_log_impl(&dword_1885A9000, v32, OS_LOG_TYPE_DEBUG, v31, buf, v33);
      goto LABEL_42;
    }
    if (v29 != 4)
    {
      GEOGetServiceRequesterLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      v38 = objc_msgSend(v12, "requestMode");
      if (v38 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v38);
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = off_1E1C20568[(int)v38];
      }
      *(_DWORD *)buf = 138412290;
      v71 = v39;
      v43 = "Invalid request mode %@, returning online-only operations";
LABEL_41:
      _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_ERROR, v43, buf, 0xCu);

      goto LABEL_42;
    }
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v79 = CFSTR("GEOCohortId");
    v80[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "GEOErrorWithCode:reason:userInfo:", -6, CFSTR("Unsupported offline cohort"), v35);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

    v36 = 0;
  }
LABEL_45:

  return v36;
}

- (NSArray)networkOperationClasses
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_networkOperationClasses, "count"))
    return self->_networkOperationClasses;
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_startWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 completionHandler:(id)a9
{
  -[GEOServiceRequester _startWithRequest:traits:auditToken:config:throttleToken:options:willSendRequestHandler:completionHandler:](self, "_startWithRequest:traits:auditToken:config:throttleToken:options:willSendRequestHandler:completionHandler:", a3, a4, a5, a6, a7, a8, 0, a9);
}

- (GEOServiceRequester)init
{
  GEOServiceRequester *v2;
  uint64_t v3;
  NSMapTable *pendingRequests;
  GEOServiceRequester *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOServiceRequester;
  v2 = -[GEOServiceRequester init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 5);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = (NSMapTable *)v3;

    v2->_pendingRequestsLock._os_unfair_lock_opaque = 0;
    v5 = v2;
  }

  return v2;
}

NSString *__129__GEOServiceRequester__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

id __129__GEOServiceRequester__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler___block_invoke_66(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_validateResponse:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __129__GEOServiceRequester__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("no operations to run"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (BOOL)_shouldTryNextOperation:(id)a3 forError:(id)a4 fromOperation:(id)a5
{
  return objc_msgSend(a4, "_geo_isNetworkError", a3);
}

- (void)_cancelRequest:(id)a3
{
  id v3;

  -[GEOServiceRequester _currentOperationForRequest:](self, "_currentOperationForRequest:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (id)_validateResponse:(id)a3
{
  return 0;
}

- (void)setNetworkOperationClasses:(id)a3
{
  NSArray *v4;
  NSArray *networkOperationClasses;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  networkOperationClasses = self->_networkOperationClasses;
  self->_networkOperationClasses = v4;

}

- (Class)offlineOperationClass
{
  Class offlineOperationClass;

  offlineOperationClass = self->_offlineOperationClass;
  if (offlineOperationClass)
    return offlineOperationClass;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setOfflineOperationClass:(Class)a3
{
  self->_offlineOperationClass = a3;
}

- (GEOOfflineStateManager)offlineStateManager
{
  GEOOfflineStateManager *stateManagerOverride;

  stateManagerOverride = self->_stateManagerOverride;
  if (stateManagerOverride)
    return stateManagerOverride;
  +[GEOOfflineStateManager shared](GEOOfflineStateManager, "shared");
  return (GEOOfflineStateManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setOfflineStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_stateManagerOverride, a3);
}

- (Class)companionOfflineOperationClass
{
  return self->_companionOfflineOperationClass;
}

- (void)setCompanionOfflineOperationClass:(Class)a3
{
  objc_storeStrong((id *)&self->_companionOfflineOperationClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionOfflineOperationClass, 0);
  objc_storeStrong((id *)&self->_stateManagerOverride, 0);
  objc_storeStrong((id *)&self->_networkOperationClasses, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
}

@end
