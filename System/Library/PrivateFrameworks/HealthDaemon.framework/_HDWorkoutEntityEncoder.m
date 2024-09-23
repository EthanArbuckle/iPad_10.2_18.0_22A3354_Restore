@implementation _HDWorkoutEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[10];

  v11[9] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("activities.activity_type");
  v11[1] = CFSTR("activities.duration");
  v11[2] = CFSTR("active_energy.quantity");
  v11[3] = CFSTR("basal_energy.quantity");
  v11[4] = CFSTR("total_distance");
  v11[5] = CFSTR("goal");
  v11[6] = CFSTR("goal_type");
  v11[7] = CFSTR("swimming_strokes.quantity");
  v11[8] = CFSTR("flights_climbed.quantity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_includeCondenserInfo)
  {
    v10[0] = CFSTR("condenser_version");
    v10[1] = CFSTR("condenser_date");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutEntryLookupStatement, 0);
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  HDCodableWorkout *v11;
  HDSQLiteStatement *workoutEntryLookupStatement;
  HDCodableWorkout *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HDCodableWorkout *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  HDCodableWorkout *v31;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(HDCodableWorkout);
    -[HDCodableWorkout setSample:](v11, "setSample:", v10);
    -[HDCodableWorkout setType:](v11, "setType:", HDSQLiteColumnWithNameAsInt64());
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableWorkout setDuration:](v11, "setDuration:");
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableWorkout setTotalEnergyBurnedInCanonicalUnit:](v11, "setTotalEnergyBurnedInCanonicalUnit:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableWorkout setTotalBasalEnergyBurnedInCanonicalUnit:](v11, "setTotalBasalEnergyBurnedInCanonicalUnit:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableWorkout setTotalDistanceInCanonicalUnit:](v11, "setTotalDistanceInCanonicalUnit:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableWorkout setTotalSwimmingStrokeCountInCanonicalUnit:](v11, "setTotalSwimmingStrokeCountInCanonicalUnit:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableWorkout setTotalFlightsClimbedInCanonicalUnit:](v11, "setTotalFlightsClimbedInCanonicalUnit:");
    }
    workoutEntryLookupStatement = self->_workoutEntryLookupStatement;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __74___HDWorkoutEntityEncoder_codableRepresentationForPersistentID_row_error___block_invoke;
    v30[3] = &unk_1E6CF7188;
    v13 = v11;
    v31 = v13;
    if (!+[HDWorkoutEventEntity enumerateEventsForOwner:withStatement:error:eventHandler:](HDWorkoutEventEntity, "enumerateEventsForOwner:withStatement:error:eventHandler:", a3, workoutEntryLookupStatement, a5, v30))
    {
      v18 = 0;
LABEL_34:

      goto LABEL_35;
    }
    -[HDSQLiteStatement database](self->_workoutEntryLookupStatement, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    +[HDWorkoutActivityEntity primaryWorkoutActivityForOwnerID:database:error:](HDWorkoutActivityEntity, "primaryWorkoutActivityForOwnerID:database:error:", a3, v14, &v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v29;

    if (v15)
    {
      +[HDCodableWorkoutActivity codableForWorkoutActivity:](HDCodableWorkoutActivity, "codableForWorkoutActivity:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        -[HDCodableWorkout setPrimaryActivity:](v13, "setPrimaryActivity:", v17);

      goto LABEL_20;
    }
    if ((objc_msgSend(v16, "hk_isObjectNotFoundError") & 1) != 0)
    {
LABEL_20:
      -[HDSQLiteStatement database](self->_workoutEntryLookupStatement, "database", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      +[HDWorkoutActivityEntity subActivitiesWithOwnerID:database:error:](HDWorkoutActivityEntity, "subActivitiesWithOwnerID:database:error:", a3, v19, &v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v28;

      if (v20)
      {
        +[HDCodableWorkoutActivity codablesForWorkoutActivities:](HDCodableWorkoutActivity, "codablesForWorkoutActivities:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableWorkout setSubActivities:](v13, "setSubActivities:", v22);

        if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
        {
          -[HDCodableWorkout setGoalType:](v13, "setGoalType:", HDSQLiteColumnWithNameAsInt64());
          HDSQLiteColumnWithNameAsDouble();
          -[HDCodableWorkout setGoal:](v13, "setGoal:");
        }
        v18 = v13;
      }
      else
      {
        v23 = v21;
        if (v23)
        {
          if (a5)
            *a5 = objc_retainAutorelease(v23);
          else
            _HKLogDroppedError();
        }

        v18 = 0;
      }

      v24 = v27;
      goto LABEL_33;
    }
    v24 = v16;
    v25 = v16;
    v21 = v25;
    if (v25)
    {
      if (a5)
      {
        v21 = objc_retainAutorelease(v25);
        v18 = 0;
        *a5 = v21;
LABEL_33:

        goto LABEL_34;
      }
      _HKLogDroppedError();
    }
    v18 = 0;
    goto LABEL_33;
  }
  v18 = 0;
LABEL_35:

  return v18;
}

+ (int64_t)estimatedEncodedSize
{
  return 1000;
}

- (_HDWorkoutEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8
{
  id v14;
  id v15;
  _HDWorkoutEntityEncoder *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  HDSQLiteStatement *workoutEntryLookupStatement;
  NSObject *v22;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)_HDWorkoutEntityEncoder;
  v16 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:](&v25, sel_initWithHealthEntityClass_profile_transaction_purpose_encodingOptions_authorizationFilter_, a3, a4, v14, a6, v15, a8);
  if (v16)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("IncludeCondenserInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_includeCondenserInfo = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v14, "databaseForEntityClass:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    +[HDWorkoutEventEntity statementForEnumeratingEventsForOwnerInDatabase:error:](HDWorkoutEventEntity, "statementForEnumeratingEventsForOwnerInDatabase:error:", v18, &v24);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v24;
    workoutEntryLookupStatement = v16->_workoutEntryLookupStatement;
    v16->_workoutEntryLookupStatement = (HDSQLiteStatement *)v19;

    if (!v16->_workoutEntryLookupStatement)
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v20;
        _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "Unable to create statement to look up workout events: %{public}@", buf, 0xCu);
      }
    }

  }
  return v16;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6DD0]), "_init");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  char v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  id v42;
  id v43;
  id v44;
  void *v45;
  BOOL v46;
  NSObject *v47;
  NSObject *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  double v56;
  void *v57;
  void *v58;
  uint64_t v59;
  double v60;
  void *v61;
  void *v62;
  uint64_t v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  BOOL v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  void *v86;
  _QWORD v88[5];
  id v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95;
  id v96;
  __int128 buf;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "applyPropertiesToObject:persistentID:row:error:", v9, a4, a5, a6);

  if (v11)
  {
    objc_msgSend(v9, "_setWorkoutActivityType:", HDSQLiteColumnWithNameAsInt64());
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v9, "_setDuration:");
    v12 = HDSQLiteColumnWithNameAsInt64();
    v13 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a5, v13) & 1) == 0 && _HKWorkoutGoalTypeIsValidForGoal())
    {
      v14 = (void *)MEMORY[0x1E0CB6A28];
      _HKWorkoutCanonicalUnitForGoalType();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1BCCAB1A4](a5, v13);
      objc_msgSend(v14, "quantityWithUnit:doubleValue:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "_setGoal:", v16);
      objc_msgSend(v9, "_setGoalType:", v12);

    }
    v17 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a5, v17) & 1) == 0)
    {
      v18 = MEMORY[0x1BCCAB1A4](a5, v17);
      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D80]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "canonicalUnit");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v20, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setTotalSwimmingStrokeCount:", v21);

    }
    v22 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a5, v22) & 1) == 0)
    {
      v23 = MEMORY[0x1BCCAB1A4](a5, v22);
      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C90]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "canonicalUnit");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v25, v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setTotalFlightsClimbed:", v26);

    }
    if (self->_includeCondenserInfo)
    {
      objc_msgSend(v9, "metadata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (id)objc_msgSend(v27, "mutableCopy");

      v29 = (int)HDSQLiteColumnWithName();
      v30 = MEMORY[0x1BCCAB204](a5, v29);
      if ((v30 & 1) == 0)
      {
        if (!v28)
          v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        MEMORY[0x1BCCAB1C8](a5, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, CFSTR("condenser_version"));

      }
      v32 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1BCCAB204](a5, v32) & 1) == 0)
      {
        if (!v28)
          v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        MEMORY[0x1BCCAB198](a5, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v33, CFSTR("condenser_date"));

        v30 = 0;
      }
      if (v28 && (v30 & 1) == 0)
        objc_msgSend(v9, "_setMetadata:", v28);

    }
    -[HDEntityEncoder transaction](self, "transaction");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "databaseForEntityClass:", objc_opt_class());
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = 0;
    +[HDWorkoutEventEntity workoutEventsWithOwnerID:database:error:](HDWorkoutEventEntity, "workoutEventsWithOwnerID:database:error:", v35, v86, &v96);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v96;

    if (!v36)
    {
      _HKInitializeLogging();
      v47 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v83;
        _os_log_error_impl(&dword_1B7802000, v47, OS_LOG_TYPE_ERROR, "Error retrieving workout events: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      v84 = v83;
      if (v84)
      {
        if (!a6)
        {
          _HKLogDroppedError();
          v46 = 0;
LABEL_76:

          goto LABEL_77;
        }
        v85 = objc_retainAutorelease(v84);
        v46 = 0;
        *a6 = v85;

      }
      else
      {
        v46 = 1;

      }
LABEL_77:

      goto LABEL_78;
    }
    if (objc_msgSend(v36, "count"))
      objc_msgSend(v9, "_setWorkoutEvents:", v36);
    -[HDEntityEncoder transaction](self, "transaction");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "databaseForEntityClass:", objc_opt_class());
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    v95 = 0;
    +[HDWorkoutActivityEntity subActivitiesWithOwnerID:database:error:](HDWorkoutActivityEntity, "subActivitiesWithOwnerID:database:error:", a4, v81, &v95);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v95;
    if (!v82)
    {
      _HKInitializeLogging();
      v48 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v84;
        _os_log_error_impl(&dword_1B7802000, v48, OS_LOG_TYPE_ERROR, "Error retrieving workout activities: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      v49 = v84;
      v44 = v49;
      if (v49)
      {
        if (a6)
        {
          v44 = objc_retainAutorelease(v49);
          v46 = 0;
          *a6 = v44;
        }
        else
        {
          _HKLogDroppedError();
          v46 = 0;
        }
      }
      else
      {
        v46 = 1;
      }
      goto LABEL_75;
    }
    if (objc_msgSend(v82, "count"))
    {
      if (objc_msgSend(v36, "count"))
      {
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v38 = v82;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v92;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v92 != v40)
                objc_enumerationMutation(v38);
              objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * i), "_filterAndSetWorkoutEvents:", v36);
            }
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
          }
          while (v39);
        }

      }
      objc_msgSend(v9, "_setSubActivities:", v82);
    }
    v90 = 0;
    +[HDWorkoutActivityEntity primaryWorkoutActivityForOwnerID:database:error:](HDWorkoutActivityEntity, "primaryWorkoutActivityForOwnerID:database:error:", a4, v81, &v90);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v43 = v90;
    v44 = v43;
    if (v42)
    {
      objc_msgSend(v9, "workoutEvents");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "_filterAndSetWorkoutEvents:", v45);
    }
    else
    {
      if ((objc_msgSend(v43, "hk_isObjectNotFoundError") & 1) == 0)
      {
        v74 = v44;
        v42 = v74;
        if (v74)
        {
          if (a6)
          {
            v42 = objc_retainAutorelease(v74);
            v46 = 0;
            *a6 = v42;
          }
          else
          {
            _HKLogDroppedError();
            v46 = 0;
          }
        }
        else
        {
          v46 = 1;
        }
LABEL_74:

LABEL_75:
        goto LABEL_76;
      }
      v50 = v9;
      v45 = v50;
      if (self)
      {
        objc_msgSend(v50, "workoutActivityType");
        objc_msgSend(v45, "metadata");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        _HKWorkoutConfigurationWithActivityTypeAndMetadata();
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = objc_alloc(MEMORY[0x1E0CB6DD8]);
        objc_msgSend(v45, "UUID");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "startDate");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "endDate");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "workoutEvents");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "duration");
        v42 = (id)objc_msgSend(v53, "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", v78, v52, v77, v76, v54, 0, 0, 0);

        v55 = (int)HDSQLiteColumnWithName();
        if ((MEMORY[0x1BCCAB204](a5, v55) & 1) == 0)
        {
          v56 = MEMORY[0x1BCCAB1A4](a5, v55);
          objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A48]);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "canonicalUnit");
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v79, v56);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "_setTotalEnergyBurned:", v58);

        }
        v59 = (int)HDSQLiteColumnWithName();
        if ((MEMORY[0x1BCCAB204](a5, v59) & 1) == 0)
        {
          v60 = MEMORY[0x1BCCAB1A4](a5, v59);
          objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A88]);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "canonicalUnit");
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v80, v60);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "_setTotalBasalEnergyBurned:", v62);

        }
        v63 = (int)HDSQLiteColumnWithName();
        if ((MEMORY[0x1BCCAB204](a5, v63) & 1) == 0)
        {
          v64 = MEMORY[0x1BCCAB1A4](a5, v63);
          v65 = (void *)MEMORY[0x1E0CB6A28];
          _HKWorkoutCanonicalDistanceUnit();
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "quantityWithUnit:doubleValue:", v66, v64);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "_setTotalDistance:", v67);
        }

      }
      else
      {
        v42 = 0;
      }
    }

    objc_msgSend(v9, "_setPrimaryActivity:", v42);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v98 = 0x3032000000;
    v99 = __Block_byref_object_copy__85;
    v100 = __Block_byref_object_dispose__85;
    v101 = 0;
    -[HDEntityEncoder profile](self, "profile");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDEntityEncoder transaction](self, "transaction");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0;
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __74___HDWorkoutEntityEncoder_applyPropertiesToObject_persistentID_row_error___block_invoke;
    v88[3] = &unk_1E6CF71B0;
    v88[4] = &buf;
    v70 = +[HDWorkoutZonesAssociationEntity enumerateZonesSamplesWithWorkoutPersistentID:profile:transaction:error:handler:](HDWorkoutZonesAssociationEntity, "enumerateZonesSamplesWithWorkoutPersistentID:profile:transaction:error:handler:", a4, v68, v69, &v89, v88);
    v71 = v89;

    if (v70)
    {
      objc_msgSend(v9, "_setZonesByType:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      v46 = 1;
    }
    else
    {
      v72 = v71;
      v73 = v72;
      v46 = v72 == 0;
      if (v72)
      {
        if (a6)
          *a6 = objc_retainAutorelease(v72);
        else
          _HKLogDroppedError();
      }

    }
    _Block_object_dispose(&buf, 8);

    goto LABEL_74;
  }
  v46 = 0;
LABEL_78:

  return v46;
}

@end
