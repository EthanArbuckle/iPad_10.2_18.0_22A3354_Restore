@implementation HDFreezeQuantitySampleSeriesOperation

- (HDFreezeQuantitySampleSeriesOperation)initWithIdentifier:(id)a3 metadata:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDFreezeQuantitySampleSeriesOperation *v11;
  uint64_t v12;
  NSUUID *identifier;
  uint64_t v14;
  NSDictionary *metadata;
  uint64_t v16;
  NSDate *endDate;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDFreezeQuantitySampleSeriesOperation;
  v11 = -[HDFreezeQuantitySampleSeriesOperation init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    metadata = v11->_metadata;
    v11->_metadata = (NSDictionary *)v14;

    v16 = objc_msgSend(v10, "copy");
    endDate = v11->_endDate;
    v11->_endDate = (NSDate *)v16;

    v11->_freezeResult = 0;
  }

  return v11;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSUUID *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  int64_t v33;
  id v34;
  id v35;
  id *v36;
  uint64_t v37;
  NSUUID *v38;
  id *v39;
  int v40;
  void *v41;
  int v42;
  HDFreezeQuantitySampleSeriesOperation *v43;
  NSUUID *identifier;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id *v67;
  void *v68;
  void *v69;
  NSUUID **p_frozenIdentifier;
  HDFreezeQuantitySampleSeriesOperation *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  HDFreezeQuantitySampleSeriesOperation *v79;
  uint8_t buf[4];
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  p_frozenIdentifier = &self->_frozenIdentifier;
  objc_storeStrong((id *)&self->_frozenIdentifier, self->_identifier);
  self->_freezeResult = 1;
  objc_msgSend(v10, "protectedDatabase");
  v11 = objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0;
  v13 = (void *)v11;
  +[HDDataEntity anyInDatabase:predicate:error:](HDQuantitySampleSeriesEntity, "anyInDatabase:predicate:error:", v11, v12, &v78);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v78;

  if (v14)
  {
    v67 = a5;
    objc_msgSend(v14, "hasSeriesDataWithTransaction:error:", v10, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v10;
    if (!v16)
    {
      v24 = 0;
      LOBYTE(self) = 0;
      v20 = v15;
LABEL_66:

LABEL_67:
      goto LABEL_68;
    }
    v19 = v13;
    v20 = v15;
    if ((objc_msgSend(v16, "BOOLValue") & 1) != 0)
    {

      objc_msgSend(v14, "countForSeriesWithTransaction:error:", v18, v67);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        if (objc_msgSend(v21, "integerValue") == 1)
        {
          objc_msgSend(v14, "HFDKeyWithDatabase:error:", v19, v67);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            v20 = 0;
            v24 = 0;
            LOBYTE(self) = 0;
LABEL_64:

            goto LABEL_65;
          }
        }
        else
        {
          v23 = 0;
        }
        v66 = v17;
        objc_msgSend(v14, "freezeWithEndDate:transaction:profile:error:", self->_endDate, v18, v9, v67);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v26;
        if (!v26)
        {
          v20 = 0;
          v24 = 0;
          LOBYTE(self) = 0;
          v17 = v66;
          goto LABEL_64;
        }
        v64 = v18;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v26, "persistentID"));
        v27 = objc_claimAutoreleasedReturnValue();
        v65 = (void *)v27;
        if (!self->_metadata)
        {
          v24 = 0;
          v17 = v66;
          v36 = v67;
LABEL_44:
          if (!v23
            || +[HDQuantitySampleSeriesEntity deleteSeriesDataWithKey:database:error:](HDQuantitySampleSeriesEntity, "deleteSeriesDataWithKey:database:error:", objc_msgSend(v23, "longLongValue"), v19, v36))
          {
            identifier = self->_identifier;
            v74 = 0;
            +[HDDataEntity objectWithUUID:encodingOptions:profile:error:](HDQuantitySampleSeriesEntity, "objectWithUUID:encodingOptions:profile:error:", identifier, 0, v9, &v74);
            v45 = objc_claimAutoreleasedReturnValue();
            v20 = v74;
            v62 = v23;
            v63 = v14;
            if (v45)
            {
              v71 = (HDFreezeQuantitySampleSeriesOperation *)v45;
              +[HDSQLiteEntity entityWithPersistentID:](HDDataEntity, "entityWithPersistentID:", v65);
              v73 = v20;
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "numberForProperty:transaction:error:", CFSTR("provenance"), v64, &v73);
              v46 = objc_claimAutoreleasedReturnValue();
              v61 = v73;

              v68 = (void *)v46;
              if (v46)
              {
                objc_msgSend(v9, "dataProvenanceManager");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = v61;
                objc_msgSend(v47, "originProvenanceForPersistentID:transaction:error:", v46, v64, &v72);
                v48 = objc_claimAutoreleasedReturnValue();
                v20 = v72;

                if (v48)
                {
                  v49 = (void *)v48;
                }
                else
                {
                  _HKInitializeLogging();
                  v52 = *MEMORY[0x1E0CB52B0];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v81 = v20;
                    _os_log_error_impl(&dword_1B7802000, v52, OS_LOG_TYPE_ERROR, "Failed to look up provenance for series after freezing: %{public}@", buf, 0xCu);
                  }
                  v49 = 0;
                }
              }
              else
              {
                _HKInitializeLogging();
                v51 = *MEMORY[0x1E0CB52B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v20 = v61;
                  v81 = v61;
                  _os_log_error_impl(&dword_1B7802000, v51, OS_LOG_TYPE_ERROR, "Failed to look up provenance ID for series after freezing: %{public}@", buf, 0xCu);
                  v49 = 0;
                }
                else
                {
                  v49 = 0;
                  v20 = v61;
                }
                v17 = v66;
              }
              objc_msgSend(v9, "dataManager");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = v71;
              LOBYTE(self) = 1;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "shouldNotifyForDataObjects:provenance:database:anchor:", v54, v49, v19, v65);

              v43 = v71;
              v18 = v64;
            }
            else
            {
              _HKInitializeLogging();
              v50 = *MEMORY[0x1E0CB52B0];
              v18 = v64;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v81 = v20;
                _os_log_error_impl(&dword_1B7802000, v50, OS_LOG_TYPE_ERROR, "Failed to look up series after freezing: %{public}@", buf, 0xCu);
              }
              v43 = 0;
              LOBYTE(self) = 1;
            }
            v14 = v63;
