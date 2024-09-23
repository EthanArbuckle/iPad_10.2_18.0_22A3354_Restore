@implementation HDWorkoutBuilderServer

+ (id)recoveredWorkoutBuilderConfigurationForClient:(id)a3 sessionIdentifier:(id)a4 builderIdentifierOut:(id *)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__171;
  v36 = __Block_byref_object_dispose__171;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__171;
  v30 = __Block_byref_object_dispose__171;
  v31 = 0;
  objc_msgSend(v13, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __125__HDWorkoutBuilderServer_recoveredWorkoutBuilderConfigurationForClient_sessionIdentifier_builderIdentifierOut_profile_error___block_invoke;
  v20[3] = &unk_1E6D0B620;
  v15 = v13;
  v21 = v15;
  v16 = v11;
  v22 = v16;
  v17 = v12;
  v23 = v17;
  v24 = &v26;
  v25 = &v32;
  LOBYTE(a7) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performReadTransactionWithHealthDatabase:error:block:", v14, a7, v20);

  if ((a7 & 1) != 0)
  {
    if (a5)
      *a5 = objc_retainAutorelease((id)v27[5]);
    v18 = (id)v33[5];
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

uint64_t __125__HDWorkoutBuilderServer_recoveredWorkoutBuilderConfigurationForClient_sessionIdentifier_builderIdentifierOut_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t i;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v45 = 0;
  objc_msgSend(v7, "sourceForClient:error:", v8, &v45);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v45;

  if (!v9)
  {
    v21 = v10;
    v12 = v21;
    if (!v21)
    {
      v22 = 1;
      goto LABEL_39;
    }
    if (a3)
    {
      v12 = objc_retainAutorelease(v21);
      v22 = 0;
      *a3 = v12;
      goto LABEL_39;
    }
    _HKLogDroppedError();
LABEL_28:
    v22 = 0;
    goto LABEL_39;
  }
  +[HDWorkoutBuilderEntity workoutBuilderEntitiesForSource:profile:error:](HDWorkoutBuilderEntity, "workoutBuilderEntitiesForSource:profile:error:", v9, *(_QWORD *)(a1 + 32), a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = 0;
    goto LABEL_28;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (!v13)
  {
    v20 = 1;
    goto LABEL_38;
  }
  v14 = v13;
  v38 = v9;
  v39 = v10;
  v15 = *(_QWORD *)v42;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v42 != v15)
        objc_enumerationMutation(v12);
      v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      v40 = 0;
      objc_msgSend(v16, "sessionIdentifierWithTransaction:error:", v6, &v40);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v40;
      v19 = v18;
      if (v17)
      {
        if (objc_msgSend(v17, "isEqual:", *(_QWORD *)(a1 + 48)))
        {
          objc_msgSend(v16, "configurationWithTransaction:error:", v6, a3);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (!v23)
          {
            LOBYTE(i) = 0;
            v9 = v38;
LABEL_33:

LABEL_36:
            v20 = 0;
            goto LABEL_37;
          }
          objc_msgSend(v23, "deviceEntity");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            objc_msgSend(*(id *)(a1 + 32), "deviceManager");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v25, "persistentID"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "deviceForPersistentID:error:", v27, a3);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v28)
            {
              LOBYTE(i) = 0;
LABEL_32:
              v9 = v38;

              goto LABEL_33;
            }
          }
          else
          {
            v28 = 0;
          }
          objc_msgSend(v24, "builderIdentifier");
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v31 = *(void **)(v30 + 40);
          *(_QWORD *)(v30 + 40) = v29;

          v32 = objc_alloc_init(MEMORY[0x1E0CB6DE8]);
          v33 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v34 = *(void **)(v33 + 40);
          *(_QWORD *)(v33 + 40) = v32;

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setDevice:", v28);
          objc_msgSend(v24, "workoutConfiguration");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setWorkoutConfiguration:", v35);

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setGoalType:", objc_msgSend(v24, "goalType"));
          objc_msgSend(v24, "goal");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setGoal:", v36);

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setShouldCollectWorkoutEvents:", objc_msgSend(v24, "shouldCollectWorkoutEvents"));
          LOBYTE(i) = 1;
          goto LABEL_32;
        }
      }
      else if (v18)
      {
        if (a3)
        {
          LOBYTE(i) = 0;
          *a3 = objc_retainAutorelease(v18);
        }
        else
        {
          _HKLogDroppedError();
          LOBYTE(i) = 0;
        }
        v9 = v38;
        goto LABEL_36;
      }

    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v14)
      continue;
    break;
  }
  v20 = 1;
  v9 = v38;
LABEL_37:
  v10 = v39;
LABEL_38:

  v22 = v20 | i;
LABEL_39:

  return v22 & 1;
}

+ (void)finishDetachedBuilderForEntity:(id)a3 sessionEndDate:(id)a4 profile:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__171;
  v45 = __Block_byref_object_dispose__171;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__171;
  v39 = __Block_byref_object_dispose__171;
  v40 = 0;
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __80__HDWorkoutBuilderServer_finishDetachedBuilderForEntity_sessionEndDate_profile___block_invoke;
  v28[3] = &unk_1E6D0B648;
  v11 = v7;
  v29 = v11;
  v32 = &v35;
  v12 = v9;
  v30 = v12;
  v13 = v8;
  v31 = v13;
  v33 = &v41;
  v14 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performReadTransactionWithHealthDatabase:error:block:", v10, &v34, v28);
  v15 = v34;

  if (v14)
  {
    if (v36[5])
    {
      if (v42[5])
      {
        +[HDWorkoutBuilderEntity finishWorkoutBuilderWithIdentifier:dateInterval:profile:error:](HDWorkoutBuilderEntity, "finishWorkoutBuilderWithIdentifier:dateInterval:profile:error:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v15;

        if (v16 || !v17)
        {
          _HKInitializeLogging();
          v24 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
          {
            v25 = (void *)v36[5];
            *(_DWORD *)buf = 138543362;
            v48 = v25;
            _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "Finished workout builder %{public}@", buf, 0xCu);
          }
        }
        else
        {
          _HKInitializeLogging();
          v18 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v48 = v17;
            _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "Failed to finish workout builder: %{public}@", buf, 0xCu);
          }
        }

        v15 = v17;
      }
      else
      {
        v20 = +[HDWorkoutBuilderEntity discardBuilderWithIdentifier:profile:error:](HDWorkoutBuilderEntity, "discardBuilderWithIdentifier:profile:error:");
        v21 = v15;

        if (v20)
        {
          _HKInitializeLogging();
          v22 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
          {
            v23 = (void *)v36[5];
            *(_DWORD *)buf = 138543362;
            v48 = v23;
            _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEFAULT, "Discarded builder %{public}@", buf, 0xCu);
          }
        }
        else
        {
          _HKInitializeLogging();
          v26 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          {
            v27 = (void *)v36[5];
            *(_DWORD *)buf = 138543618;
            v48 = v27;
            v49 = 2114;
            v50 = v21;
            _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "Failed to discard builder %{public}@: %{public}@", buf, 0x16u);
          }
        }
        v15 = v21;
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v48 = v11;
      v49 = 2114;
      v50 = v15;
      _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "Failed to lookup current status for builder entity %{public}@: %{public}@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

}

uint64_t __80__HDWorkoutBuilderServer_finishDetachedBuilderForEntity_sessionEndDate_profile___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  BOOL v32;
  id v33;
  id v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  NSObject *v41;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v57 = 0;
  objc_msgSend(v6, "configurationWithTransaction:error:", v5, &v57);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v57;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v7, "builderIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_msgSend(*(id *)(a1 + 40), "daemon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "taskServerRegistry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "taskServerForTaskUUID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v15, "invalidated") & 1) == 0)
    {
      _HKInitializeLogging();
      v25 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543362;
        v59 = v26;
        _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "Not automatically finishing builder %{public}@: Builder server is still present.", buf, 0xCu);
      }
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v19 = *(id *)(v27 + 40);
      *(_QWORD *)(v27 + 40) = 0;
      v20 = 1;
      goto LABEL_47;
    }
    v16 = *(void **)(a1 + 32);
    v56 = 0;
    objc_msgSend(v16, "dataIntervalInTransaction:error:", v5, &v56);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v56;
    v19 = v18;
    if (!v17 && v18)
    {
      if (a3)
      {
LABEL_7:
        v19 = objc_retainAutorelease(v19);
        v20 = 0;
        *a3 = v19;
LABEL_46:

LABEL_47:
        goto LABEL_48;
      }
LABEL_14:
      _HKLogDroppedError();
      v20 = 0;
      goto LABEL_46;
    }

    v22 = *(void **)(a1 + 32);
    v55 = 0;
    objc_msgSend(v22, "startDateInTransaction:error:", v5, &v55);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v55;
    v19 = v24;
    if (!v23 && v24)
    {
      if (a3)
        goto LABEL_7;
      goto LABEL_14;
    }
    v53 = v17;

    v28 = *(void **)(a1 + 32);
    v54 = 0;
    objc_msgSend(v28, "endDateInTransaction:error:", v5, &v54);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v54;
    v19 = v30;
    v31 = (void *)v29;
    if (v29)
      v32 = 1;
    else
      v32 = v30 == 0;
    v20 = v32;
    if (!v32)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v30);
      else
        _HKLogDroppedError();
      v17 = v53;
      goto LABEL_45;
    }
    if (!v23)
    {
      objc_msgSend(v53, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v33 = v31;
    v17 = v53;
    if (!v33)
    {
      objc_msgSend(v53, "endDate");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      if (!v33 || objc_msgSend(*(id *)(a1 + 48), "hk_isBeforeDate:", v33))
      {
        v34 = *(id *)(a1 + 48);
        v35 = v33;
        v33 = v34;

      }
    }
    v52 = v33;
    if (v23 && v33)
    {
      if (!objc_msgSend(v23, "hk_isAfterOrEqualToDate:", v33))
      {
        objc_msgSend(MEMORY[0x1E0CB6B00], "workoutType");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v43;
        if (objc_msgSend(v43, "isMaximumDurationRestricted"))
        {
          objc_msgSend(v43, "maximumAllowedDuration");
          objc_msgSend(v23, "dateByAddingTimeInterval:");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          HKDateMin();
          v49 = objc_claimAutoreleasedReturnValue();

          v44 = (void *)v49;
        }
        else
        {
          v44 = v52;
        }
        v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v23, v44);
        v46 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v47 = *(void **)(v46 + 40);
        *(_QWORD *)(v46 + 40) = v45;

        goto LABEL_45;
      }
      _HKInitializeLogging();
      v36 = *MEMORY[0x1E0CB5380];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v59 = v23;
      v60 = 2114;
      v61 = v52;
      v62 = 2114;
      v63 = v37;
      v38 = "Invalid start/end date (%{public}@, %{public}@) for detached builder %{public}@: discarding workout.";
      v39 = v36;
      v40 = 32;
    }
    else
    {
      _HKInitializeLogging();
      v41 = *MEMORY[0x1E0CB5380];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
LABEL_42:

LABEL_45:
        goto LABEL_46;
      }
      v48 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543362;
      v59 = v48;
      v38 = "Unable to determine a date interval for detached builder %{public}@: discarding workout.";
      v39 = v41;
      v40 = 12;
    }
    _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
    goto LABEL_42;
  }
  v21 = v8;
  v15 = v21;
  if (v21)
  {
    if (a3)
    {
      v15 = objc_retainAutorelease(v21);
      v20 = 0;
      *a3 = v15;
    }
    else
    {
      _HKLogDroppedError();
      v20 = 0;
    }
  }
  else
  {
    v20 = 1;
  }
LABEL_48:

  return v20;
}

+ (BOOL)finishAllWorkoutBuildersForClient:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "sourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceForClient:error:", v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDWorkoutBuilderEntity workoutBuilderEntitiesForSource:profile:error:](HDWorkoutBuilderEntity, "workoutBuilderEntitiesForSource:profile:error:", v11, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(a1, "finishDetachedBuilderForEntity:sessionEndDate:profile:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++), 0, v9);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }
  }

  return v13 != 0;
}

+ (BOOL)finishAllDetachedWorkoutBuildersExcludingSessions:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  +[HDWorkoutBuilderEntity workoutBuilderEntitiesExcludingSessions:profile:error:](HDWorkoutBuilderEntity, "workoutBuilderEntitiesExcludingSessions:profile:error:", a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(a1, "finishDetachedBuilderForEntity:sessionEndDate:profile:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), 0, v8);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }
  }

  return v10 != 0;
}

- (BOOL)invalidated
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (HDWorkoutBuilderServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  HDWorkoutBuilderServer *v12;
  HDWorkoutBuilderStatisticsCalculators *v13;
  HDWorkoutBuilderStatisticsCalculators *statisticsCalculators;
  NSMutableDictionary *v15;
  NSMutableDictionary *sourceOrderProvidersByType;
  NSMutableDictionary *v17;
  NSMutableDictionary *statisticsDataSourcesByType;
  NSMutableSet *v19;
  NSMutableSet *quantityTypesRequiringCalculatorInvalidation;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  HKObserverSet *sampleObservers;
  uint64_t v25;
  HKObserverSet *dataAccumulatorObservers;
  NSSet *v27;
  NSSet *expectedDataSourceUUIDs;
  NSSet *v29;
  NSSet *quantityTypesIncludedWhilePaused;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  HKStateMachine *stateMachine;
  uint64_t v62;
  OS_dispatch_queue *upstreamQueue;
  id v64;
  uint64_t v65;
  HKDataFlowLink *workoutDataFlowLink;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  objc_super v74;

  v10 = a3;
  v11 = a4;
  v74.receiver = self;
  v74.super_class = (Class)HDWorkoutBuilderServer;
  v12 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v74, sel_initWithUUID_configuration_client_delegate_, v10, v11, a5, a6);
  if (v12)
  {
    _HKInitializeLogging();
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_configuration, a4);
    v13 = objc_alloc_init(HDWorkoutBuilderStatisticsCalculators);
    statisticsCalculators = v12->_statisticsCalculators;
    v12->_statisticsCalculators = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sourceOrderProvidersByType = v12->_sourceOrderProvidersByType;
    v12->_sourceOrderProvidersByType = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    statisticsDataSourcesByType = v12->_statisticsDataSourcesByType;
    v12->_statisticsDataSourcesByType = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    quantityTypesRequiringCalculatorInvalidation = v12->_quantityTypesRequiringCalculatorInvalidation;
    v12->_quantityTypesRequiringCalculatorInvalidation = v19;

    v21 = objc_alloc(MEMORY[0x1E0CB6988]);
    v22 = (_QWORD *)MEMORY[0x1E0CB5380];
    v23 = objc_msgSend(v21, "initWithName:loggingCategory:", CFSTR("sample-observers"), *MEMORY[0x1E0CB5380]);
    sampleObservers = v12->_sampleObservers;
    v12->_sampleObservers = (HKObserverSet *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6988]), "initWithName:loggingCategory:", CFSTR("data-accumulator-observers"), *v22);
    dataAccumulatorObservers = v12->_dataAccumulatorObservers;
    v12->_dataAccumulatorObservers = (HKObserverSet *)v25;

    v27 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    expectedDataSourceUUIDs = v12->_expectedDataSourceUUIDs;
    v12->_expectedDataSourceUUIDs = v27;

    v29 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    quantityTypesIncludedWhilePaused = v12->_quantityTypesIncludedWhilePaused;
    v12->_quantityTypesIncludedWhilePaused = v29;

    v31 = v11;
    v32 = v10;
    v33 = objc_opt_self();
    v72 = v10;
    v34 = (void *)MEMORY[0x1E0CB6C40];
    objc_msgSend(v31, "associatedSessionUUID");
    v71 = v11;
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
      v36 = v35;
    else
      v36 = v32;
    objc_msgSend(v34, "nameForOwner:UUID:tag:", v33, v36, 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6C40]), "initWithName:", v70);
    objc_msgSend(v37, "addStateWithIndex:label:", 0, CFSTR("Ready"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addStateWithIndex:label:", 1, CFSTR("Active"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addStateWithIndex:label:", 2, CFSTR("AwaitingDataSources"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addStateWithIndex:label:", 3, CFSTR("AwaitingFinalData"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addStateWithIndex:label:", 4, CFSTR("Ended"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addStateWithIndex:label:", 5, CFSTR("Saving"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addStateWithIndex:label:", 6, CFSTR("Finalized"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addStateWithIndex:label:", 7, CFSTR("Error"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addStateWithIndex:label:", 8, CFSTR("Discarded"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v38, v39, 1, CFSTR("activate"));
    v45 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v38, v39, 2, CFSTR("end"));
    v46 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v38, v39, 3, CFSTR("finish"));
    v47 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v39, v40, 2, CFSTR("end"));
    v48 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v39, v40, 3, CFSTR("finish"));
    v49 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v40, v73, 101, CFSTR("attach-data-sources"));
    v50 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v73, v41, 102, CFSTR("receive-final-data"));
    v51 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v41, v68, 3, CFSTR("finish"));
    v52 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v68, v42, 103, CFSTR("saved-workout"));
    v53 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v38, v43, 100, CFSTR("error"));
    v54 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v39, v43, 100, CFSTR("error"));
    v55 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v41, v43, 100, CFSTR("error"));
    v56 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v68, v43, 100, CFSTR("error"));
    v57 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v42, v43, 100, CFSTR("error"));
    v58 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v38, v69, 4, CFSTR("discarded"));
    v59 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v39, v69, 4, CFSTR("discarded"));
    v60 = (id)objc_msgSend(v37, "addStateTransitionFrom:to:event:label:", v41, v69, 4, CFSTR("discarded"));

    v11 = v71;
    stateMachine = v12->_stateMachine;
    v12->_stateMachine = (HKStateMachine *)v37;
    v10 = v72;

    -[HKStateMachine setDelegate:](v12->_stateMachine, "setDelegate:", v12);
    HKCreateSerialDispatchQueue();
    v62 = objc_claimAutoreleasedReturnValue();
    upstreamQueue = v12->_upstreamQueue;
    v12->_upstreamQueue = (OS_dispatch_queue *)v62;

    _HKInitializeLogging();
    v64 = objc_alloc(MEMORY[0x1E0CB6588]);
    v65 = objc_msgSend(v64, "initWithProcessor:sourceProtocol:destinationProtocol:loggingCategory:", v12, &unk_1EF1A1298, &unk_1EF1B99A8, *MEMORY[0x1E0CB5380]);
    workoutDataFlowLink = v12->_workoutDataFlowLink;
    v12->_workoutDataFlowLink = (HKDataFlowLink *)v65;

  }
  return v12;
}

- (void)connectionConfigured
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[HKWorkoutBuilderConfiguration associatedSessionUUID](self->_configuration, "associatedSessionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HKWorkoutBuilderConfiguration associatedSessionUUID](self->_configuration, "associatedSessionUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutBuilderServer _addExpectedDataSourceIdentifiers:]((uint64_t)self, v6);

    -[HDStandardTaskServer profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "taskServerRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKWorkoutBuilderConfiguration associatedSessionUUID](self->_configuration, "associatedSessionUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:forTaskServerUUID:queue:", self, v10, 0);

  }
  -[HDStandardTaskServer profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = self;
  v18 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__HDWorkoutBuilderServer__loadOrCreatePersistentEntity__block_invoke;
  v17[3] = &unk_1E6CEBC00;
  v13 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v12, &v18, v17);
  v14 = v18;

  if (v13)
  {
    -[HDWorkoutBuilderServer _updateStatisticsPauseResumeMask]((uint64_t)self);
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    -[HDWorkoutBuilderServer _lock_failWithError:]((uint64_t)self, v14);
    os_unfair_lock_unlock(&self->_lock);
  }

  -[HKStateMachine currentState](self->_stateMachine, "currentState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDWorkoutBuilderServer.m"), 471, CFSTR("Failed to initialize current state after loading or creating our persistent entity."));

  }
}

- (void)_addExpectedDataSourceIdentifiers:(uint64_t)a1
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (a1)
  {
    v3 = *(void **)(a1 + 120);
    v4 = a2;
    objc_msgSend(v3, "allSourceProcessors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_map:", &__block_literal_global_514);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "arrayByExcludingObjectsInArray:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 128), "setByAddingObjectsFromArray:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v7;

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    }

  }
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB7440];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  void *v6;

  objc_msgSend(a3, "workoutConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 3, CFSTR("nil workoutConfiguration"));
  return v6 != 0;
}

- (NSString)description
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  -[HKWorkoutBuilderConfiguration associatedSessionUUID](self->_configuration, "associatedSessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_shortRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    -[HDStandardTaskServer taskUUID](self, "taskUUID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "hk_shortRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HKStateMachine currentState](self->_stateMachine, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@_%@ %@>"), v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {

  }
  return (NSString *)v10;
}

