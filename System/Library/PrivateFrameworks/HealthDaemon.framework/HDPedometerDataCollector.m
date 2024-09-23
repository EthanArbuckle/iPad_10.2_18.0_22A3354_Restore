@implementation HDPedometerDataCollector

- (HDPedometerDataCollector)initWithProfile:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HDPedometerDataCollector *v12;
  HDPedometerDataCollector *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend((id)objc_opt_class(), "isPedometerDataCollectionSupported"))
  {
LABEL_5:
    v12 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("HDDataCollectionDisablePedometer"));

  if (v6)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)MEMORY[0x1E0C99EA0];
      v9 = v7;
      objc_msgSend(v8, "standardUserDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "valueForKey:", CFSTR("HDDataCollectionDisablePedometer"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = CFSTR("HDDataCollectionDisablePedometer");
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "Calorimetry data collection disabled because defaults key '%{public}@' is %{public}@", buf, 0x16u);

    }
    goto LABEL_5;
  }
  v16.receiver = self;
  v16.super_class = (Class)HDPedometerDataCollector;
  v13 = -[HDCoreMotionDataCollector initWithProfile:](&v16, sel_initWithProfile_, v4);
  if (v13)
  {
    objc_msgSend(v4, "userCharacteristicsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addProfileObserver:", v13);

  }
  self = v13;
  v12 = self;
LABEL_9:

  return v12;
}

- (void)userCharacteristicsManager:(id)a3 didUpdateUserProfile:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HDCoreMotionDataCollector queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__HDPedometerDataCollector_userCharacteristicsManager_didUpdateUserProfile___block_invoke;
  v8[3] = &unk_1E6CE8080;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

+ (BOOL)isPedometerDataCollectionSupported
{
  if ((objc_msgSend(MEMORY[0x1E0CA5698], "isStepCountingAvailable") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CA5698], "isFloorCountingAvailable") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(MEMORY[0x1E0CA5698], "isDistanceAvailable");
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HDCoreMotionDataCollector profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userCharacteristicsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeProfileObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HDPedometerDataCollector;
  -[HDCoreMotionDataCollector dealloc](&v5, sel_dealloc);
}

- (Class)coreMotionDatumClass
{
  return (Class)objc_opt_class();
}

- (id)collectedTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D78]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)queue_newDataSource
{
  NSObject *v4;
  int v5;
  HDPedometerDataCollector *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self && self->_userCondition)
    return objc_alloc_init(MEMORY[0x1E0CA5698]);
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Not creating data source: user condition is not yet set.", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (double)queue_differenceFromDatum:(id)a3 toDatum:(id)a4 type:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  int v26;
  double v27;
  void *v28;
  int v29;
  double v30;
  void *v31;
  double v32;
  void *v34;
  int v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  NSObject *v40;
  NSObject *v41;
  int v42;
  HDPedometerDataCollector *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "hd_epochDatestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hd_epochDatestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToDate:", v12);

  objc_msgSend(v8, "hd_epochDatestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hd_datestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToDate:", v15) & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
    objc_msgSend(v9, "hd_epochDatestamp");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hd_datestamp");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v17, "isEqualToDate:", v18);

  }
  objc_msgSend(v10, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CB5C68]);

  if (v20)
  {
    if (self && !-[NSNumber integerValue](self->_userCondition, "integerValue")
      || (v21 = 0.0, objc_msgSend(v9, "hd_hasWorkout")))
    {
      objc_msgSend(v9, "distance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v21 = v23;
      if (((v13 | v16) & 1) != 0)
      {
        objc_msgSend(v8, "distance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
        v31 = v24;
        objc_msgSend(v24, "doubleValue");
        v21 = v21 - v32;

LABEL_17:
        if (v21 < 0.0)
          v21 = 0.0;
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else
  {
    objc_msgSend(v10, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0CB5C90]);

    if (v26)
    {
      objc_msgSend(v9, "floorsAscended");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v21 = v27;
      if (((v13 | v16) & 1) != 0)
      {
        objc_msgSend(v8, "floorsAscended");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v10, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0CB5D18]);

    if (v29)
    {
      objc_msgSend(v9, "numberOfPushes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v21 = v30;
      if (((v13 | v16) & 1) != 0)
      {
        objc_msgSend(v8, "numberOfPushes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      goto LABEL_20;
    }
    objc_msgSend(v10, "identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isEqualToString:", *MEMORY[0x1E0CB5D78]);

    if (v35)
    {
      if (self && !-[NSNumber integerValue](self->_userCondition, "integerValue")
        || (v21 = 0.0, objc_msgSend(v9, "hd_hasWorkout")))
      {
        objc_msgSend(v9, "numberOfSteps");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "doubleValue");
        v21 = v37;
        if ((v13 | v16) == 1)
        {
          objc_msgSend(v8, "numberOfSteps");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "doubleValue");
          v21 = v21 - v39;

        }
        if (v21 > 10000.0)
        {
          _HKInitializeLogging();
          v40 = *MEMORY[0x1E0CB52A8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
          {
            v42 = 134218498;
            v43 = *(HDPedometerDataCollector **)&v21;
            v44 = 2112;
            v45 = v8;
            v46 = 2112;
            v47 = v9;
            _os_log_impl(&dword_1B7802000, v40, OS_LOG_TYPE_DEFAULT, "Unexpectedly large step count (%lf) between %@ and %@", (uint8_t *)&v42, 0x20u);
          }
        }
        goto LABEL_17;
      }
    }
    else
    {
      _HKInitializeLogging();
      v41 = *MEMORY[0x1E0CB52A8];
      v21 = 0.0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_FAULT))
      {
        v42 = 138412546;
        v43 = self;
        v44 = 2112;
        v45 = v10;
        _os_log_fault_impl(&dword_1B7802000, v41, OS_LOG_TYPE_FAULT, "%@: Unexpected type '%@' during difference calculation.", (uint8_t *)&v42, 0x16u);
      }
    }
  }
LABEL_21:

  return v21;
}

- (id)persistentIdentifier
{
  return CFSTR("HDPedometerDataCollector");
}

uint64_t __76__HDPedometerDataCollector_userCharacteristicsManager_didUpdateUserProfile___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0CA55A0]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  if (*(_QWORD *)(a1 + 40))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v5 + 72))
      *(_QWORD *)(v5 + 72) = &unk_1E6DFE810;
  }
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated user characteristics", (uint8_t *)&v9, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "queue_recomputeCurrentState");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userCondition, 0);
}

@end
