@implementation HDInsertCodableSummarySharingEntryOperation

- (HDInsertCodableSummarySharingEntryOperation)init
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

- (HDInsertCodableSummarySharingEntryOperation)initWithCodableEntries:(id)a3 ignoreIfExists:(BOOL)a4 provenance:(int64_t)a5 shouldResolveCNContact:(BOOL)a6
{
  id v10;
  HDInsertCodableSummarySharingEntryOperation *v11;
  uint64_t v12;
  NSArray *codableEntries;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDInsertCodableSummarySharingEntryOperation;
  v11 = -[HDInsertCodableSummarySharingEntryOperation init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    codableEntries = v11->_codableEntries;
    v11->_codableEntries = (NSArray *)v12;

    v11->_provenance = a5;
    v11->_shouldResolveCNContact = a6;
    v11->_ignoreIfExists = a4;
  }

  return v11;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  void *v5;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  char v31;
  NSObject *v32;
  id v34;
  NSArray *obj;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  HDInsertCodableSummarySharingEntryOperation *v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (self->_shouldResolveCNContact)
  {
    objc_msgSend(MEMORY[0x1E0C97298], "hd_contactStoreWithHealthAppIdentity");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v12, "applicationIsInstalled:", *MEMORY[0x1E0CB7630]);

  _HKInitializeLogging();
  HKLogSharing();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v47 = self;
    v48 = 1024;
    v49 = v39 ^ 1;
    _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Inserting codable entries with current pause state: %d", buf, 0x12u);
  }
  v36 = (void *)v11;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = self->_codableEntries;
  v37 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v37)
  {
    v31 = 1;
    goto LABEL_43;
  }
  v38 = *(_QWORD *)v42;
  v34 = v9;
  do
  {
    v14 = 0;
    v5 = v36;
    do
    {
      if (*(_QWORD *)v42 != v38)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v14);
      if (!self->_shouldResolveCNContact || v5 == 0)
      {
        v17 = 0;
      }
      else
      {
        HDCNContactForCodableEntry(*(void **)(*((_QWORD *)&v41 + 1) + 8 * v14), v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (self->_ignoreIfExists)
      {
        v18 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v15, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithUUIDString:", v19);

        v40 = 0;
        +[HDSummarySharingEntryEntity anyWithUUID:transaction:error:](HDSummarySharingEntryEntity, "anyWithUUID:transaction:error:", v20, v10, &v40);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v40;
        v23 = v22;
        LOBYTE(v5) = v21 != 0;
        if (v21)
        {
          _HKInitializeLogging();
          HKLogSharing();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v47 = self;
            _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Entry not inserted because it already exists", buf, 0xCu);
          }

        }
        else
        {
          if (!v22)
          {

            v5 = v36;
            goto LABEL_21;
          }
          if (a5)
            *a5 = objc_retainAutorelease(v22);
          else
            _HKLogDroppedError();
        }
        v9 = v34;

        goto LABEL_42;
      }
LABEL_21:
      if ((v39 & 1) != 0 || objc_msgSend(v15, "direction"))
      {
        v24 = 0;
      }
      else if (objc_msgSend(v15, "status"))
      {
        v24 = objc_msgSend(v15, "status") == 1;
      }
      else
      {
        v24 = 1;
      }
      objc_msgSend(v17, "identifier", v34);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = +[HDSummarySharingEntryEntity insertOrReplaceCodableEntry:CNContactIdentifier:shouldPause:syncProvenance:transaction:error:](HDSummarySharingEntryEntity, "insertOrReplaceCodableEntry:CNContactIdentifier:shouldPause:syncProvenance:transaction:error:", v15, v25, v24, self->_provenance, v10, a5);

      if (!v26)
        goto LABEL_33;
      objc_msgSend(v15, "sharingAuthorizations");
      v27 = objc_claimAutoreleasedReturnValue();
      HDSharingAuthorizationsFromCodableSharingAuthorizations((void *)v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "sharingRecipientIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v27) = +[HDSharingAuthorizationsEntity insertOrReplaceWithRecipientIdentifier:sharingAuthorizations:databaseTransaction:error:](HDSharingAuthorizationsEntity, "insertOrReplaceWithRecipientIdentifier:sharingAuthorizations:databaseTransaction:error:", v29, v28, v10, a5);

      if ((v27 & 1) == 0)
      {
LABEL_33:
        LOBYTE(v5) = 0;
        v9 = v34;
LABEL_42:

        v31 = 0;
        goto LABEL_43;
      }

      ++v14;
    }
    while (v37 != v14);
    v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    v31 = 1;
    v9 = v34;
    v37 = v30;
  }
  while (v30);
LABEL_43:

  return (v31 | v5) & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertCodableSummarySharingEntryOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  HDInsertCodableSummarySharingEntryOperation *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("SharingEntries"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreIfExists"));
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("provenance"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldResolveCNContact"));

  v9 = -[HDInsertCodableSummarySharingEntryOperation initWithCodableEntries:ignoreIfExists:provenance:shouldResolveCNContact:](self, "initWithCodableEntries:ignoreIfExists:provenance:shouldResolveCNContact:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *codableEntries;
  id v5;

  codableEntries = self->_codableEntries;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", codableEntries, CFSTR("SharingEntries"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ignoreIfExists, CFSTR("ignoreIfExists"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_provenance, CFSTR("provenance"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldResolveCNContact, CFSTR("shouldResolveCNContact"));

}

- (NSArray)codableEntries
{
  return self->_codableEntries;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (BOOL)shouldResolveCNContact
{
  return self->_shouldResolveCNContact;
}

- (BOOL)ignoreIfExists
{
  return self->_ignoreIfExists;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codableEntries, 0);
}

@end
