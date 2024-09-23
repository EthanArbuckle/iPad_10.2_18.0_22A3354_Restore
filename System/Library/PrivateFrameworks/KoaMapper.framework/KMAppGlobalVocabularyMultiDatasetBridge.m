@implementation KMAppGlobalVocabularyMultiDatasetBridge

- (KMAppGlobalVocabularyMultiDatasetBridge)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (KMAppGlobalVocabularyMultiDatasetBridge)initWithModifiedOriginAppIds:(id)a3 languageCode:(id)a4
{
  id v7;
  id v8;
  KMAppGlobalVocabularyMultiDatasetBridge *v9;
  KMAppGlobalVocabularyMultiDatasetBridge *v10;
  NSString **p_languageCode;
  NSSet *modifiedAppIds;
  uint64_t v13;
  NSSet *v14;
  KVItemMapper *itemMapper;
  KMAppGlobalVocabularyMultiDatasetBridge *v16;
  NSObject *v17;
  NSString *v18;
  NSObject *v19;
  id v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NSSet *v26;
  __int16 v27;
  NSString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)KMAppGlobalVocabularyMultiDatasetBridge;
  v9 = -[KMAppGlobalVocabularyMultiDatasetBridge init](&v22, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_6;
  objc_storeStrong((id *)&v9->_modifiedAppIds, a3);
  p_languageCode = &v10->_languageCode;
  objc_storeStrong((id *)&v10->_languageCode, a4);
  modifiedAppIds = v10->_modifiedAppIds;
  if (!modifiedAppIds || !*p_languageCode)
  {
    v17 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      v18 = *p_languageCode;
      *(_DWORD *)buf = 136315650;
      v24 = "-[KMAppGlobalVocabularyMultiDatasetBridge initWithModifiedOriginAppIds:languageCode:]";
      v25 = 2112;
      v26 = modifiedAppIds;
      v27 = 2112;
      v28 = v18;
      _os_log_error_impl(&dword_218838000, v17, OS_LOG_TYPE_ERROR, "%s Invalid {modified: %@ language: %@}", buf, 0x20u);
    }
    goto LABEL_12;
  }
  v21 = 0;
  v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE5E8F0]), "initWithObjectClass:error:", objc_opt_class(), &v21);
  v14 = (NSSet *)v21;
  itemMapper = v10->_itemMapper;
  v10->_itemMapper = (KVItemMapper *)v13;

  if (!v10->_itemMapper)
  {
    v19 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[KMAppGlobalVocabularyMultiDatasetBridge initWithModifiedOriginAppIds:languageCode:]";
      v25 = 2112;
      v26 = v14;
      _os_log_error_impl(&dword_218838000, v19, OS_LOG_TYPE_ERROR, "%s Cannot initialize item mapper with error: %@", buf, 0x16u);
    }

LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }

LABEL_6:
  v16 = v10;
LABEL_13:

  return v16;
}

- (void)enumerateAllDatasets:(unint64_t *)a3 usingBlock:(id)a4
{
  void (**v5)(id, KMAppGlobalVocabularyBridge *);
  void *v6;
  void *v7;
  NSSet *modifiedAppIds;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  KMAppGlobalVocabularyBridge *v23;
  NSObject *v24;
  NSSet *obj;
  KMAppGlobalVocabularyMultiDatasetBridge *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, KMAppGlobalVocabularyBridge *))a4;
  v6 = (void *)KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    modifiedAppIds = self->_modifiedAppIds;
    v9 = v6;
    objc_msgSend(v7, "numberWithUnsignedInteger:", -[NSSet count](modifiedAppIds, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v45 = "-[KMAppGlobalVocabularyMultiDatasetBridge enumerateAllDatasets:usingBlock:]";
    v46 = 2112;
    v47 = v10;
    _os_log_impl(&dword_218838000, v9, OS_LOG_TYPE_INFO, "%s Scanning app global terms for %@ modified apps", buf, 0x16u);

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = self->_modifiedAppIds;
  v29 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  v11 = 0;
  if (v29)
  {
    v28 = *(_QWORD *)v39;
    v27 = self;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v39 != v28)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x219A1AD04]();
        -[KMAppGlobalVocabularyMultiDatasetBridge _extractAllAppIntentVocabularyForApp:languageCode:](self, "_extractAllAppIntentVocabularyForApp:languageCode:", v13, self->_languageCode);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v31 = v14;
          v32 = i;
          v30 = v15;
          -[KMAppGlobalVocabularyMultiDatasetBridge _sortAppIntentVocabularyByCascadeItemType:](self, "_sortAppIntentVocabularyByCascadeItemType:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v35;
            do
            {
              v33 = v11;
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v35 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
                objc_msgSend(v16, "objectForKey:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = -[KMAppGlobalVocabularyBridge initWithOriginAppId:cascadeItemType:items:]([KMAppGlobalVocabularyBridge alloc], "initWithOriginAppId:cascadeItemType:items:", v13, objc_msgSend(v21, "unsignedShortValue"), v22);
                v24 = KMLogContextCore;
                if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  v45 = "-[KMAppGlobalVocabularyMultiDatasetBridge enumerateAllDatasets:usingBlock:]";
                  v46 = 2112;
                  v47 = v13;
                  _os_log_impl(&dword_218838000, v24, OS_LOG_TYPE_INFO, "%s Extracting app global terms for app: %@", buf, 0x16u);
                }
                v5[2](v5, v23);

              }
              v11 = v33 + v18;
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v18);
          }

          self = v27;
          v14 = v31;
          i = v32;
          v15 = v30;
        }

        objc_autoreleasePoolPop(v14);
      }
      v29 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v29);
  }

  *a3 = v11;
}

