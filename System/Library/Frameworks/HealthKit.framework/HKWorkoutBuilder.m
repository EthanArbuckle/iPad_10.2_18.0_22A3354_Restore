@implementation HKWorkoutBuilder

+ (id)_constructionStateMachineForBuilderConfiguration:(id)a3 builderIdentifier:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  HKStateMachine *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  id v31;
  id v32;
  id v33;

  v6 = a4;
  objc_msgSend(a3, "associatedSessionUUID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (id)v7;
  else
    v9 = v6;
  +[HKStateMachine nameForOwner:UUID:tag:](HKStateMachine, "nameForOwner:UUID:tag:", a1, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HKStateMachine initWithName:]([HKStateMachine alloc], "initWithName:", v10);
  -[HKStateMachine addStateWithIndex:label:](v11, "addStateWithIndex:label:", 0, CFSTR("NotStarted"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStateMachine addStateWithIndex:label:](v11, "addStateWithIndex:label:", 1, CFSTR("Active"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStateMachine addStateWithIndex:label:](v11, "addStateWithIndex:label:", 2, CFSTR("Ended"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStateMachine addStateWithIndex:label:](v11, "addStateWithIndex:label:", 3, CFSTR("Finished"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStateMachine addStateWithIndex:label:](v11, "addStateWithIndex:label:", 4, CFSTR("Discarded"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v12, v13, 100, CFSTR("begin"));
  v18 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v13, v14, 101, CFSTR("end"));
  v19 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v14, v15, 102, CFSTR("finish"));
  v20 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v12, v16, 103, CFSTR("discard"));
  v21 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v13, v16, 103, CFSTR("discard"));
  v22 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v14, v16, 103, CFSTR("discard"));
  v23 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v12, v13, 1, CFSTR("server-active"));
  v24 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v12, v14, 2, CFSTR("server-ended"));
  v25 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v12, v15, 3, CFSTR("server-finished"));
  v26 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v12, v16, 4, CFSTR("server-discarded"));
  v27 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v13, v14, 2, CFSTR("server-ended"));
  v28 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v13, v15, 3, CFSTR("server-finished"));
  v29 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v13, v16, 4, CFSTR("server-discarded"));
  v30 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v14, v15, 3, CFSTR("server-finished"));
  v31 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v14, v16, 4, CFSTR("server-discarded"));
  v32 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v16, v15, 3, CFSTR("server-finished"));
  v33 = -[HKStateMachine addStateTransitionFrom:to:event:label:](v11, "addStateTransitionFrom:to:event:label:", v15, v16, 4, CFSTR("server-discarded"));

  return v11;
}

- (HKWorkoutBuilder)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKWorkoutBuilder)initWithHealthStore:(HKHealthStore *)healthStore configuration:(HKWorkoutConfiguration *)configuration device:(HKDevice *)device
{
  HKDevice *v8;
  HKWorkoutConfiguration *v9;
  HKHealthStore *v10;
  HKWorkoutBuilderConfiguration *v11;
  void *v12;
  HKWorkoutBuilder *v13;

  v8 = device;
  v9 = configuration;
  v10 = healthStore;
  v11 = objc_alloc_init(HKWorkoutBuilderConfiguration);
  -[HKWorkoutBuilderConfiguration setDevice:](v11, "setDevice:", v8);

  -[HKWorkoutBuilderConfiguration setWorkoutConfiguration:](v11, "setWorkoutConfiguration:", v9);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKWorkoutBuilder initWithHealthStore:builderConfiguration:builderIdentifier:](self, "initWithHealthStore:builderConfiguration:builderIdentifier:", v10, v11, v12);

  return v13;
}

- (HKWorkoutBuilder)initWithHealthStore:(id)a3 configuration:(id)a4 goalType:(unint64_t)a5 goal:(id)a6 device:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HKWorkoutBuilderConfiguration *v16;
  void *v17;
  HKWorkoutBuilder *v18;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(HKWorkoutBuilderConfiguration);
  -[HKWorkoutBuilderConfiguration setDevice:](v16, "setDevice:", v12);

  -[HKWorkoutBuilderConfiguration setWorkoutConfiguration:](v16, "setWorkoutConfiguration:", v14);
  -[HKWorkoutBuilderConfiguration setGoalType:](v16, "setGoalType:", a5);
  -[HKWorkoutBuilderConfiguration setGoal:](v16, "setGoal:", v13);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HKWorkoutBuilder initWithHealthStore:builderConfiguration:builderIdentifier:](self, "initWithHealthStore:builderConfiguration:builderIdentifier:", v15, v16, v17);

  return v18;
}

- (HKWorkoutBuilder)initWithHealthStore:(id)a3 builderConfiguration:(id)a4 builderIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKWorkoutBuilder *v12;
  HKWorkoutBuilder *v13;
  void *v14;
  uint64_t v15;
  HKWorkoutConfiguration *workoutConfiguration;
  uint64_t v17;
  OS_dispatch_queue *resourceQueue;
  NSMutableDictionary *v19;
  NSMutableDictionary *seriesBuilders;
  NSMutableDictionary *v21;
  NSMutableDictionary *statisticsByType;
  NSDictionary *metadata;
  NSArray *workoutEvents;
  NSMutableDictionary *v25;
  NSMutableDictionary *activitiesPerUUID;
  HKRetryableOperation *v27;
  HKRetryableOperation *retryableOperation;
  uint64_t v29;
  HKStateMachine *constructionStateMachine;
  NSObject *v31;
  id *v32;
  HKTaskServerProxyProvider *v33;
  id v34;
  NSObject *v35;
  _QWORD block[4];
  id *v38;
  objc_super v39;
  uint8_t buf[4];
  id *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v39.receiver = self;
  v39.super_class = (Class)HKWorkoutBuilder;
  v12 = -[HKWorkoutBuilder init](&v39, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong((id *)&v13->_identifier, a5);
    objc_storeStrong((id *)&v13->_builderConfiguration, a4);
    objc_msgSend(v10, "workoutConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    workoutConfiguration = v13->_workoutConfiguration;
    v13->_workoutConfiguration = (HKWorkoutConfiguration *)v15;

    HKCreateSerialDispatchQueue(v13, CFSTR("resource"));
    v17 = objc_claimAutoreleasedReturnValue();
    resourceQueue = v13->_resourceQueue;
    v13->_resourceQueue = (OS_dispatch_queue *)v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    seriesBuilders = v13->_seriesBuilders;
    v13->_seriesBuilders = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    statisticsByType = v13->_statisticsByType;
    v13->_statisticsByType = v21;

    metadata = v13->_metadata;
    v13->_metadata = (NSDictionary *)MEMORY[0x1E0C9AA70];

    workoutEvents = v13->_workoutEvents;
    v13->_workoutEvents = (NSArray *)MEMORY[0x1E0C9AA60];

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activitiesPerUUID = v13->_activitiesPerUUID;
    v13->_activitiesPerUUID = v25;

    v27 = -[HKRetryableOperation initWithQueue:retryCount:]([HKRetryableOperation alloc], "initWithQueue:retryCount:", v13->_resourceQueue, 5);
    retryableOperation = v13->_retryableOperation;
    v13->_retryableOperation = v27;

    v13->_serverConstructionState = 0;
    objc_msgSend((id)objc_opt_class(), "_constructionStateMachineForBuilderConfiguration:builderIdentifier:", v10, v11);
    v29 = objc_claimAutoreleasedReturnValue();
    constructionStateMachine = v13->_constructionStateMachine;
    v13->_constructionStateMachine = (HKStateMachine *)v29;

    -[HKStateMachine setDelegate:](v13->_constructionStateMachine, "setDelegate:", v13);
    v31 = v13->_resourceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__HKWorkoutBuilder_initWithHealthStore_builderConfiguration_builderIdentifier___block_invoke;
    block[3] = &unk_1E37E6770;
    v32 = v13;
    v38 = v32;
    dispatch_sync(v31, block);
    v33 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v9, CFSTR("HKWorkoutBuilderServerIdentifier"), v32, v11);
    v34 = v32[24];
    v32[24] = v33;

    objc_msgSend(v32[24], "setTaskConfiguration:", v10);
    _HKInitializeLogging();
    v35 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v32;
      _os_log_impl(&dword_19A0E6000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0)", buf, 0xCu);
    }

  }
  return v13;
}

