@implementation ATXActionNotificationServer

+ (ATXActionNotificationServer)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1)
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_216);
  return (ATXActionNotificationServer *)(id)sharedInstance__sharedInstance;
}

void __45__ATXActionNotificationServer_sharedInstance__block_invoke()
{
  ATXActionNotificationServer *v0;
  void *v1;

  v0 = objc_alloc_init(ATXActionNotificationServer);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

+ (id)_requestIdentifierForBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@|%@"), v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)bundleIdFromRequestIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("|"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)localizedContentBodyStringWithString:(id)a3 forAction:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "routeInfo");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v6, "routeInfo"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isExternalRoute"),
        v9,
        v8,
        v10))
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("AirPlay to %@"), &stru_1E82FDC98, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "routeInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deviceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v11, "initWithFormat:", v13, v15);

    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", v5, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@\n%@"), v17, v16);

    }
    else
    {
      v18 = v16;
    }

  }
  else
  {
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", v5, 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = v5;
    }
    v18 = v19;
  }

  return v18;
}

- (ATXActionNotificationServer)init
{
  ATXActionNotificationServer *v2;
  uint64_t v3;
  UNUserNotificationCenter *notificationCenter;
  UNUserNotificationCenter *v5;
  ATXActionNotificationServer *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v8;
  __CFNotificationCenter *v9;
  __CFNotificationCenter *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  PETScalarEventTracker *removeTracker;
  uint64_t v15;
  PETScalarEventTracker *notifyInitTracker;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  PETScalarEventTracker *notifyErrorTracker;
  uint64_t v22;
  PETScalarEventTracker *notifySuccessTracker;
  uint64_t v24;
  ATXEngagementRecordManager *engagementRecordManager;
  _QWORD v27[4];
  ATXActionNotificationServer *v28;
  objc_super v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)ATXActionNotificationServer;
  v2 = -[ATXActionNotificationServer init](&v29, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.Siri.ActionPredictionNotifications"));
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v3;

    -[UNUserNotificationCenter setDelegate:](v2->_notificationCenter, "setDelegate:", v2);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v2->_notificationCenter, "setWantsNotificationResponsesDelivered");
    v5 = v2->_notificationCenter;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __35__ATXActionNotificationServer_init__block_invoke;
    v27[3] = &unk_1E82E97B0;
    v6 = v2;
    v28 = v6;
    -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:](v5, "requestAuthorizationWithOptions:completionHandler:", 4, v27);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)onPostTestNotifReceive, CFSTR("com.apple.Siri.TestActionNotification"), 0, CFNotificationSuspensionBehaviorDrop);
    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v8, v6, (CFNotificationCallback)onPostTestNotifReceiveNoPrediction, CFSTR("com.apple.Siri.TestActionNotificationNoPrediction"), 0, CFNotificationSuspensionBehaviorDrop);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v6, (CFNotificationCallback)onPostTestNotifReceiveManyPredictions, CFSTR("com.apple.Siri.TestActionNotificationManyPredictions"), 0, CFNotificationSuspensionBehaviorDrop);
    v10 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v10, v6, (CFNotificationCallback)onPostTestNotifRemoveAll, CFSTR("com.apple.Siri.TestActionNotificationRemoveAll"), 0, CFNotificationSuspensionBehaviorDrop);
    v11 = objc_alloc(MEMORY[0x1E0D80F38]);
    v12 = MEMORY[0x1E0C9AA60];
    v13 = objc_msgSend(v11, "initWithFeatureId:event:registerProperties:", CFSTR("ActionPredictions"), CFSTR("remove_notif"), MEMORY[0x1E0C9AA60]);
    removeTracker = v6->_removeTracker;
    v6->_removeTracker = (PETScalarEventTracker *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("ActionPredictions"), CFSTR("post_notif_init"), v12);
    notifyInitTracker = v6->_notifyInitTracker;
    v6->_notifyInitTracker = (PETScalarEventTracker *)v15;

    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("reason"), &unk_1E83D0658);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0D80F38]);
    v30[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithFeatureId:event:registerProperties:", CFSTR("ActionPredictions"), CFSTR("post_notif_error"), v19);
    notifyErrorTracker = v6->_notifyErrorTracker;
    v6->_notifyErrorTracker = (PETScalarEventTracker *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("ActionPredictions"), CFSTR("post_notif_success"), v12);
    notifySuccessTracker = v6->_notifySuccessTracker;
    v6->_notifySuccessTracker = (PETScalarEventTracker *)v22;

    objc_msgSend(MEMORY[0x1E0CF8DF8], "sharedInstance");
    v24 = objc_claimAutoreleasedReturnValue();
    engagementRecordManager = v6->_engagementRecordManager;
    v6->_engagementRecordManager = (ATXEngagementRecordManager *)v24;

  }
  return v2;
}

void __35__ATXActionNotificationServer_init__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  __atxlog_handle_notifications();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_INFO, "Notification Center access granted!", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_setupNotifications");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __35__ATXActionNotificationServer_init__block_invoke_cold_1();

  }
}

- (void)_setupNotifications
{
  UNUserNotificationCenter *notificationCenter;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC6D0]), "initWithIdentifier:", CFSTR("suggestedShortcut"));
  objc_msgSend(v5, "setBackgroundStyle:", 1);
  objc_msgSend(v5, "setHiddenPreviewsBodyPlaceholder:", CFSTR(" "));
  objc_msgSend(v5, "setListPriority:", 2);
  objc_msgSend(v5, "setOptions:", 131073);
  notificationCenter = self->_notificationCenter;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v5, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter setNotificationCategories:](notificationCenter, "setNotificationCategories:", v4);

}

