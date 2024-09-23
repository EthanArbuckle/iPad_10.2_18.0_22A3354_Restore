@implementation KMContactStoreBridge

- (unsigned)cascadeItemType
{
  return 19668;
}

- (id)originAppId
{
  return (id)*MEMORY[0x24BE5E880];
}

- (KMContactStoreBridge)initWithDirectory:(id)a3
{
  id v4;
  KMProviderHistoryLog *v5;
  KMProviderHistoryLog *v6;
  id v7;
  KMContactStoreBridge *v8;

  v4 = a3;
  v5 = [KMProviderHistoryLog alloc];
  v6 = -[KMProviderHistoryLog initWithDirectory:originAppId:](v5, "initWithDirectory:originAppId:", v4, *MEMORY[0x24BE5E880]);

  v7 = objc_alloc_init(MEMORY[0x24BDBACF8]);
  v8 = -[KMContactStoreBridge initWithContactStore:historyLog:](self, "initWithContactStore:historyLog:", v7, v6);

  return v8;
}

- (KMContactStoreBridge)initWithContactStore:(id)a3 historyLog:(id)a4
{
  id v7;
  id v8;
  KMContactStoreBridge *v9;
  KMContactStoreBridge *v10;
  uint64_t v11;
  id v12;
  KVItemMapper *itemMapper;
  uint64_t v14;
  NSData *historyToken;
  KMContactStoreBridge *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  id v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)KMContactStoreBridge;
  v9 = -[KMContactStoreBridge init](&v22, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_6;
  objc_storeStrong((id *)&v9->_log, a4);
  if (!v10->_log)
  {
    v17 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[KMContactStoreBridge initWithContactStore:historyLog:]";
      v18 = "%s nil history log.";
LABEL_11:
      _os_log_error_impl(&dword_218838000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
    }
LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v10->_contactStore, a3);
  if (!v10->_contactStore)
  {
    v17 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[KMContactStoreBridge initWithContactStore:historyLog:]";
      v18 = "%s nil contactStore.";
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  v21 = 0;
  v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE5E8F0]), "initWithObjectClass:error:", objc_opt_class(), &v21);
  v12 = v21;
  itemMapper = v10->_itemMapper;
  v10->_itemMapper = (KVItemMapper *)v11;

  if (!v10->_itemMapper)
  {
    v19 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[KMContactStoreBridge initWithContactStore:historyLog:]";
      v25 = 2112;
      v26 = v12;
      _os_log_error_impl(&dword_218838000, v19, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }

    goto LABEL_15;
  }
  -[KMProviderHistoryLog getHistoryToken](v10->_log, "getHistoryToken");
  v14 = objc_claimAutoreleasedReturnValue();
  historyToken = v10->_historyToken;
  v10->_historyToken = (NSData *)v14;

  v10->_version = -[KMProviderHistoryLog getVersion](v10->_log, "getVersion") + 1;
LABEL_6:
  v16 = v10;
LABEL_16:

  return v16;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  CNContactStore *contactStore;
  _BOOL4 v10;
  BOOL v11;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  id obj;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v5 = a4;
  if (-[KMContactStoreBridge _checkAuthorizationAndFetchMeCard](self, "_checkAuthorizationAndFetchMeCard"))
  {
    v6 = objc_alloc(MEMORY[0x24BDBACB8]);
    objc_msgSend((id)objc_opt_class(), "_contactFetchKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithKeysToFetch:", v7);

    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__1393;
    v18[4] = __Block_byref_object_dispose__1394;
    v19 = 0;
    contactStore = self->_contactStore;
    obj = 0;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59__KMContactStoreBridge_enumerateItemsWithError_usingBlock___block_invoke;
    v13[3] = &unk_24D961418;
    v13[4] = self;
    v15 = v18;
    v16 = &v20;
    v14 = v5;
    v10 = -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v8, &obj, v13);
    objc_storeStrong(&v19, obj);
    if (v10 && !*((_BYTE *)v21 + 24))
    {
      v11 = 1;
    }
    else
    {
      KVSetError();
      v11 = 0;
    }

    _Block_object_dispose(v18, 8);
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)validity
{
  return &stru_24D961AF0;
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)wasLastDonationAccepted
{
  void *v3;
  void *v4;
  BOOL v5;

  -[KMProviderHistoryLog getDonationStartTime](self->_log, "getDonationStartTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KMProviderHistoryLog getDonationEndTime](self->_log, "getDonationEndTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "compare:", v3) == 1;

  return v5;
}

