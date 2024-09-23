@implementation HKWorkoutActivity(HDCodingSupport)

- (id)codableRepresentationForSync
{
  return +[HDCodableWorkoutActivity codableForWorkoutActivity:](HDCodableWorkoutActivity, "codableForWorkoutActivity:", a1);
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);

    v8 = (void *)MEMORY[0x1E0CB6E20];
    objc_msgSend(v4, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createWithCodable:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "startDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hasEndDate"))
    {
      objc_msgSend(v4, "endDate");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v4, "duration");
    v15 = v14;
    if (objc_msgSend(v4, "hasMetadata"))
    {
      v16 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(v4, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hk_dictionaryWithCodableMetadata:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(v4, "statistics");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v11;
    v21 = v12;
    objc_opt_self();
    if (objc_msgSend(v19, "count"))
    {
      v52 = v21;
      v46 = v18;
      v47 = v10;
      v48 = v7;
      v49 = v4;
      v50 = v3;
      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v19, "count"));
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v45 = v19;
      v22 = v19;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v54 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            v28 = objc_msgSend(v27, "quantityType");
            if ((_HKValidDataTypeCode() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                v30 = v20;
                v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6C68]), "initWithDataType:startDate:endDate:", v29, v20, v52);
                objc_msgSend(v29, "canonicalUnit");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v27, "hasSumQuantity"))
                {
                  v33 = (void *)MEMORY[0x1E0CB6A28];
                  objc_msgSend(v27, "sumQuantity");
                  objc_msgSend(v33, "quantityWithUnit:doubleValue:", v32);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "setSumQuantity:", v34);

                }
                if (objc_msgSend(v27, "hasMinQuantity"))
                {
                  v35 = (void *)MEMORY[0x1E0CB6A28];
                  objc_msgSend(v27, "minQuantity");
                  objc_msgSend(v35, "quantityWithUnit:doubleValue:", v32);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "setMinimumQuantity:", v36);

                }
                if (objc_msgSend(v27, "hasMaxQuantity"))
                {
                  v37 = (void *)MEMORY[0x1E0CB6A28];
                  objc_msgSend(v27, "maxQuantity");
                  objc_msgSend(v37, "quantityWithUnit:doubleValue:", v32);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "setMaximumQuantity:", v38);

                }
                if (objc_msgSend(v27, "hasAvgQuantity"))
                {
                  v39 = (void *)MEMORY[0x1E0CB6A28];
                  objc_msgSend(v27, "avgQuantity");
                  objc_msgSend(v39, "quantityWithUnit:doubleValue:", v32);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "setAverageQuantity:", v40);

                }
                objc_msgSend(v51, "setObject:forKeyedSubscript:", v31, v29);

                v20 = v30;
              }

            }
            else
            {
              _HKInitializeLogging();
              v41 = *MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                v58 = v28;
                _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "Ignoring workout statistics for invalid data type code %ld", buf, 0xCu);
              }
            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
        }
        while (v24);
      }

      v4 = v49;
      v3 = v50;
      v10 = v47;
      v7 = v48;
      v19 = v45;
      v18 = v46;
      v42 = v51;
      v21 = v52;
    }
    else
    {
      v42 = 0;
    }

    objc_msgSend(v10, "activityType");
    if (_HKWorkoutActivityTypeIsValid())
    {
      v43 = objc_alloc(MEMORY[0x1E0CB6DD8]);
      v13 = (void *)objc_msgSend(v43, "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", v7, v10, v20, v21, MEMORY[0x1E0C9AA60], 0, v15, v18, v42);
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
