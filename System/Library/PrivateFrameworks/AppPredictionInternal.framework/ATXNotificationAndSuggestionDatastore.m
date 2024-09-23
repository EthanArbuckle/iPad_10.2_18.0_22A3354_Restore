@implementation ATXNotificationAndSuggestionDatastore

- (id)mergedInputEventStream
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  -[ATXNotificationAndSuggestionDatastore _notificationEventPublisher](self, "_notificationEventPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationAndSuggestionDatastore _suggestionPublisher](self, "_suggestionPublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationAndSuggestionDatastore _suggestionInteractionEventPublisher](self, "_suggestionInteractionEventPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationAndSuggestionDatastore _notificationGroupEventPublisher](self, "_notificationGroupEventPublisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationAndSuggestionDatastore _notificationDeliveryEventPublisher](self, "_notificationDeliveryEventPublisher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = v5;
  v11[2] = v6;
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationAndSuggestionDatastore _timeBasedMergePublisher:withOtherPublishers:](self, "_timeBasedMergePublisher:withOtherPublishers:", v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_timeBasedMergePublisher:(id)a3 withOtherPublishers:(id)a4
{
  return (id)objc_msgSend(a3, "orderedMergeWithOthers:comparator:", a4, &__block_literal_global_189);
}

uint64_t __86__ATXNotificationAndSuggestionDatastore__timeBasedMergePublisher_withOtherPublishers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)_notificationEventPublisher
{
  BPSPublisher *notificationEventPublisher;
  void *v4;
  void *v5;
  BPSPublisher *v6;
  BPSPublisher *v7;

  notificationEventPublisher = self->_notificationEventPublisher;
  if (!notificationEventPublisher)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -604800.0);
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "publisherFromStartTime:");
    v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    v7 = self->_notificationEventPublisher;
    self->_notificationEventPublisher = v6;

    notificationEventPublisher = self->_notificationEventPublisher;
  }
  return notificationEventPublisher;
}

- (id)_suggestionPublisher
{
  BPSPublisher *suggestionPublisher;
  void *v4;
  void *v5;
  BPSPublisher *v6;
  BPSPublisher *v7;

  suggestionPublisher = self->_suggestionPublisher;
  if (!suggestionPublisher)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -604800.0);
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "publisherFromStartTime:");
    v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    v7 = self->_suggestionPublisher;
    self->_suggestionPublisher = v6;

    suggestionPublisher = self->_suggestionPublisher;
  }
  return suggestionPublisher;
}

- (id)_suggestionInteractionEventPublisher
{
  BPSPublisher *suggestionInteractionEventPublisher;
  void *v4;
  void *v5;
  BPSPublisher *v6;
  BPSPublisher *v7;

  suggestionInteractionEventPublisher = self->_suggestionInteractionEventPublisher;
  if (!suggestionInteractionEventPublisher)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -604800.0);
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "publisherFromStartTime:");
    v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    v7 = self->_suggestionInteractionEventPublisher;
    self->_suggestionInteractionEventPublisher = v6;

    suggestionInteractionEventPublisher = self->_suggestionInteractionEventPublisher;
  }
  return suggestionInteractionEventPublisher;
}

- (id)_notificationGroupEventPublisher
{
  BPSPublisher *notificationGroupEventPublisher;
  void *v4;
  void *v5;
  BPSPublisher *v6;
  BPSPublisher *v7;

  notificationGroupEventPublisher = self->_notificationGroupEventPublisher;
  if (!notificationGroupEventPublisher)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -604800.0);
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "publisherFromStartTime:");
    v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    v7 = self->_notificationGroupEventPublisher;
    self->_notificationGroupEventPublisher = v6;

    notificationGroupEventPublisher = self->_notificationGroupEventPublisher;
  }
  return notificationGroupEventPublisher;
}

- (id)_notificationDeliveryEventPublisher
{
  BPSPublisher *notificationDeliveryEventPublisher;
  void *v4;
  void *v5;
  BPSPublisher *v6;
  BPSPublisher *v7;

  notificationDeliveryEventPublisher = self->_notificationDeliveryEventPublisher;
  if (!notificationDeliveryEventPublisher)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -604800.0);
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "publisherFromStartTime:");
    v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    v7 = self->_notificationDeliveryEventPublisher;
    self->_notificationDeliveryEventPublisher = v6;

    notificationDeliveryEventPublisher = self->_notificationDeliveryEventPublisher;
  }
  return notificationDeliveryEventPublisher;
}

