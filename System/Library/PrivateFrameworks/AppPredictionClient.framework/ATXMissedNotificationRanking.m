@implementation ATXMissedNotificationRanking

- (ATXMissedNotificationRanking)initWithNotifications:(id)a3 modeId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ATXMissedNotificationRanking *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = -[ATXMissedNotificationRanking initWithNotifications:modeId:ranker:](self, "initWithNotifications:modeId:ranker:", v7, v6, v8);

  return v9;
}

- (ATXMissedNotificationRanking)initWithNotifications:(id)a3 modeId:(id)a4 ranker:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ATXMissedNotificationRanking *v11;

  v8 = a5;
  v9 = a4;
  +[ATXUserNotificationDigestNotificationGroup groupsFromNotifications:modeId:](ATXUserNotificationDigestNotificationGroup, "groupsFromNotifications:modeId:", a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ATXMissedNotificationRanking initWithGroups:modeId:ranker:](self, "initWithGroups:modeId:ranker:", v10, v9, v8);

  return v11;
}

- (ATXMissedNotificationRanking)initWithNotificationArrays:(id)a3 modeId:(id)a4 ranker:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ATXMissedNotificationRanking *v12;
  _QWORD v14[4];
  id v15;

  v8 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__ATXMissedNotificationRanking_initWithNotificationArrays_modeId_ranker___block_invoke;
  v14[3] = &unk_1E4D58080;
  v15 = v8;
  v9 = v8;
  v10 = a5;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ATXMissedNotificationRanking initWithGroups:modeId:ranker:](self, "initWithGroups:modeId:ranker:", v11, v9, v10);

  return v12;
}

ATXUserNotificationDigestNotificationGroup *__73__ATXMissedNotificationRanking_initWithNotificationArrays_modeId_ranker___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ATXUserNotificationDigestNotificationGroup *v4;

  v3 = a2;
  v4 = -[ATXUserNotificationDigestNotificationGroup initWithNotifications:modeId:]([ATXUserNotificationDigestNotificationGroup alloc], "initWithNotifications:modeId:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (ATXMissedNotificationRanking)initWithGroups:(id)a3 modeId:(id)a4 ranker:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXMissedNotificationRanking *v11;
  uint64_t v12;
  NSArray *rankedGroups;
  uint64_t v14;
  NSUUID *uuid;
  uint64_t v16;
  NSString *rankerId;
  uint64_t v18;
  NSString *modeIdString;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXMissedNotificationRanking;
  v11 = -[ATXMissedNotificationRanking init](&v21, sel_init);
  if (v11)
  {
    objc_msgSend(v10, "rankNotificationGroups:modeId:", v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
    rankedGroups = v11->_rankedGroups;
    v11->_rankedGroups = (NSArray *)v12;

    v11->_creationTimestamp = CFAbsoluteTimeGetCurrent();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = objc_claimAutoreleasedReturnValue();
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v14;

    objc_msgSend((id)objc_opt_class(), "rankerId");
    v16 = objc_claimAutoreleasedReturnValue();
    rankerId = v11->_rankerId;
    v11->_rankerId = (NSString *)v16;

    v18 = objc_msgSend(v9, "copy");
    modeIdString = v11->_modeIdString;
    v11->_modeIdString = (NSString *)v18;

  }
  return v11;
}

- (BOOL)doesRankingShareContentWithOtherRanking:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ATXMissedNotificationRanking allNotificationIds](self, "allNotificationIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allNotificationIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "intersectsSet:", v6);
  return (char)v4;
}

