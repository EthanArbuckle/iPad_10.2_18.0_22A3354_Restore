@implementation ATXBiomePrivacyPruner

- (void)pruneAllStreamsWithActivity:(id)a3
{
  id v4;

  v4 = a3;
  -[ATXBiomePrivacyPruner pruneBlendingStreamsWithActivity:](self, "pruneBlendingStreamsWithActivity:", v4);
  if ((objc_msgSend(v4, "didDefer") & 1) == 0)
  {
    -[ATXBiomePrivacyPruner prunePredictionContextStreamWithActivity:](self, "prunePredictionContextStreamWithActivity:", v4);
    if ((objc_msgSend(v4, "didDefer") & 1) == 0)
    {
      -[ATXBiomePrivacyPruner pruneContextHeuristicsStreamWithActivity:](self, "pruneContextHeuristicsStreamWithActivity:", v4);
      if ((objc_msgSend(v4, "didDefer") & 1) == 0)
      {
        -[ATXBiomePrivacyPruner pruneSpotlightUIStreamWithActivity:](self, "pruneSpotlightUIStreamWithActivity:", v4);
        if ((objc_msgSend(v4, "didDefer") & 1) == 0)
        {
          -[ATXBiomePrivacyPruner pruneLocationStreamWithActivity:](self, "pruneLocationStreamWithActivity:", v4);
          if ((objc_msgSend(v4, "didDefer") & 1) == 0)
          {
            -[ATXBiomePrivacyPruner pruneProactiveSuggestionUIFeedbackResultStreamWithActivity:](self, "pruneProactiveSuggestionUIFeedbackResultStreamWithActivity:", v4);
            if ((objc_msgSend(v4, "didDefer") & 1) == 0)
            {
              -[ATXBiomePrivacyPruner pruneLightweightClientModelCacheUpdatesStreamWithActivity:](self, "pruneLightweightClientModelCacheUpdatesStreamWithActivity:", v4);
              if ((objc_msgSend(v4, "didDefer") & 1) == 0)
              {
                -[ATXBiomePrivacyPruner pruneActivitySuggestionFeedbackStreamWithActivity:](self, "pruneActivitySuggestionFeedbackStreamWithActivity:", v4);
                if ((objc_msgSend(v4, "didDefer") & 1) == 0)
                {
                  -[ATXBiomePrivacyPruner pruneERMStreamWithActivity:](self, "pruneERMStreamWithActivity:", v4);
                  if ((objc_msgSend(v4, "didDefer") & 1) == 0)
                  {
                    -[ATXBiomePrivacyPruner pruneNotificationDigestStreamWithActivity:](self, "pruneNotificationDigestStreamWithActivity:", v4);
                    if ((objc_msgSend(v4, "didDefer") & 1) == 0)
                    {
                      -[ATXBiomePrivacyPruner pruneMissedNotificationRankingStreamWithActivity:](self, "pruneMissedNotificationRankingStreamWithActivity:", v4);
                      if ((objc_msgSend(v4, "didDefer") & 1) == 0)
                      {
                        -[ATXBiomePrivacyPruner pruneNotificationEventStreamWithActivity:](self, "pruneNotificationEventStreamWithActivity:", v4);
                        if ((objc_msgSend(v4, "didDefer") & 1) == 0)
                        {
                          -[ATXBiomePrivacyPruner pruneNotificationGroupEventStreamWithActivity:](self, "pruneNotificationGroupEventStreamWithActivity:", v4);
                          if ((objc_msgSend(v4, "didDefer") & 1) == 0)
                          {
                            -[ATXBiomePrivacyPruner pruneNotificationSuggestionStreamWithActivity:](self, "pruneNotificationSuggestionStreamWithActivity:", v4);
                            if ((objc_msgSend(v4, "didDefer") & 1) == 0)
                            {
                              -[ATXBiomePrivacyPruner pruneNotificationSuggestionInteractionStreamWithActivity:](self, "pruneNotificationSuggestionInteractionStreamWithActivity:", v4);
                              if ((objc_msgSend(v4, "didDefer") & 1) == 0)
                              {
                                -[ATXBiomePrivacyPruner pruneModeConfigurationUIFlowLoggingStreamWithActivity:](self, "pruneModeConfigurationUIFlowLoggingStreamWithActivity:", v4);
                                if ((objc_msgSend(v4, "didDefer") & 1) == 0)
                                {
                                  -[ATXBiomePrivacyPruner pruneDigestOnboardingSuggestionLoggingStreamWithActivity:](self, "pruneDigestOnboardingSuggestionLoggingStreamWithActivity:", v4);
                                  if ((objc_msgSend(v4, "didDefer") & 1) == 0)
                                  {
                                    -[ATXBiomePrivacyPruner pruneDigestOnboardingLoggingStreamWithActivity:](self, "pruneDigestOnboardingLoggingStreamWithActivity:", v4);
                                    if ((objc_msgSend(v4, "didDefer") & 1) == 0)
                                    {
                                      -[ATXBiomePrivacyPruner pruneDigestOnboardingAppSelectionLoggingStreamWithActivity:](self, "pruneDigestOnboardingAppSelectionLoggingStreamWithActivity:", v4);
                                      if ((objc_msgSend(v4, "didDefer") & 1) == 0)
                                      {
                                        -[ATXBiomePrivacyPruner pruneAppLaunchInferredModeStreamWithActivity:](self, "pruneAppLaunchInferredModeStreamWithActivity:", v4);
                                        if ((objc_msgSend(v4, "didDefer") & 1) == 0)
                                          -[ATXBiomePrivacyPruner pruneFaceGalleryStreamWithActivity:](self, "pruneFaceGalleryStreamWithActivity:", v4);
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

}

- (void)pruneBlendingStreamsWithActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "streamIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(MEMORY[0x1E0D024C0], "atx_storeConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", v11, v4, v13, CFAbsoluteTimeGetCurrent() + -2419200.0);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0D024C0], "atx_storeConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("homeScreen"), v4, v14, CFAbsoluteTimeGetCurrent() + -2419200.0);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "streamIdentifiers", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20);
        v22 = (void *)MEMORY[0x1CAA48B6C]();
        -[ATXBiomePrivacyPruner prunePrivateStreamWithStreamIdentifier:activity:](self, "prunePrivateStreamWithStreamIdentifier:activity:", v21, v4);
        objc_autoreleasePoolPop(v22);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  -[ATXBiomePrivacyPruner prunePrivateStreamWithStreamIdentifier:activity:](self, "prunePrivateStreamWithStreamIdentifier:activity:", CFSTR("blending"), v4);
  -[ATXBiomePrivacyPruner prunePrivateStreamWithStreamIdentifier:activity:](self, "prunePrivateStreamWithStreamIdentifier:activity:", CFSTR("clientModel"), v4);

}

- (void)prunePredictionContextStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("predictionContext"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneContextHeuristicsStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("contextHeuristics"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneSpotlightUIStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("spotlightUI"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneLocationStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("location"), v5, v6, CFAbsoluteTimeGetCurrent() + -172800.0);

}

- (void)pruneProactiveSuggestionUIFeedbackResultStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("proactiveSuggestionUIFeedbackResultStreamWriterBookmarkURL"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneLightweightClientModelCacheUpdatesStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("lightweightClientModelCacheUpdates"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneActivitySuggestionFeedbackStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("ActivitySuggestionFeedback"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneERMStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("ERM"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneNotificationDigestStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("notificationDigestLoggingEvents"), v5, v6, CFAbsoluteTimeGetCurrent() + -1209600.0);

}

- (void)pruneMissedNotificationRankingStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("missedNotificationRankingLoggingEvent"), v5, v6, CFAbsoluteTimeGetCurrent() + -1209600.0);

}

- (void)pruneNotificationEventStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("userNotificationEvents"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneNotificationGroupEventStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("notificationGroupEvent"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneNotificationSuggestionStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("notificationSuggestion"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneNotificationSuggestionInteractionStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("notificationSuggestionInteraction"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneAppLaunchInferredModeStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("appLaunchInferredMode"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneModeConfigurationUIFlowLoggingStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("modeConfigurationUIFlowLoggingEvent"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneDigestOnboardingSuggestionLoggingStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("digestOnboardingSuggestionLoggingEvent"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneDigestOnboardingLoggingStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("digestOnboardingLoggingEvent"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneDigestOnboardingAppSelectionLoggingStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("digestOnboardingAppSelectionLoggingEvent"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)pruneFaceGalleryStreamWithActivity:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D024C0];
  v5 = a3;
  objc_msgSend(v4, "atx_storeConfig");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", CFSTR("faceGallery"), v5, v6, CFAbsoluteTimeGetCurrent() + -2419200.0);

}

- (void)prunePrivateStreamWithStreamIdentifier:(id)a3 activity:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0D024C0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "atx_storeConfig");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXBiomePrivacyPruner pruneWithStreamIdentifier:activity:config:endTime:](self, "pruneWithStreamIdentifier:activity:config:endTime:", v8, v7, v9, CFAbsoluteTimeGetCurrent() + -172800.0);

}

- (void)pruneWithStreamIdentifier:(id)a3 activity:(id)a4 config:(id)a5 endTime:(double)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  int v25;
  _QWORD v26[4];
  id v27;
  _BYTE *v28;
  _QWORD v29[4];
  id v30;
  _BYTE *v31;
  uint8_t v32[4];
  _BYTE v33[18];
  _BYTE buf[24];
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  __atxlog_handle_default();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "Pruning stream identifier: %@ based on max size", buf, 0xCu);
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024D0]), "initWithStream:permission:config:", v9, 2, v11);
  objc_msgSend(v13, "pruneStreamToMaxStreamSizeInBytes:", *MEMORY[0x1E0CF95B8]);
  __atxlog_handle_default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a6;
    _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "Pruning stream identifier: %@ based on endTime: %f", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v35 = 0;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024D8]), "initWithStream:config:", v9, v11);
  v16 = (void *)MEMORY[0x1CAA48B6C]();
  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __75__ATXBiomePrivacyPruner_pruneWithStreamIdentifier_activity_config_endTime___block_invoke;
  v29[3] = &unk_1E82DE6D8;
  v31 = buf;
  v18 = v10;
  v30 = v18;
  objc_msgSend(v15, "removeEventsFrom:to:reason:usingBlock:", 1, v29, 0.0, a6);

  objc_autoreleasePoolPop(v16);
  *(_DWORD *)(*(_QWORD *)&buf[8] + 24) = 0;
  __atxlog_handle_default();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v32 = 138412546;
    *(_QWORD *)v33 = v9;
    *(_WORD *)&v33[8] = 2048;
    *(double *)&v33[10] = a6;
    _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "Pruning tombstones for stream identifier: %@ based on endTime: %f", v32, 0x16u);
  }

  v20 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v20, "setStoreLocationOption:", 2);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024D8]), "initWithStream:config:", v9, v20);
  v22 = (void *)MEMORY[0x1CAA48B6C]();
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __75__ATXBiomePrivacyPruner_pruneWithStreamIdentifier_activity_config_endTime___block_invoke_58;
  v26[3] = &unk_1E82DE6D8;
  v28 = buf;
  v23 = v18;
  v27 = v23;
  objc_msgSend(v21, "removeEventsFrom:to:reason:usingBlock:", 1, v26, 0.0, a6);

  objc_autoreleasePoolPop(v22);
  __atxlog_handle_default();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = *(_DWORD *)(*(_QWORD *)&buf[8] + 24);
    *(_DWORD *)v32 = 67109378;
    *(_DWORD *)v33 = v25;
    *(_WORD *)&v33[4] = 2112;
    *(_QWORD *)&v33[6] = v9;
    _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, "Removed %d tombstone events for stream identifier: %@", v32, 0x12u);
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __75__ATXBiomePrivacyPruner_pruneWithStreamIdentifier_activity_config_endTime___block_invoke(uint64_t result, _BYTE *a2)
{
  uint64_t v2;
  int v3;
  unint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v3 = *(_DWORD *)(v2 + 24) + 1;
  *(_DWORD *)(v2 + 24) = v3;
  HIDWORD(v4) = -1030792151 * v3;
  LODWORD(v4) = -1030792151 * v3;
  if ((v4 >> 2) <= 0x28F5C28)
  {
    result = objc_msgSend(*(id *)(result + 32), "didDefer");
    if ((_DWORD)result)
      *a2 = 1;
  }
  return result;
}

uint64_t __75__ATXBiomePrivacyPruner_pruneWithStreamIdentifier_activity_config_endTime___block_invoke_58(uint64_t result, _BYTE *a2)
{
  uint64_t v2;
  int v3;
  unint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v3 = *(_DWORD *)(v2 + 24) + 1;
  *(_DWORD *)(v2 + 24) = v3;
  HIDWORD(v4) = -1030792151 * v3;
  LODWORD(v4) = -1030792151 * v3;
  if ((v4 >> 2) <= 0x28F5C28)
  {
    result = objc_msgSend(*(id *)(result + 32), "didDefer");
    if ((_DWORD)result)
      *a2 = 1;
  }
  return result;
}

@end