- (void)_persistRecoveryData
{
  double Current;
  void *v3;
  void *v4;
  _BOOL4 v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  CFAbsoluteTime v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  os_unfair_lock *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_assert_not_owner(a1 + 10);
    Current = CFAbsoluteTimeGetCurrent();
    -[os_unfair_lock profile](a1, "profile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "database");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = a1;
    v12 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__HDWorkoutBuilderServer__persistRecoveryData__block_invoke;
    v11[3] = &unk_1E6CEBC00;
    v5 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v4, &v12, v11);
    v6 = v12;

    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5380];
    v8 = *MEMORY[0x1E0CB5380];
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v7;
        v10 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)buf = 138543618;
        v14 = a1;
        v15 = 2048;
        v16 = v10 - Current;
        _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Persisted recovery state in %.2lfs", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = a1;
      v15 = 2114;
      v16 = *(double *)&v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist recovery data: %{public}@", buf, 0x16u);
    }

  }
}

BOOL __46__HDWorkoutBuilderServer__persistRecoveryData__block_invoke(uint64_t a1)
{
  const os_unfair_lock *v2;
  os_unfair_lock_s *v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(const os_unfair_lock **)(a1 + 32);
  if (v2)
  {
    os_unfair_lock_assert_owner(v2 + 10);
    v3 = *(os_unfair_lock_s **)(a1 + 32);
  }
  else
  {
    v3 = 0;
  }
  os_unfair_lock_unlock(v3 + 10);
  return v2 != 0;
}

- (uint64_t)_validateAuthorizationToSaveWorkoutWithError:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB6B00], "workoutType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationOracle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readAuthorizationStatusForType:error:", v4, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_7;
  if (objc_msgSend(v7, "authorizationStatus") != 101 && objc_msgSend(v7, "authorizationStatus") != 102)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a2, 4, CFSTR("Not authorized"));
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v8 = 1;
LABEL_8:

  return v8;
}

uint64_t __55__HDWorkoutBuilderServer__loadOrCreatePersistentEntity__block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  os_unfair_lock_s *v5;
  id v6;
  uint64_t v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  BOOL v16;
  HDWorkoutBuilderPersistedConfiguration *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  HDWorkoutBuilderPersistedConfiguration *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  BOOL v65;
  void *v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  BOOL v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  char v116;
  id v117;
  void *v118;
  id v119;
  id v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  void *v125;
  id v126;
  id v127;
  void *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD v141[5];
  id v142;
  id v143;
  uint8_t v144[128];
  __int128 buf;
  void (*v146)(uint64_t, void *);
  void *v147;
  uint64_t v148;
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 40);
  v6 = a2;
  os_unfair_lock_lock(v5);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v6;
  if (!v7)
  {
    v36 = 0;
    goto LABEL_111;
  }
  v132 = 0;
  v9 = -[HDWorkoutBuilderServer _validateAuthorizationToSaveWorkoutWithError:]((void *)v7, (uint64_t)&v132);
  v10 = v132;
  if (v9)
  {
    v130 = v10;
    objc_msgSend((id)v7, "taskUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v7, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = 0;
    +[HDWorkoutBuilderEntity workoutBuilderEntityWithIdentifier:profile:error:](HDWorkoutBuilderEntity, "workoutBuilderEntityWithIdentifier:profile:error:", v11, v12, &v131);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v131;
    v15 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = v13;

    if (*(_QWORD *)(v7 + 48))
      v16 = 1;
    else
      v16 = v14 == 0;
    if (!v16)
    {
      if (a3)
      {
        v36 = 0;
        *a3 = objc_retainAutorelease(v14);
      }
      else
      {
        _HKLogDroppedError();
        v36 = 0;
      }
      goto LABEL_109;
    }
    v129 = v14;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v7 + 40));
    v17 = objc_alloc_init(HDWorkoutBuilderPersistedConfiguration);
    objc_msgSend((id)v7, "taskUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutBuilderPersistedConfiguration setBuilderIdentifier:](v17, "setBuilderIdentifier:", v18);

    objc_msgSend(*(id *)(v7 + 168), "workoutConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutBuilderPersistedConfiguration setWorkoutConfiguration:](v17, "setWorkoutConfiguration:", v19);

    objc_msgSend((id)v7, "profile");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sourceManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v7, "client");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "createOrUpdateSourceForClient:error:", v22, a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutBuilderPersistedConfiguration setSourceEntity:](v17, "setSourceEntity:", v23);

    -[HDWorkoutBuilderPersistedConfiguration sourceEntity](v17, "sourceEntity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
      goto LABEL_16;
    objc_msgSend((id)v7, "client");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sourceVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutBuilderPersistedConfiguration setSourceVersion:](v17, "setSourceVersion:", v26);

    objc_msgSend(*(id *)(v7 + 168), "device");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
      goto LABEL_11;
    objc_msgSend((id)v7, "profile");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "deviceManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v7 + 168), "device");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "deviceEntityForDevice:error:", v30, a3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutBuilderPersistedConfiguration setDeviceEntity:](v17, "setDeviceEntity:", v31);

    -[HDWorkoutBuilderPersistedConfiguration deviceEntity](v17, "deviceEntity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
LABEL_11:
      objc_msgSend((id)v7, "client");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "hasEntitlement:", *MEMORY[0x1E0CB59B0]);

      if (v34)
      {
        -[HDWorkoutBuilderPersistedConfiguration setGoalType:](v17, "setGoalType:", objc_msgSend(*(id *)(v7 + 168), "goalType"));
        objc_msgSend(*(id *)(v7 + 168), "goal");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDWorkoutBuilderPersistedConfiguration setGoal:](v17, "setGoal:", v35);

      }
      else
      {
        -[HDWorkoutBuilderPersistedConfiguration setGoalType:](v17, "setGoalType:", 0);
        -[HDWorkoutBuilderPersistedConfiguration setGoal:](v17, "setGoal:", 0);
      }
      v14 = v129;
      v37 = v17;

      if (!v37)
        goto LABEL_48;
      v38 = *(void **)(v7 + 48);
      if (v38)
      {
        objc_msgSend(v38, "configurationWithTransaction:error:", v8, a3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (v39)
        {
          if ((objc_msgSend(v39, "isEqual:", v37) & 1) != 0)
          {
            v128 = v40;
            v41 = v8;
            os_unfair_lock_assert_owner((const os_unfair_lock *)(v7 + 40));
            v42 = objc_alloc_init(MEMORY[0x1E0CB6E00]);
            objc_msgSend(*(id *)(v7 + 48), "metadataWithTransaction:error:", v41, a3);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
            {
              v127 = v43;
              v44 = objc_msgSend(v43, "mutableCopy");
              v45 = *(void **)(v7 + 176);
              *(_QWORD *)(v7 + 176) = v44;

              v46 = *(void **)(v7 + 48);
              v141[0] = MEMORY[0x1E0C809B0];
              v141[1] = 3221225472;
              v141[2] = __74__HDWorkoutBuilderServer__lock_recoverPersistedDataWithTransaction_error___block_invoke;
              v141[3] = &unk_1E6D0B670;
              v141[4] = v7;
              v126 = v42;
              v47 = v42;
              v142 = v47;
              if (!objc_msgSend(v46, "enumerateStatisticsInTransaction:error:block:", v41, a3, v141))
                goto LABEL_57;
              objc_msgSend(*(id *)(v7 + 48), "workoutEventsInTransaction:error:", v41, a3);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "sortedArrayUsingSelector:", sel_compare_);
              v49 = objc_claimAutoreleasedReturnValue();
              v50 = *(void **)(v7 + 184);
              *(_QWORD *)(v7 + 184) = v49;

              if (*(_QWORD *)(v7 + 184))
              {
                objc_msgSend(*(id *)(v7 + 48), "workoutActivitiesInTransaction:error:", v41, a3);
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                if (v125)
                {
                  v121 = v47;
                  v51 = objc_msgSend(*(id *)(v7 + 184), "count");
                  v52 = v125;
                  if (v51)
                  {
                    v122 = v41;
                    v139 = 0u;
                    v140 = 0u;
                    v137 = 0u;
                    v138 = 0u;
                    v53 = v125;
                    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v137, v144, 16);
                    if (v54)
                    {
                      v55 = v54;
                      v56 = *(_QWORD *)v138;
                      do
                      {
                        for (i = 0; i != v55; ++i)
                        {
                          if (*(_QWORD *)v138 != v56)
                            objc_enumerationMutation(v53);
                          objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * i), "_filterAndSetWorkoutEvents:", *(_QWORD *)(v7 + 184));
                        }
                        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v137, v144, 16);
                      }
                      while (v55);
                    }

                    v41 = v122;
                    v52 = v125;
                  }
                  objc_msgSend(v52, "hk_mapToDictionary:", &__block_literal_global_210);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = objc_msgSend(v58, "mutableCopy");
                  v60 = *(void **)(v7 + 192);
                  *(_QWORD *)(v7 + 192) = v59;

                  v61 = *(void **)(v7 + 48);
                  v136 = 0;
                  objc_msgSend(v61, "startDateInTransaction:error:", v41, &v136);
                  v62 = objc_claimAutoreleasedReturnValue();
                  v63 = v136;
                  v64 = *(void **)(v7 + 200);
                  *(_QWORD *)(v7 + 200) = v62;

                  v124 = v63;
                  if (*(_QWORD *)(v7 + 200))
                    v65 = 1;
                  else
                    v65 = v63 == 0;
                  if (v65)
                  {
                    v66 = *(void **)(v7 + 48);
                    v135 = 0;
                    objc_msgSend(v66, "endDateInTransaction:error:", v41, &v135);
                    v67 = objc_claimAutoreleasedReturnValue();
                    v68 = v135;
                    v69 = *(void **)(v7 + 208);
                    *(_QWORD *)(v7 + 208) = v67;

                    if (*(_QWORD *)(v7 + 208) || !v68)
                    {
                      v120 = v68;
                      v80 = *(void **)(v7 + 48);
                      v134 = 0;
                      objc_msgSend(v80, "dataIntervalInTransaction:error:", v41, &v134);
                      v81 = objc_claimAutoreleasedReturnValue();
                      v82 = v134;
                      v83 = *(void **)(v7 + 216);
                      *(_QWORD *)(v7 + 216) = v81;

                      if (*(_QWORD *)(v7 + 216) || !v82)
                      {
                        v119 = v82;
                        v84 = *(void **)(v7 + 48);
                        v133 = 0;
                        objc_msgSend(v84, "quantityTypesIncludedWhilePausedInTransaction:error:", v41, &v133);
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        v86 = v133;
                        v87 = v86;
                        if (v85)
                          v88 = 1;
                        else
                          v88 = v86 == 0;
                        v36 = v88;
                        if (v88)
                        {
                          v117 = v86;
                          v118 = v85;
                          v123 = v41;
                          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v85);
                          v89 = objc_claimAutoreleasedReturnValue();
                          v90 = *(void **)(v7 + 80);
                          *(_QWORD *)(v7 + 80) = v89;

                          v91 = *(_QWORD *)(v7 + 200);
                          v92 = *(_QWORD *)(v7 + 208);
                          if (*(_OWORD *)(v7 + 200) == 0)
                          {
                            objc_msgSend(*(id *)(v7 + 136), "enterAtState:", 0);
                            v116 = 0;
                            v93 = 0;
                          }
                          else if (!v91 || v92)
                          {
                            v95 = *(void **)(v7 + 136);
                            if (v91 && v92)
                            {
                              objc_msgSend(v95, "enterAtState:", 4);
                              v116 = 0;
                              v93 = 2;
                            }
                            else
                            {
                              objc_msgSend(v95, "enterAtState:", 7);
                              v116 = 1;
                              v93 = 4;
                            }
                          }
                          else
                          {
                            v93 = 1;
                            objc_msgSend(*(id *)(v7 + 136), "enterAtState:", 1);
                            v116 = 0;
                          }
                          *(_QWORD *)(v7 + 144) = v93;
                          os_unfair_lock_assert_owner((const os_unfair_lock *)(v7 + 40));
                          objc_msgSend((id)v7, "client");
                          v96 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v96, "connection");
                          v97 = (void *)objc_claimAutoreleasedReturnValue();
                          v98 = MEMORY[0x1E0C809B0];
                          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                          *((_QWORD *)&buf + 1) = 3221225472;
                          v146 = __51__HDWorkoutBuilderServer__lock_didUpdateActivities__block_invoke;
                          v147 = &unk_1E6CE8030;
                          v148 = v7;
                          objc_msgSend(v97, "remoteObjectProxyWithErrorHandler:", &buf);
                          v99 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(*(id *)(v7 + 192), "allValues");
                          v100 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v99, "clientRemote_didUpdateActivities:", v100);

                          -[HDWorkoutBuilderServer _didUpdateStatistics:]((_QWORD *)v7, v121);
                          v101 = (void *)objc_msgSend(*(id *)(v7 + 176), "copy");
                          -[HDWorkoutBuilderServer _didUpdateMetadata:]((_QWORD *)v7, v101);

                          v102 = (void *)objc_msgSend(*(id *)(v7 + 184), "copy");
                          -[HDWorkoutBuilderServer _didUpdateEvents:]((_QWORD *)v7, v102);

                          -[HDWorkoutBuilderServer _didChangeElapsedTimeBasis]((_QWORD *)v7);
                          v103 = *(void **)(v7 + 64);
                          *(_QWORD *)&buf = v98;
                          *((_QWORD *)&buf + 1) = 3221225472;
                          v146 = __50__HDWorkoutBuilderServer__lock_didUpdateStartDate__block_invoke;
                          v147 = &unk_1E6D0BA08;
                          v148 = v7;
                          objc_msgSend(v103, "notifyObservers:", &buf);
                          if ((v116 & 1) == 0)
                          {
                            v104 = *(_QWORD *)(v7 + 48);
                            objc_msgSend((id)v7, "profile");
                            v105 = (void *)objc_claimAutoreleasedReturnValue();
                            v143 = 0;
                            +[HDWorkoutBuilderAssociatedSeriesEntity seriesForBuilder:profile:error:](HDWorkoutBuilderAssociatedSeriesEntity, "seriesForBuilder:profile:error:", v104, v105, &v143);
                            v106 = (void *)objc_claimAutoreleasedReturnValue();
                            v107 = v143;

                            if (v106)
                            {
                              if (objc_msgSend(v106, "count"))
                              {
                                objc_msgSend((id)v7, "client");
                                v108 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v108, "connection");
                                v109 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                                *((_QWORD *)&buf + 1) = 3221225472;
                                v146 = __58__HDWorkoutBuilderServer__recoverAssociatedSeriesBuilders__block_invoke;
                                v147 = &unk_1E6CE8030;
                                v148 = v7;
                                objc_msgSend(v109, "remoteObjectProxyWithErrorHandler:", &buf);
                                v110 = (void *)objc_claimAutoreleasedReturnValue();

                                objc_msgSend(v110, "clientRemote_didRecoverSeriesBuilders:", v106);
                              }
                            }
                            else
                            {
                              _HKInitializeLogging();
                              v111 = *MEMORY[0x1E0CB5380];
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
                              {
                                LODWORD(buf) = 138543362;
                                *(_QWORD *)((char *)&buf + 4) = v107;
                                _os_log_error_impl(&dword_1B7802000, v111, OS_LOG_TYPE_ERROR, "Failed to recover series builders after workout builder recovery: %{public}@", (uint8_t *)&buf, 0xCu);
                              }
                            }

                          }
                          objc_msgSend((id)v7, "client");
                          v112 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v112, "connection");
                          v113 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                          *((_QWORD *)&buf + 1) = 3221225472;
                          v146 = __44__HDWorkoutBuilderServer__didFinishRecovery__block_invoke;
                          v147 = &unk_1E6CE8030;
                          v148 = v7;
                          objc_msgSend(v113, "remoteObjectProxyWithErrorHandler:", &buf);
                          v114 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(v114, "clientRemote_didFinishRecovery");
                          v70 = v123;
                          v87 = v117;
                          v85 = v118;
                        }
                        else
                        {
                          v70 = v41;
                          if (a3)
                            *a3 = objc_retainAutorelease(v86);
                          else
                            _HKLogDroppedError();
                        }

                        v14 = v129;
                        v78 = v126;
                        v79 = v124;
                        v82 = v119;
                      }
                      else
                      {
                        v70 = v41;
                        v14 = v129;
                        v79 = v124;
                        if (a3)
                        {
                          v36 = 0;
                          *a3 = objc_retainAutorelease(v82);
                        }
                        else
                        {
                          _HKLogDroppedError();
                          v36 = 0;
                        }
                        v78 = v126;
                      }

                      v40 = v128;
                      v94 = v120;
                    }
                    else
                    {
                      v70 = v41;
                      v14 = v129;
                      if (a3)
                      {
                        v36 = 0;
                        *a3 = objc_retainAutorelease(v68);
                      }
                      else
                      {
                        _HKLogDroppedError();
                        v36 = 0;
                      }
                      v79 = v124;
                      v78 = v126;
                      v94 = v68;
                      v40 = v128;
                    }

                  }
                  else
                  {
                    v70 = v41;
                    v79 = v63;
                    if (a3)
                    {
                      v36 = 0;
                      *a3 = objc_retainAutorelease(v63);
                    }
                    else
                    {
                      _HKLogDroppedError();
                      v36 = 0;
                    }
                    v40 = v128;
                    v14 = v129;
                    v78 = v126;
                  }

                }
                else
                {
                  v70 = v41;
                  v36 = 0;
                  v14 = v129;
                  v78 = v126;
                }

              }
              else
              {
LABEL_57:
                v70 = v41;
                v36 = 0;
                v14 = v129;
                v78 = v126;
              }

              v43 = v127;
            }
            else
            {
              v70 = v41;
              v36 = 0;
              v78 = v42;
            }

            goto LABEL_107;
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Workout builder configuration does not match persisted configuration for this identifier."));
        }
        v36 = 0;
LABEL_107:

        goto LABEL_108;
      }
      if (objc_msgSend(*(id *)(v7 + 168), "requiresRecovery"))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Workout builder requires recovery but no persisted state was found."));
LABEL_48:
        v36 = 0;
        goto LABEL_108;
      }
      v37 = v37;
      v71 = v8;
      objc_msgSend((id)v7, "profile");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDWorkoutBuilderEntity createEntityForBuilderConfiguration:profile:error:](HDWorkoutBuilderEntity, "createEntityForBuilderConfiguration:profile:error:", v37, v72, a3);
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = *(void **)(v7 + 48);
      *(_QWORD *)(v7 + 48) = v73;

      if (!*(_QWORD *)(v7 + 48))
        goto LABEL_55;
      objc_msgSend(*(id *)(v7 + 168), "associatedSessionUUID");
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v75
        || (v76 = *(void **)(v7 + 48),
            objc_msgSend(*(id *)(v7 + 168), "associatedSessionUUID"),
            v77 = (void *)objc_claimAutoreleasedReturnValue(),
            LODWORD(v76) = objc_msgSend(v76, "setSessionIdentifier:transaction:error:", v77, v71, a3),
            v77,
            (_DWORD)v76))
      {
        objc_msgSend(*(id *)(v7 + 136), "enterAtState:", 0);
        v36 = 1;
      }
      else
      {
LABEL_55:
        v36 = 0;
      }

    }
    else
    {
LABEL_16:

      v37 = 0;
      v36 = 0;
    }
    v14 = v129;
LABEL_108:

LABEL_109:
    v10 = v130;
    goto LABEL_110;
  }
  v36 = 0;
LABEL_110:

LABEL_111:
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  return v36;
}

- (void)_updateStatisticsPauseResumeMask
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD aBlock[5];
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
    v2 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke;
    aBlock[3] = &unk_1E6CE80E8;
    aBlock[4] = a1;
    v3 = _Block_copy(aBlock);
    objc_msgSend((id)a1, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDatabaseTransactionContext contextForReadingProtectedData](HDDatabaseTransactionContext, "contextForReadingProtectedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v22[0] = v2;
    v22[1] = 3221225472;
    v22[2] = __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke_477;
    v22[3] = &unk_1E6CEE458;
    v22[4] = a1;
    v23 = v3;
    v20[0] = v2;
    v20[1] = 3221225472;
    v20[2] = __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke_2_478;
    v20[3] = &unk_1E6D0B740;
    v20[4] = a1;
    v7 = v23;
    v21 = v7;
    v8 = objc_msgSend(v5, "performTransactionWithContext:error:block:inaccessibilityHandler:", v6, &v24, v22, v20);
    v9 = v24;

    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v28 = a1;
        v29 = 2114;
        v30 = v9;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to open read transaction during pause/resume mask update: %{public}@", buf, 0x16u);
      }
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(*(id *)(a1 + 88), "allQuantityTypes", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(a1 + 112), "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++));
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
        }
        while (v13);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    }

  }
}

- (void)_lock_failWithError:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    v5 = v3;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 136), "currentState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      objc_msgSend(*(id *)(a1 + 136), "enterAtState:", 0);
    objc_msgSend(*(id *)(a1 + 136), "enqueueEvent:date:error:completion:", 100, 0, v5, &__block_literal_global_495);
    v3 = v5;
  }

}