- (id)allNotificationIds
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[ATXMissedNotificationRanking rankedGroups](self, "rankedGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v9, "rankedNotifications", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "uuid");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)logCollapsedPreview
{
  ATXMissedNotificationRankingLoggingEvent *v3;
  void *v4;
  ATXMissedNotificationRankingBiomeStream *loggingStream;
  ATXMissedNotificationRankingLoggingEvent *v6;

  if (!self->_hasLoggedCollapsed)
  {
    self->_hasLoggedCollapsed = 1;
    v3 = [ATXMissedNotificationRankingLoggingEvent alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v6 = -[ATXMissedNotificationRankingLoggingEvent initWithMissedNotificationRanking:eventType:timestamp:](v3, "initWithMissedNotificationRanking:eventType:timestamp:", self, 1);

    loggingStream = self->_loggingStream;
    if (loggingStream)
      -[ATXMissedNotificationRankingBiomeStream sendEvent:](loggingStream, "sendEvent:", v6);

  }
}

- (void)logView
{
  ATXMissedNotificationRankingLoggingEvent *v3;
  void *v4;
  ATXMissedNotificationRankingBiomeStream *loggingStream;
  ATXMissedNotificationRankingLoggingEvent *v6;

  if (!self->_hasLoggedExpanded)
  {
    self->_hasLoggedExpanded = 1;
    v3 = [ATXMissedNotificationRankingLoggingEvent alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v6 = -[ATXMissedNotificationRankingLoggingEvent initWithMissedNotificationRanking:eventType:timestamp:](v3, "initWithMissedNotificationRanking:eventType:timestamp:", self, 0);

    loggingStream = self->_loggingStream;
    if (loggingStream)
      -[ATXMissedNotificationRankingBiomeStream sendEvent:](loggingStream, "sendEvent:", v6);

  }
}

- (void)logExpandedViewWithIsUpcoming:(BOOL)a3
{
  ATXMissedNotificationRankingLoggingEvent *v4;
  ATXMissedNotificationRankingLoggingEvent *v5;
  ATXMissedNotificationRanking *v6;
  uint64_t v7;
  ATXMissedNotificationRankingLoggingEvent *v8;
  ATXMissedNotificationRankingLoggingEvent *v9;
  ATXMissedNotificationRankingBiomeStream *loggingStream;
  ATXMissedNotificationRankingLoggingEvent *v11;

  if (a3)
  {
    if (self->_hasLoggedUpcomingExpanded)
      return;
    self->_hasLoggedUpcomingExpanded = 1;
    v4 = [ATXMissedNotificationRankingLoggingEvent alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5 = v4;
    v6 = self;
    v7 = 2;
  }
  else
  {
    if (self->_hasLoggedDeliveredExpanded)
      return;
    self->_hasLoggedDeliveredExpanded = 1;
    v8 = [ATXMissedNotificationRankingLoggingEvent alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5 = v8;
    v6 = self;
    v7 = 3;
  }
  v9 = -[ATXMissedNotificationRankingLoggingEvent initWithMissedNotificationRanking:eventType:timestamp:](v5, "initWithMissedNotificationRanking:eventType:timestamp:", v6, v7);
  loggingStream = self->_loggingStream;
  if (loggingStream)
  {
    v11 = v9;
    -[ATXMissedNotificationRankingBiomeStream sendEvent:](loggingStream, "sendEvent:", v9);
    v9 = v11;
  }

}

- (void)logCollapsedViewWithIsUpcoming:(BOOL)a3
{
  ATXMissedNotificationRankingLoggingEvent *v4;
  ATXMissedNotificationRankingLoggingEvent *v5;
  ATXMissedNotificationRanking *v6;
  uint64_t v7;
  ATXMissedNotificationRankingLoggingEvent *v8;
  ATXMissedNotificationRankingLoggingEvent *v9;
  ATXMissedNotificationRankingBiomeStream *loggingStream;
  ATXMissedNotificationRankingLoggingEvent *v11;

  if (a3)
  {
    if (self->_hasLoggedUpcomingCollapsed)
      return;
    self->_hasLoggedUpcomingCollapsed = 1;
    v4 = [ATXMissedNotificationRankingLoggingEvent alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5 = v4;
    v6 = self;
    v7 = 4;
  }
  else
  {
    if (self->_hasLoggedDeliveredCollapsed)
      return;
    self->_hasLoggedDeliveredCollapsed = 1;
    v8 = [ATXMissedNotificationRankingLoggingEvent alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5 = v8;
    v6 = self;
    v7 = 5;
  }
  v9 = -[ATXMissedNotificationRankingLoggingEvent initWithMissedNotificationRanking:eventType:timestamp:](v5, "initWithMissedNotificationRanking:eventType:timestamp:", v6, v7);
  loggingStream = self->_loggingStream;
  if (loggingStream)
  {
    v11 = v9;
    -[ATXMissedNotificationRankingBiomeStream sendEvent:](loggingStream, "sendEvent:", v9);
    v9 = v11;
  }

}

- (void)logRemoval
{
  ATXMissedNotificationRankingLoggingEvent *v3;
  ATXMissedNotificationRankingLoggingEvent *v4;
  ATXMissedNotificationRankingBiomeStream *loggingStream;
  ATXMissedNotificationRankingLoggingEvent *v6;

  if (!self->_hasLoggedRemoval)
  {
    self->_hasLoggedRemoval = 1;
    v3 = [ATXMissedNotificationRankingLoggingEvent alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v4 = -[ATXMissedNotificationRankingLoggingEvent initWithMissedNotificationRanking:eventType:timestamp:](v3, "initWithMissedNotificationRanking:eventType:timestamp:", self, 6);
    loggingStream = self->_loggingStream;
    if (loggingStream)
    {
      v6 = v4;
      -[ATXMissedNotificationRankingBiomeStream sendEvent:](loggingStream, "sendEvent:", v4);
      v4 = v6;
    }

  }
}

- (id)initFromJSON:(id)a3
{
  id v4;
  id v5;
  ATXMissedNotificationRanking *v6;

  v4 = a3;
  v5 = -[ATXPBMissedNotificationRanking initFromJSON:]([ATXPBMissedNotificationRanking alloc], "initFromJSON:", v4);

  v6 = -[ATXMissedNotificationRanking initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;

  -[ATXMissedNotificationRanking proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXMissedNotificationRanking)initWithProtoData:(id)a3
{
  id v4;
  ATXPBMissedNotificationRanking *v5;
  ATXMissedNotificationRanking *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBMissedNotificationRanking initWithData:]([ATXPBMissedNotificationRanking alloc], "initWithData:", v4);

    self = -[ATXMissedNotificationRanking initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXMissedNotificationRanking proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXMissedNotificationRanking)initWithProto:(id)a3
{
  id v4;
  ATXMissedNotificationRanking *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *rankedGroups;
  NSObject *v11;
  ATXMissedNotificationRanking *v12;
  double v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSUUID *uuid;
  uint64_t v18;
  NSString *rankerId;
  uint64_t v20;
  NSString *modeIdString;
  void *v22;
  void *v23;
  char isKindOfClass;
  ATXSharedDigestEngagementTrackingMetrics *v25;
  NSObject *v26;
  ATXSharedDigestEngagementTrackingMetrics *v27;
  void *v28;
  void *v29;
  char v30;
  ATXDigestTimeline *v31;
  NSObject *v32;
  ATXDigestTimeline *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)ATXMissedNotificationRanking;
  v5 = -[ATXMissedNotificationRanking init](&v35, sel_init);
  if (!v5)
  {
LABEL_24:
    v12 = v5;
    goto LABEL_25;
  }
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      objc_msgSend(v6, "rankedGroups");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v6, "rankedGroups");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_12);
        v9 = objc_claimAutoreleasedReturnValue();
        rankedGroups = v5->_rankedGroups;
        v5->_rankedGroups = (NSArray *)v9;

      }
      else
      {
        v8 = v5->_rankedGroups;
        v5->_rankedGroups = (NSArray *)MEMORY[0x1E0C9AA60];
      }

      objc_msgSend(v6, "timestamp");
      v5->_creationTimestamp = v13;
      v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v6, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "initWithUUIDString:", v15);
      uuid = v5->_uuid;
      v5->_uuid = (NSUUID *)v16;

      objc_msgSend(v6, "rankerId");
      v18 = objc_claimAutoreleasedReturnValue();
      rankerId = v5->_rankerId;
      v5->_rankerId = (NSString *)v18;

      objc_msgSend(v6, "modeId");
      v20 = objc_claimAutoreleasedReturnValue();
      modeIdString = v5->_modeIdString;
      v5->_modeIdString = (NSString *)v20;

      objc_msgSend(v6, "sharedEngagementTracker");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v6, "sharedEngagementTracker");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v25 = [ATXSharedDigestEngagementTrackingMetrics alloc];
          objc_msgSend(v6, "sharedEngagementTracker");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = -[ATXSharedDigestEngagementTrackingMetrics initWithProto:](v25, "initWithProto:", v26);
          -[ATXMissedNotificationRanking setDigestEngagementTrackingMetrics:](v5, "setDigestEngagementTrackingMetrics:", v27);

        }
        else
        {
          __atxlog_handle_notification_management();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            -[ATXMissedNotificationRanking initWithProto:].cold.1();
        }

      }
      objc_msgSend(v6, "digestTimeline");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v6, "digestTimeline");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v30 = objc_opt_isKindOfClass();

        if ((v30 & 1) != 0)
        {
          v31 = [ATXDigestTimeline alloc];
          objc_msgSend(v6, "digestTimeline");
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = -[ATXDigestTimeline initWithProto:](v31, "initWithProto:", v32);
          -[ATXMissedNotificationRanking setDigestTimeline:](v5, "setDigestTimeline:", v33);

        }
        else
        {
          __atxlog_handle_notification_management();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            -[ATXMissedNotificationRanking initWithProto:].cold.1();
        }

      }
      goto LABEL_24;
    }
    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXMissedNotificationRanking initWithProto:].cold.1();

  }
  v12 = 0;
