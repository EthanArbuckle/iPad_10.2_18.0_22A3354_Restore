@implementation HDCloudSyncTarget

- (HDCloudSyncTarget)init
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

- (HDCloudSyncTarget)initWithPurpose:(int64_t)a3 container:(id)a4 zoneIdentifier:(id)a5 storeRecord:(id)a6 store:(id)a7 options:(unint64_t)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  HDCloudSyncTarget *v18;
  HDCloudSyncTarget *v19;
  void *v21;
  id v25;
  id v26;
  objc_super v27;

  v13 = a4;
  v14 = a5;
  v26 = a6;
  v25 = a7;
  objc_msgSend(v13, "containerIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containerIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if ((v17 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncTarget.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[container.containerIdentifier isEqualToString:zoneIdentifier.containerIdentifier]"));

  }
  v27.receiver = self;
  v27.super_class = (Class)HDCloudSyncTarget;
  v18 = -[HDCloudSyncTarget init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_purpose = a3;
    objc_storeStrong((id *)&v18->_container, a4);
    objc_storeStrong((id *)&v19->_zoneIdentifier, a5);
    objc_storeStrong((id *)&v19->_storeRecord, a6);
    objc_storeStrong((id *)&v19->_store, a7);
    v19->_options = a8;
  }

  return v19;
}

- (id)targetByAddingOptions:(unint64_t)a3
{
  return -[HDCloudSyncTarget initWithPurpose:container:zoneIdentifier:storeRecord:store:options:]([HDCloudSyncTarget alloc], "initWithPurpose:container:zoneIdentifier:storeRecord:store:options:", self->_purpose, self->_container, self->_zoneIdentifier, self->_storeRecord, self->_store, self->_options | a3);
}

- (id)targetByRemovingOptions:(unint64_t)a3
{
  return -[HDCloudSyncTarget initWithPurpose:container:zoneIdentifier:storeRecord:store:options:]([HDCloudSyncTarget alloc], "initWithPurpose:container:zoneIdentifier:storeRecord:store:options:", self->_purpose, self->_container, self->_zoneIdentifier, self->_storeRecord, self->_store, self->_options & ~a3);
}

- (id)targetByUpdatingPurpose:(int64_t)a3
{
  return -[HDCloudSyncTarget initWithPurpose:container:zoneIdentifier:storeRecord:store:options:]([HDCloudSyncTarget alloc], "initWithPurpose:container:zoneIdentifier:storeRecord:store:options:", a3, self->_container, self->_zoneIdentifier, self->_storeRecord, self->_store, self->_options);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  HDCloudSyncTargetPurposeToString(self->_purpose);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDCloudSyncTargetOptionsToString(self->_options);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContainer containerIdentifier](self->_container, "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncZoneIdentifier zoneIdentifier](self->_zoneIdentifier, "zoneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord record](self->_storeRecord, "record");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ Target: (%@) [%@] %@ : %@>"), v4, v5, v6, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPurpose:container:zoneIdentifier:storeRecord:store:options:", self->_purpose, self->_container, self->_zoneIdentifier, self->_storeRecord, self->_store, self->_options);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HDCloudSyncZoneIdentifier *zoneIdentifier;
  void *v9;
  HDCloudSyncStoreRecord *storeRecord;
  void *v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKContainer containerIdentifier](self->_container, "containerIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "container");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v7))
    {
      zoneIdentifier = self->_zoneIdentifier;
      objc_msgSend(v4, "zoneIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HDCloudSyncZoneIdentifier isEqual:](zoneIdentifier, "isEqual:", v9))
      {
        storeRecord = self->_storeRecord;
        objc_msgSend(v4, "storeRecord");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[HDCloudSyncStoreRecord isEqual:](storeRecord, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[CKContainer containerIdentifier](self->_container, "containerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[HDCloudSyncZoneIdentifier hash](self->_zoneIdentifier, "hash") ^ v4;
  -[HDCloudSyncRecord record](self->_storeRecord, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (CKContainer)container
{
  return self->_container;
}

- (HDCloudSyncZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (HDCloudSyncStoreRecord)storeRecord
{
  return self->_storeRecord;
}

- (HDCloudSyncStore)store
{
  return self->_store;
}

- (unint64_t)options
{
  return self->_options;
}

- (HDCloudSyncZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
  objc_storeStrong((id *)&self->_zone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_storeRecord, 0);
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
