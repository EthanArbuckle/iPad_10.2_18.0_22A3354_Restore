@implementation APSettingsStorageUserDefaults

- (APSettingsStorageUserDefaults)initWithDefaultValues:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  APSettingsStorageUserDefaults *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *defaults;
  APSettingsStorageUserDefaults *v18;
  NSObject *v19;
  uint8_t v21[16];
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)APSettingsStorageUserDefaults;
  v8 = -[APSettingsStorageUserDefaults init](&v22, sel_init);
  if (!v8)
    goto LABEL_4;
  if ((objc_msgSend_isAppleInternalInstall(APSystemInternal, v5, v6, v7) & 1) != 0)
  {
    v9 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v12 = (void *)objc_msgSend_initWithSuiteName_(v9, v10, (uint64_t)CFSTR("com.apple.AdPlatforms"), v11);
    v16 = objc_msgSend_copy(v4, v13, v14, v15);
    defaults = v8->_defaults;
    v8->_defaults = (NSDictionary *)v16;

LABEL_4:
    v18 = v8;
    goto LABEL_8;
  }
  APLogForCategory(0x29uLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1CF251000, v19, OS_LOG_TYPE_ERROR, "Support for user defaults storage is not supported for this case, please utilize another storage type.", v21, 2u);
  }

  v18 = 0;
LABEL_8:

  return v18;
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;

  v5 = a3;
  if (objc_msgSend_isAppleInternalInstall(APSystemInternal, v6, v7, v8))
  {
    v9 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v12 = (void *)objc_msgSend_initWithSuiteName_(v9, v10, (uint64_t)CFSTR("com.apple.AdPlatforms"), v11);
    objc_msgSend_objectForKey_(v12, v13, (uint64_t)v5, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v15;
    if (v15)
    {
      v20 = v15;
    }
    else
    {
      objc_msgSend_defaults(self, v16, v17, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastNamespacedComponent(v5, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v21, v26, (uint64_t)v25, v27);
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSDictionary)defaults
{
  return self->_defaults;
}

- (id)valueForKey:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_valueForKey_error_, a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_setValue_forKey_error_, a3, a4);
}

- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend_isAppleInternalInstall(APSystemInternal, v9, v10, v11))
  {
    v12 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v15 = (void *)objc_msgSend_initWithSuiteName_(v12, v13, (uint64_t)CFSTR("com.apple.AdPlatforms"), v14);
    objc_msgSend_defaults(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastNamespacedComponent(v8, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v19, v24, (uint64_t)v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_isEqual_(v26, v27, (uint64_t)v7, v28))
    {
      objc_msgSend_setObject_forKey_(v15, v29, 0, (uint64_t)v8);
    }
    else
    {
      objc_msgSend_setObject_forKey_(v15, v29, (uint64_t)v7, (uint64_t)v8);
      v37 = CFSTR("Key");
      v38[0] = v8;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v30, (uint64_t)v38, (uint64_t)&v37, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_postNotificationName_object_userInfo_(v35, v36, (uint64_t)CFSTR("com.apple.AdPlatforms.defaultsDidChange"), (uint64_t)self, v31);

    }
  }

}

- (void)synchronize
{
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0C9B248]);
}

@end
