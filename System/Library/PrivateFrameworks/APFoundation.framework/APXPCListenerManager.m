@implementation APXPCListenerManager

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  APXPCConnection *v21;
  const char *v22;
  uint64_t v23;
  APXPCListenerManager *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  char *v40;
  APXPCListenerManager *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  NSObject *v61;
  char *v62;
  char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  NSObject *v80;
  char *v81;
  char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  BOOL v103;
  char *v104;
  NSObject *v105;
  char *v106;
  NSObject *v108;
  char *v109;
  char *v110;
  id v111;
  _QWORD v112[4];
  NSObject *v113;
  _QWORD v114[4];
  APXPCListenerManager *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint8_t buf[4];
  char *v121;
  __int16 v122;
  APXPCListenerManager *v123;
  __int16 v124;
  id v125;
  __int16 v126;
  void *v127;
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v111 = a3;
  v6 = a4;
  objc_msgSend_serviceName(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)qword_1ED2BC720;
  objc_sync_enter(v11);
  objc_msgSend_delegates(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v15, v16, (uint64_t)v10, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v11);
  if (v18 && (objc_msgSend_conformsToProtocol_(v18, v19, (uint64_t)&unk_1EFB9D710, v20) & 1) != 0)
  {
    v21 = [APXPCConnection alloc];
    v24 = (APXPCListenerManager *)objc_msgSend_initWithConnection_(v21, v22, (uint64_t)v6, v23);
    objc_msgSend_actionReceiverForConnection_(v18, v25, (uint64_t)v24, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v30 = v27;
    if (v27 && (objc_msgSend_conformsToProtocol_(v27, v28, (uint64_t)&unk_1EFB9D770, v29) & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_requiredEntitlements(v30, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v34;
        if (!v34 || !objc_msgSend_count(v34, v35, v36, v37))
        {
          APLogForCategory(0x32uLL);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138477827;
            v121 = (char *)objc_opt_class();
            v40 = v121;
            _os_log_impl(&dword_1CF251000, v39, OS_LOG_TYPE_ERROR, "[%{private}@] The optional requiredEntitlements method was implemented, but no entitlements were provided. Is this a developer issue? Please file a radar...", buf, 0xCu);

          }
        }
        v118 = 0u;
        v119 = 0u;
        v116 = 0u;
        v117 = 0u;
        v41 = v38;
        v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v116, (uint64_t)v128, 16);
        if (v45)
        {
          v46 = *(_QWORD *)v117;
          while (2)
          {
            for (i = 0; i != v45; ++i)
            {
              if (*(_QWORD *)v117 != v46)
                objc_enumerationMutation(v41);
              if ((objc_msgSend_hasEntitlement_(v24, v43, *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i), v44) & 1) == 0)
              {
                APLogForCategory(0x32uLL);
                v108 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                {
                  v109 = (char *)objc_opt_class();
                  *(_DWORD *)buf = 138477827;
                  v121 = v109;
                  v110 = v109;
                  _os_log_impl(&dword_1CF251000, v108, OS_LOG_TYPE_ERROR, "[%{private}@] Caller does is missing a necessary entitlement. Bailing...", buf, 0xCu);

                }
                goto LABEL_38;
              }
            }
            v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v43, (uint64_t)&v116, (uint64_t)v128, 16);
            if (v45)
              continue;
            break;
          }
        }

      }
      objc_msgSend_exportedObject(v30, v31, v32, v33);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setExportedObject_(v6, v49, (uint64_t)v48, v50);

      v51 = (void *)MEMORY[0x1E0CB3B50];
      objc_msgSend_exportedInterface(v30, v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_interfaceWithProtocol_(v51, v56, (uint64_t)v55, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setExportedInterface_(v6, v59, (uint64_t)v58, v60);

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        APLogForCategory(0x32uLL);
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          v62 = (char *)objc_opt_class();
          *(_DWORD *)buf = 138477827;
          v121 = v62;
          v63 = v62;
          _os_log_impl(&dword_1CF251000, v61, OS_LOG_TYPE_INFO, "[%{private}@] Extending exported selectors to allow collection classes to pass data.", buf, 0xCu);

        }
        objc_msgSend_exportedInterface(v6, v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_extendCollectionClassesForExportedInterface_(v30, v68, (uint64_t)v67, v69);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v73 = (void *)MEMORY[0x1E0CB3B50];
        objc_msgSend_remoteObjectInterface(v30, v70, v71, v72);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_interfaceWithProtocol_(v73, v75, (uint64_t)v74, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRemoteObjectInterface_(v6, v78, (uint64_t)v77, v79);

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          APLogForCategory(0x32uLL);
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            v81 = (char *)objc_opt_class();
            *(_DWORD *)buf = 138477827;
            v121 = v81;
            v82 = v81;
            _os_log_impl(&dword_1CF251000, v80, OS_LOG_TYPE_INFO, "[%{private}@] Extending remote selectors to allow collection classes to pass data.", buf, 0xCu);

          }
          objc_msgSend_remoteObjectInterface(v6, v83, v84, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_extendCollectionClassesForRemoteInterface_(v30, v87, (uint64_t)v86, v88);

        }
      }
      v89 = MEMORY[0x1E0C809B0];
      v114[0] = MEMORY[0x1E0C809B0];
      v114[1] = 3221225472;
      v114[2] = sub_1CF286C90;
      v114[3] = &unk_1E8C48590;
      v90 = v30;
      v115 = (APXPCListenerManager *)v90;
      objc_msgSend_setInterruptionHandler_(v6, v91, (uint64_t)v114, v92);
      v112[0] = v89;
      v112[1] = 3221225472;
      v112[2] = sub_1CF25FAC4;
      v112[3] = &unk_1E8C48590;
      v113 = v90;
      objc_msgSend_setInvalidationHandler_(v6, v93, (uint64_t)v112, v94);
      APLogForCategory(0x32uLL);
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_serviceName(v6, v96, v97, v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136643587;
        v121 = "-[APXPCListenerManager listener:shouldAcceptNewConnection:]";
        v122 = 2114;
        v123 = self;
        v124 = 2114;
        v125 = v6;
        v126 = 2114;
        v127 = v99;
        _os_log_impl(&dword_1CF251000, v95, OS_LOG_TYPE_INFO, "%{sensitive}s: listener %{public}@ accepted connection %{public}@ (%{public}@)", buf, 0x2Au);

      }
      objc_msgSend_resume(v6, v100, v101, v102);

      v103 = 1;
      v41 = v115;
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v28, (uint64_t)CFSTR("No connection delegate returned or connection delegate doesn't conform to protocol"), v29);
      v41 = (APXPCListenerManager *)objc_claimAutoreleasedReturnValue();
      APLogForCategory(0x32uLL);
      v105 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        v121 = (char *)objc_opt_class();
        v122 = 2114;
        v123 = v41;
        v106 = v121;
        _os_log_impl(&dword_1CF251000, v105, OS_LOG_TYPE_ERROR, "[%{private}@] ERROR: %{public}@", buf, 0x16u);

      }
