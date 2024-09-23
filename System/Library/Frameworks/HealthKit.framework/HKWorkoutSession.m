@implementation HKWorkoutSession

+ (id)targetWorkoutSessionStateMachineForSessionUUID:(id)a3
{
  id v4;
  HKStateMachine *v5;
  void *v6;
  HKStateMachine *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v4 = a3;
  v5 = [HKStateMachine alloc];
  +[HKStateMachine nameForOwner:UUID:tag:](HKStateMachine, "nameForOwner:UUID:tag:", a1, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HKStateMachine initWithName:](v5, "initWithName:", v6);
  -[HKStateMachine addStateWithIndex:label:](v7, "addStateWithIndex:label:", 1, CFSTR("NotStarted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStateMachine addStateWithIndex:label:](v7, "addStateWithIndex:label:", 2, CFSTR("Running"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStateMachine addStateWithIndex:label:](v7, "addStateWithIndex:label:", 3, CFSTR("Ended"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStateMachine addStateWithIndex:label:](v7, "addStateWithIndex:label:", 4, CFSTR("Paused"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStateMachine addStateWithIndex:label:](v7, "addStateWithIndex:label:", 5, CFSTR("Prepared"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStateMachine addStateWithIndex:label:](v7, "addStateWithIndex:label:", 6, CFSTR("Stopped"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v8, v12, 1, CFSTR("prepare"));
  v15 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v8, v9, 2, CFSTR("start"));
  v16 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v12, v9, 2, CFSTR("start"));
  v17 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v12, v10, 6, CFSTR("start"));
  v18 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v9, v11, 3, CFSTR("pause"));
  v19 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v11, v9, 4, CFSTR("resume"));
  v20 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v9, v13, 5, CFSTR("stop"));
  v21 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v11, v13, 5, CFSTR("stop"));
  v22 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v9, v10, 6, CFSTR("end"));
  v23 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v11, v10, 6, CFSTR("end"));
  v24 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v13, v10, 6, CFSTR("end"));
  v25 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v8, v10, 7, CFSTR("error"));
  v26 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v9, v10, 7, CFSTR("error"));
  v27 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v11, v10, 7, CFSTR("error"));
  v28 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v12, v10, 7, CFSTR("error"));
  v29 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v13, v10, 7, CFSTR("error"));
  v30 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v7, "addStateTransitionFrom:to:event:label:", v10, v10, 7, CFSTR("error"));

  return v7;
}

- (HKWorkoutSession)initWithActivityType:(HKWorkoutActivityType)activityType locationType:(HKWorkoutSessionLocationType)locationType
{
  HKWorkoutConfiguration *v7;
  HKWorkoutSession *v8;
  id v9;
  id v11;

  v7 = objc_alloc_init(HKWorkoutConfiguration);
  -[HKWorkoutConfiguration setActivityType:](v7, "setActivityType:", activityType);
  -[HKWorkoutConfiguration setLocationType:](v7, "setLocationType:", locationType);
  v11 = 0;
  v8 = -[HKWorkoutSession initWithConfiguration:error:](self, "initWithConfiguration:error:", v7, &v11);
  v9 = v11;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid activity type/location combination when instantiating HKWorkoutSession: %@"), v9);

  return v8;
}

- (HKWorkoutSession)initWithConfiguration:(HKWorkoutConfiguration *)workoutConfiguration error:(NSError *)error
{
  HKWorkoutConfiguration *v6;
  HKWorkoutSessionTaskConfiguration *v7;
  void *v8;
  HKWorkoutSession *v9;

  v6 = workoutConfiguration;
  v7 = objc_alloc_init(HKWorkoutSessionTaskConfiguration);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutSessionTaskConfiguration setSessionUUID:](v7, "setSessionUUID:", v8);

  -[HKWorkoutSessionTaskConfiguration setWorkoutConfiguration:](v7, "setWorkoutConfiguration:", v6);
  -[HKWorkoutSessionTaskConfiguration setSessionType:](v7, "setSessionType:", 0);
  -[HKWorkoutSessionTaskConfiguration setShouldStopPreviousSession:](v7, "setShouldStopPreviousSession:", 1);
  v9 = -[HKWorkoutSession _initWithHealthStore:taskConfiguration:error:](self, "_initWithHealthStore:taskConfiguration:error:", 0, v7, error);

  return v9;
}

- (HKWorkoutSession)initWithHealthStore:(HKHealthStore *)healthStore configuration:(HKWorkoutConfiguration *)workoutConfiguration error:(NSError *)error
{
  HKHealthStore *v8;
  HKWorkoutConfiguration *v9;
  HKWorkoutSessionTaskConfiguration *v10;
  void *v11;
  void *v12;
  HKWorkoutSession *v13;

  v8 = healthStore;
  v9 = workoutConfiguration;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A valid %@ object is required."), objc_opt_class());
  v10 = objc_alloc_init(HKWorkoutSessionTaskConfiguration);
  -[HKWorkoutConfiguration predictionSessionUUID](v9, "predictionSessionUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HKWorkoutSessionTaskConfiguration setSessionUUID:](v10, "setSessionUUID:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKWorkoutSessionTaskConfiguration setSessionUUID:](v10, "setSessionUUID:", v12);

  }
  -[HKWorkoutSessionTaskConfiguration setWorkoutConfiguration:](v10, "setWorkoutConfiguration:", v9);
  -[HKWorkoutSessionTaskConfiguration setSessionType:](v10, "setSessionType:", 0);
  -[HKWorkoutSessionTaskConfiguration setShouldStopPreviousSession:](v10, "setShouldStopPreviousSession:", 1);
  v13 = -[HKWorkoutSession _initWithHealthStore:taskConfiguration:error:](self, "_initWithHealthStore:taskConfiguration:error:", v8, v10, error);

  return v13;
}

- (id)_initWithHealthStore:(id)a3 taskConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  HKWorkoutSession *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HKWorkoutSession *v20;
  HKWorkoutSession *v21;
  uint64_t v22;
  OS_dispatch_queue *queue;
  uint64_t v24;
  OS_dispatch_queue *clientQueue;
  uint64_t v26;
  HKWorkoutSessionTaskConfiguration *configuration;
  void *v28;
  void *v29;
  uint64_t v30;
  HKStateMachine *targetStateMachine;
  NSMutableArray *v32;
  NSMutableArray *dataUpdateQueue;
  objc_super v35;
  uint8_t buf[4];
  HKWorkoutSession *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "workoutConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "validateIgnoringDeviceSupport:error:", 0, a5);

  if (!v11)
    goto LABEL_4;
  objc_msgSend(v9, "workoutConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "activityType");

  if (v13 == 84)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 12, CFSTR("Workout session does not support this activity type"));
