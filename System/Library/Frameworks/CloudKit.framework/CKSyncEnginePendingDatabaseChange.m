@implementation CKSyncEnginePendingDatabaseChange

+ (void)initialize
{
  objc_class *v3;
  const char *v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A5CEF4C((uint64_t)a1, v3, v5, 0, 1);

}

- (CKSyncEnginePendingDatabaseChange)initWithZoneID:(id)a3 type:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CKSyncEnginePendingDatabaseChange *v10;
  uint64_t v11;
  CKRecordZoneID *zoneID;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKSyncEnginePendingDatabaseChange;
  v10 = -[CKSyncEnginePendingDatabaseChange init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v7, v8, v9);
    zoneID = v10->_zoneID;
    v10->_zoneID = (CKRecordZoneID *)v11;

    v10->_type = a4;
  }

  return v10;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEnginePendingDatabaseChange *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEnginePendingDatabaseChange *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return CFSTR("PendingDatabaseChange");
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend_type(self, v4, v5, v6))
    objc_msgSend_addProperty_value_shouldRedact_(v8, v7, (uint64_t)CFSTR("type"), (uint64_t)CFSTR("Delete"), 0);
  else
    objc_msgSend_addProperty_value_shouldRedact_(v8, v7, (uint64_t)CFSTR("type"), (uint64_t)CFSTR("Save"), 0);

}

- (BOOL)isEqual:(id)a3
{
  CKSyncEnginePendingDatabaseChange *v4;
  CKSyncEnginePendingDatabaseChange *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  char isEqual;

  v4 = (CKSyncEnginePendingDatabaseChange *)a3;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v9 = objc_msgSend_type(self, v6, v7, v8);
      if (v9 == objc_msgSend_type(v5, v10, v11, v12))
      {
        objc_msgSend_zoneID(self, v13, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v5, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v16, v21, (uint64_t)v20, v22);

      }
      else
      {
        isEqual = 0;
      }

    }
    else
    {
      isEqual = 0;
    }
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v5 = objc_msgSend_type(self, a2, v2, v3);
  objc_msgSend_zoneID(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v9, v10, v11, v12) ^ v5;

  return v13;
}

- (id)oppositeTypeChange
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  const char *v7;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, (uint64_t)self, CFSTR("CKSyncEngineState.m"), 1155, CFSTR("Subclass must implement %s"), "-[CKSyncEnginePendingDatabaseChange oppositeTypeChange]");

  return 0;
}

+ (id)databaseChangesWithOppositeTypeFromDatabaseChanges:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_CKMap_(a3, a2, (uint64_t)&unk_1E1F66668, v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;
  void *v6;
  const char *v7;
  CKRecordZoneID *zoneID;
  const char *v9;
  id v10;

  type = self->_type;
  v5 = a3;
  NSStringFromSelector(sel_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v7, type, (uint64_t)v6);

  zoneID = self->_zoneID;
  NSStringFromSelector(sel_zoneID);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v9, (uint64_t)zoneID, (uint64_t)v10);

}

- (CKSyncEnginePendingDatabaseChange)initWithCoder:(id)a3
{
  id v4;
  CKSyncEnginePendingDatabaseChange *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  CKRecordZoneID *zoneID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKSyncEnginePendingDatabaseChange;
  v5 = -[CKSyncEnginePendingDatabaseChange init](&v15, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_type);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v7, (uint64_t)v6, v8);

    v9 = objc_opt_class();
    NSStringFromSelector(sel_zoneID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v9, (uint64_t)v10);
    v12 = objc_claimAutoreleasedReturnValue();
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v12;

  }
  return v5;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (CKSyncEnginePendingDatabaseChangeType)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end
