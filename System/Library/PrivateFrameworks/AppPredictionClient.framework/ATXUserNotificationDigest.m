@implementation ATXUserNotificationDigest

- (ATXUserNotificationDigest)initWithMessageGroups:(id)a3 highlightedGroups:(id)a4 otherGroups:(id)a5 rankerId:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ATXUserNotificationDigest *v14;
  ATXUserNotificationDigest *v15;
  NSArray *appDigests;
  uint64_t v17;
  NSArray *messageGroups;
  uint64_t v19;
  NSArray *highlightedGroups;
  uint64_t v21;
  NSArray *rankedGroups;
  uint64_t v23;
  NSString *rankerId;
  uint64_t v25;
  NSUUID *uuid;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)ATXUserNotificationDigest;
  v14 = -[ATXUserNotificationDigest init](&v28, sel_init);
  v15 = v14;
  if (v14)
  {
    appDigests = v14->_appDigests;
    v14->_appDigests = (NSArray *)MEMORY[0x1E0C9AA60];

    v17 = objc_msgSend(v10, "copy");
    messageGroups = v15->_messageGroups;
    v15->_messageGroups = (NSArray *)v17;

    v19 = objc_msgSend(v11, "copy");
    highlightedGroups = v15->_highlightedGroups;
    v15->_highlightedGroups = (NSArray *)v19;

    v21 = objc_msgSend(v12, "copy");
    rankedGroups = v15->_rankedGroups;
    v15->_rankedGroups = (NSArray *)v21;

    v23 = objc_msgSend(v13, "copy");
    rankerId = v15->_rankerId;
    v15->_rankerId = (NSString *)v23;

    v15->_creationTimestamp = CFAbsoluteTimeGetCurrent();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v25 = objc_claimAutoreleasedReturnValue();
    uuid = v15->_uuid;
    v15->_uuid = (NSUUID *)v25;

  }
  return v15;
}

- (ATXUserNotificationDigest)initWithNotifications:(id)a3 modeId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ATXUserNotificationDigest *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = -[ATXUserNotificationDigest initWithNotifications:modeId:ranker:](self, "initWithNotifications:modeId:ranker:", v7, v6, v8);

  return v9;
}

- (ATXUserNotificationDigest)initWithNotifications:(id)a3 modeId:(id)a4 ranker:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ATXUserNotificationDigest *v11;

  v8 = a5;
  v9 = a4;
  +[ATXUserNotificationDigestNotificationGroup groupsFromNotifications:modeId:](ATXUserNotificationDigestNotificationGroup, "groupsFromNotifications:modeId:", a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ATXUserNotificationDigest initWithGroups:modeId:ranker:](self, "initWithGroups:modeId:ranker:", v10, v9, v8);

  return v11;
}

- (ATXUserNotificationDigest)initWithNotificationArrays:(id)a3 modeId:(id)a4 ranker:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ATXUserNotificationDigest *v12;
  _QWORD v14[4];
  id v15;

  v8 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__ATXUserNotificationDigest_initWithNotificationArrays_modeId_ranker___block_invoke;
  v14[3] = &unk_1E4D58080;
  v15 = v8;
  v9 = v8;
  v10 = a5;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ATXUserNotificationDigest initWithGroups:modeId:ranker:](self, "initWithGroups:modeId:ranker:", v11, v9, v10);

  return v12;
}

