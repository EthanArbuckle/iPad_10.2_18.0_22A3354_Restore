@implementation DNDSSleepingTriggerManager

- (DNDSSleepingTriggerManager)init
{
  DNDSSleepingTriggerManager *v2;
  uint64_t v3;
  OS_dispatch_queue *biomeQueue;
  uint64_t v5;
  NSMutableDictionary *sinks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DNDSSleepingTriggerManager;
  v2 = -[DNDSSleepingTriggerManager init](&v8, sel_init);
  if (v2)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.donotdisturb.private.biome-sleeping.queue"));
    v3 = objc_claimAutoreleasedReturnValue();
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v3;

    if (-[DNDSSleepingTriggerManager _featureEnabled](v2, "_featureEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = objc_claimAutoreleasedReturnValue();
      sinks = v2->_sinks;
      v2->_sinks = (NSMutableDictionary *)v5;

    }
  }
  return v2;
}

- (void)refresh
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[DNDSSleepingTriggerManager _featureEnabled](self, "_featureEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "sleepingModeForSleepingTriggerManager:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSSleepingTriggerManager _configureSleepingTriggerWithMode:](self, "_configureSleepingTriggerWithMode:", v4);
    -[DNDSSleepingTriggerManager _refreshWithMode:event:](self, "_refreshWithMode:event:", v4, 0);
    v5 = DNDSLogSleepingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Updated assertions for sleeping trigger: mode=%{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v6 = DNDSLogSleepingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "No action taken for request to refresh sleeping trigger; automatic entry not supported",
        (uint8_t *)&v7,
        2u);
    }
  }
}

- (void)_refreshWithMode:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  id v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  char v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  __CFString *v41;
  __CFString *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id v50;
  __CFString *v51;
  __CFString *v52;
  id v53;
  id v54;
  void *v55;
  unint64_t v56;
  __CFString *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  __CFString *v65;
  id v66;
  id v67;
  id v68;
  DNDSSleepingTriggerManager *v69;
  id v70;
  NSObject *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i;
  NSObject *v77;
  const __CFString *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  const __CFString *v86;
  DNDSSleepingTriggerManager *v87;
  DNDSSleepingTriggerManager *v88;
  DNDSSleepingTriggerManager *v89;
  DNDSSleepingTriggerManager *v90;
  void *v91;
  __CFString *v92;
  __CFString *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  _QWORD v98[4];
  id v99;
  NSObject *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[4];
  id v106;
  NSObject *v107;
  id v108;
  BOOL v109;
  _QWORD v110[4];
  NSObject *v111;
  id v112;
  id v113;
  id v114;
  id v115;
  uint8_t v116[128];
  uint8_t buf[4];
  const __CFString *v118;
  __int16 v119;
  const __CFString *v120;
  __int16 v121;
  void *v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[DNDSSleepingTriggerManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modeIdentifier");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v115 = 0;
  objc_msgSend(v8, "triggerManager:assertionsWithClientIdentifer:error:", self, CFSTR("com.apple.donotdisturb.private.sleeping-trigger"), &v115);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v115;
  objc_msgSend(v10, "firstObject");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "eventBody");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "sleepModeChangeReason");

    if ((unint64_t)(v14 - 7) <= 1)
    {
      v15 = (id)DNDSLogSleepingTrigger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v94 = v10;
        v85 = v8;
        objc_msgSend(v7, "eventBody");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "sleepModeChangeReason");
        if (v17 > 9)
          v18 = CFSTR("unspecified");
        else
          v18 = off_1E86A7438[v17];
        v96 = v6;
        v93 = v9;
        objc_msgSend(v7, "eventBody");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "sleepModeState");
        v57 = v12;
        if (v56 > 2)
          v58 = CFSTR("unspecified");
        else
          v58 = off_1E86A7488[v56];
        objc_msgSend(v7, "eventBody");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "expectedEndDate");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v118 = v18;
        v119 = 2114;
        v120 = v58;
        v121 = 2114;
        v122 = v60;
        _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring event: reason=%{public}@ state=%{public}@ expectedEnd=%{public}@", buf, 0x20u);

        v8 = v85;
        v9 = v93;
        v10 = v94;
        v12 = v57;
LABEL_37:
        v6 = v96;
      }