LABEL_25:

  return v12;
}

ATXUserNotificationDigestNotificationGroup *__46__ATXMissedNotificationRanking_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXUserNotificationDigestNotificationGroup *v3;

  v2 = a2;
  v3 = -[ATXUserNotificationDigestNotificationGroup initWithProto:]([ATXUserNotificationDigestNotificationGroup alloc], "initWithProto:", v2);

  return v3;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setTimestamp:", self->_creationTimestamp);
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuid:", v4);

  objc_msgSend(v3, "setRankerId:", self->_rankerId);
  objc_msgSend(v3, "setModeId:", self->_modeIdString);
  -[ATXMissedNotificationRanking digestEngagementTrackingMetrics](self, "digestEngagementTrackingMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharedEngagementTracker:", v6);

  -[ATXMissedNotificationRanking digestTimeline](self, "digestTimeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "proto");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDigestTimeline:", v8);

  -[NSArray _pas_mappedArrayWithTransform:](self->_rankedGroups, "_pas_mappedArrayWithTransform:", &__block_literal_global_22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v3, "setRankedGroups:", v10);

  if (v9 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(v3, "rankedGroups");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v9);

  }
  return v3;
}

uint64_t __37__ATXMissedNotificationRanking_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXMissedNotificationRanking encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXMissedNotificationRanking)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXMissedNotificationRanking *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[ATXMissedNotificationRanking initWithProtoData:](self, "initWithProtoData:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
    +[_ATXNotificationGroupBaseRanker rankerId](_ATXNotificationGroupBaseRanker, "rankerId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRankerId:", v8);

  }
  else if (a4 == 2)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXMissedNotificationRanking jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (NSArray)rankedGroups
{
  return self->_rankedGroups;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)rankerId
{
  return self->_rankerId;
}

