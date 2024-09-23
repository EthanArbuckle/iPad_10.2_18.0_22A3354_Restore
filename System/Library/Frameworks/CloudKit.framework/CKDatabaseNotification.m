@implementation CKDatabaseNotification

- (CKDatabaseNotification)initWithRemoteNotificationDictionary:(id)a3
{
  id v4;
  CKDatabaseNotification *v5;
  const char *v6;
  uint64_t v7;
  CKDatabaseNotification *v8;
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
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  unsigned int v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  __CFString *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
  __CFString *v37;
  CKRecordZoneID *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  id v44;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CKDatabaseNotification;
  v5 = -[CKNotification initWithRemoteNotificationDictionary:](&v45, sel_initWithRemoteNotificationDictionary_, v4);
  v8 = v5;
  if (v5)
  {
    objc_msgSend_setNotificationType_(v5, v6, 4, v7);
    objc_msgSend_objectForKeyedSubscript_(v4, v9, (uint64_t)CFSTR("ck"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)CFSTR("met"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)CFSTR("dbs"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v23 = objc_msgSend_intValue(v17, v18, v19, v20) - 1;
          if (v23 > 3)
            objc_msgSend_setDatabaseScope_(v8, v21, 0, v22);
          else
            objc_msgSend_setDatabaseScope_(v8, v21, qword_18A83D228[v23], v22);
        }
        objc_msgSend_objectForKeyedSubscript_(v14, v18, (uint64_t)CFSTR("sid"), v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend_setSubscriptionID_(v8, v25, (uint64_t)v24, v26);
        objc_msgSend_objectForKeyedSubscript_(v14, v25, (uint64_t)CFSTR("zoid"), v26);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v14, v28, (uint64_t)CFSTR("zid"), v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v31 = v30;
            v35 = objc_msgSend_databaseScope(v8, v32, v33, v34);
            v36 = v27;
            switch(v35)
            {
              case 0:
              case 3:
                goto LABEL_14;
              case 1:
              case 2:
              case 4:
                v36 = CFSTR("__defaultOwner__");
LABEL_14:
                v37 = v36;
                if (v37 && v31)
                {
                  v38 = [CKRecordZoneID alloc];
                  v44 = v31;
                  v40 = (void *)objc_msgSend_initWithZoneName_ownerName_(v38, v39, (uint64_t)v31, (uint64_t)v37);
                  objc_msgSend_setRecordZoneID_(v8, v41, (uint64_t)v40, v42);

                  v31 = v44;
                }
                break;
              default:
                v37 = 0;
                break;
            }

          }
        }

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
  unint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  objc_super v22;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v22.receiver = self;
  v22.super_class = (Class)CKDatabaseNotification;
  -[CKNotification CKPropertiesDescription](&v22, sel_CKPropertiesDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_databaseScope(self, v5, v6, v7);
  CKDatabaseScopeString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordZoneID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckShortDescription(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v18, (uint64_t)CFSTR("%@, database=%@, zoneID=%@"), v19, v4, v9, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKDatabaseNotification *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
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
  uint64_t v9;
  const char *v10;
  objc_super v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v11.receiver = self;
  v11.super_class = (Class)CKDatabaseNotification;
  -[CKNotification encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  v9 = objc_msgSend_databaseScope(self, v6, v7, v8);
  objc_msgSend_encodeInt64_forKey_(v4, v10, v9, (uint64_t)CFSTR("DatabaseScope"));
  objc_autoreleasePoolPop(v5);

}

- (CKDatabaseNotification)initWithCoder:(id)a3
{
  id v4;
  CKDatabaseNotification *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKDatabaseNotification;
  v5 = -[CKNotification initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v5->_databaseScope = objc_msgSend_decodeInt64ForKey_(v4, v7, (uint64_t)CFSTR("DatabaseScope"), v8);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CKDatabaseScope)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void)setRecordZoneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneID, 0);
}

@end
