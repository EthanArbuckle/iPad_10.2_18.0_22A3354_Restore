@implementation HDWorkoutEntity

+ (id)databaseTable
{
  return CFSTR("workouts");
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[5];

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDWorkoutEntity.m"), 131, CFSTR("Subclasses must override %s"), "+[HDWorkoutEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __81__HDWorkoutEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v31[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v31[4] = a1;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __81__HDWorkoutEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2;
  v28[3] = &unk_1E6CE7750;
  v16 = v14;
  v29 = v16;
  v17 = v12;
  v30 = v17;
  v18 = objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertDataObject_withProvenance_inDatabase_persistentID_error__insertKey_1, a7, v31, v28, 0);
  v19 = 0;
  if (v18)
  {
    objc_msgSend(v17, "_subActivities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = +[HDWorkoutActivityEntity insertSubActivities:ownerID:database:error:](HDWorkoutActivityEntity, "insertSubActivities:ownerID:database:error:", v20, objc_msgSend(v16, "longLongValue"), v13, a7);

    if (v21)
    {
      objc_msgSend(v17, "_primaryActivity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v16;
      if (v22)
      {
        objc_msgSend(v17, "_primaryActivity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = +[HDWorkoutActivityEntity insertPrimaryActivity:ownerID:database:error:](HDWorkoutActivityEntity, "insertPrimaryActivity:ownerID:database:error:", v23, objc_msgSend(v16, "longLongValue"), v13, a7);

        if (v24)
          v19 = v16;
        else
          v19 = 0;
      }
    }
    else
    {
      v19 = 0;
    }
  }
  v25 = v19;

  return v25;
}

id __81__HDWorkoutEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@) VALUES (?, ?, ?, ?)"), v2, CFSTR("data_id"), CFSTR("goal_type"), CFSTR("total_distance"), CFSTR("goal"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addWorkouts:", a3);
  return a3 != 0;
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "ascending");
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB61D8]))
  {
    v7 = (void *)MEMORY[0x1E0D29888];
    v8 = objc_opt_class();
    v9 = CFSTR("activities.duration");
  }
  else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB61E0]))
  {
    v7 = (void *)MEMORY[0x1E0D29888];
    v8 = objc_opt_class();
    v9 = CFSTR("total_distance");
  }
  else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB61E8]))
  {
    v7 = (void *)MEMORY[0x1E0D29888];
    v8 = objc_opt_class();
    v9 = CFSTR("active_energy.quantity");
  }
  else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB61F8]))
  {
    v7 = (void *)MEMORY[0x1E0D29888];
    v8 = objc_opt_class();
    v9 = CFSTR("swimming_strokes.quantity");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB61F0]))
    {
      v13.receiver = a1;
      v13.super_class = (Class)&OBJC_METACLASS___HDWorkoutEntity;
      objc_msgSendSuper2(&v13, sel_orderingTermForSortDescriptor_, v4);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v7 = (void *)MEMORY[0x1E0D29888];
    v8 = objc_opt_class();
    v9 = CFSTR("flights_climbed.quantity");
  }
  objc_msgSend(v7, "orderingTermWithProperty:entityClass:ascending:", v9, v8, v6);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v11 = (void *)v10;

  return v11;
}

