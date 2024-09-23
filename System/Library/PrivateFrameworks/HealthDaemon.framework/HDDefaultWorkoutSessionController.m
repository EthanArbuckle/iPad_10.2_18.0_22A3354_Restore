@implementation HDDefaultWorkoutSessionController

- (HDDefaultWorkoutSessionController)initWithProfile:(id)a3 sessionConfiguration:(id)a4 sessionStateController:(id)a5 recoveryState:(id)a6
{
  id v9;
  id v10;
  id v11;
  HDDefaultWorkoutSessionController *v12;
  HDDefaultWorkoutSessionController *v13;
  uint64_t v14;
  OS_dispatch_queue *queue;
  HKWorkoutActivity *currentActivity;
  NSObject *v17;
  HDDefaultWorkoutSessionController *v18;
  HDWorkoutEventsManager *v19;
  id WeakRetained;
  uint64_t v21;
  HDWorkoutEventsManager *eventsManager;
  id v23;
  void *v24;
  uint64_t v25;
  HDBiomeInterface *bmInterface;
  void *v27;
  void *v28;
  _QWORD block[4];
  HDDefaultWorkoutSessionController *v31;
  objc_super v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)HDDefaultWorkoutSessionController;
  v12 = -[HDDefaultWorkoutSessionController init](&v32, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_profile, v9);
    HKCreateSerialDispatchQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v13->_sessionConfiguration, a4);
    objc_storeWeak((id *)&v13->_sessionStateController, v11);
    currentActivity = v13->_currentActivity;
    v13->_currentActivity = 0;

    v17 = v13->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__HDDefaultWorkoutSessionController_initWithProfile_sessionConfiguration_sessionStateController_recoveryState___block_invoke;
    block[3] = &unk_1E6CE80E8;
    v18 = v13;
    v31 = v18;
    dispatch_sync(v17, block);
    v19 = [HDWorkoutEventsManager alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v13->_profile);
    v21 = -[HDWorkoutEventsManager initWithProfile:](v19, "initWithProfile:", WeakRetained);
    eventsManager = v18->_eventsManager;
    v18->_eventsManager = (HDWorkoutEventsManager *)v21;

    v23 = objc_loadWeakRetained((id *)&v13->_profile);
    objc_msgSend(v23, "workoutManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "newBiomeInterface");
    bmInterface = v18->_bmInterface;
    v18->_bmInterface = (HDBiomeInterface *)v25;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v18, sel__lowPowerModeStateChanged_, *MEMORY[0x1E0CB3048], 0);

    -[HDWorkoutSessionConfiguration sessionIdentifier](v13->_sessionConfiguration, "sessionIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDefaultWorkoutSessionController _startSwimTrackerWithIdentifier:]((uint64_t)v18, v28);

  }
  return v13;
}

void __111__HDDefaultWorkoutSessionController_initWithProfile_sessionConfiguration_sessionStateController_recoveryState___block_invoke(uint64_t a1)
{
  -[HDDefaultWorkoutSessionController _queue_setupAssertionGroup](*(_QWORD *)(a1 + 32));
}

