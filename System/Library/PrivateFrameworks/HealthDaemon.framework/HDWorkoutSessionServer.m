@implementation HDWorkoutSessionServer

+ (id)recoveredSessionServerWithProfile:(id)a3 sessionUUID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  HDWorkoutSessionServer *v11;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "workoutConfigurationForRecoveryWithProfile:sessionUUID:error:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = -[HDWorkoutSessionServer initWithProfile:configuration:sessionUUID:]([HDWorkoutSessionServer alloc], "initWithProfile:configuration:sessionUUID:", v8, v10, v9);
  else
    v11 = 0;

  return v11;
}

+ (id)workoutConfigurationForRecoveryWithProfile:(id)a3 sessionUUID:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  v8 = a4;
  +[HDWorkoutSessionEntity lookupSessionWithIdentifier:profile:error:](HDWorkoutSessionEntity, "lookupSessionWithIdentifier:profile:error:", v8, v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__188;
    v23 = __Block_byref_object_dispose__188;
    v24 = 0;
    v10 = (void *)objc_opt_class();
    objc_msgSend(v7, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __87__HDWorkoutSessionServer_workoutConfigurationForRecoveryWithProfile_sessionUUID_error___block_invoke;
    v16[3] = &unk_1E6CEF700;
    v18 = &v19;
    v17 = v9;
    v12 = objc_msgSend(v10, "performReadTransactionWithHealthDatabase:error:block:", v11, a5, v16);

    if (v12)
      v13 = (void *)v20[5];
    else
      v13 = 0;
    v14 = v13;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __87__HDWorkoutSessionServer_workoutConfigurationForRecoveryWithProfile_sessionUUID_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  id v13;

  v5 = *(void **)(a1 + 32);
  v13 = 0;
  objc_msgSend(v5, "workoutConfigurationWithTransaction:error:", a2, &v13);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    v10 = 1;
  else
    v10 = v7 == 0;
  v11 = v10;
  if (!v10)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError();
  }

  return v11;
}

+ (id)sessionIdentifierForRecoveryInProfile:(id)a3 error:(id *)a4
{
  return +[HDWorkoutSessionEntity sessionIdentifierForRecoveryInProfile:expirationInterval:error:](HDWorkoutSessionEntity, "sessionIdentifierForRecoveryInProfile:expirationInterval:error:", a3, a4, 900.0);
}

+ (BOOL)finishAllWorkoutSessionsForClient:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "sourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceForClient:error:", v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__HDWorkoutSessionServer_finishAllWorkoutSessionsForClient_profile_error___block_invoke;
  v16[3] = &unk_1E6CE9280;
  v17 = v11;
  v18 = v8;
  v19 = a1;
  v13 = v8;
  v14 = v11;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutSessionEntity, "performWriteTransactionWithHealthDatabase:error:block:", v12, a5, v16);

  return (char)a5;
}

uint64_t __74__HDWorkoutSessionServer_finishAllWorkoutSessionsForClient_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  +[HDWorkoutSessionEntity sessionsForSource:profile:error:](HDWorkoutSessionEntity, "sessionsForSource:profile:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          +[HDWorkoutSessionServer _finishSessionControllerForSessionEntity:profile:transaction:error:](*(_QWORD *)(a1 + 48), v13, *(void **)(a1 + 40), v5, a3);
          if (!objc_msgSend(v13, "finishWithTransaction:error:", v5, a3, (_QWORD)v16))
          {
            v14 = 0;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
    v14 = 1;
LABEL_12:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (void)_finishSessionControllerForSessionEntity:(void *)a3 profile:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = objc_opt_self();
  objc_msgSend(v8, "sessionIdentifierWithTransaction:error:", v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v8, "workoutConfigurationWithTransaction:error:", v10, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "workoutManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "newBiomeInterface");

    objc_msgSend(v15, "stopSessionWithIdentifier:recoveredWorkoutConfiguration:", v12, v13);
    if (v13)
    {
      objc_msgSend(v8, "clientApplicationIdentifier:error:", v10, a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = +[HDWorkoutSessionServer _sessionControllerClassFromWorkoutConfiguration:clientApplicationIdentifier:profile:](v11, v13, v16, v9);
        objc_msgSend(v17, "recoveryIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __93__HDWorkoutSessionServer__finishSessionControllerForSessionEntity_profile_transaction_error___block_invoke;
          v19[3] = &unk_1E6D0DBD0;
          v21 = v17;
          v20 = v9;
          +[HDWorkoutSessionControllerEntity retrieveArchivedStateFromRecoveryIdentifier:workoutSession:transaction:error:block:](HDWorkoutSessionControllerEntity, "retrieveArchivedStateFromRecoveryIdentifier:workoutSession:transaction:error:block:", v18, v8, v10, a5, v19);

        }
      }

    }
  }

}

+ (id)_sessionControllerClassFromWorkoutConfiguration:(void *)a3 clientApplicationIdentifier:(void *)a4 profile:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v8, "daemon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pluginManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pluginsConformingToProtocol:", &unk_1EF252698);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    v26 = *(_QWORD *)v33;
    v27 = v8;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v17, "workoutSessionControllerClassesForProfile:", v8, v26);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v29 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              if ((objc_msgSend(v23, "supportsWorkoutConfiguration:clientApplicationIdentifier:", v6, v7) & 1) != 0)
              {
                v24 = v23;

                v8 = v27;
                goto LABEL_18;
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v20)
              continue;
            break;
          }
        }

        v15 = v26;
        v8 = v27;
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v14);
  }

  objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.SessionTrackerApp"));
  objc_opt_class();
  v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v24;
}

void __93__HDWorkoutSessionServer__finishSessionControllerForSessionEntity_profile_transaction_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "willFinishSessionWithRecoveryData:profile:", v6, *(_QWORD *)(a1 + 32));

}

+ (BOOL)finishAllWorkoutsExcludingSessions:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__HDWorkoutSessionServer_finishAllWorkoutsExcludingSessions_profile_error___block_invoke;
  v14[3] = &unk_1E6CE9280;
  v15 = v8;
  v16 = v9;
  v17 = a1;
  v11 = v9;
  v12 = v8;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutSessionEntity, "performWriteTransactionWithHealthDatabase:error:block:", v10, a5, v14);

  return (char)a5;
}

uint64_t __75__HDWorkoutSessionServer_finishAllWorkoutsExcludingSessions_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  +[HDWorkoutSessionEntity sessionsExcludingIdentifiers:profile:error:](HDWorkoutSessionEntity, "sessionsExcludingIdentifiers:profile:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          +[HDWorkoutSessionServer _finishSessionControllerForSessionEntity:profile:transaction:error:](*(_QWORD *)(a1 + 48), v13, *(void **)(a1 + 40), v5, a3);
          if (!objc_msgSend(v13, "finishWithTransaction:error:", v5, a3, (_QWORD)v19))
          {

            goto LABEL_14;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        if (v10)
          continue;
        break;
      }
    }

    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134217984;
      v24 = v16;
      _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "Finished %ld unrecovered sessions.", buf, 0xCu);

    }
    v17 = 1;
  }
  else
  {
LABEL_14:
    v17 = 0;
  }

  return v17;
}

