@implementation CKDResetUserPrivacySettingsOperation

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/reset-user-privacy-settings", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  CKDResetUserPrivacySettingsURLRequest *v3;
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

  v3 = [CKDResetUserPrivacySettingsURLRequest alloc];
  v5 = (void *)objc_msgSend_initWithOperation_(v3, v4, (uint64_t)self);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = sub_1BEB64194;
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

- (int)operationType
{
  return 404;
}

@end
