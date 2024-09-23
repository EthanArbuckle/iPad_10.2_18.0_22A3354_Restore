@implementation HDHeartRateDataAggregator

- (id)objectType
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6B00], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
}

- (HDHeartRateDataAggregator)initWithDataCollectionManager:(id)a3
{
  HDHeartRateDataAggregator *v3;
  void *v4;
  HDHeartRateDataCollectionForwarder *v5;
  HDDataCollectionForwarder *dataForwarder;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDHeartRateDataAggregator;
  v3 = -[HDDataAggregator initWithDataCollectionManager:](&v8, sel_initWithDataCollectionManager_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_workoutManagerStateChanged_, CFSTR("HDWorkoutManagerStateDidChange"), 0);

    v5 = objc_alloc_init(HDHeartRateDataCollectionForwarder);
    dataForwarder = v3->_dataForwarder;
    v3->_dataForwarder = (HDDataCollectionForwarder *)v5;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDHeartRateDataAggregator;
  -[HDHeartRateDataAggregator dealloc](&v4, sel_dealloc);
}

- (id)configurationForCollector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  HDHeartRateDataAggregator *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDDataAggregator allCollectors](self, "allCollectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDataAggregator configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[HDHeartRateDataAggregator _shouldRequestActiveCollectionForConfiguration:]((uint64_t)self, v6) & 1) != 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      v11 = 2;
      v20 = v5;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v13, "collector");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          if (v14 == v4)
            goto LABEL_16;
          objc_msgSend(v13, "state");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "collectionType");

          if (v16 == 2)
          {
            v11 = 1;
LABEL_16:
            v5 = v20;
            goto LABEL_17;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v5 = v20;
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v11 = 2;
    }
LABEL_17:

    +[HDDataCollectorConfiguration configurationWithType:aggregatorConfiguration:](HDDataCollectorConfiguration, "configurationWithType:aggregatorConfiguration:", v11, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
  }
  else
  {
    +[HDDataCollectorConfiguration configurationWithType:aggregatorConfiguration:](HDDataCollectorConfiguration, "configurationWithType:aggregatorConfiguration:", 1, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:
      *(_DWORD *)buf = 138543874;
      v27 = self;
      v28 = 2114;
      v29 = v4;
      v30 = 2114;
      v31 = v17;
      _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Configuration for collector %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return v17;
}

- (uint64_t)_shouldRequestActiveCollectionForConfiguration:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "dataCollectionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isInHeartRateRecovery");

    if ((v7 & 1) != 0 || (objc_msgSend(v3, "hasForegroundObserver") & 1) != 0)
      a1 = 1;
    else
      a1 = objc_msgSend(v3, "hasActiveWorkout");
  }

  return a1;
}

- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5 options:(unint64_t)a6
{
  char v6;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_log_t *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  os_log_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  double v29;
  double v30;
  os_log_t v31;
  NSObject *v32;
  const char *v33;
  os_log_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  id v61;
  HDHeartRateDataAggregator *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  BOOL v72;
  char v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[5];
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  char v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  objc_super v87;
  _BYTE buf[12];
  __int16 v89;
  double v90;
  _BYTE v91[128];
  _QWORD v92[4];

  v6 = a6;
  v92[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v87.receiver = self;
  v87.super_class = (Class)HDHeartRateDataAggregator;
  v66 = a5;
  -[HDDataAggregator dataCollector:didCollectSensorData:device:options:](&v87, sel_dataCollector_didCollectSensorData_device_options_, v10, v11);
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v10, "sourceForDataAggregator:", self);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
    {
      v57 = (void *)v12;
      v59 = v10;
      objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "canonicalUnit");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v58 = v11;
      v15 = v11;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
      if (!v16)
      {
        v73 = 0;
        goto LABEL_43;
      }
      v17 = v16;
      v73 = 0;
      v18 = *(_QWORD *)v84;
      v60 = *MEMORY[0x1E0CB7298];
      v19 = (os_log_t *)MEMORY[0x1E0CB52A8];
      v62 = self;
      v63 = v14;
      v61 = v15;
      while (1)
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v84 != v18)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v20);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            _HKInitializeLogging();
            v23 = *v19;
            if (!os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
              goto LABEL_35;
            v24 = v23;
            v25 = (void *)objc_opt_class();
            v26 = v25;
            v27 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v25;
            v89 = 2114;
            v90 = *(double *)&v27;
            v28 = v27;
            _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "Rejecting heart rate sensor datum of unexpected class %{public}@ (expected %{public}@)", buf, 0x16u);

