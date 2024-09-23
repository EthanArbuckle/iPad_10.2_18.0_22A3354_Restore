@implementation BCSCacheManager

- (BCSCacheManager)initWithBloomFilterShardCache:(id)a3 domainItemCache:(id)a4 itemCache:(id)a5
{
  id v9;
  id v10;
  id v11;
  BCSCacheManager *v12;
  BCSCacheManager *v13;
  NSObject *v14;
  _QWORD block[4];
  BCSCacheManager *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BCSCacheManager;
  v12 = -[BCSCacheManager init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_filterShardCache, a3);
    objc_storeStrong((id *)&v13->_domainItemCache, a4);
    objc_storeStrong((id *)&v13->_itemCache, a5);
    dispatch_get_global_queue(9, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__BCSCacheManager_initWithBloomFilterShardCache_domainItemCache_itemCache___block_invoke;
    block[3] = &unk_24C39C268;
    v17 = v13;
    dispatch_async(v14, block);

  }
  return v13;
}

void __75__BCSCacheManager_initWithBloomFilterShardCache_domainItemCache_itemCache___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "clearExpiredCachesForType:completion:", 1, &__block_literal_global_11);
  -[BCSCacheManager _clearExpiredCacheItemsForType:completion:](*(void **)(a1 + 32), 2, &__block_literal_global_11);
  -[BCSCacheManager _clearExpiredCacheItemsForType:completion:](*(void **)(a1 + 32), 3, &__block_literal_global_13);
  -[BCSCacheManager _clearExpiredCacheItemsForType:completion:](*(void **)(a1 + 32), 4, &__block_literal_global_15);
}

void __75__BCSCacheManager_initWithBloomFilterShardCache_domainItemCache_itemCache___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    ABSLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "description");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6 = 136315138;
      v7 = objc_msgSend(v5, "UTF8String");
      _os_log_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEFAULT, "clearExpiredCacheItemsForType error: %s", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __75__BCSCacheManager_initWithBloomFilterShardCache_domainItemCache_itemCache___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    ABSLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "description");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6 = 136315138;
      v7 = objc_msgSend(v5, "UTF8String");
      _os_log_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEFAULT, "clearExpiredCacheItemsForType error: %s", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)_clearExpiredCacheItemsForType:(void *)a3 completion:
{
  void (**v5)(id, uint64_t, _QWORD);

  if (a1)
  {
    v5 = a3;
    objc_msgSend(a1, "deleteExpiredItemsOfType:", a2);
    v5[2](v5, 1, 0);

  }
}

void __75__BCSCacheManager_initWithBloomFilterShardCache_domainItemCache_itemCache___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    ABSLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "description");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6 = 136315138;
      v7 = objc_msgSend(v5, "UTF8String");
      _os_log_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEFAULT, "clearExpiredCacheItemsForType error: %s", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __75__BCSCacheManager_initWithBloomFilterShardCache_domainItemCache_itemCache___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    ABSLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "description");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6 = 136315138;
      v7 = objc_msgSend(v5, "UTF8String");
      _os_log_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEFAULT, "clearExpiredCacheItemsForType error: %s", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)clearCachesForType:(int64_t)a3 completion:(id)a4
{
  BCSCacheManager *v6;
  uint64_t v7;
  void (**v8)(id, uint64_t, _QWORD);

  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  -[BCSCacheManager deleteConfigItemForType:](self, "deleteConfigItemForType:", a3);
  -[BCSCacheManager deleteItemsOfType:](self, "deleteItemsOfType:", a3);
  switch(a3)
  {
    case 1:
      v6 = self;
      v7 = 1;
      goto LABEL_6;
    case 2:
      -[BCSCacheManager deleteShardItemsOfType:](self, "deleteShardItemsOfType:", 2);
      -[BCSCacheManager deleteShardItemsOfType:](self, "deleteShardItemsOfType:", 3);
      -[BCSCacheManager deleteAllDomainItems](self, "deleteAllDomainItems");
      break;
    case 3:
      v6 = self;
      v7 = 4;
      goto LABEL_6;
    case 4:
      v6 = self;
      v7 = 5;
LABEL_6:
      -[BCSCacheManager deleteShardItemsOfType:](v6, "deleteShardItemsOfType:", v7);
      break;
    default:
      break;
  }
  v8[2](v8, 1, 0);

}

