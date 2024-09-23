@implementation CKDSaveUserPrivacySettingsOperation

- (CKDSaveUserPrivacySettingsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDSaveUserPrivacySettingsOperation *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKDSaveUserPrivacySettingsOperation;
  v9 = -[CKDOperation initWithOperationInfo:container:](&v11, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
    v9->_discoverable = objc_msgSend_discoverable(v6, v7, v8);

  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/save-user-privacy-settings", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

+ (int64_t)isPredominatelyDownload
{
  return 0;
}

- (void)main
{
  CKDSaveUserPrivacySettingsURLRequest *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  _BOOL8 v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id from;
  id location;

  v3 = [CKDSaveUserPrivacySettingsURLRequest alloc];
  v5 = (void *)objc_msgSend_initWithOperation_(v3, v4, (uint64_t)self);
  if (objc_msgSend_discoverable(self, v6, v7))
  {
    v10 = objc_msgSend_discoverable(self, v8, v9) == 1;
    objc_msgSend_setDiscoverable_(v5, v11, v10);
  }
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = sub_1BEC41B00;
  v21 = &unk_1E782E468;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  objc_msgSend_setCompletionBlock_(v5, v12, (uint64_t)&v18);
  objc_msgSend_setRequest_(self, v13, (uint64_t)v5, v18, v19, v20, v21);
  objc_msgSend_container(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v16, v17, (uint64_t)v5);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (int)operationType
{
  return 403;
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
