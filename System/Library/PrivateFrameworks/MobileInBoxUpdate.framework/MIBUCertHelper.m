@implementation MIBUCertHelper

+ (BOOL)SUCertPresent
{
  void *v2;
  int v3;
  NSObject *v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (os_variant_has_internal_content()
    && (+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "factorySUCertExist"),
        v2,
        v3))
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_13);
    v4 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222C3F000, v4, OS_LOG_TYPE_DEFAULT, "Overriding factory SU certificate existence to YES", buf, 2u);
    }
    return 1;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = (id)suCertPaths;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v19;
      v5 = 1;
      *(_QWORD *)&v8 = 138543362;
      v17 = v8;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v17, (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

          if ((v14 & 1) == 0)
          {
            if (MIBUOnceToken != -1)
              dispatch_once(&MIBUOnceToken, &__block_literal_global_9);
            v15 = MIBUConnObj;
            v5 = 0;
            if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              v23 = v12;
              _os_log_impl(&dword_222C3F000, v15, OS_LOG_TYPE_DEFAULT, "Certificate file %{public}@ does not exist", buf, 0xCu);
              v5 = 0;
            }
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v9);
    }
    else
    {
      v5 = 1;
    }

  }
  return v5;
}

void __31__MIBUCertHelper_SUCertPresent__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __31__MIBUCertHelper_SUCertPresent__block_invoke_8()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

+ (void)readSUIdentityWithCompletion:(id)a3
{
  void (**v4)(id, void *, void *, id);
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *, id))a3;
  if (os_variant_has_internal_content())
  {
    +[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "factorySUCertPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      +[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "factorySUCertPath");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_10_1);
      v9 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v8;
        _os_log_impl(&dword_222C3F000, v9, OS_LOG_TYPE_DEFAULT, "Overriding SU certificate path to %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v8 = CFSTR("/private/var/hardware/factory/su/su0-cert.der");
    }
    +[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "factorySUKeyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      +[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "factorySUKeyPath");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_12_2);
      v14 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v10;
        _os_log_impl(&dword_222C3F000, v14, OS_LOG_TYPE_DEFAULT, "Overriding SU key path to %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v10 = CFSTR("/private/var/hardware/factory/su/su0-key.der");
    }
  }
  else
  {
    v10 = CFSTR("/private/var/hardware/factory/su/su0-key.der");
    v8 = CFSTR("/private/var/hardware/factory/su/su0-cert.der");
  }
  v23 = 0;
  objc_msgSend(a1, "_getCertDataFromPath:error:", v8, &v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v23;
  if (v16)
  {
    v20 = v16;
    v19 = 0;
    v17 = 0;
  }
  else
  {
    v22 = 0;
    objc_msgSend(a1, "_parseDERCertificates:error:", v15, &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v22;
    if (v18)
    {
      v20 = v18;
      v19 = 0;
    }
    else
    {
      v21 = 0;
      objc_msgSend(a1, "_getCertDataFromPath:error:", v10, &v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v21;
    }
  }
  v4[2](v4, v17, v19, v20);

}

void __47__MIBUCertHelper_readSUIdentityWithCompletion___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __47__MIBUCertHelper_readSUIdentityWithCompletion___block_invoke_11()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

+ (void)trustCertificatesWithCompletion:(id)a3
{
  void (**v4)(id, void *, void *, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void (**v30)(id, void *, void *, id);
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *, id))a3;
  if (!os_variant_has_internal_content())
  {
    v10 = 0;
    v11 = 0;
    v31 = 0;
    v8 = 0;
    v12 = CFSTR("retail-wifi-cert.apple.com");
    goto LABEL_31;
  }
  +[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iseTrustCertPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iseTrustCertPaths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_15_1);
    v9 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = (uint64_t)v8;
      _os_log_impl(&dword_222C3F000, v9, OS_LOG_TYPE_DEFAULT, "Overriding ISE trust certificate paths to: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v8 = 0;
  }
  +[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "iseTrustCertName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v12 = CFSTR("retail-wifi-cert.apple.com");
    if (!v8)
      goto LABEL_27;
    goto LABEL_16;
  }
  +[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "iseTrustCertName");
  v16 = objc_claimAutoreleasedReturnValue();

  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_17_2);
  v17 = MIBUConnObj;
  if (!os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (__CFString *)v16;
    if (!v8)
      goto LABEL_27;
    goto LABEL_16;
  }
  *(_DWORD *)buf = 138543362;
  v40 = v16;
  v12 = (__CFString *)v16;
  _os_log_impl(&dword_222C3F000, v17, OS_LOG_TYPE_DEFAULT, "Overriding ISE trust certificate name to: %{public}@", buf, 0xCu);
  if (v8)
  {
LABEL_16:
    v29 = v12;
    v30 = v4;
    v31 = (void *)objc_opt_new();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v28 = v8;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v19)
    {
      v20 = v19;
      v11 = 0;
      v10 = 0;
      v21 = *(_QWORD *)v35;
      while (2)
      {
        v22 = 0;
        v23 = v11;
        v24 = v10;
        do
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(v18);
          v25 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v22);
          v33 = 0;
          objc_msgSend(a1, "_getCertDataFromPath:error:", v25, &v33, v28);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v33;

          if (v26)
          {
            v11 = v23;
LABEL_34:
            v8 = v18;

            v27 = 0;
            v12 = v29;
            v4 = v30;
            goto LABEL_32;
          }
          v32 = 0;
          objc_msgSend(a1, "_parseDERCertificates:error:", v10, &v32);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v32;

          if (v26)
            goto LABEL_34;
          objc_msgSend(v31, "addObjectsFromArray:", v11);
          ++v22;
          v23 = v11;
          v24 = v10;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v20)
          continue;
        break;
      }
    }
    else
    {
      v11 = 0;
      v10 = 0;
    }

    v12 = v29;
    v4 = v30;
    v8 = v28;
    if (!v29)
      goto LABEL_28;
LABEL_31:
    v27 = (void *)objc_opt_new();
    objc_msgSend(v27, "addObject:", v12);
    v26 = 0;
    goto LABEL_32;
  }
