@implementation KMLaunchServicesBridge

- (KMLaunchServicesBridge)initWithLanguageCode:(id)a3
{
  id v4;
  KMLaunchServicesBridge *v5;
  uint64_t v6;
  id v7;
  KVItemMapper *itemMapper;
  void *v9;
  uint64_t v10;
  NSDictionary *additionalFields;
  KMLaunchServicesBridge *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  id v19;
  objc_super v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)KMLaunchServicesBridge;
  v5 = -[KMLaunchServicesBridge init](&v20, sel_init);
  if (!v5)
    goto LABEL_5;
  v19 = 0;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE5E8F0]), "initWithObjectClass:error:", objc_opt_class(), &v19);
  v7 = v19;
  itemMapper = v5->_itemMapper;
  v5->_itemMapper = (KVItemMapper *)v6;

  if (!v5->_itemMapper)
  {
    v13 = KMLogContextCore;
    if (!os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315394;
    v24 = "-[KMLaunchServicesBridge initWithLanguageCode:]";
    v25 = 2112;
    v26 = v7;
    v14 = "%s %@";
    v15 = v13;
    v16 = 22;
LABEL_12:
    _os_log_error_impl(&dword_218838000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    goto LABEL_9;
  }
  if (!v4)
  {
    v17 = KMLogContextCore;
    if (!os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_DWORD *)buf = 136315138;
    v24 = "-[KMLaunchServicesBridge initWithLanguageCode:]";
    v14 = "%s Must pass a valid language code";
    v15 = v17;
    v16 = 12;
    goto LABEL_12;
  }
  KVAdditionalFieldTypeToNumber();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  v22 = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v10 = objc_claimAutoreleasedReturnValue();
  additionalFields = v5->_additionalFields;
  v5->_additionalFields = (NSDictionary *)v10;

LABEL_5:
  v12 = v5;
LABEL_10:

  return v12;
}

- (KMLaunchServicesBridge)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unsigned)cascadeItemType
{
  return -29102;
}

- (id)originAppId
{
  return (id)*MEMORY[0x24BE5E868];
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  KVItemMapper *itemMapper;
  NSDictionary *additionalFields;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  NSObject *v26;
  uint64_t (**v28)(id, void *);
  char v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v28 = (uint64_t (**)(id, void *))a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[KMLaunchServicesBridge _appEnumerator](self, "_appEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (!v6)
  {
    v17 = v5;
    v25 = 1;
    goto LABEL_27;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v32;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v32 != v9)
      objc_enumerationMutation(v5);
    v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
    v12 = (void *)MEMORY[0x219A1AD04]();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    v20 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[KMLaunchServicesBridge enumerateItemsWithError:usingBlock:]";
      v37 = 2112;
      v38 = v11;
      v21 = v20;
      v22 = "%s bundle record: %@ is not a LSApplicationRecord";
LABEL_18:
      _os_log_error_impl(&dword_218838000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x16u);
    }
LABEL_15:
    objc_autoreleasePoolPop(v12);
    if (v7 == ++v10)
    {
      v24 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      v7 = v24;
      if (!v24)
      {

        v25 = 1;
LABEL_26:
        v17 = v8;
        goto LABEL_27;
      }
      goto LABEL_3;
    }
  }
  objc_msgSend(v11, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v23 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[KMLaunchServicesBridge enumerateItemsWithError:usingBlock:]";
      v37 = 2112;
      v38 = v11;
      v21 = v23;
      v22 = "%s bundle record: %@ has nil bundle identifier";
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (!-[KMLaunchServicesBridge _checkAppValidity:](self, "_checkAppValidity:", v11))
    goto LABEL_15;
  itemMapper = self->_itemMapper;
  additionalFields = self->_additionalFields;
  v30 = v8;
  -[KVItemMapper mapObject:additionalFields:error:](itemMapper, "mapObject:additionalFields:error:", v11, additionalFields, &v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v30;

  if (objc_msgSend(v16, "count") == 1)
  {
    v8 = v17;
    v18 = v5;
    objc_msgSend(v16, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28[2](v28, v19);

    if ((v29 & 1) == 0)
    {
      objc_autoreleasePoolPop(v12);

      v25 = 0;
      goto LABEL_26;
    }
    v5 = v18;
    goto LABEL_15;
  }
  v26 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v36 = "-[KMLaunchServicesBridge enumerateItemsWithError:usingBlock:]";
    v37 = 2112;
    v38 = v16;
    v39 = 2112;
    v40 = v17;
    _os_log_error_impl(&dword_218838000, v26, OS_LOG_TYPE_ERROR, "%s Unexepected items: %@ error: %@", buf, 0x20u);
  }

  objc_autoreleasePoolPop(v12);
  KVSetError();
  v25 = 0;
LABEL_27:

  return v25;
}

- (BOOL)_checkAppValidity:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  char v12;

  v4 = a3;
  if ((objc_msgSend(v4, "isLaunchProhibited") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[KMLaunchServicesBridge _getOverrideByInfoPlist:](self, "_getOverrideByInfoPlist:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5 = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      objc_msgSend(v4, "typeForInstallMachinery");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("hidden")) & 1) != 0
        || (objc_msgSend(v9, "isEqualToString:", CFSTR("internal")) & 1) != 0)
      {
        v5 = 0;
      }
      else if (objc_msgSend(v4, "developerType") == 1)
      {
        objc_msgSend(v4, "appTags");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", CFSTR("hidden"));

        v5 = v12 ^ 1;
      }
      else
      {
        v5 = 1;
      }

    }
  }

  return v5;
}

