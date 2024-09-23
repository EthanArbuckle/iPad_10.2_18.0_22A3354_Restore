@implementation HDCoreMotionWorkoutInterface

- (HDCoreMotionWorkoutInterface)init
{
  HDCoreMotionWorkoutInterface *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  HDAssertionManager *v5;
  HDAssertionManager *assertionManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDCoreMotionWorkoutInterface;
  v2 = -[HDCoreMotionWorkoutInterface init](&v8, sel_init);
  if (v2)
  {
    HKCreateSerialDispatchQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E0D29808]);
    assertionManager = v2->_assertionManager;
    v2->_assertionManager = v5;

    -[HDAssertionManager addObserver:forAssertionIdentifier:queue:](v2->_assertionManager, "addObserver:forAssertionIdentifier:queue:", v2, CFSTR("HDWorkoutSessionAssertionIdentifierCoreMotion"), v2->_queue);
  }
  return v2;
}

- (CMWorkoutManager)cmWorkoutManager
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__207;
  v10 = __Block_byref_object_dispose__207;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__HDCoreMotionWorkoutInterface_cmWorkoutManager__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CMWorkoutManager *)v3;
}

void __48__HDCoreMotionWorkoutInterface_cmWorkoutManager__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[HDCoreMotionWorkoutInterface _queue_coreMotionWorkoutManager](*(dispatch_queue_t **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (dispatch_queue_t)_queue_coreMotionWorkoutManager
{
  dispatch_queue_t *v1;
  NSObject *v2;
  dispatch_queue_t v3;

  if (a1)
  {
    v1 = a1;
    dispatch_assert_queue_V2(a1[1]);
    if (!v1[2] && objc_msgSend(MEMORY[0x1E0CA5728], "isAvailable"))
    {
      v2 = objc_alloc_init(MEMORY[0x1E0CA5728]);
      v3 = v1[2];
      v1[2] = v2;

    }
    a1 = v1[2];
  }
  return a1;
}

- (CMWorkout)currentWorkout
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__207;
  v10 = __Block_byref_object_dispose__207;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__HDCoreMotionWorkoutInterface_currentWorkout__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CMWorkout *)v3;
}

void __46__HDCoreMotionWorkoutInterface_currentWorkout__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)dealloc
{
  objc_super v3;

  -[HDAssertionManager removeObserver:](self->_assertionManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)HDCoreMotionWorkoutInterface;
  -[HDCoreMotionWorkoutInterface dealloc](&v3, sel_dealloc);
}

- (id)takeCMWorkoutAssertionForOwnerIdentifier:(id)a3 sessionUUID:(id)a4 workoutConfiguration:(id)a5 activityConfigurations:(id)a6 enableWorkoutChangeDetection:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _HDCoreMotionAssertion *v16;
  id v17;
  id v18;
  id v19;
  HDCoreMotionWorkoutInterface *v20;
  NSString *v21;
  NSString *appIdentifier;
  NSObject *queue;
  _HDCoreMotionAssertion *v24;
  _HDCoreMotionAssertion *v25;
  _QWORD block[5];
  _HDCoreMotionAssertion *v29;
  objc_super v30;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = [_HDCoreMotionAssertion alloc];
  v17 = v14;
  v18 = v13;
  v19 = v12;
  if (v16)
  {
    v30.receiver = v16;
    v30.super_class = (Class)_HDCoreMotionAssertion;
    v20 = -[HDCoreMotionWorkoutInterface initWithAssertionIdentifier:ownerIdentifier:](&v30, sel_initWithAssertionIdentifier_ownerIdentifier_, CFSTR("HDWorkoutSessionAssertionIdentifierCoreMotion"), v15);
    v16 = (_HDCoreMotionAssertion *)v20;
    if (v20)
    {
      objc_storeStrong((id *)&v20[1]._cmWorkoutMets, a4);
      objc_storeStrong((id *)&v16->_workoutConfiguration, a5);
      objc_storeStrong((id *)&v16->_activityConfigurations, a6);
      v16->_enableWorkoutChangeDetection = a7;
    }
  }

  -[HDAssertion ownerIdentifier](v16, "ownerIdentifier");
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  appIdentifier = self->_appIdentifier;
  self->_appIdentifier = v21;

  if (-[HDAssertionManager takeAssertion:](self->_assertionManager, "takeAssertion:", v16))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __158__HDCoreMotionWorkoutInterface_takeCMWorkoutAssertionForOwnerIdentifier_sessionUUID_workoutConfiguration_activityConfigurations_enableWorkoutChangeDetection___block_invoke;
    block[3] = &unk_1E6CE8080;
    block[4] = self;
    v24 = v16;
    v29 = v24;
    dispatch_sync(queue, block);
    v25 = v24;

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

