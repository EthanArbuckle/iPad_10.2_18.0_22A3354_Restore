@implementation ATXNotificationEventProvider

- (ATXNotificationEventProvider)initWithEventType:(int64_t)a3 contactStore:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  ATXNotificationEventProvider *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ATXNotificationEventProvider initWithEventTypes:contactStore:](self, "initWithEventTypes:contactStore:", v9, v7);

  return v10;
}

- (ATXNotificationEventProvider)initWithEventTypes:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  ATXNotificationEventProvider *v9;
  ATXNotificationEventProvider *v10;
  ATXStableContactRepresentationDatastore *v11;
  ATXStableContactRepresentationProviderProtocol *stableContactRepresentationProvider;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXNotificationEventProvider;
  v9 = -[ATXNotificationEventProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventTypes, a3);
    v11 = -[ATXStableContactRepresentationDatastore initWithContactStore:]([ATXStableContactRepresentationDatastore alloc], "initWithContactStore:", v8);
    stableContactRepresentationProvider = v10->_stableContactRepresentationProvider;
    v10->_stableContactRepresentationProvider = (ATXStableContactRepresentationProviderProtocol *)v11;

  }
  return v10;
}

- (id)biomePublisherWithBookmark:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3, -2419200.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "publisherFromStartTime:endTime:maxEvents:lastN:reversed:", v4, 0, 0, 2000, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__ATXNotificationEventProvider_biomePublisherWithBookmark___block_invoke;
  v9[3] = &unk_1E82DF748;
  v9[4] = self;
  objc_msgSend(v6, "filterWithIsIncluded:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __59__ATXNotificationEventProvider_biomePublisherWithBookmark___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_notification_management();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __59__ATXNotificationEventProvider_biomePublisherWithBookmark___block_invoke_cold_1();

      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99768];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "raise:format:", v8, CFSTR("Encountered event in ATXNotificationEventProvider that was of unknown class. Expected ATXUserNotificationLoggingEvent. Received: %@"), v10);

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v16 = objc_msgSend(v5, "eventType");
          if (v16 == objc_msgSend(v15, "integerValue"))
          {
            v12 = 1;
            goto LABEL_16;
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    v12 = 0;
  }

  return v12;
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
  -[ATXNotificationEventProvider biomePublisherWithBookmark:](self, "biomePublisherWithBookmark:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__ATXNotificationEventProvider_eventsFromPublisher__block_invoke_2;
  v10[3] = &unk_1E82E62F0;
  v10[4] = self;
  v5 = v3;
  v11 = v5;
  v6 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_147, v10);

  v7 = v11;
  v8 = v5;

  return v8;
}

void __51__ATXNotificationEventProvider_eventsFromPublisher__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "aggregationEventsFromEvent:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v3);

}

