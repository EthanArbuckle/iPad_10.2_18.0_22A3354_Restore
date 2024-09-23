@implementation ATXNotificationDigestApp

- (ATXNotificationDigestApp)initWithBundleId:(id)a3 digestFeedback:(id)a4 digestConstants:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXNotificationDigestApp *v12;
  ATXNotificationDigestApp *v13;
  uint64_t v14;
  NSMutableArray *rawGroups;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXNotificationDigestApp;
  v12 = -[ATXNotificationDigestApp init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleId, a3);
    objc_storeStrong((id *)&v13->_digestFeedback, a4);
    objc_storeStrong((id *)&v13->_c, a5);
    v14 = objc_opt_new();
    rawGroups = v13->_rawGroups;
    v13->_rawGroups = (NSMutableArray *)v14;

    -[ATXNotificationDigestApp populateScoresFromBundleId](v13, "populateScoresFromBundleId");
  }

  return v13;
}

- (NSArray)unorderedGroups
{
  return (NSArray *)self->_rawGroups;
}

- (NSArray)orderedGroups
{
  NSArray *orderedGroups;
  uint64_t v4;

  orderedGroups = self->_orderedGroups;
  if (!orderedGroups
    || (v4 = -[NSArray count](orderedGroups, "count"), v4 != -[NSMutableArray count](self->_rawGroups, "count")))
  {
    -[ATXNotificationDigestApp refreshGroupOrder](self, "refreshGroupOrder");
  }
  return self->_orderedGroups;
}

- (BOOL)hasImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[ATXNotificationDigestApp orderedGroups](self, "orderedGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ATXNotificationDigestApp orderedGroups](self, "orderedGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasPreviewableAttachment");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)addGroup:(id)a3
{
  id v4;

  v4 = a3;
  -[ATXNotificationDigestApp appScore](self, "appScore");
  objc_msgSend(v4, "setPriority:");
  -[NSMutableArray addObject:](self->_rawGroups, "addObject:", v4);

}

- (void)populateScoresFromBundleId
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
  double v26;
  double v27;
  double v28;
  double v29;

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
  -[ATXNotificationDigestApp logisticScoreForInput:](self, "logisticScoreForInput:", v24 + v14 * v25);
  self->_appScore = v26;
  -[ATXNotificationDigestFeedbackProtocol alltimeMarqueeAppearancesForBundleId:](self->_digestFeedback, "alltimeMarqueeAppearancesForBundleId:", self->_bundleId);
  v28 = v27;
  -[ATXNotificationDigestRankingConstants minMarqueeAppearancesPerApp](self->_c, "minMarqueeAppearancesPerApp");
  self->_isEligibleForAutomaticMarquee = v28 < v29;
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

- (void)refreshGroupOrder
{
  NSMutableArray *rawGroups;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSArray *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *orderedGroups;
  NSArray *v16;
  NSArray *v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  NSArray *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  rawGroups = self->_rawGroups;
  if (rawGroups)
  {
    -[NSMutableArray sortedArrayUsingComparator:](rawGroups, "sortedArrayUsingComparator:", &__block_literal_global_243);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        if ((objc_msgSend(v9, "hasPreviewableAttachment") & 1) != 0)
          break;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v6)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v10 = v9;

      if (!v10)
        goto LABEL_13;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __45__ATXNotificationDigestApp_refreshGroupOrder__block_invoke_2;
      v18[3] = &unk_1E82EB148;
      v19 = v10;
      v11 = (NSArray *)v10;
      objc_msgSend(v4, "_pas_filteredArrayWithTest:", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v12);
      v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
      orderedGroups = self->_orderedGroups;
      self->_orderedGroups = v14;

    }
    else
    {
LABEL_10:

LABEL_13:
      v16 = (NSArray *)v4;
      v11 = self->_orderedGroups;
      self->_orderedGroups = v16;
    }

  }
  else
  {
    v17 = self->_orderedGroups;
    self->_orderedGroups = (NSArray *)MEMORY[0x1E0C9AA60];

  }
}

uint64_t __45__ATXNotificationDigestApp_refreshGroupOrder__block_invoke(uint64_t a1, void *a2, void *a3)
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
  v5 = a2;
  objc_msgSend(a3, "appSpecifiedScore");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "appSpecifiedScore");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

BOOL __45__ATXNotificationDigestApp_refreshGroupOrder__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (BOOL)isEligibleForAutomaticMarquee
{
  return self->_isEligibleForAutomaticMarquee;
}

- (double)appScore
{
  return self->_appScore;
}

- (BOOL)hasBeenChosenForMarquee
{
  return self->_hasBeenChosenForMarquee;
}

- (void)setHasBeenChosenForMarquee:(BOOL)a3
{
  self->_hasBeenChosenForMarquee = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_orderedGroups, 0);
  objc_storeStrong((id *)&self->_rawGroups, 0);
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_digestFeedback, 0);
}

@end
