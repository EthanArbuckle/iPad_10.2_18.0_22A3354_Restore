@implementation CDFDonationFeedbackStore

+ (id)log_t
{
  if (log_t_cn_once_token_1 != -1)
    dispatch_once(&log_t_cn_once_token_1, &__block_literal_global);
  return (id)log_t_cn_once_object_1;
}

void __33__CDFDonationFeedbackStore_log_t__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.donation", "feedback");
  v1 = (void *)log_t_cn_once_object_1;
  log_t_cn_once_object_1 = (uint64_t)v0;

}

- (CDFDonationFeedbackStore)init
{
  void *v3;
  CDFDonationFeedbackStore *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1888]), "initWithBundleIdentifier:", CFSTR("com.apple.CoreSuggestions"));
  v4 = -[CDFDonationFeedbackStore initWithKeyValueStore:](self, "initWithKeyValueStore:", v3);

  return v4;
}

- (CDFDonationFeedbackStore)initWithKeyValueStore:(id)a3
{
  id v5;
  CDFDonationFeedbackStore *v6;
  CDFDonationFeedbackStore *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSData *userSalt;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSNumber *resetGeneration;
  uint64_t v17;
  NSNumber *resetTimestamp;
  uint64_t v19;
  NSMutableSet *hashes;
  CDFDonationFeedbackStore *v21;
  uint8_t v23[16];
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CDFDonationFeedbackStore;
  v6 = -[CDFDonationFeedbackStore init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_kvs, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleHashesChangedNotification_, *MEMORY[0x24BDD1378], v7->_kvs);

    if (!-[NSUbiquitousKeyValueStore synchronize](v7->_kvs, "synchronize"))
    {
      objc_msgSend((id)objc_opt_class(), "log_t");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_21AA18000, v9, OS_LOG_TYPE_DEFAULT, "Something went wrong with trying to synchronize KVS", v23, 2u);
      }

    }
    -[CDFDonationFeedbackStore _loadSalt](v7, "_loadSalt");
    v10 = objc_claimAutoreleasedReturnValue();
    userSalt = v7->_userSalt;
    v7->_userSalt = (NSData *)v10;

    objc_msgSend((id)objc_opt_class(), "log_t");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[CDFDonationFeedbackStore initWithKeyValueStore:].cold.1((uint64_t *)&v7->_userSalt, v12);

    if (v7->_userSalt)
    {
      -[CDFDonationFeedbackStore _loadResetInfo](v7, "_loadResetInfo");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        -[NSObject objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 0);
        v15 = objc_claimAutoreleasedReturnValue();
        resetGeneration = v7->_resetGeneration;
        v7->_resetGeneration = (NSNumber *)v15;

        -[NSObject objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 1);
        v17 = objc_claimAutoreleasedReturnValue();
        resetTimestamp = v7->_resetTimestamp;
        v7->_resetTimestamp = (NSNumber *)v17;

      }
      -[CDFDonationFeedbackStore _loadHashesForKey:](v7, "_loadHashesForKey:", CFSTR("kCDFContactDonationHashesRecord"));
      v19 = objc_claimAutoreleasedReturnValue();
      hashes = v7->_hashes;
      v7->_hashes = (NSMutableSet *)v19;

      v21 = v7;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log_t");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_21AA18000, v14, OS_LOG_TYPE_DEFAULT, "failed to get salt from KVS", v23, 2u);
      }
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)description
{
  CDFDonationFeedbackStore *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSNumber *resetGeneration;
  void *v7;
  void *v8;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[NSMutableSet count](v2->_hashes, "count");
  v5 = (void *)MEMORY[0x24BDBCE60];
  resetGeneration = v2->_resetGeneration;
  -[NSNumber doubleValue](v2->_resetTimestamp, "doubleValue");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<CDFDonationFeedbackStore %lu hashes reset:%@ at %@>"), v4, resetGeneration, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v8;
}