- (void)resetDeltaState
{
  NSData *historyToken;

  historyToken = self->_historyToken;
  self->_historyToken = 0;

}

- (void)recordDonationAttempt
{
  -[KMProviderHistoryLog recordDonationStartTime](self->_log, "recordDonationStartTime");
}

- (void)recordDonationAccepted
{
  -[KMProviderHistoryLog recordChangesAcceptedWithVersion:historyToken:](self->_log, "recordChangesAcceptedWithVersion:historyToken:", self->_version, self->_historyToken);
}

- (id)lastDonationAcceptedDate
{
  return -[KMProviderHistoryLog getDonationEndTime](self->_log, "getDonationEndTime");
}

- (id)_fetchContactsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  CNContactStore *contactStore;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsWithIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  contactStore = self->_contactStore;
  objc_msgSend((id)objc_opt_class(), "_contactFetchKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v6, v8, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;

  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = (void *)KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)MEMORY[0x24BDD16E0];
      v15 = v12;
      objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v19 = "-[KMContactStoreBridge _fetchContactsWithIdentifiers:error:]";
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v10;
      _os_log_error_impl(&dword_218838000, v15, OS_LOG_TYPE_ERROR, "%s Unable to fetch contacts from identifiers in batch (%@) error: %@", buf, 0x20u);

    }
    KVSetError();
  }

  return v9;
}

- (BOOL)enumerateDeltaItemsWithError:(id *)a3 addOrUpdateBlock:(id)a4 removeBlock:(id)a5
{
  uint64_t (**v8)(_QWORD, void *);
  uint64_t (**v9)(id, void *);
  id v10;
  CNContactStore *contactStore;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  KMDeltaContactCollector *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  _BOOL4 v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  KVItemMapper *itemMapper;
  NSDictionary *mapperAdditionalFields;
  void *v39;
  void *v40;
  int v41;
  int v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  NSData *historyToken;
  id v49;
  uint64_t (**v50)(id, void *);
  id *v51;
  id obj;
  uint64_t v53;
  uint64_t v54;
  uint64_t (**v55)(_QWORD, void *);
  id v56;
  KMContactStoreBridge *v57;
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  id v65;
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  id v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v8 = (uint64_t (**)(_QWORD, void *))a4;
  v9 = (uint64_t (**)(id, void *))a5;
  if (!-[KMContactStoreBridge _checkAuthorizationAndFetchMeCard](self, "_checkAuthorizationAndFetchMeCard"))
  {
    v17 = 0;
    goto LABEL_67;
  }
  v10 = objc_alloc_init(MEMORY[0x24BDBAC98]);
  objc_msgSend(v10, "setStartingToken:", self->_historyToken);
  contactStore = self->_contactStore;
  v65 = 0;
  -[CNContactStore enumeratorForChangeHistoryFetchRequest:error:](contactStore, "enumeratorForChangeHistoryFetchRequest:error:", v10, &v65);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v65;
  if (v12)
    v14 = v13 == 0;
  else
    v14 = 0;
  if (!v14)
  {
    v15 = v13;
    v16 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v67 = "-[KMContactStoreBridge enumerateDeltaItemsWithError:addOrUpdateBlock:removeBlock:]";
      v68 = 2112;
      v69 = v15;
      _os_log_error_impl(&dword_218838000, v16, OS_LOG_TYPE_ERROR, "%s Unable to fetch contact change history with error: %@", buf, 0x16u);
    }
    KVSetError();
    v17 = 0;
    goto LABEL_66;
  }
  v57 = self;
  v55 = v8;
  v18 = objc_alloc_init(KMDeltaContactCollector);
  v58 = v12;
  objc_msgSend(v12, "value");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "nextObject");
  v20 = objc_claimAutoreleasedReturnValue();

  v56 = 0;
  while (2)
  {
    v21 = 0;
    v22 = (void *)v20;
    while (1)
    {
      v23 = (void *)MEMORY[0x219A1AD04]();
      objc_msgSend(v22, "acceptEventVisitor:", v18);
      if (-[KMDeltaContactCollector dropEverything](v18, "dropEverything") && v57->_historyToken)
      {
        v44 = KMLogContextCore;
        if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v67 = "-[KMContactStoreBridge enumerateDeltaItemsWithError:addOrUpdateBlock:removeBlock:]";
          _os_log_impl(&dword_218838000, v44, OS_LOG_TYPE_INFO, "%s Received drop everything change history event. Reset is required.", buf, 0xCu);
        }
        goto LABEL_59;
      }
      -[KMDeltaContactCollector contactIdentifier](v18, "contactIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[KMDeltaContactCollector deltaType](v18, "deltaType");
      if ((v25 - 1) >= 2)
      {
        if (v25 != 3)
          goto LABEL_26;
        if (v24)
        {
          if ((v9[2](v9, v24) & 1) != 0)
            goto LABEL_26;

LABEL_59:
          objc_autoreleasePoolPop(v23);
          v17 = 0;
          goto LABEL_60;
        }
        v26 = KMLogContextCore;
        if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
          goto LABEL_36;
      }
      else
      {
        if (!v24)
        {
          v26 = KMLogContextCore;
          if (!os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
            goto LABEL_26;
LABEL_36:
          *(_DWORD *)buf = 136315394;
          v67 = "-[KMContactStoreBridge enumerateDeltaItemsWithError:addOrUpdateBlock:removeBlock:]";
          v68 = 2112;
          v69 = v22;
          _os_log_error_impl(&dword_218838000, v26, OS_LOG_TYPE_ERROR, "%s Skipping change history event: %@ missing contact identifier.", buf, 0x16u);
          goto LABEL_26;
        }
        if (!v21)
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 250);
        objc_msgSend(v21, "addObject:", v24);
      }
LABEL_26:
      -[KMDeltaContactCollector reset](v18, "reset");
      objc_msgSend(v58, "value");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "nextObject");
      v20 = objc_claimAutoreleasedReturnValue();

      v28 = objc_msgSend(v21, "count");
      v29 = v28 && v20 == 0;
      v30 = v29;
      if (v28 == 250 || v30)
        break;

      objc_autoreleasePoolPop(v23);
      v22 = (void *)v20;
      if (!v20)
        goto LABEL_64;
    }
    v51 = a3;
    v64 = v56;
    -[KMContactStoreBridge _fetchContactsWithIdentifiers:error:](v57, "_fetchContactsWithIdentifiers:error:", v21, &v64);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v64;

    if (!v31)
    {

      objc_autoreleasePoolPop(v23);
      v45 = v32;
      goto LABEL_63;
    }
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v31;
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    if (!v54)
    {
      v42 = 0;
      v56 = v32;
LABEL_53:

      objc_autoreleasePoolPop(v23);
      a3 = v51;
      if (!v20 || (v42 & 1) != 0)
      {
        v21 = 0;
        v45 = v56;
        if (!v42)
        {
LABEL_64:
          v12 = v58;
          v8 = v55;
          objc_msgSend(v58, "currentHistoryToken");
          v46 = objc_claimAutoreleasedReturnValue();
          historyToken = v57->_historyToken;
          v57->_historyToken = (NSData *)v46;

          v17 = 1;
          v22 = (void *)v20;
          goto LABEL_65;
        }
LABEL_63:
        v56 = v45;
        KVSetError();
        v17 = 0;
        v22 = (void *)v20;
LABEL_60:
        v12 = v58;
        v8 = v55;
        goto LABEL_65;
      }
      continue;
    }
    break;
  }
  v49 = v10;
  v50 = v9;
  v53 = *(_QWORD *)v61;
  v33 = v32;