+ (id)deleteStatementsForRelatedEntitiesWithTransaction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HDWorkoutEntity;
  v3 = a3;
  objc_msgSendSuper2(&v8, sel_deleteStatementsForRelatedEntitiesWithTransaction_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy", v8.receiver, v8.super_class);

  +[HDWorkoutEventEntity deleteStatementForWorkoutEventsWithTransaction:](HDWorkoutEventEntity, "deleteStatementForWorkoutEventsWithTransaction:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v6);
  return v5;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_48;
}

uint64_t __81__HDWorkoutEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  int IsValidForGoal;
  void *v12;
  void *v13;
  double v14;
  double v15;

  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "_goalType"));
  objc_msgSend(*(id *)(a1 + 40), "totalDistance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "totalDistance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _HKWorkoutCanonicalDistanceUnit();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValueForUnit:", v6);
    v8 = v7;

    sqlite3_bind_double(a2, 3, v8);
  }
  else
  {
    sqlite3_bind_null(a2, 3);
  }
  objc_msgSend(*(id *)(a1 + 40), "_goal");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    return sqlite3_bind_null(a2, 4);
  v10 = (void *)v9;
  objc_msgSend(*(id *)(a1 + 40), "_goalType");
  IsValidForGoal = _HKWorkoutGoalTypeIsValidForGoal();

  if (!IsValidForGoal)
    return sqlite3_bind_null(a2, 4);
  objc_msgSend(*(id *)(a1 + 40), "_goal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_goalType");
  _HKWorkoutCanonicalUnitForGoalType();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValueForUnit:", v13);
  v15 = v14;

  return sqlite3_bind_double(a2, 4, v15);
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "workouts");
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDWorkoutEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[_HDWorkoutEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDWorkoutEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[4];
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("activities.activity_type")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("activities.duration")))
  {
    +[HDWorkoutEntity _primaryActivityJoinClause]();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25[0] = CFSTR("active_energy.quantity");
    v25[1] = CFSTR("basal_energy.quantity");
    v26[0] = CFSTR("active_energy");
    v26[1] = CFSTR("basal_energy");
    v25[2] = CFSTR("swimming_strokes.quantity");
    v25[3] = CFSTR("flights_climbed.quantity");
    v26[2] = CFSTR("swimming_strokes");
    v26[3] = CFSTR("flights_climbed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12)) & 1) != 0)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v4);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            +[HDWorkoutEntity _primaryActivityJoinClause]();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v4;
            objc_opt_self();
            if ((objc_msgSend(v15, "isEqualToString:", CFSTR("active_energy.quantity")) & 1) != 0)
            {
              v16 = 10;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("basal_energy.quantity")) & 1) != 0)
            {
              v16 = 9;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("swimming_strokes.quantity")) & 1) != 0)
            {
              v16 = 111;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("flights_climbed.quantity")) & 1) != 0)
            {
              v16 = 12;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Property cannot be matched to a data type"));
              v16 = -1;
            }

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@ = %ld"), v13, 0x1E6D12C58, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D29870], "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:additionalPredicate:", CFSTR("activities"), objc_opt_class(), v13, *MEMORY[0x1E0D29618], 0x1E6D12C38, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v14, v18, 0);
            v7 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_5;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
          continue;
        break;
      }
    }

    v19.receiver = a1;
    v19.super_class = (Class)&OBJC_METACLASS___HDWorkoutEntity;
    objc_msgSendSuper2(&v19, sel_joinClausesForProperty_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_5:

  return v7;
}