- (HDWorkoutSessionServer)initWithProfile:(id)a3 configuration:(id)a4 sessionUUID:(id)a5
{
  HDWorkoutSessionServer *v8;
  HDWorkoutSessionServer *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  id v12;
  uint64_t v13;
  HKObserverSet *observers;
  HKWorkoutConfiguration *firstActivityConfiguration;
  double v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  HKStateMachine *stateMachine;
  id v90;
  uint64_t v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  HKStateMachine *targetStateMachine;
  id v121;
  uint64_t v122;
  HKDataFlowLink *workoutDataFlowLink;
  void *v124;
  NSObject *v125;
  objc_class *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  NSUUID *identifier;
  id WeakRetained;
  uint64_t v149;
  id v150;
  HDWorkoutSessionEntity *persistentEntity;
  void *v152;
  id v153;
  void *v154;
  int v155;
  id v156;
  NSObject *v157;
  NSObject *v158;
  id v159;
  NSObject *v160;
  NSUUID *v161;
  HKWorkoutConfiguration *workoutConfiguration;
  id v163;
  uint64_t v164;
  HDWorkoutSessionEntity *v165;
  NSObject *v166;
  NSObject *v167;
  HDWorkoutSessionRapportSyncController *v168;
  id v169;
  void *v170;
  uint64_t v171;
  HDWorkoutSessionRapportSyncController *syncController;
  NSObject *v173;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  id *p_workoutConfiguration;
  void *v180;
  void *v181;
  id *location;
  id v183;
  void *v184;
  void *v185;
  id v186;
  void *v187;
  id obj;
  void *v189;
  _QWORD v190[4];
  HDWorkoutSessionServer *v191;
  objc_super v192;
  id v193;
  id v194;
  _QWORD v195[5];
  id v196;
  _QWORD v197[5];
  id v198;
  _QWORD v199[5];
  id v200;
  _BYTE block[24];
  void *v202;
  HDWorkoutSessionServer *v203;
  _QWORD *v204;
  _QWORD *v205;
  _BYTE buf[24];
  HDWorkoutSessionServer *v207;
  __int128 v208;
  _QWORD *v209;
  _QWORD *v210;
  uint64_t v211;

  v211 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v183 = a4;
  v186 = a5;
  v192.receiver = self;
  v192.super_class = (Class)HDWorkoutSessionServer;
  v8 = -[HDWorkoutSessionServer init](&v192, sel_init);
  v9 = v8;
  if (v8)
  {
    location = (id *)&v8->_profile;
    objc_storeWeak((id *)&v8->_profile, obj);
    HKCreateSerialDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc(MEMORY[0x1E0CB6988]);
    v13 = objc_msgSend(v12, "initWithName:loggingCategory:", CFSTR("sessionserver-observers"), *MEMORY[0x1E0CB5380]);
    observers = v9->_observers;
    v9->_observers = (HKObserverSet *)v13;

    p_workoutConfiguration = (id *)&v9->_workoutConfiguration;
    objc_storeStrong((id *)&v9->_workoutConfiguration, a4);
    objc_storeStrong((id *)&v9->_identifier, a5);
    firstActivityConfiguration = v9->_firstActivityConfiguration;
    v9->_firstActivityConfiguration = 0;

    v9->_numberOfHeartbeatFailures = 0;
    v16 = *(double *)&_defaultUnitTestStopEventWaitInterval;
    if (!_HDIsUnitTesting)
      v16 = 20.0;
    v9->_stopEventGenerationWaitInterval = v16;
    v9->_extendedPauseTimeout = 900.0;
    if (-[HDWorkoutSessionServer sessionType](v9, "sessionType") != 1)
    {
      v176 = v186;
      v17 = objc_opt_self();
      v18 = objc_alloc(MEMORY[0x1E0CB6C40]);
      objc_msgSend(MEMORY[0x1E0CB6C40], "nameForOwner:UUID:tag:", v17, v176, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)objc_msgSend(v18, "initWithName:", v19);
      objc_msgSend(v20, "addStateWithIndex:label:", 1, CFSTR("NotStarted"));
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 2, CFSTR("CheckingAllowedPrepare"));
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 3, CFSTR("CheckingAllowedStart"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 4, CFSTR("Preparing"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 5, CFSTR("Starting"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 6, CFSTR("Prepared"));
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 7, CFSTR("Running"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 8, CFSTR("Paused"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 9, CFSTR("AutoPaused"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 17, CFSTR("ExtendedPause"));
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 10, CFSTR("AwaitingStopEvent"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 11, CFSTR("AwaitingFinalData"));
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 12, CFSTR("FinalizeActivity"));
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 13, CFSTR("Stopped"));
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 14, CFSTR("StoppedHeartRateRecovery"));
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 15, CFSTR("HeartRateRecovery"));
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addStateWithIndex:label:", 16, CFSTR("Finished"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v189, v22, 100, CFSTR("allow-session"));
      v30 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v21, v23, 100, CFSTR("allow-session"));
      v31 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v22, v187, 101, CFSTR("become-current"));
      v32 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v23, v24, 101, CFSTR("become-current"));
      v33 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v24, v26, 103, CFSTR("auto-pause"));
      v34 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v26, v24, 104, CFSTR("auto-resume"));
      v35 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v27, v175, 105, CFSTR("receive-stop-event"));
      v36 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v175, v177, 106, CFSTR("retrieved-final-data"));
      v37 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v181, v178, 107, CFSTR("end-heart-recovery"));
      v38 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v180, v28, 107, CFSTR("end-heart-recovery"));
      v39 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v189, v28, 102, CFSTR("resign-current"));
      v40 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v21, v28, 102, CFSTR("resign-current"));
      v41 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v22, v28, 102, CFSTR("resign-current"));
      v42 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v23, v28, 102, CFSTR("resign-current"));
      v43 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v187, v28, 102, CFSTR("resign-current"));
      v44 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v24, v27, 102, CFSTR("resign-current"));
      v45 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v26, v27, 102, CFSTR("resign-current"));
      v46 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v25, v28, 102, CFSTR("resign-current"));
      v47 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v184, v28, 102, CFSTR("resign-current"));
      v48 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v178, v28, 102, CFSTR("resign-current"));
      v49 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v181, v28, 102, CFSTR("resign-current"));
      v50 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v180, v28, 102, CFSTR("resign-current"));
      v51 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v185, v189, 5, CFSTR("target-prepared"));
      v52 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v185, v21, 2, CFSTR("target-running"));
      v53 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v185, v21, 4, CFSTR("target-paused"));
      v54 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v185, v21, 6, CFSTR("target-stopped"));
      v55 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v185, v28, 3, CFSTR("target-ended"));
      v56 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v189, v21, 2, CFSTR("target-running"));
      v57 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v189, v21, 4, CFSTR("target-paused"));
      v58 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v189, v21, 6, CFSTR("target-stopped"));
      v59 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v189, v28, 3, CFSTR("target-ended"));
      v60 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v21, v23, 4, CFSTR("target-paused"));
      v61 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v21, v23, 6, CFSTR("target-stopped"));
      v62 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v21, v28, 3, CFSTR("target-ended"));
      v63 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v22, v23, 2, CFSTR("target-running"));
      v64 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v22, v23, 4, CFSTR("target-paused"));
      v65 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v22, v23, 6, CFSTR("target-stopped"));
      v66 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v22, v28, 3, CFSTR("target-ended"));
      v67 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v187, v24, 2, CFSTR("target-running"));
      v68 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v187, v24, 4, CFSTR("target-paused"));
      v69 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v187, v24, 6, CFSTR("target-stopped"));
      v70 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v187, v28, 3, CFSTR("target-ended"));
      v71 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v23, v28, 3, CFSTR("target-ended"));
      v72 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v24, v25, 4, CFSTR("target-paused"));
      v73 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v26, v25, 4, CFSTR("target-paused"));
      v74 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v25, v184, 108, CFSTR("target-extended-paused"));
      v75 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v25, v24, 2, CFSTR("target-running"));
      v76 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v184, v24, 2, CFSTR("target-running"));
      v77 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v24, v27, 6, CFSTR("target-stopped"));
      v78 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v25, v27, 6, CFSTR("target-stopped"));
      v79 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v26, v27, 6, CFSTR("target-stopped"));
      v80 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v184, v27, 6, CFSTR("target-stopped"));
      v81 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v24, v27, 3, CFSTR("target-ended"));
      v82 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v25, v27, 3, CFSTR("target-ended"));
      v83 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v26, v27, 3, CFSTR("target-ended"));
      v84 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v184, v27, 3, CFSTR("target-ended"));
      v85 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v178, v28, 3, CFSTR("target-ended"));
      v86 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v181, v180, 3, CFSTR("target-ended"));
      v87 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v177, v181, 6, CFSTR("target-stop"));
      v88 = (id)objc_msgSend(v20, "addStateTransitionFrom:to:event:label:", v177, v180, 3, CFSTR("target-end"));

      stateMachine = v9->_stateMachine;
      v9->_stateMachine = (HKStateMachine *)v20;

      -[HKStateMachine setDelegate:](v9->_stateMachine, "setDelegate:", v9);
      v90 = v176;
      v91 = objc_opt_self();
      v92 = objc_alloc(MEMORY[0x1E0CB6C40]);
      objc_msgSend(MEMORY[0x1E0CB6C40], "nameForOwner:UUID:tag:", v91, v90, CFSTR("target"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      v94 = (void *)objc_msgSend(v92, "initWithName:", v93);
      objc_msgSend(v94, "addStateWithIndex:label:", 1, CFSTR("NotStarted"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "addStateWithIndex:label:", 2, CFSTR("Running"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "addStateWithIndex:label:", 3, CFSTR("Ended"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "addStateWithIndex:label:", 4, CFSTR("Paused"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "addStateWithIndex:label:", 5, CFSTR("Prepared"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "addStateWithIndex:label:", 6, CFSTR("Stopped"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v95, v96, 2, CFSTR("running"));
      v102 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v95, v98, 4, CFSTR("paused"));
      v103 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v95, v97, 3, CFSTR("ended"));
      v104 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v95, v99, 5, CFSTR("prepared"));
      v105 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v95, v100, 6, CFSTR("stopped"));
      v106 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v99, v96, 2, CFSTR("running"));
      v107 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v99, v98, 4, CFSTR("paused"));
      v108 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v99, v97, 3, CFSTR("ended"));
      v109 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v99, v100, 6, CFSTR("stopped"));
      v110 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v96, v98, 4, CFSTR("paused"));
      v111 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v96, v97, 3, CFSTR("ended"));
      v112 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v96, v100, 6, CFSTR("stopped"));
      v113 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v96, v96, 2, CFSTR("running"));
      v114 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v98, v96, 2, CFSTR("running"));
      v115 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v98, v97, 3, CFSTR("ended"));
      v116 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v98, v100, 6, CFSTR("stopped"));
      v117 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v98, v98, 4, CFSTR("paused"));
      v118 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v100, v97, 3, CFSTR("ended"));
      v119 = (id)objc_msgSend(v94, "addStateTransitionFrom:to:event:label:", v100, v100, 6, CFSTR("stopped"));

      targetStateMachine = v9->_targetStateMachine;
      v9->_targetStateMachine = (HKStateMachine *)v94;

      -[HKStateMachine setDelegate:](v9->_targetStateMachine, "setDelegate:", v9);
    }
    _HKInitializeLogging();
    v121 = objc_alloc(MEMORY[0x1E0CB6588]);
    v122 = objc_msgSend(v121, "initWithProcessor:sourceProtocol:destinationProtocol:loggingCategory:", v9, &unk_1EF1A1298, &unk_1EF1B99A8, *MEMORY[0x1E0CB5380]);
    workoutDataFlowLink = v9->_workoutDataFlowLink;
    v9->_workoutDataFlowLink = (HKDataFlowLink *)v122;

    _HKInitializeLogging();
    v124 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v125 = v124;
      v126 = (objc_class *)objc_opt_class();
      NSStringFromClass(v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v129 = (void *)MEMORY[0x1E0CB3940];
      -[HKWorkoutConfiguration activityType](v9->_workoutConfiguration, "activityType");
      _HKWorkoutActivityNameForActivityType();
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "stringWithFormat:", CFSTR("activity=%@"), v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "addObject:", v131);

      v132 = (void *)MEMORY[0x1E0CB3940];
      -[HKWorkoutConfiguration locationType](v9->_workoutConfiguration, "locationType");
      _HKWorkoutSessionLocationTypeName();
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "stringWithFormat:", CFSTR("location=%@"), v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "addObject:", v134);

      -[HKWorkoutConfiguration fitnessMachineSessionUUID](v9->_workoutConfiguration, "fitnessMachineSessionUUID");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      if (v135)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ftm_session=%@"), v135);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "addObject:", v136);

      }
      if (objc_msgSend(*p_workoutConfiguration, "activityType") == 46)
      {
        v137 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*p_workoutConfiguration, "swimmingLocationType");
        _HKWorkoutSwimmingLocationTypeName();
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "stringWithFormat:", CFSTR("swimming_location=%@"), v138);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "addObject:", v139);

      }
      objc_msgSend(*p_workoutConfiguration, "lapLength");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      if (v140)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lap_length=%@"), v140);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "addObject:", v141);

      }
      objc_msgSend(*p_workoutConfiguration, "predictionSessionUUID");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      if (v142)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("prediction_uuiud=%@"), v142);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "addObject:", v143);

      }
      objc_msgSend(v128, "componentsJoinedByString:", CFSTR(", "));
      v144 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v127;
      *(_WORD *)&buf[22] = 2048;
      v207 = v9;
      LOWORD(v208) = 2114;
      *(_QWORD *)((char *)&v208 + 2) = v144;
      _os_log_impl(&dword_1B7802000, v125, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0, #init) %{public}@:%p { %{public}@ }", buf, 0x2Au);

    }
    v145 = -[HDWorkoutSessionServer sessionType](v9, "sessionType");
    v146 = MEMORY[0x1E0C809B0];
    if (v145 == 1)
      goto LABEL_34;
    identifier = v9->_identifier;
    WeakRetained = objc_loadWeakRetained(location);
    v193 = 0;
    +[HDWorkoutSessionEntity lookupSessionWithIdentifier:profile:error:](HDWorkoutSessionEntity, "lookupSessionWithIdentifier:profile:error:", identifier, WeakRetained, &v193);
    v149 = objc_claimAutoreleasedReturnValue();
    v150 = v193;
    persistentEntity = v9->_persistentEntity;
    v9->_persistentEntity = (HDWorkoutSessionEntity *)v149;

    if (v9->_persistentEntity)
    {
      v199[0] = 0;
      v199[1] = v199;
      v199[2] = 0x3032000000;
      v199[3] = __Block_byref_object_copy__188;
      v199[4] = __Block_byref_object_dispose__188;
      v200 = 0;
      v197[0] = 0;
      v197[1] = v197;
      v197[2] = 0x3032000000;
      v197[3] = __Block_byref_object_copy__188;
      v197[4] = __Block_byref_object_dispose__188;
      v198 = 0;
      v195[0] = 0;
      v195[1] = v195;
      v195[2] = 0x3032000000;
      v195[3] = __Block_byref_object_copy__188;
      v195[4] = __Block_byref_object_dispose__188;
      v196 = 0;
      v152 = (void *)objc_opt_class();
      v153 = objc_loadWeakRetained(location);
      objc_msgSend(v153, "database");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v194 = 0;
      *(_QWORD *)buf = v146;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __48__HDWorkoutSessionServer__recoverPersistedState__block_invoke;
      v207 = (HDWorkoutSessionServer *)&unk_1E6D0DC60;
      *(_QWORD *)&v208 = v9;
      *((_QWORD *)&v208 + 1) = v199;
      v209 = v197;
      v210 = v195;
      v155 = objc_msgSend(v152, "performReadTransactionWithHealthDatabase:error:block:", v154, &v194, buf);
      v156 = v194;

      if (v155)
      {
        v157 = v9->_queue;
        *(_QWORD *)block = v146;
        *(_QWORD *)&block[8] = 3221225472;
        *(_QWORD *)&block[16] = __48__HDWorkoutSessionServer__recoverPersistedState__block_invoke_2;
        v202 = &unk_1E6CF1308;
        v203 = v9;
        v204 = v199;
        v205 = v197;
        dispatch_sync(v157, block);
      }
      else
      {
        _HKInitializeLogging();
        v158 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)block = 138543618;
          *(_QWORD *)&block[4] = v9;
          *(_WORD *)&block[12] = 2114;
          *(_QWORD *)&block[14] = v156;
          _os_log_error_impl(&dword_1B7802000, v158, OS_LOG_TYPE_ERROR, "%{public}@: Failed to recover persisted session state: %{public}@", block, 0x16u);
        }
      }

      _Block_object_dispose(v195, 8);
      _Block_object_dispose(v197, 8);

      _Block_object_dispose(v199, 8);
      if ((v155 & 1) != 0)
      {
        v159 = v150;
LABEL_33:

LABEL_34:
        v168 = [HDWorkoutSessionRapportSyncController alloc];
        v169 = objc_loadWeakRetained(location);
        objc_msgSend(v169, "rapportMessenger");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        v171 = -[HDWorkoutSessionRapportSyncController initWithRapportMessenger:sessionServer:](v168, "initWithRapportMessenger:sessionServer:", v170, v9);
        syncController = v9->_syncController;
        v9->_syncController = (HDWorkoutSessionRapportSyncController *)v171;

        v173 = v9->_queue;
        v190[0] = v146;
        v190[1] = 3221225472;
        v190[2] = __68__HDWorkoutSessionServer_initWithProfile_configuration_sessionUUID___block_invoke;
        v190[3] = &unk_1E6CE80E8;
        v191 = v9;
        dispatch_sync(v173, v190);

        goto LABEL_35;
      }
      if (v150)
        goto LABEL_27;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to recover persisted state for session %@"), v9->_identifier);
      v150 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (!v150)
    {
LABEL_29:
      v161 = v9->_identifier;
      workoutConfiguration = v9->_workoutConfiguration;
      v163 = objc_loadWeakRetained(location);
      *(_QWORD *)block = v150;
      +[HDWorkoutSessionEntity createSessionWithIdentifier:source:configuration:state:profile:error:](HDWorkoutSessionEntity, "createSessionWithIdentifier:source:configuration:state:profile:error:", v161, 0, workoutConfiguration, 1, v163, block);
      v164 = objc_claimAutoreleasedReturnValue();
      v159 = *(id *)block;

      v165 = v9->_persistentEntity;
      v9->_persistentEntity = (HDWorkoutSessionEntity *)v164;

      if (!v9->_persistentEntity)
      {
        _HKInitializeLogging();
        v166 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v9;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v159;
          _os_log_error_impl(&dword_1B7802000, v166, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create workout session entity: %{public}@", buf, 0x16u);
        }
      }
      v167 = v9->_queue;
      *(_QWORD *)buf = v146;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __55__HDWorkoutSessionServer__loadOrCreatePersistentEntity__block_invoke;
      v207 = (HDWorkoutSessionServer *)&unk_1E6CE80E8;
      *(_QWORD *)&v208 = v9;
      dispatch_sync(v167, buf);
      goto LABEL_33;
    }
LABEL_27:
    _HKInitializeLogging();
    v160 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v150;
      _os_log_error_impl(&dword_1B7802000, v160, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup existing workout session entity: %{public}@", buf, 0x16u);
    }
    goto LABEL_29;
  }
LABEL_35:

  return v9;
}

void __68__HDWorkoutSessionServer_initWithProfile_configuration_sessionUUID___block_invoke(uint64_t a1)
{
  -[HDWorkoutSessionServer _queue_startInvalidationTimer](*(_QWORD *)(a1 + 32));
}

- (void)_queue_startInvalidationTimer
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  id location;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _HKInitializeLogging();
    v2 = (os_log_t *)MEMORY[0x1E0CB5380];
    v3 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = a1;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning invalidation timer.", buf, 0xCu);
    }
    objc_initWeak(&location, (id)a1);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6F98]), "initWithQueue:completion:", *(_QWORD *)(a1 + 16), &__block_literal_global_509);
    v5 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = v4;

    v6 = *(void **)(a1 + 96);
    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __55__HDWorkoutSessionServer__queue_startInvalidationTimer__block_invoke_2;
    v20[3] = &unk_1E6CECE78;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v6, "startWithTimeoutInterval:handler:", v20, 300.0);
    objc_msgSend(*(id *)(a1 + 104), "invalidate");
    v8 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = 0;

    if (*(_QWORD *)(a1 + 232))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "daemon");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "processStateManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "processIdentifierForApplicationIdentifier:", *(_QWORD *)(a1 + 232));

      if ((_DWORD)v12 == -1)
      {
        _HKInitializeLogging();
        v17 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
        {
          v18 = *(_QWORD *)(a1 + 232);
          *(_DWORD *)buf = 138543362;
          v24 = v18;
          _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "Unable to get pid for %{public}@", buf, 0xCu);
        }
      }
      else
      {
        _HKInitializeLogging();
        v13 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
        {
          v14 = *(_QWORD *)(a1 + 232);
          *(_DWORD *)buf = 138543362;
          v24 = v14;
          _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_INFO, "Taking reconnection assertion for process %{public}@", buf, 0xCu);
        }
        v19[0] = v7;
        v19[1] = 3221225472;
        v19[2] = __55__HDWorkoutSessionServer__queue_startInvalidationTimer__block_invoke_513;
        v19[3] = &unk_1E6CEEA30;
        v19[4] = a1;
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFE308]), "initWithPID:flags:reason:name:withHandler:", v12, 3, 19, CFSTR("HealthKit Background Workout (Reconnect)"), v19);
        v16 = *(void **)(a1 + 104);
        *(_QWORD *)(a1 + 104) = v15;

      }
    }
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[BKSProcessAssertion invalidate](self->_invalidationAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDWorkoutSessionServer;
  -[HDWorkoutSessionServer dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDWorkoutSessionServer identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_shortRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDWorkoutSessionServer state](self, "state");
  _HKWorkoutSessionServerStateToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDWorkoutSessionServer sessionType](self, "sessionType");
  HKWorkoutSessionTypeToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@-%@ [%@] [%@]>"), v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (int64_t)state
{
  void *v2;
  int64_t v3;

  -[HKStateMachine currentState](self->_stateMachine, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "index");

  return v3;
}

- (BOOL)isActive
{
  unint64_t v2;

  v2 = -[HDWorkoutSessionServer state](self, "state");
  return (v2 < 0x12) & (0x21FF0u >> v2);
}

- (BOOL)canBePaused
{
  unint64_t v2;

  v2 = -[HDWorkoutSessionServer state](self, "state");
  return (v2 < 0xA) & (0x2A0u >> v2);
}

- (BOOL)isGymKit
{
  void *v2;
  BOOL v3;

  -[HKWorkoutConfiguration fitnessMachineSessionUUID](self->_workoutConfiguration, "fitnessMachineSessionUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isPaused
{
  return -[HDWorkoutSessionServer state](self, "state") == 8
      || -[HDWorkoutSessionServer state](self, "state") == 9
      || -[HDWorkoutSessionServer state](self, "state") == 17;
}

- (HDHealthStoreClient)client
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_taskServer);
  objc_msgSend(WeakRetained, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HDHealthStoreClient *)v3;
}

- (void)setTaskServer:(id)a3
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
  block[2] = __40__HDWorkoutSessionServer_setTaskServer___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);
  HKDispatchAsyncOnGlobalConcurrentQueue();

}

void __40__HDWorkoutSessionServer_setTaskServer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  os_log_t *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  BOOL (*v41)(_QWORD *, void *, uint64_t);
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 240), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    if (!v2)
      goto LABEL_23;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 240));
    objc_msgSend(WeakRetained, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "process");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "applicationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    v8 = *(void **)(v2 + 232);
    *(_QWORD *)(v2 + 232) = v7;

    v9 = objc_loadWeakRetained((id *)(v2 + 240));
    objc_msgSend(v9, "clientSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    v12 = *(void **)(v2 + 256);
    *(_QWORD *)(v2 + 256) = v11;

    objc_msgSend(v5, "applicationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(id *)(v2 + 256);
    v16 = *(void **)(v2 + 24);
    v17 = (os_log_t *)MEMORY[0x1E0CB5380];
    if (v16 != v14 && (!v14 || !objc_msgSend(v16, "isEqualToString:", v14))
      || (v18 = *(void **)(v2 + 232), v18 != v13) && (!v13 || (objc_msgSend(v18, "isEqualToString:", v13) & 1) == 0))
    {
      _HKInitializeLogging();
      v19 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(v2 + 232);
        *(_DWORD *)buf = 138543874;
        v48 = v2;
        v49 = 2114;
        v50 = v20;
        v51 = 2114;
        v52 = v13;
        _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Client application identifier change: %{public}@ -> %{public}@", buf, 0x20u);
      }
      _HKInitializeLogging();
      v21 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(_QWORD *)(v2 + 24);
        *(_DWORD *)buf = 138543874;
        v48 = v2;
        v49 = 2114;
        v50 = v22;
        v51 = 2114;
        v52 = v14;
        _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Client process bundle identifier change: %{public}@ -> %{public}@", buf, 0x20u);
      }
      v23 = objc_opt_class();
      v24 = objc_loadWeakRetained((id *)(v2 + 8));
      objc_msgSend(v24, "database");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      *(_QWORD *)&v40 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v40 + 1) = 3221225472;
      v41 = __55__HDWorkoutSessionServer__queue_cacheClientIdentifiers__block_invoke;
      v42 = &unk_1E6CF26F8;
      v43 = v2;
      v38 = v15;
      v44 = v15;
      v26 = v14;
      v45 = v26;
      v27 = v13;
      v46 = v27;
      LOBYTE(v23) = objc_msgSend((id)v23, "performWriteTransactionWithHealthDatabase:error:block:", v25, &v39, &v40);
      v37 = v39;

      if ((v23 & 1) == 0)
      {
        _HKInitializeLogging();
        v28 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v48 = v2;
          _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Failed to record client process bundle identifier and source. Client may not correctly recover after a full crash.", buf, 0xCu);
        }
      }
      v29 = objc_msgSend(v26, "copy");
      v30 = *(void **)(v2 + 24);
      *(_QWORD *)(v2 + 24) = v29;

      v31 = objc_msgSend(v27, "copy");
      v32 = *(void **)(v2 + 232);
      *(_QWORD *)(v2 + 232) = v31;

      v17 = (os_log_t *)MEMORY[0x1E0CB5380];
      v15 = v38;
    }

    v33 = *(_QWORD *)(a1 + 32);
    if (v33)
    {
      _HKInitializeLogging();
      v34 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v40) = 138543362;
        *(_QWORD *)((char *)&v40 + 4) = v33;
        _os_log_impl(&dword_1B7802000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping invalidation timer.", (uint8_t *)&v40, 0xCu);
      }
      objc_msgSend(*(id *)(v33 + 96), "invalidate");
      objc_msgSend(*(id *)(v33 + 104), "invalidate");
      v35 = *(void **)(v33 + 104);
      *(_QWORD *)(v33 + 104) = 0;

      v36 = *(_QWORD *)(a1 + 32);
    }
    else
    {
LABEL_23:
      v36 = 0;
    }
    -[HDWorkoutSessionServer _queue_setupSessionController](v36);
    -[HDWorkoutSessionServer _queue_startLatestActivityUpdateTimer](*(dispatch_queue_t **)(a1 + 32));
  }
  else
  {
    -[HDWorkoutSessionServer _queue_startInvalidationTimer](*(_QWORD *)(a1 + 32));
  }
}

