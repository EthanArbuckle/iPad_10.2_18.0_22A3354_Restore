@implementation HDInsertCodableContributorsOperation

- (HDInsertCodableContributorsOperation)init
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

- (HDInsertCodableContributorsOperation)initWithContributors:(id)a3 provenance:(int64_t)a4
{
  id v6;
  HDInsertCodableContributorsOperation *v7;
  uint64_t v8;
  NSArray *contributors;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDInsertCodableContributorsOperation;
  v7 = -[HDInsertCodableContributorsOperation init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    contributors = v7->_contributors;
    v7->_contributors = (NSArray *)v8;

    v7->_provenance = a4;
  }

  return v7;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int64_t provenance;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  id v32;
  BOOL v33;
  id v35;
  HDInsertCodableContributorsOperation *v36;
  uint64_t v37;
  id v38;
  NSArray *obj;
  id *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v38 = a4;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v36 = self;
  obj = self->_contributors;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v42;
    v35 = v8;
    v37 = *(_QWORD *)v42;
    v40 = a5;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v12);
      v14 = (void *)MEMORY[0x1E0CB3A28];
      objc_msgSend(v13, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hk_UUIDWithData:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "deleted"))
      {
        if (!+[HDContributorEntity deleteContributorWithUUID:profile:error:](HDContributorEntity, "deleteContributorWithUUID:profile:error:", v16, v8, a5))goto LABEL_25;
        goto LABEL_21;
      }
      objc_msgSend(v8, "syncIdentityManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "legacySyncIdentity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v13, "hasSyncIdentity"))
        goto LABEL_13;
      objc_msgSend(v13, "syncIdentity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v19, a5);
      v20 = a5;
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v8, "syncIdentityManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v21, 1, v38, v20);
        v23 = objc_claimAutoreleasedReturnValue();

        if (v23)
        {

          v18 = (void *)v23;
LABEL_13:
          objc_msgSend(v13, "appleID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "callerID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          provenance = v36->_provenance;
          objc_msgSend(v18, "entity");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[HDContributorEntity insertWithUUID:appleID:callerID:primaryUser:syncProvenance:syncIdentity:transaction:error:](HDContributorEntity, "insertWithUUID:appleID:callerID:primaryUser:syncProvenance:syncIdentity:transaction:error:", v16, v24, v25, 0, provenance, objc_msgSend(v27, "persistentID"), v38, v40);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28)
          {

            v8 = v35;
LABEL_25:

            v33 = 0;
            goto LABEL_26;
          }
          v21 = v18;
          v8 = v35;
          goto LABEL_20;
        }
        _HKInitializeLogging();
        v30 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
        {
          v32 = *v40;
          *(_DWORD *)buf = 138543362;
          v46 = v32;
          _os_log_fault_impl(&dword_1B7802000, v30, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
        }
      }
      else
      {
        _HKInitializeLogging();
        v29 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
        {
          v31 = *v40;
          *(_DWORD *)buf = 138543362;
          v46 = v31;
          _os_log_fault_impl(&dword_1B7802000, v29, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
        }

        v21 = 0;
      }
LABEL_20:
      v11 = v37;

      a5 = v40;
LABEL_21:

      if (v10 == ++v12)
      {
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }
  v33 = 1;
LABEL_26:

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertCodableContributorsOperation)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HDInsertCodableContributorsOperation *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("contributors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("provenance"));
  v10 = -[HDInsertCodableContributorsOperation initWithContributors:provenance:](self, "initWithContributors:provenance:", v8, v9);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *contributors;
  id v5;

  contributors = self->_contributors;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contributors, CFSTR("contributors"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_provenance, CFSTR("provenance"));

}

- (NSArray)contributors
{
  return self->_contributors;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contributors, 0);
}

@end