- (id)_getOverrideByInfoPlist:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  objc_msgSend(a3, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("SBIconVisibilitySetByAppPreference"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
  {
    objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("SBIconVisibilityDefaultVisible"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)MEMORY[0x24BDBD1C8];
    }
    else
    {
      objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("SBIconVisibilityDefaultVisibleInstallTypes"), objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count")
        && AFIsInternalInstall()
        && (objc_msgSend(v8, "containsObject:", CFSTR("internal")) & 1) != 0)
      {
        v7 = (void *)MEMORY[0x24BDBD1C8];
      }
      else
      {
        objc_msgSend(v3, "objectForKey:ofClass:", CFSTR("SBIconVisibilityDefaultVisiblePlatforms"), objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count")
          && (v10 = (void *)MGGetStringAnswer(),
              v11 = objc_msgSend(v9, "containsObject:", v10),
              v10,
              (v11 & 1) != 0))
        {
          v7 = (void *)MEMORY[0x24BDBD1C8];
        }
        else
        {
          v7 = (void *)MEMORY[0x24BDBD1C0];
        }

      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_appEnumerator
{
  return (id)objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalFields, 0);
  objc_storeStrong((id *)&self->_itemMapper, 0);
}

+ (id)allInstalledAppBundleIdentifiers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v13 = (id)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x219A1AD04]();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "bundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v13, "addObject:", v9);
          }
          else
          {
            v11 = KMLogContextCore;
            if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v19 = "+[KMLaunchServicesBridge allInstalledAppBundleIdentifiers]";
              v20 = 2112;
              v21 = v7;
              _os_log_error_impl(&dword_218838000, v11, OS_LOG_TYPE_ERROR, "%s bundle record: %@ has nil bundle identifier", buf, 0x16u);
            }
          }

        }
        else
        {
          v10 = KMLogContextCore;
          if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v19 = "+[KMLaunchServicesBridge allInstalledAppBundleIdentifiers]";
            v20 = 2112;
            v21 = v7;
            _os_log_error_impl(&dword_218838000, v10, OS_LOG_TYPE_ERROR, "%s bundle record: %@ is not a LSApplicationRecord", buf, 0x16u);
          }
        }
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v4);
  }

  return v13;
}

@end