- (void)_queue_setupSessionController
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  char v6;
  id v7;
  char v8;
  id v9;
  char v10;
  HDWorkoutSessionConfiguration *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  objc_class *v16;
  os_log_t *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _BOOL4 v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id WeakRetained;
  HDWorkoutSessionConfiguration *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _BYTE buf[24];
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (!objc_msgSend((id)a1, "sessionType"))
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
      v42 = [HDWorkoutSessionConfiguration alloc];
      objc_msgSend((id)a1, "identifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *(_QWORD *)(a1 + 224);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 240));
      v38 = objc_msgSend(WeakRetained, "sessionType");
      v40 = objc_loadWeakRetained((id *)(a1 + 240));
      objc_msgSend(v40, "client");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(a1 + 24);
      v4 = *(_QWORD *)(a1 + 232);
      v5 = objc_loadWeakRetained((id *)(a1 + 240));
      v6 = objc_msgSend(v5, "requiresCoreLocationAssertion");
      v7 = objc_loadWeakRetained((id *)(a1 + 240));
      v8 = objc_msgSend(v7, "supportsAppRelaunchForRecovery");
      v9 = objc_loadWeakRetained((id *)(a1 + 240));
      v10 = objc_msgSend(v9, "supports3rdPartyAOT");
      BYTE3(v37) = objc_msgSend((id)a1, "isFirstParty");
      BYTE2(v37) = v10;
      BYTE1(v37) = v8;
      LOBYTE(v37) = v6;
      v11 = -[HDWorkoutSessionConfiguration initWithSessionIdentifier:workoutConfiguration:sessionType:client:processBundleIdentifier:applicationIdentifier:requiresCoreLocationAssertion:supportsAppRelaunchForRecovery:supports3rdPartyAOT:enableWorkoutChangeDetection:activityConfigurations:](v42, "initWithSessionIdentifier:workoutConfiguration:sessionType:client:processBundleIdentifier:applicationIdentifier:requiresCoreLocationAssertion:supportsAppRelaunchForRecovery:supports3rdPartyAOT:enableWorkoutChangeDetection:activityConfigurations:", v43, v39, v38, v2, v3, v4, v37, *(_QWORD *)(a1 + 264));

      v12 = *(void **)(a1 + 88);
      if (v12)
      {
        objc_msgSend(v12, "workoutSessionServer:didChangeConfiguration:", a1, v11);
      }
      else
      {
        v13 = *(void **)(a1 + 224);
        v14 = *(void **)(a1 + 232);
        v15 = objc_loadWeakRetained((id *)(a1 + 8));
        v16 = (objc_class *)+[HDWorkoutSessionServer _sessionControllerClassFromWorkoutConfiguration:clientApplicationIdentifier:profile:]((uint64_t)HDWorkoutSessionServer, v13, v14, v15);

        _HKInitializeLogging();
        v17 = (os_log_t *)MEMORY[0x1E0CB5380];
        v18 = (void *)*MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          v19 = v18;
          NSStringFromClass(v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v20;
          _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Creating session controller of class %{public}@", buf, 0x16u);

        }
        -[objc_class recoveryIdentifier](v16, "recoveryIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          v44 = 0;
          v23 = v21;
          v45 = 0;
          v46 = &v45;
          v47 = 0x3032000000;
          v48 = __Block_byref_object_copy__188;
          v49 = __Block_byref_object_dispose__188;
          v50 = 0;
          v24 = objc_loadWeakRetained((id *)(a1 + 8));
          objc_msgSend(v24, "database");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __85__HDWorkoutSessionServer__retrieveSessionControllerStateForRecoveryIdentifier_error___block_invoke;
          v52 = &unk_1E6CEB640;
          v26 = v23;
          v53 = v26;
          v54 = a1;
          v55 = &v45;
          v27 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDWorkoutSessionControllerEntity, "performReadTransactionWithHealthDatabase:error:block:", v25, &v44, buf);

          if (v27)
            v28 = (void *)v46[5];
          else
            v28 = 0;
          v29 = v28;

          _Block_object_dispose(&v45, 8);
          v30 = v44;
          v31 = v30;
          if (!v29 && v30)
          {
            _HKInitializeLogging();
            v32 = *v17;
            if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = a1;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v31;
              _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve recovery state with error: %{public}@", buf, 0x16u);
            }
          }

        }
        else
        {
          v29 = 0;
        }
        v33 = [v16 alloc];
        v34 = objc_loadWeakRetained((id *)(a1 + 8));
        v35 = objc_msgSend(v33, "initWithProfile:sessionConfiguration:sessionStateController:recoveryState:", v34, v11, a1, v29);
        v36 = *(void **)(a1 + 88);
        *(_QWORD *)(a1 + 88) = v35;

        objc_msgSend(*(id *)(a1 + 88), "workoutSessionServer:didTransitionFromState:toState:date:", a1, 1, objc_msgSend((id)a1, "state"), 0);
      }

    }
  }
}

- (void)_queue_startLatestActivityUpdateTimer
{
  NSObject *v2;
  NSObject *v3;
  dispatch_source_t v4;
  dispatch_queue_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD handler[4];
  id v10;
  uint8_t buf[4];
  dispatch_queue_t *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = a1;
      _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting latest activity update timer.", buf, 0xCu);
    }
    objc_initWeak((id *)buf, a1);
    v3 = a1[21];
    if (v3)
      dispatch_source_cancel(v3);
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, a1[2]);
    v5 = a1[21];
    a1[21] = v4;

    v6 = a1[21];
    v7 = dispatch_walltime(0, 180000000000);
    dispatch_source_set_timer(v6, v7, 0x29E8D60800uLL, 0x3B9ACA00uLL);
    v8 = a1[21];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __63__HDWorkoutSessionServer__queue_startLatestActivityUpdateTimer__block_invoke;
    handler[3] = &unk_1E6CECE78;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_source_set_event_handler(v8, handler);
    dispatch_activate(a1[21]);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __40__HDWorkoutSessionServer_setTaskServer___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("HDWorkoutManagerStateDidChange"), 0);

}

- (void)invalidateTaskServer:(id)a3
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
  block[2] = __47__HDWorkoutSessionServer_invalidateTaskServer___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);
  HKDispatchAsyncOnGlobalConcurrentQueue();

}

void __47__HDWorkoutSessionServer_invalidateTaskServer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));
  v3 = *(id *)(a1 + 40);

  if (WeakRetained == v3)
  {
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 240), 0);
    -[HDWorkoutSessionServer _queue_startInvalidationTimer](*(_QWORD *)(a1 + 32));
  }
}

void __47__HDWorkoutSessionServer_invalidateTaskServer___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("HDWorkoutManagerStateDidChange"), 0);

}

- (void)setAssociatedWorkoutBuilderEntity:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  HDWorkoutSessionServer *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__HDWorkoutSessionServer_setAssociatedWorkoutBuilderEntity___block_invoke;
  v12[3] = &unk_1E6CE7950;
  v12[4] = self;
  v8 = v4;
  v13 = v8;
  v9 = objc_msgSend(v5, "performWriteTransactionWithHealthDatabase:error:block:", v7, &v14, v12);
  v10 = v14;

  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v10;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save associated workout builder entity: %{public}@", buf, 0x16u);
    }
  }

}

uint64_t __60__HDWorkoutSessionServer_setAssociatedWorkoutBuilderEntity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setAssociatedBuilder:transaction:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (void)setWorkoutDataAccumulator:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HDWorkoutSessionServer_setWorkoutDataAccumulator___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __52__HDWorkoutSessionServer_setWorkoutDataAccumulator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "workoutSessionServer:accumulatorDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 80);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__HDWorkoutSessionServer_setWorkoutDataAccumulator___block_invoke_2;
  v5[3] = &unk_1E6D0DC38;
  v5[4] = v2;
  v6 = v3;
  objc_msgSend(v4, "notifyObservers:", v5);

}

void __52__HDWorkoutSessionServer_setWorkoutDataAccumulator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "workoutSession:didUpdateDataAccumulator:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)currentWorkoutSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _BOOL8 v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[HDWorkoutSessionServer isActive](self, "isActive"))
  {
    -[HDWorkoutSessionServer client](self, "client");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "process");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "isExtension") & 1) != 0)
      objc_msgSend(v4, "containerAppBundleIdentifier");
    else
      objc_msgSend(v4, "applicationIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutSessionServer workoutDataAccumulator](self, "workoutDataAccumulator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDWorkoutSessionServer workoutDataAccumulator](self, "workoutDataAccumulator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v4;
    if (v8)
    {
      _HKCalculateWorkoutDuration();
      v12 = v11;
    }
    else
    {
      v12 = 0.0;
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v10, "reverseObjectEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
LABEL_11:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
        v19 = objc_msgSend(v18, "workoutEventType");
        v20 = v19 == 1;
        if (v19 == 1 || objc_msgSend(v18, "workoutEventType") == 2)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          v20 = 0;
          if (v15)
            goto LABEL_11;
          break;
        }
      }
    }
    else
    {
      v20 = 0;
    }

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6F48]), "_initWithSessionIdentifier:workoutConfiguration:sessionServerState:isBuilderPaused:applicationIdentifier:elapsedTime:snapshotDate:builderStartDate:", self->_identifier, self->_workoutConfiguration, -[HDWorkoutSessionServer state](self, "state"), v20, v22, v6, v12, v8);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (int64_t)sessionType
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_taskServer);
  v3 = objc_msgSend(WeakRetained, "sessionType");

  return v3;
}

- (BOOL)isFirstParty
{
  return -[NSString isEqualToString:](self->_applicationIdentifier, "isEqualToString:", CFSTR("com.apple.SessionTrackerApp"))|| -[HDHealthStoreClient hasEntitlement:](self->_client, "hasEntitlement:", *MEMORY[0x1E0CB4A90]);
}

- (BOOL)shouldStopPreviousSession
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_taskServer);
  v3 = objc_msgSend(WeakRetained, "shouldStopPreviousSession");

  return v3;
}

- (HKWorkoutConfiguration)currentActivityConfiguration
{
  void *workoutConfiguration;
  void *v4;
  HKWorkoutConfiguration *v5;

  -[HKWorkoutActivity workoutConfiguration](self->_currentActivity, "workoutConfiguration");
  workoutConfiguration = (void *)objc_claimAutoreleasedReturnValue();
  v4 = workoutConfiguration;
  if (!workoutConfiguration)
    workoutConfiguration = self->_workoutConfiguration;
  v5 = workoutConfiguration;

  return v5;
}

uint64_t __55__HDWorkoutSessionServer__loadOrCreatePersistentEntity__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "enterAtState:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "enterAtState:", 1);
}

uint64_t __48__HDWorkoutSessionServer__recoverPersistedState__block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  BOOL v75;
  void *v76;
  void *v77;
  void *v78;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id WeakRetained;
  uint64_t v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;

  v5 = a2;
  objc_msgSend(*(id *)(a1[4] + 112), "requestedTargetStateWithTransaction:error:", v5, a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    objc_msgSend(*(id *)(a1[4] + 112), "stateWithTransaction:error:", v5, a3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[6] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    {
      objc_msgSend(*(id *)(a1[4] + 112), "isMirroringInTransaction:error:", v5, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12)
      {
        v22 = 0;
LABEL_73:

        goto LABEL_74;
      }
      *(_BYTE *)(a1[4] + 64) = objc_msgSend(v12, "BOOLValue");
      objc_msgSend(*(id *)(a1[4] + 112), "hasFailedInTransaction:error:", v5, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14)
      {
        v22 = 0;
LABEL_72:

        goto LABEL_73;
      }
      *(_BYTE *)(a1[4] + 152) = objc_msgSend(v14, "BOOLValue");
      v16 = *(void **)(a1[4] + 112);
      v98 = 0;
      objc_msgSend(v16, "requestedStartDateInTransaction:error:", v5, &v98);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v98;
      v19 = a1[4];
      v20 = *(void **)(v19 + 184);
      *(_QWORD *)(v19 + 184) = v17;

      v21 = a1[4];
      if (!*(_QWORD *)(v21 + 184) && v18)
      {
        if (a3)
        {
          v22 = 0;
          *a3 = objc_retainAutorelease(v18);
        }
        else
        {
          _HKLogDroppedError();
          v22 = 0;
        }
        goto LABEL_71;
      }
      v23 = *(void **)(v21 + 112);
      v97 = 0;
      objc_msgSend(v23, "startDateInTransaction:error:", v5, &v97);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v97;
      v26 = a1[4];
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v24;

      v28 = a1[4];
      if (!*(_QWORD *)(v28 + 40) && v25)
      {
        if (a3)
        {
          v22 = 0;
          *a3 = objc_retainAutorelease(v25);
        }
        else
        {
          _HKLogDroppedError();
          v22 = 0;
        }
        goto LABEL_70;
      }
      v29 = *(void **)(v28 + 112);
      v96 = 0;
      objc_msgSend(v29, "requestedEndDateInTransaction:error:", v5, &v96);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v96;
      v32 = a1[4];
      v33 = *(void **)(v32 + 192);
      *(_QWORD *)(v32 + 192) = v30;

      v34 = a1[4];
      if (!*(_QWORD *)(v34 + 192) && v31)
      {
        if (a3)
        {
          v22 = 0;
          *a3 = objc_retainAutorelease(v31);
        }
        else
        {
          _HKLogDroppedError();
          v22 = 0;
        }
        goto LABEL_69;
      }
      v35 = *(void **)(v34 + 112);
      v95 = 0;
      objc_msgSend(v35, "clientBundleIdentifier:error:", v5, &v95);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v95;
      v38 = a1[4];
      v39 = *(void **)(v38 + 24);
      *(_QWORD *)(v38 + 24) = v36;

      if (!*(_QWORD *)(a1[4] + 24) && v37)
      {
        if (a3)
        {
LABEL_24:
          v37 = objc_retainAutorelease(v37);
          v22 = 0;
          *a3 = v37;
LABEL_68:

LABEL_69:
LABEL_70:

LABEL_71:
          goto LABEL_72;
        }
LABEL_29:
        _HKLogDroppedError();
        v22 = 0;
        goto LABEL_68;
      }

      v40 = *(void **)(a1[4] + 112);
      v94 = 0;
      objc_msgSend(v40, "clientApplicationIdentifier:error:", v5, &v94);
      v41 = objc_claimAutoreleasedReturnValue();
      v37 = v94;
      v42 = a1[4];
      v43 = *(void **)(v42 + 232);
      *(_QWORD *)(v42 + 232) = v41;

      v44 = a1[4];
      if (!*(_QWORD *)(v44 + 232) && v37)
      {
        if (a3)
          goto LABEL_24;
        goto LABEL_29;
      }
      objc_msgSend(*(id *)(v44 + 112), "sourceWithTransaction:error:", v5, a3);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
        objc_msgSend(WeakRetained, "sourceManager");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v45;
        v48 = v46;
        v86 = v47;
        objc_msgSend(v46, "clientSourceForSourceEntity:error:");
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = a1[4];
        v51 = *(void **)(v50 + 256);
        *(_QWORD *)(v50 + 256) = v49;

        v52 = a1[4];
        if (*(_QWORD *)(v52 + 256))
        {
          v53 = *(void **)(v52 + 112);
          v93 = 0;
          objc_msgSend(v53, "latestActivityDateInTransaction:error:", v5, &v93);
          v88 = objc_claimAutoreleasedReturnValue();
          v54 = v93;
          v55 = *(_QWORD *)(a1[7] + 8);
          v56 = *(void **)(v55 + 40);
          *(_QWORD *)(v55 + 40) = v88;

          if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) && v54)
          {
            if (a3)
            {
              v22 = 0;
              *a3 = objc_retainAutorelease(v54);
              v57 = v54;
            }
            else
            {
              v57 = v54;
              _HKLogDroppedError();
              v22 = 0;
            }
            v45 = v86;
            goto LABEL_66;
          }
          v89 = v54;
          v58 = *(void **)(a1[4] + 112);
          v92 = 0;
          objc_msgSend(v58, "currentActivityWithTransaction:error:", v5, &v92);
          v82 = objc_claimAutoreleasedReturnValue();
          v59 = v92;
          v60 = a1[4];
          v61 = *(void **)(v60 + 56);
          *(_QWORD *)(v60 + 56) = v82;

          v62 = v59;
          v63 = a1[4];
          if (!*(_QWORD *)(v63 + 56) && v59)
          {
            v45 = v86;
            if (!a3)
            {
              v76 = v62;
              _HKLogDroppedError();
              v22 = 0;
LABEL_65:

              v57 = v89;
LABEL_66:

              goto LABEL_67;
            }
            v81 = v62;
            v22 = 0;
            *a3 = objc_retainAutorelease(v62);
LABEL_64:
            v76 = v81;
            goto LABEL_65;
          }
          v81 = v59;
          v64 = *(void **)(v63 + 112);
          v91 = 0;
          objc_msgSend(v64, "activityConfigurationsWithTransaction:error:", v5, &v91);
          v83 = objc_claimAutoreleasedReturnValue();
          v65 = v91;
          v66 = a1[4];
          v67 = *(void **)(v66 + 264);
          *(_QWORD *)(v66 + 264) = v83;

          v68 = v65;
          v69 = a1[4];
          if (*(_QWORD *)(v69 + 264) || !v65)
          {
            v70 = *(void **)(v69 + 112);
            v90 = 0;
            objc_msgSend(v70, "firstActivityConfigurationWithTransaction:error:", v5, &v90, v65);
            v84 = objc_claimAutoreleasedReturnValue();
            v71 = v90;
            v72 = a1[4];
            v73 = *(void **)(v72 + 200);
            *(_QWORD *)(v72 + 200) = v84;

            v74 = v71;
            if (*(_QWORD *)(a1[4] + 200))
              v75 = 1;
            else
              v75 = v71 == 0;
            v22 = v75;
            v45 = v86;
            if (!v75)
            {
              if (a3)
              {
                v85 = v74;
                *a3 = objc_retainAutorelease(v74);
                v74 = v85;
              }
              else
              {
                v78 = v74;
                _HKLogDroppedError();
                v74 = v78;
              }
            }

          }
          else
          {
            v45 = v86;
            if (!a3)
            {
              v77 = v68;
              _HKLogDroppedError();
              v22 = 0;
LABEL_63:

              goto LABEL_64;
            }
            v80 = v68;
            v22 = 0;
            *a3 = objc_retainAutorelease(v68);
          }
          v77 = v80;
          goto LABEL_63;
        }
        v22 = 0;
        v45 = v86;
      }
      else
      {
        v22 = 0;
      }
