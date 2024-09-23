@implementation KMIntentVocabularyMultiDatasetBridge

- (KMIntentVocabularyMultiDatasetBridge)init
{
  KMIntentVocabularyStoreManager *v3;
  KMIntentVocabularyAuthorization *v4;
  KMIntentVocabularyMultiDatasetBridge *v5;

  v3 = objc_alloc_init(KMIntentVocabularyStoreManager);
  v4 = objc_alloc_init(KMIntentVocabularyAuthorization);
  v5 = -[KMIntentVocabularyMultiDatasetBridge initWithStoreManager:authorization:](self, "initWithStoreManager:authorization:", v3, v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemMapper, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_storeManager, 0);
}

- (KMIntentVocabularyMultiDatasetBridge)initWithStoreManager:(id)a3 authorization:(id)a4
{
  id v7;
  id v8;
  KMIntentVocabularyMultiDatasetBridge *v9;
  KMIntentVocabularyMultiDatasetBridge *v10;
  uint64_t v11;
  id v12;
  KVItemMapper *itemMapper;
  KMIntentVocabularyMultiDatasetBridge *v14;
  NSObject *v15;
  id v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)KMIntentVocabularyMultiDatasetBridge;
  v9 = -[KMIntentVocabularyMultiDatasetBridge init](&v18, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_6;
  objc_storeStrong((id *)&v9->_storeManager, a3);
  objc_storeStrong((id *)&v10->_authorization, a4);
  if (!v10->_storeManager || !v10->_authorization)
  {
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v17 = 0;
  v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE5E8F0]), "initWithObjectClass:error:", objc_opt_class(), &v17);
  v12 = v17;
  itemMapper = v10->_itemMapper;
  v10->_itemMapper = (KVItemMapper *)v11;

  if (!v10->_itemMapper)
  {
    v15 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[KMIntentVocabularyMultiDatasetBridge initWithStoreManager:authorization:]";
      v21 = 2112;
      v22 = v12;
      _os_log_error_impl(&dword_218838000, v15, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }

    goto LABEL_10;
  }

LABEL_6:
  v14 = v10;
LABEL_11:

  return v14;
}

- (void)enumerateAllDatasets:(unint64_t *)a3 usingBlock:(id)a4
{
  void (**v6)(id, KMIntentVocabularyDatasetBridge *);
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  KMIntentVocabularyDatasetBridge *v20;
  NSObject *v21;
  id obj;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, KMIntentVocabularyDatasetBridge *))a4;
  -[KMIntentVocabularyStoreManager savedCustomVocabularyOverviewDictionary](self->_storeManager, "savedCustomVocabularyOverviewDictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v39 = "-[KMIntentVocabularyMultiDatasetBridge enumerateAllDatasets:usingBlock:]";
    v40 = 2112;
    v41 = v10;
    _os_log_impl(&dword_218838000, v9, OS_LOG_TYPE_INFO, "%s Enumerating Intents Custom Vocabulary from all available apps=[%@]", buf, 0x16u);

  }
  *a3 = objc_msgSend(v7, "count");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v7;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v33;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x219A1AD04]();
        -[KMIntentVocabularyStoreManager resolveIntentSlotsForApp:fromAllAppsOverview:](self->_storeManager, "resolveIntentSlotsForApp:fromAllAppsOverview:", v12, v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count"))
        {
          v26 = v14;
          v27 = v13;
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v29;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v29 != v18)
                  objc_enumerationMutation(v15);
                v20 = -[KMIntentVocabularyDatasetBridge initWithAppId:intentSlot:storeManager:authorization:itemMapper:]([KMIntentVocabularyDatasetBridge alloc], "initWithAppId:intentSlot:storeManager:authorization:itemMapper:", v12, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), self->_storeManager, self->_authorization, self->_itemMapper);
                if (v20)
                  v6[2](v6, v20);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v17);
          }

          v14 = v26;
          v13 = v27;
        }
        else
        {
          v21 = KMLogContextCore;
          if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v39 = "-[KMIntentVocabularyMultiDatasetBridge enumerateAllDatasets:usingBlock:]";
            v40 = 2112;
            v41 = v12;
            _os_log_debug_impl(&dword_218838000, v21, OS_LOG_TYPE_DEBUG, "%s Found no intentSlots associated with appId=%@ in custom vocabulary directory.", buf, 0x16u);
          }
        }

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v11 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v25);
  }

}

@end
