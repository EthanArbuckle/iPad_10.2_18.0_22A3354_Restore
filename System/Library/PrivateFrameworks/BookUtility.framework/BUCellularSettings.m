@implementation BUCellularSettings

+ (id)settingsForIdentity:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend_defaultsKey(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend_initWithDefaultsKey_(v5, v9, (uint64_t)v8);
  return v10;
}

- (BUCellularSettings)initWithDefaultsKey:(id)a3
{
  id v5;
  BUCellularSettings *v6;
  BUCellularSettings *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BUCellularSettings;
  v6 = -[BUCellularSettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_defaultsKey, a3);

  return v7;
}

- (BOOL)allowAutomaticDownloads
{
  return CFPreferencesGetAppBooleanValue(CFSTR("AllowAutoDownloadOnCellular"), CFSTR("com.apple.iBooks"), 0) != 0;
}

- (void)setAllowAutomaticDownloads:(BOOL)a3
{
  id v3;

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], a2, a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("AllowAutoDownloadOnCellular"), v3, CFSTR("com.apple.iBooks"));

}

- (BOOL)legacyAllowAutomaticDownloads
{
  return CFPreferencesGetAppBooleanValue(CFSTR("AllowAutoDownloadOnCellular"), CFSTR("com.apple.itunesstored"), 0) != 0;
}

- (int64_t)cellularDataPrompt
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  int64_t v11;
  const char *v12;

  objc_msgSend__cellularSettings(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v5, (uint64_t)self->_defaultsKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v6, v7, (uint64_t)CFSTR("CellularDataPrompt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v8, v9, (uint64_t)CFSTR("Always")) & 1) != 0)
  {
    v11 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v8, v10, (uint64_t)CFSTR("OverLimit")) & 1) != 0)
  {
    v11 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v8, v12, (uint64_t)CFSTR("Never")))
  {
    v11 = 2;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setCellularDataPrompt:(int64_t)a3
{
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  id v15;

  objc_msgSend__cellularSettings(self, a2, a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v15, v5, (uint64_t)self->_defaultsKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDBCED8]);
  v9 = (void *)objc_msgSend_initWithDictionary_(v7, v8, (uint64_t)v15);
  v10 = objc_alloc(MEMORY[0x24BDBCED8]);
  v12 = (void *)objc_msgSend_initWithDictionary_(v10, v11, (uint64_t)v6);
  objc_msgSend_setObject_forKey_(v9, v13, (uint64_t)v12, self->_defaultsKey);
  if ((unint64_t)a3 <= 2)
    objc_msgSend_setObject_forKey_(v12, v14, (uint64_t)off_24CED9F10[a3], CFSTR("CellularDataPrompt"));
  CFPreferencesSetAppValue(CFSTR("CellularSettings"), v9, CFSTR("com.apple.iBooks"));

}

+ (BOOL)shouldShowCellularAutomaticDownloadsSwitch
{
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  char v7;

  v2 = (void *)objc_opt_class();
  v4 = (void *)objc_msgSend__copyValueForCarrierBundleKey_(v2, v3, (uint64_t)CFSTR("ShowiTunesStoreAutoDownloadOverCellularSwitch"));
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend_BOOLValue(v4, v5, v6);
    else
      v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)_cellularSettings
{
  return (id)(id)CFPreferencesCopyValue(CFSTR("CellularSettings"), CFSTR("com.apple.iBooks"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
}

+ (id)_copyValueForCarrierBundleKey:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  id v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  id v15;
  char *v16;
  uint64_t v17;
  id v19;
  id v20;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDC2810]);
  v6 = (void *)objc_msgSend_initWithQueue_(v4, v5, 0);
  v20 = 0;
  objc_msgSend_getCurrentDataSubscriptionContextSync_(v6, v7, (uint64_t)&v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  if (v8)
  {
    v10 = objc_alloc(MEMORY[0x24BDC2700]);
    v12 = objc_msgSend_initWithBundleType_(v10, v11, 1);
    v19 = v9;
    v14 = (void *)objc_msgSend_copyCarrierBundleValue_key_bundleType_error_(v6, v13, (uint64_t)v8, v3, v12, &v19);
    v15 = v19;

    v9 = v15;
  }
  else
  {
    BookUtilityLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_212E6C28C((uint64_t)v9, v12);
    v14 = 0;
  }

  if (v9)
  {
    BookUtilityLog();
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      sub_212E6C1CC(v9, v16, v17);

  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsKey, 0);
}

@end
