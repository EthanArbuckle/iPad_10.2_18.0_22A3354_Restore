@implementation _App

- (_App)initWithNotificationStacks:(id)a3 maxAppMarqueeGroups:(unint64_t)a4 digestFeedback:(id)a5
{
  id v8;
  id v9;
  _App *v10;
  uint64_t v11;
  ATXNotificationDigestRankingConstants *c;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_App;
  v10 = -[_App init](&v15, sel_init);
  if (v10)
  {
    +[ATXNotificationDigestRankingConstants sharedInstance](ATXNotificationDigestRankingConstants, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    c = v10->_c;
    v10->_c = (ATXNotificationDigestRankingConstants *)v11;

    v10->_maxAppMarqueeGroups = a4;
    objc_storeStrong((id *)&v10->_digestFeedback, a5);
    -[_App getGroupsFromNotificationStacks:](v10, "getGroupsFromNotificationStacks:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_App setRankedGroupsFromNotificationGroups:](v10, "setRankedGroupsFromNotificationGroups:", v13);

    -[_App setBundleId](v10, "setBundleId");
    -[_App setDigestRankingScore](v10, "setDigestRankingScore");
  }

  return v10;
}

- (id)getGroupsFromNotificationStacks:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40___App_getGroupsFromNotificationStacks___block_invoke;
  v4[3] = &unk_1E82EB420;
  v4[4] = self;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setBundleId
{
  void *v3;
  NSArray *groups;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  objc_class *v14;
  NSString *v15;
  NSString *bundleId;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E40];
  groups = self->_groups;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __19___App_setBundleId__block_invoke;
  v17[3] = &unk_1E82EB448;
  v17[4] = self;
  -[NSArray _pas_mappedArrayWithTransform:](groups, "_pas_mappedArrayWithTransform:", v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
  {
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      v11 = "[%@] Missing bundleId. Proceeding to rank app without bundleId.";
      v12 = v7;
      v13 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      v20 = 2048;
      v21 = v10;
      v11 = "[%@] Expected to find exactly one bundle ID, but found %lu. Assuming first bundleId.";
      v12 = v7;
      v13 = 22;
LABEL_7:
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v6, "firstObject");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleId = self->_bundleId;
  self->_bundleId = v15;

}

- (void)setRankedGroupsFromNotificationGroups:(id)a3
{
  NSArray *v4;
  NSArray *groupsWithComms;
  NSArray *v6;
  NSArray *groupsWithoutComms;
  NSArray *v8;
  NSArray *groupsWithCommsWithPreviewableAttachment;
  NSArray *v10;
  NSArray *groupsWithCommsWithoutPreviewableAttachment;
  NSArray *v12;
  NSArray *groupsWithoutCommsWithPreviewableAttachment;
  NSArray *v14;
  NSArray *groupsWithoutCommsWithoutPreviewableAttachment;
  void *v16;
  unint64_t v17;
  unint64_t maxAppMarqueeGroups;
  NSArray *v19;
  NSArray *appMarqueeGroups;
  NSArray *v21;
  NSArray *nonAppMarqueeGroups;
  NSArray *v23;
  NSArray *groups;
  id v25;
  _QWORD v26[5];

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_245);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_pas_filteredArrayWithTest:", &__block_literal_global_16_2);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  groupsWithComms = self->_groupsWithComms;
  self->_groupsWithComms = v4;

  objc_msgSend(v25, "_pas_filteredArrayWithTest:", &__block_literal_global_17_2);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  groupsWithoutComms = self->_groupsWithoutComms;
  self->_groupsWithoutComms = v6;

  -[NSArray _pas_filteredArrayWithTest:](self->_groupsWithComms, "_pas_filteredArrayWithTest:", &__block_literal_global_18_6);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  groupsWithCommsWithPreviewableAttachment = self->_groupsWithCommsWithPreviewableAttachment;
  self->_groupsWithCommsWithPreviewableAttachment = v8;

  -[NSArray _pas_filteredArrayWithTest:](self->_groupsWithComms, "_pas_filteredArrayWithTest:", &__block_literal_global_19_0);
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  groupsWithCommsWithoutPreviewableAttachment = self->_groupsWithCommsWithoutPreviewableAttachment;
  self->_groupsWithCommsWithoutPreviewableAttachment = v10;

  -[NSArray _pas_filteredArrayWithTest:](self->_groupsWithoutComms, "_pas_filteredArrayWithTest:", &__block_literal_global_20_5);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  groupsWithoutCommsWithPreviewableAttachment = self->_groupsWithoutCommsWithPreviewableAttachment;
  self->_groupsWithoutCommsWithPreviewableAttachment = v12;

  -[NSArray _pas_filteredArrayWithTest:](self->_groupsWithoutComms, "_pas_filteredArrayWithTest:", &__block_literal_global_21_4);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  groupsWithoutCommsWithoutPreviewableAttachment = self->_groupsWithoutCommsWithoutPreviewableAttachment;
  self->_groupsWithoutCommsWithoutPreviewableAttachment = v14;

  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "addObjectsFromArray:", self->_groupsWithCommsWithPreviewableAttachment);
  objc_msgSend(v16, "addObjectsFromArray:", self->_groupsWithCommsWithoutPreviewableAttachment);
  objc_msgSend(v16, "addObjectsFromArray:", self->_groupsWithoutCommsWithPreviewableAttachment);
  objc_msgSend(v16, "addObjectsFromArray:", self->_groupsWithoutCommsWithoutPreviewableAttachment);
  v17 = objc_msgSend(v16, "count");
  if (v17 >= self->_maxAppMarqueeGroups)
    maxAppMarqueeGroups = self->_maxAppMarqueeGroups;
  else
    maxAppMarqueeGroups = v17;
  objc_msgSend(v16, "subarrayWithRange:", 0, maxAppMarqueeGroups);
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  appMarqueeGroups = self->_appMarqueeGroups;
  self->_appMarqueeGroups = v19;

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __46___App_setRankedGroupsFromNotificationGroups___block_invoke_8;
  v26[3] = &unk_1E82EB148;
  v26[4] = self;
  objc_msgSend(v25, "_pas_filteredArrayWithTest:", v26);
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  nonAppMarqueeGroups = self->_nonAppMarqueeGroups;
  self->_nonAppMarqueeGroups = v21;

  -[NSArray arrayByAddingObjectsFromArray:](self->_appMarqueeGroups, "arrayByAddingObjectsFromArray:", self->_nonAppMarqueeGroups);
  v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
  groups = self->_groups;
  self->_groups = v23;

}