LABEL_4:
    v14 = 0;
    goto LABEL_14;
  }
  _HKInitializeLogging();
  v15 = (void *)HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v9, "workoutConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = self;
    v38 = 2112;
    v39 = v17;
    _os_log_impl(&dword_19A0E6000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Initializing workout session with configuration %@", buf, 0x16u);

  }
  objc_msgSend(v9, "sessionUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSessionUUID:", v19);

  }
  v35.receiver = self;
  v35.super_class = (Class)HKWorkoutSession;
  v20 = -[HKWorkoutSession init](&v35, sel_init);
  v21 = v20;
  if (v20)
  {
    HKCreateSerialDispatchQueue(v20, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    queue = v21->_queue;
    v21->_queue = (OS_dispatch_queue *)v22;

    HKCreateSerialDispatchQueue(v21, CFSTR("client"));
    v24 = objc_claimAutoreleasedReturnValue();
    clientQueue = v21->_clientQueue;
    v21->_clientQueue = (OS_dispatch_queue *)v24;

    v26 = objc_msgSend(v9, "copy");
    configuration = v21->_configuration;
    v21->_configuration = (HKWorkoutSessionTaskConfiguration *)v26;

    v21->_state = 1;
    if (v8)
      -[HKWorkoutSession _setupWithHealthStore:](v21, "_setupWithHealthStore:", v8);
    v28 = (void *)objc_opt_class();
    objc_msgSend(v9, "sessionUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "targetWorkoutSessionStateMachineForSessionUUID:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    targetStateMachine = v21->_targetStateMachine;
    v21->_targetStateMachine = (HKStateMachine *)v30;

    -[HKStateMachine setDelegate:](v21->_targetStateMachine, "setDelegate:", v21);
    -[HKStateMachine enterAtState:](v21->_targetStateMachine, "enterAtState:", 1);
    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dataUpdateQueue = v21->_dataUpdateQueue;
    v21->_dataUpdateQueue = v32;

  }
  self = v21;
  v14 = self;
LABEL_14:

  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HKWorkoutSessionTaskConfiguration sessionUUID](self->_configuration, "sessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HKRemoveRunningWorkoutSessionUUID(v3);

  v4.receiver = self;
  v4.super_class = (Class)HKWorkoutSession;
  -[HKWorkoutSession dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKWorkoutSessionTaskConfiguration sessionUUID](self->_configuration, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKWorkoutSessionStateToString(self->_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKWorkoutSessionTypeToString(-[HKWorkoutSessionTaskConfiguration sessionType](self->_configuration, "sessionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %@ [%@]>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)_setupWithHealthStore:(id)a3
{
  HKHealthStore *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  HKTaskServerProxyProvider *v17;
  HKHealthStore *healthStore;
  void *v19;
  HKTaskServerProxyProvider *v20;
  HKTaskServerProxyProvider *proxyProvider;
  HKHealthStore *v22;

  v5 = (HKHealthStore *)a3;
  if (self->_healthStore != v5)
  {
    v22 = v5;
    objc_storeStrong((id *)&self->_healthStore, a3);
    -[HKWorkoutSessionTaskConfiguration setRequiresCoreLocationAssertion:](self->_configuration, "setRequiresCoreLocationAssertion:", HKProgramSDKAtLeast(0x7E10901FFFFFFFFLL, v6) ^ 1);
    if (HKProgramSDKAtLeast(0x7E50901FFFFFFFFLL, v7))
    {
      objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
        objc_msgSend(v9, "extensionPointRecord");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.watchkit"));

        v8 = v9;
        if (v12)
        {
          objc_msgSend(v9, "containingBundleRecord");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      objc_msgSend(v8, "infoDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:ofClass:", CFSTR("WKSupportsAlwaysOnDisplay"), objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "BOOLValue");
      if (v14)
        v16 = v15;
      else
        v16 = 1;

    }
    else
    {
      v16 = 0;
    }
    -[HKWorkoutSessionTaskConfiguration setSupports3rdPartyAOT:](self->_configuration, "setSupports3rdPartyAOT:", v16);
    v17 = [HKTaskServerProxyProvider alloc];
    healthStore = self->_healthStore;
    -[HKWorkoutSessionTaskConfiguration sessionUUID](self->_configuration, "sessionUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v17, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", healthStore, CFSTR("HKWorkoutSessionTaskServer"), self, v19);
    proxyProvider = self->_proxyProvider;
    self->_proxyProvider = v20;

    -[HKTaskServerProxyProvider setTaskConfiguration:](self->_proxyProvider, "setTaskConfiguration:", self->_configuration);
    v5 = v22;
  }

}

- (void)_recoverWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  HKTaskServerProxyProvider *proxyProvider;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__HKWorkoutSession__recoverWithCompletion___block_invoke;
  v10[3] = &unk_1E37F1378;
  v10[4] = self;
  v11 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __43__HKWorkoutSession__recoverWithCompletion___block_invoke_3;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

void __43__HKWorkoutSession__recoverWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning post-client-crash recovery.", buf, 0xCu);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HKWorkoutSession__recoverWithCompletion___block_invoke_59;
  v7[3] = &unk_1E37E67C0;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v3, "remote_recoverWithCompletion:", v7);

}

void __43__HKWorkoutSession__recoverWithCompletion___block_invoke_59(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HKWorkoutSession__recoverWithCompletion___block_invoke_2;
  block[3] = &unk_1E37F1350;
  block[4] = v6;
  v13 = a2;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_sync(v8, block);

}

uint64_t __43__HKWorkoutSession__recoverWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "sessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetWorkoutSessionStateMachineForSessionUUID:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "enterAtState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __43__HKWorkoutSession__recoverWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_queue_markRecoveryRequired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[HKWorkoutSessionTaskConfiguration requiresRecovery](self->_configuration, "requiresRecovery"))
  {
    -[HKWorkoutSessionTaskConfiguration setRequiresRecovery:](self->_configuration, "setRequiresRecovery:", 1);
    -[HKTaskServerProxyProvider setTaskConfiguration:](self->_proxyProvider, "setTaskConfiguration:", self->_configuration);
  }
}

- (BOOL)_queue_shouldAttemptRecovery
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return (self->_state < 7uLL) & (0x76u >> self->_state);
}

- (void)_queue_resetStateMachineWithNewState:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  HKStateMachine *v10;
  HKStateMachine *targetStateMachine;
  int v12;
  HKWorkoutSession *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v5 = (void *)HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    HKWorkoutSessionStateToString(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Resetting target state machine after state update to to %{public}@", (uint8_t *)&v12, 0x16u);

  }
  v8 = (void *)objc_opt_class();
  -[HKWorkoutSessionTaskConfiguration sessionUUID](self->_configuration, "sessionUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "targetWorkoutSessionStateMachineForSessionUUID:", v9);
  v10 = (HKStateMachine *)objc_claimAutoreleasedReturnValue();
  targetStateMachine = self->_targetStateMachine;
  self->_targetStateMachine = v10;

  -[HKStateMachine setDelegate:](self->_targetStateMachine, "setDelegate:", self);
  -[HKStateMachine enterAtState:](self->_targetStateMachine, "enterAtState:", a3);
}

- (id)_privateDelegate
{
  void *v2;
  void *v3;
  id v4;

  -[HKWorkoutSession delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE40F828))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

+ (BOOL)_applicationHasRunningWorkout
{
  BOOL v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_HKRunningWorkoutSessionLock);
  v2 = objc_msgSend((id)_HKRunningWorkoutSessionUUIDs, "count") != 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_HKRunningWorkoutSessionLock);
  return v2;
}

+ (id)clientInterface
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F888);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_didGenerateEvents_, 0, 0);
  return v2;
}

+ (id)serverInterface
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F8E8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_enableAutomaticDetectionForActivityConfigurations_completion_, 0, 0);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  v8[3] = objc_opt_class();
  v8[4] = objc_opt_class();
  v8[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_remote_beginNewActivityWithConfiguration_date_metadata_completion_, 2, 0);
  return v2;
}

- (id)exportedInterface
{
  return +[HKWorkoutSession clientInterface](HKWorkoutSession, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKWorkoutSession serverInterface](HKWorkoutSession, "serverInterface");
}

- (void)connectionInterrupted
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__HKWorkoutSession_connectionInterrupted__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __41__HKWorkoutSession_connectionInterrupted__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_shouldAttemptRecovery");
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 64);
    v5[4] = v3;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__HKWorkoutSession_connectionInterrupted__block_invoke_2;
    v6[3] = &unk_1E37E6D68;
    v6[4] = v3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__HKWorkoutSession_connectionInterrupted__block_invoke_191;
    v5[3] = &unk_1E37E6A70;
    return objc_msgSend(v4, "fetchProxyWithHandler:errorHandler:", v6, v5);
  }
  return result;
}

void __41__HKWorkoutSession_connectionInterrupted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning recovery after server interruption.", buf, 0xCu);
  }
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__HKWorkoutSession_connectionInterrupted__block_invoke_187;
  v11[3] = &unk_1E37E6BD8;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "remote_recoverWithCompletion:", v11);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "currentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "index");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __41__HKWorkoutSession_connectionInterrupted__block_invoke_189;
  v10[3] = &unk_1E37E6BD8;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "remote_setTargetState:date:completion:", v8, v9, v10);

}

