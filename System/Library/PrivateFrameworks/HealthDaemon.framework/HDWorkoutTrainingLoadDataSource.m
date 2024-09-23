@implementation HDWorkoutTrainingLoadDataSource

- (HDWorkoutTrainingLoadDataSource)init
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

- (HDWorkoutTrainingLoadDataSource)initWithProfile:(id)a3 quantityType:(id)a4 filter:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDWorkoutTrainingLoadDataSource *v11;
  HDWorkoutTrainingLoadDataSource *v12;
  uint64_t v13;
  HKQuantityType *quantityType;
  uint64_t v15;
  _HKFilter *filter;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDWorkoutTrainingLoadDataSource;
  v11 = -[HDWorkoutTrainingLoadDataSource init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    v13 = objc_msgSend(v9, "copy");
    quantityType = v12->_quantityType;
    v12->_quantityType = (HKQuantityType *)v13;

    v15 = objc_msgSend(v10, "copy");
    filter = v12->_filter;
    v12->_filter = (_HKFilter *)v15;

  }
  return v12;
}

- (BOOL)samplesForCalculatorWithHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__HDWorkoutTrainingLoadDataSource_samplesForCalculatorWithHandler___block_invoke;
  v12[3] = &unk_1E6CEE458;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  v8 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDWorkoutEntity, "performReadTransactionWithHealthDatabase:error:block:", v6, &v14, v12);
  v9 = v14;

  if (!v8)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Error querying workout samples: %{public}@", buf, 0xCu);
    }
  }

  return v8;
}