- (void)_postTestNotification
{
  -[ATXActionNotificationServer _postTestNotificationWithPredictionCount:](self, "_postTestNotificationWithPredictionCount:", 1);
}

- (void)_postTestNotificationWithPredictionCount:(int64_t)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  int64_t v31;
  id obj;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  int64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_notifications();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v45 = a3;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "Posting %ld test notification(s)", buf, 0xCu);
  }

  if (a3 >= 1)
  {
    buf[0] = 0;
    if (CFPreferencesGetAppBooleanValue(CFSTR("displayLastDonationOnCoverSheet"), (CFStringRef)*MEMORY[0x1E0CF9510], buf))
    {
      objc_msgSend(MEMORY[0x1E0CF8C50], "actionResponseForDeveloperMode");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scoredActions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(v6, "proactiveSuggestions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v31 = a3;
          v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v6, "proactiveSuggestions");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          objc_msgSend(v6, "proactiveSuggestions");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v39;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v39 != v13)
                  objc_enumerationMutation(obj);
                v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                v16 = objc_alloc(MEMORY[0x1E0CF9090]);
                objc_msgSend(v15, "atxActionExecutableObject");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "scoreSpecification");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "rawScore");
                *(float *)&v19 = v19;
                v20 = (void *)objc_msgSend(v16, "initWithPredictedItem:score:", v17, v19);

                if (v20)
                  objc_msgSend(v33, "addObject:", v20);

              }
              v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
            }
            while (v12);
          }

          v7 = (void *)objc_msgSend(v33, "copy");
          a3 = v31;
        }
        else
        {
          v7 = 0;
        }
      }
      v24 = objc_msgSend(v7, "count");
      if (v24 >= a3)
        v25 = a3;
      else
        v25 = v24;
      objc_msgSend(v7, "subarrayWithRange:", 0, v25);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CF8C38]);
      objc_msgSend(v6, "actionPredictionsForConsumerSubType:limit:", 21, a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v23 = 0;
        goto LABEL_34;
      }
      v7 = v21;
      objc_msgSend(v21, "scoredActions");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v22;

    if (!objc_msgSend(v23, "count"))
    {
LABEL_35:

      return;
    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = v23;
    v26 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v35 != v28)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "predictedItem");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXActionNotificationServer postDemoOrDebugNotificationForATXAction:](self, "postDemoOrDebugNotificationForATXAction:", v30);

        }
        v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v27);
    }
    v23 = v6;
LABEL_34:

    goto LABEL_35;
  }
}

- (void)postNotificationForATXAction:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PETScalarEventTracker trackEventWithPropertyValues:](self->_notifyInitTracker, "trackEventWithPropertyValues:", MEMORY[0x1E0C9AA60]);
  if (-[ATXActionNotificationServer hasLockscreenPrediction](self, "hasLockscreenPrediction"))
  {
    __atxlog_handle_notifications();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Trying to predict action %@", (uint8_t *)&v7, 0xCu);
    }

    __atxlog_handle_notifications();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXActionNotificationServer postNotificationForATXAction:].cold.1();

    -[ATXActionNotificationServer removeAllActionPredictionNotificationsAndTrackEvent:recordFeedback:](self, "removeAllActionPredictionNotificationsAndTrackEvent:recordFeedback:", 0, 0);
  }
  -[ATXActionNotificationServer postDemoOrDebugNotificationForATXAction:](self, "postDemoOrDebugNotificationForATXAction:", v4);

}

- (void)postDemoOrDebugNotificationForATXAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D81198];
  v5 = a3;
  objc_msgSend(v4, "clientModelIdFromClientModelType:", 25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:", v6, CFSTR("1.0"));
  v8 = objc_alloc(MEMORY[0x1E0CF9090]);
  LODWORD(v9) = 1.0;
  v10 = (void *)objc_msgSend(v8, "initWithPredictedItem:score:", v5, v9);

  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestionBuilder proactiveSuggestionsForLockscreenActions:clientModelSpec:](ATXProactiveSuggestionBuilder, "proactiveSuggestionsForLockscreenActions:clientModelSpec:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXActionNotificationServer _postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:](self, "_postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:", v13, 0);
}

- (unint64_t)deliveredNotificationCount
{
  dispatch_semaphore_t v3;
  uint64_t v4;
  UNUserNotificationCenter *notificationCenter;
  NSObject *v6;
  unint64_t v7;
  _QWORD v9[5];
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = MEMORY[0x1E0C809B0];
  notificationCenter = self->_notificationCenter;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__ATXActionNotificationServer_deliveredNotificationCount__block_invoke;
  v10[3] = &unk_1E82E97D8;
  v12 = &v13;
  v6 = v3;
  v11 = v6;
  -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](notificationCenter, "getDeliveredNotificationsWithCompletionHandler:", v10);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __57__ATXActionNotificationServer_deliveredNotificationCount__block_invoke_2;
  v9[3] = &unk_1E82DA7D8;
  v9[4] = &v13;
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v6, &__block_literal_global_129_0, v9, 1.0);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __57__ATXActionNotificationServer_deliveredNotificationCount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "count");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        __atxlog_handle_notifications();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "request");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "request");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "content");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v21 = v12;
          v22 = 2112;
          v23 = v14;
          _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "Notification with id: %@, content: %@", buf, 0x16u);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v6);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v15 + 32));
}

