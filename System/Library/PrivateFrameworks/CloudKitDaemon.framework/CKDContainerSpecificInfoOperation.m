@implementation CKDContainerSpecificInfoOperation

- (CKDContainerSpecificInfoOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v4;
  dispatch_group_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDContainerSpecificInfoOperation;
  v4 = -[CKDOperation initWithOperationInfo:container:](&v8, sel_initWithOperationInfo_container_, a3, a4);
  if (v4)
  {
    v5 = dispatch_group_create();
    v6 = (void *)*((_QWORD *)v4 + 58);
    *((_QWORD *)v4 + 58) = v5;

    dispatch_group_enter(*((dispatch_group_t *)v4 + 58));
  }
  return (CKDContainerSpecificInfoOperation *)v4;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/container-specific-info", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

- (void)setCompletionBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;
  _QWORD aBlock[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BEC2E518;
  aBlock[3] = &unk_1E7830220;
  v5 = v4;
  v9 = v5;
  objc_copyWeak(&v10, &location);
  v6 = _Block_copy(aBlock);
  v7.receiver = self;
  v7.super_class = (Class)CKDContainerSpecificInfoOperation;
  -[CKDOperation setCompletionBlock:](&v7, sel_setCompletionBlock_, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)main
{
  CKDContainerSpecificInfoURLRequest *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30;
  id from;
  id location;

  v3 = [CKDContainerSpecificInfoURLRequest alloc];
  objc_msgSend_container(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithOperation_containerIdentifier_(v3, v13, (uint64_t)self, v12);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v14);
  v17 = objc_msgSend_requireUserIDs(self, v15, v16);
  objc_msgSend_setRequireUserIDs_(v14, v18, v17);
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = sub_1BEC2E704;
  v28 = &unk_1E782E468;
  objc_copyWeak(&v29, &location);
  objc_copyWeak(&v30, &from);
  objc_msgSend_setCompletionBlock_(v14, v19, (uint64_t)&v25);
  objc_msgSend_setRequest_(self, v20, (uint64_t)v14, v25, v26, v27, v28);
  objc_msgSend_container(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v23, v24, (uint64_t)v14);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (BOOL)requireUserIDs
{
  return self->_requireUserIDs;
}

- (void)setRequireUserIDs:(BOOL)a3
{
  self->_requireUserIDs = a3;
}

- (CKDContainerServerInfo)containerServerInfo
{
  return self->_containerServerInfo;
}

- (void)setContainerServerInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (OS_dispatch_group)infoFetchedGroup
{
  return self->_infoFetchedGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoFetchedGroup, 0);
  objc_storeStrong((id *)&self->_containerServerInfo, 0);
}

@end
