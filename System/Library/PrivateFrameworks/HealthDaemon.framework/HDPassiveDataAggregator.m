@implementation HDPassiveDataAggregator

- (Class)sensorDatumClass
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)dataObjectsFromSensorDatum:(id)a3 error:(id *)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)dataCollector:(id)a3 didCollectSensorData:(id)a4 device:(id)a5 options:(unint64_t)a6
{
  HDPassiveDataAggregator *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  os_log_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  HDPassiveDataAggregator *v21;
  NSObject *v22;
  os_log_t v23;
  NSObject *v24;
  HDPassiveDataAggregator *v25;
  HDPassiveDataAggregator *v26;
  objc_class *v27;
  objc_class *v28;
  void *v29;
  HDPassiveDataAggregator *v30;
  NSObject *v31;
  NSObject *v32;
  objc_class *v33;
  objc_class *v34;
  BOOL v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  HDPassiveDataAggregator *v42;
  HDPassiveDataAggregator *v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  uint8_t buf[4];
  HDPassiveDataAggregator *v52;
  __int16 v53;
  objc_class *v54;
  __int16 v55;
  HDPassiveDataAggregator *v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = (HDPassiveDataAggregator *)a3;
  v11 = a4;
  v12 = a5;
  v50.receiver = self;
  v50.super_class = (Class)HDPassiveDataAggregator;
  -[HDDataAggregator dataCollector:didCollectSensorData:device:options:](&v50, sel_dataCollector_didCollectSensorData_device_options_, v10, v11, v12, a6);
  if ((a6 & 1) == 0)
  {
    -[HDPassiveDataAggregator sourceForDataAggregator:](v10, "sourceForDataAggregator:", self);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      v39 = (void *)v13;
      v40 = v12;
      v42 = v10;
      -[HDPassiveDataAggregator sensorDatumClass](self, "sensorDatumClass");
      v43 = (HDPassiveDataAggregator *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v41 = v11;
      v15 = v11;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
      v17 = (os_log_t *)MEMORY[0x1E0CB52A8];
      if (v16)
      {
        v18 = v16;
        v19 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v47 != v19)
              objc_enumerationMutation(v15);
            v21 = *(HDPassiveDataAggregator **)(*((_QWORD *)&v46 + 1) + 8 * i);
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (-[HDDataAggregator doesDatumPredateDatabaseObliteration:](self, "doesDatumPredateDatabaseObliteration:", v21))
              {
                _HKInitializeLogging();
                v22 = *v17;
                if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  v52 = self;
                  _os_log_debug_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEBUG, "%{public}@: Rejecting sensor datum from pre-obliteration", buf, 0xCu);
                }
              }
              else
              {
                v45 = 0;
                -[HDPassiveDataAggregator dataObjectsFromSensorDatum:error:](self, "dataObjectsFromSensorDatum:error:", v21, &v45);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = (HDPassiveDataAggregator *)v45;
                if (v29)
                {
                  -[HDPassiveDataAggregator addObjectsFromArray:](v43, "addObjectsFromArray:", v29);
                }
                else
                {
                  _HKInitializeLogging();
                  v31 = *v17;
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                  {
                    v32 = v31;
                    v33 = (objc_class *)objc_opt_class();
                    *(_DWORD *)buf = 138412802;
                    v52 = v21;
                    v53 = 2114;
                    v54 = v33;
                    v55 = 2114;
                    v56 = v30;
                    v34 = v33;
                    _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "Failed to produce objects from sensor datum %@ (%{public}@): %{public}@", buf, 0x20u);

                  }
                }

                v17 = (os_log_t *)MEMORY[0x1E0CB52A8];
              }
            }
            else
            {
              _HKInitializeLogging();
              v23 = *v17;
              if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
              {
                v24 = v23;
                v25 = (HDPassiveDataAggregator *)objc_opt_class();
                v26 = v25;
                v27 = -[HDPassiveDataAggregator sensorDatumClass](self, "sensorDatumClass");
                *(_DWORD *)buf = 138543618;
                v52 = v25;
                v53 = 2114;
                v54 = v27;
                v28 = v27;
                _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "Rejecting sensor datum of unexpected class %{public}@ (expected %{public}@)", buf, 0x16u);

              }
            }
          }
          v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
        }
        while (v18);
      }

      v44 = 0;
      v10 = v42;
      v14 = v39;
      v12 = v40;
      v35 = -[HDDataAggregator persistObjects:usedDatums:collector:source:device:resolveAssociations:error:](self, "persistObjects:usedDatums:collector:source:device:resolveAssociations:error:", v43, v15, v42, v39, v40, 0, &v44);
      v36 = v44;
      if (!v35)
      {
        _HKInitializeLogging();
        v37 = *MEMORY[0x1E0CB52A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          v52 = v43;
          v53 = 2114;
          v54 = (objc_class *)v15;
          v55 = 2114;
          v56 = v42;
          v57 = 2114;
          v58 = v36;
          _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "Failed to persist %@ through %{public}@ from %{public}@: %{public}@", buf, 0x2Au);
        }
      }

      v11 = v41;
    }
    else
    {
      _HKInitializeLogging();
      v38 = *MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v10;
        _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "Collector %{public}@ failed to provide a source", buf, 0xCu);
      }
    }

  }
}

@end