- (void)updateDatabaseForEvent:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  NSObject *v7;
  char v8;
  char v9;
  char v10;
  NSObject *v11;
  char v12;
  ATXNotificationAndSuggestionDatabase *db;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v4, "eventBody");
  v7 = objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    -[ATXNotificationAndSuggestionDatastore updateDatabaseForNotificationEvent:](self, "updateDatabaseForNotificationEvent:", v7);
  }
  else
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();

    objc_msgSend(v4, "eventBody");
    v7 = objc_claimAutoreleasedReturnValue();
    if ((v8 & 1) != 0)
    {
      -[ATXNotificationAndSuggestionDatabase insertSuggestion:](self->_db, "insertSuggestion:", v7);
    }
    else
    {
      objc_opt_class();
      v9 = objc_opt_isKindOfClass();

      objc_msgSend(v4, "eventBody");
      v7 = objc_claimAutoreleasedReturnValue();
      if ((v9 & 1) != 0)
      {
        -[ATXNotificationAndSuggestionDatabase updateSuggestionFromEvent:](self->_db, "updateSuggestionFromEvent:", v7);
      }
      else
      {
        objc_opt_class();
        v10 = objc_opt_isKindOfClass();

        objc_msgSend(v4, "eventBody");
        v11 = objc_claimAutoreleasedReturnValue();
        v7 = v11;
        if ((v10 & 1) != 0)
        {
          if (-[NSObject eventType](v11, "eventType") == 3)
          {
            -[ATXNotificationAndSuggestionDatabase setAllNotificationsToClearedExceptProminent](self->_db, "setAllNotificationsToClearedExceptProminent");
          }
          else if (-[NSObject eventType](v7, "eventType") == 15)
          {
            -[ATXNotificationAndSuggestionDatabase setAllNotificationsToModified](self->_db, "setAllNotificationsToModified");
          }
        }
        else
        {
          objc_opt_class();
          v12 = objc_opt_isKindOfClass();

          if ((v12 & 1) != 0)
          {
            objc_msgSend(v4, "eventBody");
            v7 = objc_claimAutoreleasedReturnValue();
            db = self->_db;
            -[NSObject suggestionUUIDs](v7, "suggestionUUIDs");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATXNotificationAndSuggestionDatabase updateNotificationUIForNotifications:nextUI:](db, "updateNotificationUIForNotifications:nextUI:", v14, -[NSObject deliveryUI](v7, "deliveryUI"));

          }
          else
          {
            __atxlog_handle_default();
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
              -[ATXNotificationAndSuggestionDatastore updateDatabaseForEvent:].cold.1();
          }
        }
      }
    }
  }

}

- (void)updateDatabaseForNotificationEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  ATXNotificationAndSuggestionDatabase *db;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "isReceiveEvent"))
  {
    v5 = objc_msgSend(v4, "eventType");
    v6 = 1;
    if (v5 && v5 != 16)
    {
      if (v5 == 17)
      {
        v6 = 0;
      }
      else
      {
        __atxlog_handle_default();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
          -[ATXNotificationAndSuggestionDatastore updateDatabaseForNotificationEvent:].cold.1();

        v6 = 2;
      }
    }
    db = self->_db;
    objc_msgSend(v4, "modeUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "deliveryReason"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXNotificationAndSuggestionDatabase insertNotificationFromEvent:deliveryMethod:modeIdentifier:deliveryReason:](db, "insertNotificationFromEvent:deliveryMethod:modeIdentifier:deliveryReason:", v4, v6, v10, v11);

  }
  else
  {
    -[ATXNotificationAndSuggestionDatabase updateNotificationFromEvent:](self->_db, "updateNotificationFromEvent:", v4);
  }

}

- (ATXNotificationAndSuggestionDatastore)init
{
  return -[ATXNotificationAndSuggestionDatastore initWithNotificationAndSuggestionDatabase:bookmark:](self, "initWithNotificationAndSuggestionDatabase:bookmark:", 0, 0);
}

- (ATXNotificationAndSuggestionDatastore)initWithNotificationAndSuggestionDatabase:(id)a3
{
  return -[ATXNotificationAndSuggestionDatastore initWithNotificationAndSuggestionDatabase:bookmark:](self, "initWithNotificationAndSuggestionDatabase:bookmark:", a3, 0);
}

