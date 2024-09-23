@implementation CKRecordZoneNotification

- (CKRecordZoneNotification)initWithRemoteNotificationDictionary:(id)a3
{
  id v4;
  CKRecordZoneNotification *v5;
  const char *v6;
  uint64_t v7;
  CKRecordZoneNotification *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  __CFString *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  __CFString *v24;
  __CFString *v25;
  CKRecordZoneID *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  unsigned int v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CKRecordZoneNotification;
  v5 = -[CKNotification initWithRemoteNotificationDictionary:](&v42, sel_initWithRemoteNotificationDictionary_, v4);
  v8 = v5;
  if (v5)
  {
    objc_msgSend_setNotificationType_(v5, v6, 2, v7);
    objc_msgSend_objectForKeyedSubscript_(v4, v9, (uint64_t)CFSTR("ck"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)CFSTR("fet"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)CFSTR("zid"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v14, v18, (uint64_t)CFSTR("zoid"), v19);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = CKCurrentProcessLinkCheck908c3403f5370f9fc0f790c790ce4de0669132c0();
            v24 = CFSTR("__defaultOwner__");
            if (v23)
              v24 = v20;
            v25 = v24;

            v26 = [CKRecordZoneID alloc];
            v28 = (void *)objc_msgSend_initWithZoneName_ownerName_(v26, v27, (uint64_t)v17, (uint64_t)v25);
            objc_msgSend_setRecordZoneID_(v8, v29, (uint64_t)v28, v30);

            v20 = v25;
          }
        }
        objc_msgSend_objectForKeyedSubscript_(v14, v21, (uint64_t)CFSTR("dbs"), v22);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v37 = objc_msgSend_intValue(v31, v32, v33, v34) - 1;
          if (v37 > 3)
            objc_msgSend_setDatabaseScope_(v8, v35, 0, v36);
          else
            objc_msgSend_setDatabaseScope_(v8, v35, qword_18A83D228[v37], v36);
        }
        objc_msgSend_objectForKeyedSubscript_(v14, v32, (uint64_t)CFSTR("sid"), v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend_setSubscriptionID_(v8, v39, (uint64_t)v38, v40);

      }
    }

  }
  return v8;
}

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  objc_super v22;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v22.receiver = self;
  v22.super_class = (Class)CKRecordZoneNotification;
  -[CKNotification CKPropertiesDescription](&v22, sel_CKPropertiesDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordZoneID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckShortDescription(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_databaseScope(self, v13, v14, v15);
  CKDatabaseScopeString(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v18, (uint64_t)CFSTR("%@, recordZoneID=%@, database=%@"), v19, v4, v12, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKRecordZoneNotification *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  objc_super v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v16.receiver = self;
  v16.super_class = (Class)CKRecordZoneNotification;
  -[CKNotification encodeWithCoder:](&v16, sel_encodeWithCoder_, v4);
  objc_msgSend_recordZoneID(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("RecordZoneID"));

  v14 = objc_msgSend_databaseScope(self, v11, v12, v13);
  objc_msgSend_encodeInt64_forKey_(v4, v15, v14, (uint64_t)CFSTR("DatabaseScope"));
  objc_autoreleasePoolPop(v5);

}

- (CKRecordZoneNotification)initWithCoder:(id)a3
{
  id v4;
  CKRecordZoneNotification *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKRecordZoneID *recordZoneID;
  const char *v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKRecordZoneNotification;
  v5 = -[CKNotification initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("RecordZoneID"));
    v9 = objc_claimAutoreleasedReturnValue();
    recordZoneID = v5->_recordZoneID;
    v5->_recordZoneID = (CKRecordZoneID *)v9;

    v5->_databaseScope = objc_msgSend_decodeInt64ForKey_(v4, v11, (uint64_t)CFSTR("DatabaseScope"), v12);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void)setRecordZoneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (CKDatabaseScope)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneID, 0);
}

@end