void __57__ATXActionNotificationServer_deliveredNotificationCount__block_invoke_2(uint64_t a1)
{
  NSObject *v1;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  __atxlog_handle_notifications();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __57__ATXActionNotificationServer_deliveredNotificationCount__block_invoke_2_cold_1();

}

- (id)proactiveSuggestionsCurrentlyOnLockscreen
{
  dispatch_semaphore_t v3;
  UNUserNotificationCenter *notificationCenter;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__96;
  v15 = __Block_byref_object_dispose__96;
  v16 = (id)objc_opt_new();
  v3 = dispatch_semaphore_create(0);
  notificationCenter = self->_notificationCenter;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__ATXActionNotificationServer_proactiveSuggestionsCurrentlyOnLockscreen__block_invoke;
  v8[3] = &unk_1E82E9820;
  v8[4] = self;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](notificationCenter, "getDeliveredNotificationsWithCompletionHandler:", v8);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v5, &__block_literal_global_130_0, &__block_literal_global_131_0, 1.0);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __72__ATXActionNotificationServer_proactiveSuggestionsCurrentlyOnLockscreen__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "_unarchiveProactiveSuggestionFromNotification:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __72__ATXActionNotificationServer_proactiveSuggestionsCurrentlyOnLockscreen__block_invoke_3()
{
  NSObject *v0;

  __atxlog_handle_notifications();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __72__ATXActionNotificationServer_proactiveSuggestionsCurrentlyOnLockscreen__block_invoke_3_cold_1();

}

- (BOOL)hasLockscreenPrediction
{
  return -[ATXActionNotificationServer deliveredNotificationCount](self, "deliveredNotificationCount") != 0;
}

- (void)postNotificationForProactiveSuggestion:(id)a3 blendingCacheUpdateUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PETScalarEventTracker trackEventWithPropertyValues:](self->_notifyInitTracker, "trackEventWithPropertyValues:", MEMORY[0x1E0C9AA60]);
  if (-[ATXActionNotificationServer hasLockscreenPrediction](self, "hasLockscreenPrediction"))
  {
    __atxlog_handle_notifications();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Trying to predict suggestion %@", (uint8_t *)&v10, 0xCu);
    }

    __atxlog_handle_notifications();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXActionNotificationServer postNotificationForATXAction:].cold.1();

    -[ATXActionNotificationServer removeAllActionPredictionNotificationsAndTrackEvent:recordFeedback:](self, "removeAllActionPredictionNotificationsAndTrackEvent:recordFeedback:", 0, 0);
  }
  -[ATXActionNotificationServer _postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:](self, "_postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:", v6, v7);

}