ATXUserNotificationDigestNotificationGroup *__70__ATXUserNotificationDigest_initWithNotificationArrays_modeId_ranker___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ATXUserNotificationDigestNotificationGroup *v4;

  v3 = a2;
  v4 = -[ATXUserNotificationDigestNotificationGroup initWithNotifications:modeId:]([ATXUserNotificationDigestNotificationGroup alloc], "initWithNotifications:modeId:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (ATXUserNotificationDigest)initWithGroups:(id)a3 modeId:(id)a4 ranker:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXUserNotificationDigest *v11;
  uint64_t v12;
  NSArray *messageGroups;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  NSArray *v20;
  NSArray *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  NSArray *v28;
  NSArray *highlightedGroups;
  NSArray *v30;
  NSArray *rankedGroups;
  NSArray *v32;
  NSArray *appDigests;
  uint64_t v34;
  NSUUID *uuid;
  uint64_t v36;
  NSString *rankerId;
  void *v39;
  id obj;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v47.receiver = self;
  v47.super_class = (Class)ATXUserNotificationDigest;
  v11 = -[ATXUserNotificationDigest init](&v47, sel_init);
  if (v11)
  {
    obj = a4;
    objc_msgSend(v8, "_pas_filteredArrayWithTest:", &__block_literal_global_26);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rankNotificationGroups:modeId:");
    v12 = objc_claimAutoreleasedReturnValue();
    messageGroups = v11->_messageGroups;
    v11->_messageGroups = (NSArray *)v12;

    v42 = v8;
    objc_msgSend(v8, "_pas_filteredArrayWithTest:", &__block_literal_global_23_0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v9;
    objc_msgSend(v10, "rankNotificationGroups:modeId:", v14, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "_pas_filteredArrayWithTest:", &__block_literal_global_24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    if (v17 >= 2)
      v18 = 2;
    else
      v18 = v17;
    objc_msgSend(v16, "subarrayWithRange:", 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (NSArray *)objc_msgSend(v19, "mutableCopy");

    v21 = (NSArray *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v22 = v15;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v44 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          if (!-[NSArray containsObject:](v20, "containsObject:", v27))
          {
            if (-[NSArray count](v20, "count") >= 2)
              v28 = v21;
            else
              v28 = v20;
            -[NSArray addObject:](v28, "addObject:", v27);
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v24);
    }

    highlightedGroups = v11->_highlightedGroups;
    v11->_highlightedGroups = v20;
    v30 = v20;

    rankedGroups = v11->_rankedGroups;
    v11->_rankedGroups = v21;
    v32 = v21;

    appDigests = v11->_appDigests;
    v11->_appDigests = (NSArray *)MEMORY[0x1E0C9AA60];

    v11->_creationTimestamp = CFAbsoluteTimeGetCurrent();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v34 = objc_claimAutoreleasedReturnValue();
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v34;

    objc_msgSend((id)objc_opt_class(), "rankerId");
    v36 = objc_claimAutoreleasedReturnValue();
    rankerId = v11->_rankerId;
    v11->_rankerId = (NSString *)v36;

    objc_storeStrong((id *)&v11->_modeIdString, obj);
    v9 = v41;
    v8 = v42;
  }

  return v11;
}

uint64_t __58__ATXUserNotificationDigest_initWithGroups_modeId_ranker___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCommunicationGroup");
}

uint64_t __58__ATXUserNotificationDigest_initWithGroups_modeId_ranker___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCommunicationGroup") ^ 1;
}

uint64_t __58__ATXUserNotificationDigest_initWithGroups_modeId_ranker___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPreviewableAttachment");
}

- (ATXUserNotificationDigest)initWithAppDigests:(id)a3 highlightedGroups:(id)a4 messageGroups:(id)a5 rankerId:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  ATXUserNotificationDigest *v18;
  uint64_t v19;
  NSArray *appDigests;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend((id)objc_opt_class(), "getFlattenedGroupsFromAppDigests:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __89__ATXUserNotificationDigest_initWithAppDigests_highlightedGroups_messageGroups_rankerId___block_invoke;
  v25 = &unk_1E4D59050;
  v15 = v11;
  v26 = v15;
  v16 = v12;
  v27 = v16;
  objc_msgSend(v14, "_pas_filteredArrayWithTest:", &v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ATXUserNotificationDigest initWithMessageGroups:highlightedGroups:otherGroups:rankerId:](self, "initWithMessageGroups:highlightedGroups:otherGroups:rankerId:", v16, v15, v17, v13, v22, v23, v24, v25);

  if (v18)
  {
    v19 = objc_msgSend(v10, "copy");
    appDigests = v18->_appDigests;
    v18->_appDigests = (NSArray *)v19;

  }
  return v18;
}

uint64_t __89__ATXUserNotificationDigest_initWithAppDigests_highlightedGroups_messageGroups_rankerId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3) ^ 1;

  return v4;
}

- (NSArray)globalMarqueeGroups
{
  return self->_highlightedGroups;
}