- (void)_queue_setupAssertionGroup
{
  HDSessionAssertionGroup *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  HDSessionAssertionWrapper *v6;
  uint64_t v7;
  HDSessionAssertionWrapper *v8;
  HDSessionAssertionWrapper *v9;
  HDSessionAssertionWrapper *v10;
  HDSessionAssertionWrapper *v11;
  HDSessionAssertionWrapper *v12;
  HDSessionAssertionWrapper *v13;
  HDSessionAssertionWrapper *v14;
  HDSessionAssertionWrapper *v15;
  HDSessionAssertionWrapper *v16;
  HDSessionAssertionWrapper *v17;
  HDSessionAssertionWrapper *v18;
  HDSessionAssertionWrapper *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  HDSessionAssertionWrapper *v40;
  HDSessionAssertionWrapper *v41;
  HDSessionAssertionWrapper *v42;
  HDSessionAssertionWrapper *v43;
  HDSessionAssertionWrapper *v44;
  HDSessionAssertionWrapper *v45;
  HDSessionAssertionWrapper *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  id location;
  _BYTE v72[128];
  HDSessionAssertionWrapper *v73;
  _QWORD v74[4];
  _QWORD v75[8];
  _QWORD v76[8];
  _QWORD v77[8];
  _QWORD v78[9];
  _QWORD v79[9];
  _QWORD v80[7];

  v80[5] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    v2 = objc_alloc_init(HDSessionAssertionGroup);
    v3 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v2;

    objc_msgSend(*(id *)(a1 + 32), "workoutConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "activityType");

    objc_initWeak(&location, (id)a1);
    v6 = [HDSessionAssertionWrapper alloc];
    v7 = MEMORY[0x1E0C809B0];
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke;
    v69[3] = &unk_1E6CF9250;
    objc_copyWeak(&v70, &location);
    v46 = -[HDSessionAssertionWrapper initWithCreateAndTakeBlock:](v6, "initWithCreateAndTakeBlock:", v69);
    v8 = [HDSessionAssertionWrapper alloc];
    v67[0] = v7;
    v67[1] = 3221225472;
    v67[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_2;
    v67[3] = &unk_1E6CF9250;
    objc_copyWeak(&v68, &location);
    v44 = -[HDSessionAssertionWrapper initWithCreateAndTakeBlock:](v8, "initWithCreateAndTakeBlock:", v67);
    v9 = [HDSessionAssertionWrapper alloc];
    v65[0] = v7;
    v65[1] = 3221225472;
    v65[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_3;
    v65[3] = &unk_1E6CF9250;
    objc_copyWeak(&v66, &location);
    v45 = -[HDSessionAssertionWrapper initWithCreateAndTakeBlock:](v9, "initWithCreateAndTakeBlock:", v65);
    v10 = [HDSessionAssertionWrapper alloc];
    v63[0] = v7;
    v63[1] = 3221225472;
    v63[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_4;
    v63[3] = &unk_1E6CF9250;
    objc_copyWeak(&v64, &location);
    v11 = -[HDSessionAssertionWrapper initWithCreateAndTakeBlock:](v10, "initWithCreateAndTakeBlock:", v63);
    v12 = [HDSessionAssertionWrapper alloc];
    v61[0] = v7;
    v61[1] = 3221225472;
    v61[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_5;
    v61[3] = &unk_1E6CF9250;
    objc_copyWeak(&v62, &location);
    v42 = -[HDSessionAssertionWrapper initWithCreateAndTakeBlock:](v12, "initWithCreateAndTakeBlock:", v61);
    v13 = [HDSessionAssertionWrapper alloc];
    v59[0] = v7;
    v59[1] = 3221225472;
    v59[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_6;
    v59[3] = &unk_1E6CF9250;
    objc_copyWeak(&v60, &location);
    v43 = -[HDSessionAssertionWrapper initWithCreateAndTakeBlock:](v13, "initWithCreateAndTakeBlock:", v59);
    v14 = [HDSessionAssertionWrapper alloc];
    v57[0] = v7;
    v57[1] = 3221225472;
    v57[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_7;
    v57[3] = &unk_1E6CF9250;
    objc_copyWeak(&v58, &location);
    v41 = -[HDSessionAssertionWrapper initWithCreateAndTakeBlock:](v14, "initWithCreateAndTakeBlock:", v57);
    v15 = [HDSessionAssertionWrapper alloc];
    v55[0] = v7;
    v55[1] = 3221225472;
    v55[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_8;
    v55[3] = &unk_1E6CF9250;
    objc_copyWeak(&v56, &location);
    v16 = -[HDSessionAssertionWrapper initWithCreateAndTakeBlock:](v15, "initWithCreateAndTakeBlock:", v55);
    v17 = [HDSessionAssertionWrapper alloc];
    v53[0] = v7;
    v53[1] = 3221225472;
    v53[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_9;
    v53[3] = &unk_1E6CF9250;
    objc_copyWeak(&v54, &location);
    v40 = -[HDSessionAssertionWrapper initWithCreateAndTakeBlock:](v17, "initWithCreateAndTakeBlock:", v53);
    v18 = [HDSessionAssertionWrapper alloc];
    v51[0] = v7;
    v51[1] = 3221225472;
    v51[2] = __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_10;
    v51[3] = &unk_1E6CF9250;
    objc_copyWeak(&v52, &location);
    v19 = -[HDSessionAssertionWrapper initWithCreateAndTakeBlock:](v18, "initWithCreateAndTakeBlock:", v51);
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], &unk_1E6DFC4E8);
    v80[0] = v46;
    v80[1] = v44;
    v80[2] = v45;
    v80[3] = v11;
    v80[4] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, &unk_1E6DFC500);

    objc_msgSend(v20, "objectForKeyedSubscript:", &unk_1E6DFC500);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, &unk_1E6DFC518);

    objc_msgSend(v20, "objectForKeyedSubscript:", &unk_1E6DFC500);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, &unk_1E6DFC530);

    v79[0] = v46;
    v79[1] = v44;
    v79[2] = v45;
    v79[3] = v11;
    v79[4] = v42;
    v79[5] = v43;
    v79[6] = v41;
    v79[7] = v16;
    v79[8] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, &unk_1E6DFC548);

    v78[0] = v46;
    v78[1] = v44;
    v78[2] = v45;
    v78[3] = v11;
    v78[4] = v42;
    v78[5] = v43;
    v78[6] = v41;
    v78[7] = v16;
    v78[8] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, &unk_1E6DFC560);

    v77[0] = v46;
    v77[1] = v44;
    v77[2] = v45;
    v77[3] = v11;
    v77[4] = v42;
    v77[5] = v43;
    v77[6] = v16;
    v77[7] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, &unk_1E6DFC578);

    v76[0] = v46;
    v76[1] = v45;
    v76[2] = v11;
    v76[3] = v42;
    v76[4] = v43;
    v76[5] = v41;
    v76[6] = v16;
    v76[7] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

    if (v5 != 61)
      objc_msgSend(v28, "addObject:", v44);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v28, &unk_1E6DFC590);
    v75[0] = v46;
    v75[1] = v44;
    v75[2] = v45;
    v75[3] = v11;
    v75[4] = v43;
    v75[5] = v41;
    v75[6] = v16;
    v75[7] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v29, &unk_1E6DFC5A8);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v29, &unk_1E6DFC5C0);
    v74[0] = v46;
    v74[1] = v44;
    v74[2] = v45;
    v74[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v30, &unk_1E6DFC5D8);
    objc_msgSend(v30, "arrayByAddingObject:", v40);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v31, &unk_1E6DFC5F0);

    v73 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v32, &unk_1E6DFC608);

    objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], &unk_1E6DFC620);
    objc_destroyWeak(&v52);

    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);

    objc_destroyWeak(&v58);
    objc_destroyWeak(&v60);

    objc_destroyWeak(&v62);
    objc_destroyWeak(&v64);

    objc_destroyWeak(&v66);
    objc_destroyWeak(&v68);

    objc_destroyWeak(&v70);
    objc_destroyWeak(&location);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v33 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v72, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v48 != v34)
            objc_enumerationMutation(v20);
          v36 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          v37 = objc_msgSend(v36, "integerValue");
          v38 = *(void **)(a1 + 40);
          objc_msgSend(v20, "objectForKeyedSubscript:", v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setupState:withAssertions:", v37, v39);

        }
        v33 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v72, 16);
      }
      while (v33);
    }

  }
}