- (void)_postNotificationForProactiveSuggestion:(id)a3 blendingCacheUpdateUUID:(id)a4
{
  __CFString *v6;
  NSObject *v7;
  objc_class *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  char *v27;
  __CFString *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  char *v46;
  UNUserNotificationCenter *notificationCenter;
  const __CFString *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  char *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  __CFString *v61;
  id v62;
  id v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  __CFString *v69;
  _QWORD v70[3];
  _QWORD v71[5];

  v71[3] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v58 = a4;
  __atxlog_handle_blending();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v65 = v9;
    v66 = 2112;
    v67 = v6;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%@ - attempting to post notification for suggestion: %@", buf, 0x16u);

  }
  -[__CFString atxActionExecutableObject](v6, "atxActionExecutableObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "actionTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "actionSubtitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "_bundleIdForDisplay");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if (objc_msgSend(v57, "length") || objc_msgSend(v56, "length"))
      {
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.mobilenotes"))
          && (objc_msgSend(v11, "isHeuristic") & 1) == 0)
        {

          v56 = 0;
        }
        -[__CFString encodeAsProto](v6, "encodeAsProto");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "actionKey");
        v54 = (char *)objc_claimAutoreleasedReturnValue();
        if (v55 && v54)
        {
          v70[0] = CFSTR("actionKey");
          v70[1] = CFSTR("proactiveSuggestion");
          v71[0] = v54;
          v71[1] = v55;
          v70[2] = CFSTR("blendingCacheUpdateUUID");
          objc_msgSend(v58, "UUIDString");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          v19 = &stru_1E82FDC98;
          if (v17)
            v19 = (const __CFString *)v17;
          v71[2] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 3);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CEC6E0]);
          -[__CFString setShouldSuppressScreenLightUp:](v20, "setShouldSuppressScreenLightUp:", 1);
          -[__CFString setUserInfo:](v20, "setUserInfo:", v52);
          -[__CFString setShouldHideDate:](v20, "setShouldHideDate:", 1);
          -[__CFString setSound:](v20, "setSound:", 0);
          -[__CFString setShouldAuthenticateDefaultAction:](v20, "setShouldAuthenticateDefaultAction:", 1);
          if (objc_msgSend(v16, "length"))
          {
            objc_msgSend(v11, "bundleId");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "userActivityWebpageURL");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            ATXBundleIdReplacementForBundleIdWithWebpageURLHint();
            v23 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v23;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", v57, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString setTitle:](v20, "setTitle:", v24);

          +[ATXActionNotificationServer localizedContentBodyStringWithString:forAction:](ATXActionNotificationServer, "localizedContentBodyStringWithString:forAction:", v56, v11);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString setBody:](v20, "setBody:", v25);

          __atxlog_handle_notifications();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            -[__CFString title](v20, "title");
            v27 = (char *)objc_claimAutoreleasedReturnValue();
            -[__CFString body](v20, "body");
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v65 = v27;
            v66 = 2112;
            v67 = v28;
            _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "UNMutableNotificationContent content title: %@, body: %@", buf, 0x16u);

          }
          objc_msgSend(v11, "intent");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "_className");
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v53, "isEqualToString:", CFSTR("DNDToggleDoNotDisturbIntent")))
          {
            objc_msgSend(MEMORY[0x1E0CEC738], "iconNamed:", CFSTR("dnd-notif-icon"));
            v49 = objc_claimAutoreleasedReturnValue();
            -[__CFString setIcon:](v20, "setIcon:", v49, v49);
          }
          else
          {
            if (objc_msgSend(v53, "isEqualToString:", CFSTR("WFSetAirplaneModeIntent")))
              objc_msgSend(MEMORY[0x1E0CEC738], "iconNamed:", CFSTR("airplane-notif-icon"));
            else
              objc_msgSend(MEMORY[0x1E0CEC738], "iconForApplicationIdentifier:", v16);
            v51 = objc_claimAutoreleasedReturnValue();
            -[__CFString setIcon:](v20, "setIcon:", v51, v51);
          }
          -[ATXActionNotificationServer _localizedStringForKey:defaultValue:languageCode:](self, "_localizedStringForKey:defaultValue:languageCode:", CFSTR("ATXNotificationFooter"), CFSTR("ATXNotificationFooter"), 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString setFooter:](v20, "setFooter:", v34);

          objc_msgSend(v11, "intent");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "atx_supportsBackgroundExecution");

          if (v36
            && ((objc_msgSend(MEMORY[0x1E0D81588], "isAudioAccessory") & 1) != 0
             || !objc_msgSend(v11, "isTVWhiteListedLongFormMedia")))
          {
            -[__CFString setShouldBackgroundDefaultAction:](v20, "setShouldBackgroundDefaultAction:", 1);
            -[__CFString setShouldPreventNotificationDismissalAfterDefaultAction:](v20, "setShouldPreventNotificationDismissalAfterDefaultAction:", 1);
          }
          else
          {
            -[__CFString setShouldBackgroundDefaultAction:](v20, "setShouldBackgroundDefaultAction:", 1);
          }
          -[__CFString setCategoryIdentifier:](v20, "setCategoryIdentifier:", CFSTR("suggestedShortcut"));
          __atxlog_handle_notifications();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v65 = "-[ATXActionNotificationServer _postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:]";
            v66 = 2112;
            v67 = v20;
            _os_log_impl(&dword_1C9A3B000, v37, OS_LOG_TYPE_DEFAULT, "%{public}s posting content: %@", buf, 0x16u);
          }

          objc_msgSend(v11, "intent");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "_intents_bundleIdForDisplay");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39;
          if (v39)
          {
            v41 = v39;
          }
          else
          {
            objc_msgSend(v11, "bundleId");
            v41 = (id)objc_claimAutoreleasedReturnValue();
          }
          v42 = v41;

          objc_msgSend((id)objc_opt_class(), "_requestIdentifierForBundleId:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:destinations:", v43, v20, 0, 6);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          __atxlog_handle_notifications();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v44, "identifier");
            v46 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v65 = v46;
            _os_log_impl(&dword_1C9A3B000, v45, OS_LOG_TYPE_DEFAULT, "posting notification req id: %@", buf, 0xCu);

          }
          objc_initWeak((id *)buf, self);
          notificationCenter = self->_notificationCenter;
          v59[0] = MEMORY[0x1E0C809B0];
          v59[1] = 3221225472;
          v59[2] = __95__ATXActionNotificationServer__postNotificationForProactiveSuggestion_blendingCacheUpdateUUID___block_invoke;
          v59[3] = &unk_1E82E9888;
          objc_copyWeak(&v63, (id *)buf);
          v60 = v11;
          v61 = v6;
          v62 = v58;
          -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](notificationCenter, "addNotificationRequest:withCompletionHandler:", v44, v59);

          objc_destroyWeak(&v63);
          objc_destroyWeak((id *)buf);

        }
        else
        {
          __atxlog_handle_ui();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          {
            v48 = CFSTR("nil");
            *(_DWORD *)buf = 138412802;
            v65 = v54;
            v66 = 2112;
            if (v55)
              v48 = CFSTR("not nil");
            v67 = v48;
            v68 = 2112;
            v69 = v6;
            _os_log_fault_impl(&dword_1C9A3B000, v32, OS_LOG_TYPE_FAULT, "not posting notification for actionKey: %@, proactiveSuggestionData: %@, suggestion: %@", buf, 0x20u);
          }

          -[PETScalarEventTracker trackEventWithPropertyValues:](self->_notifyErrorTracker, "trackEventWithPropertyValues:", &unk_1E83D06B8);
        }

      }
      else
      {
        __atxlog_handle_notifications();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[ATXActionNotificationServer _postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:].cold.3();

        -[PETScalarEventTracker trackEventWithPropertyValues:](self->_notifyErrorTracker, "trackEventWithPropertyValues:", &unk_1E83D06A0);
      }
    }
    else
    {
      __atxlog_handle_notifications();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[ATXActionNotificationServer _postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:].cold.2();

      -[PETScalarEventTracker trackEventWithPropertyValues:](self->_notifyErrorTracker, "trackEventWithPropertyValues:", &unk_1E83D0688);
    }

  }
  else
  {
    __atxlog_handle_notifications();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[ATXActionNotificationServer _postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:].cold.1();

    -[PETScalarEventTracker trackEventWithPropertyValues:](self->_notifyErrorTracker, "trackEventWithPropertyValues:", &unk_1E83D0670);
  }

}