LABEL_33:
            v19 = (os_log_t *)MEMORY[0x1E0CB52A8];
            goto LABEL_34;
          }
          if (!-[HDDataAggregator doesDatumPredateDatabaseObliteration:](self, "doesDatumPredateDatabaseObliteration:", v21))
          {
            objc_msgSend(v21, "quantity");
            v24 = objc_claimAutoreleasedReturnValue();
            if ((-[NSObject isCompatibleWithUnit:](v24, "isCompatibleWithUnit:", v14) & 1) != 0)
            {
              -[NSObject doubleValueForUnit:](v24, "doubleValueForUnit:", v14);
              if (v29 >= 0.0)
              {
                v72 = objc_msgSend(v21, "heartRateContext") == 10;
                v67 = (void *)MEMORY[0x1E0CB6A40];
                objc_msgSend(v21, "quantity");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "dateInterval");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "startDate");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "dateInterval");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "endDate");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (self)
                {
                  v36 = objc_msgSend(v21, "heartRateContext");
                  -[HDDataAggregator dataCollectionManager](self, "dataCollectionManager");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "profile");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "workoutManager");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v39, "currentWorkoutConfiguration");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v36 == 9 || v40 == 0)
                    v42 = v36;
                  else
                    v42 = 6;
                  v92[0] = v60;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v42);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_QWORD *)buf = v43;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v92, 1);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v44 = 0;
                }
                objc_msgSend(v67, "_quantitySamplesEnforcingDurationWithType:quantity:startDate:endDate:device:metadata:", v65, v71, v69, v35, v66, v44);
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v21, "datumIdentifier");
                v46 = objc_claimAutoreleasedReturnValue();
                if (v46)
                {
                  v47 = (void *)v46;
                  v48 = objc_msgSend(v45, "count");

                  if (v48)
                  {
                    objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "datumIdentifier");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "_setUUID:", v50);

                  }
                }
                v73 |= v72;
                objc_msgSend(v64, "addObjectsFromArray:", v45);

                self = v62;
                v14 = v63;
                v15 = v61;
                goto LABEL_33;
              }
              v30 = v29;
              _HKInitializeLogging();
              v31 = *v19;
              if (!os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
              {
LABEL_34:

                goto LABEL_35;
              }
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v24;
              v89 = 2048;
              v90 = v30;
              v32 = v31;
              v33 = "Rejecting heart rate quantity %@ because it's value (%f) is less than 0.0";
            }
            else
            {
              _HKInitializeLogging();
              v34 = *v19;
              if (!os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
                goto LABEL_34;
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v24;
              v89 = 2114;
              v90 = *(double *)&v14;
              v32 = v34;
              v33 = "Rejecting heart rate quantity %@ because it is not compatible with canonical unit %{public}@";
            }
            _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x16u);
            goto LABEL_34;
          }
          _HKInitializeLogging();
          v22 = *v19;
          if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = self;
            _os_log_debug_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEBUG, "%{public}@: Rejecting sensor datum from pre-obliteration", buf, 0xCu);
          }
LABEL_35:
          ++v20;
        }
        while (v17 != v20);
        v51 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
        v17 = v51;
        if (!v51)
        {
LABEL_43:

          v53 = v15;
          v13 = v57;
          -[HDDataCollectionForwarder insertSamples:device:source:](self->_dataForwarder, "insertSamples:device:source:", v64, v66, v57);
          -[HDDataAggregator dataCollectionManager](self, "dataCollectionManager");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = MEMORY[0x1E0C809B0];
          v76[0] = MEMORY[0x1E0C809B0];
          v76[1] = 3221225472;
          v76[2] = __79__HDHeartRateDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke;
          v76[3] = &unk_1E6D11470;
          v76[4] = self;
          v77 = v64;
          v78 = v53;
          v10 = v59;
          v79 = v59;
          v80 = v57;
          v81 = v66;
          v82 = v73 & 1;
          v74[0] = v55;
          v74[1] = 3221225472;
          v74[2] = __79__HDHeartRateDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_2;
          v74[3] = &unk_1E6CE77C8;
          v75 = v77;
          v56 = v77;
          objc_msgSend(v54, "performSaveWithMaximumLatency:block:completion:", v76, v74, 1.0);

          v11 = v58;
          goto LABEL_44;
        }
      }
    }
    _HKInitializeLogging();
    v52 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v10;
      _os_log_error_impl(&dword_1B7802000, v52, OS_LOG_TYPE_ERROR, "Collector %{public}@ failed to provide a source", buf, 0xCu);
    }
LABEL_44:

  }
}

uint64_t __79__HDHeartRateDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "persistObjects:usedDatums:collector:source:device:resolveAssociations:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 80), a4);
}

void __79__HDHeartRateDataAggregator_dataCollector_didCollectSensorData_device_options___block_invoke_2(uint64_t a1, char a2, void *a3)
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
    v6 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Failed to persist heart rate samples '%@': %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (void)setConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  HDHeartRateDataAggregator *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting configuration update to %{public}@", buf, 0x16u);
  }
  if (-[HDHeartRateDataAggregator _shouldRequestActiveCollectionForConfiguration:]((uint64_t)self, v4))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDActiveDataCollectionObserverServer launchObservingProcessesForTypes:](HDActiveDataCollectionObserverServer, "launchObservingProcessesForTypes:", v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)HDHeartRateDataAggregator;
  -[HDDataAggregator setConfiguration:](&v9, sel_setConfiguration_, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataForwarder, 0);
}

@end