void __74__HDWorkoutBuilderServer__lock_recoverPersistedDataWithTransaction_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v14)
  {
    -[HDWorkoutBuilderServer _lock_sourceOrderProviderForQuantityType:](*(_QWORD *)(a1 + 32), v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSourceOrderProvider:", v16);

    -[HDWorkoutBuilderServer _lock_statisticsDataSourceForQuantityType:](*(_QWORD *)(a1 + 32), v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDataSource:", v17);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setCalculator:forQuantityType:activityUUID:", v14, v11, v12);
    objc_msgSend(*(id *)(a1 + 32), "taskUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v12, "isEqual:", v18);

    v20 = *(void **)(a1 + 40);
    objc_msgSend(v14, "currentStatistics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v20, "addWorkoutStatistics:forType:", v21, v11);
    else
      objc_msgSend(v20, "addActivityStatistics:forType:activityUUID:", v21, v11, v12);

  }
  else
  {
    _HKInitializeLogging();
    v22 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(a1 + 32);
      v24 = 138543618;
      v25 = v23;
      v26 = 2114;
      v27 = v11;
      _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Unexpectedly nil calculator when recovery statistics for %{public}@", (uint8_t *)&v24, 0x16u);
    }
  }

}

- (HDStatisticsCollectionCalculatorDefaultSourceOrderProvider)_lock_sourceOrderProviderForQuantityType:(uint64_t)a1
{
  id v3;
  HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *v4;
  HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 96), "objectForKeyedSubscript:", v3);
    v4 = (HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = [HDStatisticsCollectionCalculatorDefaultSourceOrderProvider alloc];
      objc_msgSend((id)a1, "profile");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[HDStatisticsCollectionCalculatorDefaultSourceOrderProvider initWithProfile:quantityType:](v5, "initWithProfile:quantityType:", v6, v3);

      objc_msgSend(*(id *)(a1 + 96), "setObject:forKeyedSubscript:", v4, v3);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (HDWorkoutBuilderStatisticsDataSource)_lock_statisticsDataSourceForQuantityType:(uint64_t)a1
{
  id v3;
  HDWorkoutBuilderStatisticsDataSource *v4;
  HDWorkoutBuilderStatisticsDataSource *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 104), "objectForKeyedSubscript:", v3);
    v4 = (HDWorkoutBuilderStatisticsDataSource *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = [HDWorkoutBuilderStatisticsDataSource alloc];
      objc_msgSend((id)a1, "profile");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[HDWorkoutBuilderStatisticsDataSource initWithProfile:quantityType:builderEntity:](v5, "initWithProfile:quantityType:builderEntity:", v6, v3, *(_QWORD *)(a1 + 48));

      objc_msgSend(*(id *)(a1 + 104), "setObject:forKeyedSubscript:", v4, v3);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __74__HDWorkoutBuilderServer__lock_recoverPersistedDataWithTransaction_error___block_invoke_362(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  id v7;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "UUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))a3)[2](v5, v7, v6);

}

- (void)_didUpdateStatistics:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  _QWORD *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1 && v3 && (objc_msgSend(v3, "isEmpty") & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      objc_msgSend(v4, "allTypes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = a1;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated statistics for [%{public}@]", buf, 0x16u);

    }
    objc_msgSend(a1, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __47__HDWorkoutBuilderServer__didUpdateStatistics___block_invoke;
    v17[3] = &unk_1E6CE8030;
    v17[4] = a1;
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "clientRemote_didUpdateStatistics:", v4);
    v14 = (void *)a1[8];
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __47__HDWorkoutBuilderServer__didUpdateStatistics___block_invoke_473;
    v15[3] = &unk_1E6D0B900;
    v15[4] = a1;
    v16 = v4;
    objc_msgSend(v14, "notifyObservers:", v15);

  }
}

- (void)_didUpdateMetadata:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  _QWORD *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__HDWorkoutBuilderServer__didUpdateMetadata___block_invoke;
  v17[3] = &unk_1E6CE8030;
  v17[4] = a1;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v9 = objc_msgSend(v3, "hd_validateMetadataKeysAndValuesWithClient:error:", v8, &v16);
  v10 = v16;

  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543874;
      v19 = a1;
      v20 = 2114;
      v21 = v3;
      v22 = 2114;
      v23 = v10;
      _os_log_fault_impl(&dword_1B7802000, v11, OS_LOG_TYPE_FAULT, "%{public}@: Did update with invalid metadata %{public}@: %{public}@", buf, 0x20u);
    }
  }
  objc_msgSend(v7, "clientRemote_didUpdateMetadata:", v3);
  v12 = (void *)a1[8];
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __45__HDWorkoutBuilderServer__didUpdateMetadata___block_invoke_435;
  v14[3] = &unk_1E6D0B900;
  v14[4] = a1;
  v13 = v3;
  v15 = v13;
  objc_msgSend(v12, "notifyObservers:", v14);

}

- (void)_didUpdateEvents:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(a1, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__HDWorkoutBuilderServer__didUpdateEvents___block_invoke;
    v11[3] = &unk_1E6CE8030;
    v11[4] = a1;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "clientRemote_didUpdateEvents:", v3);
    v8 = (void *)a1[8];
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __43__HDWorkoutBuilderServer__didUpdateEvents___block_invoke_443;
    v9[3] = &unk_1E6D0B900;
    v9[4] = a1;
    v10 = v3;
    objc_msgSend(v8, "notifyObservers:", v9);

  }
}

- (void)_didChangeElapsedTimeBasis
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (a1)
  {
    objc_msgSend(a1, "client");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__HDWorkoutBuilderServer__didChangeElapsedTimeBasis__block_invoke;
    v5[3] = &unk_1E6CE8030;
    v5[4] = a1;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "clientRemote_didChangeElapsedTimeBasisWithStartDate:endDate:", a1[25], a1[26]);
  }
}

void __58__HDWorkoutBuilderServer__recoverAssociatedSeriesBuilders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify workout builder client of recovered series builders with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)_addSamples:(void *)a3 quantities:(void *)a4 dataSource:(char)a5 shouldSavePriorToStart:
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  _QWORD block[5];
  _QWORD v27[8];
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD aBlock[5];
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t *v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _QWORD v54[5];
  id v55;
  _QWORD v56[5];
  id v57;
  _QWORD v58[5];
  id v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v25 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v24 = v10;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x3032000000;
    v58[3] = __Block_byref_object_copy__171;
    v58[4] = __Block_byref_object_dispose__171;
    v59 = 0;
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = __Block_byref_object_copy__171;
    v56[4] = __Block_byref_object_dispose__171;
    v57 = 0;
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x3032000000;
    v54[3] = __Block_byref_object_copy__171;
    v54[4] = __Block_byref_object_dispose__171;
    v55 = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__171;
    v52 = __Block_byref_object_dispose__171;
    v53 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__171;
    v46 = __Block_byref_object_dispose__171;
    v47 = *(id *)(a1 + 216);
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke;
    aBlock[3] = &unk_1E6D0B718;
    v41 = a5;
    aBlock[4] = a1;
    v36 = v58;
    v34 = v25;
    v37 = v54;
    v35 = v9;
    v38 = v56;
    v39 = &v42;
    v40 = &v48;
    v31[0] = v11;
    v31[1] = 3221225472;
    v31[2] = __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_4;
    v31[3] = &unk_1E6CEE458;
    v31[4] = a1;
    v12 = _Block_copy(aBlock);
    v32 = v12;
    v13 = _Block_copy(v31);
    objc_msgSend((id)a1, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v28[0] = v11;
    v28[1] = 3221225472;
    v28[2] = __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_5;
    v28[3] = &unk_1E6D0B740;
    v28[4] = a1;
    v16 = v13;
    v29 = v16;
    v17 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDDataEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v15, &v30, v16, v28);
    v18 = v30;

    if (!v17)
    {
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v61 = a1;
        v62 = 2114;
        v63 = v18;
        _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to add samples: %{public}@", buf, 0x16u);
      }
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v20 = objc_msgSend((id)v43[5], "copy");
    v21 = *(void **)(a1 + 216);
    *(_QWORD *)(a1 + 216) = v20;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    -[HDWorkoutBuilderServer _didUpdateStatistics:]((_QWORD *)a1, (void *)v49[5]);
    v22 = *(void **)(a1 + 72);
    v27[0] = v11;
    v27[1] = 3221225472;
    v27[2] = __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_373;
    v27[3] = &unk_1E6D0B768;
    v27[4] = a1;
    v27[5] = v58;
    v27[6] = v56;
    v27[7] = v54;
    objc_msgSend(v22, "notifyObservers:", v27);
    v23 = *(NSObject **)(a1 + 152);
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_2_375;
    block[3] = &unk_1E6CE80E8;
    block[4] = a1;
    dispatch_async(v23, block);

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(v54, 8);
    _Block_object_dispose(v56, 8);

    _Block_object_dispose(v58, 8);
    v10 = v24;
  }

}

BOOL __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  _QWORD *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t k;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  _BOOL8 v78;
  const os_unfair_lock *v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t m;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  id v99;
  uint64_t v100;
  void *v101;
  uint64_t n;
  void *v103;
  void *v104;
  void *v105;
  char isKindOfClass;
  void *v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  char v112;
  id v113;
  void *v114;
  char v115;
  NSObject *v116;
  void *v117;
  uint64_t v118;
  int v119;
  void *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  id v130;
  id v131;
  uint64_t v132;
  void *v133;
  id v134;
  uint64_t v135;
  id obj;
  uint64_t v137;
  uint64_t v138;
  id v139;
  const os_unfair_lock *v140;
  id v141;
  void *v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  id v149;
  id v150;
  uint64_t v151;
  void *v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _QWORD v157[4];
  id v158;
  id v159;
  id v160;
  _QWORD v161[4];
  id v162;
  id v163;
  id v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  _BYTE v177[128];
  _QWORD v178[2];
  uint8_t v179[4];
  uint64_t v180;
  __int16 v181;
  id v182;
  uint8_t buf[4];
  uint64_t v184;
  __int16 v185;
  void *v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  _BYTE v191[128];
  uint64_t v192;

  v192 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 40));
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v5 + 200) && !*(_BYTE *)(a1 + 96))
  {
    v78 = 1;
    goto LABEL_103;
  }
  v137 = a1;
  v6 = *(id *)(a1 + 40);
  v134 = v4;
  v7 = v4;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v5 + 40));
  v150 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v144 = *MEMORY[0x1E0CB5DD8];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = 0u;
  v188 = 0u;
  v189 = 0u;
  v190 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v187, v191, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v188;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v188 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * i);
        objc_msgSend(v14, "sampleType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v8);

        if (v16)
        {
          _HKInitializeLogging();
          v17 = (void *)*MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          {
            v18 = v17;
            objc_msgSend(v14, "sampleType");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v184 = v5;
            v185 = 2114;
            v186 = v19;
            _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to add samples of type %{public}@. Must be associated to workout", buf, 0x16u);

          }
        }
        else
        {
          v20 = *(void **)(v5 + 48);
          objc_msgSend(v14, "_startTimestamp");
          v21 = objc_msgSend(v20, "associateObject:timestamp:transaction:error:", v14, v7, a3);
          if (v21 == 1)
          {
            objc_msgSend(v150, "addObject:", v14);
          }
          else if (!v21)
          {

            v22 = 0;
            v23 = v150;
            goto LABEL_18;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v187, v191, 16);
    }
    while (v11);
  }

  v23 = v150;
  v22 = v150;
LABEL_18:

  v24 = *(_QWORD *)(*(_QWORD *)(v137 + 56) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v22;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v137 + 56) + 8) + 40))
    goto LABEL_51;
  v26 = *(_QWORD *)(v137 + 32);
  v27 = *(id *)(v137 + 48);
  v146 = v7;
  if (v26)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v26 + 40));
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v187 = 0u;
    v188 = 0u;
    v189 = 0u;
    v190 = 0u;
    v29 = v27;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v187, v191, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v188;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v188 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * j);
          v35 = *(void **)(v26 + 48);
          objc_msgSend(v34, "hdw_sample");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "hdw_startTimestamp");
          v37 = objc_msgSend(v35, "associateObject:timestamp:transaction:error:", v36, v146, a3);

          if (v37 == 1)
          {
            objc_msgSend(v28, "addObject:", v34);
          }
          else if (!v37)
          {

            v38 = 0;
            goto LABEL_32;
          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v187, v191, 16);
      }
      while (v31);
    }

    v38 = v28;
LABEL_32:

  }
  else
  {
    v38 = 0;
  }
  v39 = (_QWORD *)v137;

  v40 = *(_QWORD *)(*(_QWORD *)(v137 + 64) + 8);
  v41 = *(void **)(v40 + 40);
  *(_QWORD *)(v40 + 40) = v38;

  v42 = *(void **)(*(_QWORD *)(*(_QWORD *)(v137 + 64) + 8) + 40);
  if (!v42)
  {
LABEL_51:
    v78 = 0;
    v4 = v134;
    goto LABEL_103;
  }
  objc_msgSend(v42, "hk_mapToSet:", &__block_literal_global_367);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "allObjects");
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = *(_QWORD *)(*(_QWORD *)(v137 + 72) + 8);
  v46 = *(void **)(v45 + 40);
  *(_QWORD *)(v45 + 40) = v44;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C88]);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v178[0] = v47;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", v144);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v178[1] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v178, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = *(void **)(*(_QWORD *)(*(_QWORD *)(v137 + 64) + 8) + 40);
  v51 = *(void **)(*(_QWORD *)(*(_QWORD *)(v137 + 56) + 8) + 40);
  v157[0] = MEMORY[0x1E0C809B0];
  v157[1] = 3221225472;
  v157[2] = __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_3;
  v157[3] = &unk_1E6CEDCE0;
  v131 = v49;
  v158 = v131;
  objc_msgSend(v51, "hk_filter:", v157);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "arrayByAddingObjectsFromArray:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  v54 = v53;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v153, v177, 16);
  obj = v54;
  if (!v55)
  {

    goto LABEL_54;
  }
  v56 = v55;
  v57 = 0;
  v151 = *(_QWORD *)v154;
  do
  {
    for (k = 0; k != v56; ++k)
    {
      if (*(_QWORD *)v154 != v151)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v153 + 1) + 8 * k), "hdw_dateInterval");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v59;
      v61 = *(_QWORD *)(v39[10] + 8);
      if (*(_QWORD *)(v61 + 40))
      {
        objc_msgSend(v59, "startDate");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(v39[10] + 8) + 40), "startDate");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v62, "hk_isBeforeDate:", v63))
        {

        }
        else
        {
          objc_msgSend(v60, "endDate");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(v39[10] + 8) + 40), "endDate");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v66, "hk_isAfterDate:", v67);

          if (!v68)
            goto LABEL_46;
        }
        v69 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(*(id *)(*(_QWORD *)(v39[10] + 8) + 40), "startDate");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "startDate");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        HKDateMin();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(v39[10] + 8) + 40), "endDate");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "endDate");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        HKDateMax();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v69, "initWithStartDate:endDate:", v71, v74);
        v76 = *(_QWORD *)(*(_QWORD *)(v137 + 80) + 8);
        v77 = *(void **)(v76 + 40);
        *(_QWORD *)(v76 + 40) = v75;

        v39 = (_QWORD *)v137;
      }
      else
      {
        v64 = v59;
        v65 = *(void **)(v61 + 40);
        *(_QWORD *)(v61 + 40) = v64;
      }

      v57 = 1;
LABEL_46:

    }
    v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v177, 16);
  }
  while (v56);
  v54 = obj;

  if ((v57 & 1) != 0
    && (objc_msgSend(*(id *)(v39[4] + 48), "setDataInterval:transaction:error:", *(_QWORD *)(*(_QWORD *)(v39[10] + 8) + 40), v146, a3) & 1) == 0)
  {
    v78 = 0;
    v4 = v134;
    goto LABEL_102;
  }
LABEL_54:
  v79 = (const os_unfair_lock *)v39[4];
  v80 = v54;
  v141 = v146;
  if (v79)
  {
    v140 = v79;
    os_unfair_lock_assert_owner(v79 + 10);
    v139 = objc_alloc_init(MEMORY[0x1E0CB6E00]);
    v81 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v173 = 0u;
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    v130 = v80;
    v82 = v80;
    v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v173, v191, 16);
    if (v83)
    {
      v84 = v83;
      v85 = *(_QWORD *)v174;
      do
      {
        for (m = 0; m != v84; ++m)
        {
          if (*(_QWORD *)v174 != v85)
            objc_enumerationMutation(v82);
          v87 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * m);
          objc_msgSend(v87, "hdw_type");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "objectForKeyedSubscript:", v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v89)
          {
            v90 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v81, "setObject:forKeyedSubscript:", v90, v88);

          }
          objc_msgSend(v81, "objectForKeyedSubscript:", v88);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "addObject:", v87);

        }
        v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v173, v191, 16);
      }
      while (v84);
    }

    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    objc_msgSend(v81, "allKeys");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v169, &v187, 16);
    v4 = v134;
    v94 = (uint64_t)v140;
    if (v93)
    {
      v95 = v93;
      v96 = *(_QWORD *)v170;
      v143 = v81;
      v132 = *(_QWORD *)v170;
      v133 = v92;
      do
      {
        v97 = 0;
        v135 = v95;
        do
        {
          if (*(_QWORD *)v170 != v96)
            objc_enumerationMutation(v92);
          v138 = v97;
          v98 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * v97);
          if (objc_msgSend(v98, "code") != 298 && objc_msgSend(v98, "code") != 304)
          {
            v99 = v98;
            v100 = _HKStatisticsComputationMethodForQuantityType(v99, 0);
            -[HDWorkoutBuilderServer _lock_statisticsCalculatorsForQuantityType:mergeStrategy:computationMethod:](v94, v99, 0, v100);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v152 = v99;

            v167 = 0u;
            v168 = 0u;
            v165 = 0u;
            v166 = 0u;
            v149 = v101;
            v147 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v165, buf, 16);
            if (v147)
            {
              v145 = *(_QWORD *)v166;
              do
              {
                for (n = 0; n != v147; ++n)
                {
                  if (*(_QWORD *)v166 != v145)
                    objc_enumerationMutation(v149);
                  v103 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * n);
                  objc_msgSend(v149, "objectForKeyedSubscript:", v103);
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v104, "dataSource");
                  v105 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  isKindOfClass = objc_opt_isKindOfClass();
                  if ((isKindOfClass & 1) != 0)
                    objc_msgSend(v105, "setEnabled:", 0);
                  objc_msgSend(v81, "objectForKeyedSubscript:", v152);
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v107, "sortUsingComparator:", &__block_literal_global_468);
                  objc_msgSend(v152, "canonicalUnit");
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  v161[0] = MEMORY[0x1E0C809B0];
                  v161[1] = 3221225472;
                  v161[2] = __81__HDWorkoutBuilderServer__lock_updateStatisticsWithQuantities_transaction_error___block_invoke_2;
                  v161[3] = &unk_1E6CF0678;
                  v109 = v107;
                  v162 = v109;
                  v110 = v108;
                  v163 = v110;
                  v111 = v104;
                  v164 = v111;
                  v160 = 0;
                  v112 = objc_msgSend(v111, "performAddSampleTransaction:error:", v161, &v160);
                  v113 = v160;
                  if ((isKindOfClass & 1) != 0)
                    objc_msgSend(v105, "setEnabled:", 1);
                  if ((v112 & 1) != 0)
                  {
                    objc_msgSend(v111, "currentStatistics");
                    v142 = (void *)objc_claimAutoreleasedReturnValue();

                    v114 = *(void **)(v94 + 48);
                    v159 = 0;
                    v115 = objc_msgSend(v114, "storeStatisticsCalculator:anchor:activityUUID:transaction:error:", v111, 0, v103, v141, &v159);
                    v113 = v159;
                    if ((v115 & 1) == 0)
                    {
                      _HKInitializeLogging();
                      v116 = *MEMORY[0x1E0CB5380];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v179 = 138543618;
                        v180 = v94;
                        v181 = 2114;
                        v182 = v113;
                        _os_log_error_impl(&dword_1B7802000, v116, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist statistics: %{public}@", v179, 0x16u);
                      }
                    }
                    objc_msgSend((id)v94, "taskUUID");
                    v117 = (void *)objc_claimAutoreleasedReturnValue();
                    v118 = v94;
                    v119 = objc_msgSend(v103, "isEqual:", v117);

                    if (v119)
                    {
                      v120 = v142;
                      objc_msgSend(v139, "addWorkoutStatistics:forType:", v142, v152);
                    }
                    else
                    {
                      objc_msgSend(*(id *)(v118 + 192), "objectForKeyedSubscript:", v103);
                      v122 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v122, "startDate");
                      v123 = (void *)objc_claimAutoreleasedReturnValue();

                      v120 = v142;
                      if (v123)
                      {
                        objc_msgSend(v122, "startDate");
                        v124 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v142, "_setStartDate:", v124);

                      }
                      objc_msgSend(v122, "endDate");
                      v125 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v125)
                      {
                        objc_msgSend(v122, "endDate");
                        v126 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v142, "_setEndDate:", v126);

                      }
                      objc_msgSend(v139, "addActivityStatistics:forType:activityUUID:", v142, v152, v103);

                    }
                    v94 = (uint64_t)v140;
                  }
                  else
                  {
                    _HKInitializeLogging();
                    v121 = *MEMORY[0x1E0CB5380];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v179 = 138543618;
                      v180 = v94;
                      v181 = 2114;
                      v182 = v113;
                      _os_log_error_impl(&dword_1B7802000, v121, OS_LOG_TYPE_ERROR, "%{public}@: Failed to add samples to statistics calculator with error: %{public}@", v179, 0x16u);
                    }
                    objc_msgSend(*(id *)(v94 + 112), "addObject:", v152);
                  }

                  v81 = v143;
                }
                v147 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v165, buf, 16);
              }
              while (v147);
            }

            v92 = v133;
            v4 = v134;
            v39 = (_QWORD *)v137;
            v96 = v132;
            v95 = v135;
          }
          v97 = v138 + 1;
        }
        while (v138 + 1 != v95);
        v95 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v169, &v187, 16);
      }
      while (v95);
    }

    v80 = v130;
  }
  else
  {
    v139 = 0;
    v4 = v134;
  }

  v127 = *(_QWORD *)(v39[11] + 8);
  v128 = *(void **)(v127 + 40);
  *(_QWORD *)(v127 + 40) = v139;

  v78 = *(_QWORD *)(*(_QWORD *)(v39[11] + 8) + 40) != 0;