- (void)_startSwimTrackerWithIdentifier:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1 && _os_feature_enabled_impl())
    objc_msgSend(*(id *)(a1 + 88), "startWith:", v3);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HDSessionAssertionGroup invalidate](self->_assertionGroup, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDDefaultWorkoutSessionController;
  -[HDDefaultWorkoutSessionController dealloc](&v4, sel_dealloc);
}

- (void)workoutSessionServer:(id)a3 didTransitionFromState:(int64_t)a4 toState:(int64_t)a5 date:(id)a6
{
  id v9;
  NSObject *queue;
  id v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;
  int64_t v15;

  v9 = a6;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__HDDefaultWorkoutSessionController_workoutSessionServer_didTransitionFromState_toState_date___block_invoke;
  v12[3] = &unk_1E6CECEA0;
  v14 = a4;
  v15 = a5;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(queue, v12);

}

void __94__HDDefaultWorkoutSessionController_workoutSessionServer_didTransitionFromState_toState_date___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id WeakRetained;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  os_log_t *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  os_log_t *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  NSObject *v56;
  void *v57;
  id v58;
  _QWORD block[5];
  id v60;
  _QWORD v61[5];
  NSObject *v62;
  __int128 v63;
  void (*v64)(uint64_t);
  void *v65;
  NSObject *v66;
  uint64_t v67;
  _BYTE buf[24];
  void *v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48) == 1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      -[HDDefaultWorkoutSessionController _typesToCollect](v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDActiveDataCollectionObserverServer launchObservingProcessesForTypes:](HDActiveDataCollectionObserverServer, "launchObservingProcessesForTypes:", v3);

    }
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "transitionToState:", *(_QWORD *)(a1 + 56));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 96);
  if (v5)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, *(_QWORD *)(v4 + 56), *(_QWORD *)(a1 + 48));
    v4 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v4 + 64), "workoutSessionWithConfiguration:transitionedToState:fromState:", *(_QWORD *)(v4 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  switch(*(_QWORD *)(a1 + 56))
  {
    case 7:
      v20 = *(_QWORD *)(a1 + 48);
      switch(v20)
      {
        case 17:
          goto LABEL_17;
        case 9:
          return;
        case 8:
LABEL_17:
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
          objc_msgSend(WeakRetained, "daemon");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "workoutPluginExtension");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "coreMotionWorkoutInterface");
          v58 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "sessionIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "resumeWorkoutForWorkoutSessionUUID:", v19);
          goto LABEL_18;
      }
      v44 = *(_QWORD *)(a1 + 32);
      if (!v44)
        return;
      _HKInitializeLogging();
      v45 = (os_log_t *)MEMORY[0x1E0CB5380];
      v46 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v47 = *(void **)(v44 + 32);
        v48 = v46;
        objc_msgSend(v47, "workoutConfiguration");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v49;
        _os_log_impl(&dword_1B7802000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: Enabling low power mode, if necessary, with configuration: %@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "persistentDomainForName:", CFSTR("com.apple.nanolifestyle.sessiontrackerapp"));
      v25 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "objectForKey:", CFSTR("EnablePowerSavingMode"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v51)
        goto LABEL_28;
      v52 = v51;
      v53 = objc_msgSend(v51, "BOOLValue");

      if (v53)
      {
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "isLowPowerModeEnabled");

        if (v55)
        {
          _HKInitializeLogging();
          v56 = *v45;
          if (os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v44;
            _os_log_impl(&dword_1B7802000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@: Low power mode is already enabled; do nothing.",
              buf,
              0xCu);
          }
        }
        else
        {
          objc_msgSend(*(id *)(v44 + 32), "workoutConfiguration");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setShouldUseLowPowerMode:", 1);

          v25 = objc_loadWeakRetained((id *)(v44 + 16));
          objc_msgSend(*(id *)(v44 + 32), "workoutConfiguration");
          v37 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "generateConfigurationUpdate:", v37);