BOOL __67__HDWorkoutTrainingLoadDataSource_samplesForCalculatorWithHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _BOOL8 v17;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v25[0] = CFSTR("uuid");
  v25[1] = CFSTR("start_date");
  v25[2] = CFSTR("end_date");
  v25[3] = CFSTR("provenance");
  v25[4] = CFSTR("activities.activity_type");
  v25[5] = CFSTR("activities.duration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  WeakRetained = objc_loadWeakRetained((id *)(v6 + 8));
  objc_msgSend(v7, "predicateWithProfile:", WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("start_date"), objc_opt_class(), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__HDWorkoutTrainingLoadDataSource_samplesForCalculatorWithHandler___block_invoke_2;
  v20[3] = &unk_1E6CEE430;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(a1 + 40);
  v21 = v4;
  v22 = v14;
  v23 = v15;
  v16 = v4;
  v17 = +[HDHealthEntity enumerateProperties:withPredicate:orderingTerms:groupBy:limit:healthDatabase:error:enumerationHandler:](HDWorkoutEntity, "enumerateProperties:withPredicate:orderingTerms:groupBy:limit:healthDatabase:error:enumerationHandler:", v5, v9, v11, 0, 0, v13, a3, v20);

  return v17;
}

BOOL __67__HDWorkoutTrainingLoadDataSource_samplesForCalculatorWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  double v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "databaseForEntityClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutActivityEntity subActivitiesWithOwnerID:database:error:](HDWorkoutActivityEntity, "subActivitiesWithOwnerID:database:error:", a2, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = HDSQLiteColumnWithNameAsInt64();
    HDSQLiteColumnWithNameAsUUID();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDate();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDate();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = HDSQLiteColumnWithNameAsInt64();
    v11 = HDSQLiteColumnWithNameAsInt64();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(WeakRetained, "dataProvenanceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "originProvenanceForPersistentID:transaction:error:", v14, *(_QWORD *)(a1 + 32), a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v15 != 0;
    if (v15)
    {
      v17 = (double)v36;
      if (v10 == 82)
      {
        v35 = v9;
        v37 = v8;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v22 = v9;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v42 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              objc_msgSend(v27, "workoutConfiguration");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "activityType");

              if (v29 != 83)
              {
                v30 = *(_QWORD *)(a1 + 40);
                objc_msgSend(v15, "sourceID");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDWorkoutTrainingLoadDataSource _retrieveSamplesAndCalculateTrainingLoadForWorkoutUUID:workoutPID:workoutStartDate:workoutEndDate:workoutActivityType:workoutDuration:sourceID:activity:sampleHandler:](v30, v40, a2, v39, v38, 82, objc_msgSend(v31, "longLongValue"), v27, v17, *(void **)(a1 + 48));

              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          }
          while (v24);
        }

        v9 = v35;
        v8 = v37;
        v16 = v15 != 0;
      }
      else if (v10 == 84)
      {
        _HKInitializeLogging();
        v18 = (void *)*MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
        {
          v19 = *(_QWORD *)(a1 + 40);
          v20 = v18;
          _HKWorkoutActivityNameForActivityType();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v19;
          v48 = 2114;
          v49 = v21;
          _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_INFO, "%{public}@: Not retrieving rating of exertion samples for workout activity: %{public}@", buf, 0x16u);

        }
      }
      else
      {
        v32 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v15, "sourceID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDWorkoutTrainingLoadDataSource _retrieveSamplesAndCalculateTrainingLoadForWorkoutUUID:workoutPID:workoutStartDate:workoutEndDate:workoutActivityType:workoutDuration:sourceID:activity:sampleHandler:](v32, v40, a2, v39, v38, v10, objc_msgSend(v33, "longLongValue"), 0, v17, *(void **)(a1 + 48));

      }
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_retrieveSamplesAndCalculateTrainingLoadForWorkoutUUID:(uint64_t)a3 workoutPID:(void *)a4 workoutStartDate:(void *)a5 workoutEndDate:(uint64_t)a6 workoutActivityType:(uint64_t)a7 workoutDuration:(void *)a8 sourceID:(double)a9 activity:(void *)a10 sampleHandler:
{
  id v16;
  void *v17;
  id WeakRetained;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void (**v24)(id, uint64_t, uint64_t, id, _QWORD, double, double, double);
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  int v63;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  double *v73;
  uint64_t v74;
  uint64_t v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  id v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  uint64_t v83;
  _BYTE v84[24];
  void *v85;
  id v86;
  id v87;
  id v88;
  uint64_t *v89;
  double v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v67 = a2;
  v68 = a4;
  v69 = a5;
  v16 = a8;
  v70 = a10;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v17, "hk_BOOLForKey:defaultValue:", CFSTR("HDWorkoutTrainingLoadNoisyLogging"), 0);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v71 = 0;
    _HDRatingOfExertionSamplesForWorkoutPID(a3, v16, 1, WeakRetained, &v71);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v71;

    if (v20)
    {
      objc_msgSend(v16, "workoutConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "activityType");

      _HKInitializeLogging();
      v22 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        v55 = v22;
        _HKWorkoutActivityNameForActivityType();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v84 = 138543874;
        *(_QWORD *)&v84[4] = a1;
        *(_WORD *)&v84[12] = 2114;
        *(_QWORD *)&v84[14] = v56;
        *(_WORD *)&v84[22] = 2114;
        v85 = v20;
        _os_log_error_impl(&dword_1B7802000, v55, OS_LOG_TYPE_ERROR, "%{public}@: Error retrieving rating of exertion samples for workout activity %{public}@: %{public}@", v84, 0x20u);

      }
LABEL_5:

      goto LABEL_6;
    }
    v62 = v19;
    v66 = v67;
    v61 = v68;
    v60 = v69;
    v23 = v16;
    v24 = (void (**)(id, uint64_t, uint64_t, id, _QWORD, double, double, double))v70;
    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DD8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C88]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    v73 = (double *)&v72;
    v74 = 0x2020000000;
    v75 = 0;
    *(_QWORD *)v84 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v84[8] = 3221225472;
    *(_QWORD *)&v84[16] = __180__HDWorkoutTrainingLoadDataSource__calculateTrainingLoadForSamples_workoutUUID_workoutStartDate_workoutEndDate_workoutActivityType_workoutDuration_sourceID_activity_sampleHandler___block_invoke;
    v85 = &unk_1E6CEE480;
    v57 = v25;
    v86 = v57;
    v59 = v26;
    v87 = v59;
    v27 = v23;
    v90 = a9;
    v88 = v27;
    v89 = &v72;
    objc_msgSend(v62, "enumerateObjectsUsingBlock:", v84);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v28, "hk_BOOLForKey:defaultValue:", CFSTR("HDWorkoutTrainingLoadNoisyLogging"), 0);

    if ((_DWORD)v26)
    {
      _HKInitializeLogging();
      v29 = (id)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v27, "UUID", v57, v59);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *((_QWORD *)v73 + 3);
        *(_DWORD *)buf = 138544130;
        v77 = a1;
        v78 = 2114;
        v79 = v66;
        v80 = 2114;
        v81 = v30;
        v82 = 2048;
        v83 = v31;
        _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Calculated training load for workout <%{public}@>, activity <%{public}@> is %f ", buf, 0x2Au);

      }
    }
    else
    {
      _HKInitializeLogging();
      v32 = (void *)*MEMORY[0x1E0CB5380];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
      {
LABEL_14:
        objc_msgSend(v27, "startDate", v57);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)v35;
        v37 = v61;
        if (v35)
          v37 = (void *)v35;
        v38 = v37;

        objc_msgSend(v27, "endDate");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v39;
        v41 = v60;
        if (v39)
          v41 = (void *)v39;
        v42 = v41;

        objc_msgSend(v27, "workoutConfiguration");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "activityType");
        if (v44)
          v45 = v44;
        else
          v45 = a6;

        v46 = v73[3];
        objc_msgSend(v38, "timeIntervalSinceReferenceDate");
        v48 = v47;
        objc_msgSend(v42, "timeIntervalSinceReferenceDate");
        v24[2](v24, a7, v45, v66, 0, v46, v48, v49);

        _Block_object_dispose(&v72, 8);
        _HKInitializeLogging();
        v50 = *MEMORY[0x1E0CB5380];
        if (v63)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
          {
            v51 = v50;
            objc_msgSend(v27, "UUID");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v84 = 138543874;
            *(_QWORD *)&v84[4] = a1;
            *(_WORD *)&v84[12] = 2114;
            *(_QWORD *)&v84[14] = v66;
            *(_WORD *)&v84[22] = 2114;
            v85 = v52;
            _os_log_impl(&dword_1B7802000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@: retrieved rating of exertion samples for workout <%{public}@>, activity %{public}@ successfully", v84, 0x20u);

          }
        }
        else if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v53 = v50;
          objc_msgSend(v27, "UUID");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v84 = 138543874;
          *(_QWORD *)&v84[4] = a1;
          *(_WORD *)&v84[12] = 2114;
          *(_QWORD *)&v84[14] = v66;
          *(_WORD *)&v84[22] = 2114;
          v85 = v54;
          _os_log_impl(&dword_1B7802000, v53, OS_LOG_TYPE_INFO, "%{public}@: retrieved rating of exertion samples for workout <%{public}@>, activity %{public}@ successfully", v84, 0x20u);

        }
        goto LABEL_5;
      }
      v29 = v32;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v27, "UUID", v57, v59);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = *((_QWORD *)v73 + 3);
        *(_DWORD *)buf = 138544130;
        v77 = a1;
        v78 = 2114;
        v79 = v66;
        v80 = 2114;
        v81 = v33;
        v82 = 2048;
        v83 = v34;
        _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_INFO, "%{public}@: Calculated training load for workout <%{public}@>, activity <%{public}@> is %f ", buf, 0x2Au);

      }
    }

    goto LABEL_14;
  }
LABEL_6:

}

void __180__HDWorkoutTrainingLoadDataSource__calculateTrainingLoadForSamples_workoutUUID_workoutStartDate_workoutEndDate_workoutActivityType_workoutDuration_sourceID_activity_sampleHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = a2;
  objc_msgSend(v17, "quantityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    v8 = (unint64_t)v17;
    v9 = 0;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v17, "quantityType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 40));

    if (v11)
      v9 = (unint64_t)v17;
    else
      v9 = 0;
    v8 = 0;
  }
  if (v9 | v8)
  {
    objc_msgSend(v17, "quantity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValueForUnit:", v13);
    v15 = v14;

    objc_msgSend(*(id *)(a1 + 48), "duration");
    if (v16 == 0.0)
      v16 = *(double *)(a1 + 64);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = round(v15) * v16;
  }

}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (_HKFilter)filter
{
  return self->_filter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
