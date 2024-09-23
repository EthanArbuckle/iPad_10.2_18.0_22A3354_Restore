@implementation CKDAssetZoneKey

- (CKDAssetZoneKey)initWithDestinationZoneID:(id)a3 destinationDatabaseScope:(int64_t)a4 usesMMCSEncryptionV2:(id)a5
{
  return (CKDAssetZoneKey *)objc_msgSend_initWithDestinationZoneID_destinationDatabaseScope_usesMMCSEncryptionV2_sourceZoneID_sourceDatabaseScope_isPackageRereference_(self, a2, (uint64_t)a3, a4, a5, 0, 0, 0);
}

- (CKDAssetZoneKey)initWithDestinationZoneID:(id)a3 destinationDatabaseScope:(int64_t)a4 usesMMCSEncryptionV2:(id)a5 sourceZoneID:(id)a6 sourceDatabaseScope:(int64_t)a7 isPackageRereference:(BOOL)a8
{
  id v15;
  NSNumber *v16;
  id v17;
  CKDAssetZoneKey *v18;
  CKDAssetZoneKey *v19;
  objc_super v21;

  v15 = a3;
  v16 = (NSNumber *)a5;
  v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CKDAssetZoneKey;
  v18 = -[CKDAssetZoneKey init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_destinationZoneID, a3);
    v19->_destinationDatabaseScope = a4;
    v19->_useMMCSEncryptionV2 = v16;
    objc_storeStrong((id *)&v19->_sourceZoneID, a6);
    v19->_sourceDatabaseScope = a7;
    v19->_isPackageRereference = a8;
  }

  return v19;
}

- (int)authPutType
{
  uint64_t v2;

  if (!self->_sourceZoneID)
    return 1;
  if (objc_msgSend_isCrossOwner(self, a2, v2))
    return 3;
  return 2;
}

- (BOOL)isReReference
{
  return self->_sourceZoneID != 0;
}

- (BOOL)isCrossOwner
{
  CKRecordZoneID *sourceZoneID;
  CKRecordZoneID *destinationZoneID;

  sourceZoneID = self->_sourceZoneID;
  if (sourceZoneID)
  {
    destinationZoneID = self->_destinationZoneID;
    if (destinationZoneID)
      LOBYTE(sourceZoneID) = objc_msgSend_hasSameOwnerAs_(sourceZoneID, a2, (uint64_t)destinationZoneID) ^ 1;
    else
      LOBYTE(sourceZoneID) = 0;
  }
  return (char)sourceZoneID;
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  void *v33;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_destinationZoneID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v8, (uint64_t)CFSTR("destinationZoneID=%@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_destinationDatabaseScope(self, v12, v13);
  CKDatabaseScopeString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v11, v15, (uint64_t)CFSTR("destinationDatabaseScope=%@"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v17, (uint64_t)v16);

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_sourceZoneID(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v18, v22, (uint64_t)CFSTR("sourceZoneID=%@"), v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v24, (uint64_t)v23);

  v25 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_sourceDatabaseScope(self, v26, v27);
  CKDatabaseScopeString();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v25, v29, (uint64_t)CFSTR("sourceDatabaseScope=%@"), v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v31, (uint64_t)v30);

  objc_msgSend_componentsJoinedByString_(v3, v32, (uint64_t)CFSTR(", "));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetZoneKey *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (BOOL)isEqual:(id)a3
{
  CKDAssetZoneKey *v4;
  CKDAssetZoneKey *v5;
  int64_t destinationDatabaseScope;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  int64_t sourceDatabaseScope;
  const char *v12;
  uint64_t v13;
  int isPackageRereference;
  char v15;

  v4 = (CKDAssetZoneKey *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      destinationDatabaseScope = self->_destinationDatabaseScope;
      if (destinationDatabaseScope == objc_msgSend_destinationDatabaseScope(v5, v7, v8)
        && (sourceDatabaseScope = self->_sourceDatabaseScope,
            sourceDatabaseScope == objc_msgSend_sourceDatabaseScope(v5, v9, v10))
        && (isPackageRereference = self->_isPackageRereference,
            isPackageRereference == objc_msgSend_isPackageRereference(v5, v12, v13))
        && CKObjectsAreBothNilOrEqual()
        && CKObjectsAreBothNilOrEqual()
        && CKObjectsAreBothNilOrEqual())
      {
        v15 = CKObjectsAreBothNilOrEqual();
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_destinationZoneID, a2, v2);
  return objc_msgSend_hash(self->_sourceZoneID, v5, v6) ^ v4;
}

- (CKRecordZoneID)destinationZoneID
{
  return self->_destinationZoneID;
}

- (CKRecordZoneID)sourceZoneID
{
  return self->_sourceZoneID;
}

- (int64_t)sourceDatabaseScope
{
  return self->_sourceDatabaseScope;
}

- (NSNumber)useMMCSEncryptionV2
{
  return self->_useMMCSEncryptionV2;
}

- (NSData)cloneContext
{
  return self->_cloneContext;
}

- (void)setCloneContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloneContext, a3);
}

- (BOOL)isPackageRereference
{
  return self->_isPackageRereference;
}

- (int64_t)destinationDatabaseScope
{
  return self->_destinationDatabaseScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloneContext, 0);
  objc_storeStrong((id *)&self->_sourceZoneID, 0);
  objc_storeStrong((id *)&self->_destinationZoneID, 0);
}

@end