void __158__HDCoreMotionWorkoutInterface_takeCMWorkoutAssertionForOwnerIdentifier_sessionUUID_workoutConfiguration_activityConfigurations_enableWorkoutChangeDetection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id *v13;
  id v14;
  id *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  id *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id *)*(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
    if (v2)
    {
      v3 = v2[11];
      v4 = v2[12];
    }
    else
    {
      v3 = 0;
      v4 = 0;
    }
    v61 = 0;
    v5 = v4;
    -[HDCoreMotionWorkoutInterface _queue_cmWorkoutForConfiguration:sessionUUID:error:](v1, v3, v5, (uint64_t)&v61);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v61;
    if (v2)
    {
      objc_storeStrong(v2 + 13, v6);

      if (v2[13])
      {
        v8 = (id *)(v1 + 40);
        if (!*(_QWORD *)(v1 + 40))
        {
          -[HDCoreMotionWorkoutInterface _queue_coreMotionWorkoutManager]((dispatch_queue_t *)v1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = v2[12];
            v60 = 0;
            v12 = v11;
            v13 = v2;
            v14 = v12;
            v15 = v13;
            v59 = v14;
            dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
            v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            if (*((_BYTE *)v13 + 80) && objc_msgSend(v13[14], "count"))
            {
              v58 = v7;
              v57 = v10;
              _HKInitializeLogging();
              v17 = (void *)*MEMORY[0x1E0CB5380];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
              {
                v18 = v17;
                v19 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543362;
                v67 = v19;
                v20 = v19;
                _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding Multiple workouts to Workout Overview", buf, 0xCu);

              }
              v64 = 0u;
              v65 = 0u;
              v62 = 0u;
              v63 = 0u;
              v21 = v13[14];
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v62, buf, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v63;
                while (2)
                {
                  for (i = 0; i != v23; ++i)
                  {
                    if (*(_QWORD *)v63 != v24)
                      objc_enumerationMutation(v21);
                    v26 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
                    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HDCoreMotionWorkoutInterface _queue_cmWorkoutForConfiguration:sessionUUID:error:](v1, v26, v27, (uint64_t)&v60);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v28)
                    {

                      v34 = 0;
                      v10 = v57;
                      v7 = v58;
                      v8 = (id *)(v1 + 40);
                      v15 = v13;
                      v33 = v59;
                      goto LABEL_28;
                    }
                    objc_msgSend(v16, "addObject:", v28);

                  }
                  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v62, buf, 16);
                  if (v23)
                    continue;
                  break;
                }
              }

              objc_msgSend(v16, "firstObject");
              v29 = objc_claimAutoreleasedReturnValue();
              v15 = v13;
              objc_storeStrong(v13 + 13, v29);
              v10 = v57;
              v7 = v58;
              v8 = (id *)(v1 + 40);
            }
            else
            {
              objc_msgSend(v16, "addObject:", v13[13]);
              _HKInitializeLogging();
              v29 = (id)*MEMORY[0x1E0CB5380];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                v30 = (void *)objc_opt_class();
                v31 = v13[13];
                *(_DWORD *)buf = 138543618;
                v67 = v30;
                v68 = 2114;
                v69 = v31;
                v32 = v30;
                _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Single workout added to Workout Overview: %{public}@", buf, 0x16u);

                v15 = v13;
              }
            }

            v33 = v59;
            v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5738]), "initWithOverviewId:workouts:", v59, v16);