- (ATXNotificationAndSuggestionDatastore)initWithNotificationAndSuggestionDatabase:(id)a3 bookmark:(id)a4
{
  return -[ATXNotificationAndSuggestionDatastore initWithNotificationAndSuggestionDatabase:bookmark:notificationEventPublisher:suggestionPublisher:suggestionInteractionEventPublisher:](self, "initWithNotificationAndSuggestionDatabase:bookmark:notificationEventPublisher:suggestionPublisher:suggestionInteractionEventPublisher:", a3, a4, 0, 0, 0);
}

- (ATXNotificationAndSuggestionDatastore)initWithNotificationAndSuggestionDatabase:(id)a3 bookmark:(id)a4 notificationEventPublisher:(id)a5 suggestionPublisher:(id)a6 suggestionInteractionEventPublisher:(id)a7
{
  return -[ATXNotificationAndSuggestionDatastore initWithNotificationAndSuggestionDatabase:bookmark:notificationEventPublisher:suggestionPublisher:suggestionInteractionEventPublisher:notificationGroupEventPublisher:](self, "initWithNotificationAndSuggestionDatabase:bookmark:notificationEventPublisher:suggestionPublisher:suggestionInteractionEventPublisher:notificationGroupEventPublisher:", a3, a4, a5, a6, a7, 0);
}

- (ATXNotificationAndSuggestionDatastore)initWithNotificationAndSuggestionDatabase:(id)a3 bookmark:(id)a4 notificationEventPublisher:(id)a5 suggestionPublisher:(id)a6 suggestionInteractionEventPublisher:(id)a7 notificationGroupEventPublisher:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  ATXNotificationAndSuggestionDatastore *v18;
  ATXNotificationAndSuggestionDatabase *v19;
  ATXNotificationAndSuggestionDatabase *db;
  BMBookmark *v21;
  BMBookmark *bookmark;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)ATXNotificationAndSuggestionDatastore;
  v18 = -[ATXNotificationAndSuggestionDatastore init](&v24, sel_init);
  if (v18)
  {
    if (v13)
      v19 = (ATXNotificationAndSuggestionDatabase *)v13;
    else
      v19 = (ATXNotificationAndSuggestionDatabase *)objc_opt_new();
    db = v18->_db;
    v18->_db = v19;

    if (v14)
    {
      v21 = (BMBookmark *)v14;
    }
    else
    {
      -[ATXNotificationAndSuggestionDatastore _fetchBookmarkFromDb](v18, "_fetchBookmarkFromDb");
      v21 = (BMBookmark *)objc_claimAutoreleasedReturnValue();
    }
    bookmark = v18->_bookmark;
    v18->_bookmark = v21;

    objc_storeStrong((id *)&v18->_notificationEventPublisher, a5);
    objc_storeStrong((id *)&v18->_suggestionPublisher, a6);
    objc_storeStrong((id *)&v18->_suggestionInteractionEventPublisher, a7);
    objc_storeStrong((id *)&v18->_notificationEventPublisher, a5);
  }

  return v18;
}

- (id)_fetchBookmarkFromDb
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ATXNotificationAndSuggestionDatabase getBookmarkDataFromName:](self->_db, "getBookmarkDataFromName:", CFSTR("ATXNotificationAndSuggestionDatastore_bookmark"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CF94A0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bookmarkFromData:bookmarkLocation:versionNumber:", v2, CFSTR("ATXNotificationAndSuggestionDatastore_bookmark"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "bookmark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_serializeBookmark:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v13;

  v3 = (objc_class *)MEMORY[0x1E0CF94A0];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithURLPath:versionNumber:bookmark:metadata:", 0, v6, v4, 0);

  v13 = 0;
  objc_msgSend(v7, "serializeBookmark:", &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v9)
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXNotificationAndSuggestionDatastore _serializeBookmark:].cold.1();

    v11 = 0;
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (void)updateDatabase
{
  void *v3;
  BMBookmark *bookmark;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[ATXNotificationAndSuggestionDatastore mergedInputEventStream](self, "mergedInputEventStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  bookmark = self->_bookmark;
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke;
  v7[3] = &unk_1E82DAF68;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke_2;
  v6[3] = &unk_1E82E7F50;
  v5 = (id)objc_msgSend(v3, "sinkWithBookmark:completion:receiveInput:", bookmark, v7, v6);

}

void __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_serializeBookmark:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setBookmarkData:forName:", v7, CFSTR("ATXNotificationAndSuggestionDatastore_bookmark"));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v4;

}

void __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateDatabaseForEvent:", v3);
  }
  else
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke_2_cold_1();

  }
}

