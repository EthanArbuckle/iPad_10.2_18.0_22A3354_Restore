@implementation ABSBulkFaultHandler

+ (double)interestWindow
{
  return 0.1;
}

+ (int64_t)interestThreshold
{
  return 5;
}

+ (int64_t)batchSize
{
  return 250;
}

- (ABSBulkFaultHandler)initWithStorage:(id)a3 contactStoreFuture:(id)a4 schedulerProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  ABSBulkFaultHandler *v12;
  ABSBulkFaultHandler *v13;
  uint64_t v14;
  CNScheduler *inlineScheduler;
  uint64_t v16;
  NSMutableSet *keyDescriptorOfInterests;
  void *v18;
  double v19;
  ABSBulkFaultHandler *v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ABSBulkFaultHandler;
  v12 = -[ABSBulkFaultHandler init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storage, a3);
    objc_msgSend(v11, "inlineScheduler");
    v14 = objc_claimAutoreleasedReturnValue();
    inlineScheduler = v13->_inlineScheduler;
    v13->_inlineScheduler = (CNScheduler *)v14;

    objc_storeStrong((id *)&v13->_contactStoreFuture, a4);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    keyDescriptorOfInterests = v13->_keyDescriptorOfInterests;
    v13->_keyDescriptorOfInterests = (NSMutableSet *)v16;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    v13->_lastRequestTimeStamp = v19;

    v20 = v13;
  }

  return v13;
}

- (id)store
{
  void *v2;
  void *v3;

  -[ABSBulkFaultHandler contactStoreFuture](self, "contactStoreFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "result:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)completePerson:(id)a3 withKeysToFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!-[ABSBulkFaultHandler withinInterestWindow](self, "withinInterestWindow"))
    -[ABSBulkFaultHandler resetInterest](self, "resetInterest");
  -[ABSBulkFaultHandler keyDescriptorOfInterests](self, "keyDescriptorOfInterests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v7);

  v9 = -[ABSBulkFaultHandler interest](self, "interest");
  if (v9 >= objc_msgSend((id)objc_opt_class(), "interestThreshold"))
  {
    -[ABSBulkFaultHandler batchOfPeopleInStorageMissingKeysIncluding:](self, "batchOfPeopleInStorageMissingKeysIncluding:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABSBulkFaultHandler keyDescriptorOfInterests](self, "keyDescriptorOfInterests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABSBulkFaultHandler completePeople:withKeysToFetch:](self, "completePeople:withKeysToFetch:", v10, v12);

  }
  else
  {
    -[ABSBulkFaultHandler increaseInterest](self, "increaseInterest");
    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABSBulkFaultHandler completePeople:withKeysToFetch:](self, "completePeople:withKeysToFetch:", v10, v7);
  }

}

- (BOOL)withinInterestWindow
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[ABSBulkFaultHandler inlineScheduler](self, "inlineScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timestamp");
  v5 = v4;

  -[ABSBulkFaultHandler lastRequestTimeStamp](self, "lastRequestTimeStamp");
  v7 = v5 - v6;
  objc_msgSend((id)objc_opt_class(), "interestWindow");
  return v7 < v8;
}

- (void)resetInterest
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20A301000, log, OS_LOG_TYPE_DEBUG, "Resetting interest", v1, 2u);
}

- (void)increaseInterest
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "interest");
  _os_log_debug_impl(&dword_20A301000, a2, OS_LOG_TYPE_DEBUG, "Increasing interest: %ld", (uint8_t *)&v3, 0xCu);
}

- (id)batchOfPeopleInStorageMissingKeysIncluding:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  void *v28;
  void *v29;
  unint64_t v30;
  id v32;
  ABSBulkFaultHandler *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v33 = self;
  -[ABSBulkFaultHandler keyDescriptorOfInterests](self, "keyDescriptorOfInterests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BDBAD58]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v12, "_cn_requiredKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "unionKeyVector:", v13);

        objc_msgSend(v12, "_cn_optionalKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBACC8], "keyVector");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToKeyVector:", v15);

        if ((v16 & 1) == 0)
          objc_msgSend(v35, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v9);
  }

  v17 = (void *)objc_msgSend(v6, "copy");
  v45 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[ABSBulkFaultHandler storage](v33, "storage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "records");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v22 = v20;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    while (2)
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        v27 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * j);
        objc_msgSend(v27, "cnImpl");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v27 != v32
          && (!objc_msgSend(v28, "areKeysAvailable:", v34)
           || (objc_msgSend(v29, "areKeysAvailable:", v35) & 1) == 0))
        {
          objc_msgSend(v21, "addObject:", v27);
          v30 = objc_msgSend(v21, "count");
          if (v30 >= objc_msgSend((id)objc_opt_class(), "batchSize"))
          {

            goto LABEL_23;
          }
        }

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v24)
        continue;
      break;
    }
  }
LABEL_23:

  return v21;
}