void __41__HKWorkoutSession_connectionInterrupted__block_invoke_187(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed recovery after server interruption.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __41__HKWorkoutSession_connectionInterrupted__block_invoke_187_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "client_didFailWithError:", v5);
    if (objc_msgSend(*(id *)(a1 + 32), "type") == 1)
      objc_msgSend(*(id *)(a1 + 32), "client_didDisconnectFromRemoteWithError:completion:", v5, &__block_literal_global_78);
  }

}

void __41__HKWorkoutSession_connectionInterrupted__block_invoke_189(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated target state after server interruption.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __41__HKWorkoutSession_connectionInterrupted__block_invoke_189_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "client_didFailWithError:", v5);
  }

}

void __41__HKWorkoutSession_connectionInterrupted__block_invoke_191(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __41__HKWorkoutSession_connectionInterrupted__block_invoke_191_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "client_didFailWithError:", v3);
  if (objc_msgSend(*(id *)(a1 + 32), "type") == 1)
    objc_msgSend(*(id *)(a1 + 32), "client_didDisconnectFromRemoteWithError:completion:", v3, &__block_literal_global_193);

}

- (void)client_didUpdateStartDate:(id)a3 endDate:(id)a4
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
  block[2] = __54__HKWorkoutSession_client_didUpdateStartDate_endDate___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __54__HKWorkoutSession_client_didUpdateStartDate_endDate___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "_queue_markRecoveryRequired");
  _HKInitializeLogging();
  v2 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v12 = 138543874;
    v13 = v3;
    v14 = 2114;
    v15 = v4;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Update interval: %{public}@ - %{public}@", (uint8_t *)&v12, 0x20u);
  }
  v6 = objc_msgSend(a1[5], "copy");
  v7 = a1[4];
  v8 = (void *)v7[5];
  v7[5] = v6;

  v9 = objc_msgSend(a1[6], "copy");
  v10 = a1[4];
  v11 = (void *)v10[6];
  v10[6] = v9;

}

- (void)client_didChangeToState:(int64_t)a3 date:(id)a4
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
  block[2] = __49__HKWorkoutSession_client_didChangeToState_date___block_invoke;
  block[3] = &unk_1E37E69A8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

void __49__HKWorkoutSession_client_didChangeToState_date___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queue_markRecoveryRequired");
  _HKInitializeLogging();
  v2 = (void *)HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 32);
    v5 = v2;
    HKWorkoutSessionStateToString(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKWorkoutSessionStateToString(*(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v27 = v3;
    v28 = 2114;
    v29 = v6;
    v30 = 2114;
    v31 = v7;
    v32 = 2114;
    v33 = v8;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) State changed from %{public}@ -> %{public}@ at %{public}@", buf, 0x2Au);

  }
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 32);
  if (v9 != v11)
  {
    *(_QWORD *)(v10 + 32) = v9;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(v12 + 32);
    if (v13 <= 6)
    {
      if (((1 << v13) & 0x74) != 0)
      {
        objc_msgSend(*(id *)(v12 + 56), "sessionUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          os_unfair_lock_lock((os_unfair_lock_t)&_HKRunningWorkoutSessionLock);
          v15 = (void *)_HKRunningWorkoutSessionUUIDs;
          if (!_HKRunningWorkoutSessionUUIDs)
          {
            v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v17 = (void *)_HKRunningWorkoutSessionUUIDs;
            _HKRunningWorkoutSessionUUIDs = (uint64_t)v16;

            v15 = (void *)_HKRunningWorkoutSessionUUIDs;
          }
          objc_msgSend(v15, "addObject:", v14);
          os_unfair_lock_unlock((os_unfair_lock_t)&_HKRunningWorkoutSessionLock);
        }
        goto LABEL_12;
      }
      if (((1 << v13) & 0xA) != 0)
      {
        objc_msgSend(*(id *)(v12 + 56), "sessionUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        _HKRemoveRunningWorkoutSessionUUID(v14);
LABEL_12:

      }
    }
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(a1 + 40);
    v20 = *(NSObject **)(v18 + 16);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[2] = __49__HKWorkoutSession_client_didChangeToState_date___block_invoke_194;
    v22[3] = &unk_1E37F13E0;
    v22[1] = 3221225472;
    v21 = *(_QWORD *)(a1 + 48);
    v22[4] = v18;
    v24 = v21;
    v25 = v11;
    v23 = v19;
    dispatch_async(v20, v22);

  }
}

void __49__HKWorkoutSession_client_didChangeToState_date___block_invoke_194(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  v3 = a1[6];
  v4 = a1[7];
  v5 = a1[4];
  v7 = WeakRetained;
  if (a1[5])
  {
    objc_msgSend(WeakRetained, "workoutSession:didChangeToState:fromState:date:", v5, v3, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workoutSession:didChangeToState:fromState:date:", v5, v3, v4, v6);

  }
}

- (void)client_didGenerateEvents:(id)a3
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
  v7[2] = __45__HKWorkoutSession_client_didGenerateEvents___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __45__HKWorkoutSession_client_didGenerateEvents___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queue_markRecoveryRequired");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        +[HKWorkoutEvent _workoutEventWithInternalEvent:](HKWorkoutEvent, "_workoutEventWithInternalEvent:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __45__HKWorkoutSession_client_didGenerateEvents___block_invoke_2;
            block[3] = &unk_1E37E6738;
            v10 = WeakRetained;
            v11 = *(_QWORD *)(a1 + 32);
            v13 = v10;
            v14 = v11;
            v15 = v7;
            dispatch_async(v9, block);

          }
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

uint64_t __45__HKWorkoutSession_client_didGenerateEvents___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workoutSession:didGenerateEvent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)client_didFailWithError:(id)a3
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
  v7[2] = __44__HKWorkoutSession_client_didFailWithError___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __44__HKWorkoutSession_client_didFailWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_queue_markRecoveryRequired");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "sessionUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HKRemoveRunningWorkoutSessionUUID(v2);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__HKWorkoutSession_client_didFailWithError___block_invoke_2;
  v6[3] = &unk_1E37E6980;
  v6[4] = v3;
  v7 = v4;
  dispatch_async(v5, v6);

}

void __44__HKWorkoutSession_client_didFailWithError___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "workoutSession:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)client_synchronizeWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HKWorkoutSession_client_synchronizeWithCompletion___block_invoke;
  block[3] = &unk_1E37E6CD0;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __53__HKWorkoutSession_client_synchronizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)client_didSyncSessionEvent:(int64_t)a3 date:(id)a4
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
  block[2] = __52__HKWorkoutSession_client_didSyncSessionEvent_date___block_invoke;
  block[3] = &unk_1E37E69A8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __52__HKWorkoutSession_client_didSyncSessionEvent_date___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  v2 = a1[4];
  v1 = a1[5];
  v3 = *(void **)(v2 + 96);
  v4 = a1[6];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HKWorkoutSession_client_didSyncSessionEvent_date___block_invoke_2;
  v6[3] = &unk_1E37E6BD8;
  v6[4] = v2;
  return objc_msgSend(v3, "enqueueEvent:date:error:completion:", v4, v1, 0, v6);
}

void __52__HKWorkoutSession_client_didSyncSessionEvent_date___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v9 = 138543874;
    if (a2)
      v8 = CFSTR("YES");
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Enqueued synced event with success: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

}

- (void)client_didSyncCurrentActivity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HKWorkoutSession *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__HKWorkoutSession_client_didSyncCurrentActivity___block_invoke;
  v7[3] = &unk_1E37E6980;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __50__HKWorkoutSession_client_didSyncCurrentActivity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "currentActivity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "workoutConfiguration");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "beginNewActivityWithConfiguration:date:metadata:", v11, v9, v10);

      goto LABEL_9;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "currentActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "endDate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endCurrentActivityOnDate:");
LABEL_9:

    }
  }
}