- (BOOL)hasUrgencyTuningSuggestionBeenShownForBundleId:(id)a3 sinceTimestamp:(double)a4
{
  return -[ATXNotificationAndSuggestionDatastore hasSuggestionBeenShownForEntityId:suggestionType:scope:sinceTimestamp:](self, "hasSuggestionBeenShownForEntityId:suggestionType:scope:sinceTimestamp:", a3, 7, 1, a4);
}

- (BOOL)hasSuggestionBeenShownForEntityId:(id)a3 suggestionType:(int64_t)a4 scope:(int64_t)a5 sinceTimestamp:(double)a6
{
  return -[ATXNotificationAndSuggestionDatabase hasSuggestionBeenShownForEntityId:suggestionType:scope:sinceTimestamp:](self->_db, "hasSuggestionBeenShownForEntityId:suggestionType:scope:sinceTimestamp:", a3, a4, a5, a6);
}

- (id)suggestionEventTypeShownForEntityId:(id)a3 suggestionType:(int64_t)a4 scope:(int64_t)a5 sinceTimestamp:(double)a6
{
  return -[ATXNotificationAndSuggestionDatabase suggestionEventTypeShownForEntityId:suggestionType:scope:sinceTimestamp:](self->_db, "suggestionEventTypeShownForEntityId:suggestionType:scope:sinceTimestamp:", a3, a4, a5, a6);
}

- (id)engagementStatusOfActiveAndProminentNotificationsWithUrgency:(int64_t)a3 sinceTimestamp:(double)a4
{
  return -[ATXNotificationAndSuggestionDatabase engagementStatusOfActiveAndProminentNotificationsWithUrgency:sinceTimestamp:](self->_db, "engagementStatusOfActiveAndProminentNotificationsWithUrgency:sinceTimestamp:", a3, a4);
}

- (id)engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp:(double)a3
{
  return -[ATXNotificationAndSuggestionDatabase engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp:](self->_db, "engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp:", a3);
}

- (id)engagementStatusOfActiveAndProminentNotificationsSinceTimestamp:(double)a3
{
  return -[ATXNotificationAndSuggestionDatabase engagementStatusOfActiveAndProminentNotificationsSinceTimestamp:](self->_db, "engagementStatusOfActiveAndProminentNotificationsSinceTimestamp:", a3);
}

- (id)mostRecentActiveNotifications
{
  return -[ATXNotificationAndSuggestionDatabase mostRecentActiveNotifications](self->_db, "mostRecentActiveNotifications");
}

- (id)numProminentActiveNotificationsPerBundleId
{
  return -[ATXNotificationAndSuggestionDatabase numProminentActiveNotificationsByGroupingColumn:](self->_db, "numProminentActiveNotificationsByGroupingColumn:", CFSTR("bundleId"));
}

- (id)numProminentActiveNotificationsPerThreadId
{
  return -[ATXNotificationAndSuggestionDatabase numProminentActiveNotificationsByGroupingColumn:](self->_db, "numProminentActiveNotificationsByGroupingColumn:", CFSTR("threadId"));
}

- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  -[ATXNotificationAndSuggestionDatastore updateDatabase](self, "updateDatabase");
  -[ATXNotificationAndSuggestionDatabase numberOfActiveNotificationsWithCompletionHandler:](self->_db, "numberOfActiveNotificationsWithCompletionHandler:", v4);

}

- (id)currentActiveSuggestions
{
  return -[ATXNotificationAndSuggestionDatabase currentActiveSuggestions](self->_db, "currentActiveSuggestions");
}