LABEL_28:

            v35 = v60;
            v36 = *(void **)(v1 + 48);
            *(_QWORD *)(v1 + 48) = v34;

            v37 = *(_QWORD *)(v1 + 48);
            _HKInitializeLogging();
            v38 = (void *)*MEMORY[0x1E0CB5380];
            if (v37)
            {
              v39 = v38;
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v40 = (void *)objc_opt_class();
                v41 = v15[13];
                *(_DWORD *)buf = 138543618;
                v67 = v40;
                v68 = 2114;
                v69 = v41;
                v42 = v15;
                v43 = v40;
                _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting CM workout: %{public}@", buf, 0x16u);

                v15 = v42;
              }

              objc_msgSend(v10, "beginWorkoutSession:withWorkout:enableWorkoutChangeDetection:", *(_QWORD *)(v1 + 48), v15[13], *((unsigned __int8 *)v15 + 80));
              objc_storeStrong(v8, v15[13]);
              objc_msgSend(*(id *)(v1 + 48), "overviewId");
              v44 = objc_claimAutoreleasedReturnValue();
              v45 = *(void **)(v1 + 56);
              *(_QWORD *)(v1 + 56) = v44;

            }
            else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
            {
              v51 = v38;
              v52 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v67 = v52;
              v68 = 2114;
              v69 = v35;
              v53 = v52;
              _os_log_error_impl(&dword_1B7802000, v51, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to create CMWorkoutOverview: %{public}@", buf, 0x16u);

            }
          }

          goto LABEL_39;
        }
        _HKInitializeLogging();
        v9 = (id)*MEMORY[0x1E0CB5380];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v46 = (void *)objc_opt_class();
          v47 = v2[13];
          v48 = v46;
          objc_msgSend(v47, "sessionId");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v1 + 40), "sessionId");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v67 = v46;
          v68 = 2112;
          v69 = v49;
          v70 = 2112;
          v71 = v50;
          _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Not starting CM workout %@ because workout %@ is in progress", buf, 0x20u);

        }
        goto LABEL_9;
      }
    }
    else
    {

    }
    _HKInitializeLogging();
    v54 = (void *)*MEMORY[0x1E0CB5380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    v9 = v54;
    v55 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v67 = v55;
    v68 = 2114;
    v69 = v7;
    v56 = v55;
    _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to create CMWorkout: %{public}@", buf, 0x16u);

LABEL_9:
LABEL_39:

  }
}

- (void)averageMETsForWorkoutSessionUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__207;
  v19 = __Block_byref_object_dispose__207;
  v20 = 0;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HDCoreMotionWorkoutInterface_averageMETsForWorkoutSessionUUID_completion___block_invoke;
  block[3] = &unk_1E6CE8110;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(queue, block);
  v10 = (void *)v16[5];
  if (v10)
  {
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __76__HDCoreMotionWorkoutInterface_averageMETsForWorkoutSessionUUID_completion___block_invoke_2;
    v12[3] = &unk_1E6D10E18;
    v13 = v7;
    objc_msgSend(v10, "queryWorkoutMetsWithSessionId:handler:", v6, v12);
    v11 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 110, CFSTR("Workout METs are not available for current device"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);
  }

  _Block_object_dispose(&v15, 8);
}

void __76__HDCoreMotionWorkoutInterface_averageMETsForWorkoutSessionUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 8));
    if (!*(_QWORD *)(v2 + 24) && objc_msgSend(MEMORY[0x1E0CA5730], "isAvailable"))
    {
      v3 = objc_alloc_init(MEMORY[0x1E0CA5730]);
      v4 = *(void **)(v2 + 24);
      *(_QWORD *)(v2 + 24) = v3;

    }
    v5 = *(id *)(v2 + 24);
  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __76__HDCoreMotionWorkoutInterface_averageMETsForWorkoutSessionUUID_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (!v9 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("kcal/(kg*hr)"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v9, "mets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v6, "quantityWithUnit:doubleValue:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)setCurrentActivity:(id)a3 isManualTransition:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__HDCoreMotionWorkoutInterface_setCurrentActivity_isManualTransition___block_invoke;
  block[3] = &unk_1E6CF7348;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(queue, block);

}