- (void)client_didUpdateWorkoutConfiguration:(id)a3
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
  v7[2] = __57__HKWorkoutSession_client_didUpdateWorkoutConfiguration___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __57__HKWorkoutSession_client_didUpdateWorkoutConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setWorkoutConfiguration:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_queue_markRecoveryRequired");
  objc_msgSend(*(id *)(a1 + 32), "_privateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__HKWorkoutSession_client_didUpdateWorkoutConfiguration___block_invoke_2;
    block[3] = &unk_1E37E6738;
    v4 = v2;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = v4;
    v9 = v5;
    v10 = v6;
    dispatch_async(v3, block);

  }
}

uint64_t __57__HKWorkoutSession_client_didUpdateWorkoutConfiguration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workoutSession:didUpdateWorkoutConfiguration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)client_didBeginActivity:(id)a3 date:(id)a4
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
  block[2] = __49__HKWorkoutSession_client_didBeginActivity_date___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __49__HKWorkoutSession_client_didBeginActivity_date___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  char v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setCurrentActivity:", v2);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = *(NSObject **)(v5 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__HKWorkoutSession_client_didBeginActivity_date___block_invoke_2;
    block[3] = &unk_1E37E6738;
    block[4] = v5;
    v9 = v6;
    v10 = *(id *)(a1 + 48);
    dispatch_async(v7, block);

  }
}

void __49__HKWorkoutSession_client_didBeginActivity_date___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "workoutSession:didBeginActivityWithConfiguration:date:", v2, v3, *(_QWORD *)(a1 + 48));

}

- (void)client_didEndActivity:(id)a3 date:(id)a4
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
  block[2] = __47__HKWorkoutSession_client_didEndActivity_date___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __47__HKWorkoutSession_client_didEndActivity_date___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setCurrentActivity:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = *(NSObject **)(v4 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__HKWorkoutSession_client_didEndActivity_date___block_invoke_2;
    block[3] = &unk_1E37E6738;
    block[4] = v4;
    v8 = v5;
    v9 = *(id *)(a1 + 48);
    dispatch_async(v6, block);

  }
}

void __47__HKWorkoutSession_client_didEndActivity_date___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "workoutSession:didEndActivityWithConfiguration:date:", v2, v3, *(_QWORD *)(a1 + 48));

}

- (void)client_didSuggestWorkoutConfiguration:(id)a3 date:(id)a4
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
  block[2] = __63__HKWorkoutSession_client_didSuggestWorkoutConfiguration_date___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __63__HKWorkoutSession_client_didSuggestWorkoutConfiguration_date___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_privateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__HKWorkoutSession_client_didSuggestWorkoutConfiguration_date___block_invoke_2;
    v7[3] = &unk_1E37EBEA8;
    v4 = v2;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = *(id *)(a1 + 48);
    dispatch_async(v3, v7);

  }
}

uint64_t __63__HKWorkoutSession_client_didSuggestWorkoutConfiguration_date___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workoutSession:didSuggestWorkoutConfiguration:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)client_didReceiveDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4
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
  block[2] = __77__HKWorkoutSession_client_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __77__HKWorkoutSession_client_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[4];
  id v18;
  uint64_t v19;
  id v20;

  v2 = (uint64_t)(a1 + 4);
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(NSObject **)(a1[4] + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__HKWorkoutSession_client_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke_2;
    block[3] = &unk_1E37E6738;
    v5 = WeakRetained;
    v6 = a1[4];
    v7 = (void *)a1[5];
    v18 = v5;
    v19 = v6;
    v20 = v7;
    dispatch_async(v4, block);
    (*(void (**)(void))(a1[6] + 16))();

    v8 = v18;
  }
  else
  {
    _HKInitializeLogging();
    v9 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __77__HKWorkoutSession_client_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke_cold_1(v2, v9, v10, v11, v12, v13, v14, v15);
    v16 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Remote session delegate is not set up."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v8);
  }

}

uint64_t __77__HKWorkoutSession_client_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workoutSession:didReceiveDataFromRemoteWorkoutSession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)client_remoteSessionDidRecover
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HKWorkoutSession_client_remoteSessionDidRecover__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(queue, block);
}

void __50__HKWorkoutSession_client_remoteSessionDidRecover__block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to send data to remote session."));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_queue_pendingDataUpdateDidCompleteWithSuccess:error:", 0, v2);

  }
}

- (void)client_didDisconnectFromRemoteWithError:(id)a3 completion:(id)a4
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
  block[2] = __71__HKWorkoutSession_client_didDisconnectFromRemoteWithError_completion___block_invoke;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __71__HKWorkoutSession_client_didDisconnectFromRemoteWithError_completion___block_invoke(_QWORD *a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD block[4];
  id v20;
  uint64_t v21;
  id v22;

  v2 = (id *)(a1 + 4);
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_storeStrong((id *)*v2 + 9, v2[1]);
  v4 = objc_opt_respondsToSelector();
  if ((v4 & 1) != 0)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v5 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __71__HKWorkoutSession_client_didDisconnectFromRemoteWithError_completion___block_invoke_cold_1((uint64_t)v2, v5, v6, v7, v8, v9, v10, v11);
    v12 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 125, CFSTR("Workout session doesn't have a delegate."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  if (objc_msgSend(*v2, "type") == 1)
  {
    objc_msgSend(*((id *)*v2 + 8), "invalidate");
    v14 = (void *)*((_QWORD *)*v2 + 8);
    *((_QWORD *)*v2 + 8) = 0;

  }
  if ((v4 & 1) != 0)
  {
    v15 = *(NSObject **)(a1[4] + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__HKWorkoutSession_client_didDisconnectFromRemoteWithError_completion___block_invoke_213;
    block[3] = &unk_1E37E6738;
    v16 = WeakRetained;
    v17 = a1[4];
    v18 = (void *)a1[5];
    v20 = v16;
    v21 = v17;
    v22 = v18;
    dispatch_async(v15, block);

  }
}

uint64_t __71__HKWorkoutSession_client_didDisconnectFromRemoteWithError_completion___block_invoke_213(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workoutSession:didDisconnectFromRemoteDeviceWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_enqueueStateEvent:(int64_t)a3 date:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v12[5];
  id v13;
  int64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  int64_t v18;

  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[HKWorkoutSession type](self, "type"))
  {
    v10 = MEMORY[0x1E0C809B0];
    proxyProvider = self->_proxyProvider;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__HKWorkoutSession__queue_enqueueStateEvent_date_completion___block_invoke;
    v15[3] = &unk_1E37F1408;
    v18 = a3;
    v16 = v8;
    v17 = v9;
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __61__HKWorkoutSession__queue_enqueueStateEvent_date_completion___block_invoke_2;
    v12[3] = &unk_1E37E9F38;
    v12[4] = self;
    v13 = v17;
    v14 = a3;
    -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v12);

  }
  else
  {
    -[HKStateMachine enqueueEvent:date:error:completion:](self->_targetStateMachine, "enqueueEvent:date:error:completion:", a3, v8, 0, v9);
  }

}

uint64_t __61__HKWorkoutSession__queue_enqueueStateEvent_date_completion___block_invoke(_QWORD *a1, void *a2)
{
  objc_msgSend(a2, "remote_syncSessionEvent:date:", a1[6], a1[4]);
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __61__HKWorkoutSession__queue_enqueueStateEvent_date_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_isInvalidatedMirroredSession"))
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_notMirroringError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
  else
  {
    _HKInitializeLogging();
    v6 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = 138543874;
      v12 = v9;
      v13 = 2048;
      v14 = v10;
      v15 = 2114;
      v16 = v3;
      _os_log_error_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to sync state event %li with error: %{public}@", (uint8_t *)&v11, 0x20u);
    }
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to sync state transition to the primary session."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
}

- (void)stateMachine:(id)a3 didIgnoreEvent:(int64_t)a4 state:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  HKWorkoutSession *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  _HKInitializeLogging();
  v9 = (void *)HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    HKWorkoutSessionEventToString(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = self;
    v19 = 2114;
    v20 = v11;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Invalid event %{public}@ from current state %{public}@", buf, 0x20u);

  }
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v13 = objc_opt_class();
  HKWorkoutSessionEventToString(a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v13, a2, CFSTR("Unable to perform '%@' from current state '%@'"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutSession client_didFailWithError:](self, "client_didFailWithError:", v16);

}