LABEL_102:

LABEL_103:
  return v78;
}

uint64_t __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hdw_sample");
}

uint64_t __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "sampleType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_4(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  uint64_t v5;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  os_unfair_lock_lock(v3);
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  return v5;
}

BOOL __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  _BOOL8 v7;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, a3, *(_QWORD *)(a1 + 40));

  return v7;
}

void __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_373(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "count"))
    objc_msgSend(v5, "workoutBuilderServer:addedSamples:", a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count"))
    objc_msgSend(v5, "workoutBuilderServer:addedSamples:", a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "count");
  v4 = v5;
  if (v3)
  {
    objc_msgSend(v5, "workoutBuilderServer:addedQuantities:", a1[4], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
    v4 = v5;
  }

}

void __83__HDWorkoutBuilderServer__addSamples_quantities_dataSource_shouldSavePriorToStart___block_invoke_2_375(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(v1 + 40));
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 40));
    v2 = objc_msgSend(*(id *)(v1 + 112), "count");
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 40));
    if (v2)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0CB6E00]);
      objc_msgSend((id)v1, "profile");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "database");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __76__HDWorkoutBuilderServer__attemptRequeryForInvalidatedStatisticsCalculators__block_invoke;
      v10[3] = &unk_1E6CE7950;
      v10[4] = v1;
      v6 = v3;
      v11 = v6;
      v7 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDataEntity, "performReadTransactionWithHealthDatabase:error:block:", v5, &v12, v10);
      v8 = v12;

      if (v7)
      {
        if ((objc_msgSend(v6, "isEmpty") & 1) == 0)
          -[HDWorkoutBuilderServer _didUpdateStatistics:]((_QWORD *)v1, v6);
      }
      else
      {
        _HKInitializeLogging();
        v9 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v14 = v1;
          v15 = 2114;
          v16 = v8;
          _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get read transaction to requery for invalidated sample types: %{public}@", buf, 0x16u);
        }
      }

    }
  }
}

- (HKDataFlowLink)workoutDataFlowLink
{
  return self->_workoutDataFlowLink;
}

- (unint64_t)workoutDataDestinationState
{
  os_unfair_lock_s *p_lock;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HKStateMachine currentState](self->_stateMachine, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "index");
  if (v5 > 8)
    v6 = 4;
  else
    v6 = qword_1B7F55F30[v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)addOtherSamples:(id)a3 dataSource:(id)a4
{
  -[HDWorkoutBuilderServer _addSamples:quantities:dataSource:shouldSavePriorToStart:]((uint64_t)self, a3, MEMORY[0x1E0C9AA60], a4, 0);
}

- (void)addQuantities:(id)a3 dataSource:(id)a4
{
  -[HDWorkoutBuilderServer _addSamples:quantities:dataSource:shouldSavePriorToStart:]((uint64_t)self, MEMORY[0x1E0C9AA60], a3, a4, 0);
}

- (void)addWorkoutEvents:(id)a3 dataSource:(id)a4
{
  id v5;
  NSObject *v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int v15;
  const char *v16;
  id v17;
  uint8_t buf[4];
  HDWorkoutBuilderServer *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count")
    && (-[HKWorkoutBuilderConfiguration shouldCollectWorkoutEvents](self->_configuration, "shouldCollectWorkoutEvents") & 1) != 0)
  {
    objc_msgSend(v5, "hk_map:", &__block_literal_global_380_0);
    v6 = objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v7 = (os_log_t *)MEMORY[0x1E0CB5380];
    v8 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      *(_DWORD *)buf = 138544386;
      v19 = self;
      v20 = 2048;
      v21 = objc_msgSend(v5, "count");
      v22 = 2114;
      v23 = (const char *)v5;
      v24 = 2048;
      v25 = -[NSObject count](v6, "count");
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_INFO, "%{public}@: Received %ld events (%{public}@) (%ld public: %@)", buf, 0x34u);

    }
    v17 = 0;
    v10 = -[HDWorkoutBuilderServer _insertWorkoutEvents:error:]((uint64_t)self, v6, (uint64_t)&v17);
    v11 = v17;
    if (!v10)
    {
      _HKInitializeLogging();
      v12 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v19 = self;
        v20 = 2114;
        v21 = (uint64_t)v11;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to insert workout events: %{public}@", buf, 0x16u);
      }
    }

LABEL_13:
    goto LABEL_14;
  }
  _HKInitializeLogging();
  v13 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    v6 = v13;
    v14 = objc_msgSend(v5, "count");
    v15 = -[HKWorkoutBuilderConfiguration shouldCollectWorkoutEvents](self->_configuration, "shouldCollectWorkoutEvents");
    v16 = "no";
    *(_DWORD *)buf = 138543874;
    v19 = self;
    if (v15)
      v16 = "YES";
    v20 = 2048;
    v21 = v14;
    v22 = 2080;
    v23 = v16;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "%{public}@: Ignoring %ld workout events (should-collect: %s)", buf, 0x20u);
    goto LABEL_13;
  }
LABEL_14:

}

uint64_t __54__HDWorkoutBuilderServer_addWorkoutEvents_dataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB6E50], "_workoutEventWithInternalEvent:", a2);
}

- (BOOL)_insertWorkoutEvents:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  BOOL v27;
  id v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  id v39;
  _BOOL4 v40;
  id obj;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  id v70;
  _QWORD block[5];
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
    if (objc_msgSend(v5, "count"))
    {
      v39 = v5;
      v50 = 0;
      v51 = &v50;
      v52 = 0x2020000000;
      v53 = 0;
      objc_msgSend((id)a1, "profile");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "database");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __53__HDWorkoutBuilderServer__insertWorkoutEvents_error___block_invoke;
      v47[3] = &unk_1E6CEB640;
      v47[4] = a1;
      v8 = v5;
      v48 = v8;
      v49 = &v50;
      v40 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v7, a3, v47);

      if (v40)
      {
        v9 = v8;
        os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
        v10 = (void *)objc_msgSend(*(id *)(a1 + 184), "copy");
        -[HDWorkoutBuilderServer _didUpdateEvents:]((_QWORD *)a1, v10);

        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        obj = v9;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v55;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v55 != v12)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
              if (objc_msgSend(v14, "type") == 1 || objc_msgSend(v14, "type") == 2)
              {

                os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
                v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v63 = 0u;
                v64 = 0u;
                v61 = 0u;
                v62 = 0u;
                v15 = *(id *)(a1 + 192);
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, block, 16);
                if (v16)
                {
                  v17 = *(_QWORD *)v62;
                  do
                  {
                    for (j = 0; j != v16; ++j)
                    {
                      if (*(_QWORD *)v62 != v17)
                        objc_enumerationMutation(v15);
                      objc_msgSend(*(id *)(a1 + 192), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j));
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "startDate");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "endDate");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      _HKCalculateWorkoutDuration();
                      v23 = v22;

                      objc_msgSend(v19, "duration");
                      if (v24 != v23)
                      {
                        objc_msgSend(v19, "_setDuration:", v23);
                        objc_msgSend(v42, "addObject:", v19);
                      }

                    }
                    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, block, 16);
                  }
                  while (v16);
                }

                if (objc_msgSend(v42, "count"))
                {
                  objc_msgSend((id)a1, "profile");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "database");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = 0;
                  v58[0] = MEMORY[0x1E0C809B0];
                  v58[1] = 3221225472;
                  v58[2] = __51__HDWorkoutBuilderServer__updateActivitiesDuration__block_invoke;
                  v58[3] = &unk_1E6CE7950;
                  v58[4] = a1;
                  v59 = v42;
                  v27 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v26, &v60, v58);
                  v28 = v60;

                  if (!v27)
                  {
                    _HKInitializeLogging();
                    v29 = *MEMORY[0x1E0CB5380];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543618;
                      v68 = a1;
                      v69 = 2114;
                      v70 = v28;
                      _os_log_error_impl(&dword_1B7802000, v29, OS_LOG_TYPE_ERROR, "%{public}@: Error updating activity duration %{public}@", buf, 0x16u);
                    }
                  }
                  -[HDWorkoutBuilderServer _didUpdateActivities](a1);

                }
                -[HDWorkoutBuilderServer _didChangeElapsedTimeBasis]((_QWORD *)a1);
                -[HDWorkoutBuilderServer _updateStatisticsPauseResumeMask](a1);
                goto LABEL_30;
              }
            }
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
            if (v11)
              continue;
            break;
          }
        }

        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
LABEL_30:

        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v30 = obj;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v44;
          do
          {
            for (k = 0; k != v31; ++k)
            {
              if (*(_QWORD *)v44 != v32)
                objc_enumerationMutation(v30);
              v34 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
              if (objc_msgSend(v34, "type") == 1 || objc_msgSend(v34, "type") == 2)
              {
                v35 = v34;
                v36 = *(NSObject **)(a1 + 152);
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __56__HDWorkoutBuilderServer__notifySourcesOfInsertedEvent___block_invoke;
                block[3] = &unk_1E6CE8080;
                block[4] = a1;
                v37 = v35;
                v72 = v37;
                dispatch_async(v36, block);

              }
            }
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
          }
          while (v31);
        }

      }
      if (*((_BYTE *)v51 + 24))
        -[HDWorkoutBuilderServer _didUpdateActivities](a1);

      _Block_object_dispose(&v50, 8);
      v5 = v39;
    }
    else
    {
      v40 = 1;
    }
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (void)addMetadata:(id)a3 dataSource:(id)a4
{
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  HDWorkoutBuilderServer *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v5 = -[HDWorkoutBuilderServer _addMetadata:error:]((os_unfair_lock *)self, a3, (uint64_t)&v8);
  v6 = v8;
  if (!v5)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to add metadata with error: %{public}@", buf, 0x16u);
    }
  }

}

- (BOOL)_addMetadata:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a2;
  if (a1
    && (os_unfair_lock_assert_not_owner(a1 + 10),
        -[os_unfair_lock client](a1, "client"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "hd_validateMetadataKeysAndValuesWithClient:error:", v6, a3),
        v6,
        v7))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__171;
    v19 = __Block_byref_object_dispose__171;
    v20 = 0;
    -[os_unfair_lock profile](a1, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__HDWorkoutBuilderServer__addMetadata_error___block_invoke;
    v12[3] = &unk_1E6CEB640;
    v12[4] = a1;
    v13 = v5;
    v14 = &v15;
    v10 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v9, a3, v12);

    if (v10)
      -[HDWorkoutBuilderServer _didUpdateMetadata:](a1, (void *)v16[5]);

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)addMetadataToWorkoutActivity:(id)a3 withSampleStartDate:(id)a4 dataSource:(id)a5
{
  id v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  HDWorkoutBuilderServer *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v7 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = self->_workoutActivitiesByUUID;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v11)
        objc_enumerationMutation(v8);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_workoutActivitiesByUUID, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v12), v28);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v7, "hk_isAfterOrEqualToDate:", v14);

      if (v15)
      {
        objc_msgSend(v13, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          break;
        objc_msgSend(v13, "endDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v7, "hk_isBeforeOrEqualToDate:", v17);

        if ((v18 & 1) != 0)
          break;
      }

      if (v10 == ++v12)
      {
        v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
    v19 = v13;

    if (!v19)
      goto LABEL_15;
    objc_msgSend(v19, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v21 = v28;
    v22 = -[HDWorkoutBuilderServer _updateActivityWithUUID:addMetadata:error:]((uint64_t)self, v20, v28, &v29);
    v23 = v29;

    if ((v22 & 1) != 0)
    {
      -[HDWorkoutBuilderServer _didUpdateActivities]((uint64_t)self);
    }
    else
    {
      _HKInitializeLogging();
      v25 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        v26 = v25;
        objc_msgSend(v19, "UUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = self;
        v36 = 2114;
        v37 = v27;
        v38 = 2114;
        v39 = v23;
        _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed to add metadata to workout activity with UUID %{public}@ with error: %{public}@", buf, 0x20u);

      }
    }

  }
  else
  {
LABEL_11:

LABEL_15:
    _HKInitializeLogging();
    v24 = *MEMORY[0x1E0CB5380];
    v21 = v28;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      v36 = 2114;
      v37 = v7;
      _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to find activity greater than date %{public}@ to add metadata", buf, 0x16u);
    }
  }

}

- (uint64_t)_updateActivityWithUUID:(void *)a3 addMetadata:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
    objc_msgSend((id)a1, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "hd_validateMetadataKeysAndValuesWithClient:error:", v9, a4);

    if (v10)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 192), "objectForKeyedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
      if (v11)
      {
        _HKInitializeLogging();
        v12 = (void *)*MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          v13 = v12;
          objc_msgSend(v7, "UUIDString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = a1;
          v26 = 2112;
          v27 = v14;
          _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding metadata to activity with UUID %@", buf, 0x16u);

        }
        objc_msgSend((id)a1, "profile");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "database");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __68__HDWorkoutBuilderServer__updateActivityWithUUID_addMetadata_error___block_invoke;
        v21[3] = &unk_1E6CEB3F8;
        v21[4] = a1;
        v22 = v7;
        v23 = v8;
        a1 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v16, a4, v21);

      }
      else
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v7, "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "hk_error:format:", 118, CFSTR("Cannot find activity with UUID %@"), v18);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        a1 = v19 == 0;
        if (v19)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v19);
          else
            _HKLogDroppedError();
        }

      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)_didUpdateActivities
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 192), "allValues");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    objc_msgSend((id)a1, "client");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__HDWorkoutBuilderServer__didUpdateActivities__block_invoke;
    v6[3] = &unk_1E6CE8030;
    v6[4] = a1;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "clientRemote_didUpdateActivities:", v2);
  }
}

- (void)updateWorkoutConfiguration:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *upstreamQueue;
  id v27;
  uint64_t v28;
  void *v29;
  uint8_t v30[4];
  HDWorkoutBuilderServer *v31;
  __int16 v32;
  id v33;
  __int128 buf;
  void *v35;
  void *v36;
  HDWorkoutBuilderServer *v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  v10 = MEMORY[0x1E0C809B0];
  if (self)
  {
    if (v8)
    {
      -[HDStandardTaskServer profile](self, "profile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "database");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      *(_QWORD *)&buf = v10;
      *((_QWORD *)&buf + 1) = 3221225472;
      v35 = __54__HDWorkoutBuilderServer__updateWorkoutConfiguration___block_invoke;
      v36 = &unk_1E6CE7950;
      v37 = self;
      v13 = v9;
      v38 = v13;
      v14 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v12, &v27, &buf);
      v15 = v27;

      if (v14)
      {
        os_unfair_lock_lock(&self->_lock);
        -[HKWorkoutBuilderConfiguration setWorkoutConfiguration:](self->_configuration, "setWorkoutConfiguration:", v13);
        os_unfair_lock_unlock(&self->_lock);
      }
      else
      {
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v30 = 138543618;
          v31 = self;
          v32 = 2114;
          v33 = v15;
          _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update builder workout Configuration: %{public}@", v30, 0x16u);
        }
      }

    }
    else
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = self;
        _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Workout Configuration is nil. Nothing to update}@", (uint8_t *)&buf, 0xCu);
      }
    }
  }

  -[HDWorkoutBuilderServer currentMetadata](self, "currentMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0CB5558];
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CB5558]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v18) = objc_msgSend(v20, "BOOLValue");
  v21 = objc_msgSend(v9, "locationType");
  if ((_DWORD)v18 != (v21 == 2))
  {
    v28 = v19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21 == 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutBuilderServer addMetadata:dataSource:](self, "addMetadata:dataSource:", v23, v7);

  }
  v24 = v9;
  v25 = v24;
  if (self)
  {
    upstreamQueue = self->_upstreamQueue;
    *(_QWORD *)&buf = v10;
    *((_QWORD *)&buf + 1) = 3221225472;
    v35 = __62__HDWorkoutBuilderServer__notifySourcesOfConfigurationUpdate___block_invoke;
    v36 = &unk_1E6CE8080;
    v37 = self;
    v38 = v24;
    dispatch_async(upstreamQueue, &buf);

  }
}

- (void)didBeginActivity:(id)a3 dataSource:(id)a4
{
  id v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  uint8_t v23[128];
  uint8_t buf[4];
  HDWorkoutBuilderServer *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = 0;
  v6 = -[HDWorkoutBuilderServer _addWorkoutActivity:error:]((uint64_t)self, v5, (uint64_t)&v22);
  v7 = v22;
  if ((v6 & 1) != 0)
  {
    -[HKDataFlowLink allSourceProcessors](self->_workoutDataFlowLink, "allSourceProcessors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12++), "workoutDataDestination:didBeginActivity:", self, v5);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v10);
    }
    -[HDStandardTaskServer client](self, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__HDWorkoutBuilderServer_didBeginActivity_dataSource___block_invoke;
    v17[3] = &unk_1E6CE8030;
    v17[4] = self;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "clientRemote_didBeginActivity:", v5);
  }
  else
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v25 = self;
      v26 = 2114;
      v27 = v7;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to insert activity: %{public}@", buf, 0x16u);
    }
  }

}

- (uint64_t)_addWorkoutActivity:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  unsigned int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v6 = (void *)objc_msgSend(*(id *)(a1 + 184), "copy");
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _HKCalculateWorkoutDuration();
    v10 = v9;

    objc_msgSend(v5, "_setDuration:", v10);
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v5, "_filterAndSetWorkoutEvents:", v6);
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__171;
    v39 = __Block_byref_object_dispose__171;
    v40 = 0;
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v43 = a1;
      v44 = 2112;
      v45 = v5;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding workout activity %@", buf, 0x16u);
    }
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __52__HDWorkoutBuilderServer__addWorkoutActivity_error___block_invoke;
    v32[3] = &unk_1E6CEDA60;
    v32[4] = a1;
    v12 = v5;
    v33 = v12;
    v34 = &v35;
    v27 = -[HDWorkoutBuilderServer _runInBestWriteTransactionWithError:block:]((void *)a1, a3, v32);
    if (v27)
    {
      objc_msgSend((id)v36[5], "activitiesStatistics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(v16);
            v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v16, "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "_setStatistics:forType:", v21, v20);

          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
        }
        while (v17);
      }

      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
      v22 = *(void **)(a1 + 192);
      if (!v22)
      {
        v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v24 = *(void **)(a1 + 192);
        *(_QWORD *)(a1 + 192) = v23;

        v22 = *(void **)(a1 + 192);
      }
      objc_msgSend(v12, "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, v25);

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    }

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

void __54__HDWorkoutBuilderServer_didBeginActivity_dataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of begun activity with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)didEndActivity:(id)a3 dataSource:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  HDWorkoutBuilderServer *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v8 = -[HDWorkoutBuilderServer _endActivityWithUUID:endDate:error:]((uint64_t)self, v6, v7, &v11);
  v9 = v11;

  if ((v8 & 1) == 0)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v9;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed registering end of activity: %{public}@", buf, 0x16u);
    }
  }

}

