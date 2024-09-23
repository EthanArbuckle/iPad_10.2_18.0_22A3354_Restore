@implementation HDBiomeInterface

- (void)workoutSessionWithConfiguration:(id)a3 transitionedToState:(int64_t)a4 fromState:(int64_t)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_storeStrong((id *)&self->_sessionConfiguration, a3);
  v8 = 0;
  v9 = 4;
  switch(a4)
  {
    case 4:
    case 5:
      if (a5 == 4)
        goto LABEL_10;
      v9 = 1;
      goto LABEL_8;
    case 7:
      v9 = 3;
      if (a5 == 8 || a5 == 17)
        goto LABEL_8;
      goto LABEL_10;
    case 8:
    case 17:
      goto LABEL_8;
    case 15:
    case 16:
      if (a5 == 15)
      {
LABEL_10:
        v8 = 0;
      }
      else
      {
        v9 = 2;
LABEL_8:
        -[HDBiomeInterface _createBiomeEventWithType:isUpdate:]((uint64_t)self, v9, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v14 = v8;
          BiomeLibrary();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "Health");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "Workout");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "source");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDBiomeInterface _sendBiomeEvent:toSource:](self, "_sendBiomeEvent:toSource:", v14, v13);

          return;
        }
      }
LABEL_11:

      return;
    default:
      goto LABEL_11;
  }
}

- (void)workoutConfigurationUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_sessionConfiguration, a3);
  -[HDBiomeInterface _createBiomeEventWithType:isUpdate:]((uint64_t)self, self->_mostRecentBiomeEventType, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    BiomeLibrary();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "Health");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "Workout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDBiomeInterface _sendBiomeEvent:toSource:](self, "_sendBiomeEvent:toSource:", v8, v7);

  }
}

- (id)_createBiomeEventWithType:(uint64_t)a3 isUpdate:
{
  void *v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "workoutConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "locationType") == 2;

    objc_msgSend(*(id *)(a1 + 8), "clientApplicationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.SessionTrackerApp"));

    objc_msgSend(*(id *)(a1 + 8), "workoutConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityType");

    objc_msgSend(*(id *)(a1 + 8), "sessionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x1E0D02020]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _HKWorkoutActivityNameForActivityType();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v13, "initWithIsFirstPartyDonation:isIndoor:activityType:eventType:activityUUID:isUpdate:", v14, v15, v16, a2, v12, v17);

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (void)stopSessionWithIdentifier:(id)a3 recoveredWorkoutConfiguration:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  id v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "locationType") == 2;
  objc_msgSend(v6, "activityType");

  _HKWorkoutActivityNameForActivityType();
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D02020]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v11 = v18;
  else
    v11 = CFSTR("N/A");
  objc_msgSend(v7, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v9, "initWithIsFirstPartyDonation:isIndoor:activityType:eventType:activityUUID:isUpdate:", MEMORY[0x1E0C9AAA0], v10, v11, 2, v12, MEMORY[0x1E0C9AAA0]);
  BiomeLibrary();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "Health");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "Workout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDBiomeInterface _sendBiomeEvent:toSource:](self, "_sendBiomeEvent:toSource:", v13, v17);

}

- (void)_sendBiomeEvent:(id)a3 toSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _BYTE v11[24];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  self->_mostRecentBiomeEventType = objc_msgSend(v6, "eventType");
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)v11 = 138543874;
    *(_QWORD *)&v11[4] = objc_opt_class();
    *(_WORD *)&v11[12] = 2048;
    *(_QWORD *)&v11[14] = self;
    *(_WORD *)&v11[22] = 2114;
    v12 = v6;
    v10 = *(id *)&v11[4];
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] sending workout event %{public}@ to biome", v11, 0x20u);

  }
  objc_msgSend(v7, "sendEvent:", v6, *(_OWORD *)v11, *(_QWORD *)&v11[16], v12);

}

- (BOOL)sleepFocusOn
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UserFocus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ComputedMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "last");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __32__HDBiomeInterface_sleepFocusOn__block_invoke;
  v11[3] = &unk_1E6D09998;
  v11[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__HDBiomeInterface_sleepFocusOn__block_invoke_189;
  v10[3] = &unk_1E6D099C0;
  v10[4] = self;
  v10[5] = &v12;
  v8 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", v11, v10);

  LOBYTE(v3) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v3;
}

void __32__HDBiomeInterface_sleepFocusOn__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_opt_class();
    v6 = v5;
    objc_msgSend(v2, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] User focus computed mode publisher finished with error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
}

void __32__HDBiomeInterface_sleepFocusOn__block_invoke_189(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52C0];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = v5;
      v8 = (void *)objc_opt_class();
      v9 = v8;
      objc_msgSend(v3, "eventBody");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v8;
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received event: %{public}@", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(v3, "eventBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "semanticType") == 3)
    {
      objc_msgSend(v3, "eventBody");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v12, "starting");

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }

  }
  else if (v6)
  {
    v13 = v5;
    v14 = (void *)objc_opt_class();
    v15 = (void *)MEMORY[0x1E0CB37E8];
    v16 = v14;
    objc_msgSend(v15, "numberWithUnsignedChar:", objc_msgSend(v3, "error"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v14;
    v20 = 2114;
    v21 = v17;
    _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received nil user focus computed mode with reason: %{public}@", (uint8_t *)&v18, 0x16u);

  }
}

- (void)unitTesting_workoutConfigurationUpdated:(id)a3 recentEventType:(int)a4
{
  self->_mostRecentBiomeEventType = a4;
  -[HDBiomeInterface workoutConfigurationUpdated:](self, "workoutConfigurationUpdated:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
}

@end