LABEL_54:

      goto LABEL_55;
    }
    if (v9)
    {
      v95 = v10;
      v91 = v7;
      v112 = v11;
      objc_msgSend(v8, "triggerManager:assertionsWithClientIdentifer:error:", self, CFSTR("com.apple.focus.activity-manager"), &v112);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v112;

      v110[0] = MEMORY[0x1E0C809B0];
      v110[1] = 3221225472;
      v110[2] = __53__DNDSSleepingTriggerManager__refreshWithMode_event___block_invoke;
      v110[3] = &unk_1E86A5BB0;
      v24 = v9;
      v111 = v24;
      objc_msgSend(v23, "bs_filter:", v110);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        if (objc_msgSend(v25, "count"))
        {
          v26 = DNDSLogSleepingTrigger;
          if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v118 = (const __CFString *)v24;
            v119 = 2114;
            v120 = v12;
            v121 = 2114;
            v122 = v25;
            _os_log_error_impl(&dword_1CB895000, v26, OS_LOG_TYPE_ERROR, "Existing assertions found for sleeping trigger manager and activity manager; modeID=%{public}@ assertion=%"
              "{public}@ userAssertion=%{public}@",
              buf,
              0x20u);
          }
        }
      }
      v86 = v12;
      v27 = objc_msgSend(v25, "count");
      objc_msgSend(v25, "bs_compactMap:", &__block_literal_global_18);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "eventBody");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "sleepModeState");

      if ((unint64_t)(v29 - 1) > 1)
      {
        v12 = (__CFString *)v86;
        if (!v86 && !v27)
        {
          v7 = v91;
          v46 = v83;
          v45 = v84;
LABEL_53:

          v15 = v111;
          v11 = v45;
          goto LABEL_54;
        }
        v90 = self;
        v92 = v9;
        v71 = DNDSLogSleepingTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v118 = (const __CFString *)v24;
          v119 = 2114;
          v120 = v86;
          _os_log_impl(&dword_1CB895000, v71, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion for sleeping trigger in response to event; previousModeID=%{public}@ assertion=%{public}@",
            buf,
            0x16u);
        }
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v82 = v25;
        v72 = v25;
        v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
        if (v73)
        {
          v74 = v73;
          v75 = *(_QWORD *)v102;
          do
          {
            for (i = 0; i != v74; ++i)
            {
              if (*(_QWORD *)v102 != v75)
                objc_enumerationMutation(v72);
              v77 = DNDSLogSleepingTrigger;
              if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
              {
                v78 = *(const __CFString **)(*((_QWORD *)&v101 + 1) + 8 * i);
                *(_DWORD *)buf = 138543618;
                v118 = (const __CFString *)v24;
                v119 = 2114;
                v120 = v78;
                _os_log_impl(&dword_1CB895000, v77, OS_LOG_TYPE_DEFAULT, "Invalidating active user assertion for associated mode in response to event; previousModeID=%{public}@"
                  " assertion=%{public}@",
                  buf,
                  0x16u);
              }
            }
            v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
          }
          while (v74);
        }

        objc_msgSend(v83, "arrayByAddingObject:", CFSTR("com.apple.donotdisturb.private.sleeping-trigger"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        v98[0] = MEMORY[0x1E0C809B0];
        v98[1] = 3221225472;
        v98[2] = __53__DNDSSleepingTriggerManager__refreshWithMode_event___block_invoke_15;
        v98[3] = &unk_1E86A5C48;
        v46 = v79;
        v99 = v46;
        v100 = v24;
        v80 = (id)objc_msgSend(v8, "triggerManager:performModeAssertionUpdatesWithHandler:", v90, v98);

        v68 = v99;
        v10 = v95;
        v12 = (__CFString *)v86;
        v45 = v84;
      }
      else
      {
        v81 = v25;
        v92 = v9;
        v30 = v27 != 0;
        v31 = objc_alloc_init(MEMORY[0x1E0D1D6F8]);
        objc_msgSend(v31, "setIdentifier:", CFSTR("com.apple.donotdisturb.trigger.sleeping"));
        objc_msgSend(v31, "setModeIdentifier:", v24);
        objc_msgSend(v91, "eventBody");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "expectedEndDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setUserVisibleEndDate:", v33);

        objc_msgSend(v91, "eventBody");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "sleepModeChangeReason") - 1;
        v12 = (__CFString *)v86;
        if (v35 > 7)
          v36 = 0;
        else
          v36 = qword_1CB953B30[v35];
        v45 = v84;
        objc_msgSend(v31, "setReason:", v36, v81);

        v105[0] = MEMORY[0x1E0C809B0];
        v105[1] = 3221225472;
        v105[2] = __53__DNDSSleepingTriggerManager__refreshWithMode_event___block_invoke_2;
        v105[3] = &unk_1E86A6D90;
        v109 = v30;
        v106 = v83;
        v107 = v24;
        v108 = v31;
        v68 = v31;
        v69 = self;
        v46 = v106;
        v70 = (id)objc_msgSend(v8, "triggerManager:performModeAssertionUpdatesWithHandler:", v69, v105);

      }
      v7 = v91;
      v9 = v92;
      v25 = v82;
      goto LABEL_53;
    }
    if (objc_msgSend(v10, "count"))
    {
      v87 = self;
      v37 = (void *)DNDSLogSleepingTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v37;
        -[__CFString details](v12, "details");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "modeIdentifier");
        v40 = v6;
        v41 = v12;
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v118 = v42;
        _os_log_impl(&dword_1CB895000, v38, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for sleeping trigger in response to event; previousModeID=%{public}@",
          buf,
          0xCu);

        v12 = v41;
        v6 = v40;

      }
      -[__CFString UUID](v12, "UUID");
      v15 = objc_claimAutoreleasedReturnValue();
      v97 = v11;
      v43 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", v87, v15, 3, 0, CFSTR("com.apple.donotdisturb.private.sleeping-trigger"), &v97);
      v44 = v97;
