@implementation CKDFetchUserPrivacySettingsOperation

- (CKDFetchUserPrivacySettingsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDFetchUserPrivacySettingsOperation;
  return -[CKDOperation initWithOperationInfo:container:](&v5, sel_initWithOperationInfo_container_, a3, a4);
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/get-user-privacy-settings", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_handleRetrievedPrivacySettings:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1BE990000, v5, OS_LOG_TYPE_INFO, "Found user privacy settings %@", (uint8_t *)&v12, 0xCu);
  }
  if (objc_msgSend_hasDiscoverable(v4, v6, v7))
  {
    if (objc_msgSend_discoverable(v4, v8, v9))
      objc_msgSend_setDiscoverable_(self, v10, 1);
    else
      objc_msgSend_setDiscoverable_(self, v10, 2);
  }
  else
  {
    objc_msgSend_setDiscoverable_(self, v8, 0);
  }
  objc_msgSend_finishWithError_(self, v11, 0);

}

- (int)operationType
{
  return 402;
}

- (void)main
{
  CKDFetchUserPrivacySettingsURLRequest *v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id from;
  id location;

  v3 = [CKDFetchUserPrivacySettingsURLRequest alloc];
  v5 = (void *)objc_msgSend_initWithOperation_(v3, v4, (uint64_t)self);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = sub_1BEC38644;
  v15 = &unk_1E782E468;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  objc_msgSend_setCompletionBlock_(v5, v6, (uint64_t)&v12);
  objc_msgSend_setRequest_(self, v7, (uint64_t)v5, v12, v13, v14, v15);
  objc_msgSend_container(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v10, v11, (uint64_t)v5);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (int64_t)discoverable
{
  return self->_discoverable;
}

- (void)setDiscoverable:(int64_t)a3
{
  self->_discoverable = a3;
}

@end