- (id)allNotificationsBetweenStartTimestamp:(id)a3 endTimestamp:(id)a4 limit:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (v9)
  {
    v12 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  -[ATXNotificationAndSuggestionDatabase allNotificationsBetweenStartTimestamp:endTimestamp:limit:](self->_db, "allNotificationsBetweenStartTimestamp:endTimestamp:limit:", v11, v12, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)notificationsReceivedPerBundleIdSinceDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  -[ATXNotificationAndSuggestionDatabase notificationsReceivedPerBundleIdSinceDate:](self->_db, "notificationsReceivedPerBundleIdSinceDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)resolutionsForNotifications:(id)a3
{
  return -[ATXNotificationAndSuggestionDatabase resolutionsForNotifications:](self->_db, "resolutionsForNotifications:", a3);
}

- (id)appSortedByNumOfNotificationsSinceTimestamp:(double)a3
{
  return -[ATXNotificationAndSuggestionDatabase appSortedByNumOfNotificationsSinceTimestamp:](self->_db, "appSortedByNumOfNotificationsSinceTimestamp:", a3);
}

- (double)receiveTimeStampOfFirstNotification
{
  double result;

  -[ATXNotificationAndSuggestionDatabase receiveTimeStampOfFirstNotification](self->_db, "receiveTimeStampOfFirstNotification");
  return result;
}

- (id)deleteAllData
{
  BMBookmark *bookmark;

  bookmark = self->_bookmark;
  self->_bookmark = 0;

  return -[ATXNotificationAndSuggestionDatabase deleteAllData](self->_db, "deleteAllData");
}

- (id)messageNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4
{
  return -[ATXNotificationAndSuggestionDatabase messageNotificationsPerAppFromStartTime:toEndTime:](self->_db, "messageNotificationsPerAppFromStartTime:toEndTime:", a3, a4);
}

- (id)timeSensitiveNonmessageNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4
{
  return -[ATXNotificationAndSuggestionDatabase timeSensitiveNonmessageNotificationsPerAppFromStartTime:toEndTime:](self->_db, "timeSensitiveNonmessageNotificationsPerAppFromStartTime:toEndTime:", a3, a4);
}

- (id)totalNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4
{
  return -[ATXNotificationAndSuggestionDatabase totalNotificationsPerAppFromStartTime:toEndTime:](self->_db, "totalNotificationsPerAppFromStartTime:toEndTime:", a3, a4);
}

- (id)getTopOfProminentStackNotificationsWithLimit:(unint64_t)a3
{
  return -[ATXNotificationAndSuggestionDatabase getTopOfProminentStackNotificationsWithLimit:](self->_db, "getTopOfProminentStackNotificationsWithLimit:", a3);
}

- (id)getTopOfNonProminentStackNotificationsWithLimit:(unint64_t)a3
{
  return -[ATXNotificationAndSuggestionDatabase getTopOfNonProminentStackNotificationsWithLimit:](self->_db, "getTopOfNonProminentStackNotificationsWithLimit:", a3);
}

- (id)telemetryDataForNotificationsFromTimestamp:(double)a3 endTimestamp:(double)a4
{
  return -[ATXNotificationAndSuggestionDatabase telemetryDataForNotificationsFromTimestamp:endTimestamp:](self->_db, "telemetryDataForNotificationsFromTimestamp:endTimestamp:", a3, a4);
}

- (id)telemetryDataForNotificationWithBundleId:(id)a3 notificationId:(id)a4 recordTimestamp:(double)a5
{
  return -[ATXNotificationAndSuggestionDatabase telemetryDataForNotificationWithBundleId:notificationId:recordTimestamp:](self->_db, "telemetryDataForNotificationWithBundleId:notificationId:recordTimestamp:", a3, a4, a5);
}

- (id)getSmartPauseFeaturesForBundleIds:(id)a3 sinceTimestamp:(double)a4
{
  return -[ATXNotificationAndSuggestionDatabase getSmartPauseFeaturesForBundleIds:sinceTimestamp:positiveEngagementEnums:](self->_db, "getSmartPauseFeaturesForBundleIds:sinceTimestamp:positiveEngagementEnums:", a3, &unk_1E83D0538, a4);
}

- (id)allNotificationsFromBundleId:(id)a3 sinceTimestamp:(double)a4
{
  return -[ATXNotificationAndSuggestionDatabase allNotificationsFromBundleId:sinceTimestamp:](self->_db, "allNotificationsFromBundleId:sinceTimestamp:", a3, a4);
}

- (id)allBundleIdsOfNotificationsOnLockscreen
{
  return -[ATXNotificationAndSuggestionDatabase allBundleIdsOfNotificationsOnLockscreen](self->_db, "allBundleIdsOfNotificationsOnLockscreen");
}

- (id)pruneNotificationsBeforeTimestamp:(double)a3
{
  return -[ATXNotificationAndSuggestionDatabase pruneNotificationsBeforeTimestamp:](self->_db, "pruneNotificationsBeforeTimestamp:", a3);
}

- (id)pruneSuggestionsBeforeTimestamp:(double)a3
{
  return -[ATXNotificationAndSuggestionDatabase pruneSuggestionsBeforeTimestamp:](self->_db, "pruneSuggestionsBeforeTimestamp:", a3);
}

- (void)pruneNotificationsBasedOnHardLimitsWithXPCActivity:(id)a3
{
  -[ATXNotificationAndSuggestionDatabase pruneNotificationsBasedOnHardLimitsWithXPCActivity:](self->_db, "pruneNotificationsBasedOnHardLimitsWithXPCActivity:", a3);
}

- (void)pruneSuggestionsBasedOnHardLimitsWithXPCActivity:(id)a3
{
  -[ATXNotificationAndSuggestionDatabase pruneSuggestionsBasedOnHardLimitsWithXPCActivity:](self->_db, "pruneSuggestionsBasedOnHardLimitsWithXPCActivity:", a3);
}

- (void)analyze
{
  -[ATXNotificationAndSuggestionDatabase analyze](self->_db, "analyze");
}

- (id)vacuumDatabase
{
  return -[ATXNotificationAndSuggestionDatabase vacuumDatabase](self->_db, "vacuumDatabase");
}

- (id)metricsForSuggestionsSinceCompletionTimestamp:(double)a3
{
  return -[ATXNotificationAndSuggestionDatabase metricsForSuggestionsSinceCompletionTimestamp:](self->_db, "metricsForSuggestionsSinceCompletionTimestamp:", a3);
}

- (id)feedbackHistoriesForKeys:(id)a3
{
  return -[ATXNotificationAndSuggestionDatabase feedbackHistoriesForKeys:](self->_db, "feedbackHistoriesForKeys:", a3);
}

- (void)pruneDatabaseWithXPCActivity:(id)a3
{
  id v4;
  double v5;
  double v6;
  NSObject *v7;
  objc_class *v8;
  char *v9;
  double v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char **__ptr32 *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  char *v31;
  id v32;
  NSObject *v33;
  objc_class *v34;
  char *v35;
  double v36;
  NSObject *v37;
  objc_class *v38;
  char *v39;
  id v40;
  NSObject *v41;
  objc_class *v42;
  char *v43;
  NSObject *v44;
  objc_class *v45;
  char *v46;
  id v47;
  NSObject *v48;
  objc_class *v49;
  char *v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  uint8_t v58[128];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  double v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  __atxlog_handle_notification_management();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v60 = v9;
    v61 = 2048;
    v62 = v6;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_INFO, "[%@] Pruning database given current time %f", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("_ATXNotificationStore.db"));
  v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v12 = objc_msgSend(v11, "removeItemAtPath:error:", *(_QWORD *)&v10, &v57);
  v13 = v57;
  v14 = v13;
  if ((v12 & 1) != 0 || !v13)
  {
    __atxlog_handle_notification_management();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v60 = "-[ATXNotificationAndSuggestionDatastore pruneDatabaseWithXPCActivity:]";
      v61 = 2112;
      v62 = v10;
      _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "%s: Migration step 10: Deleted old database at %@", buf, 0x16u);
    }

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentsOfDirectoryAtPath:error:", v21, 0);
    v19 = objc_claimAutoreleasedReturnValue();

    v22 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v22)
    {
      v23 = v22;
      v51 = v14;
      v52 = v4;
      v24 = v10;
      v25 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v54 != v25)
            objc_enumerationMutation(v19);
          v27 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          if (objc_msgSend(v27, "hasPrefix:", CFSTR("_ATXNotificationStore.db"), v51, v52))
          {
            objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "removeItemAtPath:error:", v28, 0);

          }
        }
        v23 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v23);
      v10 = v24;
      v14 = v51;
      v4 = v52;
    }
    v18 = &off_1C9E7D000;
  }
  else
  {
    objc_msgSend(v13, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "code");

    v18 = &off_1C9E7D000;
    if (v17 == 2)
      goto LABEL_22;
    __atxlog_handle_notification_management();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ATXNotificationAndSuggestionDatastore pruneDatabaseWithXPCActivity:].cold.1(*(uint64_t *)&v10, (uint64_t)v14, v19);
  }