void __95__ATXActionNotificationServer__postNotificationForProactiveSuggestion_blendingCacheUpdateUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  __atxlog_handle_notifications();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __95__ATXActionNotificationServer__postNotificationForProactiveSuggestion_blendingCacheUpdateUUID___block_invoke_cold_1();

    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "actionKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      v26 = 2112;
      v27 = v3;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%@ - failed to post notification with actionKey: %@, error: %@, suggestion: %@", buf, 0x2Au);

    }
    if (WeakRetained)
      objc_msgSend(WeakRetained[5], "trackEventWithPropertyValues:", &unk_1E83D06D0);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "notif success", buf, 2u);
    }

    __atxlog_handle_blending();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "actionKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "%@ - posted notification with actionKey: %@, suggestion: %@", buf, 0x20u);

    }
    if (WeakRetained)
      objc_msgSend(WeakRetained[6], "trackEventWithPropertyValues:", MEMORY[0x1E0C9AA60]);
    v17 = (void *)objc_opt_new();
    v18 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sendLockscreenEventToBiomeWithDate:eventType:blendingCacheId:suggestionIds:", v17, 1, v18, v20);

  }
}

- (void)removeActionPredictionNotificationsMatchingAction:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  UNUserNotificationCenter *notificationCenter;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  NSObject *v12;
  id v13;
  id location;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  notificationCenter = self->_notificationCenter;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__ATXActionNotificationServer_removeActionPredictionNotificationsMatchingAction___block_invoke;
  v10[3] = &unk_1E82E98B0;
  objc_copyWeak(&v13, &location);
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v8 = v5;
  v12 = v8;
  -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](notificationCenter, "getDeliveredNotificationsWithCompletionHandler:", v10);
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v8, 2.0) == 1)
  {
    __atxlog_handle_notifications();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXActionNotificationServer removeActionPredictionNotificationsMatchingAction:].cold.1();

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __81__ATXActionNotificationServer_removeActionPredictionNotificationsMatchingAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id *WeakRetained;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v22 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  v21 = v4;
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_actionKeyFromNotification:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "actionKey");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v10)
          v13 = v11 == 0;
        else
          v13 = 1;
        if (!v13 && objc_msgSend(v10, "isEqualToString:", v11))
        {
          objc_msgSend(*(id *)(a1 + 32), "_unarchiveProactiveSuggestionFromNotification:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "atxActionExecutableObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15
            && +[_ATXActionUtils isContainmentBetweenAction:other:](_ATXActionUtils, "isContainmentBetweenAction:other:", v15, *(_QWORD *)(a1 + 40)))
          {
            objc_msgSend(v9, "request");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v17);

            v4 = v21;
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v22, "count"))
    objc_msgSend(WeakRetained[1], "removeDeliveredNotificationsWithIdentifiers:", v22);
  __atxlog_handle_notifications();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "actionKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v22;
    v29 = 2112;
    v30 = v19;
    _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "Removed delivered notifications: %@ matching action: %@", buf, 0x16u);

    v4 = v21;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)removeAllActionPredictionNotificationsAndTrackEvent:(BOOL)a3 recordFeedback:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  dispatch_semaphore_t v8;
  UNUserNotificationCenter *notificationCenter;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  ATXActionNotificationServer *v16;
  NSObject *v17;
  id v18;
  BOOL v19;
  id buf;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v4 = a4;
  v5 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_feedback();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v5;
    v21 = 1024;
    v22 = v4;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "removing all lockscreen predictions with trackEvent: %{BOOL}d and recordFeedback: %{BOOL}d", (uint8_t *)&buf, 0xEu);
  }

  if (v5)
    -[PETScalarEventTracker trackEventWithPropertyValues:](self->_removeTracker, "trackEventWithPropertyValues:", MEMORY[0x1E0C9AA60]);
  v8 = dispatch_semaphore_create(0);
  objc_initWeak(&buf, self);
  notificationCenter = self->_notificationCenter;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __98__ATXActionNotificationServer_removeAllActionPredictionNotificationsAndTrackEvent_recordFeedback___block_invoke;
  v15 = &unk_1E82E98D8;
  objc_copyWeak(&v18, &buf);
  v19 = v4;
  v16 = self;
  v10 = v8;
  v17 = v10;
  -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](notificationCenter, "getDeliveredNotificationsWithCompletionHandler:", &v12);
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v10, 2.0, v12, v13, v14, v15, v16) == 1)
  {
    __atxlog_handle_notifications();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXActionNotificationServer removeActionPredictionNotificationsMatchingAction:].cold.1();

  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&buf);

}