- (BOOL)doesDigestShareContentWithOtherDigest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ATXUserNotificationDigest allNotificationIds](self, "allNotificationIds");
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
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  NSObject *v21;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t v31;
  _BYTE v32[15];
  uint8_t v33;
  _BYTE v34[15];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _QWORD v49[3];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[ATXUserNotificationDigest messageGroups](self, "messageGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v4;
  -[ATXUserNotificationDigest highlightedGroups](self, "highlightedGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v5;
  -[ATXUserNotificationDigest rankedGroups](self, "rankedGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v44;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v44 != v24)
          objc_enumerationMutation(obj);
        v26 = v8;
        v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v8);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v27 = v9;
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v29)
        {
          v28 = *(_QWORD *)v40;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v40 != v28)
                objc_enumerationMutation(v27);
              v30 = v10;
              v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              v38 = 0u;
              objc_msgSend(v11, "rankedNotifications");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
              if (v13)
              {
                v14 = v13;
                v15 = *(_QWORD *)v36;
                do
                {
                  for (i = 0; i != v14; ++i)
                  {
                    if (*(_QWORD *)v36 != v15)
                      objc_enumerationMutation(v12);
                    v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
                    objc_msgSend(v17, "uuid");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v18)
                    {
                      objc_msgSend(v17, "uuid");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      isKindOfClass = objc_opt_isKindOfClass();

                      if ((isKindOfClass & 1) != 0)
                      {
                        objc_msgSend(v17, "uuid");
                        v21 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v3, "addObject:", v21);
                      }
                      else
                      {
                        __atxlog_handle_modes();
                        v21 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
                          -[ATXUserNotificationDigest allNotificationIds].cold.2(&v31, v32, v21);
                      }
                    }
                    else
                    {
                      __atxlog_handle_modes();
                      v21 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
                        -[ATXUserNotificationDigest allNotificationIds].cold.1(&v33, v34, v21);
                    }

                  }
                  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
                }
                while (v14);
              }

              v10 = v30 + 1;
            }
            while (v30 + 1 != v29);
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          }
          while (v29);
        }

        v8 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v25);
  }

  return v3;
}

