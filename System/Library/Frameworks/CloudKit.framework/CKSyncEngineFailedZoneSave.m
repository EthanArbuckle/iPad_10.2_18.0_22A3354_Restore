@implementation CKSyncEngineFailedZoneSave

- (CKSyncEngineFailedZoneSave)initWithZone:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  char v9;
  id v10;
  char v11;
  CKSyncEngineFailedZoneSave *v12;
  CKSyncEngineFailedZoneSave *v13;
  void *v15;
  CKException *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;
  objc_super v27;
  id v28;
  id v29;

  v7 = a3;
  v8 = a4;
  v29 = 0;
  v9 = _CKCheckArgument((uint64_t)"zone", v7, 0, 0, 0, &v29);
  v10 = v29;
  if ((v9 & 1) == 0
    || (v10,
        v28 = 0,
        v11 = _CKCheckArgument((uint64_t)"error", v8, 0, 0, 0, &v28),
        v10 = v28,
        (v11 & 1) == 0))
  {
    v15 = v10;
    v16 = [CKException alloc];
    v20 = objc_msgSend_code(v15, v17, v18, v19);
    objc_msgSend_localizedDescription(v15, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend_initWithCode_format_(v16, v25, v20, (uint64_t)CFSTR("%@"), v24);

    objc_exception_throw(v26);
  }

  v27.receiver = self;
  v27.super_class = (Class)CKSyncEngineFailedZoneSave;
  v12 = -[CKSyncEngineFailedZoneSave init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_recordZone, a3);
    objc_storeStrong((id *)&v13->_error, a4);
  }

  return v13;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineFailedZoneSave *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineFailedZoneSave *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return CFSTR("FailedZoneSave");
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
  const char *v13;
  id v14;

  v4 = a3;
  objc_msgSend_recordZone(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("zone"), (uint64_t)v8, 0);

  objc_msgSend_error(self, v10, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v13, (uint64_t)CFSTR("error"), (uint64_t)v14, 0);

}

- (CKRecordZone)recordZone
{
  return self->_recordZone;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_recordZone, 0);
}

@end