void __98__ATXActionNotificationServer_removeAllActionPredictionNotificationsAndTrackEvent_recordFeedback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id *v21;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (*(_BYTE *)(a1 + 56))
  {
    v21 = WeakRetained;
    v22 = v3;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v3;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "_unarchiveProactiveSuggestionFromNotification:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_blendingCacheUpdateUUIDFromNotification:", v10);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v11)
            v14 = v12 == 0;
          else
            v14 = 1;
          if (!v14)
          {
            v15 = *(void **)(a1 + 32);
            v16 = (void *)objc_opt_new();
            objc_msgSend(v11, "uuid");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v17;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "_sendLockscreenEventToBiomeWithDate:eventType:blendingCacheId:suggestionIds:", v16, 4, v13, v18);

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      }
      while (v7);
    }

    v5 = v21;
    v3 = v22;
  }
  objc_msgSend(v5[1], "removeAllDeliveredNotifications");
  __atxlog_handle_notifications();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 134217984;
    v29 = v20;
    _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "Removed all delivered notifications: %ld", buf, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_removeNotificationWithIdentifier:(id)a3 trackEvent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  UNUserNotificationCenter *notificationCenter;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  _QWORD v12[2];

  v4 = a4;
  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
    -[PETScalarEventTracker trackEventWithPropertyValues:](self->_removeTracker, "trackEventWithPropertyValues:", MEMORY[0x1E0C9AA60]);
  notificationCenter = self->_notificationCenter;
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](notificationCenter, "removeDeliveredNotificationsWithIdentifiers:", v8);

  __atxlog_handle_notifications();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Removed notification with identifier: %@", (uint8_t *)&v10, 0xCu);
  }

}

- (void)_sendLockscreenEventToBiomeWithDate:(id)a3 eventType:(int)a4 blendingCacheId:(id)a5 suggestionIds:(id)a6
{
  uint64_t v7;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v7 = *(_QWORD *)&a4;
  v10 = (objc_class *)MEMORY[0x1E0CF8F10];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = (void *)objc_msgSend([v10 alloc], "initWithDate:eventType:blendingCacheId:suggestionIds:", v13, v7, v12, v11);

  objc_msgSend(MEMORY[0x1E0CF9168], "uiEventWithLockscreenEvent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "donateGenericUIEvent:", v15);
  __atxlog_handle_feedback();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[ATXActionNotificationServer _sendLockscreenEventToBiomeWithDate:eventType:blendingCacheId:suggestionIds:].cold.1((uint64_t)self, v14, v17);

}

- (BOOL)_isRTL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "characterDirectionForLanguage:", v4) == 2;

  return (char)v2;
}

- (id)_localizedStringForKey:(id)a3 defaultValue:(id)a4 languageCode:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localeIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_16:
      if (objc_msgSend(v8, "length", (_QWORD)v22))
        v20 = v8;
      else
        v20 = v7;
      v16 = v20;
      goto LABEL_20;
    }
  }
  v12 = (const __CFArray *)objc_msgSend(v10, "localizations");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = CFBundleCopyLocalizationsForPreferences(v12, (CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v9));
  v14 = -[__CFArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v14)
  {

    goto LABEL_16;
  }
  v15 = v14;
  v16 = 0;
  v17 = *(_QWORD *)v23;
  while (2)
  {
    v18 = 0;
    v19 = v16;
    do
    {
      if (*(_QWORD *)v23 != v17)
        objc_enumerationMutation(v13);
      CFBundleGetBundleWithIdentifier((CFStringRef)objc_msgSend(v10, "bundleIdentifier", (_QWORD)v22));
      v16 = (void *)CFBundleCopyLocalizedStringForLocalization();

      if (v16 && (objc_msgSend(v16, "isEqualToString:", v7) & 1) == 0)
      {

        goto LABEL_20;
      }
      ++v18;
      v19 = v16;
    }
    while (v15 != v18);
    v15 = -[__CFArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
      continue;
    break;
  }

  if (!v16)
    goto LABEL_16;
LABEL_20:

  return v16;
}

- (id)_actionKeyFromNotification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("actionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_blendingCacheUpdateUUIDFromNotification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("blendingCacheUpdateUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
  else
    v7 = 0;

  return v7;
}

- (id)_unarchiveProactiveSuggestionFromNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;

  objc_msgSend(a3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("proactiveSuggestion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_ui();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXActionNotificationServer _unarchiveProactiveSuggestionFromNotification:].cold.2((uint64_t)self, (uint64_t)v7, v8);
    goto LABEL_9;
  }
  v8 = v7;
  if (!v8)
  {
    __atxlog_handle_ui();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXActionNotificationServer _unarchiveProactiveSuggestionFromNotification:].cold.1((uint64_t)self, v10);

LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithProtoData:", v8);
LABEL_10:

  return v9;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ATXEngagementRecordManager *engagementRecordManager;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  char isKindOfClass;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  void *v39;
  WFSuggestionsWorkflowRunnerClient *v40;
  WFSuggestionsWorkflowRunnerClient *currentWorkflowRunnerClient;
  WFSuggestionsWorkflowRunnerClient *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  objc_class *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD block[4];
  id v61;
  _QWORD v62[2];
  _QWORD v63[2];
  void *v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  __atxlog_handle_notifications();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v66 = v7;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "daemon didReceiveNotificationResponse: %@", buf, 0xCu);
  }

  objc_msgSend(v7, "notification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActionNotificationServer _unarchiveProactiveSuggestionFromNotification:](self, "_unarchiveProactiveSuggestionFromNotification:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "atxActionExecutableObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActionNotificationServer _blendingCacheUpdateUUIDFromNotification:](self, "_blendingCacheUpdateUUIDFromNotification:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "actionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CEC808]);
  __atxlog_handle_feedback();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v66 = v15;
    v67 = 2112;
    v68 = v12;
    _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "received notification center response with identifier: %@ for action: %@", buf, 0x16u);
  }

  if (v11 && v12)
  {
    v57 = v15;
    v58 = v7;
    if (v16)
      v18 = 2;
    else
      v18 = 3;
    v59 = v14;
    v19 = (void *)objc_opt_new();
    objc_msgSend(v11, "uuid");
    v20 = v11;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXActionNotificationServer _sendLockscreenEventToBiomeWithDate:eventType:blendingCacheId:suggestionIds:](self, "_sendLockscreenEventToBiomeWithDate:eventType:blendingCacheId:suggestionIds:", v19, v18, v59, v22);

    v14 = v59;
    v23 = (void *)objc_opt_new();
    -[ATXActionNotificationServer _sendLockscreenEventToBiomeWithDate:eventType:blendingCacheId:suggestionIds:](self, "_sendLockscreenEventToBiomeWithDate:eventType:blendingCacheId:suggestionIds:", v23, 4, v59, 0);

    engagementRecordManager = self->_engagementRecordManager;
    if ((v16 & 1) != 0)
    {
      v56 = v20;
      -[ATXEngagementRecordManager addEngagedSuggestion:engagementRecordType:](engagementRecordManager, "addEngagedSuggestion:engagementRecordType:", v20, 1);
      if (objc_msgSend(v12, "actionType") == 5)
      {
        __atxlog_handle_notifications();
        v25 = objc_claimAutoreleasedReturnValue();
        v7 = v58;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "bundleId");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v66 = v26;
          _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "launching UAUserActivityProxy for bundleId: %@", buf, 0xCu);

        }
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __107__ATXActionNotificationServer_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
        block[3] = &unk_1E82DAC38;
        v61 = v12;
        dispatch_async(MEMORY[0x1E0C80D38], block);
        if (v8)
          v8[2](v8);

        v11 = v56;
        goto LABEL_41;
      }
      v7 = v58;
      if (objc_msgSend(v12, "actionType")
        || (objc_msgSend(v12, "intent"),
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            isKindOfClass = objc_opt_isKindOfClass(),
            v28,
            (isKindOfClass & 1) == 0))
      {
        if (objc_msgSend(v12, "actionType") && objc_msgSend(v12, "actionType") != 2)
        {
          if (objc_msgSend(v12, "actionType") != 1)
          {
            __atxlog_handle_notifications();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
              -[ATXActionNotificationServer userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:].cold.2();

            v47 = 0;
            v31 = 0;
            v11 = v56;
            goto LABEL_50;
          }
          v48 = objc_alloc(MEMORY[0x1E0CBDBE8]);
          objc_msgSend(v12, "userActivity");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bundleId");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v48, "initWithUserActivity:bundleIdentifier:", v30, v49);

          v31 = 0;
          v36 = 2;
LABEL_32:

          __atxlog_handle_notifications();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C9A3B000, v37, OS_LOG_TYPE_DEFAULT, "invoking ShortcutsRuntime for execution", buf, 2u);
          }

          if (v31)
          {
            v54 = v36;
            v55 = (void *)v32;
            v38 = objc_alloc(MEMORY[0x1E0DC7DA8]);
            objc_msgSend(v12, "bundleId");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (WFSuggestionsWorkflowRunnerClient *)objc_msgSend(v38, "initWithLinkAction:bundleIdentifier:resultSurface:", v31, v39, 2);
            currentWorkflowRunnerClient = self->_currentWorkflowRunnerClient;
            self->_currentWorkflowRunnerClient = v40;

            goto LABEL_38;
          }
          if (v32)
          {
            v54 = v36;
            v55 = (void *)v32;
            v42 = (WFSuggestionsWorkflowRunnerClient *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7DA8]), "initWithINShortcut:executionContext:", v32, 3);
            v39 = self->_currentWorkflowRunnerClient;
            self->_currentWorkflowRunnerClient = v42;
LABEL_38:

            -[WFSuggestionsWorkflowRunnerClient setDelegate:](self->_currentWorkflowRunnerClient, "setDelegate:", self);
            v62[0] = CFSTR("notifID");
            objc_msgSend(v58, "notification");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "request");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "identifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v62[1] = CFSTR("atxAction");
            v63[0] = v45;
            v63[1] = v12;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFSuggestionsWorkflowRunnerClient setUserInfo:](self->_currentWorkflowRunnerClient, "setUserInfo:", v46);

            -[WFSuggestionsWorkflowRunnerClient start](self->_currentWorkflowRunnerClient, "start");
            objc_msgSend(MEMORY[0x1E0CF8F30], "logActionViewForType:inContext:", v54, 2);
            v11 = v56;
            v15 = v57;
            v14 = v59;
            v47 = v55;
            if (!v8)
            {
LABEL_40:

              goto LABEL_41;
            }
LABEL_39:
            v8[2](v8);
            goto LABEL_40;
          }
          __atxlog_handle_notifications();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
            -[ATXActionNotificationServer userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:].cold.1();

          v47 = 0;
          v31 = 0;
          v11 = v56;
          v14 = v59;
LABEL_50:
          v15 = v57;
          if (!v8)
            goto LABEL_40;
          goto LABEL_39;
        }
        objc_msgSend(v12, "bundleId");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "intent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "_setLaunchId:", v33);

        v35 = objc_alloc(MEMORY[0x1E0CBDBE8]);
        objc_msgSend(v12, "intent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v35, "initWithIntent:", v30);
        v31 = 0;
      }
      else
      {
        objc_msgSend(v12, "intent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "linkAction");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0;
      }
      v36 = 1;
      goto LABEL_32;
    }
    -[ATXEngagementRecordManager addHiddenSuggestion:duration:engagementRecordType:](engagementRecordManager, "addHiddenSuggestion:duration:engagementRecordType:", v20, 120, *MEMORY[0x1E0CF9300]);
    v11 = v20;
    v7 = v58;
    if (!v8)
      goto LABEL_41;