void __70__HDCoreMotionWorkoutInterface_setCurrentActivity_isManualTransition___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "workoutConfiguration");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    -[HDCoreMotionWorkoutInterface _queue_cmWorkoutForConfiguration:sessionUUID:error:](v3, v2, v4, (uint64_t)&v39);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v39;

    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 32);
      -[NSObject suggestedActivityUUID](v2, "suggestedActivityUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v5;
      v10 = v8;
      if (!v7)
        goto LABEL_12;
      v11 = *(void **)(v7 + 40);
      if (!v11)
        goto LABEL_12;
      v12 = objc_msgSend(v11, "type");
      if (v12 != objc_msgSend(v9, "type"))
        goto LABEL_12;
      v13 = objc_msgSend(*(id *)(v7 + 40), "locationType");
      if (v13 != objc_msgSend(v9, "locationType"))
        goto LABEL_12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_12;
        v14 = *(void **)(v7 + 40);
        v15 = v9;
        v16 = objc_msgSend(v14, "location");
        v17 = objc_msgSend(v15, "location");

        if (v16 != v17)
          goto LABEL_12;
      }
      if (!v10
        || (objc_msgSend(*(id *)(v7 + 40), "sessionId"),
            v18 = (id)objc_claimAutoreleasedReturnValue(),
            v18,
            v18 == v10))
      {

        _HKInitializeLogging();
        v29 = (void *)*MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          v30 = v29;
          v31 = (void *)objc_opt_class();
          v32 = v31;
          -[NSObject activityType](v2, "activityType");
          _HKWorkoutActivityNameForActivityType();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject locationType](v2, "locationType");
          _HKWorkoutSessionLocationTypeName();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v41 = v31;
          v42 = 2112;
          v43 = v33;
          v44 = 2112;
          v45 = v34;
          _os_log_impl(&dword_1B7802000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping current activity %@ (%@) since it matches previous", buf, 0x20u);

        }
      }
      else
      {
LABEL_12:

        -[HDCoreMotionWorkoutInterface _queue_coreMotionWorkoutManager](*(dispatch_queue_t **)(a1 + 32));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          _HKInitializeLogging();
          v20 = (void *)*MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
          {
            v21 = v20;
            v22 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v41 = v22;
            v42 = 2114;
            v43 = v9;
            v23 = v22;
            _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting current workout type to: %{public}@", buf, 0x16u);

          }
          objc_msgSend(v19, "setCurrentWorkoutType:isManualTransition:", v9, *(unsigned __int8 *)(a1 + 48));
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), v5);
        }

      }
    }
    else
    {
      _HKInitializeLogging();
      v28 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        v35 = v28;
        v36 = (void *)objc_opt_class();
        v37 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v41 = v36;
        v42 = 2112;
        v43 = v37;
        v44 = 2114;
        v45 = v6;
        v38 = v36;
        _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to start %@ because we could not create a CMWorkout: %{public}@", buf, 0x20u);

      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E0CB5380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      return;
    v2 = v24;
    v25 = (void *)objc_opt_class();
    v26 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v41 = v25;
    v42 = 2112;
    v43 = v26;
    v27 = v25;
    _os_log_error_impl(&dword_1B7802000, v2, OS_LOG_TYPE_ERROR, "[%{public}@] Not begining CM workout activity %@ because workout session did not start", buf, 0x16u);

  }
}