uint64_t __79__HKWorkoutBuilder_initWithHealthStore_builderConfiguration_builderIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "enterAtState:", 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[HKWorkoutBuilderConfiguration associatedSessionUUID](self->_builderConfiguration, "associatedSessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID hk_shortRepresentation](self->_identifier, "hk_shortRepresentation");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v3)
  {
    -[HKWorkoutBuilderConfiguration associatedSessionUUID](self->_builderConfiguration, "associatedSessionUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_shortRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@ [%@]"), v6, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@"), v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v11;
}

+ (int64_t)_collectionStateAtDate:(id)a3 startDate:(id)a4 endDate:(id)a5 sortedEvents:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  int64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v10 && (objc_msgSend(v9, "hk_isBeforeDate:", v10) & 1) == 0)
  {
    if (v11 && (objc_msgSend(v11, "hk_isBeforeOrEqualToDate:", v9) & 1) != 0)
    {
      v13 = 3;
    }
    else
    {
      v26 = v11;
      v27 = v10;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v25 = v12;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v29;
        v13 = 1;
LABEL_9:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v18);
          objc_msgSend(v19, "dateInterval");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "hk_isAfterDate:", v9);

          if ((v22 & 1) != 0)
            break;
          v23 = objc_msgSend(v19, "type");
          if (v23 == 2)
          {
            v13 = 1;
          }
          else if (v23 == 1)
          {
            v13 = 2;
          }
          if (v16 == ++v18)
          {
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            if (v16)
              goto LABEL_9;
            break;
          }
        }
      }
      else
      {
        v13 = 1;
      }

      v11 = v26;
      v10 = v27;
      v12 = v25;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (double)_elapsedTimeAtDate:(id)a3 startDate:(id)a4 endDate:(id)a5 sortedEvents:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  double v33;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = 0.0;
  if (!v10 || (objc_msgSend(v10, "hk_isAfterOrEqualToDate:", v9) & 1) != 0)
    goto LABEL_29;
  if (v11)
  {
    HKDateMin(v9, v11);
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v14;
  }
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v16 = v15;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v17 = v12;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (!v18)
  {

    goto LABEL_28;
  }
  v19 = v18;
  v35 = v12;
  v36 = v11;
  v20 = *(_QWORD *)v38;
  v21 = 1;
  while (2)
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v38 != v20)
        objc_enumerationMutation(v17);
      v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      objc_msgSend(v23, "dateInterval", v35, v36, (_QWORD)v37);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "startDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v25, "hk_isBeforeDate:", v10))
      {
        _HKInitializeLogging();
        v28 = HKLogWorkouts;
        if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v42 = v25;
          v43 = 2114;
          v44 = v10;
          v29 = "Event start date: %{public}@ is before workout start date: %{public}@";
          v30 = v28;
          v31 = 22;
LABEL_25:
          _os_log_impl(&dword_19A0E6000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
        }
LABEL_26:

        goto LABEL_27;
      }
      if (objc_msgSend(v25, "hk_isAfterDate:", v9))
      {
        _HKInitializeLogging();
        v32 = HKLogWorkouts;
        if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v42 = v25;
          v29 = "Event start date: %{public}@ is in future";
          v30 = v32;
          v31 = 12;
          goto LABEL_25;
        }
        goto LABEL_26;
      }
      if (((objc_msgSend(v23, "type") == 1) & v21) == 1)
      {
        objc_msgSend(v25, "timeIntervalSinceReferenceDate");
        v21 = 0;
        v13 = v13 + v26 - v16;
        v16 = 0.0;
      }
      if (objc_msgSend(v23, "type") == 2 && (v21 & 1) == 0)
      {
        objc_msgSend(v25, "timeIntervalSinceReferenceDate");
        v16 = v27;
        v21 = 1;
      }

    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v19)
      continue;
    break;
  }
LABEL_27:

  v12 = v35;
  v11 = v36;
  if ((v21 & 1) != 0)
  {
LABEL_28:
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v13 = v13 + v33 - v16;
  }
LABEL_29:

  return v13;
}

- (HKDevice)device
{
  return -[HKWorkoutBuilderConfiguration device](self->_builderConfiguration, "device");
}

- (void)beginCollectionWithStartDate:(NSDate *)startDate completion:(void *)completion
{
  NSDate *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *resourceQueue;
  id v11;
  NSDate *v12;
  _QWORD block[5];
  NSDate *v14;
  id v15;
  _QWORD aBlock[5];
  id v17;

  v6 = startDate;
  v7 = completion;
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__HKWorkoutBuilder_beginCollectionWithStartDate_completion___block_invoke;
    aBlock[3] = &unk_1E37E67C0;
    aBlock[4] = self;
    v17 = v7;
    v9 = _Block_copy(aBlock);

  }
  else
  {
    v9 = 0;
  }
  resourceQueue = self->_resourceQueue;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __60__HKWorkoutBuilder_beginCollectionWithStartDate_completion___block_invoke_3;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v14 = v6;
  v15 = v9;
  v11 = v9;
  v12 = v6;
  dispatch_async(resourceQueue, block);

}

void __60__HKWorkoutBuilder_beginCollectionWithStartDate_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HKWorkoutBuilder_beginCollectionWithStartDate_completion___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __60__HKWorkoutBuilder_beginCollectionWithStartDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __60__HKWorkoutBuilder_beginCollectionWithStartDate_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_beginCollectionWithStartDate:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NSDate)startDate
{
  NSObject *resourceQueue;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__HKWorkoutBuilder_startDate__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __29__HKWorkoutBuilder_startDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (NSDate)endDate
{
  NSObject *resourceQueue;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__HKWorkoutBuilder_endDate__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __27__HKWorkoutBuilder_endDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (double)_currentElapsedTime
{
  NSObject *resourceQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__HKWorkoutBuilder__currentElapsedTime__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFAbsoluteTime __39__HKWorkoutBuilder__currentElapsedTime__block_invoke(uint64_t a1)
{
  CFAbsoluteTime result;
  CFAbsoluteTime Current;
  uint64_t v4;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 64);
  *(CFAbsoluteTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 80))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    result = Current - *(double *)(*(_QWORD *)(a1 + 32) + 72) + *(double *)(v4 + 24);
    *(CFAbsoluteTime *)(v4 + 24) = result;
  }
  return result;
}

- (NSTimeInterval)elapsedTimeAtDate:(NSDate *)date
{
  NSDate *v4;
  NSObject *resourceQueue;
  NSDate *v6;
  double v7;
  _QWORD block[4];
  NSDate *v10;
  HKWorkoutBuilder *v11;
  uint64_t *v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = date;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HKWorkoutBuilder_elapsedTimeAtDate___block_invoke;
  block[3] = &unk_1E37E6838;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(resourceQueue, block);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __38__HKWorkoutBuilder_elapsedTimeAtDate___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = +[HKWorkoutBuilder _elapsedTimeAtDate:startDate:endDate:sortedEvents:](HKWorkoutBuilder, "_elapsedTimeAtDate:startDate:endDate:sortedEvents:", a1[4], *(_QWORD *)(a1[5] + 24), *(_QWORD *)(a1[5] + 32), *(_QWORD *)(a1[5] + 48));
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (BOOL)isCurrentlyRunning
{
  NSObject *resourceQueue;
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
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__HKWorkoutBuilder_isCurrentlyRunning__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__HKWorkoutBuilder_isCurrentlyRunning__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (void)addSamples:(NSArray *)samples completion:(void *)completion
{
  NSArray *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *resourceQueue;
  id v11;
  NSArray *v12;
  _QWORD block[5];
  NSArray *v14;
  id v15;
  _QWORD aBlock[5];
  id v17;

  v6 = samples;
  v7 = completion;
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__HKWorkoutBuilder_addSamples_completion___block_invoke;
    aBlock[3] = &unk_1E37E67C0;
    aBlock[4] = self;
    v17 = v7;
    v9 = _Block_copy(aBlock);

  }
  else
  {
    v9 = 0;
  }
  resourceQueue = self->_resourceQueue;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __42__HKWorkoutBuilder_addSamples_completion___block_invoke_3;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v14 = v6;
  v15 = v9;
  v11 = v9;
  v12 = v6;
  dispatch_async(resourceQueue, block);

}

void __42__HKWorkoutBuilder_addSamples_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HKWorkoutBuilder_addSamples_completion___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __42__HKWorkoutBuilder_addSamples_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __42__HKWorkoutBuilder_addSamples_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_addSamples:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)addWorkoutEvents:(NSArray *)workoutEvents completion:(void *)completion
{
  NSArray *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *resourceQueue;
  id v11;
  NSArray *v12;
  _QWORD block[5];
  NSArray *v14;
  id v15;
  _QWORD aBlock[5];
  id v17;

  v6 = workoutEvents;
  v7 = completion;
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__HKWorkoutBuilder_addWorkoutEvents_completion___block_invoke;
    aBlock[3] = &unk_1E37E67C0;
    aBlock[4] = self;
    v17 = v7;
    v9 = _Block_copy(aBlock);

  }
  else
  {
    v9 = 0;
  }
  resourceQueue = self->_resourceQueue;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __48__HKWorkoutBuilder_addWorkoutEvents_completion___block_invoke_3;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v14 = v6;
  v15 = v9;
  v11 = v9;
  v12 = v6;
  dispatch_async(resourceQueue, block);

}

void __48__HKWorkoutBuilder_addWorkoutEvents_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HKWorkoutBuilder_addWorkoutEvents_completion___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __48__HKWorkoutBuilder_addWorkoutEvents_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __48__HKWorkoutBuilder_addWorkoutEvents_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_addWorkoutEvents:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NSArray)workoutEvents
{
  NSObject *resourceQueue;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__HKWorkoutBuilder_workoutEvents__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __33__HKWorkoutBuilder_workoutEvents__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addMetadata:(NSDictionary *)metadata completion:(void *)completion
{
  NSDictionary *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *resourceQueue;
  id v11;
  NSDictionary *v12;
  _QWORD block[5];
  NSDictionary *v14;
  id v15;
  _QWORD aBlock[5];
  id v17;

  v6 = metadata;
  v7 = completion;
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__HKWorkoutBuilder_addMetadata_completion___block_invoke;
    aBlock[3] = &unk_1E37E67C0;
    aBlock[4] = self;
    v17 = v7;
    v9 = _Block_copy(aBlock);

  }
  else
  {
    v9 = 0;
  }
  resourceQueue = self->_resourceQueue;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __43__HKWorkoutBuilder_addMetadata_completion___block_invoke_3;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v14 = v6;
  v15 = v9;
  v11 = v9;
  v12 = v6;
  dispatch_async(resourceQueue, block);

}

