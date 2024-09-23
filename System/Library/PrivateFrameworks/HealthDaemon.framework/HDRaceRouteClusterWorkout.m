@implementation HDRaceRouteClusterWorkout

+ (id)clusterWorkoutWithWorkoutEntity:(id)a3 transaction:(id)a4 metadataManager:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HDRaceRouteClusterWorkout *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  id *v48;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id obj;
  void *v63;
  void *v64;
  id v65;
  objc_super v66;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[HDMetadataValueStatement metadataValueStatementWithTransaction:](HDMetadataValueStatement, "metadataValueStatementWithTransaction:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metadataForObjectID:baseMetadata:keyFilter:statement:error:", objc_msgSend(v9, "persistentID"), 0, 0, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7300]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "databaseForEntity:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "persistentID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForRowID((uint64_t)v16, 1);
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v15;
    v64 = (void *)v17;
    v65 = 0;
    +[HDSQLiteEntity propertyValueForAnyInDatabase:property:predicate:error:](HDDataEntity, "propertyValueForAnyInDatabase:property:predicate:error:", v15, CFSTR("uuid"), v17, &v65);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v65;
    _HDUUIDForSQLiteValue();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)v19;
    if (v21)
    {
      objc_msgSend(v9, "mainWorkoutActivityTypeWithTransaction:error:", v10, a6);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        if (v14)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7308]);
          obj = (id)objc_claimAutoreleasedReturnValue();
          if (obj)
            goto LABEL_8;
        }
        objc_msgSend(v9, "workoutStartDateWithTransaction:error:", v10, a6);
        obj = (id)objc_claimAutoreleasedReturnValue();
        if (obj)
        {
          if (!v14)
          {
            v57 = v20;
            v23 = 0;
LABEL_21:
            v61 = v23;
            objc_msgSend(v9, "totalDistanceInCanonicalUnitWithTransaction:error:", v10, a6);
            v27 = objc_claimAutoreleasedReturnValue();
            if (!v27)
            {
              v25 = 0;
              v26 = v64;
              v20 = v57;
LABEL_37:

              goto LABEL_38;
            }
            v28 = (void *)v27;
            v54 = (void *)MEMORY[0x1E0CB6A28];
            _HKWorkoutCanonicalDistanceUnit();
            v59 = v18;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "doubleValue");
            objc_msgSend(v54, "quantityWithUnit:doubleValue:", v29);
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            v51 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "doubleValueForUnit:", v30);
            objc_msgSend(v51, "numberWithDouble:");
            v52 = v28;
            v31 = objc_claimAutoreleasedReturnValue();

            v18 = v59;
            v24 = (void *)v31;
            v23 = v61;
LABEL_23:
            v60 = v18;
            v56 = v24;
            objc_msgSend(v24, "doubleValue");
            v33 = v32;
            v61 = v23;
            objc_msgSend(v23, "doubleValue");
            v35 = v34;
            if (v14)
            {
              objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7318]);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72F8]);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v57;
              if (v36)
                goto LABEL_29;
            }
            else
            {
              v20 = v57;
            }
            objc_msgSend(v9, "workoutDurationWithTransaction:error:", v10, a6);
            v37 = objc_claimAutoreleasedReturnValue();
            if (!v37)
            {
              v58 = v14;
              v25 = 0;
LABEL_36:

              v18 = v60;
              v26 = v64;
              goto LABEL_37;
            }
            v36 = (void *)v37;
LABEL_29:
            objc_msgSend(v36, "doubleValue");
            v39 = v38;
            objc_msgSend(v14, "doubleValue");
            v41 = v40;
            v42 = v14;
            v25 = [HDRaceRouteClusterWorkout alloc];
            v50 = objc_msgSend(v22, "integerValue");
            v58 = v42;
            objc_msgSend(v42, "doubleValue");
            v44 = v43;
            objc_msgSend(v36, "doubleValue");
            v46 = v45;
            v53 = v21;
            v47 = obj;
            if (v25)
            {
              v66.receiver = v25;
              v66.super_class = (Class)HDRaceRouteClusterWorkout;
              v48 = objc_msgSendSuper2(&v66, sel_init);
              v25 = (HDRaceRouteClusterWorkout *)v48;
              if (v48)
              {
                objc_storeStrong(v48 + 1, v21);
                v25->_activityType = v50;
                objc_storeStrong((id *)&v25->_startDate, obj);
                v25->_distance = v33 - v35;
                v25->_duration = v39 - v41;
                v25->_startDuration = v44;
                v25->_finishDuration = v46;
              }
            }

            goto LABEL_36;
          }
LABEL_8:
          v57 = v20;
          objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7310]);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72F0]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            goto LABEL_23;
          goto LABEL_21;
        }
      }
      v25 = 0;
    }
    else
    {
      if (v20)
      {
        v22 = v20;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Invalid reference workout UUID"));
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          v20 = 0;
          v25 = 0;
          v26 = v64;
LABEL_39:

          goto LABEL_40;
        }
      }
      if (a6)
      {
        v22 = objc_retainAutorelease(v22);
        v25 = 0;
        *a6 = v22;
      }
      else
      {
        _HKLogDroppedError();
        v25 = 0;
      }
      v20 = v22;
    }
    v26 = v64;
LABEL_38:

    goto LABEL_39;
  }
  v25 = 0;
LABEL_40:

  return v25;
}

+ (id)clusterWorkoutWithWorkoutUUID:(id)a3 transaction:(id)a4 metadataManager:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v10, "databaseForEntityClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDDataEntity anyInDatabase:predicate:error:](HDWorkoutEntity, "anyInDatabase:predicate:error:", v13, v14, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(a1, "clusterWorkoutWithWorkoutEntity:transaction:metadataManager:error:", v15, v10, v11, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSUUID)workoutUUID
{
  return self->_workoutUUID;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (double)distance
{
  return self->_distance;
}

- (double)duration
{
  return self->_duration;
}

- (double)startDuration
{
  return self->_startDuration;
}

- (double)finishDuration
{
  return self->_finishDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);
}

@end