- (uint64_t)_endActivityWithUUID:(void *)a3 endDate:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 192), "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    if (!v10)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v7, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hk_error:format:", 118, CFSTR("Cannot find activity with UUID %@"), v29);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      a1 = v30 == 0;
      if (v30)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v30);
        else
          _HKLogDroppedError();
      }

      v19 = 0;
      goto LABEL_24;
    }
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v43 = a1;
      v44 = 2112;
      v45 = v8;
      v46 = 2112;
      v47 = v10;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting end date %@ on activity %@", buf, 0x20u);
    }
    objc_msgSend(v10, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _HKCalculateWorkoutDuration();
    v14 = v13;

    objc_msgSend(v10, "_setEndDate:", v8);
    objc_msgSend(v10, "_setDuration:", v14);
    objc_msgSend((id)a1, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __61__HDWorkoutBuilderServer__endActivityWithUUID_endDate_error___block_invoke;
    v38[3] = &unk_1E6CE7950;
    v38[4] = a1;
    v17 = v10;
    v39 = v17;
    v18 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v16, &v40, v38);
    v19 = v40;

    if (v18)
    {
      -[HDWorkoutBuilderServer _updateStatisticsPauseResumeMask](a1);
      objc_msgSend(*(id *)(a1 + 120), "allSourceProcessors");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v35;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v35 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v24++), "workoutDataDestination:didEndActivity:", a1, v17);
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        }
        while (v22);
      }
      objc_msgSend(*(id *)(a1 + 192), "setObject:forKeyedSubscript:", v17, v7);
      objc_msgSend((id)a1, "client");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "connection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __61__HDWorkoutBuilderServer__endActivityWithUUID_endDate_error___block_invoke_2;
      v33[3] = &unk_1E6CE8030;
      v33[4] = a1;
      objc_msgSend(v26, "remoteObjectProxyWithErrorHandler:", v33);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "clientRemote_didEndActivity:", v17);
    }
    else
    {
      v31 = v19;
      v20 = v31;
      if (v31)
      {
        if (a4)
        {
          v20 = objc_retainAutorelease(v31);
          a1 = 0;
          *a4 = v20;
        }
        else
        {
          _HKLogDroppedError();
          a1 = 0;
        }
        goto LABEL_21;
      }
    }
    a1 = 1;
LABEL_21:

LABEL_24:
  }

  return a1;
}

uint64_t __61__HDWorkoutBuilderServer__endActivityWithUUID_endDate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  os_unfair_lock_s *v5;
  id v6;
  uint64_t v7;

  v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 40);
  v6 = a2;
  os_unfair_lock_lock(v5);
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "updateWorkoutActivityEndDate:transaction:error:", *(_QWORD *)(a1 + 40), v6, a3);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  return v7;
}

void __61__HDWorkoutBuilderServer__endActivityWithUUID_endDate_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of ended activity with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)addDataAccumulationObserver:(id)a3
{
  id v4;
  HDWorkoutBuilderStatisticsCalculators *statisticsCalculators;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  -[HKObserverSet registerObserver:](self->_dataAccumulatorObservers, "registerObserver:", v8);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  os_unfair_lock_lock(&self->_lock);
  statisticsCalculators = self->_statisticsCalculators;
  -[HDStandardTaskServer taskUUID](self, "taskUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HDWorkoutBuilderServer__currentStatisticsByQuantityType__block_invoke;
  v9[3] = &unk_1E6D0B9E0;
  v7 = v4;
  v10 = v7;
  -[HDWorkoutBuilderStatisticsCalculators enumerateCalculatorsForActivityUUID:handler:](statisticsCalculators, "enumerateCalculatorsForActivityUUID:handler:", v6, v9);

  os_unfair_lock_unlock(&self->_lock);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "workoutDataAccumulator:didUpdateStatistics:", self, v7);

}

- (void)removeDataAccumulationObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_dataAccumulatorObservers, "unregisterObserver:", a3);
}

- (id)currentEvents
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSArray copy](self->_workoutEvents, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)startDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_workoutStartDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)stateMachine:(id)a3 didEnterState:(id)a4 date:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSError *v13;
  NSError *error;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD *v18;
  char v19;
  id v20;
  NSObject *upstreamQueue;
  id v22;
  int v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD block[5];
  id v39;
  id v40;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  os_unfair_lock_assert_owner(&self->_lock);
  switch(objc_msgSend(v10, "index"))
  {
    case 0:
      v40 = 0;
      v19 = -[HDWorkoutBuilderServer _validateAuthorizationToSaveWorkoutWithError:](self, (uint64_t)&v40);
      v20 = v40;
      if ((v19 & 1) == 0)
        -[HDWorkoutBuilderServer _lock_failWithError:]((uint64_t)self, v20);
      upstreamQueue = self->_upstreamQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke;
      block[3] = &unk_1E6CE8080;
      block[4] = self;
      v39 = v20;
      v22 = v20;
      dispatch_async(upstreamQueue, block);

      goto LABEL_9;
    case 1:
LABEL_9:
      v37 = 0;
      v23 = -[HDWorkoutBuilderServer _validateAuthorizationToSaveWorkoutWithError:](self, (uint64_t)&v37);
      v24 = v37;
      if (v23)
      {
        v25 = self->_upstreamQueue;
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_2;
        v35[3] = &unk_1E6CE8080;
        v35[4] = self;
        v36 = v11;
        dispatch_async(v25, v35);

      }
      else
      {
        -[HDWorkoutBuilderServer _lock_failWithError:]((uint64_t)self, v24);
      }

      break;
    case 2:
      v17 = self->_upstreamQueue;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_387;
      v34[3] = &unk_1E6CE80E8;
      v34[4] = self;
      v18 = v34;
      goto LABEL_15;
    case 3:
      v26 = self->_upstreamQueue;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_2_388;
      v32[3] = &unk_1E6CE8080;
      v32[4] = self;
      v33 = v11;
      dispatch_async(v26, v32);
      v16 = v33;
      goto LABEL_13;
    case 5:
      v17 = self->_upstreamQueue;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_3_395;
      v31[3] = &unk_1E6CE80E8;
      v31[4] = self;
      v18 = v31;
      goto LABEL_15;
    case 6:
      v17 = self->_upstreamQueue;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_397;
      v30[3] = &unk_1E6CE80E8;
      v30[4] = self;
      v18 = v30;
LABEL_15:
      dispatch_async(v17, v18);
      break;
    case 7:
    case 8:
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Workout builder has been discarded."));
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = (NSError *)objc_msgSend(v12, "copy");
      error = self->_error;
      self->_error = v13;

      v15 = self->_upstreamQueue;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_2_402;
      v27[3] = &unk_1E6CE7FB8;
      v27[4] = self;
      v28 = v10;
      v12 = v12;
      v29 = v12;
      dispatch_async(v15, v27);

      v16 = v28;
LABEL_13:

      break;
    default:
      break;
  }

}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;

  v2 = *(id *)(a1 + 32);
  v17 = 0;
  if (!v2)
    goto LABEL_14;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)v2 + 10);
  objc_msgSend(*((id *)v2 + 21), "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  os_unfair_lock_lock((os_unfair_lock_t)v2 + 10);
  v5 = *MEMORY[0x1E0CB5558];
  objc_msgSend(*((id *)v2 + 22), "objectForKeyedSubscript:", *MEMORY[0x1E0CB5558]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "locationType") == 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v5);

  }
  if (objc_msgSend(v3, "swimmingLocationType"))
  {
    v8 = *MEMORY[0x1E0CB55C0];
    objc_msgSend(*((id *)v2 + 22), "objectForKeyedSubscript:", *MEMORY[0x1E0CB55C0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "swimmingLocationType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v8);

    }
  }
  objc_msgSend(v3, "lapLength");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = *MEMORY[0x1E0CB5568];
    objc_msgSend(*((id *)v2 + 22), "objectForKeyedSubscript:", *MEMORY[0x1E0CB5568]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(v3, "lapLength");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v13);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v2 + 10);
  v16 = !objc_msgSend(v4, "count")
     || -[HDWorkoutBuilderServer _addMetadata:error:]((os_unfair_lock *)v2, v4, (uint64_t)&v17);

  v2 = v17;
  if (!v16)
  {
LABEL_14:
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
    -[HDWorkoutBuilderServer _lock_failWithError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  }

}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  id *v9;
  char v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "allSourceProcessors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(void **)(v7 + 200);
        if (!v8)
          v8 = *(void **)(a1 + 40);
        -[HDWorkoutBuilderServer _requestDataFromSource:from:to:]((void *)v7, *(void **)(*((_QWORD *)&v15 + 1) + 8 * i), v8, *(void **)(v7 + 208));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v4);
  }
  v9 = *(id **)(a1 + 32);
  v14 = 0;
  v10 = -[HDWorkoutBuilderServer _associateZonesSamplesIfNeededWithError:](v9, &v14);
  v11 = v14;
  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2114;
      v22 = v11;
      _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to associate zone samples for workout builder: %{public}@", buf, 0x16u);
    }
  }

}

- (void)_requestDataFromSource:(void *)a3 from:(void *)a4 to:
{
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v18 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__HDWorkoutBuilderServer__requestDataFromSource_from_to___block_invoke;
    v13[3] = &unk_1E6CF1370;
    v14 = v7;
    v15 = a1;
    v16 = v8;
    v17 = v9;
    v10 = -[HDWorkoutBuilderServer _runInBestWriteTransactionWithError:block:](a1, (uint64_t)&v18, v13);
    v11 = v18;
    if ((v10 & 1) == 0)
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v20 = a1;
        v21 = 2114;
        v22 = v11;
        _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed write transaction when fetching data during data source addition: %{public}@", buf, 0x16u);
      }
    }

  }
}

- (uint64_t)_associateZonesSamplesIfNeededWithError:(id *)a1
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  BOOL v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  _QWORD *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _BYTE v42[128];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (a1[28])
    return 1;
  v39 = 0;
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB6ED0], "heartRateType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6ED0], "cyclingPowerType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObjects:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __53__HDWorkoutBuilderServer__fetchZonesByTypeWithError___block_invoke;
  v40[3] = &unk_1E6D0B950;
  v10 = v9;
  v41 = v10;
  v11 = 0;
  if (objc_msgSend(a1, "enumerateSamplesOfTypes:error:handler:", v8, &v39, v40))
    v11 = v10;

  v12 = v39;
  if (v11)
  {
    if (objc_msgSend(v11, "count"))
    {
      v13 = objc_msgSend(v11, "mutableCopy");
      v14 = a1[28];
      a1[28] = (id)v13;
      v3 = 1;
    }
    else
    {
      v32 = a2;
      v33 = v12;
      objc_msgSend(MEMORY[0x1E0CB6ED0], "heartRateType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v15;
      objc_msgSend(MEMORY[0x1E0CB6ED0], "cyclingPowerType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v14 = v17;
      v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v36;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v36 != v20)
              objc_enumerationMutation(v14);
            v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(a1, "profile");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 0;
            +[HDSampleEntity mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:](HDWorkoutZonesSampleEntity, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v22, v23, 0, 0, 0, &v34);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v34;

            if (v24)
              v26 = 1;
            else
              v26 = v25 == 0;
            if (!v26)
            {
              if (v32)
                *v32 = objc_retainAutorelease(v25);
              else
                _HKLogDroppedError();
              v12 = v33;

              v3 = 0;
              v30 = v14;
              goto LABEL_32;
            }
            if (v24)
            {
              v27 = a1[28];
              if (!v27)
              {
                v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                v29 = a1[28];
                a1[28] = v28;

                v27 = a1[28];
              }
              objc_msgSend(v27, "setObject:forKeyedSubscript:", v24, v22);
            }

          }
          v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
          if (v19)
            continue;
          break;
        }
      }

      if (objc_msgSend(a1[28], "count"))
      {
        objc_msgSend(a1[28], "allValues");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = 1;
        -[HDWorkoutBuilderServer _addSamples:quantities:dataSource:shouldSavePriorToStart:]((uint64_t)a1, v30, MEMORY[0x1E0C9AA60], 0, 1);
        v12 = v33;
LABEL_32:

      }
      else
      {
        v3 = 1;
        v12 = v33;
      }
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_387(uint64_t a1)
{
  -[HDWorkoutBuilderServer _checkForAttachedDataSources](*(_QWORD *)(a1 + 32));
}

- (void)_checkForAttachedDataSources
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 136), "enqueueEvent:date:error:completion:", 101, 0, 0, &__block_literal_global_516);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_2_388(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  dispatch_group_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  char v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "allSourceProcessors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 200);
  if (!v3)
    v3 = *(void **)(a1 + 40);
  v4 = v3;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  if (!v5)
    v5 = *(void **)(a1 + 40);
  v6 = v5;
  v7 = dispatch_group_create();
  v8 = *(void **)(a1 + 32);
  v29 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_3;
  v22[3] = &unk_1E6D0B7D0;
  v10 = v2;
  v23 = v10;
  v11 = v7;
  v12 = *(_QWORD *)(a1 + 32);
  v24 = v11;
  v25 = v12;
  v13 = v4;
  v26 = v13;
  v14 = v6;
  v27 = v14;
  v28 = *(id *)(a1 + 40);
  v15 = -[HDWorkoutBuilderServer _runInBestWriteTransactionWithError:block:](v8, (uint64_t)&v29, v22);
  v16 = v29;
  if ((v15 & 1) == 0)
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v31 = v20;
      v32 = 2114;
      v33 = v16;
      _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to set up write transaction for requesting final data: %{public}@", buf, 0x16u);
    }
  }
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(NSObject **)(v18 + 152);
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_392;
  v21[3] = &unk_1E6CE80E8;
  v21[4] = v18;
  dispatch_group_notify(v11, v19, v21);

}

uint64_t __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id obj;
  _QWORD v19[4];
  uint64_t v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v24 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        _HKInitializeLogging();
        v7 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(_QWORD *)(a1 + 48);
          v9 = *(_QWORD *)(a1 + 56);
          v10 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 138544130;
          v28 = v8;
          v29 = 2114;
          v30 = v9;
          v31 = 2114;
          v32 = v10;
          v33 = 2114;
          v34 = v6;
          _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Requesting final data for interval (%{public}@ - %{public}@) from %{public}@", buf, 0x2Au);
        }
        v11 = *(_QWORD *)(a1 + 56);
        v12 = *(_QWORD *)(a1 + 64);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_389;
        v19[3] = &unk_1E6CE7DB8;
        v13 = *(void **)(a1 + 40);
        v20 = *(_QWORD *)(a1 + 48);
        v14 = v20;
        v21 = v6;
        v22 = v13;
        objc_msgSend(v6, "workoutDataDestination:requestsFinalDataFrom:to:completion:", v14, v11, v12, v19);
        v15 = *(_QWORD *)(a1 + 48);
        v16 = *(void **)(v15 + 208);
        if (!v16)
          v16 = *(void **)(a1 + 72);
        -[HDWorkoutBuilderServer _requestDataFromSource:from:to:]((void *)v15, v6, *(void **)(v15 + 200), v16);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v3);
  }

  return 1;
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_389(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5380];
  v7 = *MEMORY[0x1E0CB5380];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w1) Received final data from %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138543874;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    v16 = 2114;
    v17 = v5;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to recieve final data from %{public}@: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (uint64_t)_runInBestWriteTransactionWithError:(void *)a3 block:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDatabaseTransactionContext contextForWritingProtectedData](HDDatabaseTransactionContext, "contextForWritingProtectedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__HDWorkoutBuilderServer__runInBestWriteTransactionWithError_block___block_invoke;
    v14[3] = &unk_1E6CF1650;
    v15 = v5;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __68__HDWorkoutBuilderServer__runInBestWriteTransactionWithError_block___block_invoke_2;
    v12[3] = &unk_1E6CEEAB8;
    v13 = v15;
    v10 = objc_msgSend(v7, "performTransactionWithContext:error:block:inaccessibilityHandler:", v8, a2, v14, v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_392(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "enqueueEvent:date:error:completion:", 102, 0, 0, &__block_literal_global_394_0);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_3_395(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  id v26;
  os_unfair_lock_s *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[4];
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  uint8_t buf[4];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v39 = 0;
  if (!v2)
    goto LABEL_27;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 40));
  v3 = *(_QWORD *)(v2 + 200);
  if (!v3)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = CFSTR("Workout builder has unspecified start date.");
LABEL_24:
    objc_msgSend(v24, "hk_assignError:code:description:", &v39, 124, v25);
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 40));
    v2 = 0;
    goto LABEL_27;
  }
  v4 = *(void **)(v2 + 208);
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v52 = v2;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: (#w0) Synthesizing end date while finishing; no end date yet specified (was endCollection called)?",
        buf,
        0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(v2 + 208);
    *(_QWORD *)(v2 + 208) = v6;

    v4 = *(void **)(v2 + 208);
    v3 = *(_QWORD *)(v2 + 200);
  }
  if ((objc_msgSend(v4, "hk_isAfterDate:", v3) & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = CFSTR("Workout builder end date is not after start date.");
    goto LABEL_24;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", *(_QWORD *)(v2 + 200), *(_QWORD *)(v2 + 208));
  objc_msgSend(*(id *)(v2 + 192), "hk_filterKeysWithBlock:", &__block_literal_global_494);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 40));
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, buf, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(v10);
        if (!-[HDWorkoutBuilderServer _endActivityWithUUID:endDate:error:](v2, *(void **)(*((_QWORD *)&v41 + 1) + 8 * i), *(void **)(v2 + 208), &v39))
        {
          v2 = 0;
          v22 = v10;
          goto LABEL_26;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, buf, 16);
      if (v12)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(v2 + 168), "associatedSessionUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(v2 + 168), "associatedSessionUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0CB7330];
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CB7330]);

    v40 = 0;
    LOBYTE(v18) = -[HDWorkoutBuilderServer _addMetadata:error:]((os_unfair_lock *)v2, v16, (uint64_t)&v40);
    v20 = v40;
    if ((v18 & 1) == 0)
    {
      _HKInitializeLogging();
      v21 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        v34 = v21;
        objc_msgSend(v16, "objectForKeyedSubscript:", v19);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v45 = 138543874;
        v46 = v2;
        v47 = 2114;
        v48 = v35;
        v49 = 2114;
        v50 = v20;
        _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "%{public}@: Failed to add associated sessionId:%{public}@ with error: %{public}@", v45, 0x20u);

      }
    }

  }
  objc_msgSend((id)v2, "taskUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v2, "profile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutBuilderEntity finishWorkoutBuilderWithIdentifier:dateInterval:profile:error:](HDWorkoutBuilderEntity, "finishWorkoutBuilderWithIdentifier:dateInterval:profile:error:", v22, v8, v23, &v39);
  v2 = objc_claimAutoreleasedReturnValue();

LABEL_26:
LABEL_27:
  v26 = v39;
  v27 = *(os_unfair_lock_s **)(a1 + 32);
  if (v2 || !v26)
  {
    -[os_unfair_lock_s client](v27, "client");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "connection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_4;
    v38[3] = &unk_1E6CE8030;
    v38[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v29, "remoteObjectProxyWithErrorHandler:", v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "clientRemote_finishedWorkout:", v2);
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
    v32 = *(_QWORD *)(a1 + 32);
    v33 = *(void **)(v32 + 136);
    v36[0] = v30;
    v36[1] = 3221225472;
    v36[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_396;
    v36[3] = &unk_1E6CEB718;
    v36[4] = v32;
    v37 = (id)v2;
    objc_msgSend(v33, "enqueueEvent:date:error:completion:", 103, 0, 0, v36);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));

  }
  else
  {
    os_unfair_lock_lock(v27 + 10);
    -[HDWorkoutBuilderServer _lock_failWithError:](*(_QWORD *)(a1 + 32), v26);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  }

}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send finished workout to client, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_396(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "_detailedDescriptionString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Workout did save: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_397(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskServerRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTaskServerObserver:", *(_QWORD *)(a1 + 32));

}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_2_402(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "taskServerRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTaskServerObserver:", *(_QWORD *)(a1 + 32));

  v5 = *(void **)(a1 + 32);
  v17 = 0;
  LODWORD(v4) = -[HDWorkoutBuilderServer _discardWorkoutWithError:](v5, (uint64_t)&v17);
  v6 = v17;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5380];
  v8 = *MEMORY[0x1E0CB5380];
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v19 = v9;
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Discarded workout after moving to %{public}@ state", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v19 = v14;
    v20 = 2114;
    v21 = v15;
    v22 = 2114;
    v23 = v6;
    _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Unable to discard workout after moving to %{public}@ state: %{public}@", buf, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 32), "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_403;
  v16[3] = &unk_1E6CE8030;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "clientRemote_didFailWithError:", *(_QWORD *)(a1 + 48));
}

- (void)_discardWorkoutWithError:(void *)result
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  if (result)
  {
    v3 = result;
    objc_msgSend(result, "taskUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[HDWorkoutBuilderEntity discardBuilderWithIdentifier:profile:error:](HDWorkoutBuilderEntity, "discardBuilderWithIdentifier:profile:error:", v4, v5, a2);

    return (void *)v6;
  }
  return result;
}

void __64__HDWorkoutBuilderServer_stateMachine_didEnterState_date_error___block_invoke_403(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send error to client, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }

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
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *upstreamQueue;
  _BYTE v28[24];
  void *v29;
  HDWorkoutBuilderServer *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  _HKInitializeLogging();
  v20 = *MEMORY[0x1E0CB5380];
  v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (!v21)
      goto LABEL_7;
    *(_DWORD *)v28 = 138543618;
    *(_QWORD *)&v28[4] = self;
    *(_WORD *)&v28[12] = 2114;
    *(_QWORD *)&v28[14] = v15;
    v22 = "%{public}@: (#w0) %{public}@.";
  }
  else
  {
    if (!v21)
      goto LABEL_7;
    *(_DWORD *)v28 = 138543618;
    *(_QWORD *)&v28[4] = self;
    *(_WORD *)&v28[12] = 2114;
    *(_QWORD *)&v28[14] = v17;
    v22 = "%{public}@: (#w0) Enter at %{public}@.";
  }
  _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, v22, v28, 0x16u);