- (double)setDigestRankingScore
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double result;

  -[ATXNotificationDigestFeedbackProtocol marqueeAppearancesForBundleId:](self->_digestFeedback, "marqueeAppearancesForBundleId:", self->_bundleId);
  v4 = v3;
  -[ATXNotificationDigestFeedbackProtocol marqueeEngagementsForBundleId:](self->_digestFeedback, "marqueeEngagementsForBundleId:", self->_bundleId);
  v6 = v5;
  -[ATXNotificationDigestFeedbackProtocol nonMarqueeAppearancesForBundleId:](self->_digestFeedback, "nonMarqueeAppearancesForBundleId:", self->_bundleId);
  v8 = v7;
  -[ATXNotificationDigestFeedbackProtocol nonMarqueeEngagementsForBundleId:](self->_digestFeedback, "nonMarqueeEngagementsForBundleId:", self->_bundleId);
  v10 = v9;
  -[ATXNotificationDigestFeedbackProtocol basicNotificationsSentForBundleId:](self->_digestFeedback, "basicNotificationsSentForBundleId:", self->_bundleId);
  v12 = v11;
  -[ATXNotificationDigestFeedbackProtocol timeSensitiveNotificationsSentForBundleId:](self->_digestFeedback, "timeSensitiveNotificationsSentForBundleId:", self->_bundleId);
  v14 = v13;
  -[ATXNotificationDigestRankingConstants weightForMarqueeAppearance](self->_c, "weightForMarqueeAppearance");
  v16 = v15;
  -[ATXNotificationDigestRankingConstants weightForMarqueeEngagement](self->_c, "weightForMarqueeEngagement");
  v18 = v6 * v17 + v4 * v16;
  -[ATXNotificationDigestRankingConstants weightForNonMarqueeAppearance](self->_c, "weightForNonMarqueeAppearance");
  v20 = v18 + v8 * v19;
  -[ATXNotificationDigestRankingConstants weightForNonMarqueeEngagement](self->_c, "weightForNonMarqueeEngagement");
  v22 = v20 + v10 * v21;
  -[ATXNotificationDigestRankingConstants weightForBasicNotificationsSent](self->_c, "weightForBasicNotificationsSent");
  v24 = v22 + v12 * v23;
  -[ATXNotificationDigestRankingConstants weightForTimeSensitiveNotificationsSent](self->_c, "weightForTimeSensitiveNotificationsSent");
  -[_App logisticScoreForInput:](self, "logisticScoreForInput:", v24 + v14 * v25);
  return result;
}

- (double)logisticScoreForInput:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = fmin(a3, 25.0);
  if (v4 >= -25.0)
    v5 = v4;
  else
    v5 = -25.0;
  -[ATXNotificationDigestRankingConstants logisticCenterXVal](self->_c, "logisticCenterXVal");
  v7 = v5 - v6;
  -[ATXNotificationDigestRankingConstants logisticGrowthRate](self->_c, "logisticGrowthRate");
  return 1.0 / (exp(-(v8 * v7)) + 1.0) + 0.002;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (double)digestRankingScore
{
  return self->_digestRankingScore;
}

- (NSArray)appMarqueeGroups
{
  return self->_appMarqueeGroups;
}

- (NSArray)nonAppMarqueeGroups
{
  return self->_nonAppMarqueeGroups;
}

- (NSArray)groups
{
  return self->_groups;
}

- (NSArray)groupsWithComms
{
  return self->_groupsWithComms;
}

- (NSArray)groupsWithoutComms
{
  return self->_groupsWithoutComms;
}

- (NSArray)groupsWithCommsWithPreviewableAttachment
{
  return self->_groupsWithCommsWithPreviewableAttachment;
}

- (NSArray)groupsWithCommsWithoutPreviewableAttachment
{
  return self->_groupsWithCommsWithoutPreviewableAttachment;
}

- (NSArray)groupsWithoutCommsWithPreviewableAttachment
{
  return self->_groupsWithoutCommsWithPreviewableAttachment;
}

- (NSArray)groupsWithoutCommsWithoutPreviewableAttachment
{
  return self->_groupsWithoutCommsWithoutPreviewableAttachment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsWithoutCommsWithoutPreviewableAttachment, 0);
  objc_storeStrong((id *)&self->_groupsWithoutCommsWithPreviewableAttachment, 0);
  objc_storeStrong((id *)&self->_groupsWithCommsWithoutPreviewableAttachment, 0);
  objc_storeStrong((id *)&self->_groupsWithCommsWithPreviewableAttachment, 0);
  objc_storeStrong((id *)&self->_groupsWithoutComms, 0);
  objc_storeStrong((id *)&self->_groupsWithComms, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_nonAppMarqueeGroups, 0);
  objc_storeStrong((id *)&self->_appMarqueeGroups, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_digestFeedback, 0);
}

@end