LABEL_27:

LABEL_28:
        }
      }
      return;
    case 8:
    case 0x11:
      v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(v16, "daemon");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "workoutPluginExtension");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "coreMotionWorkoutInterface");
      v58 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "sessionIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "pauseWorkoutForWorkoutSessionUUID:", v19);
LABEL_18:

      return;
    case 0xBLL:
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(id *)(a1 + 40);
      if (!v24)
        goto LABEL_28;
      _HKInitializeLogging();
      v26 = (os_log_t *)MEMORY[0x1E0CB5380];
      v27 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v24;
        _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Requesting post-stop data aggregation for all collected types and pending events collection.", buf, 0xCu);
      }
      v28 = dispatch_group_create();
      dispatch_group_enter(v28);
      v29 = objc_loadWeakRetained((id *)(v24 + 8));
      objc_msgSend(v29, "dataCollectionManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = MEMORY[0x1E0C809B0];
      v32 = *(_QWORD *)(v24 + 80);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke;
      v69 = &unk_1E6CEB718;
      v70 = v24;
      v33 = v28;
      v71 = v33;
      objc_msgSend(v30, "requestAggregationThroughDate:types:mode:options:completion:", v25, v32, 0, 3, buf);

      dispatch_group_enter(v33);
      _HKInitializeLogging();
      v34 = *v26;
      if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v63) = 138543362;
        *(_QWORD *)((char *)&v63 + 4) = v24;
        _os_log_impl(&dword_1B7802000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting pending events collection", (uint8_t *)&v63, 0xCu);
      }
      v35 = *(void **)(v24 + 48);
      objc_msgSend(*(id *)(v24 + 32), "sessionIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v63 = v31;
      *((_QWORD *)&v63 + 1) = 3221225472;
      v64 = __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke_226;
      v65 = &unk_1E6CE8080;
      v37 = v33;
      v66 = v37;
      v67 = v24;
      objc_msgSend(v35, "requestPendingEventsThroughDate:sessionIdentifier:completion:", v25, v36, &v63);

      v38 = objc_loadWeakRetained((id *)(v24 + 8));
      objc_msgSend(v38, "daemon");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "workoutPluginExtension");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "coreMotionWorkoutInterface");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        dispatch_group_enter(v37);
        objc_msgSend(*(id *)(v24 + 32), "sessionIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = v31;
        v61[1] = 3221225472;
        v61[2] = __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke_227;
        v61[3] = &unk_1E6CF9278;
        v61[4] = v24;
        v62 = v37;
        objc_msgSend(v41, "averageMETsForWorkoutSessionUUID:completion:", v42, v61);

      }
      v43 = *(NSObject **)(v24 + 24);
      block[0] = v31;
      block[1] = 3221225472;
      block[2] = __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke_229;
      block[3] = &unk_1E6CE8080;
      block[4] = v24;
      v60 = v25;
      dispatch_group_notify(v37, v43, block);

      goto LABEL_27;
    case 0xDLL:
    case 0xELL:
    case 0xFLL:
    case 0x10:
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
      {
        _HKInitializeLogging();
        v7 = (void *)*MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(void **)(v6 + 32);
          v9 = v7;
          objc_msgSend(v8, "workoutConfiguration");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v10;
          _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Disabling low power mode, if necessary, with configuration: %@", buf, 0x16u);

        }
        objc_msgSend(*(id *)(v6 + 32), "workoutConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "shouldUseLowPowerMode");

        if (v12)
        {
          objc_msgSend(*(id *)(v6 + 32), "workoutConfiguration");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setShouldUseLowPowerMode:", 0);

          v14 = objc_loadWeakRetained((id *)(v6 + 16));
          objc_msgSend(*(id *)(v6 + 32), "workoutConfiguration");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "generateConfigurationUpdate:", v15);

        }
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "stop");
      return;
    default:
      return;
  }
}