- (void)clearExpiredCachesForType:(int64_t)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  BCSCacheManager *v8;
  uint64_t v9;
  void (**v10)(id, uint64_t, _QWORD);

  v10 = (void (**)(id, uint64_t, _QWORD))a4;
  if (self)
  {
    -[BCSCacheManager configItemForType:](self, "configItemForType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "isExpired"))
      -[BCSCacheManager deleteConfigItemForType:](self, "deleteConfigItemForType:", a3);

  }
  -[BCSCacheManager deleteExpiredItemsOfType:](self, "deleteExpiredItemsOfType:", a3);
  switch(a3)
  {
    case 1:
      v8 = self;
      v9 = 1;
      goto LABEL_11;
    case 2:
      -[BCSCacheManager deleteExpiredShardItemsOfType:](self, "deleteExpiredShardItemsOfType:", 2);
      -[BCSCacheManager deleteExpiredShardItemsOfType:](self, "deleteExpiredShardItemsOfType:", 3);
      -[BCSCacheManager deleteAllExpiredDomainItems](self, "deleteAllExpiredDomainItems");
      break;
    case 3:
      v8 = self;
      v9 = 4;
      goto LABEL_11;
    case 4:
      v8 = self;
      v9 = 5;
LABEL_11:
      -[BCSCacheManager deleteExpiredShardItemsOfType:](v8, "deleteExpiredShardItemsOfType:", v9);
      break;
    default:
      break;
  }
  v10[2](v10, 1, 0);

}

- (void)clearCachesForLinkItemsAssociatedWithBundleID:(id)a3 completion:(id)a4
{
  BCSItemCaching *itemCache;
  void (**v6)(id, uint64_t, _QWORD);

  if (self)
    itemCache = self->_itemCache;
  else
    itemCache = 0;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  -[BCSItemCaching deleteLinkItemsWithBundleID:](itemCache, "deleteLinkItemsWithBundleID:", a3);
  v6[2](v6, 1, 0);

}

- (BOOL)shouldSkipCacheForItemOfType:(int64_t)a3
{
  __CFString **v3;
  void *v4;

  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  v3 = (&off_24C39D5A8)[a3 - 1];
  +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "BOOLForKey:", *v3);

  return (char)v3;
}

- (id)itemMatching:(id)a3
{
  if (self)
    self = (BCSCacheManager *)self->_itemCache;
  return -[BCSCacheManager itemMatching:](self, "itemMatching:", a3);
}

- (void)updateItem:(id)a3 withItemIdentifier:(id)a4
{
  if (self)
    self = (BCSCacheManager *)self->_itemCache;
  -[BCSCacheManager updateItem:withItemIdentifier:](self, "updateItem:withItemIdentifier:", a3, a4);
}

- (void)deleteItemsOfType:(int64_t)a3
{
  if (self)
    self = (BCSCacheManager *)self->_itemCache;
  -[BCSCacheManager deleteItemsOfType:](self, "deleteItemsOfType:", a3);
}

- (void)deleteExpiredItemsOfType:(int64_t)a3
{
  if (self)
    self = (BCSCacheManager *)self->_itemCache;
  -[BCSCacheManager deleteExpiredItemsOfType:](self, "deleteExpiredItemsOfType:", a3);
}

- (void)deleteItemMatching:(id)a3
{
  if (self)
    self = (BCSCacheManager *)self->_itemCache;
  -[BCSCacheManager deleteItemMatching:](self, "deleteItemMatching:", a3);
}

- (BOOL)shouldSkipCacheForConfigItemOfType:(int64_t)a3
{
  __CFString **v3;
  void *v4;

  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  v3 = (&off_24C39D5C8)[a3 - 1];
  +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "BOOLForKey:", *v3);

  return (char)v3;
}

