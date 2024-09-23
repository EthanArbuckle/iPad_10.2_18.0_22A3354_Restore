@implementation HDSleepDaySummaryQueryServer

- (HDSleepDaySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11;
  HDSleepDaySummaryQueryServer *v12;
  HDSleepDaySummaryQueryServer *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDSleepDaySummaryQueryServer;
  v12 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v15, sel_initWithUUID_configuration_client_delegate_, a3, v11, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_configuration, a4);

  return v13;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  char v12;
  BOOL v13;

  v6 = a4;
  objc_msgSend(v6, "entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CB59B0];
  v9 = objc_msgSend(v7, "hasEntitlement:", *MEMORY[0x1E0CB59B0]);

  if ((v9 & 1) != 0
    || (objc_msgSend(v6, "entitlements"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = *MEMORY[0x1E0CB59A0],
        v12 = objc_msgSend(v10, "hasPrivateAccessEntitlementWithIdentifier:", *MEMORY[0x1E0CB59A0]),
        v10,
        (v12 & 1) != 0))
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 4, CFSTR("Missing required entitlement: %@ for core apps or %@ for second-party access."), v8, v11);
    v13 = 0;
  }

  return v13;
}

- (id)objectTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  HKSleepDaySummarySampleTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  HKSleepDaySummaryQueryConfiguration *configuration;
  id v37;
  HKSleepDaySummaryQueryConfiguration *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  HDSleepDaySummaryEnumerator *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  HDSleepDaySummaryEnumerator *v68;
  id v69;
  _BOOL4 v70;
  id v71;
  uint64_t v72;
  int v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  id v78;
  void *v79;
  NSObject *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  id v94;
  NSObject *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  uint64_t v104;
  id v105;
  uint64_t spid;
  void *v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  id v118;
  objc_super v119;
  id v120;
  id v121;
  _QWORD v122[4];
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  char v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  char v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  uint64_t (*v134)(uint64_t, uint64_t);
  void (*v135)(uint64_t);
  id v136;
  uint8_t v137[128];
  _BYTE buf[24];
  void *v139;
  HDSleepDaySummaryQueryServer *v140;
  id v141;
  uint64_t *v142;
  uint64_t *v143;
  uint64_t *v144;
  _QWORD *v145;
  uint64_t v146;
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  -[HDQueryServer configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugIdentifier");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB5368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v112;
    v6 = *(id *)&buf[4];
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Query Started", buf, 0x16u);

  }
  v119.receiver = self;
  v119.super_class = (Class)HDSleepDaySummaryQueryServer;
  -[HDQueryServer _queue_start](&v119, sel__queue_start);
  -[HDQueryServer clientProxy](self, "clientProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorizationOracle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSleepDaySummaryQueryServer objectTypes](self, "objectTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0;
  objc_msgSend(v9, "readAuthorizationStatusesForTypes:error:", v10, &v118);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v118;

  if (!v113)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E0CB5368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_ERROR))
    {
      v92 = v24;
      v93 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v93;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v112;
      *(_WORD *)&buf[22] = 2114;
      v139 = v110;
      v94 = v93;
      _os_log_error_impl(&dword_1B7802000, v92, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Unable to read authorization status due to error %{public}@", buf, 0x20u);

    }
    -[HDQueryServer queryUUID](self, "queryUUID");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "client_deliverError:forQuery:", v110, v23);
    goto LABEL_56;
  }
  -[HDQueryServer client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "authorizationOracle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "clientHasAuthorizationForAllTypes");

  if ((v13 & 1) == 0)
  {
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    objc_msgSend(v113, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v114, v137, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v115;
      v17 = 1;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v115 != v16)
            objc_enumerationMutation(v14);
          if ((v17 & 1) != 0)
            v17 = objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * i), "canRead");
          else
            v17 = 0;
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v114, v137, 16);
      }
      while (v15);

      if ((v17 & 1) == 0)
      {
        _HKInitializeLogging();
        v19 = (void *)*MEMORY[0x1E0CB5368];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          v21 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v112;
          *(_WORD *)&buf[22] = 2114;
          v139 = v113;
          v22 = v21;
          _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Avoiding exposing health data due to missing authorization: %{public}@", buf, 0x20u);

        }
        -[HDQueryServer queryUUID](self, "queryUUID");
        v23 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "client_deliverDaySummaries:clearPending:isFinalBatch:queryUUID:", MEMORY[0x1E0C9AA60], 0, 1, v23);