+ (id)getFlattenedGroupsFromAppDigests:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "groups", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)viewFlattenedGroups
{
  void *v3;
  void *v4;

  if (-[NSArray count](self->_appDigests, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "getFlattenedGroupsFromAppDigests:", self->_appDigests);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSArray arrayByAddingObjectsFromArray:](self->_messageGroups, "arrayByAddingObjectsFromArray:", self->_highlightedGroups);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", self->_rankedGroups);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)logScheduledView
{
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[ATXUserNotificationDigest logScheduledViewWithTimestamp:](self, "logScheduledViewWithTimestamp:");
}

- (void)logCollapsedPreview
{
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[ATXUserNotificationDigest logCollapsedPreviewWithTimestamp:](self, "logCollapsedPreviewWithTimestamp:");
}

- (void)logUpcomingView
{
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[ATXUserNotificationDigest logScheduledViewWithTimestamp:](self, "logScheduledViewWithTimestamp:");
}

- (void)logScheduledViewWithTimestamp:(double)a3
{
  ATXUserNotificationDigestLoggingEvent *v4;
  ATXUserNotificationDigestBiomeStream *loggingStream;
  ATXUserNotificationDigestLoggingEvent *v6;

  if (!self->_hasLoggedScheduled)
  {
    self->_hasLoggedScheduled = 1;
    v4 = -[ATXUserNotificationDigestLoggingEvent initWithNotificationDigest:eventType:timestamp:]([ATXUserNotificationDigestLoggingEvent alloc], "initWithNotificationDigest:eventType:timestamp:", self, 0, a3);
    loggingStream = self->_loggingStream;
    if (loggingStream)
    {
      v6 = v4;
      -[ATXUserNotificationDigestBiomeStream sendEvent:](loggingStream, "sendEvent:", v4);
      v4 = v6;
    }

  }
}

- (void)logCollapsedPreviewWithTimestamp:(double)a3
{
  ATXUserNotificationDigestLoggingEvent *v4;
  ATXUserNotificationDigestBiomeStream *loggingStream;
  ATXUserNotificationDigestLoggingEvent *v6;

  if (!self->_hasLoggedCollapsed)
  {
    self->_hasLoggedCollapsed = 1;
    v4 = -[ATXUserNotificationDigestLoggingEvent initWithNotificationDigest:eventType:timestamp:]([ATXUserNotificationDigestLoggingEvent alloc], "initWithNotificationDigest:eventType:timestamp:", self, 1, a3);
    loggingStream = self->_loggingStream;
    if (loggingStream)
    {
      v6 = v4;
      -[ATXUserNotificationDigestBiomeStream sendEvent:](loggingStream, "sendEvent:", v4);
      v4 = v6;
    }

  }
}

- (void)logUpcomingViewWithTimestamp:(double)a3
{
  ATXUserNotificationDigestLoggingEvent *v4;
  ATXUserNotificationDigestBiomeStream *loggingStream;
  ATXUserNotificationDigestLoggingEvent *v6;

  if (!self->_hasLoggedUpcoming)
  {
    self->_hasLoggedUpcoming = 1;
    v4 = -[ATXUserNotificationDigestLoggingEvent initWithNotificationDigest:eventType:timestamp:]([ATXUserNotificationDigestLoggingEvent alloc], "initWithNotificationDigest:eventType:timestamp:", self, 2, a3);
    loggingStream = self->_loggingStream;
    if (loggingStream)
    {
      v6 = v4;
      -[ATXUserNotificationDigestBiomeStream sendEvent:](loggingStream, "sendEvent:", v4);
      v4 = v6;
    }

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXUserNotificationDigest *v4;
  void *v5;
  ATXUserNotificationDigest *v6;

  v4 = +[ATXUserNotificationDigest allocWithZone:](ATXUserNotificationDigest, "allocWithZone:", a3);
  -[ATXUserNotificationDigest proto](self, "proto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXUserNotificationDigest initWithProto:](v4, "initWithProto:", v5);

  return v6;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  id v5;
  ATXUserNotificationDigest *v6;

  v4 = a3;
  v5 = -[ATXPBUserNotificationDigest initFromJSON:]([ATXPBUserNotificationDigest alloc], "initFromJSON:", v4);

  v6 = -[ATXUserNotificationDigest initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;

  -[ATXUserNotificationDigest proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUserNotificationDigest)initWithProtoData:(id)a3
{
  id v4;
  ATXPBUserNotificationDigest *v5;
  ATXUserNotificationDigest *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBUserNotificationDigest initWithData:]([ATXPBUserNotificationDigest alloc], "initWithData:", v4);

    self = -[ATXUserNotificationDigest initWithProto:](self, "initWithProto:", v5);
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

  -[ATXUserNotificationDigest proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUserNotificationDigest)initWithProto:(id)a3
{
  id v4;
  ATXUserNotificationDigest *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *messageGroups;
  NSObject *v11;
  ATXUserNotificationDigest *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *highlightedGroups;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *rankedGroups;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *appDigests;
  double v25;
  id v26;
  void *v27;
  uint64_t v28;
  NSUUID *uuid;
  uint64_t v30;
  NSString *rankerId;
  uint64_t v32;
  NSString *modeIdString;
  void *v34;
  void *v35;
  char isKindOfClass;
  ATXSharedDigestEngagementTrackingMetrics *v37;
  NSObject *v38;
  ATXSharedDigestEngagementTrackingMetrics *v39;
  void *v40;
  void *v41;
  char v42;
  ATXDigestTimeline *v43;
  NSObject *v44;
  ATXDigestTimeline *v45;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)ATXUserNotificationDigest;
  v5 = -[ATXUserNotificationDigest init](&v47, sel_init);
  if (!v5)
  {
LABEL_33:
    v12 = v5;
    goto LABEL_34;
  }
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      objc_msgSend(v6, "messageGroups");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v6, "messageGroups");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_33);
        v9 = objc_claimAutoreleasedReturnValue();
        messageGroups = v5->_messageGroups;
        v5->_messageGroups = (NSArray *)v9;

      }
      else
      {
        v8 = v5->_messageGroups;
        v5->_messageGroups = (NSArray *)MEMORY[0x1E0C9AA60];
      }

      objc_msgSend(v6, "highlightedGroups");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v6, "highlightedGroups");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_34);
        v15 = objc_claimAutoreleasedReturnValue();
        highlightedGroups = v5->_highlightedGroups;
        v5->_highlightedGroups = (NSArray *)v15;

      }
      else
      {
        v14 = v5->_highlightedGroups;
        v5->_highlightedGroups = (NSArray *)MEMORY[0x1E0C9AA60];
      }

      objc_msgSend(v6, "rankedGroups");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v6, "rankedGroups");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_pas_mappedArrayWithTransform:", &__block_literal_global_35);
        v19 = objc_claimAutoreleasedReturnValue();
        rankedGroups = v5->_rankedGroups;
        v5->_rankedGroups = (NSArray *)v19;

      }
      else
      {
        v18 = v5->_rankedGroups;
        v5->_rankedGroups = (NSArray *)MEMORY[0x1E0C9AA60];
      }

      objc_msgSend(v6, "appDigests");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(v6, "appDigests");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_pas_mappedArrayWithTransform:", &__block_literal_global_37);
        v23 = objc_claimAutoreleasedReturnValue();
        appDigests = v5->_appDigests;
        v5->_appDigests = (NSArray *)v23;

      }
      else
      {
        v22 = v5->_appDigests;
        v5->_appDigests = (NSArray *)MEMORY[0x1E0C9AA60];
      }

      objc_msgSend(v6, "timestamp");
      v5->_creationTimestamp = v25;
      v26 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v6, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "initWithUUIDString:", v27);
      uuid = v5->_uuid;
      v5->_uuid = (NSUUID *)v28;

      objc_msgSend(v6, "rankerId");
      v30 = objc_claimAutoreleasedReturnValue();
      rankerId = v5->_rankerId;
      v5->_rankerId = (NSString *)v30;

      objc_msgSend(v6, "modeId");
      v32 = objc_claimAutoreleasedReturnValue();
      modeIdString = v5->_modeIdString;
      v5->_modeIdString = (NSString *)v32;

      objc_msgSend(v6, "sharedEngagementTracker");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v6, "sharedEngagementTracker");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v37 = [ATXSharedDigestEngagementTrackingMetrics alloc];
          objc_msgSend(v6, "sharedEngagementTracker");
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = -[ATXSharedDigestEngagementTrackingMetrics initWithProto:](v37, "initWithProto:", v38);
          -[ATXUserNotificationDigest setDigestEngagementTrackingMetrics:](v5, "setDigestEngagementTrackingMetrics:", v39);

        }
        else
        {
          __atxlog_handle_notification_management();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
            -[ATXMissedNotificationRanking initWithProto:].cold.1();
        }

      }
      objc_msgSend(v6, "digestTimeline");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        objc_msgSend(v6, "digestTimeline");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v42 = objc_opt_isKindOfClass();

        if ((v42 & 1) != 0)
        {
          v43 = [ATXDigestTimeline alloc];
          objc_msgSend(v6, "digestTimeline");
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = -[ATXDigestTimeline initWithProto:](v43, "initWithProto:", v44);
          -[ATXUserNotificationDigest setDigestTimeline:](v5, "setDigestTimeline:", v45);

        }
        else
        {
          __atxlog_handle_notification_management();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
            -[ATXMissedNotificationRanking initWithProto:].cold.1();
        }

      }
      goto LABEL_33;
    }
    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXMissedNotificationRanking initWithProto:].cold.1();

  }
  v12 = 0;