- (BOOL)donatedValueHasBeenConfirmedOrRejected:(id)a3 contactIdentifier:(id)a4
{
  id v6;
  id v7;
  CDFDonationFeedbackStore *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[CDFDonationFeedbackStore _hashesForDonation:contactIdentifier:](v8, "_hashesForDonation:contactIdentifier:", v6, v7);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        if ((-[NSMutableSet containsObject:](v8->_hashes, "containsObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14) & 1) != 0)
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v8);
  return v10;
}

- (void)reset
{
  uint64_t v2;
  NSMutableSet *hashes;
  uint64_t v4;
  NSNumber *resetGeneration;
  void *v6;
  uint64_t v7;
  NSNumber *resetTimestamp;
  CDFDonationFeedbackStore *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = objc_opt_new();
  hashes = obj->_hashes;
  obj->_hashes = (NSMutableSet *)v2;

  -[CDFDonationFeedbackStore _saveHashes:key:](obj, "_saveHashes:key:", obj->_hashes, CFSTR("kCDFContactDonationHashesRecord"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", -[NSNumber unsignedLongValue](obj->_resetGeneration, "unsignedLongValue") + 1);
  v4 = objc_claimAutoreleasedReturnValue();
  resetGeneration = obj->_resetGeneration;
  obj->_resetGeneration = (NSNumber *)v4;

  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = objc_claimAutoreleasedReturnValue();
  resetTimestamp = obj->_resetTimestamp;
  obj->_resetTimestamp = (NSNumber *)v7;

  -[CDFDonationFeedbackStore _saveResetInfo](obj, "_saveResetInfo");
  -[CDFDonationFeedbackStore synchronize](obj, "synchronize");
  objc_sync_exit(obj);

}

- (void)_confirmOrRejectDonatedValues:(id)a3 contactIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(9, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __94__CDFDonationFeedbackStore__confirmOrRejectDonatedValues_contactIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_24DD7C8B8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __94__CDFDonationFeedbackStore__confirmOrRejectDonatedValues_contactIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "_hashesForDonation:contactIdentifier:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v6), *(_QWORD *)(a1 + 48));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0u;
        v16 = 0u;
        v13 = 0u;
        v14 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v14;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v14 != v10)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
            }
            while (v9 != v11);
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v9);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "_saveHashes:key:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), CFSTR("kCDFContactDonationHashesRecord"));
  objc_sync_exit(v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)_hashesForDonation:(id)a3 contactIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x24BE191D0] + 16))())
  {
    v12 = (void *)MEMORY[0x24BDBCE88];
    v16 = CFSTR("donation");
    v17[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", CFSTR("CDFErrorDomain"), CFSTR("Missing identifier"), v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v14);
  }
  -[CDFDonationFeedbackStore _hashableStringsForDonation:contactIdentifier:](self, "_hashableStringsForDonation:contactIdentifier:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDFDonationFeedbackStore _sha256BytesForStrings:salt:](self, "_sha256BytesForStrings:salt:", v8, self->_userSalt);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_hashableStringsForDonation:(id)a3
{
  id v3;
  CNDFDonationStringCollector *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(CNDFDonationStringCollector);
  -[CNDFDonationStringCollector collectStringsFromDonation:](v4, "collectStringsFromDonation:", v3);

  -[CNDFDonationStringCollector strings](v4, "strings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)canHashDonation:(id)a3
{
  id v3;
  CNDFDonationStringCollector *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(CNDFDonationStringCollector);
  -[CNDFDonationStringCollector collectStringsFromDonation:](v4, "collectStringsFromDonation:", v3);

  v5 = *MEMORY[0x24BE191C0];
  -[CNDFDonationStringCollector strings](v4, "strings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6) ^ 1;

  return v5;
}

- (id)_hashableStringsForDonation:(id)a3 contactIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CDFDonationFeedbackStore _hashableStringsForDonation:](self, "_hashableStringsForDonation:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x24BE191C0] + 16))())
  {
    v12 = (void *)MEMORY[0x24BDBCE88];
    v16 = CFSTR("donation");
    v17[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", CFSTR("CDFErrorDomain"), CFSTR("Insufficient values to hash error"), v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v14);
  }
  v15[0] = v7;
  v15[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cn_flatten");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_handleHashesChangedNotification:(id)a3
{
  void *v4;
  NSUInteger v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSMutableSet *v9;
  NSMutableSet *hashes;
  NSNumber *v11;
  NSNumber *resetGeneration;
  NSNumber *v13;
  NSNumber *resetTimestamp;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[CDFDonationFeedbackStore _loadResetInfo](self, "_loadResetInfo", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSNumber unsignedIntegerValue](self->_resetGeneration, "unsignedIntegerValue");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v5 >= v7)
  {
    -[CDFDonationFeedbackStore _loadHashesForKey:](self, "_loadHashesForKey:", CFSTR("kCDFContactDonationHashesRecord"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableSet isEqualToSet:](self->_hashes, "isEqualToSet:", v15) & 1) == 0)
    {
      -[NSMutableSet unionSet:](self->_hashes, "unionSet:", v15);
      -[CDFDonationFeedbackStore _saveHashes:key:](self, "_saveHashes:key:", self->_hashes, CFSTR("kCDFContactDonationHashesRecord"));
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log_t");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl(&dword_21AA18000, v8, OS_LOG_TYPE_INFO, "got reset for CloudKit: %@", (uint8_t *)&v16, 0xCu);
    }

    -[CDFDonationFeedbackStore _loadHashesForKey:](self, "_loadHashesForKey:", CFSTR("kCDFContactDonationHashesRecord"));
    v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    hashes = self->_hashes;
    self->_hashes = v9;

    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    resetGeneration = self->_resetGeneration;
    self->_resetGeneration = v11;

    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    resetTimestamp = self->_resetTimestamp;
    self->_resetTimestamp = v13;

  }
}

- (id)_loadSalt
{
  CDFDonationFeedbackStore *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSUbiquitousKeyValueStore dataForKey:](v2->_kvs, "dataForKey:", CFSTR("kCDFSaltRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CDFDonationFeedbackStore _randomDataOfLength:](v2, "_randomDataOfLength:", 32);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUbiquitousKeyValueStore setData:forKey:](v2->_kvs, "setData:forKey:", v3, CFSTR("kCDFSaltRecord"));
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)_loadHashesForKey:(id)a3
{
  id v4;
  CDFDonationFeedbackStore *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSUbiquitousKeyValueStore dataForKey:](v5->_kvs, "dataForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD1620];
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v10, v6, &v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v23;

    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log_t");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CDFDonationFeedbackStore _loadHashesForKey:].cold.1((uint64_t)v12, v15, v16, v17, v18, v19, v20, v21);

      v13 = (id)objc_opt_new();
    }
    v14 = v13;

  }
  else
  {
    v14 = (void *)objc_opt_new();
  }

  objc_sync_exit(v5);
  return v14;
}

- (void)_saveHashes:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  CDFDonationFeedbackStore *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (objc_msgSend(v6, "count"))
  {
    v9 = (void *)MEMORY[0x22074F828]();
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v19);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v19;
    if (!v10)
    {
      objc_msgSend((id)objc_opt_class(), "log_t");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CDFDonationFeedbackStore _saveHashes:key:].cold.1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__CDFDonationFeedbackStore__saveHashes_key___block_invoke;
    block[3] = &unk_24DD7C8E0;
    block[4] = v8;
    if (_saveHashes_key__onceToken != -1)
      dispatch_once(&_saveHashes_key__onceToken, block);
    v10 = (id)_saveHashes_key__archivedEmptySet;
  }
  -[NSUbiquitousKeyValueStore setData:forKey:](v8->_kvs, "setData:forKey:", v10, v7);

  objc_sync_exit(v8);
}

void __44__CDFDonationFeedbackStore__saveHashes_key___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v0 = (void *)MEMORY[0x24BDD1618];
  v1 = (void *)objc_opt_new();
  v12 = 0;
  objc_msgSend(v0, "archivedDataWithRootObject:requiringSecureCoding:error:", v1, 1, &v12);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v12;
  v4 = (void *)_saveHashes_key__archivedEmptySet;
  _saveHashes_key__archivedEmptySet = v2;

  if (!_saveHashes_key__archivedEmptySet)
  {
    objc_msgSend((id)objc_opt_class(), "log_t");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CDFDonationFeedbackStore _saveHashes:key:].cold.1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  }
}