LABEL_67:

      goto LABEL_68;
    }
  }
  v22 = 0;
LABEL_74:

  return v22;
}

void __48__HDWorkoutSessionServer__recoverPersistedState__block_invoke_2(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(a1[4] + 153) = 1;
  objc_msgSend(*(id *)(a1[4] + 144), "enterAtState:", objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "integerValue"));
  objc_msgSend(*(id *)(a1[4] + 136), "enterAtState:", objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "integerValue"));
  *(_BYTE *)(a1[4] + 153) = 0;
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = *(void **)(v3 + 136);
    v5 = v2;
    objc_msgSend(v4, "currentState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "index");
    _HKWorkoutSessionServerStateToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[4] + 40);
    v9 = 138543874;
    v10 = v3;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Recovered with state %{public}@ with start date %{public}@", (uint8_t *)&v9, 0x20u);

  }
  -[HDWorkoutSessionServer _queue_setupSessionController](a1[4]);
  -[HDWorkoutSessionServer _queue_startLatestActivityUpdateTimer]((dispatch_queue_t *)a1[4]);
}

- (id)taskServerConfigurationForRecoveryWithError:(id *)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  HDWorkoutSessionServer *v11;

  v4 = objc_alloc_init(MEMORY[0x1E0CB6E80]);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__HDWorkoutSessionServer_taskServerConfigurationForRecoveryWithError___block_invoke;
  v9[3] = &unk_1E6CE8080;
  v6 = v4;
  v10 = v6;
  v11 = self;
  dispatch_sync(queue, v9);
  v7 = v6;

  return v7;
}

uint64_t __70__HDWorkoutSessionServer_taskServerConfigurationForRecoveryWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSessionUUID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 216));
  objc_msgSend(*(id *)(a1 + 32), "setWorkoutConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 224));
  objc_msgSend(*(id *)(a1 + 32), "setCurrentActivity:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  objc_msgSend(*(id *)(a1 + 32), "setActivityConfigurations:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 264));
  objc_msgSend(*(id *)(a1 + 32), "setSupportsAppRelaunchForRecovery:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setSessionType:", objc_msgSend(*(id *)(a1 + 40), "sessionType"));
}

- (HKDataFlowLink)workoutDataFlowLink
{
  return self->_workoutDataFlowLink;
}

- (NSUUID)workoutDataProcessorUUID
{
  return self->_identifier;
}

- (BOOL)_queue_resendWorkoutEventsToDataDestination:(uint64_t)a3 error:
{
  id v5;
  id WeakRetained;
  void *v7;
  _BOOL8 v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__188;
    v15 = __Block_byref_object_dispose__188;
    v16 = 0;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__HDWorkoutSessionServer__queue_resendWorkoutEventsToDataDestination_error___block_invoke;
    v10[3] = &unk_1E6CEF700;
    v10[4] = a1;
    v10[5] = &v11;
    v8 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDWorkoutSessionEntity, "performReadTransactionWithHealthDatabase:error:block:", v7, a3, v10);

    if (v8)
      objc_msgSend(v5, "addWorkoutEvents:dataSource:", v12[5], a1);
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL __76__HDWorkoutSessionServer__queue_resendWorkoutEventsToDataDestination_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "workoutEventsInTransaction:error:", a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__HDWorkoutSessionServer_workoutDataDestination_requestsDataFrom_to___block_invoke;
  v9[3] = &unk_1E6CE8080;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

}

void __69__HDWorkoutSessionServer_workoutDataDestination_requestsDataFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v8 = 0;
  v4 = -[HDWorkoutSessionServer _queue_resendWorkoutEventsToDataDestination:error:](v2, v3, (uint64_t)&v8);
  v5 = v8;
  if (!v4)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send persisted workout events to data destination upon request: %{public}@", buf, 0x16u);
    }
  }

}

- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__HDWorkoutSessionServer_workoutDataDestination_requestsFinalDataFrom_to_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, block);

}

void __85__HDWorkoutSessionServer_workoutDataDestination_requestsFinalDataFrom_to_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v5 = 0;
  -[HDWorkoutSessionServer _queue_resendWorkoutEventsToDataDestination:error:](v2, v3, (uint64_t)&v5);
  v4 = v5;
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)workoutDataDestination:(id)a3 didInsertEvent:(id)a4
{
  id v5;
  NSObject *v6;
  HDWorkoutSessionRapportSyncController *syncController;
  _QWORD v8[5];
  uint8_t buf[4];
  HDWorkoutSessionServer *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (self->_isMirroring)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending background runtime request for event: %{public}@.", buf, 0x16u);
    }
    syncController = self->_syncController;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__HDWorkoutSessionServer_workoutDataDestination_didInsertEvent___block_invoke;
    v8[3] = &unk_1E6CE77C8;
    v8[4] = self;
    -[HDWorkoutSessionRapportSyncController sendBackgroundRuntimeRequestWithCompletion:](syncController, "sendBackgroundRuntimeRequestWithCompletion:", v8);
  }

}

void __64__HDWorkoutSessionServer_workoutDataDestination_didInsertEvent___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send background runtime request to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (void)addObserver:(id)a3 queue:(id)a4
{
  -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)removeObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)stateMachine:(id)a3 persistTransition:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  HDWorkoutSessionServer *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  HDWorkoutSessionServer *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__HDWorkoutSessionServer_stateMachine_persistTransition___block_invoke;
  v15[3] = &unk_1E6CEB3F8;
  v11 = v6;
  v16 = v11;
  v17 = self;
  v12 = v7;
  v18 = v12;
  LOBYTE(v8) = objc_msgSend((id)v8, "performWriteTransactionWithHealthDatabase:error:block:", v10, &v19, v15);
  v13 = v19;

  if ((v8 & 1) == 0)
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v13;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update persisted session state: %{public}@.", buf, 0x16u);
    }
  }

}

uint64_t __57__HDWorkoutSessionServer_stateMachine_persistTransition___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD **)(a1 + 40);
  if (v7 == v6[17])
  {
    v9 = (void *)v6[14];
    objc_msgSend(*(id *)(a1 + 48), "toState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "setState:transaction:error:", objc_msgSend(v10, "index"), v5, a3);
LABEL_6:
    v8 = v11;

    goto LABEL_7;
  }
  if (v7 == v6[18])
  {
    v12 = (void *)v6[14];
    objc_msgSend(*(id *)(a1 + 48), "toState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "setRequestedTargetState:transaction:error:", objc_msgSend(v10, "index"), v5, a3);
    goto LABEL_6;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

uint64_t __61__HDWorkoutSessionServer__processTargetRunningStateWithDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setRequestedStartDate:transaction:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (void)_processTargetStoppingStateWithDate:(uint64_t)a1
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;
  char v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1 && !*(_QWORD *)(a1 + 192) && !*(_QWORD *)(a1 + 48))
  {
    v5 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v18 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__HDWorkoutSessionServer__processTargetStoppingStateWithDate___block_invoke;
    v16[3] = &unk_1E6CE7950;
    v16[4] = a1;
    v9 = v4;
    v17 = v9;
    v10 = objc_msgSend(v5, "performWriteTransactionWithHealthDatabase:error:block:", v7, &v18, v16);
    v11 = v18;

    if ((v10 & 1) == 0)
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v20 = a1;
        v21 = 2114;
        v22 = v11;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update requested end date: %{public}@.", buf, 0x16u);
      }
    }
    objc_storeStrong((id *)(a1 + 192), a2);
    v13 = *(NSObject **)(a1 + 16);
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __62__HDWorkoutSessionServer__processTargetStoppingStateWithDate___block_invoke_418;
    block[3] = &unk_1E6CE8080;
    block[4] = a1;
    v15 = v9;
    dispatch_async(v13, block);

  }
}

uint64_t __62__HDWorkoutSessionServer__processTargetStoppingStateWithDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setRequestedEndDate:transaction:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

void __62__HDWorkoutSessionServer__processTargetStoppingStateWithDate___block_invoke_418(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    objc_msgSend(v2, "endDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[HDWorkoutSessionServer _queue_endCurrentActivityOnDate:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0);
  }
}

- (uint64_t)_queue_endCurrentActivityOnDate:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;

  v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v6 = *(void **)(a1 + 56);
    if (v6)
    {
      objc_msgSend(v6, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hk_isBeforeDate:", v5);

      if ((v8 & 1) != 0)
      {
        if ((objc_msgSend((id)a1, "isActive") & 1) != 0)
        {
          v9 = *(id *)(a1 + 56);
          objc_msgSend(v9, "_setEndDate:", v5);
          objc_msgSend(*(id *)(a1 + 88), "endCurrentActivity:", v9);
          v10 = *(id *)(a1 + 56);
          *(_QWORD *)(a1 + 56) = 0;
          goto LABEL_14;
        }
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v12 = CFSTR("No active session to end current activity");
      }
      else
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v12 = CFSTR("Activity end date before start date");
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = CFSTR("No current activity to end");
    }
    objc_msgSend(v11, "hk_error:description:", 3, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutSessionServer _queue_generateError:](a1, v13);
    v14 = v13;
    v10 = v14;
    if (v14)
    {
      if (a3)
      {
        v10 = objc_retainAutorelease(v14);
        a1 = 0;
        *a3 = v10;
      }
      else
      {
        _HKLogDroppedError();
        a1 = 0;
      }
      v9 = v10;
      goto LABEL_16;
    }
    v9 = 0;
LABEL_14:
    a1 = 1;
LABEL_16:

  }
  return a1;
}

- (void)stateMachine:(id)a3 willEnterState:(id)a4 date:(id)a5 error:(id)a6
{
  HKStateMachine *v10;
  id v11;
  NSDate *v12;
  id v13;
  HKStateMachine *targetStateMachine;
  uint64_t v15;
  NSDate *requestedStartDate;
  NSDate *v17;
  void *v18;
  id v19;
  void *v20;
  NSDate *v21;
  char v22;
  id v23;
  NSObject *v24;
  NSDate *startDate;
  NSDate *v26;
  NSDate *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  char v34;
  id WeakRetained;
  _QWORD v36[5];
  NSDate *v37;
  id v38;
  id v39;
  uint8_t v40[4];
  HDWorkoutSessionServer *v41;
  __int16 v42;
  id v43;
  _BYTE buf[24];
  void *v45;
  HDWorkoutSessionServer *v46;
  NSDate *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = (HKStateMachine *)a3;
  v11 = a4;
  v12 = (NSDate *)a5;
  v13 = a6;
  targetStateMachine = self->_targetStateMachine;
  v15 = objc_msgSend(v11, "index");
  if (targetStateMachine == v10)
  {
    if (v15 == 6 || v15 == 3)
    {
      -[HDWorkoutSessionServer _processTargetStoppingStateWithDate:]((uint64_t)self, v12);
    }
    else if (v15 == 2)
    {
      v27 = v12;
      if (!self->_startDate && !self->_requestedStartDate)
      {
        v28 = objc_opt_class();
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(WeakRetained, "database");
        v29 = objc_claimAutoreleasedReturnValue();
        v39 = 0;
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __61__HDWorkoutSessionServer__processTargetRunningStateWithDate___block_invoke;
        v45 = &unk_1E6CE7950;
        v46 = self;
        v47 = v27;
        v30 = (void *)v28;
        v31 = (void *)v29;
        v34 = objc_msgSend(v30, "performWriteTransactionWithHealthDatabase:error:block:", v29, &v39, buf);
        v32 = v39;

        if ((v34 & 1) == 0)
        {
          _HKInitializeLogging();
          v33 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v40 = 138543618;
            v41 = self;
            v42 = 2114;
            v43 = v32;
            _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update start date: %{public}@.", v40, 0x16u);
          }
        }
        objc_storeStrong((id *)&self->_requestedStartDate, a5);

      }
    }
  }
  else if (v15 == 7 && !self->_startDate)
  {
    requestedStartDate = self->_requestedStartDate;
    if (!requestedStartDate)
      requestedStartDate = v12;
    v17 = requestedStartDate;
    v18 = (void *)objc_opt_class();
    v19 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v19, "database");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __65__HDWorkoutSessionServer_stateMachine_willEnterState_date_error___block_invoke;
    v36[3] = &unk_1E6CE7950;
    v36[4] = self;
    v21 = v17;
    v37 = v21;
    v22 = objc_msgSend(v18, "performWriteTransactionWithHealthDatabase:error:block:", v20, &v38, v36);
    v23 = v38;

    if ((v22 & 1) == 0)
    {
      _HKInitializeLogging();
      v24 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v23;
        _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update start date: %{public}@.", buf, 0x16u);
      }
    }
    startDate = self->_startDate;
    self->_startDate = v21;
    v26 = v21;

  }
}