- (void)stateMachine:(id)a3 didTransition:(id)a4 fromState:(id)a5 toState:(id)a6 date:(id)a7 error:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  const char *v22;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  HKWorkoutSession *v30;
  uint8_t buf[4];
  HKWorkoutSession *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  _HKInitializeLogging();
  v20 = HKLogWorkouts;
  v21 = os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (!v21)
      goto LABEL_7;
    *(_DWORD *)buf = 138543618;
    v32 = self;
    v33 = 2114;
    v34 = v15;
    v22 = "%{public}@: (#w2) %{public}@";
  }
  else
  {
    if (!v21)
      goto LABEL_7;
    *(_DWORD *)buf = 138543618;
    v32 = self;
    v33 = 2114;
    v34 = v17;
    v22 = "%{public}@: (#w2) Entered at %{public}@";
  }
  _os_log_impl(&dword_19A0E6000, v20, OS_LOG_TYPE_DEFAULT, v22, buf, 0x16u);
LABEL_7:
  if (objc_msgSend(v17, "index") != 1)
  {
    proxyProvider = self->_proxyProvider;
    v24 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke;
    v27[3] = &unk_1E37F1430;
    v28 = v17;
    v29 = v18;
    v30 = self;
    v25[0] = v24;
    v25[1] = 3221225472;
    v25[2] = __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke_220;
    v25[3] = &unk_1E37F1458;
    v25[4] = self;
    v26 = v28;
    -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v27, v25);

  }
}

void __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "index");
  v5 = *(void **)(a1 + 40);
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke_2;
  v7[3] = &unk_1E37E6A20;
  v7[4] = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "remote_setTargetState:date:completion:", v4, v6, v7);
  if (!v5)

}

void __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke_2_cold_1();
    if (objc_msgSend(v5, "hk_isHealthKitErrorWithCode:", 4))
      objc_msgSend(*(id *)(a1 + 32), "client_didFailWithError:", v5);
  }

}

void __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke_220(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke_2_cold_1();
  if (objc_msgSend(v3, "hk_isHealthKitErrorWithCode:", 4))
    objc_msgSend(*(id *)(a1 + 32), "client_didFailWithError:", v3);

}

- (void)prepare
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __27__HKWorkoutSession_prepare__block_invoke;
  v2[3] = &unk_1E37E6BD8;
  v2[4] = self;
  -[HKWorkoutSession prepareWithCompletion:](self, "prepareWithCompletion:", v2);
}

void __27__HKWorkoutSession_prepare__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Prepared", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __27__HKWorkoutSession_prepare__block_invoke_cold_1();
  }

}

- (void)prepareWithCompletion:(id)a3
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
  block[2] = __42__HKWorkoutSession_prepareWithCompletion___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __42__HKWorkoutSession_prepareWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queue_enqueueStateEvent:date:completion:", 1, v3, *(_QWORD *)(a1 + 40));

}

- (void)startActivityWithDate:(NSDate *)date
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__HKWorkoutSession_startActivityWithDate___block_invoke;
  v3[3] = &unk_1E37E6BD8;
  v3[4] = self;
  -[HKWorkoutSession startActivityWithDate:completion:](self, "startActivityWithDate:completion:", date, v3);
}

void __42__HKWorkoutSession_startActivityWithDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Started", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __42__HKWorkoutSession_startActivityWithDate___block_invoke_cold_1();
  }

}

- (void)startActivityWithDate:(id)a3 completion:(id)a4
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
  block[2] = __53__HKWorkoutSession_startActivityWithDate_completion___block_invoke;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __53__HKWorkoutSession_startActivityWithDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_enqueueStateEvent:date:completion:", 2, v2, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_queue_enqueueStateEvent:date:completion:", 2, v4, *(_QWORD *)(a1 + 48));

  }
}

- (void)stopActivityWithDate:(NSDate *)date
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__HKWorkoutSession_stopActivityWithDate___block_invoke;
  v3[3] = &unk_1E37E6BD8;
  v3[4] = self;
  -[HKWorkoutSession stopActivityWithDate:completion:](self, "stopActivityWithDate:completion:", date, v3);
}

void __41__HKWorkoutSession_stopActivityWithDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopped", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __41__HKWorkoutSession_stopActivityWithDate___block_invoke_cold_1();
  }

}

- (void)stopActivityWithDate:(id)a3 completion:(id)a4
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
  block[2] = __52__HKWorkoutSession_stopActivityWithDate_completion___block_invoke;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __52__HKWorkoutSession_stopActivityWithDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_enqueueStateEvent:date:completion:", 5, v2, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_queue_enqueueStateEvent:date:completion:", 5, v4, *(_QWORD *)(a1 + 48));

  }
}

- (void)end
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __23__HKWorkoutSession_end__block_invoke;
  v2[3] = &unk_1E37E6BD8;
  v2[4] = self;
  -[HKWorkoutSession endWithCompletion:](self, "endWithCompletion:", v2);
}

void __23__HKWorkoutSession_end__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Ended", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __23__HKWorkoutSession_end__block_invoke_cold_1();
  }

}

- (void)endWithCompletion:(id)a3
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
  block[2] = __38__HKWorkoutSession_endWithCompletion___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __38__HKWorkoutSession_endWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queue_enqueueStateEvent:date:completion:", 6, v3, *(_QWORD *)(a1 + 40));

}

- (void)pause
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __25__HKWorkoutSession_pause__block_invoke;
  v2[3] = &unk_1E37E6BD8;
  v2[4] = self;
  -[HKWorkoutSession pauseWithCompletion:](self, "pauseWithCompletion:", v2);
}

void __25__HKWorkoutSession_pause__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Paused", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __25__HKWorkoutSession_pause__block_invoke_cold_1();
  }

}

- (void)pauseWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutSession pauseWithDate:completion:](self, "pauseWithDate:completion:", v6, v5);

}

- (void)pauseWithDate:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  -[HKHealthStore _actionCompletionOnClientQueue:](self->_healthStore, "_actionCompletionOnClientQueue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HKWorkoutSession_pauseWithDate_completion___block_invoke;
  block[3] = &unk_1E37E8738;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

void __45__HKWorkoutSession_pauseWithDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "_queue_isInvalidatedMirroredSession"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_notMirroringError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_enqueueStateEvent:date:completion:", 3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

- (void)resume
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __26__HKWorkoutSession_resume__block_invoke;
  v2[3] = &unk_1E37E6BD8;
  v2[4] = self;
  -[HKWorkoutSession resumeWithCompletion:](self, "resumeWithCompletion:", v2);
}

void __26__HKWorkoutSession_resume__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Resumed", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __26__HKWorkoutSession_resume__block_invoke_cold_1();
  }

}

- (void)resumeWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutSession resumeWithDate:completion:](self, "resumeWithDate:completion:", v6, v5);

}

