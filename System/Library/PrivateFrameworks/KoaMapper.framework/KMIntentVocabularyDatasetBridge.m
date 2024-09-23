@implementation KMIntentVocabularyDatasetBridge

- (KMIntentVocabularyDatasetBridge)initWithAppId:(id)a3 intentSlot:(id)a4 storeManager:(id)a5 authorization:(id)a6 itemMapper:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  KMIntentVocabularyDatasetBridge *v17;
  KMIntentVocabularyDatasetBridge *v18;
  NSString **p_intentSlot;
  KMIntentVocabularyStoreManager **p_storeManager;
  KMIntentVocabularyAuthorization **p_authorization;
  KVItemMapper **p_itemMapper;
  NSString *appId;
  KMIntentVocabularyDatasetBridge *v24;
  NSObject *v25;
  NSString *v27;
  KMIntentVocabularyStoreManager *v28;
  KMIntentVocabularyAuthorization *v29;
  KVItemMapper *v30;
  id v31;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  NSString *v37;
  __int16 v38;
  NSString *v39;
  __int16 v40;
  KMIntentVocabularyStoreManager *v41;
  __int16 v42;
  KMIntentVocabularyAuthorization *v43;
  __int16 v44;
  KVItemMapper *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v32 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)KMIntentVocabularyDatasetBridge;
  v17 = -[KMIntentVocabularyDatasetBridge init](&v33, sel_init);
  v18 = v17;
  if (!v17)
  {
LABEL_8:
    v24 = v18;
    goto LABEL_12;
  }
  v31 = v13;
  objc_storeStrong((id *)&v17->_appId, a3);
  p_intentSlot = &v18->_intentSlot;
  objc_storeStrong((id *)&v18->_intentSlot, a4);
  p_storeManager = &v18->_storeManager;
  objc_storeStrong((id *)&v18->_storeManager, a5);
  p_authorization = &v18->_authorization;
  objc_storeStrong((id *)&v18->_authorization, a6);
  p_itemMapper = &v18->_itemMapper;
  objc_storeStrong((id *)&v18->_itemMapper, a7);
  appId = v18->_appId;
  if (appId && *p_intentSlot && *p_storeManager && *p_authorization && *p_itemMapper)
  {
    v13 = v31;
    if (!-[KMIntentVocabularyDatasetBridge _resolveCascadeItemType](v18, "_resolveCascadeItemType"))
    {
      v24 = 0;
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  v25 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
  {
    v27 = *p_intentSlot;
    v28 = *p_storeManager;
    v29 = *p_authorization;
    v30 = *p_itemMapper;
    *(_DWORD *)buf = 136316418;
    v35 = "-[KMIntentVocabularyDatasetBridge initWithAppId:intentSlot:storeManager:authorization:itemMapper:]";
    v36 = 2112;
    v37 = appId;
    v38 = 2112;
    v39 = v27;
    v40 = 2112;
    v41 = v28;
    v42 = 2112;
    v43 = v29;
    v44 = 2112;
    v45 = v30;
    _os_log_error_impl(&dword_218838000, v25, OS_LOG_TYPE_ERROR, "%s Cannot initialize with appId: %@ intentSlot: %@ storeManager: %@ authorization: %@ itemMapper: %@", buf, 0x3Eu);
  }
  v24 = 0;
  v13 = v31;
LABEL_12:

  return v24;
}

- (id)originAppId
{
  return self->_appId;
}

- (unsigned)cascadeItemType
{
  return self->_cascadeItemType;
}

- (BOOL)_resolveCascadeItemType
{
  NSObject *v3;
  _BOOL4 v4;
  NSString *intentSlot;
  NSString *appId;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSObject *v10;
  void *v11;
  unsigned __int16 v12;
  int v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  switch(+[KMMapper_INVocabularyItem fieldTypeForIntentSlotName:](KMMapper_INVocabularyItem, "fieldTypeForIntentSlotName:", self->_intentSlot))
  {
    case 0:
      v3 = KMLogContextCore;
      v4 = os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO);
      if (v4)
      {
        appId = self->_appId;
        intentSlot = self->_intentSlot;
        v14 = 136315650;
        v15 = "-[KMIntentVocabularyDatasetBridge _resolveCascadeItemType]";
        v16 = 2112;
        v17 = intentSlot;
        v18 = 2112;
        v19 = appId;
        _os_log_impl(&dword_218838000, v3, OS_LOG_TYPE_INFO, "%s Skipping unrecognized intent slot: %@ while enumerating data set from app: %@", (uint8_t *)&v14, 0x20u);
        goto LABEL_4;
      }
      return v4;
    case 1:
      v12 = -4184;
      goto LABEL_24;
    case 2:
      v12 = -2167;
      goto LABEL_24;
    case 3:
      v12 = 13884;
      goto LABEL_24;
    case 4:
      v12 = -12054;
      goto LABEL_24;
    case 5:
      v12 = -20601;
      goto LABEL_24;
    case 6:
      v12 = 14816;
      goto LABEL_24;
    case 7:
      v12 = 800;
      goto LABEL_24;
    case 8:
      v12 = 16251;
      goto LABEL_24;
    case 9:
      v12 = 25883;
      goto LABEL_24;
    case 10:
      v12 = 26512;
      goto LABEL_24;
    case 11:
      v12 = 5595;
      goto LABEL_24;
    case 12:
      v12 = -32571;
      goto LABEL_24;
    case 13:
      v12 = 7719;
      goto LABEL_24;
    case 14:
      v12 = 14706;
      goto LABEL_24;
    case 15:
      v12 = -27285;
      goto LABEL_24;
    case 16:
      v12 = 15572;
      goto LABEL_24;
    case 17:
      v12 = 30598;
LABEL_24:
      self->_cascadeItemType = v12;
      LOBYTE(v4) = 1;
      break;
    default:
      v7 = (void *)KMLogContextCore;
      v4 = os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR);
      if (v4)
      {
        v9 = self->_appId;
        v8 = self->_intentSlot;
        v10 = v7;
        KVFieldTypeDescription();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315906;
        v15 = "-[KMIntentVocabularyDatasetBridge _resolveCascadeItemType]";
        v16 = 2112;
        v17 = v8;
        v18 = 2112;
        v19 = v9;
        v20 = 2112;
        v21 = v11;
        _os_log_error_impl(&dword_218838000, v10, OS_LOG_TYPE_ERROR, "%s Skipping intent slot: %@ from app: %@ mapped to fieldType: %@ not supported by Cascade", (uint8_t *)&v14, 0x2Au);

LABEL_4:
        LOBYTE(v4) = 0;
      }
      break;
  }
  return v4;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t (**v5)(id, void *);
  void *v6;
  NSString *intentSlot;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  KVItemMapper *itemMapper;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  id obj;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  void *v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v5 = (uint64_t (**)(id, void *))a4;
  if (-[KMIntentVocabularyAuthorization isAuthorizedApp:](self->_authorization, "isAuthorizedApp:", self->_appId))
  {
    KVAdditionalFieldTypeToNumber();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    intentSlot = self->_intentSlot;
    v37 = v6;
    v38[0] = intentSlot;
    v8 = 1;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[KMIntentVocabularyStoreManager storedVocabularyForApp:intentSlot:](self->_storeManager, "storedVocabularyForApp:intentSlot:", self->_appId, self->_intentSlot);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v27;
      while (2)
      {
        v13 = 0;
        v14 = v11;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
          v16 = (void *)MEMORY[0x219A1AD04]();
          itemMapper = self->_itemMapper;
          v25 = v14;
          -[KVItemMapper mapObject:additionalFields:error:](itemMapper, "mapObject:additionalFields:error:", v15, v24, &v25);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v25;

          if (objc_msgSend(v18, "count") != 1)
          {
            v21 = KMLogContextCore;
            if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v31 = "-[KMIntentVocabularyDatasetBridge enumerateItemsWithError:usingBlock:]";
              v32 = 2112;
              v33 = v18;
              v34 = 2112;
              v35 = v11;
              _os_log_error_impl(&dword_218838000, v21, OS_LOG_TYPE_ERROR, "%s Unexepected items: %@ error: %@", buf, 0x20u);
            }
            KVSetError();

            objc_autoreleasePoolPop(v16);
LABEL_16:
            v8 = 0;
            goto LABEL_17;
          }
          objc_msgSend(v18, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v5[2](v5, v19);

          objc_autoreleasePoolPop(v16);
          if (!v20)
            goto LABEL_16;
          ++v13;
          v14 = v11;
        }
        while (v10 != v13);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
        if (v10)
          continue;
        break;
      }
      v8 = 1;
LABEL_17:

    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemMapper, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_storeManager, 0);
  objc_storeStrong((id *)&self->_intentSlot, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

@end