LABEL_56:

        goto LABEL_57;
      }
    }
    else
    {

    }
  }
  spid = _HKLogSignpostIDGenerate();
  _HKInitializeLogging();
  v25 = (void *)*MEMORY[0x1E0CB5368];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB5368]))
  {
    v26 = v25;
    v27 = v26;
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v112;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v27, OS_SIGNPOST_INTERVAL_BEGIN, spid, "sleep-day-summary-query", "name=%{public}@", buf, 0xCu);
    }

  }
  if (self)
  {
    v131 = 0;
    v132 = &v131;
    v133 = 0x3032000000;
    v134 = __Block_byref_object_copy__24;
    v135 = __Block_byref_object_dispose__24;
    v136 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v127 = 0;
    v128 = &v127;
    v129 = 0x2020000000;
    v130 = 1;
    v123 = 0;
    v124 = &v123;
    v125 = 0x2020000000;
    v126 = 0;
    v122[0] = 0;
    v122[1] = v122;
    v122[2] = 0x2020000000;
    v122[3] = 0;
    v104 = -[HKSleepDaySummaryQueryConfiguration limit](self->_configuration, "limit");
    v108 = -[HDSleepDaySummaryQueryServer _newGregorianCalendar](self, "_newGregorianCalendar");
    -[HKSleepDaySummaryQueryConfiguration calendarOverrides](self->_configuration, "calendarOverrides");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == 0;

    if (!v29)
    {
      -[HKSleepDaySummaryQueryConfiguration calendarOverrides](self->_configuration, "calendarOverrides");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "setFirstWeekday:", objc_msgSend(v30, "firstWeekday"));

    }
    -[HDQueryServer clientProxy](self, "clientProxy");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "remoteObjectProxy");
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDQueryServer profile](self, "profile");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sourceManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = 0;
    objc_msgSend(v33, "localDeviceSourceWithError:", &v121);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v121;

    if (!v109)
    {
      -[HDQueryServer queryUUID](self, "queryUUID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "client_deliverError:forQuery:", v34, v52);
LABEL_49:

      _Block_object_dispose(v122, 8);
      _Block_object_dispose(&v123, 8);
      _Block_object_dispose(&v127, 8);
      _Block_object_dispose(&v131, 8);

      goto LABEL_50;
    }
    -[HDQueryServer profile](self, "profile");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    configuration = self->_configuration;
    v37 = v35;
    v38 = configuration;
    v39 = v109;
    v40 = v108;
    -[HKSleepDaySummaryQueryConfiguration debugIdentifier](v38, "debugIdentifier");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "daemon");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "behavior");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "supportsCachedSleepDaySummaryQueries");

    if ((v43 & 1) != 0)
    {
      -[HKSleepDaySummaryQueryConfiguration cacheSettings](v38, "cacheSettings");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44 == 0;

      if (v45)
      {
        _HKInitializeLogging();
        v57 = (void *)*MEMORY[0x1E0CB5368];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEBUG))
        {
          v95 = v57;
          v96 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v96;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v103;
          v97 = v96;
          _os_log_debug_impl(&dword_1B7802000, v95, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Query caching settings not provided; caching disabled",
            buf,
            0x16u);

        }
      }
      else
      {
        -[HKSleepDaySummaryQueryConfiguration cacheSettings](v38, "cacheSettings");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "mode") == 1;

        if (!v47)
        {
          v81 = (void *)MEMORY[0x1E0CB3588];
          v82 = -[HKSleepDaySummaryQueryConfiguration morningIndexRange](v38, "morningIndexRange");
          objc_msgSend(v81, "hk_sleepDayIntervalForMorningIndexRange:calendar:", v82, v83, v40);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_alloc_init(MEMORY[0x1E0C99D78]);
          objc_msgSend(v102, "setDay:", 1);
          -[HKSleepDaySummaryQueryConfiguration cacheSettings](v38, "cacheSettings");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "identifier");
          v100 = (void *)objc_claimAutoreleasedReturnValue();

          _HKInitializeLogging();
          v85 = (void *)*MEMORY[0x1E0CB5368];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
          {
            v86 = v85;
            v87 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v87;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v103;
            *(_WORD *)&buf[22] = 2114;
            v139 = v100;
            v88 = v87;
            _os_log_impl(&dword_1B7802000, v86, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Creating caching session with ID: %{public}@", buf, 0x20u);

          }
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __118__HDSleepDaySummaryQueryServer__newCachingSessionWithProfile_configuration_localDeviceSource_gregorianCalendar_error___block_invoke;
          v139 = &unk_1E6CEBBD8;
          v140 = (HDSleepDaySummaryQueryServer *)v40;
          v99 = _Block_copy(buf);
          +[HDSleepDaySummaryEnumerator sleepAnalysisQueryDescriptorForDateInterval:options:](HDSleepDaySummaryEnumerator, "sleepAnalysisQueryDescriptorForDateInterval:options:", 0, -[HKSleepDaySummaryQueryConfiguration options](v38, "options"));
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = objc_opt_class();
          objc_msgSend(v101, "startDate");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = -[HDSleepDaySummaryQueryServer _newCachingSessionWithProfile:cachingIdentifier:sourceEntity:queryDescriptor:cachedClass:queryInterval:anchorDate:intervalComponents:timeIntervalToBucketIndex:](self, "_newCachingSessionWithProfile:cachingIdentifier:sourceEntity:queryDescriptor:cachedClass:queryInterval:anchorDate:intervalComponents:timeIntervalToBucketIndex:", v37, v100, v39, v98, v89, v101, v90, v102, v99);

          +[HDSleepDaySummaryEnumerator sleepTypesQueryDescriptorsForDateInterval:options:](HDSleepDaySummaryEnumerator, "sleepTypesQueryDescriptorsForDateInterval:options:", 0, -[HKSleepDaySummaryQueryConfiguration options](v38, "options"));
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "setInvalidationQueryDescriptors:", v91);

          goto LABEL_43;
        }
        _HKInitializeLogging();
        v48 = (void *)*MEMORY[0x1E0CB5368];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEBUG))
        {
          v49 = v48;
          v50 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v50;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v103;
          v51 = v50;
          _os_log_debug_impl(&dword_1B7802000, v49, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Query caching settings specified user interactive mode; caching disabled",
            buf,
            0x16u);

        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v53 = (void *)*MEMORY[0x1E0CB5368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEBUG))
      {
        v54 = v53;
        v55 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v55;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v103;
        v56 = v55;
        _os_log_debug_impl(&dword_1B7802000, v54, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Query caching feature flag not enabled; caching disabled",
          buf,
          0x16u);

      }
    }
    v105 = 0;
