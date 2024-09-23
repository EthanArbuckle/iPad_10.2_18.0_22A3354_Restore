@implementation CKSyncEngineDidFetchRecordZoneChangesEvent

- (CKSyncEngineDidFetchRecordZoneChangesEvent)initWithZoneID:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  char v9;
  id v10;
  id *v11;
  CKSyncEngineDidFetchRecordZoneChangesEvent *v12;
  void *v14;
  CKException *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  id v25;
  objc_super v26;
  id v27;

  v7 = a3;
  v8 = a4;
  v27 = 0;
  v9 = _CKCheckArgument((uint64_t)"zoneID", v7, 0, 0, 0, &v27);
  v10 = v27;
  if ((v9 & 1) == 0)
  {
    v14 = v10;
    v15 = [CKException alloc];
    v19 = objc_msgSend_code(v14, v16, v17, v18);
    objc_msgSend_localizedDescription(v14, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend_initWithCode_format_(v15, v24, v19, (uint64_t)CFSTR("%@"), v23);

    objc_exception_throw(v25);
  }

  v26.receiver = self;
  v26.super_class = (Class)CKSyncEngineDidFetchRecordZoneChangesEvent;
  v11 = -[CKSyncEngineEvent initInternal](&v26, sel_initInternal);
  v12 = (CKSyncEngineDidFetchRecordZoneChangesEvent *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 1, a3);
    objc_storeStrong((id *)&v12->_error, a4);
  }

  return v12;
}

- (int64_t)type
{
  return 8;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKSyncEngineDidFetchRecordZoneChangesEvent;
  v4 = a3;
  -[CKSyncEngineEvent CKDescribePropertiesUsing:](&v15, sel_CKDescribePropertiesUsing_, v4);
  objc_msgSend_zoneID(self, v5, v6, v7, v15.receiver, v15.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("zoneID"), (uint64_t)v8, 0);

  objc_msgSend_error(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v14, (uint64_t)CFSTR("error"), (uint64_t)v13, 0);

}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end
