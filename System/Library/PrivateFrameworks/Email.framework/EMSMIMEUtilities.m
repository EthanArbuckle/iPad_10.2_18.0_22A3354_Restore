@implementation EMSMIMEUtilities

void ___ef_log_EMSMIMEUtilities_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EMSMIMEUtilities");
  v1 = (void *)_ef_log_EMSMIMEUtilities_log;
  _ef_log_EMSMIMEUtilities_log = (uint64_t)v0;

}

+ (unint64_t)_messageSecurityLevelViaOtherDevices
{
  unint64_t v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  float v24;
  BOOL v25;
  void *v26;
  int v27;
  void *v28;
  float v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];
  uint64_t v48;
  _QWORD v49[4];

  v49[1] = *MEMORY[0x1E0C80C00];
  if (!+[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 31))
  {
    if (sComputedMessageSecurityLevel == 1)
      return sCurrentSecurityLevel;
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = *MEMORY[0x1E0C8F030];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(v36, "accountsWithAccountTypeIdentifiers:error:", v3, &v44);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v44;
    objc_msgSend(v4, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      _ef_log_EMSMIMEUtilities();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v5;
        _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_DEFAULT, "Error in getting account: %@\nWill drop to most-compatible", buf, 0xCu);
      }

      v2 = 100;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "altDSIDForAccount:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc_init(MEMORY[0x1E0D00130]);
    objc_msgSend(v33, "setAppleIDWithAltDSID:inUse:forService:", v34, 1, 1);
    v7 = objc_alloc_init(MEMORY[0x1E0D001E0]);
    objc_msgSend(v35, "aa_altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAltDSID:", v8);

    objc_msgSend(v7, "setIncludeUntrustedDevices:", 1);
    v48 = *MEMORY[0x1E0D000A8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setServices:", v9);

    objc_msgSend(v7, "setOperatingSystems:", &unk_1E711F730);
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __56__EMSMIMEUtilities__messageSecurityLevelViaOtherDevices__block_invoke;
    v42[3] = &unk_1E70F3AF8;
    v11 = v10;
    v43 = v11;
    v30 = v11;
    objc_msgSend(v33, "fetchDeviceListWithContext:completion:", v7, v42);
    objc_msgSend(v11, "future");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(v12, "result:", &v41);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v41;

    if (v5)
    {
      _ef_log_EMSMIMEUtilities();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v5;
        _os_log_impl(&dword_1B99BB000, v13, OS_LOG_TYPE_DEFAULT, "Error in getting devices: %@\nWill drop to most-compatible", buf, 0xCu);
      }
LABEL_12:
      v14 = 0;
LABEL_13:

      v15 = v32;
      goto LABEL_14;
    }
    v15 = v32;
    if (!objc_msgSend(v32, "count"))
    {
      v14 = 1;
LABEL_14:

      if (v14)
        v2 = 200;
      else
        v2 = 100;
LABEL_17:

      sCurrentSecurityLevel = v2;
      sComputedMessageSecurityLevel = 1;

      return v2;
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v13 = v32;
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (!v17)
    {
      v14 = 1;
      goto LABEL_13;
    }
    v18 = *(_QWORD *)v38;
LABEL_22:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v18)
        objc_enumerationMutation(v13);
      v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v19);
      objc_msgSend(v20, "operatingSystemName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("macOS"));

      if (v22)
        break;
      objc_msgSend(v20, "operatingSystemName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("iOS"));

      if (v27)
      {
        objc_msgSend(v20, "operatingSystemVersion");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "floatValue");
        v25 = v29 < 17.0;

LABEL_29:
        if (v25)
          goto LABEL_12;
      }
      if (v17 == ++v19)
      {
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        v14 = 1;
        if (!v17)
          goto LABEL_13;
        goto LABEL_22;
      }
    }
    objc_msgSend(v20, "operatingSystemVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "floatValue");
    v25 = v24 < 14.0;

    goto LABEL_29;
  }
  return 200;
}

uint64_t __56__EMSMIMEUtilities__messageSecurityLevelViaOtherDevices__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

+ (BOOL)_isICloudAddress:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (objc_msgSend(v4, "hasSuffix:", CFSTR("@icloud.com")) & 1) != 0
    || (objc_msgSend(v4, "hasSuffix:", CFSTR("@mac.com")) & 1) != 0
    || objc_msgSend(v4, "hasSuffix:", CFSTR("@me.com"));

  return v5;
}

+ (unint64_t)_encryptionLevelForSender:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0
    && +[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 29))
  {
    if (v4 && objc_msgSend(a1, "_isICloudAddress:", v4))
      v5 = objc_msgSend(a1, "_messageSecurityLevelViaOtherDevices");
    else
      v5 = 200;
  }
  else
  {
    v5 = 100;
  }

  return v5;
}

+ (unint64_t)encryptionLevelForSender:(id)a3 forAdvertisement:(BOOL)a4 useGCM:(BOOL *)a5 encryptSubject:(BOOL *)a6
{
  _BOOL4 v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v8 = a4;
  v9 = objc_msgSend(a1, "_encryptionLevelForSender:", a3);
  v10 = v9;
  if (a5)
  {
    if (v9 == 200)
    {
      v11 = 1;
    }
    else
    {
      if (v8)
        v12 = 32;
      else
        v12 = 34;
      v11 = +[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", v12);
    }
    *a5 = v11;
  }
  if (a6)
  {
    if (v10 == 200)
    {
      v13 = 1;
    }
    else
    {
      if (v8)
        v14 = 33;
      else
        v14 = 35;
      v13 = +[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", v14);
    }
    *a6 = v13;
  }
  return v10;
}

@end