- (void)workoutSessionServer:(id)a3 didChangeConfiguration:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  HDDefaultWorkoutSessionController *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__HDDefaultWorkoutSessionController_workoutSessionServer_didChangeConfiguration___block_invoke;
  v8[3] = &unk_1E6CE8080;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __81__HDDefaultWorkoutSessionController_workoutSessionServer_didChangeConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "activityConfigurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setActivityConfigurations:", v2);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 32), *(id *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(v3 + 40);
  -[HDDefaultWorkoutSessionController _queue_setupAssertionGroup](v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "transitionToState:", objc_msgSend(v4, "state"));
  objc_msgSend(v4, "invalidate");

}

+ (id)recoveryIdentifier
{
  return 0;
}

- (void)beginNewActivity:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__HDDefaultWorkoutSessionController_beginNewActivity___block_invoke;
    v8[3] = &unk_1E6CE8080;
    v8[4] = self;
    v9 = v4;
    dispatch_async(queue, v8);

  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Not beginning activity as workoutActivity is nil", buf, 2u);
    }
  }

}

void __54__HDDefaultWorkoutSessionController_beginNewActivity___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workoutPluginExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreMotionWorkoutInterface");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "workoutConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestedActivityUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  objc_msgSend(v17, "setCurrentActivity:isManualTransition:", *(_QWORD *)(a1 + 40), v7);
  v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v9 + 72), "workoutConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDefaultWorkoutSessionController _instantiateSwimTrackerActivityTypeIfNeeded:](v9, objc_msgSend(v10, "activityType"));

  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v11 + 72), "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDefaultWorkoutSessionController _startSwimTrackerWithIdentifier:](v11, v12);

  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v14 = objc_msgSend(v5, "activityType");
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateEventCollectorsForActivityType:activityIdentifier:", v14, v15);

  v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v16, "didBeginNewActivity:", v8);

}

- (void)_instantiateSwimTrackerActivityTypeIfNeeded:(uint64_t)a1
{
  _TtC12HealthDaemon13HDSwimTracker *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  if (a1 && a2 == 46 && !*(_QWORD *)(a1 + 88))
  {
    if (_os_feature_enabled_impl())
    {
      v3 = [_TtC12HealthDaemon13HDSwimTracker alloc];
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v4 = -[HDSwimTracker initWithProfile:](v3, "initWithProfile:", WeakRetained);
      v5 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v4;

    }
  }
}

- (void)endCurrentActivity:(id)a3
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
  v7[2] = __56__HDDefaultWorkoutSessionController_endCurrentActivity___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __56__HDDefaultWorkoutSessionController_endCurrentActivity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  *(_QWORD *)(v2 + 72) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "workoutConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "stop");
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v5 = objc_msgSend(v8, "activityType");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateEventCollectorsForActivityType:activityIdentifier:", v5, v6);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "didEndCurrentActivity:", *(_QWORD *)(a1 + 40));

}

- (BOOL)enableAutomaticDetectionForActivityConfigurations:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  HDWorkoutSessionConfiguration *sessionConfiguration;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HDWorkoutSessionConfiguration enableWorkoutChangeDetection](self->_sessionConfiguration, "enableWorkoutChangeDetection");
  if (v5)
  {
    -[HDWorkoutSessionConfiguration setActivityConfigurations:](self->_sessionConfiguration, "setActivityConfigurations:", v4);
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      sessionConfiguration = self->_sessionConfiguration;
      v8 = v6;
      -[HDWorkoutSessionConfiguration clientApplicationIdentifier](sessionConfiguration, "clientApplicationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDWorkoutSessionConfiguration activityConfigurations](self->_sessionConfiguration, "activityConfigurations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "Automatic change detection enabled for activity configurations from %@ with configurations %@", (uint8_t *)&v12, 0x16u);

    }
  }

  return v5;
}