- (id)configItemForType:(int64_t)a3
{
  int64_t v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  Class v11;
  void *v12;
  id *v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  Class v17;
  void *v18;
  Class v19;
  void *v20;
  Class v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  NSObject *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3 - 1;
  switch(a3)
  {
    case 1:
      +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("BCSCacheManagerChatSuggestConfigItemDefaultsKey");
      goto LABEL_7;
    case 2:
      +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("BCSCacheManagerBusinessLinkDomainConfigItemDefaultsKey");
      goto LABEL_7;
    case 3:
      +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("BCSCacheManagerBusinessCallerConfigItemDefaultsKey");
      goto LABEL_7;
    case 4:
      +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("BCSCacheManagerBusinessEmailConfigItemDefaultsKey");
LABEL_7:
      objc_msgSend(v5, "dataForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_10;
      switch(v3)
      {
        case 0:
          v9 = (void *)MEMORY[0x24BDD1620];
          v10 = (void *)MEMORY[0x24BDBCF20];
          v11 = NSClassFromString(CFSTR("BCSConfigItem"));
          objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          v13 = (id *)&v30;
          v14 = &v30;
          goto LABEL_15;
        case 1:
          v9 = (void *)MEMORY[0x24BDD1620];
          v16 = (void *)MEMORY[0x24BDBCF20];
          v17 = NSClassFromString(CFSTR("BCSDomainConfigItem"));
          objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0;
          v13 = (id *)&v29;
          v14 = &v29;
          goto LABEL_15;
        case 2:
          v9 = (void *)MEMORY[0x24BDD1620];
          v18 = (void *)MEMORY[0x24BDBCF20];
          v19 = NSClassFromString(CFSTR("BCSConfigItem"));
          objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 0;
          v13 = (id *)&v28;
          v14 = &v28;
          goto LABEL_15;
        case 3:
          v9 = (void *)MEMORY[0x24BDD1620];
          v20 = (void *)MEMORY[0x24BDBCF20];
          v21 = NSClassFromString(CFSTR("BCSConfigItem"));
          objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0;
          v13 = (id *)&v27;
          v14 = &v27;
LABEL_15:
          objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v12, v8, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *v13;

          if (!v22)
            goto LABEL_19;
          ABSLogCommon();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            NSStringFromBCSType(a3);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v32 = "-[BCSCacheManager configItemForType:]";
            v33 = 2112;
            v34 = v26;
            v35 = 2112;
            v36 = v22;
            _os_log_error_impl(&dword_20ACAD000, v23, OS_LOG_TYPE_ERROR, "%s unarchiving cached config item from NSUserDefaults failed - type: %@ (%@)", buf, 0x20u);

          }
          v15 = 0;
          break;
        default:
          v15 = 0;
LABEL_19:
          ABSLogCommon();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromBCSType(a3);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v32 = "-[BCSCacheManager configItemForType:]";
            v33 = 2112;
            v34 = v24;
            _os_log_impl(&dword_20ACAD000, v22, OS_LOG_TYPE_DEFAULT, "%s cached config item successfully fetched from NSUserDefaults - type: %@", buf, 0x16u);

          }
          break;
      }

      break;
    default:
      v8 = 0;
LABEL_10:
      v15 = 0;
      break;
  }

  return v15;
}

- (void)updateConfigItem:(id)a3 withType:(int64_t)a4
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (!v6)
    {
      switch(a4)
      {
        case 1:
          +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
          v9 = objc_claimAutoreleasedReturnValue();
          v7 = v9;
          v10 = CFSTR("BCSCacheManagerChatSuggestConfigItemDefaultsKey");
          goto LABEL_10;
        case 2:
          +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
          v9 = objc_claimAutoreleasedReturnValue();
          v7 = v9;
          v10 = CFSTR("BCSCacheManagerBusinessLinkDomainConfigItemDefaultsKey");
          goto LABEL_10;
        case 3:
          +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
          v9 = objc_claimAutoreleasedReturnValue();
          v7 = v9;
          v10 = CFSTR("BCSCacheManagerBusinessCallerConfigItemDefaultsKey");
          goto LABEL_10;
        case 4:
          +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
          v9 = objc_claimAutoreleasedReturnValue();
          v7 = v9;
          v10 = CFSTR("BCSCacheManagerBusinessEmailConfigItemDefaultsKey");
LABEL_10:
          -[NSObject setObject:forKey:](v9, "setObject:forKey:", v5, v10);
          goto LABEL_11;
        default:
          goto LABEL_12;
      }
    }
    ABSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromBCSType(a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v13 = "-[BCSCacheManager updateConfigItem:withType:]";
      v14 = 2112;
      v15 = v8;
      _os_log_error_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_ERROR, "%s archiving cached config item to NSUserDefaults failed - type: %@", buf, 0x16u);

    }