void __43__HKWorkoutBuilder_addMetadata_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HKWorkoutBuilder_addMetadata_completion___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __43__HKWorkoutBuilder_addMetadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __43__HKWorkoutBuilder_addMetadata_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_addMetadata:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NSDictionary)metadata
{
  NSObject *resourceQueue;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__HKWorkoutBuilder_metadata__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __28__HKWorkoutBuilder_metadata__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addWorkoutActivity:(HKWorkoutActivity *)workoutActivity completion:(void *)completion
{
  HKWorkoutActivity *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *resourceQueue;
  id v11;
  HKWorkoutActivity *v12;
  _QWORD block[5];
  HKWorkoutActivity *v14;
  id v15;
  _QWORD aBlock[5];
  id v17;

  v6 = workoutActivity;
  v7 = completion;
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__HKWorkoutBuilder_addWorkoutActivity_completion___block_invoke;
    aBlock[3] = &unk_1E37E67C0;
    aBlock[4] = self;
    v17 = v7;
    v9 = _Block_copy(aBlock);

  }
  else
  {
    v9 = 0;
  }
  resourceQueue = self->_resourceQueue;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __50__HKWorkoutBuilder_addWorkoutActivity_completion___block_invoke_3;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v14 = v6;
  v15 = v9;
  v11 = v9;
  v12 = v6;
  dispatch_async(resourceQueue, block);

}

void __50__HKWorkoutBuilder_addWorkoutActivity_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HKWorkoutBuilder_addWorkoutActivity_completion___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __50__HKWorkoutBuilder_addWorkoutActivity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __50__HKWorkoutBuilder_addWorkoutActivity_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_addWorkoutActivity:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NSArray)workoutActivities
{
  NSObject *resourceQueue;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__HKWorkoutBuilder_workoutActivities__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __37__HKWorkoutBuilder_workoutActivities__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __37__HKWorkoutBuilder_workoutActivities__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)updateActivityWithUUID:(NSUUID *)UUID endDate:(NSDate *)endDate completion:(void *)completion
{
  NSUUID *v8;
  NSDate *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *resourceQueue;
  id v14;
  NSDate *v15;
  NSUUID *v16;
  _QWORD v17[5];
  NSUUID *v18;
  NSDate *v19;
  id v20;
  _QWORD aBlock[5];
  id v22;

  v8 = UUID;
  v9 = endDate;
  v10 = completion;
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__HKWorkoutBuilder_updateActivityWithUUID_endDate_completion___block_invoke;
    aBlock[3] = &unk_1E37E67C0;
    aBlock[4] = self;
    v22 = v10;
    v12 = _Block_copy(aBlock);

  }
  else
  {
    v12 = 0;
  }
  resourceQueue = self->_resourceQueue;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __62__HKWorkoutBuilder_updateActivityWithUUID_endDate_completion___block_invoke_3;
  v17[3] = &unk_1E37E68A0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v12;
  v14 = v12;
  v15 = v9;
  v16 = v8;
  dispatch_async(resourceQueue, v17);

}

void __62__HKWorkoutBuilder_updateActivityWithUUID_endDate_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HKWorkoutBuilder_updateActivityWithUUID_endDate_completion___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __62__HKWorkoutBuilder_updateActivityWithUUID_endDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __62__HKWorkoutBuilder_updateActivityWithUUID_endDate_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_updateActivityWithUUID:endDate:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)updateActivityWithUUID:(NSUUID *)UUID addMedatata:(NSDictionary *)metadata completion:(void *)completion
{
  NSUUID *v8;
  NSDictionary *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *resourceQueue;
  id v14;
  NSDictionary *v15;
  NSUUID *v16;
  _QWORD v17[5];
  NSUUID *v18;
  NSDictionary *v19;
  id v20;
  _QWORD aBlock[5];
  id v22;

  v8 = UUID;
  v9 = metadata;
  v10 = completion;
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__HKWorkoutBuilder_updateActivityWithUUID_addMedatata_completion___block_invoke;
    aBlock[3] = &unk_1E37E67C0;
    aBlock[4] = self;
    v22 = v10;
    v12 = _Block_copy(aBlock);

  }
  else
  {
    v12 = 0;
  }
  resourceQueue = self->_resourceQueue;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __66__HKWorkoutBuilder_updateActivityWithUUID_addMedatata_completion___block_invoke_3;
  v17[3] = &unk_1E37E68A0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v12;
  v14 = v12;
  v15 = v9;
  v16 = v8;
  dispatch_async(resourceQueue, v17);

}

void __66__HKWorkoutBuilder_updateActivityWithUUID_addMedatata_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HKWorkoutBuilder_updateActivityWithUUID_addMedatata_completion___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __66__HKWorkoutBuilder_updateActivityWithUUID_addMedatata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __66__HKWorkoutBuilder_updateActivityWithUUID_addMedatata_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_updateActivityWithUUID:addMetadata:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)endCollectionWithEndDate:(NSDate *)endDate completion:(void *)completion
{
  NSDate *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *resourceQueue;
  id v11;
  NSDate *v12;
  _QWORD block[5];
  NSDate *v14;
  id v15;
  _QWORD aBlock[5];
  id v17;

  v6 = endDate;
  v7 = completion;
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__HKWorkoutBuilder_endCollectionWithEndDate_completion___block_invoke;
    aBlock[3] = &unk_1E37E67C0;
    aBlock[4] = self;
    v17 = v7;
    v9 = _Block_copy(aBlock);

  }
  else
  {
    v9 = 0;
  }
  resourceQueue = self->_resourceQueue;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __56__HKWorkoutBuilder_endCollectionWithEndDate_completion___block_invoke_3;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v14 = v6;
  v15 = v9;
  v11 = v9;
  v12 = v6;
  dispatch_async(resourceQueue, block);

}

void __56__HKWorkoutBuilder_endCollectionWithEndDate_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HKWorkoutBuilder_endCollectionWithEndDate_completion___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __56__HKWorkoutBuilder_endCollectionWithEndDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __56__HKWorkoutBuilder_endCollectionWithEndDate_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_endCollectionWithEndDate:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)finishWorkoutWithCompletion:(void *)completion
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *resourceQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD aBlock[5];
  id v12;

  v4 = completion;
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__HKWorkoutBuilder_finishWorkoutWithCompletion___block_invoke;
    aBlock[3] = &unk_1E37E68C8;
    aBlock[4] = self;
    v12 = v4;
    v6 = _Block_copy(aBlock);

  }
  else
  {
    v6 = 0;
  }
  resourceQueue = self->_resourceQueue;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __48__HKWorkoutBuilder_finishWorkoutWithCompletion___block_invoke_3;
  v9[3] = &unk_1E37E66E8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(resourceQueue, v9);

}

void __48__HKWorkoutBuilder_finishWorkoutWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HKWorkoutBuilder_finishWorkoutWithCompletion___block_invoke_2;
  block[3] = &unk_1E37E6710;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __48__HKWorkoutBuilder_finishWorkoutWithCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __48__HKWorkoutBuilder_finishWorkoutWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_finishWorkoutWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)discardWorkout
{
  NSObject *resourceQueue;
  _QWORD block[5];

  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__HKWorkoutBuilder_discardWorkout__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(resourceQueue, block);
}

uint64_t __34__HKWorkoutBuilder_discardWorkout__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "enqueueEvent:date:error:completion:", 103, 0, 0, &__block_literal_global_53);
}

void __34__HKWorkoutBuilder_discardWorkout__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __34__HKWorkoutBuilder_discardWorkout__block_invoke_2_cold_1();
  }

}