LABEL_43:

    v58 = v34;
    v59 = v40;
    v60 = [HDSleepDaySummaryEnumerator alloc];
    -[HDQueryServer profile](self, "profile");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = -[HKSleepDaySummaryQueryConfiguration morningIndexRange](self->_configuration, "morningIndexRange");
    v64 = v63;
    v65 = -[HKSleepDaySummaryQueryConfiguration ascending](self->_configuration, "ascending");
    v66 = -[HKSleepDaySummaryQueryConfiguration options](self->_configuration, "options");
    -[HKSleepDaySummaryQueryConfiguration debugIdentifier](self->_configuration, "debugIdentifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = -[HDSleepDaySummaryEnumerator initWithProfile:cachingSession:gregorianCalendar:morningIndexRange:ascending:options:debugIdentifier:](v60, "initWithProfile:cachingSession:gregorianCalendar:morningIndexRange:ascending:options:debugIdentifier:", v61, v105, v59, v62, v64, v65, v66, v67);

    v120 = v58;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __58__HDSleepDaySummaryQueryServer__queue_surfaceDaySummaries__block_invoke;
    v139 = &unk_1E6CEBBB0;
    v140 = self;
    v142 = &v123;
    v143 = &v131;
    v69 = v107;
    v141 = v69;
    v144 = &v127;
    v145 = v122;
    v146 = v104;
    v70 = -[HDSleepDaySummaryEnumerator enumerateWithError:handler:](v68, "enumerateWithError:handler:", &v120, buf);
    v71 = v120;

    if (!*((_BYTE *)v124 + 24))
    {
      if (v70)
      {
        v72 = v132[5];
        v73 = *((unsigned __int8 *)v128 + 24);
        -[HDQueryServer queryUUID](self, "queryUUID");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "client_deliverDaySummaries:clearPending:isFinalBatch:queryUUID:", v72, v73 != 0, 1, v74);
      }
      else
      {
        -[HDQueryServer queryUUID](self, "queryUUID");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "client_deliverError:forQuery:", v71, v74);
      }

    }
    v34 = v71;
    v52 = v105;
    goto LABEL_49;
  }
