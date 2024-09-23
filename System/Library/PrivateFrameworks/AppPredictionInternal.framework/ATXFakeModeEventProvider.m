@implementation ATXFakeModeEventProvider

- (ATXFakeModeEventProvider)initWithEventDateIntervals:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  ATXModeEvent *v14;
  ATXFakeModeEventProvider *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "startDate", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[ATXModeEvent initWithStartDate:endDate:]([ATXModeEvent alloc], "initWithStartDate:endDate:", v12, v13);
        objc_msgSend(v5, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = -[ATXFakeModeEventProvider initWithModeEvents:expectsNilEntity:](self, "initWithModeEvents:expectsNilEntity:", v5, 1);
  return v15;
}

- (ATXFakeModeEventProvider)initWithModeEvents:(id)a3 expectsNilEntity:(BOOL)a4
{
  id v7;
  ATXFakeModeEventProvider *v8;
  ATXFakeModeEventProvider *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXFakeModeEventProvider;
  v8 = -[ATXFakeModeEventProvider init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_modeEvents, a3);
    v9->_wasInitializedWithoutEntity = a4;
  }

  return v9;
}

- (id)biomePublisherWithBookmark:(id)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_modeEvents;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0D024C8]);
        objc_msgSend(v10, "startDate", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceReferenceDate");
        v13 = (void *)objc_msgSend(v11, "initWithEventBody:timestamp:", v10);

        objc_msgSend(v4, "addObject:", v13);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02478]), "initWithSequence:", v4);
  return v14;
}

- (id)eventsFromPublisher
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v3 = (void *)objc_opt_new();
  -[ATXFakeModeEventProvider biomePublisherWithBookmark:](self, "biomePublisherWithBookmark:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__ATXFakeModeEventProvider_eventsFromPublisher__block_invoke_2;
  v10[3] = &unk_1E82DCD98;
  v10[4] = self;
  v5 = v3;
  v11 = v5;
  v6 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_63, v10);

  v7 = v11;
  v8 = v5;

  return v8;
}

void __47__ATXFakeModeEventProvider_eventsFromPublisher__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "aggregationEventsFromEvent:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v6);

    v5 = v7;
  }

}

- (BOOL)publisherIsCoreDuetWrapper
{
  return 0;
}

- (BOOL)isEventFromProvider:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  _BOOL4 wasInitializedWithoutEntity;
  void *v11;
  BOOL v12;
  BOOL v13;
  void *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v13 = 0;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v5, "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    wasInitializedWithoutEntity = self->_wasInitializedWithoutEntity;
    if (self->_wasInitializedWithoutEntity)
    {
      objc_msgSend(v8, "entity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = 1;
        goto LABEL_12;
      }
      if (self->_wasInitializedWithoutEntity)
      {
        v11 = 0;
        v12 = 0;
        goto LABEL_12;
      }
    }
    objc_msgSend(v9, "entity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14 == 0;

    if (!wasInitializedWithoutEntity)
    {
LABEL_13:
      v13 = !v12;

      goto LABEL_14;
    }
    v11 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (id)aggregationEventsFromEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ATXFakeModeEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    objc_msgSend(v4, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)updateEntitySpecificFeaturesDict:(id)a3 aggregationEvent:(id)a4 isLocalToMode:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "entity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend(v9, "entity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v13);

    }
    objc_msgSend(v9, "entity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "identifiersAndDates");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v9, "entity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v9, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSince1970");
      objc_msgSend(v20, "numberWithDouble:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@_%@"), v19, v22);
      -[NSObject addObject:](v16, "addObject:", v23);

    }
    else
    {
      __atxlog_handle_notification_management();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[ATXFakeModeEventProvider updateEntitySpecificFeaturesDict:aggregationEvent:isLocalToMode:].cold.1((uint64_t)v15, v16);
    }

  }
}

- (id)dateIntervalFromEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[ATXFakeModeEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    objc_msgSend(v4, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)CFSTR("FakeModeEvent");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeEvents, 0);
}

- (void)updateEntitySpecificFeaturesDict:(uint64_t)a1 aggregationEvent:(NSObject *)a2 isLocalToMode:.cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Encountered an event of unknown type. Expected ATXFakeEntityFeatures, received: %@", (uint8_t *)&v5, 0xCu);

}

@end