- (NSDictionary)allStatistics
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[HKWorkoutBuilder resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__HKWorkoutBuilder_allStatistics__block_invoke;
  v6[3] = &unk_1E37E6810;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __33__HKWorkoutBuilder_allStatistics__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (HKStatistics)statisticsForType:(HKQuantityType *)quantityType
{
  HKQuantityType *v4;
  NSObject *v5;
  HKQuantityType *v6;
  id v7;
  _QWORD block[5];
  HKQuantityType *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = quantityType;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[HKWorkoutBuilder resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HKWorkoutBuilder_statisticsForType___block_invoke;
  block[3] = &unk_1E37E6838;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return (HKStatistics *)v7;
}

void __38__HKWorkoutBuilder_statisticsForType___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 176), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (HKSeriesBuilder)seriesBuilderForType:(HKSeriesType *)seriesType
{
  HKSeriesType *v4;
  NSObject *v5;
  HKSeriesType *v6;
  id v7;
  _QWORD block[5];
  HKSeriesType *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = seriesType;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[HKWorkoutBuilder resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__HKWorkoutBuilder_seriesBuilderForType___block_invoke;
  block[3] = &unk_1E37E6838;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return (HKSeriesBuilder *)v7;
}

void __41__HKWorkoutBuilder_seriesBuilderForType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_seriesBuilderWithIdentifier:type:", 0, *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_resourceQueue_startDateForSnapshot
{
  NSDate *workoutStartDate;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  workoutStartDate = self->_workoutStartDate;
  if (workoutStartDate)
    return workoutStartDate;
  -[NSArray firstObject](self->_workoutEvents, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_statisticsByType, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        HKDateMin(v13, v14);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_resourceQueue_endDateForSnapshotWithStartDate:(id)a3
{
  id v4;
  NSDate *workoutEndDate;
  NSDate *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  workoutEndDate = self->_workoutEndDate;
  if (workoutEndDate)
  {
    v6 = workoutEndDate;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[NSMutableDictionary allValues](self->_statisticsByType, "allValues", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        v13 = v7;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12), "endDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          HKDateMax(v13, v14);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          ++v12;
          v13 = v7;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    -[NSArray lastObject](self->_workoutEvents, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dateInterval");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HKDateMax(v7, v17);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();

    +[HKObjectType workoutType](HKSampleType, "workoutType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isMaximumDurationRestricted"))
    {
      objc_msgSend(v18, "maximumAllowedDuration");
      objc_msgSend(v4, "dateByAddingTimeInterval:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HKDateMin(v6, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v6 = (NSDate *)v20;
    }

  }
  return v6;
}

- (id)_resourceQueue_eventsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  NSArray *workoutEvents;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  workoutEvents = self->_workoutEvents;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__HKWorkoutBuilder__resourceQueue_eventsBetweenStartDate_endDate___block_invoke;
  v13[3] = &unk_1E37E6930;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  -[NSArray hk_filter:](workoutEvents, "hk_filter:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __66__HKWorkoutBuilder__resourceQueue_eventsBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hk_isBeforeDate:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "hk_isAfterDate:", *(_QWORD *)(a1 + 40)) ^ 1;

  }
  return v6;
}

- (id)_currentSnapshot
{
  NSObject *resourceQueue;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__HKWorkoutBuilder__currentSnapshot__block_invoke;
  v5[3] = &unk_1E37E6958;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__HKWorkoutBuilder__currentSnapshot__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_startDateForSnapshot");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "workoutConfiguration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v2, "activityType");

    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "mutableCopy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "taskUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("_HKPrivateWorkoutBuilderSnapshotMetadataFinalWorkoutUUIDStringKey"));

    objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_endDateForSnapshotWithStartDate:", v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_eventsBetweenStartDate:endDate:", v18, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(v9 + 176);
    v11 = objc_msgSend(*(id *)(v9 + 16), "goalType");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "goal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKWorkout _workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:statistics:goalType:goal:device:metadata:](HKWorkout, "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:statistics:goalType:goal:device:metadata:", v17, v18, v6, v7, v8, v10, 0.0, v11, v12, v13, v3);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

- (unint64_t)goalType
{
  return -[HKWorkoutBuilderConfiguration goalType](self->_builderConfiguration, "goalType");
}

- (id)goal
{
  return -[HKWorkoutBuilderConfiguration goal](self->_builderConfiguration, "goal");
}

- (void)_setDevice:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__HKWorkoutBuilder__setDevice___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(resourceQueue, v7);

}

uint64_t __31__HKWorkoutBuilder__setDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_updateDevice:", *(_QWORD *)(a1 + 40));
}

- (void)_setStatisticsMergeStrategy:(unint64_t)a3 forType:(id)a4
{
  id v6;
  NSObject *resourceQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HKWorkoutBuilder__setStatisticsMergeStrategy_forType___block_invoke;
  block[3] = &unk_1E37E69A8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(resourceQueue, block);

}

uint64_t __56__HKWorkoutBuilder__setStatisticsMergeStrategy_forType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_setStatisticsMergeStrategy:forType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_setStatisticsComputationMethod:(int64_t)a3 forType:(id)a4
{
  id v6;
  NSObject *resourceQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HKWorkoutBuilder__setStatisticsComputationMethod_forType___block_invoke;
  block[3] = &unk_1E37E69A8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(resourceQueue, block);

}

uint64_t __60__HKWorkoutBuilder__setStatisticsComputationMethod_forType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_setStatisticsComputationMethod:forType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_removeMetadata:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *resourceQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  _QWORD aBlock[5];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__HKWorkoutBuilder__removeMetadata_completion___block_invoke;
    aBlock[3] = &unk_1E37E67C0;
    aBlock[4] = self;
    v17 = v7;
    v9 = _Block_copy(aBlock);

  }
  else
  {
    v9 = 0;
  }
  resourceQueue = self->_resourceQueue;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __47__HKWorkoutBuilder__removeMetadata_completion___block_invoke_3;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v14 = v6;
  v15 = v9;
  v11 = v9;
  v12 = v6;
  dispatch_async(resourceQueue, block);

}

void __47__HKWorkoutBuilder__removeMetadata_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HKWorkoutBuilder__removeMetadata_completion___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __47__HKWorkoutBuilder__removeMetadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __47__HKWorkoutBuilder__removeMetadata_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_removeMetadata:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)currentZonesForType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__HKWorkoutBuilder_currentZonesForType_completion___block_invoke;
  v14[3] = &unk_1E37E69D0;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __51__HKWorkoutBuilder_currentZonesForType_completion___block_invoke_2;
  v12[3] = &unk_1E37E69F8;
  v12[4] = self;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __51__HKWorkoutBuilder_currentZonesForType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_currentZonesForType:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __51__HKWorkoutBuilder_currentZonesForType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __51__HKWorkoutBuilder_currentZonesForType_completion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)shouldRetry
{
  return self->_proxyProvider != 0;
}

- (void)stateMachine:(id)a3 didEnterState:(id)a4 date:(id)a5 error:(id)a6
{
  id v8;
  NSDate *v9;
  NSDate *workoutStartDate;
  NSDate *v11;
  NSDate *workoutEndDate;

  v8 = a5;
  switch(objc_msgSend(a4, "index"))
  {
    case 1:
      if (v8)
      {
        v9 = (NSDate *)objc_msgSend(v8, "copy");
        workoutStartDate = self->_workoutStartDate;
        self->_workoutStartDate = v9;

      }
      if (!self->_workoutStartDate)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
          -[HKWorkoutBuilder stateMachine:didEnterState:date:error:].cold.1();
      }
      break;
    case 2:
      if (v8)
      {
        v11 = (NSDate *)objc_msgSend(v8, "copy");
        workoutEndDate = self->_workoutEndDate;
        self->_workoutEndDate = v11;

      }
      if (!self->_workoutEndDate)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
          -[HKWorkoutBuilder stateMachine:didEnterState:date:error:].cold.2();
      }
      break;
    case 3:
    case 4:
      -[HKWorkoutBuilder _resourceQueue_freezeSeriesBuilders](self, "_resourceQueue_freezeSeriesBuilders");
      break;
    default:
      break;
  }

}

- (void)stateMachine:(id)a3 didTransition:(id)a4 fromState:(id)a5 toState:(id)a6 date:(id)a7 error:(id)a8
{
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  _HKInitializeLogging();
  v12 = HKLogWorkouts;
  v13 = os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      *(_DWORD *)v15 = 138543618;
      *(_QWORD *)&v15[4] = self;
      *(_WORD *)&v15[12] = 2114;
      *(_QWORD *)&v15[14] = v10;
      v14 = "%{public}@: (#w0) %{public}@.";
LABEL_6:
      _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, v14, v15, 0x16u);
    }
  }
  else if (v13)
  {
    *(_DWORD *)v15 = 138543618;
    *(_QWORD *)&v15[4] = self;
    *(_WORD *)&v15[12] = 2114;
    *(_QWORD *)&v15[14] = v11;
    v14 = "%{public}@: (#w0) Enter at %{public}@.";
    goto LABEL_6;
  }
  -[HKWorkoutBuilder _pushCurrentTargetState](self, "_pushCurrentTargetState", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16);

}

- (void)_pushCurrentTargetState
{
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v3[5];
  _QWORD v4[5];

  proxyProvider = self->_proxyProvider;
  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke;
  v4[3] = &unk_1E37E6A48;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_60;
  v3[3] = &unk_1E37E6A70;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v4, v3);
}

void __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 184);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_2;
  block[3] = &unk_1E37E6980;
  block[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_sync(v5, block);

}

void __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = objc_msgSend(v2, "index");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 24);
  v7 = *(_QWORD *)(v5 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_3;
  v9[3] = &unk_1E37E6A20;
  v9[4] = v5;
  v10 = v2;
  v8 = v2;
  objc_msgSend(v3, "remote_setTargetConstructionState:startDate:endDate:completion:", v4, v6, v7, v9);

}

void __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_3(uint64_t a1, int a2, void *a3)
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
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w2) Server acknowledged transition to state %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_3_cold_1();
  }

}

void __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_60(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_3_cold_1();

}

- (void)_resourceQueue_beginCollectionWithStartDate:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  HKStateMachine *constructionStateMachine;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  if (v7)
  {
    constructionStateMachine = self->_constructionStateMachine;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__HKWorkoutBuilder__resourceQueue_beginCollectionWithStartDate_completion___block_invoke;
    v11[3] = &unk_1E37E6A98;
    v13 = v8;
    v14 = a2;
    v11[4] = self;
    v12 = v7;
    -[HKStateMachine enqueueEvent:date:error:completion:](constructionStateMachine, "enqueueEvent:date:error:completion:", 100, v12, 0, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("startDate cannot be nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v10);

  }
}

void __75__HKWorkoutBuilder__resourceQueue_beginCollectionWithStartDate_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)(a1 + 48);
  if ((a2 & 1) != 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v4;

    v7 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 24);
    *(_QWORD *)(v8 + 24) = v7;

    objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_updateElapsedTimeCache");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 56), CFSTR("Unable to begin a workout that has already started."));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v10);

  }
}

- (void)_resourceQueue_endCollectionWithEndDate:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  HKStateMachine *constructionStateMachine;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(id, _QWORD, void *);
  SEL v17;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  if (!v7)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = objc_opt_class();
    v12 = CFSTR("endDate cannot be nil");
LABEL_8:
    objc_msgSend(v10, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v11, a2, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v13);

    goto LABEL_9;
  }
  if (!self->_workoutStartDate)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = objc_opt_class();
    v12 = CFSTR("cannot set endDate without a startDate");
    goto LABEL_8;
  }
  if ((objc_msgSend(v7, "hk_isAfterDate:") & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = objc_opt_class();
    v12 = CFSTR("endDate must be after startDate");
    goto LABEL_8;
  }
  constructionStateMachine = self->_constructionStateMachine;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__HKWorkoutBuilder__resourceQueue_endCollectionWithEndDate_completion___block_invoke;
  v14[3] = &unk_1E37E6A98;
  v16 = v8;
  v17 = a2;
  v14[4] = self;
  v15 = v7;
  -[HKStateMachine enqueueEvent:date:error:completion:](constructionStateMachine, "enqueueEvent:date:error:completion:", 101, v15, 0, v14);

LABEL_9:
}