- (void)receivedWorkoutEvent:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  HDDefaultWorkoutSessionController *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "Received workout event %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__HDDefaultWorkoutSessionController_receivedWorkoutEvent___block_invoke;
  v8[3] = &unk_1E6CE8080;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(queue, v8);

}

void __58__HDDefaultWorkoutSessionController_receivedWorkoutEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sessionId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "sessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", v3))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
      {
        v17 = *(void **)(a1 + 32);
        v18 = v16;
        objc_msgSend(v17, "sessionId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "sessionIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "UUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v19;
        v29 = 2114;
        v30 = v20;
        v31 = 2114;
        v32 = v21;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_INFO, "Event received for non current sessionID: %{public}@, session ID: %{public}@, current activity ID: %{public}@", buf, 0x20u);

      }
      return;
    }
  }
  if ((*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) != 9 || objc_msgSend(*(id *)(a1 + 32), "eventType") != 7)
    && objc_msgSend(*(id *)(a1 + 32), "eventType") != 3
    && objc_msgSend(*(id *)(a1 + 32), "eventType") != 2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "eventType") == 12)
    {
      objc_msgSend(*(id *)(a1 + 32), "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB5558]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "workoutConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
        v12 = 2;
      else
        v12 = 3;
      objc_msgSend(v10, "setLocationType:", v12);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "workoutConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShouldDisambiguateLocation:", 0);

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "workoutConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "generateConfigurationUpdate:", v15);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "workoutConfigurationUpdated:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
    }
    else
    {
      v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
      objc_msgSend(v22, "generateEvent:", *(_QWORD *)(a1 + 32));

    }
    v23 = objc_msgSend(*(id *)(a1 + 32), "eventType");
    if (v23 == 8)
    {
      v26 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
      objc_msgSend(*(id *)(a1 + 32), "dateInterval");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "startDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "autoResumeWithDate:", v25);
      goto LABEL_21;
    }
    if (v23 == 7)
    {
      v26 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
      objc_msgSend(*(id *)(a1 + 32), "dateInterval");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "startDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "autoPauseWithDate:", v25);
LABEL_21:

    }
  }
}

- (void)receivedWorkoutEvent:(id)a3 forWorkoutActivity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  HDDefaultWorkoutSessionController *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "Received workout event %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__HDDefaultWorkoutSessionController_receivedWorkoutEvent_forWorkoutActivity___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  v13 = v6;
  v14 = v7;
  v15 = self;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

void __77__HDDefaultWorkoutSessionController_receivedWorkoutEvent_forWorkoutActivity___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "workoutEventType") == 14)
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "Suggested workout acivity: %{public}@ ", (uint8_t *)&v5, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 16));
    objc_msgSend(WeakRetained, "didDetectActivityChange:", *(_QWORD *)(a1 + 40));

  }
}

+ (BOOL)supportsWorkoutConfiguration:(id)a3 clientApplicationIdentifier:(id)a4
{
  return 1;
}

- (void)hktest_setStateTransitionCompletionHandler:(id)a3
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
  block[2] = __80__HDDefaultWorkoutSessionController_hktest_setStateTransitionCompletionHandler___block_invoke;
  block[3] = &unk_1E6CE9C08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __80__HDDefaultWorkoutSessionController_hktest_setStateTransitionCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

}

- (void)unitTest_setCMWorkoutManager:(id)a3
{
  -[HDWorkoutEventsManager unitTest_setCMWorkoutManager:](self->_eventsManager, "unitTest_setCMWorkoutManager:", a3);
}

- (void)unitTest_suggestActivity:(id)a3
{
  HDWorkoutSessionStateController **p_sessionStateController;
  id v4;
  id WeakRetained;

  p_sessionStateController = &self->_sessionStateController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  objc_msgSend(WeakRetained, "didDetectActivityChange:", v4);

}

- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_INFO, "faking workout detection %{public}@", (uint8_t *)&v9, 0xCu);
  }
  -[HDWorkoutEventsManager fakeActivityDetection:workoutActivity:](self->_eventsManager, "fakeActivityDetection:workoutActivity:", v6, v7);

}