LABEL_34:

  return v12;
}

ATXUserNotificationDigestNotificationGroup *__43__ATXUserNotificationDigest_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXUserNotificationDigestNotificationGroup *v3;

  v2 = a2;
  v3 = -[ATXUserNotificationDigestNotificationGroup initWithProto:]([ATXUserNotificationDigestNotificationGroup alloc], "initWithProto:", v2);

  return v3;
}

ATXUserNotificationDigestNotificationGroup *__43__ATXUserNotificationDigest_initWithProto___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  ATXUserNotificationDigestNotificationGroup *v3;

  v2 = a2;
  v3 = -[ATXUserNotificationDigestNotificationGroup initWithProto:]([ATXUserNotificationDigestNotificationGroup alloc], "initWithProto:", v2);

  return v3;
}

ATXUserNotificationDigestNotificationGroup *__43__ATXUserNotificationDigest_initWithProto___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  ATXUserNotificationDigestNotificationGroup *v3;

  v2 = a2;
  v3 = -[ATXUserNotificationDigestNotificationGroup initWithProto:]([ATXUserNotificationDigestNotificationGroup alloc], "initWithProto:", v2);

  return v3;
}

ATXUserNotificationAppDigest *__43__ATXUserNotificationDigest_initWithProto___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  ATXUserNotificationAppDigest *v3;

  v2 = a2;
  v3 = -[ATXUserNotificationAppDigest initWithProto:]([ATXUserNotificationAppDigest alloc], "initWithProto:", v2);

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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setTimestamp:", self->_creationTimestamp);
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuid:", v4);

  objc_msgSend(v3, "setRankerId:", self->_rankerId);
  objc_msgSend(v3, "setModeId:", self->_modeIdString);
  -[ATXUserNotificationDigest digestEngagementTrackingMetrics](self, "digestEngagementTrackingMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharedEngagementTracker:", v6);

  -[ATXUserNotificationDigest digestTimeline](self, "digestTimeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "proto");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDigestTimeline:", v8);

  -[NSArray _pas_mappedArrayWithTransform:](self->_messageGroups, "_pas_mappedArrayWithTransform:", &__block_literal_global_44_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v3, "setMessageGroups:", v10);

  if (v9 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(v3, "messageGroups");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v9);

  }
  -[NSArray _pas_mappedArrayWithTransform:](self->_highlightedGroups, "_pas_mappedArrayWithTransform:", &__block_literal_global_45);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v3, "setHighlightedGroups:", v13);

  if (v12 && objc_msgSend(v12, "count"))
  {
    objc_msgSend(v3, "highlightedGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v12);

  }
  -[NSArray _pas_mappedArrayWithTransform:](self->_rankedGroups, "_pas_mappedArrayWithTransform:", &__block_literal_global_46);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  objc_msgSend(v3, "setRankedGroups:", v16);

  if (v15 && objc_msgSend(v15, "count"))
  {
    objc_msgSend(v3, "rankedGroups");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v15);

  }
  -[NSArray _pas_mappedArrayWithTransform:](self->_appDigests, "_pas_mappedArrayWithTransform:", &__block_literal_global_48);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend(v3, "setAppDigests:", v19);

  return v3;
}