LABEL_7:
  -[HDWorkoutBuilderServer _lock_pushCurrentConstructionState]((uint64_t)self);
  if (v16)
  {
    v23 = objc_msgSend(v16, "index");
    if (v23 > 8)
      v24 = 4;
    else
      v24 = qword_1B7F55F30[v23];
    v25 = objc_msgSend(v17, "index", *(_QWORD *)v28, *(_OWORD *)&v28[8]);
    if (v25 > 8)
      v26 = 4;
    else
      v26 = qword_1B7F55F30[v25];
    if (self)
    {
      upstreamQueue = self->_upstreamQueue;
      *(_QWORD *)v28 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v28[8] = 3221225472;
      *(_QWORD *)&v28[16] = __70__HDWorkoutBuilderServer__notifySourcesOfTransitionFromState_toState___block_invoke;
      v29 = &unk_1E6D0B838;
      v30 = self;
      v31 = v24;
      v32 = v26;
      dispatch_async(upstreamQueue, v28);
    }
  }
  -[HKStateMachine enqueueEvent:date:error:completion:](self->_stateMachine, "enqueueEvent:date:error:completion:", self->_targetConstructionState, 0, 0, &__block_literal_global_404_0, *(_QWORD *)v28, *(_OWORD *)&v28[8]);

}

- (void)_lock_pushCurrentConstructionState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD v8[5];

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 136), "currentState");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "client");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__HDWorkoutBuilderServer__lock_pushCurrentConstructionState__block_invoke;
    v8[3] = &unk_1E6CE8030;
    v8[4] = a1;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v2, "index");
    if (v6 > 8)
      v7 = 4;
    else
      v7 = qword_1B7F55F30[v6];
    objc_msgSend(v5, "clientRemote_stateDidChange:startDate:endDate:", v7, *(_QWORD *)(a1 + 200), *(_QWORD *)(a1 + 208));

  }
}

void __70__HDWorkoutBuilderServer__notifySourcesOfTransitionFromState_toState___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 120), "allSourceProcessors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "workoutDataDestination:didChangeFromState:toState:", a1[4], a1[5], a1[6]);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __62__HDWorkoutBuilderServer__notifySourcesOfConfigurationUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "allSourceProcessors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "workoutDataDestination:didUpdateConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __56__HDWorkoutBuilderServer__notifySourcesOfInsertedEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "allSourceProcessors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "workoutDataDestination:didInsertEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)remote_setTargetConstructionState:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  NSDate *v13;
  NSDate *workoutStartDate;
  HKObserverSet *dataAccumulatorObservers;
  char v16;
  uint64_t v17;
  NSObject *v18;
  NSDate *v19;
  NSDate *workoutEndDate;
  uint64_t v21;
  void *v22;
  void *v23;
  BOOL v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  void *v29;
  HKStateMachine *stateMachine;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  _BYTE *v39;
  _QWORD v40[5];
  _QWORD v41[6];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  _QWORD v46[5];
  id v47;
  id v48;
  uint64_t v49;
  char v50;
  char v51;
  id v52;
  uint8_t v53[4];
  HDWorkoutBuilderServer *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  _BYTE buf[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  HDWorkoutBuilderServer *v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  _HKLoggingActionCompletion();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  if (v9 && !self->_workoutStartDate)
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Start date set: %{public}@", buf, 0x16u);
    }
    v13 = (NSDate *)objc_msgSend(v9, "copy");
    workoutStartDate = self->_workoutStartDate;
    self->_workoutStartDate = v13;

    dataAccumulatorObservers = self->_dataAccumulatorObservers;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __50__HDWorkoutBuilderServer__lock_didUpdateStartDate__block_invoke;
    v60 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6D0BA08;
    v61 = self;
    -[HKObserverSet notifyObservers:](dataAccumulatorObservers, "notifyObservers:", buf);
    v11 = 1;
    if (!v10)
      goto LABEL_9;
  }
  else
  {
    v11 = 0;
    if (!v10)
      goto LABEL_9;
  }
  if (!self->_workoutEndDate)
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) End date set: %{public}@", buf, 0x16u);
    }
    v19 = (NSDate *)objc_msgSend(v10, "copy");
    workoutEndDate = self->_workoutEndDate;
    self->_workoutEndDate = v19;

    _HKCalculateWorkoutDuration();
    v17 = v21;
    os_unfair_lock_unlock(&self->_lock);
    v16 = 1;
    goto LABEL_14;
  }
LABEL_9:
  os_unfair_lock_unlock(&self->_lock);
  if (!v11)
    goto LABEL_18;
  v16 = 0;
  v17 = 0;
LABEL_14:
  -[HDStandardTaskServer profile](self, "profile");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "database");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke;
  v46[3] = &unk_1E6D0B860;
  v46[4] = self;
  v47 = v9;
  v48 = v10;
  v49 = v17;
  v50 = v11;
  v51 = v16;
  v24 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v23, &v52, v46);
  v25 = v52;

  -[HDWorkoutBuilderServer _updateStatisticsPauseResumeMask]((uint64_t)self);
  -[HDWorkoutBuilderServer _didChangeElapsedTimeBasis](self);
  if (!v24)
  {
    _HKInitializeLogging();
    v26 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v25;
      _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "%{public}@: (#w0) Failed to persist updated start/end dates for workout builder: %{public}@", buf, 0x16u);
    }
  }

LABEL_18:
  os_unfair_lock_lock(&self->_lock);
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v60 = __Block_byref_object_copy__171;
  v61 = (HDWorkoutBuilderServer *)__Block_byref_object_dispose__171;
  v62 = 0;
  if (self->_targetConstructionState != a3)
  {
    _HKInitializeLogging();
    v27 = (id)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HKWorkoutBuilderConstructionStateToString();
      v28 = (id)objc_claimAutoreleasedReturnValue();
      HKWorkoutBuilderConstructionStateToString();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v53 = 138543874;
      v54 = self;
      v55 = 2114;
      v56 = v28;
      v57 = 2114;
      v58 = v29;
      _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) Target state changed: %{public}@ -> %{public}@", v53, 0x20u);

    }
    self->_targetConstructionState = a3;
    stateMachine = self->_stateMachine;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke_407;
    v41[3] = &unk_1E6D0B888;
    v41[4] = &v42;
    v41[5] = buf;
    -[HKStateMachine enqueueEvent:date:error:completion:](stateMachine, "enqueueEvent:date:error:completion:", a3, 0, 0, v41);
    if (!*((_BYTE *)v43 + 24))
      -[HDWorkoutBuilderServer _lock_failWithError:]((uint64_t)self, *(void **)(*(_QWORD *)&buf[8] + 40));
  }
  os_unfair_lock_unlock(&self->_lock);
  -[HDStandardTaskServer client](self, "client");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "connection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke_2;
  v40[3] = &unk_1E6CE8030;
  v40[4] = self;
  objc_msgSend(v32, "remoteObjectProxyWithErrorHandler:", v40);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke_408;
  v36[3] = &unk_1E6D0B8B0;
  v34 = v35;
  v37 = v34;
  v38 = &v42;
  v39 = buf;
  objc_msgSend(v33, "clientRemote_synchronizeWithCompletion:", v36);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v42, 8);

}

BOOL __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  v5 = a2;
  v6 = objc_alloc(MEMORY[0x1E0CB6DD8]);
  objc_msgSend(*(id *)(a1 + 32), "taskUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "workoutConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", v7, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184), 0, *(double *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), 0);

  v10 = (!*(_BYTE *)(a1 + 64)
      || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setStartDate:transaction:error:", *(_QWORD *)(a1 + 40), v5, a3)&& objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "insertPrimaryWorkoutActivity:transaction:error:", v9, v5, a3))&& (!*(_BYTE *)(a1 + 65)|| objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setEndDate:transaction:error:", *(_QWORD *)(a1 + 48), v5, a3)&& (objc_msgSend(
            *(id *)(*(_QWORD *)(a1 + 32) + 48),
            "updateWorkoutActivityEndDate:transaction:error:",
            v9,
            v5,
            a3) & 1) != 0);

  return v10;
}

void __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke_407(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's addSamples completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __89__HDWorkoutBuilderServer_remote_setTargetConstructionState_startDate_endDate_completion___block_invoke_408(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)remote_addDataSourcesWithIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  id obj;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKDataFlowLink allSourceProcessors](self->_workoutDataFlowLink, "allSourceProcessors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v5)
  {
    v7 = v5;
    v24 = *(_QWORD *)v31;
    *(_QWORD *)&v6 = 138412290;
    v22 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v10 = v25;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v27;
LABEL_8:
          v14 = 0;
          while (1)
          {
            if (*(_QWORD *)v27 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v14), "workoutDataProcessorUUID", v22);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", v9);

            if (v16)
              break;
            if (v12 == ++v14)
            {
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
              if (v12)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          _HKInitializeLogging();
          v19 = (void *)*MEMORY[0x1E0CB5380];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
            goto LABEL_17;
          v17 = v19;
          objc_msgSend(v9, "UUIDString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v22;
          v35 = v20;
          _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "Trying to add already linked data source %@ to workout builder", buf, 0xCu);

        }
        else
        {
LABEL_14:

          -[HDWorkoutBuilderServer _addExpectedDataSourceIdentifiers:]((uint64_t)self, obj);
          -[HDStandardTaskServer profile](self, "profile");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "daemon");
          v17 = objc_claimAutoreleasedReturnValue();
          -[NSObject taskServerRegistry](v17, "taskServerRegistry");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObserver:forTaskServerUUID:queue:", self, v9, 0);

        }
LABEL_17:

        ++v8;
      }
      while (v8 != v7);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      v7 = v21;
    }
    while (v21);
  }

}

- (void)remote_removeDataSourcesWithIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  HKDataFlowLink *workoutDataFlowLink;
  void *v22;
  __int128 v23;
  id obj;
  HDWorkoutBuilderServer *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  HDWorkoutBuilderServer *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDWorkoutBuilderServer _removeExpectedDataSourceWithIdentifiers:]((uint64_t)self, v4);
  v25 = self;
  -[HKDataFlowLink allSourceProcessors](self->_workoutDataFlowLink, "allSourceProcessors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v5)
  {
    v7 = v5;
    v26 = *(_QWORD *)v33;
    *(_QWORD *)&v6 = 138543618;
    v23 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v10 = v27;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v29 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              objc_msgSend(v15, "workoutDataProcessorUUID", v23);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqual:", v9);

              if (v17)
              {
                workoutDataFlowLink = v25->_workoutDataFlowLink;
                objc_msgSend(v15, "workoutDataFlowLink");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[HKDataFlowLink removeSource:](workoutDataFlowLink, "removeSource:", v22);

                goto LABEL_17;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
            if (v12)
              continue;
            break;
          }
        }

        _HKInitializeLogging();
        v18 = (void *)*MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        {
          v19 = v18;
          objc_msgSend(v9, "UUIDString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v23;
          v37 = v25;
          v38 = 2114;
          v39 = v20;
          _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Trying to remove non linked data source %{public}@ from workout builder", buf, 0x16u);

        }
LABEL_17:
        ;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v7);
  }

}

- (void)_removeExpectedDataSourceWithIdentifiers:(uint64_t)a1
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v3 = *(void **)(a1 + 128);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hk_minus:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = v5;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 136), "currentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "index");

    if (v8 == 2)
      -[HDWorkoutBuilderServer _checkForAttachedDataSources](a1);
  }

}

- (void)remote_addSamples:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  char v7;
  id v8;
  id v9;
  id v10;
  uint64_t *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, int, void *);
  void *v18;
  HDWorkoutBuilderServer *v19;
  id v20;
  id v21;
  id v22;

  v5 = a3;
  _HKLoggingActionCompletion();
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v7 = -[HDWorkoutBuilderServer _canAddDataWithError:]((uint64_t)self, &v22);
  v8 = v22;
  if ((v7 & 1) != 0)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __55__HDWorkoutBuilderServer_remote_addSamples_completion___block_invoke;
    v18 = &unk_1E6CE7868;
    v19 = self;
    v9 = v5;
    v20 = v9;
    v10 = v6;
    v21 = v10;
    if (self)
    {
      v11 = &v15;
      v12 = v9;
      -[HDStandardTaskServer delegate](self, "delegate", v15, v16, v17, v18, v19, v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sampleSavingDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "saveSamples:withCompletion:", v12, v11);

      v10 = v21;
    }

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v8);
  }

}

- (uint64_t)_canAddDataWithError:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  if (result)
  {
    v3 = result;
    v4 = objc_msgSend((id)result, "workoutDataDestinationState");
    if (v4 >= 3)
    {
      if (v4 == 4)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v3 + 40));
        v7 = *(void **)(v3 + 56);
        if (v7)
        {
          if (a2)
            *a2 = objc_retainAutorelease(v7);
          else
            _HKLogDroppedError();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a2, 124, CFSTR("Workout builder has encountered an unexpected failure."));
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 40));
      }
      else
      {
        if (v4 == 3)
        {
          v5 = (void *)MEMORY[0x1E0CB35C8];
          v6 = CFSTR("Workout Builder is finalized.");
        }
        else
        {
          v5 = (void *)MEMORY[0x1E0CB35C8];
          v6 = CFSTR("Unexpected workout builder state.");
        }
        objc_msgSend(v5, "hk_assignError:code:description:", a2, 3, v6);
      }
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void __55__HDWorkoutBuilderServer_remote_addSamples_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  _QWORD v16[5];

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addOtherSamples:dataSource:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__HDWorkoutBuilderServer_remote_addSamples_completion___block_invoke_2;
  v16[3] = &unk_1E6CE8030;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __55__HDWorkoutBuilderServer_remote_addSamples_completion___block_invoke_410;
  v12[3] = &unk_1E6D0B8D8;
  v10 = *(id *)(a1 + 48);
  v15 = a2;
  v13 = v5;
  v14 = v10;
  v11 = v5;
  objc_msgSend(v9, "clientRemote_synchronizeWithCompletion:", v12);

}

void __55__HDWorkoutBuilderServer_remote_addSamples_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's addSamples completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __55__HDWorkoutBuilderServer_remote_addSamples_completion___block_invoke_410(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)remote_addWorkoutEvents:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  char v7;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  BOOL v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v5 = a3;
  _HKLoggingActionCompletion();
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v7 = -[HDWorkoutBuilderServer _canAddDataWithError:]((uint64_t)self, &v22);
  v8 = v22;
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    v21 = v8;
    v10 = -[HDWorkoutBuilderServer _insertWorkoutEvents:error:]((uint64_t)self, v5, (uint64_t)&v21);
    v11 = v21;

    -[HDStandardTaskServer client](self, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __61__HDWorkoutBuilderServer_remote_addWorkoutEvents_completion___block_invoke;
    v20[3] = &unk_1E6CE8030;
    v20[4] = self;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __61__HDWorkoutBuilderServer_remote_addWorkoutEvents_completion___block_invoke_412;
    v16[3] = &unk_1E6D0B8D8;
    v18 = v6;
    v19 = v10;
    v9 = v11;
    v17 = v9;
    objc_msgSend(v15, "clientRemote_synchronizeWithCompletion:", v16);

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v8);
  }

}

void __61__HDWorkoutBuilderServer_remote_addWorkoutEvents_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's addWorkoutEvents completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __61__HDWorkoutBuilderServer_remote_addWorkoutEvents_completion___block_invoke_412(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)remote_addMetadata:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  char v7;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  BOOL v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v5 = a3;
  _HKLoggingActionCompletion();
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v7 = -[HDWorkoutBuilderServer _canAddDataWithError:]((uint64_t)self, &v22);
  v8 = v22;
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    v21 = v8;
    v10 = -[HDWorkoutBuilderServer _addMetadata:error:]((os_unfair_lock *)self, v5, (uint64_t)&v21);
    v11 = v21;

    -[HDStandardTaskServer client](self, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __56__HDWorkoutBuilderServer_remote_addMetadata_completion___block_invoke;
    v20[3] = &unk_1E6CE8030;
    v20[4] = self;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __56__HDWorkoutBuilderServer_remote_addMetadata_completion___block_invoke_414;
    v16[3] = &unk_1E6D0B8D8;
    v18 = v6;
    v19 = v10;
    v9 = v11;
    v17 = v9;
    objc_msgSend(v15, "clientRemote_synchronizeWithCompletion:", v16);

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v8);
  }

}

void __56__HDWorkoutBuilderServer_remote_addMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's addMetadata completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __56__HDWorkoutBuilderServer_remote_addMetadata_completion___block_invoke_414(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)remote_removeMetadata:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  char v8;
  char v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  BOOL v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v5 = a3;
  _HKLoggingActionCompletion();
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", *MEMORY[0x1E0CB59B0]);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 4, CFSTR("Client is missing private entitlement"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v28 = 0;
  v9 = -[HDWorkoutBuilderServer _canAddDataWithError:]((uint64_t)self, &v28);
  v10 = v28;
  v11 = v10;
  if ((v9 & 1) == 0)
  {
LABEL_10:
    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v11);
    goto LABEL_11;
  }
  v27 = v10;
  v12 = v5;
  v13 = MEMORY[0x1E0C809B0];
  if (self)
  {
    os_unfair_lock_assert_not_owner(&self->_lock);
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__171;
    v36 = __Block_byref_object_dispose__171;
    v37 = 0;
    -[HDStandardTaskServer profile](self, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = __48__HDWorkoutBuilderServer__removeMetadata_error___block_invoke;
    v29[3] = &unk_1E6CEB640;
    v29[4] = self;
    v30 = v12;
    v31 = &v32;
    v16 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v15, &v27, v29);

    if (v16)
    {
      v17 = (void *)v33[5];
      if (v17)
        -[HDWorkoutBuilderServer _didUpdateMetadata:](self, v17);
    }

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  v18 = v27;
  -[HDStandardTaskServer client](self, "client");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "connection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __59__HDWorkoutBuilderServer_remote_removeMetadata_completion___block_invoke;
  v26[3] = &unk_1E6CE8030;
  v26[4] = self;
  objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __59__HDWorkoutBuilderServer_remote_removeMetadata_completion___block_invoke_418;
  v22[3] = &unk_1E6D0B8D8;
  v24 = v6;
  v25 = v16;
  v11 = v18;
  v23 = v11;
  objc_msgSend(v21, "clientRemote_synchronizeWithCompletion:", v22);

LABEL_11:
}

void __59__HDWorkoutBuilderServer_remote_removeMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's removeMetadata completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __59__HDWorkoutBuilderServer_remote_removeMetadata_completion___block_invoke_418(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)remote_addWorkoutActivity:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  char v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  char v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v5 = a3;
  _HKLoggingActionCompletion();
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v7 = -[HDWorkoutBuilderServer _canAddDataWithError:]((uint64_t)self, &v41);
  v8 = v41;
  if ((v7 & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CB6DD0];
    -[HKWorkoutBuilderConfiguration workoutConfiguration](self->_configuration, "workoutConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "activityType");
    objc_msgSend(v5, "workoutConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v9, "_workoutWithActivityType:acceptsSubActivityType:", v11, objc_msgSend(v12, "activityType"));

    if ((v9 & 1) != 0)
    {
      objc_msgSend(v5, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v8;
      v14 = -[HDWorkoutBuilderServer _validateActivityDates:error:]((uint64_t)self, v13, (uint64_t)&v40);
      v15 = v40;

      if ((v14 & 1) != 0)
      {
        objc_msgSend(v5, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v5, "startDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "hk_isBeforeOrEqualToDate:", v17);

          if (v18)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Activity end date cannot be before start date"));
            v8 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
          v39 = v15;
          v24 = -[HDWorkoutBuilderServer _validateActivityDates:error:]((uint64_t)self, v16, (uint64_t)&v39);
          v8 = v39;

          if ((v24 & 1) == 0)
            goto LABEL_13;
          v15 = v8;
        }
        v38 = v15;
        v25 = -[HDWorkoutBuilderServer _isActivityDateOverlapping:endDate:error:]((uint64_t)self, v5, v16, (uint64_t)&v38);
        v8 = v38;

        if (!v25)
        {
          v37 = v8;
          v26 = -[HDWorkoutBuilderServer _addWorkoutActivity:error:]((uint64_t)self, v5, (uint64_t)&v37);
          v27 = v37;

          if (v26)
            -[HDWorkoutBuilderServer _didUpdateActivities]((uint64_t)self);
          -[HDStandardTaskServer client](self, "client");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "connection");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = MEMORY[0x1E0C809B0];
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __63__HDWorkoutBuilderServer_remote_addWorkoutActivity_completion___block_invoke;
          v36[3] = &unk_1E6CE8030;
          v36[4] = self;
          objc_msgSend(v29, "remoteObjectProxyWithErrorHandler:", v36);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v32[0] = v30;
          v32[1] = 3221225472;
          v32[2] = __63__HDWorkoutBuilderServer_remote_addWorkoutActivity_completion___block_invoke_425;
          v32[3] = &unk_1E6D0B8D8;
          v34 = v6;
          v35 = v26;
          v8 = v27;
          v33 = v8;
          objc_msgSend(v31, "clientRemote_synchronizeWithCompletion:", v32);

          goto LABEL_17;
        }
LABEL_13:
        ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v8);
LABEL_17:

        goto LABEL_18;
      }
      ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v15);
      v8 = v15;
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "workoutConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "activityType"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hk_error:format:", 3, CFSTR("Cannot add subactivity of type %@"), v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v6[2](v6, 0, v23);
      v8 = (id)v23;
    }
  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v8);
  }