- (id)_loadResetInfo
{
  CDFDonationFeedbackStore *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  uint8_t v10[16];

  v2 = self;
  objc_sync_enter(v2);
  -[NSUbiquitousKeyValueStore arrayForKey:](v2->_kvs, "arrayForKey:", CFSTR("kCDFResetInfoRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  objc_msgSend((id)objc_opt_class(), "log_t");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_21AA18000, v8, OS_LOG_TYPE_INFO, "Empty or corrupt resetInfo", v10, 2u);
  }

  v4 = &unk_24DD7D390;
LABEL_10:
  objc_sync_exit(v2);

  return v4;
}

- (void)_saveResetInfo
{
  CDFDonationFeedbackStore *v2;
  NSUbiquitousKeyValueStore *kvs;
  NSNumber *resetTimestamp;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  kvs = v2->_kvs;
  resetTimestamp = v2->_resetTimestamp;
  v6[0] = v2->_resetGeneration;
  v6[1] = resetTimestamp;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUbiquitousKeyValueStore setArray:forKey:](kvs, "setArray:forKey:", v5, CFSTR("kCDFResetInfoRecord"));

  objc_sync_exit(v2);
}

- (void)synchronize
{
  -[NSUbiquitousKeyValueStore synchronize](self->_kvs, "synchronize");
}