LABEL_22:
  __atxlog_handle_notification_management();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = *((_QWORD *)v18 + 359);
    v60 = v31;
    v61 = 2048;
    v62 = v6 + -5184000.0;
    _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_INFO, "[%@] Pruning notifications with cutoff time %f", buf, 0x16u);

  }
  v32 = -[ATXNotificationAndSuggestionDatastore pruneNotificationsBeforeTimestamp:](self, "pruneNotificationsBeforeTimestamp:", v6 + -5184000.0);
  if (objc_msgSend(v4, "didDefer"))
  {
    __atxlog_handle_notification_management();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v60 = v35;
      _os_log_impl(&dword_1C9A3B000, v33, OS_LOG_TYPE_INFO, "[%@] XPC Activity deferred, skipping remaining work.", buf, 0xCu);

    }
  }
  v36 = v6 + -31536000.0;
  __atxlog_handle_notification_management();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v39 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = *((_QWORD *)v18 + 359);
    v60 = v39;
    v61 = 2048;
    v62 = v36;
    _os_log_impl(&dword_1C9A3B000, v37, OS_LOG_TYPE_INFO, "[%@] Pruning suggestions with cutoff time %f", buf, 0x16u);

  }
  v40 = -[ATXNotificationAndSuggestionDatastore pruneSuggestionsBeforeTimestamp:](self, "pruneSuggestionsBeforeTimestamp:", v36);
  if (objc_msgSend(v4, "didDefer"))
  {
    __atxlog_handle_notification_management();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v60 = v43;
      _os_log_impl(&dword_1C9A3B000, v41, OS_LOG_TYPE_INFO, "[%@] XPC Activity deferred, skipping remaining work.", buf, 0xCu);

    }
  }
  __atxlog_handle_notification_management();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    v46 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v60 = v46;
    _os_log_impl(&dword_1C9A3B000, v44, OS_LOG_TYPE_INFO, "[%@] Vacuuming database", buf, 0xCu);

  }
  v47 = -[ATXNotificationAndSuggestionDatastore vacuumDatabase](self, "vacuumDatabase");
  __atxlog_handle_notification_management();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    v49 = (objc_class *)objc_opt_class();
    NSStringFromClass(v49);
    v50 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v60 = v50;
    _os_log_impl(&dword_1C9A3B000, v48, OS_LOG_TYPE_INFO, "[%@] Finished pruning and vacuuming database", buf, 0xCu);

  }
}