- (BOOL)publisherIsCoreDuetWrapper
{
  return 1;
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
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  ATXModeEvent *v29;
  void *v30;
  void *v31;
  ATXModeEvent *v32;
  void *v33;
  ATXModeEvent *v34;

  v4 = a3;
  if (-[ATXNotificationEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    objc_msgSend(v4, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v5, "timestamp");
    v7 = (void *)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
    objc_msgSend(v5, "notification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8CC0]), "initWithBundleId:", v9);
      if (v10)
      {
        objc_msgSend(v5, "notification");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isMessage");

        if (v12)
        {
          objc_msgSend(v5, "notification");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isGroupMessage");

          objc_msgSend(v5, "notification");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v14)
          {
            objc_msgSend(v15, "threadID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D48]), "initWithDisplayName:rawIdentifier:cnContactId:", 0, v17, 0);
            else
              v18 = 0;
          }
          else
          {
            objc_msgSend(v15, "contactIDs");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "firstObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "notification");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "rawIdentifiers");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "firstObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              -[ATXStableContactRepresentationProviderProtocol stableContactRepresentationForCnContactId:rawIdentifier:](self->_stableContactRepresentationProvider, "stableContactRepresentationForCnContactId:rawIdentifier:", v17, v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "stableContactIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D48]), "initWithDisplayName:rawIdentifier:cnContactId:stableContactIdentifier:", 0, v23, v17, v25);

            }
            else
            {
              __atxlog_handle_notification_management();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                -[ATXNotificationEventProvider aggregationEventsFromEvent:].cold.1(v5);

              v18 = 0;
            }

          }
        }
        else
        {
          v18 = 0;
        }
        v19 = (void *)objc_opt_new();
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8FC0]), "initWithAppEntity:contactEntity:", v10, 0);
        objc_msgSend(v5, "notification");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timestamp");
        objc_msgSend(v27, "setReceiveTimestamp:");

        if (v27)
        {
          v29 = -[ATXModeEvent initWithStartDate:endDate:entity:]([ATXModeEvent alloc], "initWithStartDate:endDate:entity:", v7, v7, v27);
          objc_msgSend(v19, "addObject:", v29);

        }
        if (v18)
        {
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8FC0]), "initWithAppEntity:contactEntity:", v10, v18);

          objc_msgSend(v5, "notification");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "timestamp");
          objc_msgSend(v30, "setReceiveTimestamp:");

          if (v30)
          {
            v32 = -[ATXModeEvent initWithStartDate:endDate:entity:]([ATXModeEvent alloc], "initWithStartDate:endDate:entity:", v7, v7, v30);
            objc_msgSend(v19, "addObject:", v32);

          }
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8FC0]), "initWithAppEntity:contactEntity:", 0, v18);

          objc_msgSend(v5, "notification");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "timestamp");
          objc_msgSend(v27, "setReceiveTimestamp:");

          if (v27)
          {
            v34 = -[ATXModeEvent initWithStartDate:endDate:entity:]([ATXModeEvent alloc], "initWithStartDate:endDate:entity:", v7, v7, v27);
            objc_msgSend(v19, "addObject:", v34);

          }
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)dateIntervalFromEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[ATXNotificationEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    objc_msgSend(v4, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v5, "timestamp");
    v7 = (void *)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateEntitySpecificFeaturesDict:(id)a3 aggregationEvent:(id)a4 isLocalToMode:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
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
  NSObject *v20;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v5)
  {
    objc_msgSend(v9, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend(v10, "entity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v14);

    }
    objc_msgSend(v10, "entity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "secondsToEngagement");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB37E8];
      -[ATXNotificationEventProvider secondsSinceReceiptForModeEvent:](self, "secondsSinceReceiptForModeEvent:", v10);
      objc_msgSend(v18, "numberWithDouble:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v19);

    }
    else
    {
      __atxlog_handle_notification_management();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[ATXNotificationEventProvider updateEntitySpecificFeaturesDict:aggregationEvent:isLocalToMode:].cold.1((uint64_t)v16, v20);

    }
  }

}

- (double)secondsSinceReceiptForModeEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;

  v3 = a3;
  objc_msgSend(v3, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v4, "receiveTimestamp");
  v7 = (void *)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
  objc_msgSend(v5, "timeIntervalSinceDate:", v7);
  v9 = v8;

  return v9;
}

- (NSString)description
{
  void *v3;
  NSArray *eventTypes;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  eventTypes = self->_eventTypes;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ATXNotificationEventProvider_description__block_invoke;
  v7[3] = &unk_1E82E6318;
  v5 = v3;
  v8 = v5;
  -[NSArray enumerateObjectsUsingBlock:](eventTypes, "enumerateObjectsUsingBlock:", v7);

  return (NSString *)v5;
}

void __43__ATXNotificationEventProvider_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("-"));
  objc_msgSend(v6, "integerValue");
  ATXNEventTypeToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableContactRepresentationProvider, 0);
  objc_storeStrong((id *)&self->_eventTypes, 0);
}

void __59__ATXNotificationEventProvider_biomePublisherWithBookmark___block_invoke_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "Encountered event in ATXNotificationEventProvider that was of unknown class. Expected ATXUserNotificationLoggingEvent. Received: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)aggregationEventsFromEvent:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "notification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "Notification didn't have a contactId, although it was a message and wasn't a group message. Notification: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
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
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Encountered an event of unknown type. Expected ATXNotificationEntityFeatures, received: %@", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_1();
}

@end