- (id)_ownerIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "process");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "clientApplicationIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_typesToCollect
{
  void *v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "workoutConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activityType");

  objc_msgSend(*(id *)(a1 + 32), "workoutConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "locationType") == 2;

  v6 = -[HDDefaultWorkoutSessionController _currentActivityMoveMode](a1);
  objc_msgSend(MEMORY[0x1E0CB6E30], "observedTypesForActivityType:isIndoor:connectedToFitnessMachine:activityMode:", v3, v5, 0, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);
  if (-[HDDefaultWorkoutSessionController _currentActivityMoveMode](a1) == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A58]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "activityConfigurations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v15, "activityType") == 13)
        {
          objc_msgSend(MEMORY[0x1E0CB6E30], "observedTypesForActivityType:isIndoor:connectedToFitnessMachine:activityMode:", objc_msgSend(v15, "activityType"), 0, 0, v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "unionSet:", v16);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  return v7;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "daemon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workoutPluginExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2[4], "clientProcessBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertSuppressor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createAndTakeAssertionForOwnerIdentifier:processBundleIdentifier:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "daemon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workoutPluginExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "backgroundWorkoutRunner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2[4], "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "takeBackgroundRunningAssertionForOwnerIdentifier:client:includeCoreLocationAssertion:", v7, v8, objc_msgSend(v2[4], "requiresCoreLocationAssertion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "daemon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workoutPluginExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v2[4], "supports3rdPartyAOT") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)v2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.SessionTrackerApp"));

    }
    objc_msgSend(v5, "carouselServicesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "takeSessionAssertionForOwnerIdentifier:supportsAOT:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  char v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_msgSend(WeakRetained[4], "supportsAppRelaunchForRecovery");
    if (_HDIsUnitTesting || (v3 & 1) != 0)
    {
      v9 = objc_loadWeakRetained(v2 + 1);
      objc_msgSend(v9, "daemon");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "workoutPluginExtension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2[4], "clientApplicationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2[4], "clientProcessBundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appLauncher");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "takeKeepAliveAssertionForApplicationBundleIdentifier:processBundleIdentifier:payloadOptions:", v12, v13, MEMORY[0x1E0C9AA70]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      v5 = v2[4];
      v6 = v4;
      objc_msgSend(v5, "clientProcessBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v7;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "Keep alive assertion not taken for client %{public}@", (uint8_t *)&v16, 0xCu);

    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "daemon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workoutPluginExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v2[4], "enableWorkoutChangeDetection"))
    {
      objc_msgSend(v2[4], "activityConfigurations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count") != 0;

    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v5, "coreMotionWorkoutInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2[4], "sessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2[4], "workoutConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2[4], "activityConfigurations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "takeCMWorkoutAssertionForOwnerIdentifier:sessionUUID:workoutConfiguration:activityConfigurations:enableWorkoutChangeDetection:", v9, v10, v11, v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v23 = (uint64_t)WeakRetained;
    -[HDDefaultWorkoutSessionController _typesToCollect]((uint64_t)WeakRetained);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((objc_msgSend(v10, "isEqual:", v4) & 1) == 0)
          {
            v11 = (void *)MEMORY[0x1E0CB37E8];
            v12 = objc_msgSend(v10, "code");
            v13 = v12 == 179 || v12 == 75;
            v14 = 60.0;
            if (!v13)
              v14 = 0.5;
            objc_msgSend(v11, "numberWithDouble:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v15, v10);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v7);
    }

    +[HDDataCollectionObserverState dataCollectionObserverStateInBackground:hasRunningWorkout:](HDDataCollectionObserverState, "dataCollectionObserverStateInBackground:hasRunningWorkout:", 0, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)v23;
    v17 = objc_loadWeakRetained((id *)(v23 + 8));
    objc_msgSend(v17, "dataCollectionManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDefaultWorkoutSessionController _ownerIdentifier](v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "takeCollectionAssertionWithOwnerIdentifier:collectionIntervalsByType:observerState:", v19, v24, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      objc_storeStrong((id *)(v23 + 80), obj);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_7(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDefaultWorkoutSessionController _typesToCollect]((uint64_t)WeakRetained);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", v2);

    if (v4)
    {
      +[HDDataCollectionObserverState dataCollectionObserverStateInBackground:hasRunningWorkout:](HDDataCollectionObserverState, "dataCollectionObserverStateInBackground:hasRunningWorkout:", 0, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_loadWeakRetained(WeakRetained + 1);
      objc_msgSend(v6, "dataCollectionManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)WeakRetained);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v2;
      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = objc_msgSend(v2, "code");
      v11 = v10 == 179 || v10 == 75;
      v12 = 60.0;
      if (!v11)
        v12 = 0.5;
      objc_msgSend(v9, "numberWithDouble:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "takeCollectionAssertionWithOwnerIdentifier:collectionIntervalsByType:observerState:", v8, v14, v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_8(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[9];
    if (v3)
    {
      objc_msgSend(v3, "workoutConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "activityType");

    }
    else
    {
      objc_msgSend(*(id *)(v2 + 32), "workoutConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "activityType");

      -[HDDefaultWorkoutSessionController _instantiateSwimTrackerActivityTypeIfNeeded:](v2, v5);
    }
    v7 = *(void **)(v2 + 48);
    -[HDDefaultWorkoutSessionController _ownerIdentifier](v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 32), "sessionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "takeSessionAssertionWithOwnerIdentifier:activityType:sessionIdentifier:eventsDelegate:", v8, v5, v9, v2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_9(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "daemon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workoutPluginExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "heartRateRecoveryManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained(v2 + 2);
    objc_msgSend(v6, "createAndTakeAssertionForOwnerIdentifier:sessionStateController:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __78__HDDefaultWorkoutSessionController__queue_assertionsPerStateForActivityType___block_invoke_10(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x1E0D29800]);
    -[HDDefaultWorkoutSessionController _ownerIdentifier]((uint64_t)WeakRetained);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithAssertionIdentifier:ownerIdentifier:", CFSTR("HDWorkoutSessionAssertionIdentifierPlatinum"), v3);

    v5 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v5, "sessionAssertionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "takeAssertion:", v4);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)_currentActivityMoveMode
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49B8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(WeakRetained, "userCharacteristicsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "userCharacteristicForType:error:", v2, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Error reading activity mode %{public}@", buf, 0xCu);
    }
    v8 = 1;
  }
  else
  {
    v8 = objc_msgSend(v5, "integerValue");
  }

  return v8;
}

- (void)_lowPowerModeStateChanged:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HDDefaultWorkoutSessionController__lowPowerModeStateChanged___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __63__HDDefaultWorkoutSessionController__lowPowerModeStateChanged___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  char v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "workoutConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUseLowPowerMode");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLowPowerModeEnabled");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "workoutConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setShouldUseLowPowerMode:", 0);

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "workoutConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "generateConfigurationUpdate:", v8);

      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(v10 + 32);
        v12 = v9;
        objc_msgSend(v11, "workoutConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v10;
        v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: System low power mode state changed; it will NOT be automatically turned off after workout is stop"
          "ped with configuration: %@",
          (uint8_t *)&v14,
          0x16u);

      }
    }
  }
}

void __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5380];
  v7 = *MEMORY[0x1E0CB5380];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v12 = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully finished post-stop data aggregation.", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138543618;
    v13 = v11;
    v14 = 2114;
    v15 = v5;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Post-stop data aggregation failed: %{public}@.", (uint8_t *)&v12, 0x16u);
  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 80);
  *(_QWORD *)(v9 + 80) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke_226(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully finished pending events collection", (uint8_t *)&v4, 0xCu);
  }
}