uint64_t __34__ATXUserNotificationDigest_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

uint64_t __34__ATXUserNotificationDigest_proto__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

uint64_t __34__ATXUserNotificationDigest_proto__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

uint64_t __34__ATXUserNotificationDigest_proto__block_invoke_4(uint64_t a1, void *a2)
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
  -[ATXUserNotificationDigest encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXUserNotificationDigest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXUserNotificationDigest *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[ATXUserNotificationDigest initWithProtoData:](self, "initWithProtoData:", v5);
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
  -[ATXUserNotificationDigest jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSArray)messageGroups
{
  return self->_messageGroups;
}

- (NSArray)highlightedGroups
{
  return self->_highlightedGroups;
}

- (NSArray)rankedGroups
{
  return self->_rankedGroups;
}

- (NSArray)appDigests
{
  return self->_appDigests;
}

- (ATXSharedDigestEngagementTrackingMetrics)digestEngagementTrackingMetrics
{
  return self->_digestEngagementTrackingMetrics;
}

- (void)setDigestEngagementTrackingMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (ATXDigestTimeline)digestTimeline
{
  return self->_digestTimeline;
}

- (void)setDigestTimeline:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)rankerId
{
  return self->_rankerId;
}

- (void)setRankerId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)modeIdString
{
  return self->_modeIdString;
}

- (ATXUserNotificationDigestBiomeStream)loggingStream
{
  return self->_loggingStream;
}

- (void)setLoggingStream:(id)a3
{
  objc_storeStrong((id *)&self->_loggingStream, a3);
}

- (BOOL)hasLoggedUpcoming
{
  return self->_hasLoggedUpcoming;
}

- (BOOL)hasLoggedCollapsed
{
  return self->_hasLoggedCollapsed;
}

- (BOOL)hasLoggedScheduled
{
  return self->_hasLoggedScheduled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingStream, 0);
  objc_storeStrong((id *)&self->_modeIdString, 0);
  objc_storeStrong((id *)&self->_rankerId, 0);
  objc_storeStrong((id *)&self->_digestTimeline, 0);
  objc_storeStrong((id *)&self->_digestEngagementTrackingMetrics, 0);
  objc_storeStrong((id *)&self->_appDigests, 0);
  objc_storeStrong((id *)&self->_rankedGroups, 0);
  objc_storeStrong((id *)&self->_highlightedGroups, 0);
  objc_storeStrong((id *)&self->_messageGroups, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)allNotificationIds
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_2_8(&dword_1A49EF000, (int)a2, a3, "User notification does not have a UUID of correct type", a1);
}

@end
