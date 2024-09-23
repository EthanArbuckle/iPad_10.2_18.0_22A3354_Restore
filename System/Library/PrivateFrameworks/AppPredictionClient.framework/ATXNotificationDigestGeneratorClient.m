@implementation ATXNotificationDigestGeneratorClient

- (id)models
{
  return &unk_1E4DC2D08;
}

- (id)overallDigestScoreModel
{
  return CFSTR("notificationDigestScore");
}

- (ATXNotificationDigestGeneratorClient)init
{
  return -[ATXNotificationDigestGeneratorClient initWithDigestRankerClient:](self, "initWithDigestRankerClient:", 0);
}

- (ATXNotificationDigestGeneratorClient)initWithDigestRankerClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXNotificationDigestGeneratorClient *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  +[ATXDNDModeConfigurationClient sharedInstance](ATXDNDModeConfigurationClient, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = -[ATXNotificationDigestGeneratorClient initWithMissedNotificationRankingBiomeStream:notificationDigestBiomeStream:modeConfigurationClient:modeEntityScorer:digestRankerClient:](self, "initWithMissedNotificationRankingBiomeStream:notificationDigestBiomeStream:modeConfigurationClient:modeEntityScorer:digestRankerClient:", v5, v6, v7, v8, v4);

  return v9;
}

- (ATXNotificationDigestGeneratorClient)initWithMissedNotificationRankingBiomeStream:(id)a3 notificationDigestBiomeStream:(id)a4 modeConfigurationClient:(id)a5 modeEntityScorer:(id)a6 digestRankerClient:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ATXNotificationDigestGeneratorClient *v17;
  ATXNotificationDigestGeneratorClient *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXNotificationDigestGeneratorClient;
  v17 = -[ATXNotificationDigestGeneratorClient init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_missedNotificationRankingStream, a3);
    objc_storeStrong((id *)&v18->_digestStream, a4);
    objc_storeStrong((id *)&v18->_modeConfigurationClient, a5);
    objc_storeStrong((id *)&v18->_modeEntityScorer, a6);
    objc_storeStrong((id *)&v18->_digestRankerClient, a7);
  }

  return v18;
}

- (id)digestRankerClient
{
  ATXNotificationDigestRankerInterface *digestRankerClient;
  ATXNotificationDigestRankerInterface *v4;
  ATXNotificationDigestRankerInterface *v5;

  digestRankerClient = self->_digestRankerClient;
  if (!digestRankerClient)
  {
    v4 = (ATXNotificationDigestRankerInterface *)objc_opt_new();
    v5 = self->_digestRankerClient;
    self->_digestRankerClient = v4;

    digestRankerClient = self->_digestRankerClient;
  }
  return digestRankerClient;
}

- (id)_flattenNestedNotificationArrays:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)generateDigestForNotifications:(id)a3 digestTime:(int64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  ATXUserNotificationDigest *v10;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = digestTimeToMode(a4);
  ATXModeToString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeEntityScorerProtocol scoreUserNotifications:mode:](self->_modeEntityScorer, "scoreUserNotifications:mode:", v6, v8);
  v10 = -[ATXUserNotificationDigest initWithNotifications:modeId:ranker:]([ATXUserNotificationDigest alloc], "initWithNotifications:modeId:ranker:", v6, v9, v7);

  -[ATXUserNotificationDigest setLoggingStream:](v10, "setLoggingStream:", self->_digestStream);
  return v10;
}

- (void)generateDigestForAppGroupedNotificationStacks:(id)a3 maxGlobalMarqueeGroups:(unint64_t)a4 maxAppMarqueeGroups:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v10 = a6;
  v11 = a3;
  -[ATXNotificationDigestGeneratorClient digestRankerClient](self, "digestRankerClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __135__ATXNotificationDigestGeneratorClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke;
  v14[3] = &unk_1E4D5CCF0;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:", v11, a4, a5, v14);

}

void __135__ATXNotificationDigestGeneratorClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __135__ATXNotificationDigestGeneratorClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1();

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(v5, "setLoggingStream:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

- (void)generateDigestForNotificationArrays:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[ATXNotificationDigestGeneratorClient digestRankerClient](self, "digestRankerClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__ATXNotificationDigestGeneratorClient_generateDigestForNotificationArrays_reply___block_invoke;
  v10[3] = &unk_1E4D5CCF0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "generateDigestForNotificationStacks:reply:", v7, v10);

}

void __82__ATXNotificationDigestGeneratorClient_generateDigestForNotificationArrays_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __135__ATXNotificationDigestGeneratorClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1();

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(v5, "setLoggingStream:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

- (void)generateMissedNotificationRankingForNotificationArrays:(id)a3 modeUUID:(id)a4 reply:(id)a5
{
  ATXDNDModeConfigurationClient *modeConfigurationClient;
  id v9;
  id v10;

  modeConfigurationClient = self->_modeConfigurationClient;
  v9 = a5;
  v10 = a3;
  -[ATXNotificationDigestGeneratorClient generateMissedNotificationRankingForNotificationArrays:atxMode:reply:](self, "generateMissedNotificationRankingForNotificationArrays:atxMode:reply:", v10, -[ATXDNDModeConfigurationClient atxModeForDNDMode:](modeConfigurationClient, "atxModeForDNDMode:", a4), v9);

}

- (void)generateMissedNotificationRankingForNotificationArrays:(id)a3 atxMode:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  ATXModeEntityScorerProtocol *modeEntityScorer;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  ATXNotificationDigestGeneratorClient *v22;
  id v23;

  v8 = a3;
  v9 = a5;
  ATXModeToString(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  -[ATXNotificationDigestGeneratorClient _flattenNestedNotificationArrays:](self, "_flattenNestedNotificationArrays:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  modeEntityScorer = self->_modeEntityScorer;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __109__ATXNotificationDigestGeneratorClient_generateMissedNotificationRankingForNotificationArrays_atxMode_reply___block_invoke;
  v18[3] = &unk_1E4D5CD18;
  v22 = self;
  v23 = v9;
  v19 = v8;
  v20 = v10;
  v21 = v11;
  v14 = v11;
  v15 = v10;
  v16 = v8;
  v17 = v9;
  -[ATXModeEntityScorerProtocol scoreUserNotifications:mode:reply:](modeEntityScorer, "scoreUserNotifications:mode:reply:", v12, a4, v18);

}

void __109__ATXNotificationDigestGeneratorClient_generateMissedNotificationRankingForNotificationArrays_atxMode_reply___block_invoke(_QWORD *a1, uint64_t a2)
{
  ATXMissedNotificationRanking *v3;

  if (a2)
  {
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    v3 = -[ATXMissedNotificationRanking initWithNotificationArrays:modeId:ranker:]([ATXMissedNotificationRanking alloc], "initWithNotificationArrays:modeId:ranker:", a1[4], a1[5], a1[6]);
    -[ATXMissedNotificationRanking setLoggingStream:](v3, "setLoggingStream:", *(_QWORD *)(a1[7] + 8));
    (*(void (**)(void))(a1[8] + 16))();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestRankerClient, 0);
  objc_storeStrong((id *)&self->_modeEntityScorer, 0);
  objc_storeStrong((id *)&self->_modeConfigurationClient, 0);
  objc_storeStrong((id *)&self->_digestStream, 0);
  objc_storeStrong((id *)&self->_missedNotificationRankingStream, 0);
}

void __135__ATXNotificationDigestGeneratorClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v2, v3, "[%@] Error calling XPC for the digest: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_0();
}

@end