void __71__HKWorkoutBuilder__resourceQueue_endCollectionWithEndDate_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)(a1 + 48);
  if ((a2 & 1) != 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 120);
    *(_QWORD *)(v5 + 120) = v4;

    v7 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = v7;

    objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_updateElapsedTimeCache");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 56), CFSTR("Unable to end a workout that is not currently active."));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v10);

  }
}

- (void)_resourceQueue_finishWorkoutWithCompletion:(id)a3
{
  id v5;
  HKStateMachine *constructionStateMachine;
  id v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  constructionStateMachine = self->_constructionStateMachine;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__HKWorkoutBuilder__resourceQueue_finishWorkoutWithCompletion___block_invoke;
  v8[3] = &unk_1E37E6AC0;
  v8[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  -[HKStateMachine enqueueEvent:date:error:completion:](constructionStateMachine, "enqueueEvent:date:error:completion:", 102, 0, 0, v8);

}

void __63__HKWorkoutBuilder__resourceQueue_finishWorkoutWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 40);
  if ((a2 & 1) != 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 48), CFSTR("Unable to finish a workout that is not currently ended."));
    v7 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, v7);
    v6 = (void *)v7;
  }

}

- (void)_resourceQueue_addSamples:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *resourceQueue;
  _QWORD *v8;
  BOOL v9;
  id v10;
  HKRetryableOperation *retryableOperation;
  _QWORD *v12;
  void (*v13)(_QWORD *, _QWORD, id);
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  resourceQueue = self->_resourceQueue;
  v8 = a4;
  dispatch_assert_queue_V2(resourceQueue);
  v17 = 0;
  v9 = +[HKWorkout _validateObjects:forClass:error:](HKWorkout, "_validateObjects:forClass:error:", v6, objc_opt_class(), &v17);
  v10 = v17;
  if (v9)
  {
    retryableOperation = self->_retryableOperation;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke;
    v15[3] = &unk_1E37E6B60;
    v15[4] = self;
    v16 = v6;
    v12 = v10;
    -[HKRetryableOperation _queue_performRetryableOperation:completion:](retryableOperation, "_queue_performRetryableOperation:completion:", v15, v8);

    v8 = v12;
  }
  else
  {
    v13 = (void (*)(_QWORD *, _QWORD, id))v8[2];
    v14 = v17;
    v13(v8, 0, v14);

  }
}

void __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v6 = *(void **)(v4 + 192);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke_2;
  v10[3] = &unk_1E37E6B10;
  v10[4] = v4;
  v12 = v3;
  v11 = *(id *)(a1 + 40);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke_4;
  v8[3] = &unk_1E37E6B38;
  v9 = v12;
  v7 = v12;
  objc_msgSend(v6, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

void __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldRetry") & 1) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke_3;
    v7[3] = &unk_1E37E6AE8;
    v4 = *(_QWORD *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v3, "remote_addSamples:completion:", v4, v7);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 0, CFSTR("An unknown error occurred"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v5 + 16))(v5, 0, 0, v6);

  }
}

uint64_t __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__HKWorkoutBuilder__resourceQueue_addSamples_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_resourceQueue_addWorkoutEvents:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *resourceQueue;
  _QWORD *v8;
  BOOL v9;
  id v10;
  HKRetryableOperation *retryableOperation;
  _QWORD *v12;
  void (*v13)(_QWORD *, _QWORD, id);
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  resourceQueue = self->_resourceQueue;
  v8 = a4;
  dispatch_assert_queue_V2(resourceQueue);
  v17 = 0;
  v9 = +[HKWorkout _validateObjects:forClass:error:](HKWorkout, "_validateObjects:forClass:error:", v6, objc_opt_class(), &v17);
  v10 = v17;
  if (v9)
  {
    retryableOperation = self->_retryableOperation;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke;
    v15[3] = &unk_1E37E6B60;
    v15[4] = self;
    v16 = v6;
    v12 = v10;
    -[HKRetryableOperation _queue_performRetryableOperation:completion:](retryableOperation, "_queue_performRetryableOperation:completion:", v15, v8);

    v8 = v12;
  }
  else
  {
    v13 = (void (*)(_QWORD *, _QWORD, id))v8[2];
    v14 = v17;
    v13(v8, 0, v14);

  }
}

void __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldRetry") & 1) != 0)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke_2;
    v10[3] = &unk_1E37E69D0;
    v11 = v4;
    v12 = v3;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke_4;
    v8[3] = &unk_1E37E6B38;
    v9 = v12;
    objc_msgSend(v5, "fetchProxyWithHandler:errorHandler:", v10, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 0, CFSTR("An unknown error occurred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v3 + 2))(v3, 0, 0, v7);

  }
}

void __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke_3;
  v4[3] = &unk_1E37E6AE8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_addWorkoutEvents:completion:", v3, v4);

}

uint64_t __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__HKWorkoutBuilder__resourceQueue_addWorkoutEvents_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_resourceQueue_canAddMetadataInCurrentState
{
  void *v3;
  BOOL v4;
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  -[HKStateMachine currentState](self->_constructionStateMachine, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "index") == 4)
  {
    v4 = 0;
  }
  else
  {
    -[HKStateMachine currentState](self->_constructionStateMachine, "currentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "index") != 3;

  }
  return v4;
}

- (void)_resourceQueue_addMetadata:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  HKRetryableOperation *retryableOperation;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  HKWorkoutBuilder *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  if (-[HKWorkoutBuilder _resourceQueue_canAddMetadataInCurrentState](self, "_resourceQueue_canAddMetadataInCurrentState")&& checkWhetherAllMetadataAlreadyExists(v6, self->_metadata))
  {
    _HKInitializeLogging();
    v8 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Metadata update was elided as all requested metadata already existed.", buf, 0xCu);
    }
    v7[2](v7, 1, 0);
  }
  else
  {
    retryableOperation = self->_retryableOperation;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke;
    v10[3] = &unk_1E37E6B60;
    v10[4] = self;
    v11 = v6;
    -[HKRetryableOperation _queue_performRetryableOperation:completion:](retryableOperation, "_queue_performRetryableOperation:completion:", v10, v7);

  }
}

void __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldRetry") & 1) != 0)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke_2;
    v10[3] = &unk_1E37E69D0;
    v11 = v4;
    v12 = v3;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke_4;
    v8[3] = &unk_1E37E6B38;
    v9 = v12;
    objc_msgSend(v5, "fetchProxyWithHandler:errorHandler:", v10, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 0, CFSTR("An unknown error occurred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v3 + 2))(v3, 0, 0, v7);

  }
}

void __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke_3;
  v4[3] = &unk_1E37E6AE8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_addMetadata:completion:", v3, v4);

}

uint64_t __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__HKWorkoutBuilder__resourceQueue_addMetadata_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_resourceQueue_removeMetadata:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *resourceQueue;
  id v8;
  HKRetryableOperation *retryableOperation;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  resourceQueue = self->_resourceQueue;
  v8 = a4;
  dispatch_assert_queue_V2(resourceQueue);
  retryableOperation = self->_retryableOperation;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke;
  v11[3] = &unk_1E37E6B60;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  -[HKRetryableOperation _queue_performRetryableOperation:completion:](retryableOperation, "_queue_performRetryableOperation:completion:", v11, v8);

}

void __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldRetry") & 1) != 0)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke_2;
    v10[3] = &unk_1E37E69D0;
    v11 = v4;
    v12 = v3;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke_4;
    v8[3] = &unk_1E37E6B38;
    v9 = v12;
    objc_msgSend(v5, "fetchProxyWithHandler:errorHandler:", v10, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 0, CFSTR("An unknown error occurred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v3 + 2))(v3, 0, 0, v7);

  }
}

void __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke_3;
  v4[3] = &unk_1E37E6AE8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_removeMetadata:completion:", v3, v4);

}

uint64_t __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__HKWorkoutBuilder__resourceQueue_removeMetadata_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_resourceQueue_addWorkoutActivity:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  HKWorkoutActivity *currentActivity;
  void *v9;
  HKRetryableOperation *retryableOperation;
  void *v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  currentActivity = self->_currentActivity;
  if (currentActivity
    && (-[HKWorkoutActivity endDate](currentActivity, "endDate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cannot add new activity before ending current activity."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);

  }
  else
  {
    retryableOperation = self->_retryableOperation;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke;
    v12[3] = &unk_1E37E6B60;
    v12[4] = self;
    v13 = v6;
    -[HKRetryableOperation _queue_performRetryableOperation:completion:](retryableOperation, "_queue_performRetryableOperation:completion:", v12, v7);

  }
}

void __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldRetry") & 1) != 0)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke_2;
    v10[3] = &unk_1E37E69D0;
    v11 = v4;
    v12 = v3;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke_4;
    v8[3] = &unk_1E37E6B38;
    v9 = v12;
    objc_msgSend(v5, "fetchProxyWithHandler:errorHandler:", v10, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 0, CFSTR("An unknown error occurred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v3 + 2))(v3, 0, 0, v7);

  }
}

void __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke_3;
  v4[3] = &unk_1E37E6AE8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "remote_addWorkoutActivity:completion:", v3, v4);

}

