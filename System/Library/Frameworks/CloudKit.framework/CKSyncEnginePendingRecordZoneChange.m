@implementation CKSyncEnginePendingRecordZoneChange

- (CKSyncEnginePendingRecordZoneChange)initWithRecordID:(CKRecordID *)recordID type:(CKSyncEnginePendingRecordZoneChangeType)type
{
  CKRecordID *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CKSyncEnginePendingRecordZoneChange *v10;
  uint64_t v11;
  CKRecordID *v12;
  objc_super v14;

  v6 = recordID;
  v14.receiver = self;
  v14.super_class = (Class)CKSyncEnginePendingRecordZoneChange;
  v10 = -[CKSyncEnginePendingRecordZoneChange init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v7, v8, v9);
    v12 = v10->_recordID;
    v10->_recordID = (CKRecordID *)v11;

    v10->_type = type;
  }

  return v10;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEnginePendingRecordZoneChange *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEnginePendingRecordZoneChange *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  uint64_t v2;
  uint64_t v3;

  if (objc_msgSend_type(self, a2, v2, v3))
    return CFSTR("PendingRecordDelete");
  else
    return CFSTR("PendingRecordSave");
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  id v9;

  v4 = a3;
  objc_msgSend_recordID(self, v5, v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v8, (uint64_t)CFSTR("recordID"), (uint64_t)v9, 0);

}

- (BOOL)isEqual:(id)a3
{
  CKSyncEnginePendingRecordZoneChange *v4;
  CKSyncEnginePendingRecordZoneChange *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;

  v4 = (CKSyncEnginePendingRecordZoneChange *)a3;
  if (self == v4)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_recordID(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15))
      {
        v19 = objc_msgSend_type(self, v16, v17, v18);
        v23 = v19 == objc_msgSend_type(v5, v20, v21, v22);
      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  objc_msgSend_recordID(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  v13 = objc_msgSend_type(self, v10, v11, v12) ^ v9;

  return v13;
}

- (id)oppositeTypeChange
{
  CKSyncEnginePendingRecordZoneChange *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  const char *v12;
  void *v13;

  v3 = [CKSyncEnginePendingRecordZoneChange alloc];
  objc_msgSend_recordID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_type(self, v8, v9, v10) == 0;
  v13 = (void *)objc_msgSend_initWithRecordID_type_(v3, v12, (uint64_t)v7, v11);

  return v13;
}

+ (id)recordChangesWithOppositeTypeFromRecordChanges:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_CKMap_(a3, a2, (uint64_t)&unk_1E1F58F38, v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v14 = a3;
  objc_msgSend_recordID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v14, v8, (uint64_t)v7, (uint64_t)CFSTR("recordID"));

  v12 = objc_msgSend_type(self, v9, v10, v11);
  objc_msgSend_encodeInteger_forKey_(v14, v13, v12, (uint64_t)CFSTR("type"));

}

- (CKSyncEnginePendingRecordZoneChange)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  CKRecordID *v7;
  CKRecordID *recordID;
  const char *v9;
  uint64_t v10;
  int64_t v11;
  const char *v12;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("recordID"));
  v7 = (CKRecordID *)objc_claimAutoreleasedReturnValue();
  recordID = self->_recordID;
  self->_recordID = v7;

  v11 = objc_msgSend_decodeIntegerForKey_(v4, v9, (uint64_t)CFSTR("type"), v10);
  self->_type = v11;
  return (CKSyncEnginePendingRecordZoneChange *)objc_msgSend_initWithRecordID_type_(self, v12, (uint64_t)self->_recordID, v11);
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (CKSyncEnginePendingRecordZoneChangeType)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