LABEL_27:
  v31 = 0;
  v11 = 0;
  v10 = 0;
  if (v12)
    goto LABEL_31;
LABEL_28:
  v26 = 0;
  v27 = 0;
LABEL_32:
  v4[2](v4, v31, v27, v26);

}

void __50__MIBUCertHelper_trustCertificatesWithCompletion___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __50__MIBUCertHelper_trustCertificatesWithCompletion___block_invoke_16()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

+ (__SecKey)suCertKeyFromData:(id)a3 isSEPKey:(BOOL)a4 error:(id *)a5
{
  const __CFData *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __SecKey *v17;
  id v18;
  const __CFDictionary *v19;
  NSObject *v20;
  SecAccessControlRef v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[16];
  CFErrorRef error;
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x24BDAC8D0];
  v7 = (const __CFData *)a3;
  error = 0;
  if (!os_variant_has_internal_content() || a4)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_24_1);
    v20 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222C3F000, v20, OS_LOG_TYPE_DEFAULT, "Factory SU key is SEP key", buf, 2u);
    }
    v21 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x24BDE8F88], 0x40000000uLL, &error);
    if (v21)
    {
      v26 = *MEMORY[0x24BDE9158];
      v40[0] = *MEMORY[0x24BDE9018];
      v40[1] = v26;
      v27 = *MEMORY[0x24BDE9160];
      v41[0] = MEMORY[0x24BDBD1C0];
      v41[1] = v27;
      v28 = *MEMORY[0x24BDE8F48];
      v40[2] = *MEMORY[0x24BDE9178];
      v40[3] = v28;
      v41[2] = v7;
      v41[3] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 4);
      v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v17 = SecKeyCreateWithData((CFDataRef)objc_msgSend(MEMORY[0x24BDBCE50], "data"), v19, &error);
      if (v17)
      {
        v18 = 0;
      }
      else
      {
        v35 = 0;
        safeAssignError(&v35, 50331648, error, CFSTR("Failed to convert RK data blob."), v29, v30, v31, v32, v34);
        v18 = v35;
      }
    }
    else
    {
      v36 = 0;
      safeAssignError(&v36, 0x1000000, error, CFSTR("Failed to create access control."), v22, v23, v24, v25, v34);
      v18 = v36;
      v19 = 0;
      v17 = 0;
    }
  }
  else
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_19_2);
    v8 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222C3F000, v8, OS_LOG_TYPE_DEFAULT, "Factory SU key is not SEP key", buf, 2u);
    }
    v9 = *MEMORY[0x24BDE9080];
    v10 = *MEMORY[0x24BDE9028];
    v42[0] = *MEMORY[0x24BDE9188];
    v42[1] = v10;
    v11 = *MEMORY[0x24BDE9030];
    v43[0] = v9;
    v43[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v17 = SecKeyCreateWithData(v7, v12, &error);
    if (!v17 || error)
    {
      v37 = 0;
      safeAssignError(&v37, 50331648, error, CFSTR("Failed to create SecKeyRef with data"), v13, v14, v15, v16, v34);
      v18 = v37;
    }
    else
    {
      v18 = 0;
    }

    v19 = 0;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v18);

  return v17;
}