LABEL_50:
  _HKInitializeLogging();
  v75 = (void *)*MEMORY[0x1E0CB5368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
  {
    v76 = v75;
    v77 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v77;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v112;
    v78 = v77;
    _os_log_impl(&dword_1B7802000, v76, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Query complete", buf, 0x16u);

  }
  _HKInitializeLogging();
  v79 = (void *)*MEMORY[0x1E0CB5368];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB5368]))
  {
    v80 = v79;
    v23 = v80;
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v112;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v23, OS_SIGNPOST_INTERVAL_END, spid, "sleep-day-summary-query", "name=%{public}@", buf, 0xCu);
    }
    goto LABEL_56;
  }
LABEL_57:

}

void __58__HDSleepDaySummaryQueryServer__queue_surfaceDaySummaries__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldStopProcessingQuery") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "_shouldSuspendQuery"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_4:
    *a3 = 1;
    goto LABEL_5;
  }
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") >= 0x190)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "queryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "client_deliverDaySummaries:clearPending:isFinalBatch:queryUUID:", v5, v6, 0, v8);

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v13);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v12 = *(_QWORD *)(a1 + 80);
  if (v12 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) >= v12)
    goto LABEL_4;
LABEL_5:

}

uint64_t __118__HDSleepDaySummaryQueryServer__newCachingSessionWithProfile_configuration_localDeviceSource_gregorianCalendar_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hk_morningIndexWithCalendar:", *(_QWORD *)(a1 + 32));

  return v3;
}

- (id)_newCachingSessionWithProfile:(id)a3 cachingIdentifier:(id)a4 sourceEntity:(id)a5 queryDescriptor:(id)a6 cachedClass:(Class)a7 queryInterval:(id)a8 anchorDate:(id)a9 intervalComponents:(id)a10 timeIntervalToBucketIndex:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  HDSampleAggregateCachingSession *v24;
  void *v25;
  HDSampleAggregateCachingSession *v26;

  v17 = a11;
  v18 = a10;
  v19 = a8;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = [HDSampleAggregateCachingSession alloc];
  objc_msgSend(v19, "startDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[HDSampleAggregateCachingSession initWithProfile:cachingIdentifier:sourceEntity:queryDescriptor:cachedClass:queryInterval:anchorDate:intervalComponents:timeIntervalToBucketIndex:](v24, "initWithProfile:cachingIdentifier:sourceEntity:queryDescriptor:cachedClass:queryInterval:anchorDate:intervalComponents:timeIntervalToBucketIndex:", v23, v22, v21, v20, a7, v19, v25, v18, v17);

  return v26;
}

- (id)_newGregorianCalendar
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
