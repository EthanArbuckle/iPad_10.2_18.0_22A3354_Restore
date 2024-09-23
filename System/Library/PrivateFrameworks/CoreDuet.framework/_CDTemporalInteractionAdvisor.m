@implementation _CDTemporalInteractionAdvisor

- (_CDTemporalInteractionAdvisor)initWithStore:(id)a3
{
  id v5;
  _CDTemporalInteractionAdvisor *v6;
  _CDTemporalInteractionAdvisor *v7;
  dispatch_queue_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *consumerToModelMap;
  const char *v17;
  NSObject *v18;
  _QWORD handler[4];
  id v21;
  id location;
  objc_super v23;
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_CDTemporalInteractionAdvisor;
  v6 = -[_CDTemporalInteractionAdvisor init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = dispatch_queue_create("com.apple.coreduet.cdtemporalAdvisor.serialqueue", 0);
    -[_CDTemporalInteractionAdvisor setDataQueue:](v7, "setDataQueue:", v8);

    v24[0] = &unk_1E272AC18;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v9;
    v24[1] = &unk_1E272AC60;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v10;
    v24[2] = &unk_1E272AC30;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v11;
    v24[3] = &unk_1E272AC48;
    v12 = (void *)objc_opt_new();
    v25[3] = v12;
    v24[4] = &unk_1E272AC78;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[4] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "mutableCopy");
    consumerToModelMap = v7->_consumerToModelMap;
    v7->_consumerToModelMap = (NSMutableDictionary *)v15;

    -[_CDTemporalInteractionAdvisor updateConsumerModel](v7, "updateConsumerModel");
    objc_initWeak(&location, v7);
    v17 = (const char *)objc_msgSend(CFSTR("com.apple.coreduet.CDPeopleSettingsDidChange"), "UTF8String");
    -[_CDTemporalInteractionAdvisor dataQueue](v7, "dataQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __47___CDTemporalInteractionAdvisor_initWithStore___block_invoke;
    handler[3] = &unk_1E26E4DC0;
    objc_copyWeak(&v21, &location);
    notify_register_dispatch(v17, &v7->_settingsNotifyToken, v18, handler);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_settingsNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)_CDTemporalInteractionAdvisor;
  -[_CDTemporalInteractionAdvisor dealloc](&v3, sel_dealloc);
}

- (void)updateConsumerModel
{
  id v2;

  -[_CDTemporalInteractionAdvisor consumerToModelMap](self, "consumerToModelMap");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[_CDInteractionAdvisorUtils updateConsumerModelSettings:](_CDInteractionAdvisorUtils, "updateConsumerModelSettings:", v2);

}

- (void)setConsumerToModelMap:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;
  id v15;

  v4 = a3;
  -[_CDTemporalInteractionAdvisor dataQueue](self, "dataQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55___CDTemporalInteractionAdvisor_setConsumerToModelMap___block_invoke;
  v11[3] = &unk_1E26E3250;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  v8 = v4;
  v9 = (void *)os_transaction_create();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_4;
  block[3] = &unk_1E26E3380;
  v14 = v9;
  v15 = v7;
  v10 = v9;
  dispatch_async(v5, block);

}

- (id)rankerForDate:(id)a3 settings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setReferenceDate:", v6);

  objc_msgSend(v5, "contactPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContactPrefix:", v8);

  objc_msgSend(v7, "setTimeHalfLife:", 172800.0);
  objc_msgSend(v7, "setTimeOfDayHalfLife:", 7200.0);
  objc_msgSend(v7, "setTimeOfWeekHalfLife:", 21600.0);
  objc_msgSend(v7, "setTimeWeight:", 2.0);
  objc_msgSend(v7, "setTimeOfDayWeight:", 1.0);
  objc_msgSend(v7, "setTimeOfWeekWeight:", 2.0);
  objc_msgSend(v7, "setOutgoingWeight:", 2.0);
  objc_msgSend(v7, "setKeywordWeight:", 100000.0);
  objc_msgSend(v7, "setContactNameKeywordMatchWeight:", 200000.0);
  objc_msgSend(v5, "interactionTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDStringTokenizer extractNormalizedKeywords:](_CDStringTokenizer, "extractNormalizedKeywords:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setReferenceKeywords:", v10);

  objc_msgSend(v5, "constrainIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowedIdentifiers:", v11);

  objc_msgSend(v5, "constrainPersonIds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowedPersonIds:", v12);

  objc_msgSend(v5, "constrainPersonIdType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowedPersonIdType:", v13);

  objc_msgSend(v7, "setLocationWeight:", 4.0);
  objc_msgSend(v5, "interactionLocationUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setReferenceLocationUUID:", v14);
  objc_msgSend(v7, "setRankAggregationMethod:", 0);
  return v7;
}

