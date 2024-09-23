@implementation ATXInteractionEventProvider

- (ATXInteractionEventProvider)initWithContactStore:(id)a3
{
  id v4;
  ATXInteractionEventProvider *v5;
  ATXStableContactRepresentationDatastore *v6;
  ATXStableContactRepresentationProviderProtocol *stableContactRepresentationProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXInteractionEventProvider;
  v5 = -[ATXInteractionEventProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = -[ATXStableContactRepresentationDatastore initWithContactStore:]([ATXStableContactRepresentationDatastore alloc], "initWithContactStore:", v4);
    stableContactRepresentationProvider = v5->_stableContactRepresentationProvider;
    v5->_stableContactRepresentationProvider = (ATXStableContactRepresentationProviderProtocol *)v6;

  }
  return v5;
}

- (id)biomePublisherWithBookmark:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];
  void *v41;
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  v34 = a3;
  objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D158E0], "storeWithDirectory:readOnly:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("(startDate >= %@)"), v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E83CF8F0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("(direction IN %@)"), v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  v30 = (void *)v9;
  v31 = (void *)v6;
  v42[0] = v6;
  v42[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v32 = v3;
  objc_msgSend(v3, "queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:", v12, v14, 0, 0, &v39);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v39;

  v16 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v23 = (void *)MEMORY[0x1CAA48B6C]();
        if (objc_msgSend(v22, "direction") == 1)
        {
          v24 = objc_alloc(MEMORY[0x1E0D024C8]);
          objc_msgSend(v22, "startDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "timeIntervalSinceReferenceDate");
          v26 = (void *)objc_msgSend(v24, "initWithEventBody:timestamp:", v22);

          objc_msgSend(v16, "addObject:", v26);
        }
        objc_autoreleasePoolPop(v23);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v19);
  }

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02478]), "initWithSequence:", v16);
  return v27;
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
  -[ATXInteractionEventProvider biomePublisherWithBookmark:](self, "biomePublisherWithBookmark:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__ATXInteractionEventProvider_eventsFromPublisher__block_invoke_2;
  v10[3] = &unk_1E82DCD98;
  v10[4] = self;
  v5 = v3;
  v11 = v5;
  v6 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_59, v10);

  v7 = v11;
  v8 = v5;

  return v8;
}

void __50__ATXInteractionEventProvider_eventsFromPublisher__block_invoke_2(uint64_t a1, void *a2)
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
  id v3;
  void *v4;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "eventBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)aggregationEventsFromEvent:(id)a3
{
  id v4;
  void *v5;
  ATXModeEvent *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXModeEvent *v10;
  void *v11;

  v4 = a3;
  if (-[ATXInteractionEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    objc_msgSend(v4, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [ATXModeEvent alloc];
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInteractionEventProvider contactEntityFromEvent:](self, "contactEntityFromEvent:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ATXModeEvent initWithStartDate:endDate:entity:](v6, "initWithStartDate:endDate:entity:", v7, v8, v9);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v10, 0);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)dateIntervalFromEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (-[ATXInteractionEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    objc_msgSend(v4, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v8 = v7;
    objc_msgSend(v5, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v11 = v10;

    if (v8 <= v11)
    {
      v13 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v5, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v13, "initWithStartDate:endDate:", v14, v15);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)contactEntityFromEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  ATXStableContactRepresentationProviderProtocol *stableContactRepresentationProvider;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  if (-[ATXInteractionEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    objc_msgSend(v4, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "mechanism") == 4)
    {
      -[ATXInteractionEventProvider contactEntityFromInstantMessagingInteraction:](self, "contactEntityFromInstantMessagingInteraction:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "recipients");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8 <= 1)
      {
        objc_msgSend(v5, "recipients");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "personId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          stableContactRepresentationProvider = self->_stableContactRepresentationProvider;
          objc_msgSend(v10, "personId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXStableContactRepresentationProviderProtocol stableContactRepresentationForCnContactId:rawIdentifier:](stableContactRepresentationProvider, "stableContactRepresentationForCnContactId:rawIdentifier:", v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "stableContactIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_alloc(MEMORY[0x1E0CF8D48]);
          objc_msgSend(v10, "displayName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "personId");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = (void *)objc_msgSend(v16, "initWithDisplayName:rawIdentifier:cnContactId:stableContactIdentifier:", v17, v18, v19, v15);

        }
      }
      else
      {
        v6 = 0;
      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)contactEntityFromInstantMessagingInteraction:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  ATXStableContactRepresentationProviderProtocol *stableContactRepresentationProvider;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") >= 2
    && (objc_msgSend(v5, "groupName"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v8))
  {
    objc_msgSend(v5, "groupName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
  }
  else if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "personId");
    v10 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  objc_msgSend(v5, "bundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  if (v14)
  {
    objc_msgSend(v5, "domainIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "derivedIntentIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_12;
    objc_msgSend(v5, "derivedIntentIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
LABEL_12:
  if (v10 | v16)
  {
    if (!v10)
    {
      __atxlog_handle_notification_management();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412546;
        v29 = v18;
        v30 = 2112;
        v31 = v20;
        _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "No cnContactId provided for %@ in %@", (uint8_t *)&v28, 0x16u);

      }
    }
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D48]), "initWithDisplayName:rawIdentifier:cnContactId:", v9, v16, v10);
    if (objc_msgSend(v6, "count") == 1)
    {
      stableContactRepresentationProvider = self->_stableContactRepresentationProvider;
      objc_msgSend(v6, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXStableContactRepresentationProviderProtocol stableContactRepresentationForCnContactId:rawIdentifier:](stableContactRepresentationProvider, "stableContactRepresentationForCnContactId:rawIdentifier:", v10, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "stableContactIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setStableContactIdentifier:", v26);

    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (NSString)description
{
  return (NSString *)CFSTR("ContactInteractions");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableContactRepresentationProvider, 0);
}

@end