+ (id)_primaryActivityJoinClause
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ = 1)"), CFSTR("is_primary_activity"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D29870];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDWorkoutEntity, "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:additionalPredicate:", v2, objc_opt_class(), CFSTR("activities"), *MEMORY[0x1E0D29618], CFSTR("owner_id"), v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (BOOL)copySampleAssociationsFromWorkout:(id)a3 toWorkout:(id)a4 profile:(id)a5 error:(id *)a6
{
  return +[HDAssociationEntity copyAssociationsFromObject:toObject:profile:error:](HDAssociationEntity, "copyAssociationsFromObject:toObject:profile:error:", a3, a4, a5, a6);
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  objc_super v21;
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("duration");
  v22[1] = CFSTR("total_energy_burned");
  v23[0] = CFSTR("activities.duration");
  v23[1] = CFSTR("active_energy.quantity");
  v22[2] = CFSTR("total_basal_energy_burned");
  v22[3] = CFSTR("total_w_steps");
  v23[2] = CFSTR("basal_energy.quantity");
  v23[3] = CFSTR("swimming_strokes.quantity");
  v22[4] = CFSTR("total_flights_climbed");
  v23[4] = CFSTR("flights_climbed.quantity");
  v10 = (void *)MEMORY[0x1E0C99D80];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = v13;
  v18 = v17;

  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___HDWorkoutEntity;
  objc_msgSendSuper2(&v21, sel_maxValueForProperty_predicate_database_error_, v18, v12, v11, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (BOOL)replaceExistingObject:(id)a3 existingObjectID:(id)a4 replacementObject:(id)a5 replacementObjectID:(id)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9
{
  id v13;
  id v14;
  id v15;
  id *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v44;
  void *v45;
  id obj;
  id v47;
  id v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDWorkoutEntity.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[existingObject isKindOfClass:[HKWorkout class]]"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDWorkoutEntity.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[replacementObject isKindOfClass:[HKWorkout class]]"));

  }
  v16 = a9;
  v17 = v13;
  v52 = v14;
  objc_msgSend(v52, "_subActivities");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(v17, "_subActivities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    if (v51)
    {
      v50 = *(_QWORD *)v59;
      v47 = v17;
      v48 = v15;
      obj = v20;
      while (2)
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v59 != v50)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v22, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "endDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "UUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          HDReferenceForAssociatableObject(v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[HDAssociationEntity objectUUIDsAssociatedWithObjectUUID:subObjectReference:excludeDeleted:profile:error:](HDAssociationEntity, "objectUUIDsAssociatedWithObjectUUID:subObjectReference:excludeDeleted:profile:error:", v25, v26, 1, v15, v16);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v27, "count"))
          {
            v53 = v27;
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            objc_msgSend(v52, "_subActivities");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v55;
LABEL_14:
              v32 = 0;
              while (1)
              {
                if (*(_QWORD *)v55 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v32);
                objc_msgSend(v33, "startDate");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "endDate");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "timeIntervalSinceDate:", v34);
                v37 = fabs(v36);
                objc_msgSend(v24, "timeIntervalSinceDate:", v35);
                if (v37 <= 0.001 && fabs(v38) <= 0.001)
                  break;

                if (v30 == ++v32)
                {
                  v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
                  if (v30)
                    goto LABEL_14;
                  goto LABEL_21;
                }
              }
              objc_msgSend(v52, "UUID");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              HDReferenceForAssociatableObject(v33);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v53;
              v15 = v48;
              v49 = +[HDAssociationEntity associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:](HDAssociationEntity, "associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:", v53, v39, 1, v40, 0, v48, a9);

              v16 = a9;
              v17 = v47;
              if (v49)
                goto LABEL_23;

              v42 = 0;
              v41 = obj;
              goto LABEL_29;
            }
LABEL_21:

            v17 = v47;
            v15 = v48;
            v16 = a9;
            v27 = v53;
          }
LABEL_23:

        }
        v20 = obj;
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
        if (v51)
          continue;
        break;
      }
    }

  }
  if (+[HDAssociationEntity copyAssociationsFromObject:toObject:type:profile:error:](HDAssociationEntity, "copyAssociationsFromObject:toObject:type:profile:error:", v17, v52, 1, v15, v16))
  {
    objc_msgSend(v15, "dataManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "deleteDataObjects:restrictedSourceEntities:failIfNotFound:recursiveDeleteAuthorizationBlock:error:", v23, 0, 1, 0, v16);
LABEL_29:

  }
  else
  {
    v42 = 0;
  }

  return v42;
}

+ (BOOL)supportsObjectMerging
{
  return 1;
}