- (void)resumeWithDate:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  -[HKHealthStore _actionCompletionOnClientQueue:](self->_healthStore, "_actionCompletionOnClientQueue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__HKWorkoutSession_resumeWithDate_completion___block_invoke;
  block[3] = &unk_1E37E8738;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

void __46__HKWorkoutSession_resumeWithDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "_queue_isInvalidatedMirroredSession"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_notMirroringError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_enqueueStateEvent:date:completion:", 4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

- (NSUUID)identifier
{
  return -[HKWorkoutSessionTaskConfiguration sessionUUID](self->_configuration, "sessionUUID");
}

- (HKWorkoutSessionType)type
{
  return -[HKWorkoutSessionTaskConfiguration sessionType](self->_configuration, "sessionType");
}

- (HKWorkoutActivityType)activityType
{
  void *v2;
  HKWorkoutActivityType v3;

  -[HKWorkoutSessionTaskConfiguration workoutConfiguration](self->_configuration, "workoutConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activityType");

  return v3;
}

- (HKWorkoutSessionLocationType)locationType
{
  void *v2;
  HKWorkoutSessionLocationType v3;

  -[HKWorkoutSessionTaskConfiguration workoutConfiguration](self->_configuration, "workoutConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "locationType");

  return v3;
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return -[HKWorkoutSessionTaskConfiguration workoutConfiguration](self->_configuration, "workoutConfiguration");
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  id v5;
  uint64_t v6;
  id WeakRetained;
  NSObject *clientQueue;
  _QWORD v9[4];
  id v10;
  HKWorkoutSession *v11;

  v5 = delegate;
  objc_storeWeak((id *)&self->_delegate, v5);
  if ((HKProgramSDKAtLeast(0x7E10901FFFFFFFFLL, v6) & 1) == 0)
    objc_storeStrong((id *)&self->_strongDelegate, delegate);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (-[HKWorkoutSession _isInvalidatedMirroredSession](self, "_isInvalidatedMirroredSession")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    clientQueue = self->_clientQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __32__HKWorkoutSession_setDelegate___block_invoke;
    v9[3] = &unk_1E37E6980;
    v10 = WeakRetained;
    v11 = self;
    dispatch_async(clientQueue, v9);

  }
}

uint64_t __32__HKWorkoutSession_setDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workoutSession:didDisconnectFromRemoteDeviceWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
}

- (HKWorkoutSessionState)state
{
  NSObject *queue;
  HKWorkoutSessionState v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 3;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__HKWorkoutSession_state__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__HKWorkoutSession_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (NSDate)startDate
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
  v9 = __Block_byref_object_copy__34;
  v10 = __Block_byref_object_dispose__34;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__HKWorkoutSession_startDate__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __29__HKWorkoutSession_startDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (NSDate)endDate
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
  v9 = __Block_byref_object_copy__34;
  v10 = __Block_byref_object_dispose__34;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__HKWorkoutSession_endDate__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __27__HKWorkoutSession_endDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (BOOL)isGymKitSession
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HKWorkoutSessionTaskConfiguration workoutConfiguration](self->_configuration, "workoutConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fitnessMachineSessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)shouldStopPreviousSession
{
  return -[HKWorkoutSessionTaskConfiguration shouldStopPreviousSession](self->_configuration, "shouldStopPreviousSession");
}

- (void)setShouldStopPreviousSession:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__HKWorkoutSession_setShouldStopPreviousSession___block_invoke;
  v4[3] = &unk_1E37E8990;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __49__HKWorkoutSession_setShouldStopPreviousSession___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setShouldStopPreviousSession:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setTaskConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
}

- (BOOL)supportsAppRelaunchForRecovery
{
  return -[HKWorkoutSessionTaskConfiguration supportsAppRelaunchForRecovery](self->_configuration, "supportsAppRelaunchForRecovery");
}

- (void)setSupportsAppRelaunchForRecovery:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__HKWorkoutSession_setSupportsAppRelaunchForRecovery___block_invoke;
  v4[3] = &unk_1E37E8990;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __54__HKWorkoutSession_setSupportsAppRelaunchForRecovery___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setSupportsAppRelaunchForRecovery:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setTaskConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
}

- (HKWorkoutActivity)currentActivity
{
  void *v3;
  void *v4;
  uint64_t v5;
  HKWorkoutActivity *v6;
  void *v7;

  -[HKWorkoutSessionTaskConfiguration currentActivity](self->_configuration, "currentActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKWorkoutSessionTaskConfiguration currentActivity](self->_configuration, "currentActivity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
  }
  else
  {
    v6 = [HKWorkoutActivity alloc];
    -[HKWorkoutSessionTaskConfiguration workoutConfiguration](self->_configuration, "workoutConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[HKWorkoutActivity initWithWorkoutConfiguration:startDate:endDate:metadata:](v6, "initWithWorkoutConfiguration:startDate:endDate:metadata:", v4, self->_startDate, 0, 0);
  }
  v7 = (void *)v5;

  return (HKWorkoutActivity *)v7;
}

- (HKLiveWorkoutBuilder)associatedWorkoutBuilder
{
  void *v3;
  void *v4;

  +[HKDevice localDevice](HKDevice, "localDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutSession associatedWorkoutBuilderWithDevice:goalType:goal:](self, "associatedWorkoutBuilderWithDevice:goalType:goal:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKLiveWorkoutBuilder *)v4;
}

- (id)associatedWorkoutBuilderWithDevice:(id)a3 goalType:(unint64_t)a4 goal:(id)a5
{
  id v8;
  id v9;
  HKLiveWorkoutBuilder *associatedWorkoutBuilder;
  HKWorkoutBuilderConfiguration *v11;
  void *v12;
  HKLiveWorkoutBuilder *v13;
  HKHealthStore *healthStore;
  void *v15;
  HKLiveWorkoutBuilder *v16;
  HKLiveWorkoutBuilder *v17;
  HKLiveWorkoutBuilder *v18;

  v8 = a3;
  v9 = a5;
  associatedWorkoutBuilder = self->_associatedWorkoutBuilder;
  if (!associatedWorkoutBuilder)
  {
    if (!self->_healthStore)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("An associated workout builder can only be created for HKWorkoutSession objects created via initWithHealthStore:configuration:error"));
      v18 = 0;
      goto LABEL_5;
    }
    v11 = objc_alloc_init(HKWorkoutBuilderConfiguration);
    -[HKWorkoutBuilderConfiguration setDevice:](v11, "setDevice:", v8);
    -[HKWorkoutBuilderConfiguration setGoal:](v11, "setGoal:", v9);
    -[HKWorkoutBuilderConfiguration setGoalType:](v11, "setGoalType:", a4);
    -[HKWorkoutSessionTaskConfiguration workoutConfiguration](self->_configuration, "workoutConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKWorkoutBuilderConfiguration setWorkoutConfiguration:](v11, "setWorkoutConfiguration:", v12);

    -[HKWorkoutBuilderConfiguration setShouldCollectWorkoutEvents:](v11, "setShouldCollectWorkoutEvents:", 1);
    v13 = [HKLiveWorkoutBuilder alloc];
    healthStore = self->_healthStore;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HKLiveWorkoutBuilder initWithHealthStore:session:builderConfiguration:builderIdentifier:](v13, "initWithHealthStore:session:builderConfiguration:builderIdentifier:", healthStore, self, v11, v15);
    v17 = self->_associatedWorkoutBuilder;
    self->_associatedWorkoutBuilder = v16;

    -[HKWorkoutSession _setupTaskServerWithCompletion:](self, "_setupTaskServerWithCompletion:", &__block_literal_global_227);
    associatedWorkoutBuilder = self->_associatedWorkoutBuilder;
  }
  v18 = associatedWorkoutBuilder;
LABEL_5:

  return v18;
}

- (void)_setAssociatedWorkoutBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_associatedWorkoutBuilder, a3);
}

- (NSArray)activityConfigurations
{
  return -[HKWorkoutSessionTaskConfiguration activityConfigurations](self->_configuration, "activityConfigurations");
}

- (void)enableAutomaticDetectionForActivityConfigurations:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  HKWorkoutSession *v10;

  v4 = a3;
  proxyProvider = self->_proxyProvider;
  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke;
  v8[3] = &unk_1E37F14A0;
  v9 = v4;
  v10 = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_231;
  v7[3] = &unk_1E37E6A70;
  v6 = v4;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v8, v7);

}

void __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke(int8x16_t *a1, void *a2)
{
  int8x16_t v2;
  _QWORD v3[4];
  int8x16_t v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_2;
  v3[3] = &unk_1E37E6A20;
  v2 = a1[2];
  v4 = vextq_s8(v2, v2, 8uLL);
  objc_msgSend(a2, "remote_enableAutomaticDetectionForActivityConfigurations:completion:", (id)v2.i64[0], v3);

}