LABEL_11:

LABEL_12:
  }
}

- (void)deleteConfigItemForType:(int64_t)a3
{
  void *v3;
  const __CFString *v4;
  id v5;

  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("BCSCacheManagerChatSuggestConfigItemDefaultsKey");
      goto LABEL_6;
    case 2:
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("BCSCacheManagerBusinessLinkDomainConfigItemDefaultsKey");
      goto LABEL_6;
    case 3:
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("BCSCacheManagerBusinessCallerConfigItemDefaultsKey");
      goto LABEL_6;
    case 4:
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("BCSCacheManagerBusinessEmailConfigItemDefaultsKey");
LABEL_6:
      v5 = v3;
      objc_msgSend(v3, "removeObjectForKey:", v4);

      break;
    default:
      return;
  }
}

- (BOOL)shouldSkipCacheForShardItemOfType:(int64_t)a3
{
  __CFString **v3;
  void *v4;

  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  v3 = (&off_24C39D5C8)[a3 - 1];
  +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "BOOLForKey:", *v3);

  return (char)v3;
}

- (id)shardItemMatching:(id)a3
{
  id v4;
  BCSShardCacheQueryable *filterShardCache;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  const char *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self)
    filterShardCache = self->_filterShardCache;
  else
    filterShardCache = 0;
  -[BCSShardCacheQueryable shardItemMatching:](filterShardCache, "shardItemMatching:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ABSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      NSStringFromBCSShardType(objc_msgSend(v4, "type"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "-[BCSCacheManager shardItemMatching:]";
      v14 = 2112;
      v15 = v9;
      v10 = "%s cached shard item found - type: %@";
LABEL_8:
      _os_log_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x16u);

    }
  }
  else if (v8)
  {
    NSStringFromBCSShardType(objc_msgSend(v4, "type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[BCSCacheManager shardItemMatching:]";
    v14 = 2112;
    v15 = v9;
    v10 = "%s cached shard item not found - type: %@";
    goto LABEL_8;
  }

  return v6;
}

- (void)updateShardItem:(id)a3 withShardIdentifier:(id)a4
{
  BCSShardCacheQueryable *filterShardCache;
  id v7;
  uint64_t v8;
  BCSDomainItemCaching *domainItemCache;
  id v10;

  v10 = a3;
  if (self)
    filterShardCache = self->_filterShardCache;
  else
    filterShardCache = 0;
  v7 = a4;
  -[BCSShardCacheQueryable updateShardItem:withShardIdentifier:](filterShardCache, "updateShardItem:withShardIdentifier:", v10, v7);
  v8 = objc_msgSend(v7, "type");

  if (v8 == 3 && objc_msgSend(v10, "conformsToProtocol:", &unk_254630D20))
  {
    if (self)
      domainItemCache = self->_domainItemCache;
    else
      domainItemCache = 0;
    -[BCSDomainItemCaching updateDomainItemsForDomainShard:](domainItemCache, "updateDomainItemsForDomainShard:", v10);
  }

}

- (void)deleteShardItemMatching:(id)a3
{
  if (self)
    self = (BCSCacheManager *)self->_filterShardCache;
  -[BCSCacheManager deleteShardItemMatching:](self, "deleteShardItemMatching:", a3);
}

- (void)deleteExpiredShardItemsOfType:(int64_t)a3
{
  BCSDomainItemCaching *domainItemCache;
  BCSShardCacheQueryable *filterShardCache;

  if (a3 == 3)
  {
    if (self)
      domainItemCache = self->_domainItemCache;
    else
      domainItemCache = 0;
    -[BCSDomainItemCaching deleteAllExpiredDomainItems](domainItemCache, "deleteAllExpiredDomainItems");
  }
  if (self)
    filterShardCache = self->_filterShardCache;
  else
    filterShardCache = 0;
  -[BCSShardCacheQueryable deleteExpiredShardItemsOfType:](filterShardCache, "deleteExpiredShardItemsOfType:", a3);
}

- (void)deleteShardItemsOfType:(int64_t)a3
{
  BCSDomainItemCaching *domainItemCache;
  BCSShardCacheQueryable *filterShardCache;

  if (a3 == 3)
  {
    if (self)
      domainItemCache = self->_domainItemCache;
    else
      domainItemCache = 0;
    -[BCSDomainItemCaching deleteAllDomainItems](domainItemCache, "deleteAllDomainItems");
  }
  if (self)
    filterShardCache = self->_filterShardCache;
  else
    filterShardCache = 0;
  -[BCSShardCacheQueryable deleteShardItemsOfType:](filterShardCache, "deleteShardItemsOfType:", a3);
}

- (int64_t)countOfShardsOfType:(int64_t)a3
{
  if (self)
    self = (BCSCacheManager *)self->_filterShardCache;
  return -[BCSCacheManager countOfShardsOfType:](self, "countOfShardsOfType:", a3);
}

- (int64_t)countOfExpiredShardsOfType:(int64_t)a3
{
  if (self)
    self = (BCSCacheManager *)self->_filterShardCache;
  return -[BCSCacheManager countOfExpiredShardsOfType:](self, "countOfExpiredShardsOfType:", a3);
}

- (void)beginBatch
{
  BCSDomainItemCaching *domainItemCache;

  if (self)
  {
    -[BCSShardCacheQueryable beginBatch](self->_filterShardCache, "beginBatch");
    domainItemCache = self->_domainItemCache;
  }
  else
  {
    objc_msgSend(0, "beginBatch");
    domainItemCache = 0;
  }
  -[BCSDomainItemCaching beginBatch](domainItemCache, "beginBatch");
}

- (void)endBatch
{
  BCSDomainItemCaching *domainItemCache;

  if (self)
  {
    -[BCSShardCacheQueryable endBatch](self->_filterShardCache, "endBatch");
    domainItemCache = self->_domainItemCache;
  }
  else
  {
    objc_msgSend(0, "endBatch");
    domainItemCache = 0;
  }
  -[BCSDomainItemCaching endBatch](domainItemCache, "endBatch");
}

- (void)updateDomainItem:(id)a3 withDomainItemIdentifier:(id)a4
{
  if (self)
    self = (BCSCacheManager *)self->_domainItemCache;
  -[BCSCacheManager updateDomainItem:withDomainItemIdentifier:](self, "updateDomainItem:withDomainItemIdentifier:", a3, a4);
}

- (id)domainItemMatching:(id)a3
{
  if (self)
    self = (BCSCacheManager *)self->_domainItemCache;
  return -[BCSCacheManager domainItemMatching:](self, "domainItemMatching:", a3);
}

- (void)deleteDomainItemMatching:(id)a3
{
  if (self)
    self = (BCSCacheManager *)self->_domainItemCache;
  -[BCSCacheManager deleteDomainItemMatching:](self, "deleteDomainItemMatching:", a3);
}

- (void)deleteAllDomainItems
{
  if (self)
    self = (BCSCacheManager *)self->_domainItemCache;
  -[BCSCacheManager deleteAllDomainItems](self, "deleteAllDomainItems");
}

- (void)deleteAllExpiredDomainItems
{
  if (self)
    self = (BCSCacheManager *)self->_domainItemCache;
  -[BCSCacheManager deleteAllExpiredDomainItems](self, "deleteAllExpiredDomainItems");
}

- (void)updateDomainItemsForDomainShard:(id)a3
{
  if (self)
    self = (BCSCacheManager *)self->_domainItemCache;
  -[BCSCacheManager updateDomainItemsForDomainShard:](self, "updateDomainItemsForDomainShard:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemCache, 0);
  objc_storeStrong((id *)&self->_domainItemCache, 0);
  objc_storeStrong((id *)&self->_filterShardCache, 0);
}

@end