LABEL_18:

}

- (uint64_t)_validateActivityDates:(uint64_t)a3 error:
{
  id v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a2;
  if (!a1)
    goto LABEL_14;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    v8 = CFSTR("Activity cannot start or end with date in distant past.");
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    v8 = CFSTR("Activity cannot start or end with date in distant future.");
    goto LABEL_13;
  }
  if ((objc_msgSend(v5, "hk_isBeforeDate:", *(_QWORD *)(a1 + 200)) & 1) != 0)
  {
    v8 = CFSTR("Activity cannot start or end before Workout start.");
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 3, v8);
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  if ((objc_msgSend(v5, "hk_isAfterDate:", *(_QWORD *)(a1 + 208)) & 1) != 0)
  {
    v8 = CFSTR("Activity cannot start or end after Workout end.");
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 136), "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "index");

  if (v10 != 1)
  {
    v8 = CFSTR("Activity cannot start or end, builder is not active");
    goto LABEL_13;
  }
  v11 = 1;
LABEL_15:

  return v11;
}

- (uint64_t)_isActivityDateOverlapping:(void *)a3 endDate:(uint64_t)a4 error:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v31 = 0;
    goto LABEL_24;
  }
  objc_msgSend(*(id *)(a1 + 192), "allValues");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v10)
  {
    v31 = 0;
    goto LABEL_23;
  }
  v11 = v10;
  v33 = a4;
  v12 = *(_QWORD *)v35;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v35 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      objc_msgSend(v14, "endDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v14, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "endDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v16, "initWithStartDate:endDate:", v17, v18);

        if (v8)
        {
          v20 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v7, "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v20, "initWithStartDate:endDate:", v21, v8);

          objc_msgSend(v22, "intersectionWithDateInterval:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "duration");
          v25 = v24;

          if (v25 != 0.0)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", v33, 3, CFSTR("Activity date cannot overlap existing activities"));

            goto LABEL_21;
          }

        }
        objc_msgSend(v7, "startDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "endDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "isEqualToDate:", v27);

        if ((v28 & 1) != 0)
        {
          v31 = 0;
LABEL_22:

          goto LABEL_23;
        }
        objc_msgSend(v7, "startDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v19, "containsDate:", v29);

        if (!v30)
        {

          continue;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", v33, 3, CFSTR("Activity date cannot overlap existing activities "));
LABEL_21:
        v31 = 1;
        goto LABEL_22;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    v31 = 0;
    if (v11)
      continue;
    break;
  }
LABEL_23:

LABEL_24:
  return v31;
}

void __63__HDWorkoutBuilderServer_remote_addWorkoutActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's addWorkoutActivity completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __63__HDWorkoutBuilderServer_remote_addWorkoutActivity_completion___block_invoke_425(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)remote_updateActivityWithUUID:(id)a3 endDate:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  id v14;
  void *v15;
  int v16;
  char v17;
  id v18;
  int v19;
  id v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  char v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;

  v7 = a3;
  v8 = a4;
  _HKLoggingActionCompletion();
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_workoutActivitiesByUUID, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = CFSTR("Activity already has end date set.");
LABEL_3:
    objc_msgSend(v12, "hk_error:description:", 3, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v14);
    goto LABEL_5;
  }
  if (v8)
  {
    objc_msgSend(v10, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "hk_isBeforeOrEqualToDate:", v15);

    if (v16)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = CFSTR("Activity end date cannot be before or equal to start date.");
      goto LABEL_3;
    }
  }
  v34 = 0;
  v17 = -[HDWorkoutBuilderServer _validateActivityDates:error:]((uint64_t)self, v8, (uint64_t)&v34);
  v18 = v34;
  v14 = v18;
  if ((v17 & 1) == 0)
    goto LABEL_4;
  v33 = v18;
  v19 = -[HDWorkoutBuilderServer _isActivityDateOverlapping:endDate:error:]((uint64_t)self, v10, v8, (uint64_t)&v33);
  v20 = v33;

  if (v19)
  {
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v20);
    v14 = v20;
  }
  else
  {
    v32 = v20;
    v21 = -[HDWorkoutBuilderServer _endActivityWithUUID:endDate:error:]((uint64_t)self, v7, v8, &v32);
    v22 = v32;

    if (v21)
      -[HDWorkoutBuilderServer _didUpdateActivities]((uint64_t)self);
    -[HDStandardTaskServer client](self, "client");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "connection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __75__HDWorkoutBuilderServer_remote_updateActivityWithUUID_endDate_completion___block_invoke;
    v31[3] = &unk_1E6CE8030;
    v31[4] = self;
    objc_msgSend(v24, "remoteObjectProxyWithErrorHandler:", v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = v25;
    v27[1] = 3221225472;
    v27[2] = __75__HDWorkoutBuilderServer_remote_updateActivityWithUUID_endDate_completion___block_invoke_431;
    v27[3] = &unk_1E6D0B8D8;
    v29 = v9;
    v30 = v21;
    v14 = v22;
    v28 = v14;
    objc_msgSend(v26, "clientRemote_synchronizeWithCompletion:", v27);

  }
LABEL_5:

}

void __75__HDWorkoutBuilderServer_remote_updateActivityWithUUID_endDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's updateActivityWithUUID:endDate: completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __75__HDWorkoutBuilderServer_remote_updateActivityWithUUID_endDate_completion___block_invoke_431(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)remote_updateActivityWithUUID:(id)a3 addMetadata:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  char v21;
  _QWORD v22[5];
  id v23;

  v7 = a4;
  v8 = a3;
  _HKLoggingActionCompletion();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v10 = -[HDWorkoutBuilderServer _updateActivityWithUUID:addMetadata:error:]((uint64_t)self, v8, v7, &v23);

  v11 = v23;
  if (v10)
    -[HDWorkoutBuilderServer _didUpdateActivities]((uint64_t)self);
  -[HDStandardTaskServer client](self, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __79__HDWorkoutBuilderServer_remote_updateActivityWithUUID_addMetadata_completion___block_invoke;
  v22[3] = &unk_1E6CE8030;
  v22[4] = self;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __79__HDWorkoutBuilderServer_remote_updateActivityWithUUID_addMetadata_completion___block_invoke_433;
  v18[3] = &unk_1E6D0B8D8;
  v21 = v10;
  v19 = v11;
  v20 = v9;
  v16 = v11;
  v17 = v9;
  objc_msgSend(v15, "clientRemote_synchronizeWithCompletion:", v18);

}

void __79__HDWorkoutBuilderServer_remote_updateActivityWithUUID_addMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Client's updateActivityWithUUID:addMetadata: completion handler not called, error fetching client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __79__HDWorkoutBuilderServer_remote_updateActivityWithUUID_addMetadata_completion___block_invoke_433(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __60__HDWorkoutBuilderServer__lock_pushCurrentConstructionState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't flush data to client with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)remote_recoverWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[HDWorkoutBuilderServer _lock_pushCurrentConstructionState]((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
  -[HDStandardTaskServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__HDWorkoutBuilderServer_remote_recoverWithCompletion___block_invoke;
  v12[3] = &unk_1E6CE8030;
  v12[4] = self;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __55__HDWorkoutBuilderServer_remote_recoverWithCompletion___block_invoke_434;
  v10[3] = &unk_1E6CE77F0;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "clientRemote_synchronizeWithCompletion:", v10);

}

void __55__HDWorkoutBuilderServer_remote_recoverWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't flush data to client with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __55__HDWorkoutBuilderServer_remote_recoverWithCompletion___block_invoke_434(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remote_updateDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  HDWorkoutBuilderServer *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  HDWorkoutBuilderServer *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v6, "deviceEntityForDevice:error:", v4, &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;

  if (v7)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v8;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __46__HDWorkoutBuilderServer_remote_updateDevice___block_invoke;
    v18 = &unk_1E6CE7950;
    v19 = self;
    v20 = v7;
    v11 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v10, &v21, &v15);
    v12 = v21;

    if (v11)
    {
      os_unfair_lock_lock(&self->_lock);
      -[HKWorkoutBuilderConfiguration setDevice:](self->_configuration, "setDevice:", v4, v15, v16, v17, v18, v19);
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v24 = self;
        v25 = 2114;
        v26 = v12;
        _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update device: %{public}@", buf, 0x16u);
      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v24 = self;
      v25 = 2114;
      v26 = v4;
      v27 = 2114;
      v28 = v8;
      _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to find device entity for device: %{public}@. Error %{public}@", buf, 0x20u);
    }
    v12 = v8;
  }

}

uint64_t __46__HDWorkoutBuilderServer_remote_updateDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setDeviceEntity:transaction:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (void)remote_setStatisticsMergeStrategy:(unint64_t)a3 forType:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;

  v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  v6 = _HKStatisticsComputationMethodForQuantityType(v8, 0);
  v7 = -[HDWorkoutBuilderServer _lock_statisticsCalculatorsForQuantityType:mergeStrategy:computationMethod:]((uint64_t)self, v8, a3, v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)_lock_statisticsCalculatorsForQuantityType:(uint64_t)a3 mergeStrategy:(uint64_t)a4 computationMethod:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend((id)a1, "taskUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    objc_msgSend(*(id *)(a1 + 192), "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v34;
      v29 = *(_QWORD *)v34;
      do
      {
        v16 = 0;
        v32 = v14;
        do
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v16);
          objc_msgSend(*(id *)(a1 + 88), "calculatorForQuantityType:activityUUID:", v5, v17, v29);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            v19 = *(id *)(a1 + 200);
            objc_msgSend((id)a1, "taskUUID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v17, "isEqual:", v20);

            if ((v21 & 1) != 0)
            {
              v22 = 0;
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 192), "objectForKeyedSubscript:", v17);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "startDate");
              v24 = v5;
              v25 = v12;
              v26 = v9;
              v27 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v23, "endDate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              v19 = (id)v27;
              v9 = v26;
              v12 = v25;
              v5 = v24;
              v15 = v29;
            }
            -[HDWorkoutBuilderServer _lock_createStatisticsCalculatorsForQuantityType:mergeStrategy:computationMethod:startDate:endDate:](a1, v5, a3, a4, v19, v22);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 88), "setCalculator:forQuantityType:activityUUID:", v18, v5, v17);

            v14 = v32;
          }
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v14);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)remote_setStatisticsComputationMethod:(int64_t)a3 forType:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[HDWorkoutBuilderServer _lock_statisticsCalculatorsForQuantityType:mergeStrategy:computationMethod:]((uint64_t)self, v7, 0, a3);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)remote_setShouldCollectEvents:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HKWorkoutBuilderConfiguration setShouldCollectWorkoutEvents:](self->_configuration, "setShouldCollectWorkoutEvents:", v3);
  os_unfair_lock_unlock(p_lock);
}

- (void)remote_currentZonesForType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *upstreamQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  upstreamQueue = self->_upstreamQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HDWorkoutBuilderServer_remote_currentZonesForType_completion___block_invoke;
  block[3] = &unk_1E6CECC58;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(upstreamQueue, block);

}

void __64__HDWorkoutBuilderServer_remote_currentZonesForType_completion___block_invoke(_QWORD *a1)
{
  id *v2;
  char v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (id *)a1[4];
  v7 = 0;
  v3 = -[HDWorkoutBuilderServer _associateZonesSamplesIfNeededWithError:](v2, &v7);
  v4 = v7;
  v5 = a1[6];
  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[4] + 224), "objectForKeyedSubscript:", a1[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, id))(v5 + 16))(a1[6], 0, v4);
  }

}

uint64_t __54__HDWorkoutBuilderServer__updateWorkoutConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setWorkoutConfiguration:transaction:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (id)currentMetadata
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_metadata, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

uint64_t __45__HDWorkoutBuilderServer__addMetadata_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  os_unfair_lock_s *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v5 = (os_unfair_lock_s *)(a1[4] + 40);
  v6 = a2;
  os_unfair_lock_lock(v5);
  v7 = *(void **)(a1[4] + 176);
  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = a1[4];
    v10 = *(void **)(v9 + 176);
    *(_QWORD *)(v9 + 176) = v8;

    v7 = *(void **)(a1[4] + 176);
  }
  objc_msgSend(v7, "addEntriesFromDictionary:", a1[5]);
  v11 = objc_msgSend(*(id *)(a1[4] + 176), "copy");
  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = objc_msgSend(*(id *)(a1[4] + 48), "setMetadata:transaction:error:", *(_QWORD *)(a1[4] + 176), v6, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 40));
  return v14;
}

uint64_t __48__HDWorkoutBuilderServer__removeMetadata_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 40));
  v6 = *(void **)(a1[4] + 176);
  if (v6
    && (objc_msgSend(v6, "objectForKeyedSubscript:", a1[5]),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    objc_msgSend(*(id *)(a1[4] + 176), "removeObjectForKey:", a1[5]);
    v8 = objc_msgSend(*(id *)(a1[4] + 176), "copy");
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = objc_msgSend(*(id *)(a1[4] + 48), "setMetadata:transaction:error:", *(_QWORD *)(a1[4] + 176), v5, a3);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 40));
  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      v13 = a1[4];
      v14 = a1[5];
      v16 = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_INFO, "%{public}@: Empty or metadata for %{public}@ does not exist", (uint8_t *)&v16, 0x16u);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 40));
    v11 = 1;
  }

  return v11;
}

void __45__HDWorkoutBuilderServer__didUpdateMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of updated metadata with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __45__HDWorkoutBuilderServer__didUpdateMetadata___block_invoke_435(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "workoutDataAccumulator:didUpdateMetadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __52__HDWorkoutBuilderServer__didChangeElapsedTimeBasis__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of elapsed time basis change with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __53__HDWorkoutBuilderServer__insertWorkoutEvents_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  int v30;
  uint64_t v31;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v34 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", *(_QWORD *)(a1 + 40));
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v7 + 184))
  {
    objc_msgSend(v5, "addObjectsFromArray:");
    v7 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 40));
  objc_msgSend(v6, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v44;
    v14 = 1;
    v15 = CFSTR("Consecutive pause events.");
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(v10);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "type");
        if (v17 == 2)
        {
          if (v14 == 1)
          {
            v15 = CFSTR("Consecutive resume events.");
LABEL_36:
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, v15);

            v31 = 0;
            goto LABEL_39;
          }
          v14 = 1;
        }
        else if (v17 == 1)
        {
          if (v14 == 2)
            goto LABEL_36;
          v14 = 2;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (v12)
        continue;
      break;
    }
  }
  v33 = v6;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v18 = *(id *)(a1 + 40);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v40;
    while (2)
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "containsObject:", v23) & 1) == 0
          && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "insertWorkoutEvent:transaction:error:", v23, v34, a3))
        {

          v31 = 0;
          goto LABEL_38;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (v20)
        continue;
      break;
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), v9);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v24 = *(id *)(*(_QWORD *)(a1 + 32) + 192);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "_filterAndSetWorkoutEvents:", v10);

        if (v30)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v26);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v31 = 1;
LABEL_38:
  v6 = v33;
LABEL_39:

  return v31;
}

void __43__HDWorkoutBuilderServer__didUpdateEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of updated events with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __43__HDWorkoutBuilderServer__didUpdateEvents___block_invoke_443(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "workoutDataAccumulator:didUpdateEvents:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

BOOL __52__HDWorkoutBuilderServer__addWorkoutActivity_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__HDWorkoutBuilderServer__addWorkoutActivity_error___block_invoke_2;
  v11[3] = &unk_1E6CEB640;
  v6 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 48);
  v12 = v7;
  v13 = v8;
  v9 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v5, a2, v11);

  return v9;
}

BOOL __52__HDWorkoutBuilderServer__addWorkoutActivity_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _BOOL8 v31;
  uint64_t v33;
  id v34;
  id obj;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "insertWorkoutActivity:transaction:error:", *(_QWORD *)(a1 + 40), v5, a3))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v33 = a1;
    v7 = *(id *)(a1 + 40);
    v34 = v5;
    v38 = v5;
    if (v6)
    {
      os_unfair_lock_assert_owner((const os_unfair_lock *)(v6 + 40));
      v36 = objc_alloc_init(MEMORY[0x1E0CB6E00]);
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend(*(id *)(v6 + 88), "allQuantityTypes");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (!v39)
        goto LABEL_24;
      v37 = *(_QWORD *)v43;
      while (1)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v43 != v37)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v8);
          v10 = _HKStatisticsComputationMethodForQuantityType(v9, 0);
          objc_msgSend(v7, "startDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "endDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDWorkoutBuilderServer _lock_createStatisticsCalculatorsForQuantityType:mergeStrategy:computationMethod:startDate:endDate:](v6, v9, 0, v10, v11, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = *(void **)(v6 + 88);
          objc_msgSend(v7, "UUID");
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setCalculator:forQuantityType:activityUUID:", v13, v9, v15);

          v41 = 0;
          LOBYTE(v15) = objc_msgSend(v13, "invalidateInterval:error:", 0, &v41);
          v16 = v41;
          if ((v15 & 1) == 0)
          {
            _HKInitializeLogging();
            v17 = *MEMORY[0x1E0CB5380];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v47 = v6;
              v48 = 2114;
              v49 = v16;
              _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to invalidate calculator: %{public}@", buf, 0x16u);
            }
          }
          objc_msgSend(v13, "currentStatistics", v33);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *(void **)(v6 + 48);
          objc_msgSend(v7, "UUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0;
          LOBYTE(v19) = objc_msgSend(v19, "storeStatisticsCalculator:anchor:activityUUID:transaction:error:", v13, 0, v20, v38, &v40);
          v21 = v40;

          if ((v19 & 1) == 0
            && (_HKInitializeLogging(),
                v22 = *MEMORY[0x1E0CB5380],
                os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR)))
          {
            *(_DWORD *)buf = 138543618;
            v47 = v6;
            v48 = 2114;
            v49 = v21;
            _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist statistics: %{public}@", buf, 0x16u);
            if (!v18)
              goto LABEL_19;
          }
          else if (!v18)
          {
            goto LABEL_19;
          }
          objc_msgSend(v7, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v7, "startDate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "_setStartDate:", v24);

          }
          objc_msgSend(v7, "endDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v7, "endDate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "_setEndDate:", v26);

          }
          objc_msgSend(v7, "UUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addActivityStatistics:forType:activityUUID:", v18, v9, v27);

LABEL_19:
          ++v8;
        }
        while (v39 != v8);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        v39 = v28;
        if (!v28)
        {
LABEL_24:

          goto LABEL_25;
        }
      }
    }
    v36 = 0;
LABEL_25:

    a1 = v33;
    v29 = *(_QWORD *)(*(_QWORD *)(v33 + 48) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v36;

    v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v33 + 48) + 8) + 40) != 0;
    v5 = v34;
  }
  else
  {
    v31 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));

  return v31;
}

void __51__HDWorkoutBuilderServer__lock_didUpdateActivities__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of updated activities with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __46__HDWorkoutBuilderServer__didUpdateActivities__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of updated activities with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __51__HDWorkoutBuilderServer__updateActivitiesDuration__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "updateWorkoutActivityEndDate:transaction:error:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), v5, a3, (_QWORD)v13))
        {
          v11 = 0;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  return v11;
}

uint64_t __68__HDWorkoutBuilderServer__updateActivityWithUUID_addMetadata_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  os_unfair_lock_s *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v5 = (os_unfair_lock_s *)(a1[4] + 40);
  v6 = a2;
  os_unfair_lock_lock(v5);
  objc_msgSend(*(id *)(a1[4] + 192), "objectForKeyedSubscript:", a1[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v8, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  if (!v10)
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "addEntriesFromDictionary:", a1[6]);
  objc_msgSend(v8, "_setMetadata:", v10);
  v11 = objc_msgSend(*(id *)(a1[4] + 48), "updateWorkoutActivityMetadata:transaction:error:", v8, v6, a3);

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 40));
  return v11;
}

uint64_t __76__HDWorkoutBuilderServer__attemptRequeryForInvalidatedStatisticsCalculators__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id obj;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "allObjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        v8 = *(void **)(a1 + 40);
        v9 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
        v12[0] = v5;
        v12[1] = 3221225472;
        v12[2] = __76__HDWorkoutBuilderServer__attemptRequeryForInvalidatedStatisticsCalculators__block_invoke_2;
        v12[3] = &unk_1E6D0B928;
        v13 = v8;
        v14 = v7;
        v15 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v9, "enumerateCalculatorsForQuantityType:handler:", v7, v12);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeObject:", v7);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  return 1;
}