void __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v14 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Automatic detection for activities enabled", buf, 0xCu);
    }
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v10 = *(NSObject **)(v8 + 8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_228;
    v11[3] = &unk_1E37E6980;
    v11[4] = v8;
    v12 = v9;
    dispatch_async(v10, v11);

  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_2_cold_1();
  }

}

void __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_228(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setActivityConfigurations:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_privateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_2_230;
    block[3] = &unk_1E37E6738;
    v4 = v2;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = v4;
    v9 = v5;
    v10 = v6;
    dispatch_async(v3, block);

  }
}

uint64_t __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_2_230(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workoutSession:didEnableAutomaticDetectionForActivityConfigurations:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_231(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_2_cold_1();

}

- (void)beginNewActivityWithConfiguration:(HKWorkoutConfiguration *)workoutConfiguration date:(NSDate *)date metadata:(NSDictionary *)metadata
{
  HKWorkoutConfiguration *v8;
  NSDate *v9;
  NSDictionary *v10;
  HKTaskServerProxyProvider *proxyProvider;
  NSDictionary *v12;
  NSDate *v13;
  HKWorkoutConfiguration *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  HKWorkoutConfiguration *v17;
  NSDate *v18;
  NSDictionary *v19;
  HKWorkoutSession *v20;

  v8 = workoutConfiguration;
  v9 = date;
  v10 = metadata;
  proxyProvider = self->_proxyProvider;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke;
  v16[3] = &unk_1E37F14C8;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v20 = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke_232;
  v15[3] = &unk_1E37E6A70;
  v15[4] = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v15);

}

void __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v4 = a1[4];
  v3 = (void *)a1[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke_2;
  v6[3] = &unk_1E37E6A20;
  v5 = a1[6];
  v6[4] = a1[7];
  v7 = v3;
  objc_msgSend(a2, "remote_beginNewActivityWithConfiguration:date:metadata:completion:", v4, v7, v5, v6);

}

void __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) New activity began with date: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke_2_cold_1();
  }

}

void __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke_232(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke_2_cold_1();

}

- (void)endCurrentActivityOnDate:(NSDate *)date
{
  NSDate *v4;
  HKTaskServerProxyProvider *proxyProvider;
  NSDate *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  NSDate *v9;
  HKWorkoutSession *v10;

  v4 = date;
  proxyProvider = self->_proxyProvider;
  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke;
  v8[3] = &unk_1E37F14A0;
  v9 = v4;
  v10 = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke_233;
  v7[3] = &unk_1E37E6A70;
  v6 = v4;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v8, v7);

}

void __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke(int8x16_t *a1, void *a2)
{
  int8x16_t v2;
  _QWORD v3[4];
  int8x16_t v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke_2;
  v3[3] = &unk_1E37E6A20;
  v2 = a1[2];
  v4 = vextq_s8(v2, v2, 8uLL);
  objc_msgSend(a2, "remote_endCurrentActivityOnDate:completion:", (id)v2.i64[0], v3);

}

void __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Current activity ended with date: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke_2_cold_1();
  }

}

void __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke_233(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke_2_cold_1();

}

- (void)startMirroringToCompanionDeviceWithCompletion:(void *)completion
{
  void *v5;
  void *v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v5 = completion;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKWorkoutSession.m"), 1092, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke;
  v13[3] = &unk_1E37F1378;
  v13[4] = self;
  v14 = v6;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke_241;
  v11[3] = &unk_1E37E69F8;
  v11[4] = self;
  v12 = v14;
  v9 = v14;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v13, v11);

}

void __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke_2;
  v4[3] = &unk_1E37E67C0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "remote_startMirroringToCompanionDeviceWithCompletion:", v4);

}

void __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Started mirroring to remote session", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke_241(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)stopMirroringToCompanionDeviceWithCompletion:(void *)completion
{
  void *v5;
  void *v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v5 = completion;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKWorkoutSession.m"), 1112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke;
  v13[3] = &unk_1E37F1378;
  v13[4] = self;
  v14 = v6;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke_242;
  v11[3] = &unk_1E37E69F8;
  v11[4] = self;
  v12 = v14;
  v9 = v14;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v13, v11);

}

void __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke_2;
  v4[3] = &unk_1E37E67C0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "remote_stopMirroringToCompanionDeviceWithCompletion:", v4);

}

void __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Stopped mirroring to remote session", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke_242(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)sendDataToRemoteWorkoutSession:(NSData *)data completion:(void *)completion
{
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  HKWorkoutMirroringDataUpdate *v9;
  void *v10;
  void *v11;
  NSData *v12;

  v12 = data;
  v7 = completion;
  if (v12)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKWorkoutSession.m"), 1140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKWorkoutSession.m"), 1141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  if (-[HKWorkoutSession _isInvalidatedMirroredSession](self, "_isInvalidatedMirroredSession"))
  {
    -[HKHealthStore _actionCompletionOnClientQueue:](self->_healthStore, "_actionCompletionOnClientQueue:", v7);
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    -[HKWorkoutSession _notMirroringError](self, "_notMirroringError");
    v9 = (HKWorkoutMirroringDataUpdate *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, HKWorkoutMirroringDataUpdate *))v8)[2](v8, 0, v9);
  }
  else
  {
    -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v7);
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    v9 = -[HKWorkoutMirroringDataUpdate initWithData:completion:]([HKWorkoutMirroringDataUpdate alloc], "initWithData:completion:", v12, v8);
    -[HKWorkoutSession _enqueueDataUpdate:](self, "_enqueueDataUpdate:", v9);
  }

}

- (void)_queue_sendPendingDataUpdateToRemoteWorkoutSession
{
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[5];
  id v8;
  id location;

  if (self->_pendingDataUpdate)
  {
    objc_initWeak(&location, self);
    proxyProvider = self->_proxyProvider;
    v4 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke;
    v7[3] = &unk_1E37F1518;
    v7[4] = self;
    objc_copyWeak(&v8, &location);
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke_246;
    v5[3] = &unk_1E37F1540;
    v5[4] = self;
    objc_copyWeak(&v6, &location);
    -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v7, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke_2;
  v5[3] = &unk_1E37F14F0;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v6, (id *)(a1 + 40));
  objc_msgSend(v3, "remote_sendDataToRemoteWorkoutSession:completion:", v4, v5);

  objc_destroyWeak(&v6);
}

void __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Sent data to remote session", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke_2_cold_1();
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_dataUpdateWithUUID:didCompleteWithSuccess:error:", v9, a2, v5);

}

void __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke_246(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke_2_cold_1();
  if ((objc_msgSend(*(id *)(a1 + 32), "_isInvalidatedMirroredSession") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_notMirroringError");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_dataUpdateWithUUID:didCompleteWithSuccess:error:", v7, 0, v5);

}

- (void)_enqueueDataUpdate:(id)a3
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
  v7[2] = __39__HKWorkoutSession__enqueueDataUpdate___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __39__HKWorkoutSession__enqueueDataUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 112))
    return objc_msgSend(*(id *)(v2 + 104), "addObject:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(v2 + 112), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_sendPendingDataUpdateToRemoteWorkoutSession");
}