- (void)setRankerId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)modeIdString
{
  return self->_modeIdString;
}

- (void)setModeIdString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ATXSharedDigestEngagementTrackingMetrics)digestEngagementTrackingMetrics
{
  return self->_digestEngagementTrackingMetrics;
}

- (void)setDigestEngagementTrackingMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (ATXDigestTimeline)digestTimeline
{
  return self->_digestTimeline;
}

- (void)setDigestTimeline:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (ATXMissedNotificationRankingBiomeStream)loggingStream
{
  return self->_loggingStream;
}

- (void)setLoggingStream:(id)a3
{
  objc_storeStrong((id *)&self->_loggingStream, a3);
}

- (BOOL)hasLoggedCollapsed
{
  return self->_hasLoggedCollapsed;
}

- (void)setHasLoggedCollapsed:(BOOL)a3
{
  self->_hasLoggedCollapsed = a3;
}

- (BOOL)hasLoggedExpanded
{
  return self->_hasLoggedExpanded;
}

- (void)setHasLoggedExpanded:(BOOL)a3
{
  self->_hasLoggedExpanded = a3;
}

- (BOOL)hasLoggedUpcomingExpanded
{
  return self->_hasLoggedUpcomingExpanded;
}

- (void)setHasLoggedUpcomingExpanded:(BOOL)a3
{
  self->_hasLoggedUpcomingExpanded = a3;
}

- (BOOL)hasLoggedDeliveredExpanded
{
  return self->_hasLoggedDeliveredExpanded;
}

- (void)setHasLoggedDeliveredExpanded:(BOOL)a3
{
  self->_hasLoggedDeliveredExpanded = a3;
}

- (BOOL)hasLoggedUpcomingCollapsed
{
  return self->_hasLoggedUpcomingCollapsed;
}

- (void)setHasLoggedUpcomingCollapsed:(BOOL)a3
{
  self->_hasLoggedUpcomingCollapsed = a3;
}

- (BOOL)hasLoggedDeliveredCollapsed
{
  return self->_hasLoggedDeliveredCollapsed;
}

- (void)setHasLoggedDeliveredCollapsed:(BOOL)a3
{
  self->_hasLoggedDeliveredCollapsed = a3;
}

- (BOOL)hasLoggedRemoval
{
  return self->_hasLoggedRemoval;
}

- (void)setHasLoggedRemoval:(BOOL)a3
{
  self->_hasLoggedRemoval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingStream, 0);
  objc_storeStrong((id *)&self->_digestTimeline, 0);
  objc_storeStrong((id *)&self->_digestEngagementTrackingMetrics, 0);
  objc_storeStrong((id *)&self->_modeIdString, 0);
  objc_storeStrong((id *)&self->_rankerId, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_rankedGroups, 0);
}

- (void)initWithProto:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "Unable to construct class %@ from ProtoBuf object", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

@end