uint64_t __65__HDWorkoutSessionServer_stateMachine_willEnterState_date_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setStartDate:transaction:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (void)stateMachine:(id)a3 didEnterState:(id)a4 date:(id)a5 error:(id)a6
{
  NSDate *v9;
  _BOOL4 v10;
  id v11;
  NSDate *startDate;
  double v13;
  double v14;
  NSDate *stopDate;
  NSDate *v16;
  os_log_t *v17;
  NSObject *v18;
  NSObject *latestActivityUpdateTimer;
  OS_dispatch_source *v20;
  void *v21;
  id WeakRetained;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  OS_dispatch_source *extendedPauseTimer;
  NSObject *v32;
  NSObject *v33;
  OS_dispatch_source *v34;
  OS_dispatch_source *v35;
  dispatch_object_t *p_extendedPauseTimer;
  unint64_t v37;
  NSObject *v38;
  dispatch_time_t v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  id location[6];
  id v53;
  uint8_t v54[4];
  HDWorkoutSessionServer *v55;
  __int128 buf;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = (NSDate *)a5;
  if (self->_stateMachine == a3)
  {
    switch(objc_msgSend(a4, "index"))
    {
      case 2:
      case 3:
        v51 = 0;
        v10 = -[HDWorkoutSessionServer _queue_clientApplicationCanStartWorkoutSessionWithError:](self, "_queue_clientApplicationCanStartWorkoutSessionWithError:", &v51);
        v11 = v51;
        if (v10)
          -[HKStateMachine enqueueEvent:date:error:completion:](self->_stateMachine, "enqueueEvent:date:error:completion:", 100, v9, 0, &__block_literal_global_420);
        else
          -[HDWorkoutSessionServer didResignCurrentWithError:](self, "didResignCurrentWithError:", v11);

        break;
      case 7:
        if (self->_extendedPauseTimer)
        {
          _HKInitializeLogging();
          v30 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = self;
            _os_log_impl(&dword_1B7802000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping Extended Pause timer.", (uint8_t *)&buf, 0xCu);
          }
          dispatch_source_cancel((dispatch_source_t)self->_extendedPauseTimer);
          extendedPauseTimer = self->_extendedPauseTimer;
          self->_extendedPauseTimer = 0;

        }
        break;
      case 8:
        _HKInitializeLogging();
        v32 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = self;
          _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting Extended Pause timer.", (uint8_t *)&buf, 0xCu);
        }
        objc_initWeak(location, self);
        v33 = self->_extendedPauseTimer;
        if (v33)
          dispatch_source_cancel(v33);
        v34 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
        p_extendedPauseTimer = (dispatch_object_t *)&self->_extendedPauseTimer;
        v35 = self->_extendedPauseTimer;
        self->_extendedPauseTimer = v34;

        v37 = (unint64_t)(self->_extendedPauseTimeout * 1000000000.0);
        v38 = *p_extendedPauseTimer;
        v39 = dispatch_walltime(0, v37);
        dispatch_source_set_timer(v38, v39, v37, 0x3B9ACA00uLL);
        v40 = *p_extendedPauseTimer;
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v57 = (uint64_t)__56__HDWorkoutSessionServer__queue_startExtendedPauseTimer__block_invoke;
        v58 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CECE78;
        objc_copyWeak((id *)&v59, location);
        dispatch_source_set_event_handler(v40, &buf);
        dispatch_activate(*p_extendedPauseTimer);
        objc_destroyWeak((id *)&v59);
        objc_destroyWeak(location);
        break;
      case 14:
      case 15:
        startDate = self->_startDate;
        if (startDate)
        {
          v13 = *MEMORY[0x1E0CB7828];
          -[NSDate timeIntervalSinceNow](startDate, "timeIntervalSinceNow");
          if (v13 >= -v14 || self->_hasFailed)
            -[HKStateMachine enqueueEvent:date:error:completion:](self->_stateMachine, "enqueueEvent:date:error:completion:", 107, v9, 0, &__block_literal_global_419_0);
        }
        break;
      case 16:
        stopDate = self->_stopDate;
        if (!stopDate)
        {
          stopDate = self->_requestedEndDate;
          if (!stopDate)
            stopDate = v9;
        }
        v16 = stopDate;
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        _HKInitializeLogging();
        v17 = (os_log_t *)MEMORY[0x1E0CB5380];
        v18 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = self;
          _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping latest activity update timer.", (uint8_t *)&buf, 0xCu);
        }
        latestActivityUpdateTimer = self->_latestActivityUpdateTimer;
        if (latestActivityUpdateTimer)
        {
          dispatch_source_cancel(latestActivityUpdateTimer);
          v20 = self->_latestActivityUpdateTimer;
          self->_latestActivityUpdateTimer = 0;

        }
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v57 = 0x3032000000;
        v58 = __Block_byref_object_copy__188;
        v59 = __Block_byref_object_dispose__188;
        v60 = 0;
        v21 = (void *)objc_opt_class();
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(WeakRetained, "database");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0;
        location[0] = (id)MEMORY[0x1E0C809B0];
        location[1] = (id)3221225472;
        location[2] = __79__HDWorkoutSessionServer__queue_deleteSessionAndFinishAssociatedBuilderAtDate___block_invoke;
        location[3] = &unk_1E6CEF700;
        location[4] = self;
        location[5] = &buf;
        v24 = objc_msgSend(v21, "performWriteTransactionWithHealthDatabase:error:block:", v23, &v53, location);
        v25 = v53;

        if ((v24 & 1) == 0)
        {
          _HKInitializeLogging();
          v26 = *v17;
          if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v54 = 138543362;
            v55 = self;
            _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete session entity when finishing.", v54, 0xCu);
          }
        }
        if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
        {
          _HKInitializeLogging();
          v27 = *v17;
          if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v54 = 138543362;
            v55 = self;
            _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Finishing associated builder.", v54, 0xCu);
          }
          v28 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
          v29 = objc_loadWeakRetained((id *)&self->_profile);
          +[HDWorkoutBuilderServer finishDetachedBuilderForEntity:sessionEndDate:profile:](HDWorkoutBuilderServer, "finishDetachedBuilderForEntity:sessionEndDate:profile:", v28, v16, v29);

        }
        else
        {
          _HKInitializeLogging();
          v41 = *v17;
          if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v54 = 138543362;
            v55 = self;
            _os_log_impl(&dword_1B7802000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: No associated builder entity found during finish; workout will not be automatically saved.",
              v54,
              0xCu);
          }
        }
        if (self->_sendHeartBeatFailureAnalytics)
        {
          v42 = objc_loadWeakRetained((id *)&self->_profile);
          objc_msgSend(v42, "workoutManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "mirroringManager");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (self->_startDate)
          {
            -[NSDate timeIntervalSinceDate:](v16, "timeIntervalSinceDate:");
            v46 = v45;
          }
          else
          {
            v46 = -1.0;
          }
          objc_msgSend(v44, "analyticsCollector");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_loadWeakRetained((id *)&self->_profile);
          objc_msgSend(v48, "daemon");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "analyticsSubmissionCoordinator");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "submitHeartBeatFailuresWithCoordinator:numOfHeartbeatFailures:workoutDuration:isFirstParty:", v50, self->_numberOfHeartbeatFailures, -[HDWorkoutSessionServer isFirstParty](self, "isFirstParty"), v46);

        }
        _Block_object_dispose(&buf, 8);

        break;
      default:
        break;
    }
  }

}

- (void)stateMachine:(id)a3 didTransition:(id)a4 fromState:(id)a5 toState:(id)a6 date:(id)a7 error:(id)a8
{
  HKStateMachine *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HKStateMachine *targetStateMachine;
  NSObject *v21;
  _BOOL4 v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  HDWorkoutSessionServer *v30;
  uint64_t v31;
  void *v32;
  dispatch_time_t v33;
  NSObject *queue;
  id v35;
  id WeakRetained;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  NSObject *v43;
  HDWorkoutSessionRapportSyncController *syncController;
  HKObserverSet *observers;
  id v46;
  id v47;
  HKStateMachine *v48;
  _QWORD v49[5];
  id v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[5];
  _QWORD block[5];
  uint8_t buf[4];
  HDWorkoutSessionServer *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v14 = (HKStateMachine *)a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  targetStateMachine = self->_targetStateMachine;
  _HKInitializeLogging();
  v21 = *MEMORY[0x1E0CB5380];
  v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT);
  if (targetStateMachine != v14)
  {
    if (v15)
    {
      if (!v22)
        goto LABEL_11;
      *(_DWORD *)buf = 138543618;
      v56 = self;
      v57 = 2114;
      v58 = v15;
      v23 = "%{public}@: (#w0) %{public}@.";
    }
    else
    {
      if (!v22)
        goto LABEL_11;
      *(_DWORD *)buf = 138543618;
      v56 = self;
      v57 = 2114;
      v58 = v17;
      v23 = "%{public}@: (#w0) Enter at %{public}@.";
    }
    _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);
LABEL_11:
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v48 = v14;
    if (v16)
      v25 = objc_msgSend(v16, "index");
    else
      v25 = 1;
    v26 = objc_msgSend(v17, "index");
    v27 = v26;
    v28 = MEMORY[0x1E0C809B0];
    if (v26 == 7)
    {
      if (v25 != 17 && v25 != 8)
        goto LABEL_34;
      v30 = self;
      v31 = 3;
    }
    else
    {
      if (v26 == 10)
      {
        if (v25 == 17 || v25 == 8)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDWorkoutSessionServer _queue_generateEventWithType:date:](self, 1, v29);

          v28 = MEMORY[0x1E0C809B0];
        }
        else
        {
          v33 = dispatch_time(0, (uint64_t)(self->_stopEventGenerationWaitInterval * 1000000000.0));
          queue = self->_queue;
          block[0] = v28;
          block[1] = 3221225472;
          block[2] = __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke;
          block[3] = &unk_1E6CE80E8;
          block[4] = self;
          dispatch_after(v33, queue, block);
        }
        goto LABEL_34;
      }
      if (!v16 || v26 != 8)
      {
LABEL_34:
        if ((v27 & 0xFFFFFFFFFFFFFFFELL) != 0xE && (v25 & 0xFFFFFFFFFFFFFFFELL) == 0xE)
        {
          v46 = v16;
          v47 = v15;
          v35 = v17;
          WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
          objc_msgSend(WeakRetained, "nanoSyncManager");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "syncHealthDataWithOptions:reason:completion:", 1, CFSTR("syncing after heart rate recovery"), &__block_literal_global_424);

          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", 1, 0, 1);
          v39 = objc_loadWeakRetained((id *)&self->_profile);
          objc_msgSend(v39, "cloudSyncManager");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v19;
          v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6430]), "initWithChangesSyncRequest:", v38);
          objc_msgSend(v40, "syncWithRequest:reason:completion:", v42, CFSTR("Heart rate recovery completed"), &__block_literal_global_430);

          v19 = v41;
          v28 = MEMORY[0x1E0C809B0];

          v17 = v35;
          v16 = v46;
          v15 = v47;

        }
        if (self->_isMirroring)
        {
          _HKInitializeLogging();
          v43 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v56 = self;
            _os_log_impl(&dword_1B7802000, v43, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Sending session state update", buf, 0xCu);
          }
          syncController = self->_syncController;
          v28 = MEMORY[0x1E0C809B0];
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke_431;
          v53[3] = &unk_1E6CE77C8;
          v53[4] = self;
          -[HDWorkoutSessionRapportSyncController sendStateUpdate:date:completion:](syncController, "sendStateUpdate:date:completion:", v27, v18, v53);
          if (HKWorkoutSessionStateFromServerState() == 3)
            -[HDWorkoutSessionServer stopMirroringToCompanionDeviceWithCompletion:](self, "stopMirroringToCompanionDeviceWithCompletion:", 0);
        }
        -[HDWorkoutSessionController workoutSessionServer:didTransitionFromState:toState:date:](self->_sessionController, "workoutSessionServer:didTransitionFromState:toState:date:", self, v25, v27, v18);
        observers = self->_observers;
        v49[0] = v28;
        v49[1] = 3221225472;
        v49[2] = __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke_432;
        v49[3] = &unk_1E6D0DD08;
        v49[4] = self;
        v51 = v27;
        v52 = v25;
        v18 = v18;
        v50 = v18;
        -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v49);
        if (v19)
          -[HDWorkoutSessionServer _queue_generateError:]((uint64_t)self, v19);
        -[HDWorkoutSessionServer _queue_evaluateRequestedTargetStateAtDate:]((uint64_t)self, v18);

        v14 = v48;
        goto LABEL_45;
      }
      v30 = self;
      v31 = 2;
    }
    -[HDWorkoutSessionServer _queue_generateEventWithType:date:](v30, v31, v18);
    goto LABEL_34;
  }
  if (v15)
  {
    if (!v22)
      goto LABEL_31;
    *(_DWORD *)buf = 138543618;
    v56 = self;
    v57 = 2114;
    v58 = v15;
    v24 = "%{public}@: (#w0) Target State: %{public}@.";
  }
  else
  {
    if (!v22)
      goto LABEL_31;
    *(_DWORD *)buf = 138543618;
    v56 = self;
    v57 = 2114;
    v58 = v17;
    v24 = "%{public}@: (#w0) Target State Initialized at %{public}@.";
  }
  _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
LABEL_31:
  -[HKStateMachine currentState](self->_stateMachine, "currentState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
    -[HDWorkoutSessionServer _queue_evaluateRequestedTargetStateAtDate:]((uint64_t)self, v18);
LABEL_45:

}

- (void)_queue_evaluateRequestedTargetStateAtDate:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 144), "currentState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "index");

    v6 = *(void **)(a1 + 136);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__HDWorkoutSessionServer__queue_evaluateRequestedTargetStateAtDate___block_invoke;
    v7[3] = &unk_1E6CF5708;
    v7[4] = a1;
    v7[5] = v5;
    objc_msgSend(v6, "enqueueEvent:date:error:completion:", v5, v3, 0, v7);
  }

}

- (void)_queue_generateEventWithType:(void *)a3 date:
{
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (a1)
  {
    v5 = a1[2];
    v6 = a3;
    dispatch_assert_queue_V2(v5);
    v7 = objc_alloc(MEMORY[0x1E0CB7048]);
    objc_msgSend(a1, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v6, 0.0);

    v10 = (id)objc_msgSend(v7, "initWithEventType:sessionId:dateInterval:metadata:", a2, v8, v9, 0);
    -[HDWorkoutSessionServer _queue_generateEvent:]((uint64_t)a1, v10);

  }
}

void __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 10)
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(v3 + 120);
      v7 = 138543618;
      v8 = v3;
      v9 = 2048;
      v10 = v4;
      _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Failed to receive CM stop event with expected interval (%0.2lfs); generating simulated stop event",
        (uint8_t *)&v7,
        0x16u);
    }
    v5 = *(_QWORD **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutSessionServer _queue_generateEventWithType:date:](v5, 1, v6);

  }
}

void __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke_423(uint64_t a1, char a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v4, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Failed to sync after heart rate recovery: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }

}

void __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke_429(uint64_t a1, char a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v4, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Failed to cloud sync after heart rate recovery: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }

}

void __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke_431(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send session updates to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

uint64_t __82__HDWorkoutSessionServer_stateMachine_didTransition_fromState_toState_date_error___block_invoke_432(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "workoutSession:didChangeToState:fromState:date:", a1[4], a1[6], a1[7], a1[5]);
}

- (void)_queue_generateError:(uint64_t)a1
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v4 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v14[4] = a1;
    v15 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__HDWorkoutSessionServer__queue_generateError___block_invoke;
    v14[3] = &unk_1E6CEBC00;
    v8 = objc_msgSend(v4, "performWriteTransactionWithHealthDatabase:error:block:", v6, &v15, v14);
    v9 = v15;

    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v17 = a1;
        v18 = 2114;
        v19 = v9;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to record workout session failure: %{public}@", buf, 0x16u);
      }
    }
    *(_BYTE *)(a1 + 152) = 1;
    v11 = *(void **)(a1 + 80);
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __47__HDWorkoutSessionServer__queue_generateError___block_invoke_505;
    v12[3] = &unk_1E6D0DC38;
    v12[4] = a1;
    v13 = v3;
    objc_msgSend(v11, "notifyObservers:", v12);

  }
}

- (BOOL)setTargetState:(int64_t)a3 date:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *queue;
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__188;
  v24 = __Block_byref_object_dispose__188;
  v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HDWorkoutSessionServer_setTargetState_date_error___block_invoke;
  block[3] = &unk_1E6D0DD30;
  block[4] = self;
  v19 = a3;
  v10 = v8;
  v16 = v10;
  v17 = &v26;
  v18 = &v20;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v27 + 24))
  {
    v11 = 1;
  }
  else
  {
    v12 = (id)v21[5];
    v13 = v12;
    if (v12)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

    v11 = *((_BYTE *)v27 + 24) != 0;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

void __52__HDWorkoutSessionServer_setTargetState_date_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  __int128 v5;

  v1 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__HDWorkoutSessionServer_setTargetState_date_error___block_invoke_2;
  v4[3] = &unk_1E6CEB7C8;
  v5 = *(_OWORD *)(a1 + 48);
  v4[4] = v3;
  -[HDWorkoutSessionServer _queue_setTargetState:date:completion:](v3, v1, v2, v4);
}