LABEL_28:
      v54 = v44;

      v11 = v54;
      goto LABEL_54;
    }
  }
  else if (objc_msgSend(v10, "count"))
  {
    if (!v9)
    {
      v88 = self;
      v47 = (void *)DNDSLogSleepingTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v48 = v47;
        -[__CFString details](v12, "details");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "modeIdentifier");
        v50 = v6;
        v51 = v12;
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v118 = v52;
        _os_log_impl(&dword_1CB895000, v48, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for sleeping trigger; previousModeID=%{public}@",
          buf,
          0xCu);

        v12 = v51;
        v6 = v50;

      }
      -[__CFString UUID](v12, "UUID");
      v15 = objc_claimAutoreleasedReturnValue();
      v114 = v11;
      v53 = (id)objc_msgSend(v8, "triggerManager:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", v88, v15, 2, 0, CFSTR("com.apple.donotdisturb.private.sleeping-trigger"), &v114);
      v44 = v114;
      goto LABEL_28;
    }
    v96 = v6;
    -[__CFString details](v12, "details");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "modeIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v12;
    v22 = -[__CFString isEqualToString:](v9, "isEqualToString:", v20);

    if ((v22 & 1) == 0)
    {
      v89 = self;
      -[__CFString details](v21, "details");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v61, "mutableCopy");

      -[NSObject setModeIdentifier:](v15, "setModeIdentifier:", v9);
      v62 = (void *)DNDSLogSleepingTrigger;
      v12 = v21;
      if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v63 = v62;
        -[__CFString details](v21, "details");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "modeIdentifier");
        v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v118 = v9;
        v119 = 2114;
        v120 = v65;
        _os_log_impl(&dword_1CB895000, v63, OS_LOG_TYPE_DEFAULT, "Updating active assertion to new mode identifer for sleeping trigger; modeID=%{public}@ previousModeID=%{public}@",
          buf,
          0x16u);

        v12 = v21;
      }
      v113 = v11;
      v66 = (id)objc_msgSend(v8, "triggerManager:takeModeAssertionWithDetails:clientIdentifier:error:", v89, v15, CFSTR("com.apple.donotdisturb.private.sleeping-trigger"), &v113);
      v67 = v113;

      v11 = v67;
      goto LABEL_37;
    }
    v12 = v21;
    v6 = v96;
  }
LABEL_55:

}

uint64_t __53__DNDSSleepingTriggerManager__refreshWithMode_event___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

id __53__DNDSSleepingTriggerManager__refreshWithMode_event___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __53__DNDSSleepingTriggerManager__refreshWithMode_event___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 56))
  {
    +[DNDSModeAssertionInvalidationPredicate predicateForAssertionClientIdentifiers:](DNDSModeAssertionInvalidationPredicate, "predicateForAssertionClientIdentifiers:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", CFSTR("com.apple.donotdisturb.private.sleeping-trigger"), 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:details:source:reason:reasonOverride:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:details:source:reason:reasonOverride:", v4, v6, 0, v5, 4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)DNDSLogSleepingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(a1 + 48);
      v11 = v8;
      objc_msgSend(v9, "lifetime");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v10;
      v26 = 2114;
      v27 = v12;
      _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Invalidating user assertion(s) for mode in response to event; modeID=%{public}@ lifetime=%{public}@",
        (uint8_t *)&v24,
        0x16u);

    }
    v13 = (id)objc_msgSend(v3, "invalidateAssertionsForRequest:", v7);

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", CFSTR("com.apple.donotdisturb.private.sleeping-trigger"), 0);
  v15 = (void *)DNDSLogSleepingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 40);
    v16 = *(void **)(a1 + 48);
    v18 = v15;
    objc_msgSend(v16, "lifetime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v17;
    v26 = 2114;
    v27 = v19;
    _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for sleeping trigger in response to event; modeID=%{public}@ lifetime=%{public}@",
      (uint8_t *)&v24,
      0x16u);

  }
  v20 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v3, "takeAssertionWithDetails:source:startDate:", v20, v14, v21);

  return 1;
}