+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  char v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  BOOL v31;
  void *v32;
  char v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[5];
  _QWORD v51[4];
  id v52;
  _QWORD v53[5];
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v44 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = v14;
    objc_msgSend(v43, "_primaryActivity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a7, 1401, CFSTR("Ignoring synced workout for merge because it does not have a primary activity"));
      v27 = 0;
LABEL_34:

      goto LABEL_35;
    }
    objc_msgSend(v16, "databaseForEntityClass:", objc_opt_class());
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    v56 = &v55;
    v57 = 0x2020000000;
    v58 = 0;
    v54 = 0;
    v19 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke;
    v53[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v53[4] = a1;
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke_2;
    v51[3] = &unk_1E6CE9508;
    v20 = v43;
    v52 = v20;
    v50[0] = v19;
    v50[1] = 3221225472;
    v50[2] = __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke_3;
    v50[3] = &unk_1E6CE8540;
    v50[4] = &v55;
    v21 = objc_msgSend(v42, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &mergeDataObject_provenance_profile_transaction_error_insertHandler__searchKey, &v54, v53, v51, v50);
    v22 = v54;
    v23 = v22;
    if ((v21 & 1) != 0)
    {
      v24 = v56[3];
      v49 = v22;
      +[HDWorkoutActivityEntity primaryWorkoutActivityForOwnerID:database:error:](HDWorkoutActivityEntity, "primaryWorkoutActivityForOwnerID:database:error:", v24, v42, &v49);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = v49;

      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v56[3]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

        _Block_object_dispose(&v55, 8);
        goto LABEL_34;
      }
      if (v26 && (objc_msgSend(v26, "hk_isObjectNotFoundError") & 1) == 0)
      {
        v35 = v26;
        v26 = v35;
        if (a7)
          *a7 = objc_retainAutorelease(v35);
        else
          _HKLogDroppedError();

      }
      else
      {
        objc_msgSend(v20, "_primaryActivity");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v56[3];
        v48 = v26;
        v31 = +[HDWorkoutActivityEntity insertPrimaryActivity:ownerID:database:error:](HDWorkoutActivityEntity, "insertPrimaryActivity:ownerID:database:error:", v29, v30, v42, &v48);
        v41 = v48;

        if (v31)
        {
          v59[0] = CFSTR("total_distance");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v56[3]);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          HDDataEntityPredicateForRowID((uint64_t)v32, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v47 = v41;
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke_4;
          v45[3] = &unk_1E6CE84C8;
          v46 = v20;
          v33 = objc_msgSend(a1, "updateProperties:predicate:database:error:bindingHandler:", v40, v39, v42, &v47, v45);
          v26 = v47;

          if ((v33 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v56[3]);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v36 = v26;
            v37 = v36;
            if (v36)
            {
              if (a7)
                *a7 = objc_retainAutorelease(v36);
              else
                _HKLogDroppedError();
            }

            v27 = 0;
          }

          v25 = 0;
          goto LABEL_33;
        }
        v34 = v41;
        v26 = v34;
        if (v34)
        {
          if (a7)
            *a7 = objc_retainAutorelease(v34);
          else
            _HKLogDroppedError();
        }

      }
      v25 = 0;
    }
    else
    {
      v28 = v22;
      v25 = v28;
      if (v28)
      {
        if (a7)
        {
          v25 = objc_retainAutorelease(v28);
          v27 = 0;
          *a7 = v25;
        }
        else
        {
          _HKLogDroppedError();
          v27 = 0;
        }
        v26 = v25;
        goto LABEL_33;
      }
      v26 = 0;
    }
    v27 = 0;
    goto LABEL_33;
  }
  v27 = 0;
LABEL_35:

  return v27;
}

id __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ INNER JOIN %@ USING(%@) WHERE %@=?"), CFSTR("data_id"), v2, v3, CFSTR("data_id"), CFSTR("uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

uint64_t __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke_3(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

void __86__HDWorkoutEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "totalDistance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "totalDistance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _HKWorkoutCanonicalDistanceUnit();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValueForUnit:", v4);

    JUMPOUT(0x1BCCAB0F0);
  }
  JUMPOUT(0x1BCCAB120);
}

- (BOOL)updateCondenserVersion:(int64_t)a3 date:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  int64_t v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v20[0] = CFSTR("condenser_version");
  v20[1] = CFSTR("condenser_date");
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = a5;
  objc_msgSend(v11, "arrayWithObjects:count:", v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "databaseForEntity:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__HDWorkoutEntity_updateCondenserVersion_date_transaction_error___block_invoke;
  v17[3] = &unk_1E6CECA50;
  v18 = v10;
  v19 = a3;
  v15 = v10;
  LOBYTE(a6) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v13, v14, a6, v17);

  return (char)a6;
}

