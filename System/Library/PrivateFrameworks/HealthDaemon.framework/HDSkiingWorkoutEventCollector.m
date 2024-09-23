@implementation HDSkiingWorkoutEventCollector

+ (BOOL)isAvailableInCurrentHardware
{
  if (_HDIsUnitTesting)
    return 1;
  else
    return HKCoreMotionSupportsSkiingWorkoutSessions();
}

- (HDSkiingWorkoutEventCollector)initWithProfile:(id)a3 delegate:(id)a4
{
  HDSkiingWorkoutEventCollector *v4;
  HDSkiingWorkoutEventCollector *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CMSkiTracker *skiTracker;
  uint64_t v10;
  OS_dispatch_queue *workoutEventQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HDSkiingWorkoutEventCollector;
  v4 = -[HDWorkoutEventCollector initWithProfile:delegate:](&v13, sel_initWithProfile_delegate_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HDWorkoutEventCollector profile](v4, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "workoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "newCMSkiTracker");
    skiTracker = v5->_skiTracker;
    v5->_skiTracker = (CMSkiTracker *)v8;

    HKCreateSerialDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    workoutEventQueue = v5->_workoutEventQueue;
    v5->_workoutEventQueue = (OS_dispatch_queue *)v10;

  }
  return v5;
}

- (void)startWithSessionId:(id)a3
{
  id v4;
  NSObject *workoutEventQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  workoutEventQueue = self->_workoutEventQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HDSkiingWorkoutEventCollector_startWithSessionId___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(workoutEventQueue, block);

}

void __52__HDSkiingWorkoutEventCollector_startWithSessionId___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  id v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;
  __int128 buf;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  _QWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD **)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v2;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "Starting ski workout event collector for sessionID %@", (uint8_t *)&buf, 0xCu);
    }
    v10.receiver = v1;
    v10.super_class = (Class)HDSkiingWorkoutEventCollector;
    objc_msgSendSuper2(&v10, sel_startWithSessionId_, v2);
    v4 = objc_alloc(MEMORY[0x1E0CA56C0]);
    objc_msgSend(v1, "sessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithSessionId:", v5);
    v7 = (void *)v1[5];
    v1[5] = v6;

    v8 = (void *)v1[4];
    v9 = v1[5];
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v12 = __69__HDSkiingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke;
    v13 = &unk_1E6CF3370;
    v14 = v1;
    objc_msgSend(v8, "startUpdatesFromRecord:handler:", v9, &buf);
  }

}

- (void)stop
{
  NSObject *workoutEventQueue;
  _QWORD block[5];

  workoutEventQueue = self->_workoutEventQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HDSkiingWorkoutEventCollector_stop__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(workoutEventQueue, block);
}

id __37__HDSkiingWorkoutEventCollector_stop__block_invoke(id result)
{
  id *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = (id *)*((_QWORD *)result + 4);
  if (v1)
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      objc_msgSend(v1, "sessionId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5.receiver) = 138412290;
      *(id *)((char *)&v5.receiver + 4) = v4;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "Stopping ski workout event collector for sessionID: %@", (uint8_t *)&v5, 0xCu);

    }
    objc_msgSend(v1[4], "stopUpdates");
    v5.receiver = v1;
    v5.super_class = (Class)HDSkiingWorkoutEventCollector;
    return objc_msgSendSuper2(&v5, sel_stop);
  }
  return result;
}

+ (BOOL)supportsWorkoutActivityType:(unint64_t)a3
{
  return a3 == 61 || a3 == 67;
}

- (void)requestPendingEventsThroughDate:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *workoutEventQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  workoutEventQueue = self->_workoutEventQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__HDSkiingWorkoutEventCollector_requestPendingEventsThroughDate_completion___block_invoke;
  v8[3] = &unk_1E6CE9C08;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(workoutEventQueue, v8);

}

void __76__HDSkiingWorkoutEventCollector_requestPendingEventsThroughDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "sessionId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    -[HDSkiingWorkoutEventCollector _queue_querySkiDataWithCompletion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
  else
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "Terminating request for collecting pending ski events as sessionId is nil", v5, 2u);
    }
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, 1, 0);
  }
}