void __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke_227(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *WeakRetained;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB5380];
  v8 = *MEMORY[0x1E0CB5380];
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      v10 = v7;
      objc_msgSend(v9, "sessionIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "Generating average METs for workout session: %{public}@", (uint8_t *)&v15, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    v19 = *MEMORY[0x1E0CB54B0];
    v20[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject generateMetadata:](WeakRetained, "generateMetadata:", v13);
  }
  else
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    WeakRetained = v7;
    objc_msgSend(v14, "sessionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v13;
    v17 = 2114;
    v18 = v6;
    _os_log_error_impl(&dword_1B7802000, WeakRetained, OS_LOG_TYPE_ERROR, "Failed retrieving METs for workout %{public}@ with error %{public}@", (uint8_t *)&v15, 0x16u);
  }

LABEL_7:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __72__HDDefaultWorkoutSessionController__queue_collectFinalDataThroughDate___block_invoke_229(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Completed requests for post-stop data aggregation and event collection.", (uint8_t *)&v5, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "finishAggregationWithDate:", *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hkTestTransitionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_swimTracker, 0);
  objc_storeStrong((id *)&self->_collectedTypes, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_bmInterface, 0);
  objc_storeStrong((id *)&self->_eventsManager, 0);
  objc_storeStrong((id *)&self->_assertionGroup, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_sessionStateController);
  objc_destroyWeak((id *)&self->_profile);
}

@end