- (id)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  _CDInteractionStore *store;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *context;
  void *v46;
  _QWORD v47[3];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  context = (void *)MEMORY[0x193FEE914]();
  -[_CDTemporalInteractionAdvisor rankerForDate:settings:](self, "rankerForDate:settings:", v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  -[_CDTemporalInteractionAdvisor consumerToModelMap](self, "consumerToModelMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)v8;
  +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:](_CDInteractionAdvisorUtils, "adjustForConsumerSettings:modelSettings:andRanker:", v7, v9, v8);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactPredicate");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = 0x1E0CB3000uLL;
  v13 = 0x1E0C99000uLL;
  v43 = (void *)v11;
  if (v11)
  {
    -[_CDInteractionStore queryContactsUsingPredicate:sortDescriptors:limit:error:](self->_store, "queryContactsUsingPredicate:sortDescriptors:limit:error:", v11, 0, 500, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "valueForKey:", CFSTR("identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sender.identifier IN %@"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY recipients.identifier IN %@"), v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v10;
      v18 = (void *)MEMORY[0x1E0CB3528];
      v48[0] = v15;
      v48[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "orPredicateWithSubpredicates:", v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0x1E0CB3000;
      v13 = 0x1E0C99000;

    }
  }
  else
  {
    v42 = 0;
  }
  if (objc_msgSend(v7, "useFuture"))
    v20 = 4;
  else
    v20 = 0;
  +[_CDInteractionAdvisorUtils createTimePredicateForReferenceDate:recentLookBackDays:windowHours:lookBackWeeks:lookAheadWeeks:](_CDInteractionAdvisorUtils, "createTimePredicateForReferenceDate:recentLookBackDays:windowHours:lookBackWeeks:lookAheadWeeks:", v6, 168, 24, 4, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interactionPredicate");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *(void **)(v12 + 1320);
  v40 = (void *)v22;
  v41 = (void *)v21;
  v47[0] = v21;
  v47[1] = v22;
  v47[2] = v10;
  objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", v47, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "andPredicateWithSubpredicates:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v26 = objc_claimAutoreleasedReturnValue();
  v39 = v6;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[_CDTemporalInteractionAdvisor adviseInteractionsForDate:usingSettings:].cold.1();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  store = self->_store;
  v46 = v27;
  objc_msgSend(*(id *)(v13 + 3360), "arrayWithObjects:count:", &v46, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:error:](store, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v25, v29, 500, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ignoreContactIdentifiers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "allObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDInteractionAdvisorUtils contactsForIdentifiers:](_CDInteractionAdvisorUtils, "contactsForIdentifiers:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_msgSend(v7, "resultLimit");
  v35 = objc_msgSend(v7, "aggregateByIdentifier");
  LOBYTE(v38) = objc_msgSend(v7, "requireOutgoingInteraction");
  +[_CDInteractionAdvisorUtils adviceBasedOnInteractions:forContacts:andRanker:ignoringContacts:withLimit:aggregateByIdentifier:requireOneOutgoingInteraction:](_CDInteractionAdvisorUtils, "adviceBasedOnInteractions:forContacts:andRanker:ignoringContacts:withLimit:aggregateByIdentifier:requireOneOutgoingInteraction:", v30, v42, v44, v33, v34, v35, v38);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v36;
}

- (id)rankContacts:(id)a3 usingSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _CDInteractionStore *store;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[3];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "interactionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[_CDTemporalInteractionAdvisor rankerForDate:settings:](self, "rankerForDate:settings:", v8, v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDTemporalInteractionAdvisor consumerToModelMap](self, "consumerToModelMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:](_CDInteractionAdvisorUtils, "adjustForConsumerSettings:modelSettings:andRanker:", v6, v9, v28);

  objc_msgSend(v7, "valueForKey:", CFSTR("identifier"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate <= %@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sender.identifier IN %@"), v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY recipients.identifier IN %@"), v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13 = (void *)MEMORY[0x1E0CB3528];
  v31[0] = v26;
  v31[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "orPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3528];
  v30[0] = v10;
  v30[1] = v11;
  v30[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  store = self->_store;
  v29 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:error:](store, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v18, v21, 500, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDInteractionAdvisorUtils rankContacts:basedOnInteractions:andRanker:](_CDInteractionAdvisorUtils, "rankContacts:basedOnInteractions:andRanker:", v12, v22, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (_CDInteractionStore)store
{
  return (_CDInteractionStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)dataQueue
{
  return self->_dataQueue;
}

- (void)setDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dataQueue, a3);
}

- (NSMutableDictionary)consumerToModelMap
{
  return self->_consumerToModelMap;
}

- (int)settingsNotifyToken
{
  return self->_settingsNotifyToken;
}

- (void)setSettingsNotifyToken:(int)a3
{
  self->_settingsNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumerToModelMap, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)adviseInteractionsForDate:usingSettings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v0, v1, "Querying interactions with predicate %@", v2);
  OUTLINED_FUNCTION_5();
}

@end