LABEL_62:

            v23 = v62;
            goto LABEL_63;
          }
LABEL_50:
          v20 = 0;
          LOBYTE(self) = 0;
          v18 = v64;
LABEL_63:

          goto LABEL_64;
        }
        v77 = 0;
        +[HDDataEntity objectWithID:encodingOptions:profile:error:](HDQuantitySampleSeriesEntity, "objectWithID:encodingOptions:profile:error:", v27, 0, v9, &v77);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v77;
        if (!v28)
        {
          if (v29)
          {
            self = (HDFreezeQuantitySampleSeriesOperation *)v29;
            v17 = v66;
            v39 = v67;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Could not find sample with ID %@"), v65);
            self = (HDFreezeQuantitySampleSeriesOperation *)(id)objc_claimAutoreleasedReturnValue();
            v17 = v66;
            v39 = v67;
            if (!self)
            {
              v20 = 0;
              v24 = 0;
              goto LABEL_63;
            }
          }
          v62 = v23;
          if (v39)
            *v39 = objc_retainAutorelease(self);
          else
            _HKLogDroppedError();

          v20 = 0;
          v24 = 0;
          v43 = self;
          LOBYTE(self) = 0;
          goto LABEL_62;
        }
        v58 = v29;
        objc_msgSend(v28, "_setMetadata:", self->_metadata);
        objc_msgSend(v28, "sourceRevision");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "source");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_sourceID");
        v32 = objc_claimAutoreleasedReturnValue();

        v75 = 0;
        v76 = 0;
        v59 = (void *)v32;
        v60 = v28;
        v33 = +[HDDataEntity shouldInsertObject:sourceID:profile:transaction:objectToReplace:objectID:error:](HDQuantitySampleSeriesEntity, "shouldInsertObject:sourceID:profile:transaction:objectToReplace:objectID:error:", v28, v32, v9, v64, &v76, &v75, v67);
        v34 = v76;
        v35 = v75;
        v56 = v35;
        v57 = v34;
        if (v33 == 2)
        {
          v40 = 0;
          v24 = 0;
          v14 = v26;
          v17 = v66;
          v36 = v67;
          goto LABEL_43;
        }
        if (v33 == 1)
        {
          v36 = v67;
          v14 = v26;
          v17 = v66;
          if (+[HDQuantitySampleSeriesEntity deleteSeriesWithID:deleteSeriesData:profile:transaction:error:](HDQuantitySampleSeriesEntity, "deleteSeriesWithID:deleteSeriesData:profile:transaction:error:", v65, 1, v9, v64, v67))
          {
            objc_msgSend(v34, "UUID");
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = *p_frozenIdentifier;
            *p_frozenIdentifier = (NSUUID *)v37;

            v24 = 0;
LABEL_35:
            v40 = 1;
            goto LABEL_43;
          }
          v40 = 0;
          v24 = 0;
        }
        else
        {
          v24 = v35;
          objc_msgSend(v9, "metadataManager");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v67;
          v42 = objc_msgSend(v41, "insertMetadata:forObjectID:sourceID:externalSyncObjectCode:objectDeleted:error:", self->_metadata, v65, v59, objc_msgSend(v60, "_externalSyncObjectCode"), 0, v67);

          if (v42
            && +[HDQuantitySampleSeriesEntity replaceObjectID:replacementObjectID:deleteOriginalSeriesData:profile:transaction:error:](HDQuantitySampleSeriesEntity, "replaceObjectID:replacementObjectID:deleteOriginalSeriesData:profile:transaction:error:", v24, v65, 1, v9, v64, v67))
          {
            v14 = v26;
            v17 = v66;
            goto LABEL_35;
          }
          v40 = 0;
          v14 = v26;
          v17 = v66;
        }