void __52__HDWorkoutSessionServer_setTargetState_date_error___block_invoke_2(uint64_t *a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    -[HDWorkoutSessionServer _queue_generateError:](a1[4], v6);

}

- (void)_queue_setTargetState:(void *)a3 date:(void *)a4 completion:
{
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 144), "currentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "index");

    if (v9 == a2)
      v7[2](v7, 1, 0);
    else
      objc_msgSend(*(id *)(a1 + 144), "enqueueEvent:date:error:completion:", a2, v10, 0, v7);
  }

}

- (void)didBecomeCurrent
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HDWorkoutSessionServer_didBecomeCurrent__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __42__HDWorkoutSessionServer_didBecomeCurrent__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enqueueEvent:date:error:completion:", 101, v2, 0, &__block_literal_global_433_1);

}

- (void)didResignCurrentWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HDWorkoutSessionServer_didResignCurrentWithError___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __52__HDWorkoutSessionServer_didResignCurrentWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v3 + 136);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HDWorkoutSessionServer_didResignCurrentWithError___block_invoke_2;
  v7[3] = &unk_1E6CEB718;
  v7[4] = v3;
  v8 = v2;
  v6 = v2;
  objc_msgSend(v5, "enqueueEvent:date:error:completion:", 102, v6, v4, v7);

}

void __52__HDWorkoutSessionServer_didResignCurrentWithError___block_invoke_2(uint64_t a1)
{
  -[HDWorkoutSessionServer _queue_setTargetState:date:completion:](*(_QWORD *)(a1 + 32), 3, *(void **)(a1 + 40), &__block_literal_global_434);
}

- (BOOL)prepareWithError:(id *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[HDWorkoutSessionServer setTargetState:date:error:](self, "setTargetState:date:error:", 5, v5, a3);

  return (char)a3;
}

- (BOOL)startActivityWithDate:(id)a3 error:(id *)a4
{
  void *v7;
  BOOL v8;

  if (a3)
    return -[HDWorkoutSessionServer setTargetState:date:error:](self, "setTargetState:date:error:", 2, a3, a4);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDWorkoutSessionServer setTargetState:date:error:](self, "setTargetState:date:error:", 2, v7, a4);

  return v8;
}

- (BOOL)stopActivityWithDate:(id)a3 error:(id *)a4
{
  void *v7;
  BOOL v8;

  if (a3)
    return -[HDWorkoutSessionServer setTargetState:date:error:](self, "setTargetState:date:error:", 6, a3, a4);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDWorkoutSessionServer setTargetState:date:error:](self, "setTargetState:date:error:", 6, v7, a4);

  return v8;
}

- (BOOL)endWithError:(id *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[HDWorkoutSessionServer setTargetState:date:error:](self, "setTargetState:date:error:", 3, v5, a3);

  return (char)a3;
}

- (BOOL)pauseWithError:(id *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[HDWorkoutSessionServer setTargetState:date:error:](self, "setTargetState:date:error:", 4, v5, a3);

  return (char)a3;
}

- (BOOL)resumeWithError:(id *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[HDWorkoutSessionServer setTargetState:date:error:](self, "setTargetState:date:error:", 2, v5, a3);

  return (char)a3;
}

- (void)autoPauseWithDate:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HDWorkoutSessionServer_autoPauseWithDate___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __44__HDWorkoutSessionServer_autoPauseWithDate___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enqueueEvent:date:error:completion:", 103, v2, 0, &__block_literal_global_435);

}

- (void)autoResumeWithDate:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HDWorkoutSessionServer_autoResumeWithDate___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __45__HDWorkoutSessionServer_autoResumeWithDate___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enqueueEvent:date:error:completion:", 104, v2, 0, &__block_literal_global_436);

}

- (void)endHeartRateRecovery
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__HDWorkoutSessionServer_endHeartRateRecovery__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__HDWorkoutSessionServer_endHeartRateRecovery__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enqueueEvent:date:error:completion:", 107, v2, 0, &__block_literal_global_437);

}

- (void)finish
{
  -[HDWorkoutSessionServer endWithError:](self, "endWithError:", 0);
}

- (void)finishAggregationWithDate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HDWorkoutSessionServer_finishAggregationWithDate___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __52__HDWorkoutSessionServer_finishAggregationWithDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "enqueueEvent:date:error:completion:", 106, *(_QWORD *)(a1 + 40), 0, &__block_literal_global_438);
}

- (void)generateEvent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__HDWorkoutSessionServer_generateEvent___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __40__HDWorkoutSessionServer_generateEvent___block_invoke(uint64_t a1)
{
  -[HDWorkoutSessionServer _queue_generateEvent:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_queue_generateEvent:(uint64_t)a1
{
  id v3;
  os_log_t *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    v4 = (os_log_t *)MEMORY[0x1E0CB5380];
    v5 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v40 = a1;
      v41 = 2114;
      v42 = v3;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_INFO, "%{public}@: Generated event: %{public}@", buf, 0x16u);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v38 = 0;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke;
    v36[3] = &unk_1E6CE7950;
    v36[4] = a1;
    v9 = v3;
    v37 = v9;
    v10 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutSessionEntity, "performWriteTransactionWithHealthDatabase:error:block:", v7, &v38, v36);
    v11 = v38;

    if (!v10)
    {
      _HKInitializeLogging();
      v12 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v40 = a1;
        v41 = 2114;
        v42 = v11;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist workout event: %{public}@", buf, 0x16u);
      }
    }
    v13 = *(void **)(a1 + 80);
    v34[0] = v8;
    v34[1] = 3221225472;
    v34[2] = __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke_499;
    v34[3] = &unk_1E6D0DC38;
    v34[4] = a1;
    v14 = v9;
    v35 = v14;
    objc_msgSend(v13, "notifyObservers:", v34);
    v15 = *(void **)(a1 + 32);
    v31[0] = v8;
    v31[1] = 3221225472;
    v31[2] = __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke_2;
    v31[3] = &unk_1E6CE8008;
    v16 = v14;
    v32 = v16;
    v33 = a1;
    objc_msgSend(v15, "sendToDestinationProcessors:", v31);
    if (objc_msgSend(v16, "eventType") == 1)
    {
      v17 = *(NSObject **)(a1 + 16);
      v18 = v16;
      dispatch_assert_queue_V2(v17);
      v19 = *(void **)(a1 + 192);
      if (v19)
      {
        v20 = v19;
        v21 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v20;
      }
      else
      {
        objc_msgSend(v18, "dateInterval");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "endDate");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v22;

      }
      v24 = *(void **)(a1 + 136);
      objc_msgSend(v18, "dateInterval");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "startDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "enqueueEvent:date:error:completion:", 105, v26, 0, &__block_literal_global_507);

    }
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(MEMORY[0x1E0CB6E50], "_workoutEventWithInternalEvent:", v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        _HKInitializeLogging();
        v28 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v40 = a1;
          v41 = 2114;
          v42 = v27;
          _os_log_impl(&dword_1B7802000, v28, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Sending update for event: %{public}@", buf, 0x16u);
        }
        v29 = *(void **)(a1 + 72);
        v30[0] = v8;
        v30[1] = 3221225472;
        v30[2] = __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke_502;
        v30[3] = &unk_1E6CE77C8;
        v30[4] = a1;
        objc_msgSend(v29, "sendEventUpdate:completion:", v27, v30);
      }

    }
  }

}

- (void)generateError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__HDWorkoutSessionServer_generateError___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __40__HDWorkoutSessionServer_generateError___block_invoke(uint64_t a1)
{
  -[HDWorkoutSessionServer _queue_generateError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)generateMetadata:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HDWorkoutSessionServer_generateMetadata___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __43__HDWorkoutSessionServer_generateMetadata___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = v2;
  if (v1)
  {
    v4 = *(void **)(v1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__HDWorkoutSessionServer__queue_generateMetadata___block_invoke;
    v5[3] = &unk_1E6CE8008;
    v6 = v2;
    v7 = v1;
    objc_msgSend(v4, "sendToDestinationProcessors:", v5);

  }
}

- (void)generateConfigurationUpdate:(id)a3
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
  block[2] = __54__HDWorkoutSessionServer_generateConfigurationUpdate___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);
  HKDispatchAsyncOnGlobalConcurrentQueue();

}

void __54__HDWorkoutSessionServer_generateConfigurationUpdate___block_invoke(uint64_t a1)
{
  -[HDWorkoutSessionServer _queue_generateConfigurationUpdate:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_queue_generateConfigurationUpdate:(uint64_t)a1
{
  id v3;
  os_log_t *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    v4 = (os_log_t *)MEMORY[0x1E0CB5380];
    v5 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v21 = a1;
      v22 = 2114;
      v23 = v3;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_INFO, "%{public}@: Generated configuration update : %{public}@", buf, 0x16u);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v19 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__HDWorkoutSessionServer__queue_generateConfigurationUpdate___block_invoke;
    v17[3] = &unk_1E6CE7950;
    v17[4] = a1;
    v9 = v3;
    v18 = v9;
    v10 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutSessionEntity, "performWriteTransactionWithHealthDatabase:error:block:", v7, &v19, v17);
    v11 = v19;

    if (!v10)
    {
      _HKInitializeLogging();
      v12 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v21 = a1;
        v22 = 2114;
        v23 = v11;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist workout configuration update: %{public}@", buf, 0x16u);
      }
    }
    v13 = *(void **)(a1 + 32);
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __61__HDWorkoutSessionServer__queue_generateConfigurationUpdate___block_invoke_506;
    v14[3] = &unk_1E6CE8008;
    v15 = v9;
    v16 = a1;
    objc_msgSend(v13, "sendToDestinationProcessors:", v14);

  }
}

void __54__HDWorkoutSessionServer_generateConfigurationUpdate___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("HDWorkoutManagerStateDidChange"), 0);

}

- (void)didBeginNewActivity:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  _QWORD block[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  HDWorkoutSessionServer *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v18 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke;
  v16[3] = &unk_1E6CE7950;
  v16[4] = self;
  v8 = v4;
  v17 = v8;
  v9 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutSessionEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, &v18, v16);
  v10 = v18;

  if (!v9)
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v20 = self;
      v21 = 2114;
      v22 = v10;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist current activity: %{public}@", buf, 0x16u);
    }
  }
  queue = self->_queue;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke_440;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v15 = v8;
  v13 = v8;
  dispatch_sync(queue, block);
  HKDispatchAsyncOnGlobalConcurrentQueue();

}

uint64_t __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setCurrentActivity:transaction:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

void __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke_440(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke_2;
  v12[3] = &unk_1E6CE8008;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v6;
  objc_msgSend(v3, "sendToDestinationProcessors:", v12);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(v7 + 80);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke_3;
  v10[3] = &unk_1E6D0DC38;
  v10[4] = v7;
  v11 = v8;
  objc_msgSend(v9, "notifyObservers:", v10);

}

uint64_t __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didBeginActivity:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "workoutSession:didBeginActivity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __46__HDWorkoutSessionServer_didBeginNewActivity___block_invoke_4()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("HDWorkoutManagerStateDidChange"), 0);

}

- (void)didEndCurrentActivity:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  HDWorkoutSessionServer *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[4] = self;
  v16 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke;
  v15[3] = &unk_1E6CEBC00;
  v8 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutSessionEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, &v16, v15);
  v9 = v16;

  if (!v8)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v9;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist current activity: %{public}@", buf, 0x16u);
    }
  }
  queue = self->_queue;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke_445;
  v13[3] = &unk_1E6CE8080;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  dispatch_sync(queue, v13);
  HKDispatchAsyncOnGlobalConcurrentQueue();

}

uint64_t __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setCurrentActivity:transaction:error:", 0, a2, a3);
}

void __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke_445(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke_2;
  v12[3] = &unk_1E6CE8008;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v6;
  objc_msgSend(v3, "sendToDestinationProcessors:", v12);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(v7 + 80);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke_3;
  v10[3] = &unk_1E6D0DC38;
  v10[4] = v7;
  v11 = v8;
  objc_msgSend(v9, "notifyObservers:", v10);

}

uint64_t __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didEndActivity:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "workoutSession:didEndActivity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __48__HDWorkoutSessionServer_didEndCurrentActivity___block_invoke_4()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("HDWorkoutManagerStateDidChange"), 0);

}

- (void)didDetectActivityChange:(id)a3
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
  block[2] = __50__HDWorkoutSessionServer_didDetectActivityChange___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);
  HKDispatchAsyncOnGlobalConcurrentQueue();

}

void __50__HDWorkoutSessionServer_didDetectActivityChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__HDWorkoutSessionServer_didDetectActivityChange___block_invoke_2;
  v6[3] = &unk_1E6CE8008;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "sendToDestinationProcessors:", v6);

}

uint64_t __50__HDWorkoutSessionServer_didDetectActivityChange___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didSuggestActivity:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __50__HDWorkoutSessionServer_didDetectActivityChange___block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("HDWorkoutManagerStateDidChange"), 0);

}

- (HDWorkoutDataAccumulator)workoutDataAccumulator
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_taskServer);
  objc_msgSend(WeakRetained, "workoutDataAccumulator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HDWorkoutDataAccumulator *)v3;
}

- (BOOL)storeSessionControllerState:(id)a3 forRecoveryIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  _QWORD block[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v8 = a3;
  v9 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__188;
  v26 = __Block_byref_object_dispose__188;
  v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__HDWorkoutSessionServer_storeSessionControllerState_forRecoveryIdentifier_error___block_invoke;
  block[3] = &unk_1E6CFA658;
  v20 = &v28;
  block[4] = self;
  v11 = v8;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  v21 = &v22;
  dispatch_sync(queue, block);
  v13 = (id)v23[5];
  v14 = v13;
  if (v13)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v13);
    else
      _HKLogDroppedError();
  }

  v15 = *((_BYTE *)v29 + 24);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v15;
}

void __82__HDWorkoutSessionServer_storeSessionControllerState_forRecoveryIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id obj;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  obj = v7;
  v8 = v2;
  v9 = v4;
  v10 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 16));
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 8));
    objc_msgSend(WeakRetained, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __89__HDWorkoutSessionServer__queue_storeSessionControllerState_forRecoveryIdentifier_error___block_invoke;
    v19[3] = &unk_1E6CEB3F8;
    v20 = v9;
    v21 = v8;
    v22 = v3;
    v13 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutSessionControllerEntity, "performWriteTransactionWithHealthDatabase:error:block:", v12, &obj, v19);

  }
  else
  {
    v13 = 0;
  }

  objc_storeStrong(v6, obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v13;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 80);
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __82__HDWorkoutSessionServer_storeSessionControllerState_forRecoveryIdentifier_error___block_invoke_2;
  v16[3] = &unk_1E6D0DC38;
  v16[4] = v14;
  v17 = *(id *)(a1 + 48);
  objc_msgSend(v15, "notifyObservers:", v16);

}

void __82__HDWorkoutSessionServer_storeSessionControllerState_forRecoveryIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "workoutSession:didUpdateControllerStateForRecoveryIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

BOOL __85__HDWorkoutSessionServer__retrieveSessionControllerStateForRecoveryIdentifier_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];

  v4 = a1[4];
  v5 = *(_QWORD *)(a1[5] + 112);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__HDWorkoutSessionServer__retrieveSessionControllerStateForRecoveryIdentifier_error___block_invoke_2;
  v7[3] = &unk_1E6D0DE98;
  v7[4] = a1[6];
  return +[HDWorkoutSessionControllerEntity retrieveArchivedStateFromRecoveryIdentifier:workoutSession:transaction:error:block:](HDWorkoutSessionControllerEntity, "retrieveArchivedStateFromRecoveryIdentifier:workoutSession:transaction:error:block:", v4, v5, a2, a3, v7);
}

void __85__HDWorkoutSessionServer__retrieveSessionControllerStateForRecoveryIdentifier_error___block_invoke_2(uint64_t a1, int a2, int a3, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

BOOL __89__HDWorkoutSessionServer__queue_storeSessionControllerState_forRecoveryIdentifier_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return +[HDWorkoutSessionControllerEntity storeArchivedStateWithRecoveryIdentifier:archivedState:workoutSession:transaction:error:](HDWorkoutSessionControllerEntity, "storeArchivedStateWithRecoveryIdentifier:archivedState:workoutSession:transaction:error:", a1[4], a1[5], *(_QWORD *)(a1[6] + 112), a2, a3);
}

