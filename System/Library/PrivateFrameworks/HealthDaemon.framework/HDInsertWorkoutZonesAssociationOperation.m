@implementation HDInsertWorkoutZonesAssociationOperation

- (HDInsertWorkoutZonesAssociationOperation)initWithCodableWorkoutZoneAssociations:(id)a3 syncProvenance:(int64_t)a4
{
  id v6;
  HDInsertWorkoutZonesAssociationOperation *v7;
  uint64_t v8;
  NSArray *workoutZoneAssociations;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDInsertWorkoutZonesAssociationOperation;
  v7 = -[HDInsertWorkoutZonesAssociationOperation init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    workoutZoneAssociations = v7->_workoutZoneAssociations;
    v7->_workoutZoneAssociations = (NSArray *)v8;

    v7->_syncProvenance = a4;
  }

  return v7;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  BOOL v23;
  __int128 v25;
  NSArray *obj;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  uint8_t buf[4];
  HDInsertWorkoutZonesAssociationOperation *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v29 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = self->_workoutZoneAssociations;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v32;
    *(_QWORD *)&v6 = 138543618;
    v25 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB3A28];
        objc_msgSend(v10, "workoutUUID", v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hk_UUIDWithData:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)MEMORY[0x1E0CB3A28];
        objc_msgSend(v10, "zonesSampleUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hk_UUIDWithData:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "syncIdentity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v17, &v30);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v30;

        if (v18)
        {
          v35 = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = +[HDWorkoutZonesAssociationEntity associateSyncedZonesSamplesWithUUIDs:withWorkoutUUID:syncIdentity:syncProvenance:transaction:error:](HDWorkoutZonesAssociationEntity, "associateSyncedZonesSamplesWithUUIDs:withWorkoutUUID:syncIdentity:syncProvenance:transaction:error:", v20, v13, v18, self->_syncProvenance, v29, a5);

          if (!v21)
          {

            v23 = 0;
            goto LABEL_14;
          }
        }
        else
        {
          _HKInitializeLogging();
          v22 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v25;
            v37 = self;
            v38 = 2114;
            v39 = v19;
            _os_log_fault_impl(&dword_1B7802000, v22, OS_LOG_TYPE_FAULT, "%{public}@: ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0x16u);
          }
        }

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v7);
  }
  v23 = 1;
LABEL_14:

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertWorkoutZonesAssociationOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HDInsertWorkoutZonesAssociationOperation *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("associations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("syncProvenance"));

  v7 = -[HDInsertWorkoutZonesAssociationOperation initWithCodableWorkoutZoneAssociations:syncProvenance:](self, "initWithCodableWorkoutZoneAssociations:syncProvenance:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *workoutZoneAssociations;
  id v5;

  workoutZoneAssociations = self->_workoutZoneAssociations;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", workoutZoneAssociations, CFSTR("associations"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_syncProvenance, CFSTR("syncProvenance"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutZoneAssociations, 0);
}

@end