LABEL_40:
  v34 = 0;
  while (1)
  {
    if (*(_QWORD *)v61 != v53)
      objc_enumerationMutation(obj);
    v35 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v34);
    v36 = (void *)MEMORY[0x219A1AD04]();
    itemMapper = v57->_itemMapper;
    mapperAdditionalFields = v57->_mapperAdditionalFields;
    v59 = v33;
    -[KVItemMapper mapObject:additionalFields:error:](itemMapper, "mapObject:additionalFields:error:", v35, mapperAdditionalFields, &v59);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v59;

    if (objc_msgSend(v39, "count") != 1)
    {
      v43 = KMLogContextCore;
      if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v67 = "-[KMContactStoreBridge enumerateDeltaItemsWithError:addOrUpdateBlock:removeBlock:]";
        v68 = 2112;
        v69 = v39;
        v70 = 2112;
        v71 = v56;
        _os_log_error_impl(&dword_218838000, v43, OS_LOG_TYPE_ERROR, "%s Unexepected items: %@ error: %@", buf, 0x20u);
      }

      objc_autoreleasePoolPop(v36);
      v42 = 1;
LABEL_52:
      v10 = v49;
      v9 = v50;
      goto LABEL_53;
    }
    objc_msgSend(v39, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v55[2](v55, v40);

    objc_autoreleasePoolPop(v36);
    if (!v41)
      break;
    ++v34;
    v33 = v56;
    if (v54 == v34)
    {
      v33 = v56;
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
      if (v54)
        goto LABEL_40;
      v42 = 0;
      goto LABEL_52;
    }
  }

  objc_autoreleasePoolPop(v23);
  v17 = 0;
  v22 = (void *)v20;
  v8 = v55;
  v10 = v49;
  v9 = v50;
  v12 = v58;