- (BOOL)beginNewActivityWithConfiguration:(id)a3 date:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  HDWorkoutSessionRapportSyncController *syncController;
  HKWorkoutActivity *currentActivity;
  BOOL v23;
  _QWORD v25[5];
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t buf[4];
  HDWorkoutSessionServer *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__188;
  v36 = __Block_byref_object_dispose__188;
  v37 = 0;
  v13 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__HDWorkoutSessionServer_beginNewActivityWithConfiguration_date_metadata_error___block_invoke;
  block[3] = &unk_1E6D0DEC0;
  block[4] = self;
  v15 = v10;
  v27 = v15;
  v30 = &v32;
  v16 = v11;
  v28 = v16;
  v31 = &v38;
  v17 = v12;
  v29 = v17;
  dispatch_sync(queue, block);
  v18 = (id)v33[5];
  v19 = v18;
  if (v18)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v18);
    else
      _HKLogDroppedError();
  }

  if (self->_isMirroring)
  {
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v43 = self;
      _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Sending current activity update", buf, 0xCu);
    }
    syncController = self->_syncController;
    currentActivity = self->_currentActivity;
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __80__HDWorkoutSessionServer_beginNewActivityWithConfiguration_date_metadata_error___block_invoke_455;
    v25[3] = &unk_1E6CE77C8;
    v25[4] = self;
    -[HDWorkoutSessionRapportSyncController sendCurrentActivityUpdate:completion:](syncController, "sendCurrentActivityUpdate:completion:", currentActivity, v25);
  }
  v23 = *((_BYTE *)v39 + 24) != 0;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v23;
}

void __80__HDWorkoutSessionServer_beginNewActivityWithConfiguration_date_metadata_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id WeakRetained;
  void *v32;
  os_log_t *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  BOOL v41;
  id v42;
  id v43;
  id obj;
  _QWORD v45[5];
  id v46;
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB6DD0], "_workoutWithActivityType:acceptsSubActivityType:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "activityType"), objc_msgSend(*(id *)(a1 + 40), "activityType")) & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB6DD0], "_stringFromWorkoutActivityType:", objc_msgSend(*(id *)(a1 + 40), "activityType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hk_error:format:", 3, CFSTR("Cannot add subactivity of type %@"), v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    -[HDWorkoutSessionServer _queue_generateError:](*(_QWORD *)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    return;
  }
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 56))
  {
    v3 = *(void **)(a1 + 48);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v4 + 40);
    v5 = -[HDWorkoutSessionServer _queue_endCurrentActivityOnDate:error:](v2, v3, &obj);
    objc_storeStrong((id *)(v4 + 40), obj);
    if (!v5)
      return;
    v2 = *(_QWORD *)(a1 + 32);
  }
  v7 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v9 + 40);
  v10 = (id *)(v9 + 40);
  v43 = v11;
  v12 = v7;
  v13 = v6;
  v14 = v8;
  if (!v2)
  {
    v18 = 0;
    goto LABEL_15;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
  if (objc_msgSend(*(id *)(v2 + 40), "hk_isAfterDate:", v13))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Activity start date before session start"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutSessionServer _queue_generateError:](v2, v15);
    v16 = v15;
    v17 = v16;
    v18 = v16 == 0;
    if (v16)
      v43 = objc_retainAutorelease(v16);
LABEL_30:

    goto LABEL_15;
  }
  v24 = objc_msgSend((id)v2, "state");
  if (v24 > 0x11 || ((1 << v24) & 0x203A0) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("No active session to begin new activity"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutSessionServer _queue_generateError:](v2, v37);
    v38 = v37;
    v17 = v38;
    v18 = v38 == 0;
    if (v38)
      v43 = objc_retainAutorelease(v38);
    goto LABEL_30;
  }
  if (!*(_QWORD *)(v2 + 200) && objc_msgSend(*(id *)(v2 + 264), "count"))
  {
    v27 = objc_msgSend(v12, "activityType");
    objc_msgSend(*(id *)(v2 + 264), "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = v27 == objc_msgSend(v28, "activityType");

    if (!(_DWORD)v27)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("First activity configuration does not match with the list of configurations"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDWorkoutSessionServer _queue_generateError:](v2, v39);
      v40 = v39;
      v17 = v40;
      v18 = v40 == 0;
      if (v40)
        v43 = objc_retainAutorelease(v40);
      goto LABEL_30;
    }
    objc_msgSend(*(id *)(v2 + 264), "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "suggestedActivityUUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSuggestedActivityUUID:", v30);

    WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
    objc_msgSend(WeakRetained, "database");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __87__HDWorkoutSessionServer__queue_beginNewActivityWithConfiguration_date_metadata_error___block_invoke;
    v45[3] = &unk_1E6CE7950;
    v45[4] = v2;
    v46 = v12;
    v41 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutSessionEntity, "performWriteTransactionWithHealthDatabase:error:block:", v32, &v47, v45);
    v42 = v47;

    v33 = (os_log_t *)MEMORY[0x1E0CB5380];
    if (!v41)
    {
      _HKInitializeLogging();
      v34 = *v33;
      if (os_log_type_enabled(*v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v49 = v2;
        v50 = 2114;
        v51 = v42;
        _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist first activity configuration : %{public}@", buf, 0x16u);
      }
    }
    objc_storeStrong((id *)(v2 + 200), v7);
    _HKInitializeLogging();
    v35 = *v33;
    if (os_log_type_enabled(*v33, OS_LOG_TYPE_DEFAULT))
    {
      v36 = *(void **)(v2 + 200);
      *(_DWORD *)buf = 138543618;
      v49 = v2;
      v50 = 2114;
      v51 = v36;
      _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: First activity configuration %{public}@", buf, 0x16u);
    }

  }
  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6DD8]), "initWithWorkoutConfiguration:startDate:endDate:metadata:", v12, v13, 0, v14);
  v26 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = v25;

  objc_msgSend(*(id *)(v2 + 88), "beginNewActivity:", *(_QWORD *)(v2 + 56));
  v18 = 1;
LABEL_15:

  objc_storeStrong(v10, v43);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v18;
}

void __80__HDWorkoutSessionServer_beginNewActivityWithConfiguration_date_metadata_error___block_invoke_455(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to send current activity to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (BOOL)endCurrentActivityOnDate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  HDWorkoutSessionRapportSyncController *syncController;
  uint64_t v14;
  BOOL v15;
  _QWORD v17[5];
  _QWORD block[5];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint8_t buf[4];
  HDWorkoutSessionServer *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__188;
  v33 = __Block_byref_object_dispose__188;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__188;
  v27 = __Block_byref_object_dispose__188;
  v28 = 0;
  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HDWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke;
  block[3] = &unk_1E6D0CAD8;
  v20 = &v29;
  block[4] = self;
  v9 = v6;
  v19 = v9;
  v21 = &v35;
  v22 = &v23;
  dispatch_sync(queue, block);
  v10 = (id)v24[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  if (self->_isMirroring && v30[5])
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = self;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Sending current activity end", buf, 0xCu);
    }
    syncController = self->_syncController;
    v14 = v30[5];
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __57__HDWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke_456;
    v17[3] = &unk_1E6CE77C8;
    v17[4] = self;
    -[HDWorkoutSessionRapportSyncController sendCurrentActivityUpdate:completion:](syncController, "sendCurrentActivityUpdate:completion:", v14, v17);
  }
  v15 = *((_BYTE *)v36 + 24) != 0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v15;
}

void __57__HDWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  id obj;

  objc_msgSend(*(id *)(a1[4] + 56), "_deepCopy");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "_setEndDate:", a1[5]);
  v5 = a1[4];
  v6 = (void *)a1[5];
  v7 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v7 + 40);
  v8 = -[HDWorkoutSessionServer _queue_endCurrentActivityOnDate:error:](v5, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v8;
}

void __57__HDWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke_456(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to send current activity to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (BOOL)enableAutomaticDetectionForActivityConfigurations:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  os_log_t *v14;
  NSObject *v15;
  uint64_t v16;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSObject *queue;
  id v26;
  int v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  HDWorkoutSessionServer *v33;
  id v34;
  _BYTE *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE buf[24];
  char v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v10, "suggestedActivityUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == 0;

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setSuggestedActivityUUID:", v13);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v7);
  }
  _HKInitializeLogging();
  v14 = (os_log_t *)MEMORY[0x1E0CB5380];
  v15 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Enabling automatic detection for configurations %{public}@", buf, 0x16u);
  }
  v16 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v38 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __82__HDWorkoutSessionServer_enableAutomaticDetectionForActivityConfigurations_error___block_invoke;
  v36[3] = &unk_1E6CE7950;
  v36[4] = self;
  v20 = v6;
  v37 = v20;
  LOBYTE(v16) = objc_msgSend((id)v16, "performWriteTransactionWithHealthDatabase:error:block:", v18, &v38, v36);
  v21 = v38;

  if ((v16 & 1) == 0)
  {
    _HKInitializeLogging();
    v22 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v21;
      _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist activity configurations: %{public}@", buf, 0x16u);
    }
    v23 = v21;
    v24 = v23;
    if (v23)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v23);
      else
        _HKLogDroppedError();
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v44 = 0;
  queue = self->_queue;
  v29 = v19;
  v30 = 3221225472;
  v31 = __82__HDWorkoutSessionServer_enableAutomaticDetectionForActivityConfigurations_error___block_invoke_458;
  v32 = &unk_1E6CF6BF8;
  v35 = buf;
  v33 = self;
  v26 = v20;
  v34 = v26;
  dispatch_sync(queue, &v29);
  v27 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Not supported with the current workout session"), v29, v30, v31, v32, v33);

  _Block_object_dispose(buf, 8);
  return v27 != 0;
}

uint64_t __82__HDWorkoutSessionServer_enableAutomaticDetectionForActivityConfigurations_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setActivityConfigurations:transaction:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

void __82__HDWorkoutSessionServer_enableAutomaticDetectionForActivityConfigurations_error___block_invoke_458(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "enableAutomaticDetectionForActivityConfigurations:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 40));
}

- (void)startMirroringToCompanionDeviceWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  _QWORD aBlock[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HDWorkoutSessionServer_startMirroringToCompanionDeviceWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6CE77F0;
  v12 = v4;
  v6 = _Block_copy(aBlock);
  queue = self->_queue;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __72__HDWorkoutSessionServer_startMirroringToCompanionDeviceWithCompletion___block_invoke_2;
  block[3] = &unk_1E6CE9C08;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __72__HDWorkoutSessionServer_startMirroringToCompanionDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __72__HDWorkoutSessionServer_startMirroringToCompanionDeviceWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 16)
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot start mirroring for an ended workout session."));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v3 + 64))
    {
      _HKInitializeLogging();
      v4 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v17 = v5;
        _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Session is already mirroring, ignoring mirroring start request", buf, 0xCu);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      -[HDWorkoutSessionServer _queue_setIsMirroring:completion:](v3, 1, *(void **)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 208) = 1;
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(WeakRetained, "workoutManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mirroringManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "analyticsCollector");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startMirroring");

      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 72);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __72__HDWorkoutSessionServer_startMirroringToCompanionDeviceWithCompletion___block_invoke_463;
      v14[3] = &unk_1E6CEB718;
      v14[4] = v10;
      v15 = v8;
      v12 = v8;
      objc_msgSend(v11, "sendMirroringStartRequestWithCompletion:", v14);

    }
  }
}

- (void)_queue_setIsMirroring:(void *)a3 completion:
{
  void (**v5)(id, uint64_t, id);
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  char v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v6 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__HDWorkoutSessionServer__queue_setIsMirroring_completion___block_invoke;
    v12[3] = &unk_1E6D0DF10;
    v12[4] = a1;
    v13 = a2;
    v9 = objc_msgSend(v6, "performWriteTransactionWithHealthDatabase:error:block:", v8, &v14, v12);
    v10 = v14;

    if ((v9 & 1) == 0)
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v16 = a1;
        v17 = 2114;
        v18 = v10;
        _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to persist mirroring state with error: %{public}@", buf, 0x16u);
      }
    }
    *(_BYTE *)(a1 + 64) = a2;
    if (v5)
      v5[2](v5, v9, v10);

  }
}

void __72__HDWorkoutSessionServer_startMirroringToCompanionDeviceWithCompletion___block_invoke_463(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  _BYTE v10[12];
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    *(_DWORD *)v10 = 138543874;
    if (a2)
      v8 = CFSTR("YES");
    *(_QWORD *)&v10[4] = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Started mirroring with success: %{public}@, error: %{public}@", v10, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 40), "analyticsCollector", *(_QWORD *)v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startedMirroring");

}

- (void)stopMirroringToCompanionDeviceWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  _QWORD aBlock[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__HDWorkoutSessionServer_stopMirroringToCompanionDeviceWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6CE77F0;
  v12 = v4;
  v6 = _Block_copy(aBlock);
  queue = self->_queue;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __71__HDWorkoutSessionServer_stopMirroringToCompanionDeviceWithCompletion___block_invoke_2;
  block[3] = &unk_1E6CE9C08;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __71__HDWorkoutSessionServer_stopMirroringToCompanionDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __71__HDWorkoutSessionServer_stopMirroringToCompanionDeviceWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 64))
  {
    -[HDWorkoutSessionServer _queue_setIsMirroring:completion:](v2, 0, *(void **)(a1 + 40));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "workoutManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mirroringManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "analyticsCollector");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopMirroring");

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 72);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__HDWorkoutSessionServer_stopMirroringToCompanionDeviceWithCompletion___block_invoke_470;
    v13[3] = &unk_1E6CEB718;
    v13[4] = v7;
    v14 = v5;
    v9 = v5;
    objc_msgSend(v8, "sendMirroringStopRequestWithCompletion:", v13);

  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Session is not mirroring, ignoring mirroring stop request", buf, 0xCu);
    }
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Session is not mirroring."));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v9);
  }

}

void __71__HDWorkoutSessionServer_stopMirroringToCompanionDeviceWithCompletion___block_invoke_470(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  _BYTE v14[12];
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    *(_DWORD *)v14 = 138543874;
    if (a2)
      v8 = CFSTR("YES");
    *(_QWORD *)&v14[4] = v7;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Stopped mirroring with success: %{public}@, error: %{public}@", v14, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 40), "analyticsCollector", *(_QWORD *)v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stoppedMirroring");

  objc_msgSend(*(id *)(a1 + 40), "analyticsCollector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "daemon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "analyticsSubmissionCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitMirroringMetricsWithCoordinator:isFirstParty:", v13, objc_msgSend(*(id *)(a1 + 32), "isFirstParty"));

}

- (void)didDisconnectFromRemoteWithError:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];
  char v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  if (self)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__HDWorkoutSessionServer_setIsMirroring___block_invoke;
    block[3] = &unk_1E6CF1C08;
    block[4] = self;
    v12 = 0;
    dispatch_async(queue, block);
  }
  v7 = self->_queue;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __59__HDWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke;
  v9[3] = &unk_1E6CE8080;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

void __59__HDWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__HDWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke_2;
  v3[3] = &unk_1E6CF93D0;
  v4 = v1;
  objc_msgSend(v2, "sendToDestinationProcessors:", v3);

}

uint64_t __59__HDWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didDisconnectFromRemoteWithError:", *(_QWORD *)(a1 + 32));
}

- (void)sendDataToRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  HDWorkoutSessionServer *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__HDWorkoutSessionServer_sendDataToRemoteWorkoutSession_completion___block_invoke;
    block[3] = &unk_1E6CECC58;
    block[4] = self;
    v13 = v7;
    v12 = v6;
    dispatch_async(queue, block);

  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Data is nil. Nothing to send", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 11, CFSTR("No data to send."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);

  }
}

void __68__HDWorkoutSessionServer_sendDataToRemoteWorkoutSession_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 48);
  if (v2)
  {
    if (*(_BYTE *)(v2 + 64))
    {

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(WeakRetained, "workoutManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mirroringManager");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "analyticsCollector");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sendData");

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "sendDataToRemoteWorkoutSession:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      objc_msgSend(v8, "analyticsCollector");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sentData");
    }
    else
    {
      v8 = v3;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Workout session is not currently mirroring to the companion device."));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v7);
    }

  }
  else
  {
    v8 = v3;
  }

}