uint64_t __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__HKWorkoutBuilder__resourceQueue_addWorkoutActivity_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_resourceQueue_updateActivityWithUUID:(id)a3 endDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *resourceQueue;
  id v11;
  HKRetryableOperation *retryableOperation;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  resourceQueue = self->_resourceQueue;
  v11 = a5;
  dispatch_assert_queue_V2(resourceQueue);
  retryableOperation = self->_retryableOperation;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke;
  v15[3] = &unk_1E37E6BB0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  -[HKRetryableOperation _queue_performRetryableOperation:completion:](retryableOperation, "_queue_performRetryableOperation:completion:", v15, v11);

}

void __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldRetry") & 1) != 0)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke_2;
    v10[3] = &unk_1E37E6B88;
    v11 = v4;
    v12 = *(id *)(a1 + 48);
    v13 = v3;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke_4;
    v8[3] = &unk_1E37E6B38;
    v9 = v13;
    objc_msgSend(v5, "fetchProxyWithHandler:errorHandler:", v10, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 0, CFSTR("An unknown error occurred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v3 + 2))(v3, 0, 0, v7);

  }
}

void __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke_3;
  v5[3] = &unk_1E37E6AE8;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remote_updateActivityWithUUID:endDate:completion:", v3, v4, v5);

}

uint64_t __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_endDate_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_resourceQueue_updateActivityWithUUID:(id)a3 addMetadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  NSObject *v13;
  HKRetryableOperation *retryableOperation;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  HKWorkoutBuilder *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_activitiesPerUUID, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKWorkoutBuilder _resourceQueue_canAddMetadataInCurrentState](self, "_resourceQueue_canAddMetadataInCurrentState")&& checkWhetherAllMetadataAlreadyExists(v9, v12))
  {
    _HKInitializeLogging();
    v13 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = self;
      _os_log_impl(&dword_19A0E6000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Activity metadata update was elided as all requested metadata already existed.", buf, 0xCu);
    }
    v10[2](v10, 1, 0);
  }
  else
  {
    retryableOperation = self->_retryableOperation;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke;
    v15[3] = &unk_1E37E6BB0;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    -[HKRetryableOperation _queue_performRetryableOperation:completion:](retryableOperation, "_queue_performRetryableOperation:completion:", v15, v10);

  }
}

void __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldRetry") & 1) != 0)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke_2;
    v10[3] = &unk_1E37E6B88;
    v11 = v4;
    v12 = *(id *)(a1 + 48);
    v13 = v3;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke_4;
    v8[3] = &unk_1E37E6B38;
    v9 = v13;
    objc_msgSend(v5, "fetchProxyWithHandler:errorHandler:", v10, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 0, CFSTR("An unknown error occurred"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v3 + 2))(v3, 0, 0, v7);

  }
}

void __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke_3;
  v5[3] = &unk_1E37E6AE8;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remote_updateActivityWithUUID:addMetadata:completion:", v3, v4, v5);

}

uint64_t __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__HKWorkoutBuilder__resourceQueue_updateActivityWithUUID_addMetadata_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_resourceQueue_seriesBuilderWithIdentifier:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  HKWorkoutRouteBuilder *v8;
  void *v9;
  int v10;
  HKWorkoutRouteBuilder *v11;
  HKHealthStore *healthStore;
  void *v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_seriesBuilders, "objectForKeyedSubscript:", v7);
  v8 = (HKWorkoutRouteBuilder *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[HKSeriesType workoutRouteType](HKSeriesType, "workoutRouteType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v9);

    if (v10)
    {
      v11 = [HKWorkoutRouteBuilder alloc];
      healthStore = self->_healthStore;
      -[HKWorkoutBuilderConfiguration device](self->_builderConfiguration, "device");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[HKWorkoutRouteBuilder initWithHealthStore:identifier:device:workoutBuilderID:](v11, "initWithHealthStore:identifier:device:workoutBuilderID:", healthStore, v6, v13, self->_identifier);

      if (v8)
        -[NSMutableDictionary setObject:forKey:](self->_seriesBuilders, "setObject:forKey:", v8, v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)_resourceQueue_updateElapsedTimeCache
{
  void *v3;
  double v4;
  BOOL v5;
  double v6;
  NSDate *workoutStartDate;
  NSObject *v8;
  _BOOL4 v9;
  NSDate *workoutEndDate;
  NSDate *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  double accumulatedElapsedTime;
  _BOOL4 currentlyRunning;
  const char *v18;
  int v19;
  HKWorkoutBuilder *v20;
  __int16 v21;
  NSDate *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  double v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HKWorkoutBuilder _collectionStateAtDate:startDate:endDate:sortedEvents:](HKWorkoutBuilder, "_collectionStateAtDate:startDate:endDate:sortedEvents:", v3, self->_workoutStartDate, self->_workoutEndDate, self->_workoutEvents) == 1)
  {
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    v5 = 1;
  }
  else
  {
    v5 = 0;
    v4 = 0.0;
  }
  self->_lastResumeTimestamp = v4;
  self->_currentlyRunning = v5;
  +[HKWorkoutBuilder _elapsedTimeAtDate:startDate:endDate:sortedEvents:](HKWorkoutBuilder, "_elapsedTimeAtDate:startDate:endDate:sortedEvents:", v3, self->_workoutStartDate, self->_workoutEndDate, self->_workoutEvents);
  self->_accumulatedElapsedTime = v6;
  workoutStartDate = self->_workoutStartDate;
  _HKInitializeLogging();
  v8 = HKLogWorkouts;
  v9 = os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
  if (workoutStartDate)
  {
    if (v9)
    {
      v11 = self->_workoutStartDate;
      workoutEndDate = self->_workoutEndDate;
      v12 = v8;
      -[NSDate description](workoutEndDate, "description");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("<not ended>");
      accumulatedElapsedTime = self->_accumulatedElapsedTime;
      currentlyRunning = self->_currentlyRunning;
      if (v13)
        v15 = (const __CFString *)v13;
      v19 = 138544386;
      v20 = self;
      v21 = 2114;
      if (currentlyRunning)
        v18 = "running";
      else
        v18 = "paused";
      v22 = v11;
      v23 = 2114;
      v24 = v15;
      v25 = 2048;
      v26 = accumulatedElapsedTime;
      v27 = 2080;
      v28 = v18;
      _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) (%{public}@ - %{public}@) Elapsed: %0.2lfs %s.", (uint8_t *)&v19, 0x34u);

    }
  }
  else if (v9)
  {
    v19 = 138543362;
    v20 = self;
    _os_log_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Elapsed time cache updated but workout has not yet started.", (uint8_t *)&v19, 0xCu);
  }

}

- (void)_resourceQueue_freezeSeriesBuilders
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_seriesBuilders, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        v10[0] = v7;
        v10[1] = 3221225472;
        v10[2] = __55__HKWorkoutBuilder__resourceQueue_freezeSeriesBuilders__block_invoke;
        v10[3] = &unk_1E37E6BD8;
        v10[4] = v9;
        objc_msgSend(v9, "freezeBuilderWithCompletion:", v10);
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __55__HKWorkoutBuilder__resourceQueue_freezeSeriesBuilders__block_invoke(uint64_t a1, int a2, void *a3)
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
  if (a2)
  {
    _HKInitializeLogging();
    v6 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "Freezing series builder %{public}@ failed: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (void)_resourceQueue_updateDevice:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  -[HKWorkoutBuilderConfiguration setDevice:](self->_builderConfiguration, "setDevice:", v4);
  -[HKTaskServerProxyProvider setTaskConfiguration:](self->_proxyProvider, "setTaskConfiguration:", self->_builderConfiguration);
  proxyProvider = self->_proxyProvider;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HKWorkoutBuilder__resourceQueue_updateDevice___block_invoke;
  v7[3] = &unk_1E37E6A48;
  v8 = v4;
  v6 = v4;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v7, &__block_literal_global_91);

}

uint64_t __48__HKWorkoutBuilder__resourceQueue_updateDevice___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateDevice:", *(_QWORD *)(a1 + 32));
}

void __48__HKWorkoutBuilder__resourceQueue_updateDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __48__HKWorkoutBuilder__resourceQueue_updateDevice___block_invoke_2_cold_1();

}

- (void)_resourceQueue_setStatisticsMergeStrategy:(unint64_t)a3 forType:(id)a4
{
  id v6;
  HKTaskServerProxyProvider *proxyProvider;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__HKWorkoutBuilder__resourceQueue_setStatisticsMergeStrategy_forType___block_invoke;
  v9[3] = &unk_1E37E6C40;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v9, &__block_literal_global_92);

}

uint64_t __70__HKWorkoutBuilder__resourceQueue_setStatisticsMergeStrategy_forType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setStatisticsMergeStrategy:forType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __70__HKWorkoutBuilder__resourceQueue_setStatisticsMergeStrategy_forType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __48__HKWorkoutBuilder__resourceQueue_updateDevice___block_invoke_2_cold_1();

}

- (void)_resourceQueue_setStatisticsComputationMethod:(int64_t)a3 forType:(id)a4
{
  id v6;
  HKTaskServerProxyProvider *proxyProvider;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__HKWorkoutBuilder__resourceQueue_setStatisticsComputationMethod_forType___block_invoke;
  v9[3] = &unk_1E37E6C40;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v9, &__block_literal_global_93);

}

uint64_t __74__HKWorkoutBuilder__resourceQueue_setStatisticsComputationMethod_forType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setStatisticsComputationMethod:forType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __74__HKWorkoutBuilder__resourceQueue_setStatisticsComputationMethod_forType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __48__HKWorkoutBuilder__resourceQueue_updateDevice___block_invoke_2_cold_1();

}