LABEL_43:

        if (!v40)
          goto LABEL_50;
        goto LABEL_44;
      }
      v20 = 0;
      v24 = 0;
      LOBYTE(self) = 0;
    }
    else
    {
      v25 = *p_frozenIdentifier;
      *p_frozenIdentifier = 0;

      self->_freezeResult = 2;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "persistentID"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(self) = +[HDQuantitySampleSeriesEntity deleteSeriesWithID:deleteSeriesData:profile:transaction:error:](HDQuantitySampleSeriesEntity, "deleteSeriesWithID:deleteSeriesData:profile:transaction:error:", v22, 1, v9, v18, v67);
      v24 = 0;
    }
LABEL_65:

    v13 = v19;
    goto LABEL_66;
  }
  if (v15)
  {
    v14 = v15;
LABEL_13:
    v18 = v10;
    if (a5)
    {
      v14 = objc_retainAutorelease(v14);
      v24 = 0;
      LOBYTE(self) = 0;
      *a5 = v14;
    }
    else
    {
      _HKLogDroppedError();
      v24 = 0;
      LOBYTE(self) = 0;
    }
    v20 = v14;
    goto LABEL_67;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Unable to find quantity series '%@' when freezing."), self->_identifier);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
    goto LABEL_13;
  v20 = 0;
  v24 = 0;
  LOBYTE(self) = 0;
  v18 = v10;
LABEL_68:

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDFreezeQuantitySampleSeriesOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HDFreezeQuantitySampleSeriesOperation *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("meta"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("end"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HDFreezeQuantitySampleSeriesOperation initWithIdentifier:metadata:endDate:](self, "initWithIdentifier:metadata:endDate:", v5, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDFreezeQuantitySampleSeriesOperation;
  v4 = a3;
  -[HDJournalEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("id"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_metadata, CFSTR("meta"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_endDate, CFSTR("end"));

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSUUID)frozenIdentifier
{
  return self->_frozenIdentifier;
}

- (int64_t)freezeResult
{
  return self->_freezeResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