- (id)_queue_cmWorkoutForConfiguration:(void *)a3 sessionUUID:(uint64_t)a4 error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend(v7, "predictionSessionUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v7, "suggestedActivityUUID");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (void *)v12;
      else
        v14 = v8;
      v11 = v14;

    }
    v15 = objc_msgSend(v7, "locationType");
    v16 = objc_msgSend(v7, "activityType");
    v17 = objc_msgSend(v7, "shouldDisambiguateLocation");
    if (*MEMORY[0x1E0CB7438] == v16)
    {
      v16 = 0;
    }
    else
    {
      switch(v16)
      {
        case 1uLL:
          v16 = 42;
          break;
        case 3uLL:
          v16 = 41;
          break;
        case 4uLL:
          v16 = 52;
          break;
        case 5uLL:
          v16 = 60;
          break;
        case 6uLL:
          v16 = 50;
          break;
        case 8uLL:
          v16 = 64;
          break;
        case 0xAuLL:
          v16 = 61;
          break;
        case 0xDuLL:
          v36 = 4;
          if (v15 == 2)
            v36 = 5;
          v37 = v17 == 0;
          v38 = 3;
          goto LABEL_67;
        case 0x10uLL:
          v16 = 9;
          break;
        case 0x14uLL:
          v16 = 28;
          break;
        case 0x15uLL:
          v16 = 27;
          break;
        case 0x17uLL:
          v16 = 57;
          break;
        case 0x18uLL:
          break;
        case 0x19uLL:
          if (v15 == 2)
            v16 = 48;
          else
            v16 = 49;
          break;
        case 0x1BuLL:
          v16 = 45;
          break;
        case 0x1FuLL:
          v16 = 38;
          break;
        case 0x22uLL:
          v16 = 53;
          break;
        case 0x23uLL:
          if (v15 == 2)
            v16 = 12;
          else
            v16 = 35;
          break;
        case 0x24uLL:
          v16 = 44;
          break;
        case 0x25uLL:
          v36 = 17;
          if (v15 == 2)
            v36 = 18;
          v37 = v17 == 0;
          v38 = 2;
LABEL_67:
          if (v37)
            v16 = v36;
          else
            v16 = v38;
          break;
        case 0x27uLL:
          v39 = v15 == 2;
          v40 = 46;
          goto LABEL_72;
        case 0x29uLL:
          v39 = v15 == 2;
          v40 = 39;
LABEL_72:
          if (v39)
            v16 = v40 + 1;
          else
            v16 = v40;
          break;
        case 0x2AuLL:
          v16 = 59;
          break;
        case 0x2BuLL:
          v16 = 56;
          break;
        case 0x2CuLL:
          v16 = 11;
          break;
        case 0x2EuLL:
          v16 = 19;
          break;
        case 0x2FuLL:
          v16 = 62;
          break;
        case 0x30uLL:
          v16 = 51;
          break;
        case 0x31uLL:
          v16 = 58;
          break;
        case 0x33uLL:
          v16 = 55;
          break;
        case 0x34uLL:
          v41 = 15;
          if (v15 == 2)
            v41 = 16;
          if (v17)
            v16 = 1;
          else
            v16 = v41;
          break;
        case 0x39uLL:
          v16 = 6;
          break;
        case 0x3BuLL:
          v16 = 30;
          break;
        case 0x3CuLL:
          v16 = 36;
          break;
        case 0x3DuLL:
          v16 = 23;
          break;
        case 0x3FuLL:
          v16 = 22;
          break;
        case 0x40uLL:
          v16 = 63;
          break;
        case 0x41uLL:
          v16 = 34;
          break;
        case 0x42uLL:
          v16 = 32;
          break;
        case 0x43uLL:
          v16 = 37;
          break;
        case 0x46uLL:
          v16 = 20;
          break;
        case 0x47uLL:
          v16 = 21;
          break;
        case 0x48uLL:
          v16 = 31;
          break;
        case 0x4BuLL:
          v16 = 43;
          break;
        case 0x4DuLL:
          v16 = 7;
          break;
        case 0x4FuLL:
          v16 = 54;
          break;
        case 0x50uLL:
          v16 = 29;
          break;
        case 0x53uLL:
          v16 = 33;
          break;
        default:
          v16 = 14;
          break;
      }
    }
    v18 = objc_msgSend(v7, "shouldDisambiguateLocation");
    v19 = 1;
    if (v15 != 2)
      v19 = 2;
    if (v18)
      v20 = 3;
    else
      v20 = v19;
    v21 = 0;
    if (objc_msgSend(v7, "shouldUseExtendedMode"))
    {
      objc_opt_self();
      if (v16 <= 0x18 && ((1 << v16) & 0x1028006) != 0)
        v21 = 1;
    }
    objc_msgSend(v7, "fitnessPlusCatalogWorkoutId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = objc_alloc(MEMORY[0x1E0CA5640]);
      objc_msgSend(v7, "fitnessPlusCatalogWorkoutId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v7, "fitnessPlusMediaType");
      if ((unint64_t)(v25 - 1) >= 3)
        v26 = 0;
      else
        v26 = v25;
      v27 = (void *)objc_msgSend(v23, "initWithSessionId:type:catalogWorkoutId:mediaType:locationType:error:", v11, v16, v24, v26, v20, a4);

    }
    else if (objc_msgSend(v7, "activityType") == 46)
    {
      v28 = (objc_msgSend(v7, "swimmingLocationType") & 0xFFFFFFFFFFFFFFFDLL) == 0;
      objc_msgSend(v7, "lapLength");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "doubleValueForUnit:", v30);
        v32 = v31;

      }
      else
      {
        v32 = 0.0;
      }
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA56F0]), "initWithSessionId:location:poolLength:", v11, v28, v32);

    }
    else
    {
      if (v16 == 14)
      {
        v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5648]), "initWithSessionId:workoutLabel:", v11, objc_msgSend(v7, "activityType"));
      }
      else
      {
        objc_msgSend(v7, "fitnessMachineSessionUUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
          v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5638]), "initWithSessionId:workoutType:manufacturerName:model:", v11, v16, CFSTR("GymKit"), CFSTR("Fitness Machine"));
        else
          v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5720]), "initWithSessionId:type:locationType:mode:", v11, v16, v20, v21);
      }
      v27 = (void *)v33;
    }
    objc_msgSend(v27, "setAppId:", *(_QWORD *)(a1 + 64));

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)resumeWorkoutForWorkoutSessionUUID:(id)a3
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
  block[2] = __67__HDCoreMotionWorkoutInterface_resumeWorkoutForWorkoutSessionUUID___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __67__HDCoreMotionWorkoutInterface_resumeWorkoutForWorkoutSessionUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _BYTE v15[24];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v2 + 40))
    {
      -[HDCoreMotionWorkoutInterface _queue_coreMotionWorkoutManager]((dispatch_queue_t *)v2);
      v3 = objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        _HKInitializeLogging();
        v4 = (void *)*MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          v5 = v4;
          v6 = (void *)objc_opt_class();
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          *(_DWORD *)v15 = 138543618;
          *(_QWORD *)&v15[4] = v6;
          *(_WORD *)&v15[12] = 2114;
          *(_QWORD *)&v15[14] = v7;
          v8 = v6;
          _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resuming CM workout: %{public}@", v15, 0x16u);

        }
        -[NSObject resumeWorkout:](v3, "resumeWorkout:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_OWORD *)v15, *(_QWORD *)&v15[16]);
      }
      goto LABEL_7;
    }
  }
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v3 = v9;
    v10 = (void *)objc_opt_class();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v13 = v10;
    objc_msgSend(v12, "sessionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v15 = 138543874;
    *(_QWORD *)&v15[4] = v10;
    *(_WORD *)&v15[12] = 2112;
    *(_QWORD *)&v15[14] = v11;
    *(_WORD *)&v15[22] = 2112;
    v16 = v14;
    _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Not resuming CM workout %@ because workout %@ is in progress", v15, 0x20u);

LABEL_7:
  }
}