- (void)_queue_querySkiDataWithCompletion:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__HDSkiingWorkoutEventCollector__queue_querySkiDataWithCompletion___block_invoke;
    v7[3] = &unk_1E6CF28F8;
    v7[4] = a1;
    v8 = v3;
    objc_msgSend(v5, "querySkiUpdatesFromRecord:handler:", v6, v7);

  }
}

void __69__HDSkiingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__HDSkiingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke_2;
  v8[3] = &unk_1E6CE8080;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __69__HDSkiingWorkoutEventCollector__queue_startCollectionWithSessionId___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
    -[HDSkiingWorkoutEventCollector _queue_errorOccurred:](v1, v2);
  else
    -[HDSkiingWorkoutEventCollector _queue_querySkiDataWithCompletion:]((uint64_t)v1, 0);
}

- (void)_queue_errorOccurred:(void *)a1
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v3;
      _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "Error getting ski data: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    v5 = objc_alloc(MEMORY[0x1E0CB7048]);
    objc_msgSend(a1, "sessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithSessionId:error:", v6, v3);

    objc_msgSend(a1, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "receivedWorkoutEvent:", v7);

  }
}

void __67__HDSkiingWorkoutEventCollector__queue_querySkiDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__HDSkiingWorkoutEventCollector__queue_querySkiDataWithCompletion___block_invoke_2;
  v12[3] = &unk_1E6CE7E08;
  v12[4] = v7;
  v13 = v5;
  v14 = v6;
  v15 = v8;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