uint64_t __76__HDWorkoutBuilderServer__attemptRequeryForInvalidatedStatisticsCalculators__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0;
  v4 = objc_msgSend(v3, "invalidateInterval:error:", 0, &v11);
  v5 = v11;
  if (v4)
  {
    objc_msgSend(v3, "currentStatistics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "addWorkoutStatistics:forType:", v6, *(_QWORD *)(a1 + 40));

  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v5;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to requery for samples of type %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return 1;
}

void __53__HDWorkoutBuilderServer__fetchZonesByTypeWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "sampleType");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

uint64_t __81__HDWorkoutBuilderServer__lock_updateStatisticsWithQuantities_transaction_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "hdw_dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hdw_dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __81__HDWorkoutBuilderServer__lock_updateStatisticsWithQuantities_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v8, "hdw_quantity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValueForUnit:", *(_QWORD *)(a1 + 40));
        v11 = v10;

        v12 = *(void **)(a1 + 48);
        objc_msgSend(v8, "hdw_startTimestamp");
        v14 = v13;
        objc_msgSend(v8, "hdw_endTimestamp");
        v16 = v15;
        objc_msgSend(v8, "hdw_sample");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sourceRevision");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "source");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_sourceID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = objc_msgSend(v12, "addSampleValue:startTime:endTime:sourceID:error:", objc_msgSend(v20, "longLongValue"), a2, v11, v14, v16);

        if (!(_DWORD)v12)
        {
          v21 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v5)
        continue;
      break;
    }
  }
  v21 = 1;
LABEL_11:

  return v21;
}

- (id)_lock_createStatisticsCalculatorsForQuantityType:(uint64_t)a3 mergeStrategy:(uint64_t)a4 computationMethod:(void *)a5 startDate:(void *)a6 endDate:
{
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = a2;
  v14 = objc_msgSend(v13, "aggregationStyle");
  if (v14 > 3)
    v15 = 0;
  else
    v15 = qword_1B7F55F78[v14];
  +[HDStatisticsCollectionCalculator calculatorForQuantityType:intervalCollection:options:mergeStrategy:computationMethod:](HDStatisticsCollectionCalculator, "calculatorForQuantityType:intervalCollection:options:mergeStrategy:computationMethod:", v13, 0, v15, a3, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDWorkoutBuilderServer _lock_sourceOrderProviderForQuantityType:](a1, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSourceOrderProvider:", v17);

  -[HDWorkoutBuilderServer _lock_statisticsDataSourceForQuantityType:](a1, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDataSource:", v18);

  -[HDWorkoutBuilderServer _lock_maskedIntervalsForStatisticsOfType:startDate:endDate:](a1, v13, v11, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v20 = objc_msgSend(v16, "setMaskedIntervals:error:", v19, &v25);
  v21 = v25;
  if ((v20 & 1) == 0
    && (_HKInitializeLogging(),
        v22 = *MEMORY[0x1E0CB5380],
        os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR)))
  {
    *(_DWORD *)buf = 138543618;
    v27 = a1;
    v28 = 2114;
    v29 = v21;
    _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error setting statistics masking intervals immediately after calculator creation: %{public}@", buf, 0x16u);
    if (!v11)
      goto LABEL_9;
  }
  else if (!v11)
  {
    goto LABEL_9;
  }
  objc_msgSend(v16, "configureMergeAnchor:", v11);
  if (v12)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v11, v12);
    objc_msgSend(v16, "setDateInterval:", v23);

  }
LABEL_9:

  return v16;
}

- (id)_lock_maskedIntervalsForStatisticsOfType:(void *)a3 startDate:(void *)a4 endDate:
{
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = a2;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    v10 = objc_msgSend(*(id *)(a1 + 80), "containsObject:", v9);

    if ((v10 & 1) != 0)
    {
      a1 = MEMORY[0x1E0C9AA60];
    }
    else
    {
      _HKPausedIntervalsWithWorkoutEvents();
      a1 = objc_claimAutoreleasedReturnValue();
    }
    if (v7)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB65A8]);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v7);

      v23[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObjectsFromArray:", a1);
      v15 = objc_claimAutoreleasedReturnValue();

      a1 = v15;
    }
    if (v8)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB65A8]);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithStartDate:endDate:", v8, v17);

      v22 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "arrayByAddingObjectsFromArray:", a1);
      v20 = objc_claimAutoreleasedReturnValue();

      a1 = v20;
    }
  }

  return (id)a1;
}

void __47__HDWorkoutBuilderServer__didUpdateStatistics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of updated statistics with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __47__HDWorkoutBuilderServer__didUpdateStatistics___block_invoke_473(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "workoutStatistics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workoutDataAccumulator:didUpdateStatistics:", v3, v4);

  }
}

void __44__HDWorkoutBuilderServer__didFinishRecovery__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify Workout Builder Server client of finished recovery with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 40));
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__171;
  v21 = __Block_byref_object_dispose__171;
  v22 = 0;
  v2 = objc_alloc_init(MEMORY[0x1E0CB6E00]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke_2;
  v14[3] = &unk_1E6D0B9B8;
  v14[4] = v3;
  v16 = &v17;
  v5 = v2;
  v15 = v5;
  objc_msgSend(v4, "enumerateCalculatorsWithHandler:", v14);
  if (objc_msgSend((id)v18[5], "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = (id)v18[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
      }
      while (v7);
    }

  }
  -[HDWorkoutBuilderServer _didUpdateStatistics:](*(_QWORD **)(a1 + 32), v5);

  _Block_object_dispose(&v17, 8);
}

uint64_t __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;
  int v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(id *)(*(_QWORD *)(a1 + 32) + 200);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "startDate");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)v13;
  }
  else
  {
    v14 = 0;
  }
  -[HDWorkoutBuilderServer _lock_maskedIntervalsForStatisticsOfType:startDate:endDate:](*(_QWORD *)(a1 + 32), v8, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v7, "configureMergeAnchor:", v10);
  objc_msgSend(v7, "maskedIntervals");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", v15);

  if ((v17 & 1) == 0)
  {
    v31 = 0;
    v18 = objc_msgSend(v7, "setMaskedIntervals:error:", v15, &v31);
    v19 = v31;
    if ((v18 & 1) != 0)
    {
      objc_msgSend(v7, "currentStatistics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v30 = v19;
        objc_msgSend(*(id *)(a1 + 32), "taskUUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v9, "isEqual:", v21);

        if (v29)
        {
          objc_msgSend(*(id *)(a1 + 40), "addWorkoutStatistics:forType:", v20, v8);
          v19 = v30;
        }
        else
        {
          if (v10)
            objc_msgSend(v20, "_setStartDate:", v10);
          v19 = v30;
          if (v14)
            objc_msgSend(v20, "_setEndDate:", v14);
          objc_msgSend(*(id *)(a1 + 40), "addActivityStatistics:forType:activityUUID:", v20, v8, v9);
        }
      }

    }
    else
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        v28 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v33 = v28;
        v34 = 2114;
        v35 = v8;
        v36 = 2114;
        v37 = v19;
        _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to requery after interval mask update for type %{public}@: %{public}@", buf, 0x20u);
      }
      v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v23)
      {
        v24 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v26 = *(void **)(v25 + 40);
        *(_QWORD *)(v25 + 40) = v24;

        v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      objc_msgSend(v23, "addObject:", v8);
    }

  }
  return 1;
}

uint64_t __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke_477(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  return 1;
}

uint64_t __58__HDWorkoutBuilderServer__updateStatisticsPauseResumeMask__block_invoke_2_478(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  return 1;
}

uint64_t __58__HDWorkoutBuilderServer__currentStatisticsByQuantityType__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(a2, "currentStatistics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

  return 1;
}

void __50__HDWorkoutBuilderServer__lock_didUpdateStartDate__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "workoutDataAccumulator:didUpdateStartDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200));

}

- (void)addSampleObserver:(id)a3
{
  -[HKObserverSet registerObserver:](self->_sampleObservers, "registerObserver:", a3);
}

- (void)removeSampleObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_sampleObservers, "unregisterObserver:", a3);
}

- (BOOL)enumerateSamplesOfTypes:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8;
  HDWorkoutBuilderEntity *persistentEntity;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  persistentEntity = self->_persistentEntity;
  v10 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__HDWorkoutBuilderServer_enumerateSamplesOfTypes_error_handler___block_invoke;
  v14[3] = &unk_1E6D0BA30;
  v15 = v8;
  v12 = v8;
  LOBYTE(a4) = -[HDWorkoutBuilderEntity enumerateAssociatedSamplesOfTypes:interval:profile:error:sampleHandler:](persistentEntity, "enumerateAssociatedSamplesOfTypes:interval:profile:error:sampleHandler:", v10, 0, v11, a4, v14);

  return (char)a4;
}

uint64_t __64__HDWorkoutBuilderServer_enumerateSamplesOfTypes_error_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

- (BOOL)enumerateQuantitiesOfType:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8;
  id v9;
  HDWorkoutBuilderEntity *persistentEntity;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  v9 = a5;
  persistentEntity = self->_persistentEntity;
  -[HDStandardTaskServer profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__HDWorkoutBuilderServer_enumerateQuantitiesOfType_error_handler___block_invoke;
  v15[3] = &unk_1E6D0BA58;
  v16 = v8;
  v17 = v9;
  v12 = v8;
  v13 = v9;
  LOBYTE(a4) = -[HDWorkoutBuilderEntity enumerateAssociatedSampleValuesOfType:interval:profile:error:sampleHandler:](persistentEntity, "enumerateAssociatedSampleValuesOfType:interval:profile:error:sampleHandler:", v12, 0, v11, a4, v15);

  return (char)a4;
}

uint64_t __66__HDWorkoutBuilderServer_enumerateQuantitiesOfType_error_handler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v9 = (void *)MEMORY[0x1E0CB6A28];
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "quantityWithUnit:doubleValue:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithStart:end:", a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v10 + 16))(v10, v12, v13);

  return 1;
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6DE0], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6DE0], "clientInterface");
}

- (void)connectionInvalidated
{
  BOOL *p_invalidated;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  unsigned int v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  HDWorkoutBuilderEntity *persistentEntity;
  void *v17;
  objc_super v18;
  id v19;
  id v20;
  uint8_t buf[4];
  HDWorkoutBuilderServer *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_invalidated = &self->_invalidated;
  while (!__ldaxr((unsigned __int8 *)p_invalidated))
  {
    if (!__stlxr(1u, (unsigned __int8 *)p_invalidated))
      goto LABEL_6;
  }
  __clrex();
LABEL_6:
  -[HKWorkoutBuilderConfiguration associatedSessionUUID](self->_configuration, "associatedSessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v20 = 0;
    v11 = -[HDWorkoutBuilderServer _discardWorkoutWithError:](self, (uint64_t)&v20);
    v9 = v20;
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5380];
    v13 = *MEMORY[0x1E0CB5380];
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = self;
        _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Discarded workout on connection invalidation because no session is associated with this builder.", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v22 = self;
      v23 = 2114;
      v24 = v9;
      _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to discard unassociated builder on connection invalidation: %{public}@", buf, 0x16u);
    }
    goto LABEL_24;
  }
  -[HKWorkoutBuilderConfiguration associatedSessionUUID](self->_configuration, "associatedSessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  +[HDWorkoutSessionEntity lookupSessionWithIdentifier:profile:error:](HDWorkoutSessionEntity, "lookupSessionWithIdentifier:profile:error:", v6, v7, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;

  if (v8)
    v10 = 1;
  else
    v10 = v9 == 0;
  if (v10)
  {
    if (v8)
    {
      -[HDWorkoutBuilderServer _persistRecoveryData]((os_unfair_lock *)self);
    }
    else
    {
      persistentEntity = self->_persistentEntity;
      -[HDStandardTaskServer profile](self, "profile");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDWorkoutBuilderServer finishDetachedBuilderForEntity:sessionEndDate:profile:](HDWorkoutBuilderServer, "finishDetachedBuilderForEntity:sessionEndDate:profile:", persistentEntity, 0, v17);

    }
LABEL_24:

    v18.receiver = self;
    v18.super_class = (Class)HDWorkoutBuilderServer;
    -[HDStandardTaskServer connectionInvalidated](&v18, sel_connectionInvalidated);
    return;
  }
  _HKInitializeLogging();
  v14 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v22 = self;
    v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup associated session entity on connection invalidated; treating session as present: %{public}@",
      buf,
      0x16u);
  }
  -[HDWorkoutBuilderServer _persistRecoveryData]((os_unfair_lock *)self);

}

BOOL __50__HDWorkoutBuilderServer__finishWorkoutWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)didCreateTaskServer:(id)a3
{
  void *v4;
  id v5;
  _BOOL4 v6;
  HKDataFlowLink *workoutDataFlowLink;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  HKDataFlowLink *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _BOOL4 v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  _BOOL4 lock_isAssociatedToSession;
  HDWorkoutBuilderEntity *persistentEntity;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  _BYTE buf[24];
  void *v65;
  id v66;
  HDWorkoutBuilderServer *v67;
  id v68;
  uint64_t *v69;
  uint64_t *v70;
  uint64_t *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  if (objc_msgSend(v41, "conformsToProtocol:", &unk_1EF1A1298))
  {
    objc_msgSend(v41, "taskUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v41;
    v5 = v4;
    if (self)
    {
      os_unfair_lock_lock(&self->_lock);
      v6 = -[NSSet containsObject:](self->_expectedDataSourceUUIDs, "containsObject:", v5);
      os_unfair_lock_unlock(&self->_lock);
      if (v6)
      {
        workoutDataFlowLink = self->_workoutDataFlowLink;
        if (!workoutDataFlowLink)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupDataSource_identifier_, self, CFSTR("HDWorkoutBuilderServer.m"), 3153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_workoutDataFlowLink != nil"));

          workoutDataFlowLink = self->_workoutDataFlowLink;
        }
        -[HKDataFlowLink allSourceProcessors](workoutDataFlowLink, "allSourceProcessors");
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v60;
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v60 != v10)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "workoutDataProcessorUUID");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "isEqual:", v5);

              if (v13)
              {
                _HKInitializeLogging();
                v27 = (void *)*MEMORY[0x1E0CB5380];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
                {
                  v37 = v27;
                  objc_msgSend(v5, "UUIDString");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v38;
                  _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "Trying to add already linked data source %@ to workout builder", buf, 0xCu);

                }
                *(_QWORD *)buf = v5;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDWorkoutBuilderServer _removeExpectedDataSourceWithIdentifiers:]((uint64_t)self, v28);

                goto LABEL_30;
              }
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
            if (v9)
              continue;
            break;
          }
        }

        _HKInitializeLogging();
        v14 = (void *)*MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          v15 = v14;
          objc_msgSend(v40, "workoutDataFlowLink");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v40;
          *(_WORD *)&buf[22] = 2114;
          v65 = v16;
          _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding source %{public}@ (%{public}@)", buf, 0x20u);

        }
        v17 = self->_workoutDataFlowLink;
        objc_msgSend(v40, "workoutDataFlowLink");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKDataFlowLink addSource:](v17, "addSource:", v18);

        v55 = 0;
        v56 = &v55;
        v57 = 0x2020000000;
        v58 = 0;
        v49 = 0;
        v50 = &v49;
        v51 = 0x3032000000;
        v52 = __Block_byref_object_copy__171;
        v53 = __Block_byref_object_dispose__171;
        v54 = 0;
        v43 = 0;
        v44 = &v43;
        v45 = 0x3032000000;
        v46 = __Block_byref_object_copy__171;
        v47 = __Block_byref_object_dispose__171;
        v48 = 0;
        -[HDStandardTaskServer profile](self, "profile");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "database");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0;
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __54__HDWorkoutBuilderServer__setupDataSource_identifier___block_invoke;
        v65 = &unk_1E6CF8D38;
        v21 = v40;
        v66 = v21;
        v67 = self;
        v22 = v5;
        v68 = v22;
        v69 = &v49;
        v70 = &v43;
        v71 = &v55;
        v23 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutBuilderEntity, "performWriteTransactionWithHealthDatabase:error:block:", v20, &v42, buf);
        v24 = v42;

        if (v23)
        {
          os_unfair_lock_lock(&self->_lock);
          if (-[NSMutableDictionary count](self->_workoutActivitiesByUUID, "count"))
          {
            -[NSMutableDictionary allValues](self->_workoutActivitiesByUUID, "allValues");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "hk_firstObjectPassingTest:", &__block_literal_global_511);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            os_unfair_lock_unlock(&self->_lock);
            if (v26)
              objc_msgSend(v21, "workoutDataDestination:didBeginActivity:", self, v26);
          }
          else
          {
            os_unfair_lock_unlock(&self->_lock);
            v26 = 0;
          }
          -[HDWorkoutBuilderServer _updateStatisticsPauseResumeMask]((uint64_t)self);
          if (*((_BYTE *)v56 + 24))
            -[HDWorkoutBuilderServer _requestDataFromSource:from:to:](self, v21, (void *)v50[5], (void *)v44[5]);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[HKWorkoutBuilderConfiguration associatedSessionUUID](self->_configuration, "associatedSessionUUID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "workoutDataDestination:didAttachDataSourceToSessionIdentifer:", self, v29);

          }
        }
        v63 = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDWorkoutBuilderServer _removeExpectedDataSourceWithIdentifiers:]((uint64_t)self, v30);

        _Block_object_dispose(&v43, 8);
        _Block_object_dispose(&v49, 8);

        _Block_object_dispose(&v55, 8);
LABEL_30:

      }
    }

  }
  -[HKWorkoutBuilderConfiguration associatedSessionUUID](self->_configuration, "associatedSessionUUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "taskUUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v31, "isEqual:", v32);

  if (v33)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      os_unfair_lock_lock(&self->_lock);
      lock_isAssociatedToSession = self->_lock_isAssociatedToSession;
      self->_lock_isAssociatedToSession = 1;
      os_unfair_lock_unlock(&self->_lock);
      if (!lock_isAssociatedToSession)
      {
        persistentEntity = self->_persistentEntity;
        v36 = v41;
        objc_msgSend(v36, "setAssociatedWorkoutBuilderEntity:", persistentEntity);
        objc_msgSend(v36, "setWorkoutDataAccumulator:", self);

      }
    }
  }

}

- (void)didInvalidateTaskServer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "taskServerRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObserver:forTaskServerUUID:queue:", self, v7, 0);
}

uint64_t __54__HDWorkoutBuilderServer__setupDataSource_identifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setSessionIdentifier:transaction:error:", *(_QWORD *)(a1 + 48), v5, a3))
  {
    v17 = 0;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    v8 = v5;
    if (v6)
    {
      os_unfair_lock_assert_owner((const os_unfair_lock *)(v6 + 40));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "quantityTypesToIncludeWhilePaused");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v6 + 80), "setByAddingObjectsFromSet:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(v6 + 80);
        *(_QWORD *)(v6 + 80) = v10;

        v12 = *(void **)(v6 + 48);
        objc_msgSend(*(id *)(v6 + 80), "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        v14 = objc_msgSend(v12, "setQuantityTypesIncludedWhilePaused:transaction:error:", v13, v8, &v19);
        v15 = v19;

        if ((v14 & 1) == 0)
        {
          _HKInitializeLogging();
          v16 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v21 = v6;
            v22 = 2114;
            v23 = v15;
            _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Unable to add quantity types to include while paused: %{public}@", buf, 0x16u);
          }
        }

      }
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 40) + 200));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 40) + 208));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                           + 40) != 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));
    v17 = 1;
  }

  return v17;
}

BOOL __54__HDWorkoutBuilderServer__setupDataSource_identifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __60__HDWorkoutBuilderServer__addExpectedDataSourceIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "workoutDataProcessorUUID");
}

uint64_t __57__HDWorkoutBuilderServer__requestDataFromSource_from_to___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "workoutDataDestination:requestsDataFrom:to:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return 1;
}

uint64_t __68__HDWorkoutBuilderServer__runInBestWriteTransactionWithError_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__HDWorkoutBuilderServer__runInBestWriteTransactionWithError_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zonesByType, 0);
  objc_storeStrong((id *)&self->_dataInterval, 0);
  objc_storeStrong((id *)&self->_workoutEndDate, 0);
  objc_storeStrong((id *)&self->_workoutStartDate, 0);
  objc_storeStrong((id *)&self->_workoutActivitiesByUUID, 0);
  objc_storeStrong((id *)&self->_workoutEvents, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_upstreamQueue, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_expectedDataSourceUUIDs, 0);
  objc_storeStrong((id *)&self->_workoutDataFlowLink, 0);
  objc_storeStrong((id *)&self->_quantityTypesRequiringCalculatorInvalidation, 0);
  objc_storeStrong((id *)&self->_statisticsDataSourcesByType, 0);
  objc_storeStrong((id *)&self->_sourceOrderProvidersByType, 0);
  objc_storeStrong((id *)&self->_statisticsCalculators, 0);
  objc_storeStrong((id *)&self->_quantityTypesIncludedWhilePaused, 0);
  objc_storeStrong((id *)&self->_sampleObservers, 0);
  objc_storeStrong((id *)&self->_dataAccumulatorObservers, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_persistentEntity, 0);
}

@end