- (void)completePeople:(id)a3 withKeysToFetch:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    +[ABSLog log](ABSLog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v23 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_20A301000, v8, OS_LOG_TYPE_INFO, "Fetching in bulk %ld contacts!", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "_cn_map:", &__block_literal_global_3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_indexBy:", &__block_literal_global_8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[ABSBulkFaultHandler store](self, "store");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "authorizedKeysForContactKeys:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __54__ABSBulkFaultHandler_completePeople_withKeysToFetch___block_invoke_3;
    v19 = &unk_24C2F48D0;
    v20 = v10;
    v14 = v11;
    v21 = v14;
    -[ABSBulkFaultHandler refetchContacts:keysToFetch:handler:](self, "refetchContacts:keysToFetch:handler:", v9, v13, &v16);
    objc_msgSend(v14, "_cn_each:", &__block_literal_global_11_0, v16, v17, v18, v19);
    -[ABSBulkFaultHandler inlineScheduler](self, "inlineScheduler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timestamp");
    -[ABSBulkFaultHandler setLastRequestTimeStamp:](self, "setLastRequestTimeStamp:");

  }
}

uint64_t __54__ABSBulkFaultHandler_completePeople_withKeysToFetch___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cnImpl");
}

id __54__ABSBulkFaultHandler_completePeople_withKeysToFetch___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "cnImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __54__ABSBulkFaultHandler_completePeople_withKeysToFetch___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cnImpl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "overwriteStateFromContact:", v3);
  objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v6);

}

void __54__ABSBulkFaultHandler_completePeople_withKeysToFetch___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDBAD50];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  +[ABSLog log](ABSLog, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl(&dword_20A301000, v6, OS_LOG_TYPE_DEFAULT, "Backing contact has been deleted, creating a new contact: %@", buf, 0xCu);

  }
  objc_msgSend(v4, "cnImpl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyVector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __54__ABSBulkFaultHandler_completePeople_withKeysToFetch___block_invoke_13;
  v15 = &unk_24C2F4918;
  v16 = v8;
  v17 = v5;
  v10 = v5;
  v11 = v8;
  objc_msgSend(v9, "enumeratePropertiesUsingBlock:", &v12);

  objc_msgSend(v4, "replaceRecordStorageWithCNObject:", v10, v12, v13, v14, v15);
}

void __54__ABSBulkFaultHandler_completePeople_withKeysToFetch___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "CNValueForContact:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCNValue:onContact:", v5, *(_QWORD *)(a1 + 40));

}

- (void)refetchContacts:(id)a3 keysToFetch:(id)a4 handler:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDBACB8];
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithKeysToFetch:", v10);

  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BDBACA0];
    v15 = objc_msgSend(v13, "iOSLegacyIdentifier");
    objc_msgSend(v13, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predicateForFaultFulfillmentForLegacyIdentifier:identifier:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = (void *)MEMORY[0x24BDBACA0];
    objc_msgSend(v11, "_cn_map:", &__block_literal_global_18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "predicateForContactsWithIdentifiers:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v12, "setPredicate:", v17);
  objc_msgSend(v12, "setUnifyResults:", 0);
  objc_msgSend(v12, "setMutableObjects:", 0);
  -[ABSBulkFaultHandler store](self, "store");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __59__ABSBulkFaultHandler_refetchContacts_keysToFetch_handler___block_invoke_2;
  v27 = &unk_24C2F4980;
  v20 = v8;
  v28 = v20;
  v21 = objc_msgSend(v19, "enumerateContactsWithFetchRequest:error:usingBlock:", v12, &v29, &v24);
  v22 = v29;

  if ((v21 & 1) == 0)
  {
    +[ABSLog log](ABSLog, "log", v24, v25, v26, v27);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ABSBulkFaultHandler refetchContacts:keysToFetch:handler:].cold.1((uint64_t)v22, v23);

  }
}

uint64_t __59__ABSBulkFaultHandler_refetchContacts_keysToFetch_handler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __59__ABSBulkFaultHandler_refetchContacts_keysToFetch_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (ABSAddressBookContextStorage)storage
{
  return self->_storage;
}

- (CNScheduler)inlineScheduler
{
  return self->_inlineScheduler;
}

- (CNFuture)contactStoreFuture
{
  return self->_contactStoreFuture;
}

- (NSMutableSet)keyDescriptorOfInterests
{
  return self->_keyDescriptorOfInterests;
}

- (int64_t)interest
{
  return self->_interest;
}

- (void)setInterest:(int64_t)a3
{
  self->_interest = a3;
}

- (double)lastRequestTimeStamp
{
  return self->_lastRequestTimeStamp;
}

- (void)setLastRequestTimeStamp:(double)a3
{
  self->_lastRequestTimeStamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyDescriptorOfInterests, 0);
  objc_storeStrong((id *)&self->_contactStoreFuture, 0);
  objc_storeStrong((id *)&self->_inlineScheduler, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (void)refetchContacts:(uint64_t)a1 keysToFetch:(NSObject *)a2 handler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_20A301000, a2, OS_LOG_TYPE_ERROR, "Error completing contacts: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