- (void)pauseWorkoutForWorkoutSessionUUID:(id)a3
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
  block[2] = __66__HDCoreMotionWorkoutInterface_pauseWorkoutForWorkoutSessionUUID___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __66__HDCoreMotionWorkoutInterface_pauseWorkoutForWorkoutSessionUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _BYTE v15[24];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v2 + 40))
    {
      -[HDCoreMotionWorkoutInterface _queue_coreMotionWorkoutManager]((dispatch_queue_t *)v2);
      v3 = objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        _HKInitializeLogging();
        v4 = (void *)*MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          v5 = v4;
          v6 = (void *)objc_opt_class();
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          *(_DWORD *)v15 = 138543618;
          *(_QWORD *)&v15[4] = v6;
          *(_WORD *)&v15[12] = 2114;
          *(_QWORD *)&v15[14] = v7;
          v8 = v6;
          _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Pausing CM workout: %{public}@", v15, 0x16u);

        }
        -[NSObject pauseWorkout:](v3, "pauseWorkout:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_OWORD *)v15, *(_QWORD *)&v15[16]);
      }
      goto LABEL_7;
    }
  }
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v3 = v9;
    v10 = (void *)objc_opt_class();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v13 = v10;
    objc_msgSend(v12, "sessionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v15 = 138543874;
    *(_QWORD *)&v15[4] = v10;
    *(_WORD *)&v15[12] = 2112;
    *(_QWORD *)&v15[14] = v11;
    *(_WORD *)&v15[22] = 2112;
    v16 = v14;
    _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Not pausing CM workout %@ because workout %@ is in progress", v15, 0x20u);

LABEL_7:
  }
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _QWORD *v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  CMWorkout *currentCMWorkout;
  NSUUID *currentSessionUUID;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  CMWorkout *v35;
  id v36;
  void *v37;
  NSUUID *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  NSUUID *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCoreMotionWorkoutInterface.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[assertion isKindOfClass:[_HDCoreMotionAssertion class]]"));

  }
  v7 = v6;
  v40 = v7;
  if (v7)
    v8 = (void *)*((_QWORD *)v7 + 12);
  else
    v8 = 0;
  v9 = v8;
  -[HDAssertionManager activeAssertionsForIdentifier:](self->_assertionManager, "activeAssertionsForIdentifier:", CFSTR("HDWorkoutSessionAssertionIdentifierCoreMotion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, buf, 16);
  if (!v11)
  {

LABEL_19:
    v17 = v40;
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (v40
      && (v18 = *((id *)v17 + 13)) != 0
      && (v19 = v18,
          v20 = -[NSUUID isEqual:](self->_currentSessionUUID, "isEqual:", *((_QWORD *)v17 + 12)),
          v19,
          v20))
    {
      -[HDCoreMotionWorkoutInterface _queue_coreMotionWorkoutManager]((dispatch_queue_t *)self);
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        _HKInitializeLogging();
        v22 = (void *)*MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          v23 = v22;
          v24 = (void *)objc_opt_class();
          v25 = (void *)*((_QWORD *)v17 + 13);
          *(_DWORD *)buf = 138543618;
          v46 = v24;
          v47 = 2114;
          v48 = v25;
          v26 = v24;
          _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping CM workout: %{public}@", buf, 0x16u);

        }
        -[NSObject endWorkoutSession:](v21, "endWorkoutSession:", *((_QWORD *)v17 + 13));
      }
      currentCMWorkout = self->_currentCMWorkout;
      self->_currentCMWorkout = 0;

      currentSessionUUID = self->_currentSessionUUID;
      self->_currentSessionUUID = 0;

    }
    else
    {
      _HKInitializeLogging();
      v21 = (id)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v29 = (void *)objc_opt_class();
        if (v40)
          v30 = (void *)*((_QWORD *)v17 + 13);
        else
          v30 = 0;
        v31 = v30;
        v32 = v29;
        objc_msgSend(v31, "sessionId");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
          v34 = (void *)*((_QWORD *)v17 + 12);
        else
          v34 = 0;
        v35 = self->_currentCMWorkout;
        v36 = v34;
        -[CMWorkout sessionId](v35, "sessionId");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = self->_currentSessionUUID;
        *(_DWORD *)buf = 138544386;
        v46 = v29;
        v47 = 2114;
        v48 = v33;
        v49 = 2114;
        v50 = v34;
        v51 = 2114;
        v52 = v37;
        v53 = 2114;
        v54 = v38;
        _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Not stopping CM workout %{public}@ (overview %{public}@) because workout %{public}@ (overview %{public}@) is in progress", buf, 0x34u);

      }
    }

    goto LABEL_29;
  }
  v12 = v11;
  v13 = 0;
  v14 = *(_QWORD *)v42;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v42 != v14)
        objc_enumerationMutation(v10);
      v16 = *(_QWORD **)(*((_QWORD *)&v41 + 1) + 8 * i);
      if (v16)
        v16 = (_QWORD *)v16[12];
      if (v16 == v9)
        ++v13;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, buf, 16);
  }
  while (v12);

  if (!v13)
    goto LABEL_19;
LABEL_29:

}

- (void)unitTest_setCMWorkoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_cmWorkoutManager, a3);
}

- (void)unitTest_addCoreMotionAssertionObserver:(id)a3
{
  -[HDAssertionManager addObserver:forAssertionIdentifier:queue:](self->_assertionManager, "addObserver:forAssertionIdentifier:queue:", a3, CFSTR("HDWorkoutSessionAssertionIdentifierCoreMotion"), MEMORY[0x1E0C80D38]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSessionUUID, 0);
  objc_storeStrong((id *)&self->_cmWorkoutOverview, 0);
  objc_storeStrong((id *)&self->_currentCMWorkout, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_cmWorkoutMets, 0);
  objc_storeStrong((id *)&self->_cmWorkoutManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