LABEL_24:
    v8[2](v8);
    goto LABEL_41;
  }
  if (v14)
  {
    __atxlog_handle_feedback();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v66 = v51;
      v67 = 2112;
      v68 = v14;
      v69 = 2112;
      v70 = v11;
      v71 = 2112;
      v72 = v12;
      _os_log_fault_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_FAULT, "%@ - found blendingCacheUpdateUUID: %@, but no suggestion or action: %@ %@", buf, 0x2Au);

    }
  }
  if (v8)
    goto LABEL_24;
LABEL_41:

}

void __107__ATXActionNotificationServer_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D22DA8];
  v7[0] = *MEMORY[0x1E0D22D88];
  v7[1] = v2;
  v8[0] = MEMORY[0x1E0C9AAB0];
  v8[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userActivityProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __107__ATXActionNotificationServer_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E82E97B0;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "launchActivityWithOptions:completionHandler:", v3, v5);

}

void __107__ATXActionNotificationServer_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a2)
    goto LABEL_5;
  __atxlog_handle_notifications();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "successfully launched UAUserActivityProxy for bundleId: %@", (uint8_t *)&v11, 0xCu);

  }
  if (v5)
  {
LABEL_5:
    __atxlog_handle_notifications();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __107__ATXActionNotificationServer_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2_cold_1(a1, (uint64_t)v5, v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "userActivityProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_opt_self();

}

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  __atxlog_handle_notifications();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218240;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "workflowRunnerClient: <%p> didStartRunningWorkflowWithProgress: <%p>", (uint8_t *)&v8, 0x16u);
  }

}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  int v23;
  id v24;
  uint64_t v25;

  v6 = a6;
  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  __atxlog_handle_notifications();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 134217984;
    v24 = v9;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "workflowRunnerClient: <%p> didFinishRunningWorkflowWithOutput:error:cancelled:", (uint8_t *)&v23, 0xCu);
  }

  if (v10 || v6)
  {
    if (v6)
    {
      __atxlog_handle_notifications();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "ShortcutsRuntime was cancelled. Keeping notification on screen.", (uint8_t *)&v23, 2u);
      }

    }
    if (v10)
    {
      __atxlog_handle_notifications();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ATXActionNotificationServer workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:].cold.1();

      objc_msgSend(MEMORY[0x1E0CF8F30], "logError:inContext:", 7, 2);
    }
  }
  else
  {
    __atxlog_handle_notifications();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "ShortcutsRuntime completed successfully.", (uint8_t *)&v23, 2u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v9;
      objc_msgSend(v13, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("notifID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_notifications();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 138412290;
          v24 = v15;
          _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "therefore removing notification with req id: %@", (uint8_t *)&v23, 0xCu);
        }

        -[ATXActionNotificationServer _removeNotificationWithIdentifier:trackEvent:](self, "_removeNotificationWithIdentifier:trackEvent:", v15, 1);
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[ATXActionNotificationServer workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:].cold.2();

      }
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("atxAction"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "actionType") == 1)
        v22 = 2;
      else
        v22 = 1;
      objc_msgSend(MEMORY[0x1E0CF8F30], "logActionExecuteForType:inContext:", v22, 2);

    }
    else
    {
      __atxlog_handle_notifications();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[ATXActionNotificationServer workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:].cold.3();

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_notifySuccessTracker, 0);
  objc_storeStrong((id *)&self->_notifyErrorTracker, 0);
  objc_storeStrong((id *)&self->_notifyInitTracker, 0);
  objc_storeStrong((id *)&self->_removeTracker, 0);
  objc_storeStrong((id *)&self->_currentWorkflowRunnerClient, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

void __35__ATXActionNotificationServer_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "notification center access not granted!: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)postNotificationForATXAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Unexpected prediction already on lockscreen", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __57__ATXActionNotificationServer_deliveredNotificationCount__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Timed out while waiting for current notification status", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__ATXActionNotificationServer_proactiveSuggestionsCurrentlyOnLockscreen__block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Timed out while waiting for proactiveSuggestionsCurrentlyOnLockscreen", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "No action, not posting notification.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "no bundleId for action, bailing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "title and body were empty, bailing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __95__ATXActionNotificationServer__postNotificationForProactiveSuggestion_blendingCacheUpdateUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "addNotificationRequest failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeActionPredictionNotificationsMatchingAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Timed out while waiting for getDeliveredNotificationsWithCompletionHandler to complete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_sendLockscreenEventToBiomeWithDate:(NSObject *)a3 eventType:blendingCacheId:suggestionIds:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v5 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "jsonDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "%@ - wrote lockscreen event to Biome: %@", (uint8_t *)&v8, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_unarchiveProactiveSuggestionFromNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "%@ - no proactive suggestion data available in provided UNNotificationResponse", v5, 0xCu);

}

- (void)_unarchiveProactiveSuggestionFromNotification:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  uint8_t v6[24];

  v4 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_FAULT, "%@ - value: %@ found for key kATXProactiveSuggestionUserInfoDictKey is not NSData, returning nil", v6, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Tried to create workflow runner with nil entity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Tried to handle unknown action type in notification response delegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __107__ATXActionNotificationServer_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "failed to launch UAUserActivityProxy for bundleId: %@: %@", v5, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

- (void)workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "workflowRunnerClient:didFinishRunningWithError: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "no notificationRequestId in userInfo!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "workflowRunnerClient is not of expected type!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