void __65__HDWorkoutEntity_updateCondenserVersion_date_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB114](a2, CFSTR("condenser_version"), *(_QWORD *)(a1 + 40));
  JUMPOUT(0x1BCCAB0E4);
}

- (BOOL)isCondenserVersionLessThan:(int64_t)a3 transaction:(id)a4
{
  void *v6;
  void *v7;
  BOOL v8;

  objc_msgSend(a4, "databaseForEntity:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteEntity numberForProperty:database:](self, "numberForProperty:database:", CFSTR("condenser_version"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "integerValue") < a3;
  else
    v8 = 1;

  return v8;
}

- (BOOL)getCondenserVersion:(int64_t *)a3 date:(id *)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__85;
  v20 = __Block_byref_object_dispose__85;
  v21 = 0;
  v26[0] = CFSTR("condenser_version");
  v26[1] = CFSTR("condenser_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__HDWorkoutEntity_getCondenserVersion_date_profile_error___block_invoke;
  v15[3] = &unk_1E6CEE020;
  v15[4] = &v22;
  v15[5] = &v16;
  v13 = -[HDHealthEntity getValuesForProperties:healthDatabase:error:handler:](self, "getValuesForProperties:healthDatabase:error:handler:", v11, v12, a6, v15);

  if (v13)
  {
    if (a3)
      *a3 = v23[3];
    if (a4)
      *a4 = objc_retainAutorelease((id)v17[5]);
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __58__HDWorkoutEntity_getCondenserVersion_date_profile_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDate();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (BOOL)enumerateCondensedWorkoutsWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a6;
  objc_msgSend(a4, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__HDWorkoutEntity_enumerateCondensedWorkoutsWithPredicate_profile_error_handler___block_invoke;
  v16[3] = &unk_1E6CF2DE0;
  v18 = v11;
  v19 = a1;
  v17 = v10;
  v13 = v11;
  v14 = v10;
  LOBYTE(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v12, a5, v16);

  return (char)a5;
}

uint64_t __81__HDWorkoutEntity_enumerateCondensedWorkoutsWithPredicate_profile_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v4 = (void *)MEMORY[0x1E0D29840];
  v5 = (void *)MEMORY[0x1E0D29880];
  v6 = a2;
  objc_msgSend(v5, "isNotNullPredicateWithProperty:", CFSTR("condenser_version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compoundPredicateWithPredicate:otherPredicate:", v7, *(_QWORD *)(a1 + 32));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 48);
  objc_msgSend(v6, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HDWorkoutEntityOrderingTermsForCondenserDate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v9, v24, 0, v10, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDWorkoutEntity _codableCondensedWorkoutProperties]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", *MEMORY[0x1E0D29618]);
  v13 = objc_msgSend(v11, "indexOfObject:", CFSTR("uuid"));
  v14 = objc_msgSend(v11, "indexOfObject:", CFSTR("creation_date"));
  v15 = objc_msgSend(v11, "indexOfObject:", CFSTR("start_date"));
  v16 = objc_msgSend(v11, "indexOfObject:", CFSTR("end_date"));
  v17 = objc_msgSend(v11, "indexOfObject:", CFSTR("activities.duration"));
  v18 = objc_msgSend(v11, "indexOfObject:", CFSTR("activities.activity_type"));
  v19 = objc_msgSend(v11, "indexOfObject:", CFSTR("condenser_version"));
  v20 = objc_msgSend(v11, "indexOfObject:", CFSTR("condenser_date"));
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __81__HDWorkoutEntity_enumerateCondensedWorkoutsWithPredicate_profile_error_handler___block_invoke_2;
  v26[3] = &unk_1E6CF7138;
  v28 = v12;
  v29 = v13;
  v30 = v14;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v34 = v18;
  v35 = v19;
  v36 = v20;
  v27 = *(id *)(a1 + 40);
  v21 = objc_msgSend(v23, "enumerateProperties:error:enumerationHandler:", v11, a3, v26);

  return v21;
}

+ (id)_codableCondensedWorkoutProperties
{
  _QWORD v1[10];

  v1[9] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = *MEMORY[0x1E0D29618];
  v1[1] = CFSTR("uuid");
  v1[2] = CFSTR("creation_date");
  v1[3] = CFSTR("start_date");
  v1[4] = CFSTR("end_date");
  v1[5] = CFSTR("activities.duration");
  v1[6] = CFSTR("activities.activity_type");
  v1[7] = CFSTR("condenser_version");
  v1[8] = CFSTR("condenser_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 9);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __81__HDWorkoutEntity_enumerateCondensedWorkoutsWithPredicate_profile_error_handler___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = objc_alloc_init(MEMORY[0x1E0CB6450]);
  objc_msgSend(v5, "setPersistentID:", HDSQLiteColumnAsInt64());
  MEMORY[0x1BCCAB18C](a3, a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUuid:", v6);

  MEMORY[0x1BCCAB1A4](a3, a1[7]);
  objc_msgSend(v5, "setCreationDate:");
  MEMORY[0x1BCCAB1A4](a3, a1[8]);
  objc_msgSend(v5, "setStartDate:");
  MEMORY[0x1BCCAB1A4](a3, a1[9]);
  objc_msgSend(v5, "setEndDate:");
  MEMORY[0x1BCCAB1A4](a3, a1[10]);
  objc_msgSend(v5, "setDuration:");
  objc_msgSend(v5, "setType:", HDSQLiteColumnAsInt64());
  objc_msgSend(v5, "setCondenserVersion:", HDSQLiteColumnAsInt64());
  MEMORY[0x1BCCAB1A4](a3, a1[13]);
  objc_msgSend(v5, "setCondenserDate:");
  v7 = (*(uint64_t (**)(void))(a1[4] + 16))();

  return v7;
}

- (id)codableCondensedWorkoutWithTransaction:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v6 = (objc_class *)MEMORY[0x1E0CB6450];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  +[HDWorkoutEntity _codableCondensedWorkoutProperties]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__HDWorkoutEntity_codableCondensedWorkoutWithTransaction_error___block_invoke;
  v15[3] = &unk_1E6CF7160;
  v16 = v8;
  v11 = v8;
  LODWORD(a4) = -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v9, v10, a4, v15);

  if ((_DWORD)a4)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

void __64__HDWorkoutEntity_codableCondensedWorkoutWithTransaction_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setPersistentID:", HDSQLiteColumnWithNameAsInt64());
  HDSQLiteColumnWithNameAsData();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setUuid:", v2);

  HDSQLiteColumnWithNameAsDouble();
  objc_msgSend(*(id *)(a1 + 32), "setCreationDate:");
  HDSQLiteColumnWithNameAsDouble();
  objc_msgSend(*(id *)(a1 + 32), "setStartDate:");
  HDSQLiteColumnWithNameAsDouble();
  objc_msgSend(*(id *)(a1 + 32), "setEndDate:");
  HDSQLiteColumnWithNameAsDouble();
  objc_msgSend(*(id *)(a1 + 32), "setDuration:");
  objc_msgSend(*(id *)(a1 + 32), "setType:", HDSQLiteColumnWithNameAsInt64());
  HDSQLiteColumnWithNameAsNumber();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setCondenserVersion:", objc_msgSend(v5, "longLongValue"));
  HDSQLiteColumnWithNameAsNumber();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(*(id *)(a1 + 32), "setCondenserDate:");
  }

}

- (id)mainWorkoutActivityTypeWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  +[HDWorkoutActivityEntity activityTypeForPrimaryActivityOwnerID:transaction:error:](HDWorkoutActivityEntity, "activityTypeForPrimaryActivityOwnerID:transaction:error:", -[HDSQLiteEntity persistentID](self, "persistentID"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)workoutStartDateWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__85;
  v17 = __Block_byref_object_dispose__85;
  v18 = 0;
  v19[0] = CFSTR("start_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntity:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__HDWorkoutEntity_workoutStartDateWithTransaction_error___block_invoke;
  v12[3] = &unk_1E6CEEDC8;
  v12[4] = &v13;
  LODWORD(a4) = -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v7, v8, a4, v12);

  if ((_DWORD)a4)
    v9 = (void *)v14[5];
  else
    v9 = 0;
  v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __57__HDWorkoutEntity_workoutStartDateWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  HDSQLiteColumnWithNameAsDate();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)workoutDurationWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  +[HDWorkoutActivityEntity durationForPrimaryActivityOwnerID:transaction:error:](HDWorkoutActivityEntity, "durationForPrimaryActivityOwnerID:transaction:error:", -[HDSQLiteEntity persistentID](self, "persistentID"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)totalDistanceInCanonicalUnitWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v16[0] = CFSTR("total_distance");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntity:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__HDWorkoutEntity_totalDistanceInCanonicalUnitWithTransaction_error___block_invoke;
  v11[3] = &unk_1E6CEEDC8;
  v11[4] = &v12;
  LODWORD(a4) = -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v7, v8, a4, v11);

  if ((_DWORD)a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13[3]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __69__HDWorkoutEntity_totalDistanceInCanonicalUnitWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = HDSQLiteColumnWithNameAsDouble();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return result;
}

+ (BOOL)workoutActivityType:(unint64_t *)a3 associatedWithRouteUUID:(id)a4 transaction:(id)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;

  v21 = a4;
  v19 = (void *)MEMORY[0x1E0CB3940];
  v20 = a5;
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDWorkoutActivityEntity, "disambiguatedDatabaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDAssociationEntity, "disambiguatedDatabaseTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDPendingAssociationEntity, "disambiguatedDatabaseTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ INNER JOIN %@ AS %@ ON %@ = %@ WHERE                                               %@ AND                                               (%@ IN (SELECT %@ FROM %@ INNER JOIN %@ ON %@=%@ WHERE %@ = ?)                                                 OR                                                 %@ IN (SELECT %@ FROM %@ INNER JOIN %@ ON %@=%@ WHERE %@ = ?))"), CFSTR("activities.activity_type"), v18, v8, CFSTR("activities"), CFSTR("data_id"), CFSTR("owner_id"), CFSTR("is_primary_activity"), CFSTR("data_id"), CFSTR("destination_object_id"), v9, v10, CFSTR("source_object_id"), CFSTR("data_id"), CFSTR("uuid"), CFSTR("data_id"), CFSTR("data_id"),
    v11,
    v12,
    CFSTR("uuid"),
    CFSTR("parent_uuid"),
    CFSTR("child_uuid"),
    0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "databaseForEntityClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __81__HDWorkoutEntity_workoutActivityType_associatedWithRouteUUID_transaction_error___block_invoke;
  v25[3] = &unk_1E6CE9508;
  v26 = v21;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __81__HDWorkoutEntity_workoutActivityType_associatedWithRouteUUID_transaction_error___block_invoke_2;
  v24[3] = &__block_descriptor_40_e26_B24__0__HDSQLiteRow__8__16l;
  v24[4] = a3;
  v15 = v21;
  v16 = objc_msgSend(v14, "executeSQL:error:bindingHandler:enumerationHandler:", v13, a6, v25, v24);

  return v16;
}

uint64_t __81__HDWorkoutEntity_workoutActivityType_associatedWithRouteUUID_transaction_error___block_invoke()
{
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __81__HDWorkoutEntity_workoutActivityType_associatedWithRouteUUID_transaction_error___block_invoke_2(uint64_t a1)
{
  **(_QWORD **)(a1 + 32) = HDSQLiteColumnAsInt64();
  return 1;
}

@end