- (id)_extractAllAppIntentVocabularyForApp:(id)a3 languageCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t Unique;
  const void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    objc_msgSend(v8, "URL");
    Unique = _CFBundleCreateUnique();
    if (Unique)
    {
      v11 = (const void *)Unique;
      -[KMAppGlobalVocabularyMultiDatasetBridge _extractAllAppIntentVocabularyFromBundle:languageCode:](self, "_extractAllAppIntentVocabularyFromBundle:languageCode:", Unique, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _CFBundleFlushBundleCaches();
      CFRelease(v11);
    }
    else
    {
      v14 = KMLogContextCore;
      if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[KMAppGlobalVocabularyMultiDatasetBridge _extractAllAppIntentVocabularyForApp:languageCode:]";
        v19 = 2112;
        v20 = v6;
        _os_log_error_impl(&dword_218838000, v14, OS_LOG_TYPE_ERROR, "%s Cannot create a bundle instance with appId: %@", buf, 0x16u);
      }
      v12 = 0;
    }

  }
  else
  {
    v13 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[KMAppGlobalVocabularyMultiDatasetBridge _extractAllAppIntentVocabularyForApp:languageCode:]";
      _os_log_error_impl(&dword_218838000, v13, OS_LOG_TYPE_ERROR, "%s nil languageCode", buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

- (id)_extractAllAppIntentVocabularyFromBundle:(__CFBundle *)a3 languageCode:(id)a4
{
  __CFString *v6;
  CFURLRef v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  KVItemMapper *itemMapper;
  void *v15;
  const __CFURL *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  CFURLRef v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a4;
  v7 = CFBundleCopyResourceURLForLocalization(a3, CFSTR("AppIntentVocabulary"), CFSTR("plist"), 0, v6);
  if (!v7)
  {
    v8 = v6;
    if (-[__CFString length](v8, "length"))
    {
      -[__CFString componentsSeparatedByString:](v8, "componentsSeparatedByString:", CFSTR("-"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

    v7 = CFBundleCopyResourceURLForLocalization(a3, CFSTR("AppIntentVocabulary"), CFSTR("plist"), 0, v10);
    if (!v7)
    {
      -[__CFString stringByReplacingOccurrencesOfString:withString:](v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", v11);

      v7 = CFBundleCopyResourceURLForLocalization(a3, CFSTR("AppIntentVocabulary"), CFSTR("plist"), 0, (CFStringRef)objc_msgSend(v12, "localeIdentifier"));
      if (!v7)
      {

        v15 = 0;
        goto LABEL_18;
      }
    }

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v7);
  if (v13)
  {
    itemMapper = self->_itemMapper;
    v21 = 0;
    -[KVItemMapper mapObject:error:](itemMapper, "mapObject:error:", v13, &v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (const __CFURL *)v21;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      v19 = KMLogContextCore;
      if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[KMAppGlobalVocabularyMultiDatasetBridge _extractAllAppIntentVocabularyFromBundle:languageCode:]";
        v24 = 2112;
        v25 = v16;
        _os_log_error_impl(&dword_218838000, v19, OS_LOG_TYPE_ERROR, "%s Failed to map appIntentVocabulary with error: %@", buf, 0x16u);
      }
    }

  }
  else
  {
    v18 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[KMAppGlobalVocabularyMultiDatasetBridge _extractAllAppIntentVocabularyFromBundle:languageCode:]";
      v24 = 2112;
      v25 = v7;
      _os_log_error_impl(&dword_218838000, v18, OS_LOG_TYPE_ERROR, "%s Failed to initialize appIntentVocabulary dictionary from URL: %@", buf, 0x16u);
    }
    v16 = 0;
    v15 = 0;
  }

LABEL_18:
  return v15;
}

- (id)_sortAppIntentVocabularyByCascadeItemType:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v13[0] = v9;
        v13[1] = 3221225472;
        v13[2] = __85__KMAppGlobalVocabularyMultiDatasetBridge__sortAppIntentVocabularyByCascadeItemType___block_invoke;
        v13[3] = &unk_24D9613F0;
        v14 = v4;
        v15 = v11;
        objc_msgSend(v11, "enumerateFieldsUsingBlock:", v13);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemMapper, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_modifiedAppIds, 0);
}

void __85__KMAppGlobalVocabularyMultiDatasetBridge__sortAppIntentVocabularyByCascadeItemType___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = objc_msgSend(a2, "fieldType") - 600;
  if (v6 <= 4)
  {
    v7 = word_2188559E8[v6];
    if ((_DWORD)v7 != (unsigned __int16)*MEMORY[0x24BE15620])
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", word_2188559E8[v6]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v9);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v10 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v12, v11);

      }
      objc_msgSend(v12, "addObject:", *(_QWORD *)(a1 + 40));
      *a4 = 1;

    }
  }
}

@end
