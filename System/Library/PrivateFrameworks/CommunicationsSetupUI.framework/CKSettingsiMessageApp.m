@implementation CKSettingsiMessageApp

- (CKSettingsiMessageApp)initWithExtension:(id)a3
{
  id v4;
  CKSettingsiMessageApp *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSString *appBundleID;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *extensionDisplayName;
  void *v18;
  void *v19;
  NSString *v20;
  NSString *appDisplayName;
  char v22;
  CKSettingsiMessageApp *v23;
  id v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKSettingsiMessageApp;
  v5 = -[CKSettingsiMessageApp init](&v26, sel_init);
  if (!v5)
    goto LABEL_19;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v6, &v25);
  v8 = v25;
  if (v8)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v7, "containingBundleRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      v5->_isiMessageAppOnly = objc_msgSend(v11, "isLaunchProhibited");
      objc_storeStrong((id *)&v5->_extensionBundleID, v6);
      objc_msgSend(v11, "bundleIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      appBundleID = v5->_appBundleID;
      v5->_appBundleID = (NSString *)v12;

      objc_msgSend(v7, "localizedName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = v14;
      }
      else
      {
        objc_msgSend(v7, "localizedShortName");
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      extensionDisplayName = v5->_extensionDisplayName;
      v5->_extensionDisplayName = v16;

      objc_msgSend(v11, "localizedName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        objc_msgSend(v11, "localizedShortName");
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      appDisplayName = v5->_appDisplayName;
      v5->_appDisplayName = v20;

      v22 = (objc_msgSend(v11, "isDeletable") & 1) != 0 ? 1 : objc_msgSend(v11, "isDeletableSystemApplication");
      v5->_deletable = v22;

      v9 = 0;
    }
    else
    {
      v9 = 1;
    }

  }
  if (v9)
    v23 = 0;
  else
LABEL_19:
    v23 = v5;

  return v23;
}

- (id)_hiddenExtensionBundleIdentifiers
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.MobileSMS"));
  -[CKSettingsiMessageApp _stringArrayFromUserDefaults:key:](self, "_stringArrayFromUserDefaults:key:", v3, CFSTR("SendMenuHiddenExtensionBundleIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setHiddenExtensionBundleIdentifiers:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x24BDBCF50];
  v4 = a3;
  v5 = (id)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.MobileSMS"));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("SendMenuHiddenExtensionBundleIdentifiers"));

}

- (id)_stringArrayFromUserDefaults:(id)a3 key:(id)a4
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKey:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = v4;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v5, "addObject:", v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
    v12 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v12;
}

- (BOOL)isHiddenInSendMenuByUserPreference
{
  CKSettingsiMessageApp *v3;
  void *v4;

  if (self->_isiMessageAppOnly)
    return 0;
  v3 = self;
  -[CKSettingsiMessageApp _hiddenExtensionBundleIdentifiers](self, "_hiddenExtensionBundleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "containsObject:", v3->_extensionBundleID);

  return (char)v3;
}

- (void)setHiddenInSendMenuByUserPreference:(BOOL)a3
{
  _BOOL4 v3;
  NSString *v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  int v11;
  NSString *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v5 = self->_extensionBundleID;
  csui_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 1024;
    v14 = v3;
    _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_INFO, "Setting extension %@ to hidden=%{BOOL}d", (uint8_t *)&v11, 0x12u);
  }

  -[CKSettingsiMessageApp _hiddenExtensionBundleIdentifiers](self, "_hiddenExtensionBundleIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);
  if (!v3 || (v8 & 1) != 0)
  {
    if (v3 || ((v8 ^ 1) & 1) != 0)
    {
      csui_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CKSettingsiMessageApp setHiddenInSendMenuByUserPreference:].cold.1((uint64_t)v5, v3, v9);
    }
    else
    {
      v9 = objc_msgSend(v7, "mutableCopy");
      -[NSObject removeObject:](v9, "removeObject:", v5);
      v10 = -[NSObject copy](v9, "copy");
      -[CKSettingsiMessageApp _setHiddenExtensionBundleIdentifiers:](self, "_setHiddenExtensionBundleIdentifiers:", v10);

    }
  }
  else
  {
    objc_msgSend(v7, "arrayByAddingObject:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    -[CKSettingsiMessageApp _setHiddenExtensionBundleIdentifiers:](self, "_setHiddenExtensionBundleIdentifiers:", v9);
  }

}

- (NSString)extensionBundleID
{
  return self->_extensionBundleID;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)extensionDisplayName
{
  return self->_extensionDisplayName;
}

- (NSString)appDisplayName
{
  return self->_appDisplayName;
}

- (BOOL)isiMessageAppOnly
{
  return self->_isiMessageAppOnly;
}

- (BOOL)isDeletable
{
  return self->_deletable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDisplayName, 0);
  objc_storeStrong((id *)&self->_extensionDisplayName, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_extensionBundleID, 0);
}

- (void)setHiddenInSendMenuByUserPreference:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_error_impl(&dword_2138BA000, log, OS_LOG_TYPE_ERROR, "Extension %@ was already hidden=%{BOOL}d", (uint8_t *)&v3, 0x12u);
}

@end