- (void)_resourceQueue_markRecoveryRequired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resourceQueue);
  if (!-[HKWorkoutBuilderConfiguration requiresRecovery](self->_builderConfiguration, "requiresRecovery"))
  {
    -[HKWorkoutBuilderConfiguration setRequiresRecovery:](self->_builderConfiguration, "setRequiresRecovery:", 1);
    -[HKTaskServerProxyProvider setTaskConfiguration:](self->_proxyProvider, "setTaskConfiguration:", self->_builderConfiguration);
  }
}

- (void)clientRemote_didUpdateStatistics:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HKWorkoutBuilder_clientRemote_didUpdateStatistics___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(resourceQueue, block);

}

void __53__HKWorkoutBuilder_clientRemote_didUpdateStatistics___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_markRecoveryRequired");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  objc_msgSend(*(id *)(a1 + 40), "workoutStatistics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "activitiesStatistics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v31;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v4);
        objc_msgSend(*(id *)(a1 + 40), "activitiesStatistics");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v27;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v27 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", v5);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKeyedSubscript:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "_setStatistics:forType:", v15, v13);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          }
          while (v10);
        }

        ++v4;
      }
      while (v4 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v25);
  }

  _HKInitializeLogging();
  v16 = (void *)HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    v19 = v16;
    objc_msgSend(v17, "allTypes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v18;
    v36 = 2114;
    v37 = v22;
    _os_log_impl(&dword_19A0E6000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Updated statistics for types: %{public}@", buf, 0x16u);

  }
}

- (void)clientRemote_didUpdateMetadata:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HKWorkoutBuilder_clientRemote_didUpdateMetadata___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(resourceQueue, block);

}

void __51__HKWorkoutBuilder_clientRemote_didUpdateMetadata___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_markRecoveryRequired");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  _HKInitializeLogging();
  v2 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Server updated metadata.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)clientRemote_didUpdateEvents:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HKWorkoutBuilder_clientRemote_didUpdateEvents___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(resourceQueue, block);

}

void __49__HKWorkoutBuilder_clientRemote_didUpdateEvents___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_markRecoveryRequired");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__HKWorkoutBuilder_clientRemote_didUpdateEvents___block_invoke_2;
  v6[3] = &unk_1E37E6CA8;
  v2 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "hk_filter:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  _HKInitializeLogging();
  v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Server added events.", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_updateEvents:", v3);

}

uint64_t __49__HKWorkoutBuilder_clientRemote_didUpdateEvents___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", a2) ^ 1;
}

- (void)clientRemote_didUpdateActivities:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HKWorkoutBuilder_clientRemote_didUpdateActivities___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(resourceQueue, block);

}

void __53__HKWorkoutBuilder_clientRemote_didUpdateActivities___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_markRecoveryRequired");
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = a1;
  obj = *(id *)(a1 + 40);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v9 = *(void **)(*(_QWORD *)(v2 + 32) + 56);
        objc_msgSend(v8, "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "allStatistics");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13)
        {
          objc_msgSend(v11, "allStatistics");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_setAllStatistics:", v14);

        }
        objc_msgSend(v8, "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v8, v15);

        objc_msgSend(v5, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "hk_isAfterOrEqualToDate:", v17);

        if ((v18 & 1) == 0)
        {
          v19 = v8;

          v5 = v19;
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  v20 = v2;
  v21 = *(_QWORD *)(v2 + 32);
  v22 = *(void **)(v21 + 56);
  *(_QWORD *)(v21 + 56) = v27;
  v23 = v27;

  v24 = *(_QWORD *)(v20 + 32);
  v25 = *(void **)(v24 + 8);
  *(_QWORD *)(v24 + 8) = v5;

}

- (void)clientRemote_didBeginActivity:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HKWorkoutBuilder_clientRemote_didBeginActivity___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(resourceQueue, block);

}

void __50__HKWorkoutBuilder_clientRemote_didBeginActivity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(v5, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  }
}

- (void)clientRemote_didEndActivity:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HKWorkoutBuilder_clientRemote_didEndActivity___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(resourceQueue, block);

}

uint64_t __48__HKWorkoutBuilder_clientRemote_didEndActivity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setEndDate:", v5);

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_markRecoveryRequired");
}

- (void)clientRemote_didChangeElapsedTimeBasisWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  NSObject *resourceQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__HKWorkoutBuilder_clientRemote_didChangeElapsedTimeBasisWithStartDate_endDate___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(resourceQueue, block);

}

uint64_t __80__HKWorkoutBuilder_clientRemote_didChangeElapsedTimeBasisWithStartDate_endDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_markRecoveryRequired");
  v2 = *(void **)(a1 + 40);
  if (v2)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v2);
  v3 = *(void **)(a1 + 48);
  if (v3)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v3);
  return objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_updateElapsedTimeCache");
}

- (void)clientRemote_didRecoverSeriesBuilders:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD block[4];
  id v8;
  HKWorkoutBuilder *v9;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HKWorkoutBuilder_clientRemote_didRecoverSeriesBuilders___block_invoke;
  block[3] = &unk_1E37E6980;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(resourceQueue, block);

}

void __58__HKWorkoutBuilder_clientRemote_didRecoverSeriesBuilders___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v8, "_resourceQueue_seriesBuilderWithIdentifier:type:", v7, v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)clientRemote_didFinishRecovery
{
  NSObject *resourceQueue;
  _QWORD block[5];

  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HKWorkoutBuilder_clientRemote_didFinishRecovery__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_sync(resourceQueue, block);
}

void __50__HKWorkoutBuilder_clientRemote_didFinishRecovery__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 144));
  if (v2)
  {
    v3 = v2;
    (*((void (**)(void *, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 32));
    v2 = v3;
  }

}

- (void)clientRemote_synchronizeWithCompletion:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HKWorkoutBuilder_clientRemote_synchronizeWithCompletion___block_invoke;
  block[3] = &unk_1E37E6CD0;
  v8 = v4;
  v6 = v4;
  dispatch_sync(resourceQueue, block);

}

uint64_t __59__HKWorkoutBuilder_clientRemote_synchronizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clientRemote_stateDidChange:(int64_t)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  NSObject *resourceQueue;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *(*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a4;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__96;
  v23 = __Block_byref_object_dispose__97;
  v24 = 0;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HKWorkoutBuilder_clientRemote_stateDidChange_startDate_endDate___block_invoke;
  block[3] = &unk_1E37E6D18;
  block[4] = self;
  v18 = a3;
  v11 = v8;
  v15 = v11;
  v12 = v9;
  v16 = v12;
  v17 = &v19;
  dispatch_sync(resourceQueue, block);
  v13 = v20[5];
  if (v13)
    (*(void (**)(uint64_t, HKWorkoutBuilder *, int64_t))(v13 + 16))(v13, self, a3);

  _Block_object_dispose(&v19, 8);
}

void __66__HKWorkoutBuilder_clientRemote_stateDidChange_startDate_endDate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id *v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_resourceQueue_markRecoveryRequired");
  _HKInitializeLogging();
  v2 = (void *)HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 88);
    v5 = v2;
    HKWorkoutBuilderConstructionStateToString(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v3;
    v42 = 2114;
    v43 = v6;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Server state updated to %{public}@", buf, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v7 + 24))
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = v8;

    v7 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v7 + 32))
  {
    v11 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 32);
    *(_QWORD *)(v12 + 32) = v11;

    v7 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v7 + 96), "enqueueEvent:date:error:completion:", *(_QWORD *)(v7 + 88), 0, 0, &__block_literal_global_99);
  v14 = *(_QWORD *)(a1 + 64);
  if (v14 == 2)
  {
    v15 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 120));
    if (v15)
    {
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(v21 + 120);
      *(_QWORD *)(v21 + 120) = 0;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = __66__HKWorkoutBuilder_clientRemote_stateDidChange_startDate_endDate___block_invoke_3;
      v33 = &unk_1E37E6CD0;
      v19 = &v34;
      v15 = v15;
      v34 = v15;
      v20 = &v30;
      goto LABEL_13;
    }
  }
  else
  {
    if (v14 != 1)
      goto LABEL_15;
    v15 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 112));
    if (v15)
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 112);
      *(_QWORD *)(v16 + 112) = 0;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v35 = MEMORY[0x1E0C809B0];
      v36 = 3221225472;
      v37 = __66__HKWorkoutBuilder_clientRemote_stateDidChange_startDate_endDate___block_invoke_2;
      v38 = &unk_1E37E6CD0;
      v19 = &v39;
      v15 = v15;
      v39 = v15;
      v20 = &v35;
LABEL_13:
      dispatch_async(v18, v20);

    }
  }

LABEL_15:
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(_QWORD *)(v23 + 88);
  objc_msgSend(*(id *)(v23 + 96), "currentState", v30, v31, v32, v33, v34, v35, v36, v37, v38, v39);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "index");

  if (v24 != v26)
    objc_msgSend(*(id *)(a1 + 32), "_pushCurrentTargetState");
  v27 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 136));
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v27;

}

uint64_t __66__HKWorkoutBuilder_clientRemote_stateDidChange_startDate_endDate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__HKWorkoutBuilder_clientRemote_stateDidChange_startDate_endDate___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clientRemote_finishedWorkout:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HKWorkoutBuilder_clientRemote_finishedWorkout___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(resourceQueue, block);

}

void __49__HKWorkoutBuilder_clientRemote_finishedWorkout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 192);
  *(_QWORD *)(v2 + 192) = 0;

  v4 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 128));
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__HKWorkoutBuilder_clientRemote_finishedWorkout___block_invoke_2;
    v8[3] = &unk_1E37E6D40;
    v10 = v4;
    v9 = *(id *)(a1 + 40);
    dispatch_async(v7, v8);

  }
}