uint64_t __67__HDSkiingWorkoutEventCollector__queue_querySkiDataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  int *v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  long double v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  NSObject *v48;
  void *v49;
  os_log_t v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  uint64_t result;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[4];
  id v80;
  uint8_t v81[4];
  void *v82;
  _QWORD v83[4];
  _BYTE buf[24];
  uint64_t v85;
  uint64_t v86;

  v1 = a1;
  v86 = *MEMORY[0x1E0C80C00];
  v2 = *(id **)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v5 = v3;
  v6 = v5;
  if (v2)
  {
    if (v5)
    {
      -[HDSkiingWorkoutEventCollector _queue_errorOccurred:](v2, v5);
    }
    else
    {
      v63 = v1;
      v7 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
      v8 = objc_msgSend(v2[5], "recordId");
      v9 = (os_log_t *)MEMORY[0x1E0CB5380];
      if (!v8)
      {
        objc_msgSend(v4, "firstObject");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v2[5];
        v2[5] = (id)v10;

        _HKInitializeLogging();
        v12 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
        {
          v61 = v2[5];
          *(_DWORD *)v79 = 138412290;
          v80 = v61;
          _os_log_debug_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEBUG, "Setting initial reference ski data to %@", v79, 0xCu);
        }
      }
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v62 = v4;
      v13 = v4;
      v74 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
      if (v74)
      {
        v73 = *(_QWORD *)v76;
        v66 = *MEMORY[0x1E0CB5580];
        v67 = *MEMORY[0x1E0CB54B8];
        v64 = *MEMORY[0x1E0CB5500];
        v65 = *MEMORY[0x1E0CB5480];
        v68 = v13;
        do
        {
          for (i = 0; i != v74; ++i)
          {
            if (*(_QWORD *)v76 != v73)
              objc_enumerationMutation(v13);
            v15 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
            _HKInitializeLogging();
            v16 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v15;
              _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "Processing ski data: %@", buf, 0xCu);
            }
            objc_msgSend(v15, "sessionId");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "sessionId");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "isEqual:", v18);

            if ((v19 & 1) != 0)
            {
              v20 = objc_msgSend(v15, "recordId");
              if (v20 > objc_msgSend(*(id *)((char *)v2 + v7[523]), "recordId"))
              {
                objc_msgSend(v15, "runDistance");
                v22 = v21;
                objc_msgSend(*(id *)((char *)v2 + v7[523]), "runDistance");
                if (v22 - v23 > 2.22044605e-16)
                {
                  v24 = *(id *)((char *)v2 + v7[523]);
                  v25 = v15;
                  v26 = (void *)MEMORY[0x1E0CB6CD0];
                  v27 = v24;
                  objc_msgSend(v26, "unitFromString:", CFSTR("m/s"));
                  v28 = objc_claimAutoreleasedReturnValue();
                  v29 = (void *)MEMORY[0x1E0CB6A28];
                  objc_msgSend(v25, "runAvgSpeed");
                  objc_msgSend(v29, "quantityWithUnit:doubleValue:", v28);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = (void *)MEMORY[0x1E0CB6A28];
                  objc_msgSend(v25, "runMaxSpeed");
                  v70 = (void *)v28;
                  objc_msgSend(v30, "quantityWithUnit:doubleValue:", v28);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = (void *)MEMORY[0x1E0CB6A28];
                  objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "runSlope");
                  objc_msgSend(v31, "quantityWithUnit:doubleValue:", v32, (double)(tan(v33) * 100.0));
                  v34 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v25, "runElevationDescent");
                  v36 = v35;
                  objc_msgSend(v27, "runElevationDescent");
                  v38 = v37;

                  v39 = (void *)MEMORY[0x1E0CB6A28];
                  objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "quantityWithUnit:doubleValue:", v40, v36 - v38);
                  v41 = objc_claimAutoreleasedReturnValue();

                  v42 = objc_alloc(MEMORY[0x1E0CB3588]);
                  objc_msgSend(v25, "startDate");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "endDate");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = (void *)objc_msgSend(v42, "initWithStartDate:endDate:", v43, v44);

                  objc_msgSend(v45, "duration");
                  v69 = (void *)v34;
                  if (v46 == 0.0)
                  {
                    v47 = (void *)v41;
                    _HKInitializeLogging();
                    v9 = (os_log_t *)MEMORY[0x1E0CB5380];
                    v48 = *MEMORY[0x1E0CB5380];
                    v49 = v70;
                    v7 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      *(_QWORD *)&buf[4] = v25;
                      _os_log_error_impl(&dword_1B7802000, v48, OS_LOG_TYPE_ERROR, "Dropping zero-duration segment created from data: %{public}@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v83[0] = v67;
                    v83[1] = v66;
                    *(_QWORD *)buf = v72;
                    *(_QWORD *)&buf[8] = v71;
                    v83[2] = v65;
                    v83[3] = v64;
                    *(_QWORD *)&buf[16] = v34;
                    v85 = v41;
                    v47 = (void *)v41;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v83, 4);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    v55 = objc_alloc(MEMORY[0x1E0CB7048]);
                    objc_msgSend(v2, "sessionId");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    v57 = (void *)objc_msgSend(v55, "initWithEventType:sessionId:dateInterval:metadata:", 9, v56, v45, v54);

                    _HKInitializeLogging();
                    v9 = (os_log_t *)MEMORY[0x1E0CB5380];
                    v58 = *MEMORY[0x1E0CB5380];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v81 = 138412290;
                      v82 = v57;
                      _os_log_impl(&dword_1B7802000, v58, OS_LOG_TYPE_DEFAULT, "Generating workout segment event: %@", v81, 0xCu);
                    }
                    objc_msgSend(v2, "delegate");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "receivedWorkoutEvent:", v57);

                    v7 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
                    v49 = v70;
                  }

                  v13 = v68;
                }
                objc_storeStrong((id *)((char *)v2 + v7[523]), v15);
              }
            }
            else
            {
              _HKInitializeLogging();
              v50 = *v9;
              if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
              {
                v51 = v50;
                objc_msgSend(v15, "sessionId");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "sessionId");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v52;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v53;
                _os_log_impl(&dword_1B7802000, v51, OS_LOG_TYPE_DEFAULT, "Ignoring ski data with mismatched session id. Ski data session id: %@ [self sessionID]: %@", buf, 0x16u);

              }
            }
          }
          v74 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
        }
        while (v74);
      }

      v4 = v62;
      v1 = v63;
      v6 = 0;
    }
  }

  result = *(_QWORD *)(v1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(v1 + 48) == 0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutEventQueue, 0);
  objc_storeStrong((id *)&self->_referenceSkiData, 0);
  objc_storeStrong((id *)&self->_skiTracker, 0);
}

@end