uint64_t __53__DNDSSleepingTriggerManager__refreshWithMode_event___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[DNDSModeAssertionInvalidationPredicate predicateForAssertionClientIdentifiers:](DNDSModeAssertionInvalidationPredicate, "predicateForAssertionClientIdentifiers:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", CFSTR("com.apple.donotdisturb.private.sleeping-trigger"), 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:details:source:reason:reasonOverride:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:details:source:reason:reasonOverride:", v4, v6, 0, v5, 3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = DNDSLogSleepingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v12 = 138543362;
    v13 = v9;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating assertion(s) for mode in response to event; modeID=%{public}@",
      (uint8_t *)&v12,
      0xCu);
  }
  v10 = (id)objc_msgSend(v3, "invalidateAssertionsForRequest:", v7);

  return 1;
}

- (void)_configureSleepingTriggerWithMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  DNDSSleepingTriggerManager *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sinks, "objectForKeyedSubscript:", CFSTR("system"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4 || v5)
  {
    if (!v4 && v5)
    {
      objc_msgSend(v5, "cancel");
      -[NSMutableDictionary removeObjectForKey:](self->_sinks, "removeObjectForKey:", CFSTR("system"));
    }
  }
  else
  {
    v7 = DNDSLogSleepingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v4;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Adding biome sleeping event monitor; mode=%{public}@",
        buf,
        0xCu);
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.donotdisturb.sleepingTrigger"), self->_biomeQueue);
    objc_msgSend(MEMORY[0x1E0D027B8], "sleepModeStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "publisher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subscribeOn:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __64__DNDSSleepingTriggerManager__configureSleepingTriggerWithMode___block_invoke_24;
    v15 = &unk_1E86A6B88;
    v16 = self;
    v17 = v4;
    objc_msgSend(v11, "sinkWithCompletion:receiveInput:", &__block_literal_global_23, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sinks, "setObject:forKeyedSubscript:", v6, CFSTR("system"), v12, v13, v14, v15, v16);
  }

}

void __64__DNDSSleepingTriggerManager__configureSleepingTriggerWithMode___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)DNDSLogSleepingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = a2;
    v6 = objc_msgSend(v5, "state");
    objc_msgSend(v5, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 134218242;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Sleeping subscription completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);

  }
}

void __64__DNDSSleepingTriggerManager__configureSleepingTriggerWithMode___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  const __CFString *v17;
  void *v18;
  unint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  int v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id)DNDSLogSleepingTrigger;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sleepModeChangeReason");
    if (v6 > 9)
      v7 = CFSTR("unspecified");
    else
      v7 = off_1E86A7438[v6];
    objc_msgSend(v3, "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "sleepModeState");
    if (v9 > 2)
      v10 = CFSTR("unspecified");
    else
      v10 = off_1E86A7488[v9];
    objc_msgSend(v3, "eventBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "expectedEndDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timestamp");
    v23 = 138544130;
    v24 = v7;
    v25 = 2114;
    v26 = v10;
    v27 = 2114;
    v28 = v12;
    v29 = 2048;
    v30 = v13;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Received sleeping event: reason=%{public}@ state=%{public}@ expectedEnd=%{public}@ timestamp:%f", (uint8_t *)&v23, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "_refreshWithMode:event:", *(_QWORD *)(a1 + 40), v3);
  v14 = (id)DNDSLogSleepingTrigger;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "eventBody");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "sleepModeChangeReason");
    if (v16 > 9)
      v17 = CFSTR("unspecified");
    else
      v17 = off_1E86A7438[v16];
    objc_msgSend(v3, "eventBody");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "sleepModeState");
    if (v19 > 2)
      v20 = CFSTR("unspecified");
    else
      v20 = off_1E86A7488[v19];
    objc_msgSend(v3, "eventBody");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "expectedEndDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v17;
    v25 = 2114;
    v26 = v20;
    v27 = 2114;
    v28 = v22;
    _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Processed sleeping event: reason=%{public}@ state=%{public}@ expectedEnd=%{public}@", (uint8_t *)&v23, 0x20u);

  }
}

- (BOOL)_featureEnabled
{
  return 1;
}

- (DNDSSleepingTriggerManagerDataSource)dataSource
{
  return (DNDSSleepingTriggerManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
}

@end
