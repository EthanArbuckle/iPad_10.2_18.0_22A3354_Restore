@implementation CKQueryNotification

- (CKQueryNotification)initWithRemoteNotificationDictionary:(id)a3
{
  id v4;
  CKQueryNotification *v5;
  const char *v6;
  uint64_t v7;
  CKQueryNotification *v8;
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
  int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  __CFString *v34;
  const char *v35;
  uint64_t v36;
  int v37;
  __CFString *v38;
  CKRecordZoneID *v39;
  const char *v40;
  void *v41;
  CKRecordID *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  unsigned int v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  __CFString *v58;
  void *v59;
  objc_super v60;

  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)CKQueryNotification;
  v5 = -[CKNotification initWithRemoteNotificationDictionary:](&v60, sel_initWithRemoteNotificationDictionary_, v4);
  v8 = v5;
  if (v5)
  {
    objc_msgSend_setNotificationType_(v5, v6, 1, v7);
    objc_msgSend_objectForKeyedSubscript_(v4, v9, (uint64_t)CFSTR("ck"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)CFSTR("qry"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)CFSTR("fo"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v21 = objc_msgSend_intValue(v17, v18, v19, v20);
          v24 = 1;
          if (v21 == 2)
            v24 = 2;
          if (v21 == 3)
            objc_msgSend_setQueryNotificationReason_(v8, v22, 3, v23);
          else
            objc_msgSend_setQueryNotificationReason_(v8, v22, v24, v23);
        }
        v59 = v17;
        objc_msgSend_objectForKeyedSubscript_(v14, v18, (uint64_t)CFSTR("af"), v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend_setRecordFields_(v8, v26, (uint64_t)v25, v27);
        objc_msgSend_objectForKeyedSubscript_(v14, v26, (uint64_t)CFSTR("rid"), v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v14, v29, (uint64_t)CFSTR("zid"), v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v14, v32, (uint64_t)CFSTR("zoid"), v33);
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v37 = CKCurrentProcessLinkCheck908c3403f5370f9fc0f790c790ce4de0669132c0();
              v38 = CFSTR("__defaultOwner__");
              if (v37)
                v38 = v34;
              v58 = v38;

              v39 = [CKRecordZoneID alloc];
              v41 = (void *)objc_msgSend_initWithZoneName_ownerName_(v39, v40, (uint64_t)v31, (uint64_t)v58);
              v42 = [CKRecordID alloc];
              v44 = (void *)objc_msgSend_initWithRecordName_zoneID_(v42, v43, (uint64_t)v28, (uint64_t)v41);
              objc_msgSend_setRecordID_(v8, v45, (uint64_t)v44, v46);

              v34 = v58;
            }
          }
        }
        objc_msgSend_objectForKeyedSubscript_(v14, v35, (uint64_t)CFSTR("dbs"), v36);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v53 = objc_msgSend_intValue(v47, v48, v49, v50) - 1;
          if (v53 > 3)
            objc_msgSend_setDatabaseScope_(v8, v51, 0, v52);
          else
            objc_msgSend_setDatabaseScope_(v8, v51, qword_18A83D228[v53], v52);
        }
        objc_msgSend_objectForKeyedSubscript_(v14, v48, (uint64_t)CFSTR("sid"), v50);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend_setSubscriptionID_(v8, v55, (uint64_t)v54, v56);

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
  uint64_t NotificationReason;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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
  uint64_t v23;
  unint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  objc_super v30;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v30.receiver = self;
  v30.super_class = (Class)CKQueryNotification;
  -[CKNotification CKPropertiesDescription](&v30, sel_CKPropertiesDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NotificationReason = objc_msgSend_queryNotificationReason(self, v5, v6, v7);
  objc_msgSend_recordFields(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckShortDescription(v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_databaseScope(self, v21, v22, v23);
  CKDatabaseScopeString(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v26, (uint64_t)CFSTR("%@, queryNotificationReason=%ld, recordFields=%@, recordID=%@, database=%@"), v27, v4, NotificationReason, v12, v20, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKQueryNotification *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
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
  uint64_t NotificationReason;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  objc_super v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v26.receiver = self;
  v26.super_class = (Class)CKQueryNotification;
  -[CKNotification encodeWithCoder:](&v26, sel_encodeWithCoder_, v4);
  NotificationReason = objc_msgSend_queryNotificationReason(self, v6, v7, v8);
  objc_msgSend_encodeInt64_forKey_(v4, v10, NotificationReason, (uint64_t)CFSTR("Reason"));
  objc_msgSend_recordFields(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("RecordFields"));

  objc_msgSend_recordID(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, (uint64_t)CFSTR("RecordID"));

  v24 = objc_msgSend_databaseScope(self, v21, v22, v23);
  objc_msgSend_encodeInt64_forKey_(v4, v25, v24, (uint64_t)CFSTR("DatabaseScope"));
  objc_autoreleasePoolPop(v5);

}

- (CKQueryNotification)initWithCoder:(id)a3
{
  id v4;
  CKQueryNotification *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSDictionary *recordFields;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  CKRecordID *recordID;
  const char *v21;
  uint64_t v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKQueryNotification;
  v5 = -[CKNotification initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v5->_queryNotificationReason = objc_msgSend_decodeInt64ForKey_(v4, v7, (uint64_t)CFSTR("Reason"), v8);
    CKAcceptableValueClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend_setByAddingObject_(v9, v11, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v13, (uint64_t)CFSTR("RecordFields"));
    v15 = objc_claimAutoreleasedReturnValue();
    recordFields = v5->_recordFields;
    v5->_recordFields = (NSDictionary *)v15;

    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("RecordID"));
    v19 = objc_claimAutoreleasedReturnValue();
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v19;

    v5->_databaseScope = objc_msgSend_decodeInt64ForKey_(v4, v21, (uint64_t)CFSTR("DatabaseScope"), v22);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSDictionary)recordFields
{
  CKQueryNotification *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_recordFields;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRecordFields:(id)a3
{
  CKQueryNotification *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSDictionary *recordFields;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  recordFields = v4->_recordFields;
  v4->_recordFields = (NSDictionary *)v8;

  objc_sync_exit(v4);
}

- (CKQueryNotificationReason)queryNotificationReason
{
  return self->_queryNotificationReason;
}

- (void)setQueryNotificationReason:(int64_t)a3
{
  self->_queryNotificationReason = a3;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
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
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_recordFields, 0);
}

- (BOOL)isPublicDatabase
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_databaseScope(self, a2, v2, v3) == 1;
}

@end