uint64_t __49__HKWorkoutBuilder_clientRemote_finishedWorkout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)clientRemote_didFailWithError:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(resourceQueue, block);

}

void __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 192);
  *(_QWORD *)(v2 + 192) = 0;

  v4 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 112));
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 112);
    *(_QWORD *)(v6 + 112) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_2;
    block[3] = &unk_1E37E6D40;
    v35 = v4;
    v34 = *(id *)(a1 + 40);
    dispatch_async(v8, block);

  }
  v9 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 120));
  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 120);
    *(_QWORD *)(v10 + 120) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v30[0] = v5;
    v30[1] = 3221225472;
    v30[2] = __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_3;
    v30[3] = &unk_1E37E6D40;
    v32 = v9;
    v31 = *(id *)(a1 + 40);
    dispatch_async(v12, v30);

  }
  v13 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 128));
  if (v13)
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 128);
    *(_QWORD *)(v14 + 128) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v27[0] = v5;
    v27[1] = 3221225472;
    v27[2] = __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_4;
    v27[3] = &unk_1E37E6D40;
    v29 = v13;
    v28 = *(id *)(a1 + 40);
    dispatch_async(v16, v27);

  }
  v17 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 152));
  if (v17)
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 152);
    *(_QWORD *)(v18 + 152) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    v24[0] = v5;
    v24[1] = 3221225472;
    v24[2] = __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_5;
    v24[3] = &unk_1E37E6710;
    v21 = v17;
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(a1 + 40);
    v26 = v21;
    v24[4] = v22;
    v25 = v23;
    dispatch_async(v20, v24);

  }
}

uint64_t __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __50__HKWorkoutBuilder_clientRemote_didFailWithError___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)clientInterface
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3A7440);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_clientRemote_didUpdateMetadata_, 0, 0);

  v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clientRemote_didUpdateEvents_, 0, 0);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_clientRemote_didRecoverSeriesBuilders_, 0, 0);
  v9 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_clientRemote_didUpdateActivities_, 0, 0);

  return v2;
}

+ (id)serverInterface
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E268);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_addDataSourcesWithIdentifiers_, 0, 0);
  v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_removeDataSourcesWithIdentifiers_, 0, 0);
  v5 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_addSamples_completion_, 0, 0);
  v6 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_addWorkoutEvents_completion_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_remote_addMetadata_completion_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_remote_updateActivityWithUUID_addMetadata_completion_, 1, 0);

  return v2;
}

- (id)exportedInterface
{
  return +[HKWorkoutBuilder clientInterface](HKWorkoutBuilder, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKWorkoutBuilder serverInterface](HKWorkoutBuilder, "serverInterface");
}

- (void)connectionInterrupted
{
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v3[5];
  _QWORD v4[5];

  proxyProvider = self->_proxyProvider;
  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__HKWorkoutBuilder_connectionInterrupted__block_invoke;
  v4[3] = &unk_1E37E6D68;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_218;
  v3[3] = &unk_1E37E6A70;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v4, v3);
}

void __41__HKWorkoutBuilder_connectionInterrupted__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Beginning recovery after server interruption.", buf, 0xCu);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_216;
  v6[3] = &unk_1E37E6BD8;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "remote_recoverWithCompletion:", v6);

}

void __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_216(uint64_t a1, char a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_216_cold_1();
  }
  objc_msgSend(*(id *)(a1 + 32), "_pushCurrentTargetState");

}

void __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_218(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_218_cold_1();

}

- (HKWorkoutBuilderConfiguration)configuration
{
  void *v2;
  void *v3;

  -[HKTaskServerProxyProvider taskConfiguration](self->_proxyProvider, "taskConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (HKWorkoutBuilderConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
  -[HKTaskServerProxyProvider setTaskConfiguration:](self->_proxyProvider, "setTaskConfiguration:", a3);
}

- (void)_recoverWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  HKTaskServerProxyProvider *proxyProvider;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  uint8_t buf[4];
  HKWorkoutBuilder *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Beginning client recovery.", buf, 0xCu);
  }
  v6 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke;
    aBlock[3] = &unk_1E37E67C0;
    aBlock[4] = self;
    v14 = v4;
    v4 = _Block_copy(aBlock);

  }
  proxyProvider = self->_proxyProvider;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_3;
  v11[3] = &unk_1E37E69D0;
  v11[4] = self;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_219;
  v9[3] = &unk_1E37E69F8;
  v9[4] = self;
  v10 = v12;
  v8 = v12;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v11, v9);

}

void __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_4;
  v4[3] = &unk_1E37E67C0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "remote_recoverWithCompletion:", v4);

}

void __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_restoreRecoveredSeriesBuildersWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_4_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_219(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_4_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_restoreRecoveredSeriesBuildersWithCompletion:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HKWorkoutBuilder__restoreRecoveredSeriesBuildersWithCompletion___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(resourceQueue, block);

}

void __66__HKWorkoutBuilder__restoreRecoveredSeriesBuildersWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[3];
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 1;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  v11 = a1;
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        dispatch_group_enter(v2);
        v15[0] = v5;
        v15[1] = 3221225472;
        v15[2] = __66__HKWorkoutBuilder__restoreRecoveredSeriesBuildersWithCompletion___block_invoke_2;
        v15[3] = &unk_1E37E6D90;
        v17 = v22;
        v16 = v2;
        objc_msgSend(v8, "recoverWithCompletion:", v15);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v4);
  }

  v9 = *(void **)(v11 + 40);
  v10 = *(NSObject **)(*(_QWORD *)(v11 + 32) + 184);
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __66__HKWorkoutBuilder__restoreRecoveredSeriesBuildersWithCompletion___block_invoke_3;
  block[3] = &unk_1E37E6DB8;
  v13 = v9;
  v14 = v22;
  dispatch_group_notify(v2, v10, block);

  _Block_object_dispose(v22, 8);
}

void __66__HKWorkoutBuilder__restoreRecoveredSeriesBuildersWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  BOOL v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (a2)
    v3 = *(_BYTE *)(v2 + 24) != 0;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __66__HKWorkoutBuilder__restoreRecoveredSeriesBuildersWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to restore 1 or more series builders"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, 1, v2);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 32), 0, 0);
  }
}

- (void)unitTest_setServerStateChangeHandler:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HKWorkoutBuilder_unitTest_setServerStateChangeHandler___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(resourceQueue, block);

}

void __57__HKWorkoutBuilder_unitTest_setServerStateChangeHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = v2;

}

- (void)unitTest_setRecoveryFinishedHandler:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HKWorkoutBuilder_unitTest_setRecoveryFinishedHandler___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(resourceQueue, block);

}

void __56__HKWorkoutBuilder_unitTest_setRecoveryFinishedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = v2;

}

- (void)unitTest_setFailureHandler:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HKWorkoutBuilder_unitTest_setFailureHandler___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(resourceQueue, block);

}

void __47__HKWorkoutBuilder_unitTest_setFailureHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = v2;

}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return (HKWorkoutConfiguration *)objc_getProperty(self, a2, 160, 1);
}

- (NSMutableDictionary)seriesBuilders
{
  return self->_seriesBuilders;
}

- (void)setSeriesBuilders:(id)a3
{
  objc_storeStrong((id *)&self->_seriesBuilders, a3);
}

- (NSMutableDictionary)statisticsByType
{
  return self->_statisticsByType;
}

- (void)setStatisticsByType:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsByType, a3);
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_statisticsByType, 0);
  objc_storeStrong((id *)&self->_seriesBuilders, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong(&self->_unitTest_failureHandler, 0);
  objc_storeStrong(&self->_unitTest_recoveryFinishedHandler, 0);
  objc_storeStrong(&self->_unitTest_serverStateChangedHandler, 0);
  objc_storeStrong(&self->_finishWorkoutCompletionHandler, 0);
  objc_storeStrong(&self->_endCollectionCompletionHandler, 0);
  objc_storeStrong(&self->_beginCollectionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_retryableOperation, 0);
  objc_storeStrong((id *)&self->_constructionStateMachine, 0);
  objc_storeStrong((id *)&self->_activitiesPerUUID, 0);
  objc_storeStrong((id *)&self->_workoutEvents, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_workoutEndDate, 0);
  objc_storeStrong((id *)&self->_workoutStartDate, 0);
  objc_storeStrong((id *)&self->_builderConfiguration, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
}

void __34__HKWorkoutBuilder_discardWorkout__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "Failed to discard workout, make sure the workout builder is active: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__HKWorkoutBuilder_currentZonesForType_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Failed to fetch current zones for type with error: %{public}@.");
  OUTLINED_FUNCTION_3();
}

- (void)stateMachine:didEnterState:date:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "%{public}@: No start date set after moving to active state.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stateMachine:didEnterState:date:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "%{public}@: No end date set after moving to active state.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __43__HKWorkoutBuilder__pushCurrentTargetState__block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: (#w0) Failed to update target construction state: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __48__HKWorkoutBuilder__resourceQueue_updateDevice___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "Unable to update workout builder server's device with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_216_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: (#w0) Failed to recover after connection invalidation: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __41__HKWorkoutBuilder_connectionInterrupted__block_invoke_218_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: (#w0) Failed to restart task server after connection invalidation: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __43__HKWorkoutBuilder__recoverWithCompletion___block_invoke_4_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: (#w0) Failed to recover workout after client restart: %{public}@.");
  OUTLINED_FUNCTION_3();
}

@end