- (void)_dataUpdateWithUUID:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HKWorkoutSession *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__HKWorkoutSession__dataUpdateWithUUID_didCompleteWithSuccess_error___block_invoke;
  v13[3] = &unk_1E37E8708;
  v14 = v8;
  v15 = self;
  v17 = a4;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __69__HKWorkoutSession__dataUpdateWithUUID_didCompleteWithSuccess_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
    objc_msgSend(*(id *)(a1 + 40), "_queue_pendingDataUpdateDidCompleteWithSuccess:error:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_queue_pendingDataUpdateDidCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  HKWorkoutMirroringDataUpdate *pendingDataUpdate;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  HKWorkoutMirroringDataUpdate *v9;
  HKWorkoutMirroringDataUpdate *v10;

  v4 = a3;
  pendingDataUpdate = self->_pendingDataUpdate;
  v7 = a4;
  -[HKWorkoutMirroringDataUpdate completionHandler](pendingDataUpdate, "completionHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _BOOL8, id))v8)[2](v8, v4, v7);

  -[NSMutableArray hk_dequeue](self->_dataUpdateQueue, "hk_dequeue");
  v9 = (HKWorkoutMirroringDataUpdate *)objc_claimAutoreleasedReturnValue();
  v10 = self->_pendingDataUpdate;
  self->_pendingDataUpdate = v9;

  -[HKWorkoutSession _queue_sendPendingDataUpdateToRemoteWorkoutSession](self, "_queue_sendPendingDataUpdateToRemoteWorkoutSession");
}

- (void)_setupTaskServerWithCompletion:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;

  v4 = a3;
  proxyProvider = self->_proxyProvider;
  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__HKWorkoutSession__setupTaskServerWithCompletion___block_invoke;
  v8[3] = &unk_1E37F1568;
  v9 = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HKWorkoutSession__setupTaskServerWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6A70;
  v6 = v4;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v8, v7);

}

uint64_t __51__HKWorkoutSession__setupTaskServerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setupTaskServerWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __51__HKWorkoutSession__setupTaskServerWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __51__HKWorkoutSession__setupTaskServerWithCompletion___block_invoke_2_cold_1();

}

- (void)_setupMirroredSessionTaskServerWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  HKTaskServerProxyProvider *proxyProvider;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke;
  v10[3] = &unk_1E37F1378;
  v10[4] = self;
  v11 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke_3;
  v8[3] = &unk_1E37E69F8;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

void __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke_2;
  v4[3] = &unk_1E37F1590;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "remote_setupMirroredSessionWithHandler:", v4);

}

void __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void (*v19)(void);
  id v20;

  v3 = a2;
  v20 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "sessionState") != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(v20, "sessionState");
      v4 = (void *)objc_opt_class();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "sessionUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "targetWorkoutSessionStateMachineForSessionUUID:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 96);
      *(_QWORD *)(v7 + 96) = v6;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setDelegate:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "enterAtState:", objc_msgSend(v20, "sessionState"));
    }
    objc_msgSend(v20, "currentActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setCurrentActivity:", v10);

    objc_msgSend(v20, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    objc_msgSend(v20, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 48);
    *(_QWORD *)(v17 + 48) = v16;

    v19 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v19 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v19();

}

void __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke_3_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)_isInvalidatedMirroredSession
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
  v5[2] = __49__HKWorkoutSession__isInvalidatedMirroredSession__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__HKWorkoutSession__isInvalidatedMirroredSession__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_isInvalidatedMirroredSession");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_isInvalidatedMirroredSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return !self->_proxyProvider && -[HKWorkoutSession type](self, "type") == HKWorkoutSessionTypeMirrored;
}

- (id)_notMirroringError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Workout session is not currently mirroring to the companion device."));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKWorkoutSessionTaskConfiguration *configuration;
  void *v5;
  void *v6;
  id v7;

  configuration = self->_configuration;
  v7 = a3;
  -[HKWorkoutSessionTaskConfiguration sessionUUID](configuration, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("UUID"));

  -[HKWorkoutSessionTaskConfiguration workoutConfiguration](self->_configuration, "workoutConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("workoutConfiguration"));

  objc_msgSend(v7, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));

}

- (HKWorkoutSession)initWithCoder:(id)a3
{
  id v4;
  HKWorkoutSessionTaskConfiguration *v5;
  void *v6;
  void *v7;
  HKWorkoutSession *v8;
  id v9;
  uint64_t v10;
  NSDate *startDate;
  uint64_t v12;
  NSDate *endDate;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;

  v4 = a3;
  v5 = objc_alloc_init(HKWorkoutSessionTaskConfiguration);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutSessionTaskConfiguration setSessionUUID:](v5, "setSessionUUID:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workoutConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutSessionTaskConfiguration setWorkoutConfiguration:](v5, "setWorkoutConfiguration:", v7);

  v22 = 0;
  v8 = -[HKWorkoutSession _initWithHealthStore:taskConfiguration:error:](self, "_initWithHealthStore:taskConfiguration:error:", 0, v5, &v22);
  v9 = v22;
  if (v8)
  {
    v8->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    endDate = v8->_endDate;
    v8->_endDate = (NSDate *)v12;

  }
  else
  {
    _HKInitializeLogging();
    v14 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      -[HKWorkoutSession initWithCoder:].cold.1((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);
  }

  return v8;
}

- (void)startActivity
{
  -[HKWorkoutSession startActivityWithDate:](self, "startActivityWithDate:", 0);
}

- (void)stopActivity
{
  -[HKWorkoutSession stopActivityWithDate:](self, "stopActivityWithDate:", 0);
}

+ (void)_unitTest_clearAllRunningWorkouts
{
  os_unfair_lock_lock((os_unfair_lock_t)&_HKRunningWorkoutSessionLock);
  objc_msgSend((id)_HKRunningWorkoutSessionUUIDs, "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)&_HKRunningWorkoutSessionLock);
}

- (void)_unitTest_discardAssociatedWorkoutBuilder
{
  HKLiveWorkoutBuilder *associatedWorkoutBuilder;

  associatedWorkoutBuilder = self->_associatedWorkoutBuilder;
  self->_associatedWorkoutBuilder = 0;

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_pendingDataUpdate, 0);
  objc_storeStrong((id *)&self->_dataUpdateQueue, 0);
  objc_storeStrong((id *)&self->_targetStateMachine, 0);
  objc_storeStrong((id *)&self->_associatedWorkoutBuilder, 0);
  objc_storeStrong((id *)&self->_strongDelegate, 0);
  objc_storeStrong((id *)&self->_disconnectionError, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __41__HKWorkoutSession_connectionInterrupted__block_invoke_187_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Failed to recover after connection invalidation: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __41__HKWorkoutSession_connectionInterrupted__block_invoke_189_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Failed to reset target state connection invalidation: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __41__HKWorkoutSession_connectionInterrupted__block_invoke_191_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Failed to restart task server after connection invalidation: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __77__HKWorkoutSession_client_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "[mirroring] %{public}@: Received data from remote session but the session delegate is not setup.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __71__HKWorkoutSession_client_didDisconnectFromRemoteWithError_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "[mirroring] %{public}@: received disconnection event, but no delegate is set.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __76__HKWorkoutSession_stateMachine_didTransition_fromState_toState_date_error___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_19A0E6000, v0, v1, "%{public}@: (#w0) Failed to update requested target state to %{public}@: %{public}@");
}

void __27__HKWorkoutSession_prepare__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Failed to prepare: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __42__HKWorkoutSession_startActivityWithDate___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Failed to start: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __41__HKWorkoutSession_stopActivityWithDate___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Failed to stop: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __23__HKWorkoutSession_end__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Failed to end: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __25__HKWorkoutSession_pause__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Failed to pause: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __26__HKWorkoutSession_resume__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Failed to resume: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __70__HKWorkoutSession_enableAutomaticDetectionForActivityConfigurations___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: (#w0) Failed to enable automatic detection for activities: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __68__HKWorkoutSession_beginNewActivityWithConfiguration_date_metadata___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: (#w0) Failed to begin new activity: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __45__HKWorkoutSession_endCurrentActivityOnDate___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: (#w0) Failed to end current activity: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __66__HKWorkoutSession_startMirroringToCompanionDeviceWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[mirroring] %{public}@: Failed to start mirroring with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __65__HKWorkoutSession_stopMirroringToCompanionDeviceWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[mirroring] %{public}@: Failed to stop mirroring with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __70__HKWorkoutSession__queue_sendPendingDataUpdateToRemoteWorkoutSession__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[mirroring] %{public}@: Failed to send data to remote session with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __51__HKWorkoutSession__setupTaskServerWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Failed to setup task server with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __66__HKWorkoutSession__setupMirroredSessionTaskServerWithCompletion___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[mirroring] %{public}@: Failed to setup task server with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "Failed to decode HKWorkoutSession: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
