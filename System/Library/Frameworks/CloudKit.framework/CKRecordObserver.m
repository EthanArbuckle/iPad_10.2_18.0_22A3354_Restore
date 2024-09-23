@implementation CKRecordObserver

- (CKRecordObserver)init
{
  return (CKRecordObserver *)MEMORY[0x1E0DE7D20](self, sel_initWithContainer_recordType_, 0, 0);
}

- (CKRecordObserver)initWithContainer:(id)a3 recordType:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  CKRecordObserver *v22;

  v6 = a3;
  v10 = a4;
  if (v6)
  {
    v11 = v6;
  }
  else
  {
    objc_msgSend_defaultContainer(CKContainer, v7, v8, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v11;
  objc_msgSend_setupInfo(v11, v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordChangeProvider(v15, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (CKRecordObserver *)objc_msgSend_initWithContainerInfo_recordType_provider_(self, v21, (uint64_t)v16, (uint64_t)v10, v20);

  return v22;
}

- (CKRecordObserver)initWithContainerInfo:(id)a3 recordType:(id)a4 provider:(id)a5
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CKRecordObserver *v19;
  uint64_t v20;
  CKContainerSetupInfo *containerInfo;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *recordType;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  objc_super v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecordObserver.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerInfo"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v14);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecordObserver.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider"));

LABEL_3:
  v32.receiver = self;
  v32.super_class = (Class)CKRecordObserver;
  v19 = -[CKRecordObserver init](&v32, sel_init);
  if (v19)
  {
    v20 = objc_msgSend_copy(v9, v16, v17, v18);
    containerInfo = v19->_containerInfo;
    v19->_containerInfo = (CKContainerSetupInfo *)v20;

    v25 = objc_msgSend_copy(v10, v22, v23, v24);
    recordType = v19->_recordType;
    v19->_recordType = (NSString *)v25;

    objc_storeStrong((id *)&v19->_provider, a5);
  }

  return v19;
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
  objc_msgSend_recordType(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("recordType"), (uint64_t)v8, 0);

  objc_msgSend_containerInfo(self, v10, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v13, (uint64_t)CFSTR("container"), (uint64_t)v14, 0);

}

- (NSString)description
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x18D76DE4C](self, a2);
  objc_msgSend_CKObjectDescriptionRedact_avoidShortDescription_(self, v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSString *)v9;
}

- (id)redactedDescription
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x18D76DE4C](self, a2);
  objc_msgSend_CKObjectDescriptionRedact_avoidShortDescription_(self, v4, 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v9;
}

- (void)registerWithBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  id v9;

  v4 = a3;
  objc_msgSend_provider(self, v5, v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addRecordObserver_block_(v9, v8, (uint64_t)self, (uint64_t)v4);

}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_provider(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeRecordObserver_(v7, v5, (uint64_t)self, v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  CKRecordObserver *v4;
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
  void *v16;
  const char *v17;
  void *v18;

  v4 = [CKRecordObserver alloc];
  objc_msgSend_containerInfo(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordType(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_provider(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_initWithContainerInfo_recordType_provider_(v4, v17, (uint64_t)v8, (uint64_t)v12, v16);

  return v18;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (CKContainerSetupInfo)containerInfo
{
  return self->_containerInfo;
}

- (CKRecordObservable)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_containerInfo, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
}

@end