- (void)notificationAndSuggestionDatastorePerfMetricsLogging
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = -[ATXNotificationAndSuggestionDatabase notificationAndSuggestionDatastorePerfMetrics](self->_db, "notificationAndSuggestionDatastorePerfMetrics");
  v4 = v3;
  v8[0] = CFSTR("notificationsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("suggestionsCount");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationDeliveryEventPublisher, 0);
  objc_storeStrong((id *)&self->_notificationGroupEventPublisher, 0);
  objc_storeStrong((id *)&self->_suggestionInteractionEventPublisher, 0);
  objc_storeStrong((id *)&self->_suggestionPublisher, 0);
  objc_storeStrong((id *)&self->_notificationEventPublisher, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)updateDatabaseForEvent:.cold.1()
{
  void *v0;
  objc_class *v1;
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_4_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_6(&dword_1C9A3B000, v6, v7, "[%@] - Encountered unknown event type: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

- (void)updateDatabaseForNotificationEvent:.cold.1()
{
  void *v0;
  objc_class *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "eventType");
  ATXNEventTypeToString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_6(&dword_1C9A3B000, v4, v5, "[%@] Received unexpected notification receive event type %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)_serializeBookmark:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;

  OUTLINED_FUNCTION_4_0();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = v1;
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "%@ – failed to serialize bookmark.  Error: %@", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

void __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke_2_cold_1()
{
  objc_class *v0;
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_6(&dword_1C9A3B000, v4, v5, "[%@] Expected a BMStoreEvent, but received a %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)pruneDatabaseWithXPCActivity:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[ATXNotificationAndSuggestionDatastore pruneDatabaseWithXPCActivity:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "%s: Failed to delete: %@ with error: %@", (uint8_t *)&v3, 0x20u);
}

@end