- (id)_randomDataOfLength:(unint64_t)a3
{
  char *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v4 = (char *)v6 - (((a3 & 0xFFFFFFFFFFFFFFFCLL) + 19) & 0xFFFFFFFFFFFFFFF0);
  arc4random_buf(v4, (a3 & 0xFFFFFFFFFFFFFFFCLL) + 4);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v4, a3);
}

- (id)_sha256BytesForStrings:(id)a3 salt:(id)a4
{
  _BYTE v5[32];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  -[CDFDonationFeedbackStore _hashStrings:salt:digest:](self, "_hashStrings:salt:digest:", a3, a4, v5);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v5, 32);
}

- (void)_hashStrings:(id)a3 salt:(id)a4 digest:(char *)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __CFString *v14;
  const char *CStringPtr;
  CFIndex v16;
  CFIndex v17;
  id v18;
  CC_LONG len[2];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CC_SHA256_CTX c;
  UInt8 buffer[512];
  _BYTE v26[128];
  uint64_t v27;
  CFRange v28;
  CFRange v29;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(__CFString **)(*((_QWORD *)&v20 + 1) + 8 * i);
        CStringPtr = CFStringGetCStringPtr(v14, 0x600u);
        if (CStringPtr)
        {
          CC_SHA256_Update(&c, CStringPtr, -[__CFString length](v14, "length"));
        }
        else
        {
          *(_QWORD *)len = 0;
          v16 = -[__CFString length](v14, "length");
          v28.location = 0;
          v28.length = v16;
          if (CFStringGetBytes(v14, v28, 0x8000100u, 0, 0, buffer, 512, (CFIndex *)len))
          {
            v17 = 0;
            do
            {
              CC_SHA256_Update(&c, buffer, len[0]);
              v17 += *(_QWORD *)len;
              v16 -= *(_QWORD *)len;
              v29.location = v17;
              v29.length = v16;
            }
            while (CFStringGetBytes(v14, v29, 0x8000100u, 0, 0, buffer, 512, (CFIndex *)len));
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v11);
  }

  if (v8)
  {
    v18 = objc_retainAutorelease(v8);
    CC_SHA256_Update(&c, (const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"));
  }
  CC_SHA256_Final((unsigned __int8 *)a5, &c);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSalt, 0);
  objc_storeStrong((id *)&self->_resetTimestamp, 0);
  objc_storeStrong((id *)&self->_resetGeneration, 0);
  objc_storeStrong((id *)&self->_hashes, 0);
  objc_storeStrong((id *)&self->_kvs, 0);
}

- (void)initWithKeyValueStore:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_21AA18000, a2, OS_LOG_TYPE_DEBUG, "user salt: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_loadHashesForKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21AA18000, a2, a3, "error reading archive %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_saveHashes:(uint64_t)a3 key:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21AA18000, a2, a3, "error creating hash archive %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