- (void)didReceiveDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HDWorkoutSessionServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke;
  block[3] = &unk_1E6CECC58;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __76__HDWorkoutSessionServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));

  if (WeakRetained)
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = (void *)objc_opt_class();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138543618;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      v7 = v5;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Notifying client %@ of received data ", buf, 0x16u);

    }
    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__HDWorkoutSessionServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke_475;
    v12[3] = &unk_1E6D0DEE8;
    v13 = v8;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v9, "sendToDestinationProcessors:", v12);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Session client is not set up."));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);

  }
}

uint64_t __76__HDWorkoutSessionServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke_475(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didReceiveDataFromRemoteWorkoutSession:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)isMirroring
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__HDWorkoutSessionServer_isMirroring__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__HDWorkoutSessionServer_isMirroring__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

void __41__HDWorkoutSessionServer_setIsMirroring___block_invoke(uint64_t a1)
{
  -[HDWorkoutSessionServer _queue_setIsMirroring:completion:](*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40), 0);
}

uint64_t __59__HDWorkoutSessionServer__queue_setIsMirroring_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setIsMirroring:transaction:error:", *(unsigned __int8 *)(a1 + 40), a2, a3);
}

- (void)syncCurrentActivity:(id)a3 completion:(id)a4
{
  id v6;
  HKDataFlowLink *workoutDataFlowLink;
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  _QWORD v10[4];
  id v11;

  v6 = a3;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__HDWorkoutSessionServer_syncCurrentActivity_completion___block_invoke;
  v10[3] = &unk_1E6CF93D0;
  v11 = v6;
  v8 = v6;
  v9 = (void (**)(id, uint64_t, _QWORD))a4;
  -[HKDataFlowLink sendToDestinationProcessors:](workoutDataFlowLink, "sendToDestinationProcessors:", v10);
  v9[2](v9, 1, 0);

}

uint64_t __57__HDWorkoutSessionServer_syncCurrentActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didSyncCurrentActivity:", *(_QWORD *)(a1 + 32));
}

- (void)syncWorkoutEvents:(id)a3 completion:(id)a4
{
  void *v4;
  void (**v5)(id, _QWORD, id);
  id v6;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = (void (**)(id, _QWORD, id))a4;
  objc_msgSend(v4, "hk_error:description:", 3, CFSTR("Cannot add events from remote session"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v6);

}

- (void)syncSessionEvent:(int64_t)a3 date:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HDWorkoutSessionServer_syncSessionEvent_date___block_invoke;
  block[3] = &unk_1E6CE9C58;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

void __48__HDWorkoutSessionServer_syncSessionEvent_date___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 240));

  if (WeakRetained)
  {
    v3 = (void *)a1[5];
    v4 = *(void **)(a1[4] + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__HDWorkoutSessionServer_syncSessionEvent_date___block_invoke_478;
    v7[3] = &unk_1E6CF93F8;
    v9 = a1[6];
    v8 = v3;
    objc_msgSend(v4, "sendToDestinationProcessors:", v7);

  }
  else
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v6 = a1[4];
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Workout session client is not set up.", buf, 0xCu);
    }
  }
}

uint64_t __48__HDWorkoutSessionServer_syncSessionEvent_date___block_invoke_478(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didSyncStateEvent:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)remoteSessionDidRecover
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HDWorkoutSessionServer_remoteSessionDidRecover__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__HDWorkoutSessionServer_remoteSessionDidRecover__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));

  if (WeakRetained)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "sendToDestinationProcessors:", &__block_literal_global_480);
  }
  else
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138543362;
      v6 = v4;
      _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Workout session client is not set up.", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __49__HDWorkoutSessionServer_remoteSessionDidRecover__block_invoke_479(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remoteSessionDidRecover");
}

- (void)recordHeartbeatFailure
{
  ++self->_numberOfHeartbeatFailures;
}

- (void)unitTest_setSessionController:(id)a3
{
  objc_storeStrong((id *)&self->_sessionController, a3);
}

- (void)unitTest_setStopEventGenerationWaitInterval:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *queue;
  _QWORD v6[8];

  if (a3 >= 0.0)
  {
    v6[6] = v3;
    v6[7] = v4;
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__HDWorkoutSessionServer_unitTest_setStopEventGenerationWaitInterval___block_invoke;
    v6[3] = &unk_1E6CE8058;
    v6[4] = self;
    *(double *)&v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

double __70__HDWorkoutSessionServer_unitTest_setStopEventGenerationWaitInterval___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 120) = result;
  return result;
}

+ (void)unitTest_setDefaultStopEventGenerationWaitInterval:(double)a3
{
  _defaultUnitTestStopEventWaitInterval = *(_QWORD *)&a3;
}

- (void)unitTest_generateStopEvent
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HDWorkoutSessionServer_unitTest_generateStopEvent__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __52__HDWorkoutSessionServer_unitTest_generateStopEvent__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  id v2;

  v1 = *(_QWORD **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HDWorkoutSessionServer _queue_generateEventWithType:date:](v1, 1, v2);

}

- (void)unitTest_generateWorkoutConfigurationUpdate:(id)a3
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
  block[2] = __70__HDWorkoutSessionServer_unitTest_generateWorkoutConfigurationUpdate___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __70__HDWorkoutSessionServer_unitTest_generateWorkoutConfigurationUpdate___block_invoke(uint64_t a1)
{
  -[HDWorkoutSessionServer _queue_generateConfigurationUpdate:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (BOOL)unitTest_updateLatestActivityDate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HDWorkoutSessionServer_unitTest_updateLatestActivityDate___block_invoke;
  block[3] = &unk_1E6CF6BF8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __60__HDWorkoutSessionServer_unitTest_updateLatestActivityDate___block_invoke(_QWORD *a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HDWorkoutSessionServer_unitTest_updateLatestActivityDate___block_invoke_2;
  v7[3] = &unk_1E6CE7950;
  v5 = (void *)a1[5];
  v7[4] = a1[4];
  v8 = v5;
  LOBYTE(v2) = objc_msgSend(v2, "performWriteTransactionWithHealthDatabase:error:block:", v4, &v9, v7);
  v6 = v9;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_BYTE)v2;

}

uint64_t __60__HDWorkoutSessionServer_unitTest_updateLatestActivityDate___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "updateLatestActivityDate:transaction:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (void)unitTest_setCMWorkoutManager:(id)a3
{
  -[HDWorkoutSessionController unitTest_setCMWorkoutManager:](self->_sessionController, "unitTest_setCMWorkoutManager:", a3);
}

- (void)unitTest_setExtendedPauseInterval:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__HDWorkoutSessionServer_unitTest_setExtendedPauseInterval___block_invoke;
  v4[3] = &unk_1E6CE8058;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(queue, v4);
}

double __60__HDWorkoutSessionServer_unitTest_setExtendedPauseInterval___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 128) = result;
  return result;
}

- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  HDWorkoutSessionController *sessionController;
  void *v9;
  id v10;
  id v11;

  if (a4)
  {
    sessionController = self->_sessionController;
    v11 = a5;
    -[HDWorkoutSessionController fakeActivityDetection:workoutActivity:](sessionController, "fakeActivityDetection:workoutActivity:", a3, a4);
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(v11, 1, 0);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = a5;
    objc_msgSend(v9, "hk_error:description:", 3, CFSTR("Workout Activity is nil"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD))a5 + 2))(v10, 0);

  }
}

uint64_t __87__HDWorkoutSessionServer__queue_beginNewActivityWithConfiguration_date_metadata_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setFirstActivityConfiguration:transaction:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

void __68__HDWorkoutSessionServer__queue_evaluateRequestedTargetStateAtDate___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = v6;
      HKWorkoutSessionStateToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v7;
      v12 = 2114;
      v13 = v9;
      v14 = 2114;
      v15 = v5;
      _os_log_debug_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to make progress toward requested target state %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);

    }
  }

}

uint64_t __79__HDWorkoutSessionServer__queue_deleteSessionAndFinishAssociatedBuilderAtDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v18 = 0;
  objc_msgSend(v6, "associatedBuilderWithTransaction:error:", v5, &v18);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v18;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    v11 = 1;
  else
    v11 = v8 == 0;
  if (!v11)
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v20 = v17;
      v21 = 2114;
      v22 = v8;
      _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup associated builder while finishing session: %{public}@", buf, 0x16u);
    }
  }
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(v5, "databaseForEntity:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "deleteFromDatabase:error:", v14, a3);

  return v15;
}

uint64_t __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "insertWorkoutEvent:transaction:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

uint64_t __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke_499(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "workoutSession:didGenerateEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addWorkoutEvents:dataSource:", v5, *(_QWORD *)(a1 + 40), v6, v7);

}

void __47__HDWorkoutSessionServer__queue_generateEvent___block_invoke_502(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send current activity to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

uint64_t __47__HDWorkoutSessionServer__queue_generateError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setHasFailed:transaction:error:", 1, a2, a3);
}

uint64_t __47__HDWorkoutSessionServer__queue_generateError___block_invoke_505(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "workoutSession:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __50__HDWorkoutSessionServer__queue_generateMetadata___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addMetadata:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __61__HDWorkoutSessionServer__queue_generateConfigurationUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setWorkoutConfiguration:transaction:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

uint64_t __61__HDWorkoutSessionServer__queue_generateConfigurationUpdate___block_invoke_506(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateWorkoutConfiguration:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

BOOL __55__HDWorkoutSessionServer__queue_cacheClientIdentifiers__block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  char v9;
  os_log_t *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "sourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceEntityForClientSource:createOrUpdateIfNecessary:error:", a1[5], 1, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(*(id *)(a1[4] + 112), "setSource:transaction:error:", v8, v5, a3);
    v10 = (os_log_t *)MEMORY[0x1E0CB5380];
    if ((v9 & 1) == 0)
    {
      _HKInitializeLogging();
      v11 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        v15 = a1[4];
        v18 = 138543362;
        v19 = v15;
        _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to record client source. Client may not be able to recover correctly after a full crash.", (uint8_t *)&v18, 0xCu);
      }
    }
    if ((objc_msgSend(*(id *)(a1[4] + 112), "setClientBundleIdentifier:transaction:error:", a1[6], v5, a3) & 1) == 0)
    {
      _HKInitializeLogging();
      v12 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        v16 = a1[4];
        v18 = 138543362;
        v19 = v16;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to record client process bundle identifier. Client may not be correctly relaunched after a full crash.", (uint8_t *)&v18, 0xCu);
      }
    }
    if ((objc_msgSend(*(id *)(a1[4] + 112), "setClientApplicationIdentifier:transaction:error:", a1[7], v5, a3) & 1) == 0)
    {
      _HKInitializeLogging();
      v13 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        v17 = a1[4];
        v18 = 138543362;
        v19 = v17;
        _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to record client application identifier. Client may not be able to recover this workout after a crash.", (uint8_t *)&v18, 0xCu);
      }
    }
  }

  return v8 != 0;
}

void __55__HDWorkoutSessionServer__queue_startInvalidationTimer__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  id *WeakRetained;
  uint8_t buf[4];
  id *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    v1 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v6 = WeakRetained;
      _os_log_impl(&dword_1B7802000, v1, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidation timer fired; finishing session for client loss.",
        buf,
        0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutSessionServer _queue_setTargetState:date:completion:]((uint64_t)WeakRetained, 3, v2, &__block_literal_global_515);

    objc_msgSend(WeakRetained[13], "invalidate");
    v3 = WeakRetained[13];
    WeakRetained[13] = 0;

  }
}

void __55__HDWorkoutSessionServer__queue_startInvalidationTimer__block_invoke_513(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
      v5 = 138543362;
      v6 = v4;
      _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "Failed to acquire reconnection assertion for : %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void __56__HDWorkoutSessionServer__queue_startExtendedPauseTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD *v8;
  uint8_t buf[4];
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Extended Pause timer fired.", buf, 0xCu);
    }
    if (objc_msgSend(v8, "state") == 8)
    {
      v4 = (void *)v8[17];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "enqueueEvent:date:error:completion:", 108, v5, 0, &__block_literal_global_516_0);

    }
    v2 = v8;
    v6 = v8[22];
    if (v6)
    {
      dispatch_source_cancel(v6);
      v7 = (void *)v8[22];
      v8[22] = 0;

      v2 = v8;
    }
  }

}

void __63__HDWorkoutSessionServer__queue_startLatestActivityUpdateTimer__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  id *WeakRetained;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)objc_opt_class();
    v2 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v2, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__HDWorkoutSessionServer__queue_latestActivityUpdateTimerDidFire__block_invoke;
    v8[3] = &unk_1E6CEBC00;
    v8[4] = WeakRetained;
    v9 = 0;
    v4 = objc_msgSend(v1, "performWriteTransactionWithHealthDatabase:error:block:", v3, &v9, v8);
    v5 = v9;

    if ((v4 & 1) == 0)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v11 = WeakRetained;
        v12 = 2114;
        v13 = v5;
        _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update latest activity date in workout session entity: %{public}@", buf, 0x16u);
      }
    }

  }
}

uint64_t __65__HDWorkoutSessionServer__queue_latestActivityUpdateTimerDidFire__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "updateLatestActivityDateWithTransaction:error:", a2, a3);
}

- (BOOL)_queue_clientApplicationCanStartWorkoutSessionWithError:(id *)a3
{
  NSObject *v5;
  NSString *applicationIdentifier;
  const char *v7;
  NSString *v8;
  BOOL v9;
  id WeakRetained;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSString *v18;
  NSString *v19;
  NSObject *v20;
  NSString *v21;
  NSString *v22;
  int v23;
  HDWorkoutSessionServer *v24;
  __int16 v25;
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[HDHealthStoreClient hasEntitlement:](self->_client, "hasEntitlement:", *MEMORY[0x1E0CB4840]))
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      applicationIdentifier = self->_applicationIdentifier;
      v23 = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = applicationIdentifier;
      v7 = "%{public}@: Workout session allowed to start for %{public}@ because it has private entitlement";
LABEL_7:
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v23, 0x16u);
      return 1;
    }
    return 1;
  }
  if (self->_isRecovering)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_applicationIdentifier;
      v23 = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v8;
      v7 = "%{public}@: Workout session allowed to start for %{public}@ because it is in recovery";
      goto LABEL_7;
    }
    return 1;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "workoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "allowBackgroundStartForApplicationIdentifier:", self->_applicationIdentifier);

  if ((v13 & 1) != 0)
    return 1;
  v14 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v14, "daemon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "processStateManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v16, "isApplicationFrontBoardVisibleForBundleIdentifier:", self->_applicationIdentifier) & 1) != 0)
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_applicationIdentifier;
      v23 = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Workout session allowed to start for %{public}@", (uint8_t *)&v23, 0x16u);
    }
    v9 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 14, CFSTR("Client application cannot start a workout session while in the background"));
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v23 = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v19;
      _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", (uint8_t *)&v23, 0x16u);
    }
    v21 = v19;
    v22 = v21;
    v9 = v21 == 0;
    if (v21)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v21);
      else
        _HKLogDroppedError();
    }

  }
  return v9;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (HDWorkoutSessionTaskServer)taskServer
{
  return (HDWorkoutSessionTaskServer *)objc_loadWeakRetained((id *)&self->_taskServer);
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (HDWorkoutSessionRapportSyncController)syncController
{
  return self->_syncController;
}

- (BOOL)clientDidSetupSession
{
  return self->_clientDidSetupSession;
}

- (void)setClientDidSetupSession:(BOOL)a3
{
  self->_clientDidSetupSession = a3;
}

- (NSString)clientProcessBundleIdentifier
{
  return self->_clientProcessBundleIdentifier;
}

- (HKSource)clientSource
{
  return self->_clientSource;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)stopDate
{
  return self->_stopDate;
}

- (HKWorkoutActivity)currentActivity
{
  return self->_currentActivity;
}

- (NSArray)activityConfigurations
{
  return self->_activityConfigurations;
}

- (int64_t)numberOfHeartbeatFailures
{
  return self->_numberOfHeartbeatFailures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityConfigurations, 0);
  objc_storeStrong((id *)&self->_clientSource, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_taskServer);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_firstActivityConfiguration, 0);
  objc_storeStrong((id *)&self->_requestedEndDate, 0);
  objc_storeStrong((id *)&self->_requestedStartDate, 0);
  objc_storeStrong((id *)&self->_extendedPauseTimer, 0);
  objc_storeStrong((id *)&self->_latestActivityUpdateTimer, 0);
  objc_storeStrong((id *)&self->_currentWorkoutSnapshot, 0);
  objc_storeStrong((id *)&self->_targetStateMachine, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_persistentEntity, 0);
  objc_storeStrong((id *)&self->_invalidationAssertion, 0);
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_sessionController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_stopDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_workoutDataFlowLink, 0);
  objc_storeStrong((id *)&self->_clientProcessBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
