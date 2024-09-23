@implementation CKSyncEngineAccountChangeEvent

- (CKSyncEngineAccountChangeEvent)initWithPreviousUser:(id)a3 currentUser:(id)a4
{
  id v7;
  id v8;
  id *v9;
  CKSyncEngineAccountChangeEvent *v10;
  uint64_t v11;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20[16];
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CKSyncEngineAccountChangeEvent;
  v9 = -[CKSyncEngineEvent initInternal](&v21, sel_initInternal);
  v10 = (CKSyncEngineAccountChangeEvent *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 2, a3);
    objc_storeStrong((id *)&v10->_currentUser, a4);
    if (v8)
    {
      if (!v7)
      {
        v10->_changeType = 0;
        goto LABEL_9;
      }
      v11 = 2;
    }
    else
    {
      if (!v7)
      {
        if (ck_log_initialization_predicate != -1)
          goto LABEL_14;
        while (1)
        {
          v13 = ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v20 = 0;
            _os_log_error_impl(&dword_18A5C5000, v13, OS_LOG_TYPE_ERROR, "BUG IN CLOUDKIT: Tried to create an account change event with no current user and no previous user", v20, 2u);
          }
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v14, (uint64_t)CFSTR("BUG IN CLOUDKIT: Tried to create an account change event with no current user and no previous user"), v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UTF8String(v16, v17, v18, v19);
          _os_crash();
          __break(1u);
LABEL_14:
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
      }
      v11 = 1;
    }
    v10->_changeType = v11;
  }
LABEL_9:

  return v10;
}

- (int64_t)type
{
  return 1;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CKSyncEngineAccountChangeEvent;
  v4 = a3;
  -[CKSyncEngineEvent CKDescribePropertiesUsing:](&v20, sel_CKDescribePropertiesUsing_, v4);
  v8 = objc_msgSend_changeType(self, v5, v6, v7, v20.receiver, v20.super_class);
  if (v8 > 2)
    objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("changeType"), (uint64_t)CFSTR("Unknown"), 0);
  else
    objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("changeType"), (uint64_t)off_1E1F5FC70[v8], 0);
  objc_msgSend_previousUser(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v14, (uint64_t)CFSTR("previousUser"), (uint64_t)v13, 0);

  objc_msgSend_currentUser(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v19, (uint64_t)CFSTR("currentUser"), (uint64_t)v18, 0);

}

- (CKSyncEngineAccountChangeType)changeType
{
  return self->_changeType;
}

- (CKRecordID)previousUser
{
  return self->_previousUser;
}

- (CKRecordID)currentUser
{
  return self->_currentUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_previousUser, 0);
}

@end
