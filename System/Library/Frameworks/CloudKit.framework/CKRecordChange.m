@implementation CKRecordChange

- (CKRecordChange)initWithChangeType:(int64_t)a3 recordID:(id)a4 record:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CKRecordChange *v11;
  CKRecordChange *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CKRecordChange *v16;
  uint64_t v17;
  CKRecordID *recordID;
  const char *v19;
  uint64_t v20;
  CKRecord *record;
  objc_super v23;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if ((unint64_t)(a3 - 1) > 1 || v9)
  {
    v23.receiver = self;
    v23.super_class = (Class)CKRecordChange;
    v12 = -[CKRecordChange init](&v23, sel_init);
    v16 = v12;
    if (v12)
    {
      v12->_changeType = a3;
      v17 = objc_msgSend_copy(v8, v13, v14, v15);
      recordID = v16->_recordID;
      v16->_recordID = (CKRecordID *)v17;

      v20 = objc_msgSend_copyWithZone_userFields_(v10, v19, 0, 0);
      record = v16->_record;
      v16->_record = (CKRecord *)v20;

    }
    self = v16;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
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
  v13 = objc_msgSend_changeType(self, v10, v11, v12) ^ v9;

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  CKRecordChange *v4;
  CKRecordChange *v5;
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
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  char isEqual;

  v4 = (CKRecordChange *)a3;
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
      v9 = objc_msgSend_changeType(self, v6, v7, v8);
      if (v9 == objc_msgSend_changeType(v5, v10, v11, v12)
        && (objc_msgSend_recordID(self, v13, v14, v15),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_recordID(v5, v17, v18, v19),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend_isEqual_(v16, v21, (uint64_t)v20, v22),
            v20,
            v16,
            v23))
      {
        objc_msgSend_record(self, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_record(v5, v28, v29, v30);
        v31 = objc_claimAutoreleasedReturnValue();
        if (v27 == (void *)v31)
        {
          isEqual = 1;
          v35 = v27;
        }
        else
        {
          v35 = (void *)v31;
          objc_msgSend_record(self, v32, v33, v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_record(v5, v37, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v36, v41, (uint64_t)v40, v42);

        }
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

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;

  v4 = a3;
  v9 = objc_msgSend_changeType(self, v5, v6, v7) - 1;
  if (v9 > 2)
    objc_msgSend_addProperty_value_shouldRedact_(v4, v8, (uint64_t)CFSTR("changeType"), (uint64_t)CFSTR("Unknown"), 0);
  else
    objc_msgSend_addProperty_value_shouldRedact_(v4, v8, (uint64_t)CFSTR("changeType"), (uint64_t)off_1E1F654F8[v9], 0);
  objc_msgSend_recordID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, (uint64_t)CFSTR("recordID"), (uint64_t)v13, 0);

  objc_msgSend_record(self, v15, v16, v17);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_etag(v23, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v22, (uint64_t)CFSTR("recordETag"), (uint64_t)v21, 0);

}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKRecordChange *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKRecordChange *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKRecordChange)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  CKRecordChange *v15;

  v4 = a3;
  v7 = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("CK.changeType"), v6);
  v8 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, (uint64_t)CFSTR("CK.recordID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("CK.record"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (CKRecordChange *)objc_msgSend_initWithChangeType_recordID_record_(self, v14, v7, (uint64_t)v10, v13);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  id v19;

  v4 = a3;
  v8 = objc_msgSend_changeType(self, v5, v6, v7);
  objc_msgSend_encodeInteger_forKey_(v4, v9, v8, (uint64_t)CFSTR("CK.changeType"));
  objc_msgSend_recordID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, (uint64_t)CFSTR("CK.recordID"));

  objc_msgSend_record(self, v15, v16, v17);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v18, (uint64_t)v19, (uint64_t)CFSTR("CK.record"));

}

- (int64_t)changeType
{
  return self->_changeType;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (CKRecord)record
{
  return self->_record;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