LABEL_65:

  v15 = v56;
LABEL_66:

LABEL_67:
  return v17;
}

- (BOOL)_checkAuthorizationAndFetchMeCard
{
  uint64_t v3;
  CNContactStore *contactStore;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *mapperAdditionalFields;
  id v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(MEMORY[0x24BDBACF8], "authorizationStatusForEntityType:", 0);
  if (v3 == 3)
  {
    contactStore = self->_contactStore;
    v23[0] = *MEMORY[0x24BDBA2E0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    -[CNContactStore _crossPlatformUnifiedMeContactWithKeysToFetch:error:](contactStore, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v5, &v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;

    if (v6)
      v8 = v7 == 0;
    else
      v8 = 0;
    if (v8)
    {
      KVAdditionalFieldTypeToNumber();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v11;
      objc_msgSend(v6, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      mapperAdditionalFields = self->_mapperAdditionalFields;
      self->_mapperAdditionalFields = v13;

    }
    else
    {
      v9 = KMLogContextCore;
      if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[KMContactStoreBridge _checkAuthorizationAndFetchMeCard]";
        v21 = 2112;
        v22 = v7;
        _os_log_error_impl(&dword_218838000, v9, OS_LOG_TYPE_ERROR, "%s Encountered error when fetching meCard: %@", buf, 0x16u);
      }
    }

  }
  else
  {
    v10 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[KMContactStoreBridge _checkAuthorizationAndFetchMeCard]";
      _os_log_error_impl(&dword_218838000, v10, OS_LOG_TYPE_ERROR, "%s Not Authorized to access contacts using CNContactStore.", buf, 0xCu);
    }
  }
  return v3 == 3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapperAdditionalFields, 0);
  objc_storeStrong((id *)&self->_historyToken, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_itemMapper, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

void __59__KMContactStoreBridge_enumerateItemsWithError_usingBlock___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id obj;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a1[4];
  v6 = *(void **)(v5 + 16);
  v7 = *(_QWORD *)(v5 + 40);
  v8 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v6, "mapObject:additionalFields:error:", a2, v7, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  if (objc_msgSend(v9, "count") == 1)
  {
    v10 = a1[5];
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v11);

    if ((v10 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    v12 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 136315650;
      v16 = "-[KMContactStoreBridge enumerateItemsWithError:usingBlock:]_block_invoke";
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v13;
      _os_log_error_impl(&dword_218838000, v12, OS_LOG_TYPE_ERROR, "%s Unexepected items: %@ error: %@", buf, 0x20u);
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  *a3 = 1;
LABEL_7:

}

+ (id)_contactFetchKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[22];

  v13[21] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDBA2C8];
  v13[0] = *MEMORY[0x24BDBA318];
  v13[1] = v2;
  v3 = *MEMORY[0x24BDBA2C0];
  v13[2] = *MEMORY[0x24BDBA310];
  v13[3] = v3;
  v4 = *MEMORY[0x24BDBA320];
  v13[4] = *MEMORY[0x24BDBA380];
  v13[5] = v4;
  v5 = *MEMORY[0x24BDBA340];
  v13[6] = *MEMORY[0x24BDBA328];
  v13[7] = v5;
  v6 = *MEMORY[0x24BDBA300];
  v13[8] = *MEMORY[0x24BDBA280];
  v13[9] = v6;
  v7 = *MEMORY[0x24BDBA288];
  v13[10] = *MEMORY[0x24BDBA348];
  v13[11] = v7;
  v8 = *MEMORY[0x24BDBA3F8];
  v13[12] = *MEMORY[0x24BDBA378];
  v13[13] = v8;
  v9 = *MEMORY[0x24BDBA2F8];
  v13[14] = *MEMORY[0x24BDBA3C8];
  v13[15] = v9;
  v10 = *MEMORY[0x24BDBA360];
  v13[16] = *MEMORY[0x24BDBA3C0];
  v13[17] = v10;
  v11 = *MEMORY[0x24BDBA358];
  v13[18] = *MEMORY[0x24BDBA368];
  v13[19] = v11;
  v13[20] = *MEMORY[0x24BDBA370];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 21);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