LABEL_38:
      v103 = 0;
    }

  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)CFSTR("No Delegate was found for mach service %@ or delegate doesn't conform to protocol"), v20, v10, v111);
    v24 = (APXPCListenerManager *)objc_claimAutoreleasedReturnValue();
    APLogForCategory(0x32uLL);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      v121 = (char *)objc_opt_class();
      v122 = 2114;
      v123 = v24;
      v104 = v121;
      _os_log_impl(&dword_1CF251000, v30, OS_LOG_TYPE_ERROR, "[%{private}@] ERROR: %{public}@", buf, 0x16u);

    }
    v103 = 0;
  }

  return v103;
}

- (NSMutableDictionary)delegates
{
  return self->_delegates;
}

+ (void)addDelegate:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  int v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (qword_1ED2BC730 != -1)
    dispatch_once(&qword_1ED2BC730, &unk_1E8C48130);
  v4 = (id)qword_1ED2BC720;
  objc_sync_enter(v4);
  objc_msgSend_machServiceName(v3, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  APLogForCategory(0x32uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v41 = 138478083;
    v42 = (id)objc_opt_class();
    v43 = 2114;
    v44 = v8;
    v10 = v42;
    _os_log_impl(&dword_1CF251000, v9, OS_LOG_TYPE_INFO, "[%{private}@] Adding a delegate for machService: %{public}@", (uint8_t *)&v41, 0x16u);

  }
  objc_msgSend_delegates((void *)qword_1ED2BC720, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v14, v15, (uint64_t)v8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend_delegates((void *)qword_1ED2BC720, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v21, v22, (uint64_t)v3, (uint64_t)v8);

    APLogForCategory(0x32uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = (void *)objc_opt_class();
      v41 = 138477827;
      v42 = v24;
      v25 = v24;
      _os_log_impl(&dword_1CF251000, v23, OS_LOG_TYPE_INFO, "[%{private}@] Setting up the listener", (uint8_t *)&v41, 0xCu);

    }
    v26 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v29 = (void *)objc_msgSend_initWithMachServiceName_(v26, v27, (uint64_t)v8, v28);
    objc_msgSend_setDelegate_(v29, v30, qword_1ED2BC720, v31);
    objc_msgSend_resume(v29, v32, v33, v34);
    objc_msgSend_listeners((void *)qword_1ED2BC720, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v38, v39, (uint64_t)v29, v40);

  }
  objc_sync_exit(v4);

}

- (APXPCListenerManager)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  APXPCListenerManager *v5;
  uint64_t v6;
  NSMutableDictionary *delegates;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *listeners;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)APXPCListenerManager;
  v5 = -[APXPCListenerManager init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    delegates = v5->_delegates;
    v5->_delegates = (NSMutableDictionary *)v6;

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    listeners = v5->_listeners;
    v5->_listeners = (NSMutableArray *)v11;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  APSimulateCrash((const char *)5, CFSTR("The Listener Manager is never allowed to be dealloced"), 1u);
  v3.receiver = self;
  v3.super_class = (Class)APXPCListenerManager;
  -[APXPCListenerManager dealloc](&v3, sel_dealloc);
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (NSMutableArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end
