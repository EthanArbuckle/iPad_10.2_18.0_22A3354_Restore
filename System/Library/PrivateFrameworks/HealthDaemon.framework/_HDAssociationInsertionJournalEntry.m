@implementation _HDAssociationInsertionJournalEntry

- (void)encodeWithCoder:(id)a3
{
  NSUUID *parentUUID;
  id v5;

  parentUUID = self->_parentUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", parentUUID, CFSTR("corUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_childUUIDsData, CFSTR("objUUIDsData"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_provenance, CFSTR("provenance"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_syncIdentity, CFSTR("syncIdentity"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enforceSameSource, CFSTR("sameSource"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deleted, CFSTR("deleted"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationSubObjectReference, CFSTR("destinationSubObject"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_destinationSubObjectReference, 0);
  objc_storeStrong((id *)&self->_childUUIDsData, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
}

- (_HDAssociationInsertionJournalEntry)initWithParentUUID:(id)a3 childUUIDsData:(id)a4 provenance:(int64_t)a5 syncIdentity:(int64_t)a6 type:(unint64_t)a7 deleted:(BOOL)a8 creationDate:(id)a9 destinationSubObjectReference:(id)a10 enforceSameSource:(BOOL)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  _HDAssociationInsertionJournalEntry *v20;
  _HDAssociationInsertionJournalEntry *v21;
  uint64_t v22;
  NSData *childUUIDsData;

  v16 = a3;
  v17 = a4;
  v18 = a9;
  v19 = a10;
  v20 = -[_HDAssociationInsertionJournalEntry init](self, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_parentUUID, a3);
    v22 = objc_msgSend(v17, "copy");
    childUUIDsData = v21->_childUUIDsData;
    v21->_childUUIDsData = (NSData *)v22;

    v21->_provenance = a5;
    v21->_syncIdentity = a6;
    v21->_enforceSameSource = a11;
    v21->_type = a7;
    objc_storeStrong((id *)&v21->_destinationSubObjectReference, a10);
    objc_storeStrong((id *)&v21->_creationDate, a9);
    v21->_deleted = a8;
  }

  return v21;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_parentUUID, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ (%lu objects)"), v5, v6, -[NSData hk_countOfUUIDs](self->_childUUIDsData, "hk_countOfUUIDs"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32 = a4;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v5;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v36 != v29)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v32, "syncIdentityManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "legacySyncIdentity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "entity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "persistentID");

        if (objc_msgSend(v7, "syncIdentity") == -1)
          v31 = v11;
        else
          v31 = objc_msgSend(v7, "syncIdentity");
        objc_msgSend(v7, "parentUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "childUUIDsData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v7, "provenance");
        v15 = objc_msgSend(v7, "type");
        v16 = objc_msgSend(v7, "deleted");
        objc_msgSend(v7, "creationDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "destinationSubObjectReference");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v7, "enforceSameSource");
        v33 = 0;
        v34 = 0;
        BYTE1(v27) = 1;
        LOBYTE(v27) = v19;
        LOBYTE(v15) = +[HDAssociationEntity _insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:](HDAssociationEntity, "_insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:", v12, v13, v14, v31, v15, v16, v17, v18, v27, v32, &v34, &v33);
        v20 = v34;
        v21 = v33;

        if ((v15 & 1) == 0)
        {
          _HKInitializeLogging();
          v22 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v40 = v21;
            _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "Error applying %{public}@", buf, 0xCu);
          }
          if ((objc_msgSend(v21, "hk_isTransactionInterruptedError") & 1) != 0)
          {

            goto LABEL_18;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_opt_class());
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "daemon");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "autoBugCaptureReporter");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "provenance"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "reportJournalFailureWithErrorDescription:provenance:error:", v23, v26, v21);

        }
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v30)
        continue;
      break;
    }
  }
LABEL_18:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDAssociationInsertionJournalEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _HDAssociationInsertionJournalEntry *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _HDAssociationInsertionJournalEntry *v22;
  void *v23;
  _HDAssociationInsertionJournalEntry *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("corUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objUUIDsData"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("provenance")))
    v28 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("provenance"));
  else
    v28 = 0;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("syncIdentity")))
  {
    v27 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("syncIdentity"));
    if (v6)
      goto LABEL_16;
  }
  else
  {
    v27 = -1;
    if (v6)
      goto LABEL_16;
  }
  v7 = self;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("objUUIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v6, "hk_appendBytesWithUUID:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v14);
  }

  self = v7;
LABEL_16:
  v17 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sameSource"));
  v18 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
  v19 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deleted"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationSubObject"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v22 = self;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationSubObjectUUID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v21 = 0;
    }
    else
    {
      HDReferenceForUnknownAssociatableObjectWithUUID(0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

    self = v22;
  }
  LOBYTE(v26) = v17;
  v24 = -[_HDAssociationInsertionJournalEntry initWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:](self, "initWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:", v5, v6, v28, v27, v18, v19, v20, v21, v26);

  return v24;
}

- (NSUUID)parentUUID
{
  return self->_parentUUID;
}

- (NSData)childUUIDsData
{
  return self->_childUUIDsData;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (int64_t)syncIdentity
{
  return self->_syncIdentity;
}

- (BOOL)enforceSameSource
{
  return self->_enforceSameSource;
}

- (HDAssociatableObjectReference)destinationSubObjectReference
{
  return self->_destinationSubObjectReference;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

@end