void __51__MIBUCertHelper_suCertKeyFromData_isSEPKey_error___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __51__MIBUCertHelper_suCertKeyFromData_isSEPKey_error___block_invoke_23()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

+ (id)certificatesFromData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  SecCertificateRef v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SecCertificateRef v16;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        v11 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i));
        if (!v11)
        {
          v19 = 0;
          safeAssignError(&v19, 50331648, 0, CFSTR("Failed to create certificate from data."), v12, v13, v14, v15, v18);
          v8 = v19;
          goto LABEL_11;
        }
        v16 = v11;
        objc_msgSend(v6, "addObject:", v11);

      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v6;
}

+ (void)deleteSUCert:(id *)a3
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_32_1);
  v3 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222C3F000, v3, OS_LOG_TYPE_DEFAULT, "Deleting SU Certificate ...", buf, 2u);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = (id)suCertPaths;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

        if ((v12 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v7;
          v14 = objc_msgSend(v13, "removeItemAtPath:error:", v10, &v23);
          v15 = v23;

          if ((v14 & 1) == 0)
          {
            if (MIBUOnceToken != -1)
              dispatch_once(&MIBUOnceToken, &__block_literal_global_36_0);
            v16 = MIBUConnObj;
            if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v29 = v10;
              v30 = 2114;
              v31 = v15;
              _os_log_error_impl(&dword_222C3F000, v16, OS_LOG_TYPE_ERROR, "Failed to delete %{public}@ with error: %{public}@", buf, 0x16u);
            }
            safeAssignError(a3, 50331650, v15, CFSTR("Failed to delete %@"), v17, v18, v19, v20, v10);
          }
          v7 = v15;
        }
        else
        {
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_34_0);
          v21 = MIBUConnObj;
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v29 = v10;
            _os_log_impl(&dword_222C3F000, v21, OS_LOG_TYPE_DEFAULT, "Certificate file %{public}@ does not exist, skip deletion...", buf, 0xCu);
          }
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

}

void __31__MIBUCertHelper_deleteSUCert___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __31__MIBUCertHelper_deleteSUCert___block_invoke_33()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __31__MIBUCertHelper_deleteSUCert___block_invoke_35()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

+ (id)_getCertDataFromPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v7 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_39_3);
    v10 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      +[MIBUCertHelper _getCertDataFromPath:error:].cold.2((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
    safeAssignError(a4, 50331649, 0, CFSTR("%@ does not exist"), v13, v14, v15, v16, (uint64_t)v5);
    goto LABEL_14;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:", v5);
  if (!v8)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_43_1);
    v17 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      +[MIBUCertHelper _getCertDataFromPath:error:].cold.1((uint64_t)v5, v17, v18, v19, v20, v21, v22, v23);
    safeAssignError(a4, 50331648, 0, CFSTR("Failed to load %@"), v20, v21, v22, v23, (uint64_t)v5);
LABEL_14:
    v8 = 0;
  }

  return v8;
}

void __45__MIBUCertHelper__getCertDataFromPath_error___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __45__MIBUCertHelper__getCertDataFromPath_error___block_invoke_42()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

+ (id)_parseDERCertificates:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  int v15;
  void *v16;
  unint64_t v18;
  _OWORD v19[3];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  memset(v19, 0, sizeof(v19));
  v18 = 0;
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = CTParseCertificateSet(v6, v6 + objc_msgSend(v5, "length"), v19, 3, &v18);
  if ((_DWORD)v7)
    v12 = 1;
  else
    v12 = v18 == 0;
  if (v12)
  {
    safeAssignError(a4, 50331648, 0, CFSTR("Failed to parse certificate set: 0x%08x"), v8, v9, v10, v11, v7);
    v13 = 0;
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v13 && v18)
    {
      v14 = 0;
      v15 = 0;
      do
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", *(_QWORD *)&v19[v14], *((_QWORD *)&v19[v14] + 1));
        objc_msgSend(v13, "setObject:atIndexedSubscript:", v16, v14);

        v14 = ++v15;
      }
      while (v18 > v15);
    }
  }

  return v13;
}

+ (void)_getCertDataFromPath:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_222C3F000, a2, a3, "Failed to load %{public}@", a5, a6, a7, a8, 2u);
}

+ (void)_getCertDataFromPath:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_222C3F000, a2, a3, "Certificate file %{public}@ does not exist", a5, a6, a7, a8, 2u);
}

@end
