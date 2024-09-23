@implementation FCPuzzlesConfiguration

- (NSDictionary)puzzleRanksByPuzzleTypeID
{
  return self->_puzzleRanksByPuzzleTypeID;
}

- (double)recentPuzzlesCacheLifetime
{
  return self->_recentPuzzlesCacheLifetime;
}

- (double)puzzlesCacheLifetime
{
  return self->_puzzlesCacheLifetime;
}

- (NSString)puzzleHubTagID
{
  return self->_puzzleHubTagID;
}

- (NSString)puzzleFullArchiveTagID
{
  return self->_puzzleFullArchiveTagID;
}

- (BOOL)puzzleLeaderboardsEnabled
{
  return self->_puzzleLeaderboardsEnabled;
}

void __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCPuzzleTypeLeaderboard *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[FCPuzzleTypeLeaderboard initWithDictionary:]([FCPuzzleTypeLeaderboard alloc], "initWithDictionary:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v6);
}

- (FCPuzzlesConfiguration)initWithConfigDictionary:(id)a3 storefrontID:(id)a4 defaultSupportedStorefronts:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCPuzzlesConfiguration *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *puzzleHubTagID;
  uint64_t v15;
  NSString *puzzleFullArchiveTagID;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  NSArray *puzzleTypes;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSDictionary *difficultyDescriptions;
  void *v39;
  uint64_t v40;
  NSDictionary *v41;
  NSDictionary *puzzleFullArchiveMenuOptionsConfigByPuzzleTypeID;
  void *v43;
  void *v44;
  NSDictionary *v45;
  NSDictionary *puzzleTypeLeaderboards;
  NSDictionary *v47;
  void *v48;
  void *v49;
  NSDictionary *v50;
  NSDictionary *puzzleRanksByPuzzleTypeID;
  NSDictionary *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSString *streakNotificationTitle;
  void *v57;
  void *v58;
  uint64_t v59;
  NSString *streakNotificationBodyOneStreak;
  void *v61;
  void *v62;
  uint64_t v63;
  NSString *streakNotificationBodyTwoStreaks;
  void *v65;
  void *v66;
  uint64_t v67;
  NSString *streakNotificationBodyMultipleStreaks;
  NSDictionary *v70;
  void *v71;
  id v72;
  FCPuzzlesConfiguration *v73;
  id v74;
  void *v75;
  _QWORD v76[4];
  NSDictionary *v77;
  _QWORD v78[4];
  NSDictionary *v79;
  _QWORD v80[4];
  NSDictionary *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  objc_super v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v90.receiver = self;
  v90.super_class = (Class)FCPuzzlesConfiguration;
  v11 = -[FCPuzzlesConfiguration init](&v90, sel_init);
  if (v11)
  {
    v72 = v10;
    v74 = v9;
    if (objc_msgSend(v10, "containsObject:", v9))
      v12 = 0xFFFFFFFFLL;
    else
      v12 = 0;
    v11->_puzzlesEnabled = +[FCFeatureEnablementChecker enabledInConfig:forKey:withDefaultLevel:](FCFeatureEnablementChecker, "enabledInConfig:forKey:withDefaultLevel:", v8, CFSTR("puzzlesEnabled"), v12);
    v11->_puzzlesArchiveAPIEnabled = +[FCFeatureEnablementChecker enabledInConfig:forKey:withDefaultLevel:](FCFeatureEnablementChecker, "enabledInConfig:forKey:withDefaultLevel:", v8, CFSTR("puzzlesArchiveAPIEnabled"), 0);
    v11->_puzzleLeaderboardsEnabled = +[FCFeatureEnablementChecker enabledInConfig:forKey:withDefaultLevel:](FCFeatureEnablementChecker, "enabledInConfig:forKey:withDefaultLevel:", v8, CFSTR("puzzleLeaderboardsEnabled"), 0);
    FCAppConfigurationStringValue(v8, (uint64_t)CFSTR("puzzleHubTagId"), 0);
    v13 = objc_claimAutoreleasedReturnValue();
    puzzleHubTagID = v11->_puzzleHubTagID;
    v11->_puzzleHubTagID = (NSString *)v13;

    FCAppConfigurationStringValue(v8, (uint64_t)CFSTR("puzzleFullArchiveTagId"), 0);
    v15 = objc_claimAutoreleasedReturnValue();
    puzzleFullArchiveTagID = v11->_puzzleFullArchiveTagID;
    v11->_puzzleFullArchiveTagID = (NSString *)v15;

    v75 = v8;
    FCAppConfigurationArrayValueWithDefaultValue(v8, (uint64_t)CFSTR("puzzleTypes"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v87 != v22)
            objc_enumerationMutation(v19);
          FCAppConfigurationStringValue(*(void **)(*((_QWORD *)&v86 + 1) + 8 * i), (uint64_t)CFSTR("identifier"), 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            objc_msgSend(v18, "addObject:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
      }
      while (v21);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v18);
    v25 = objc_claimAutoreleasedReturnValue();
    puzzleTypes = v11->_puzzleTypes;
    v11->_puzzleTypes = (NSArray *)v25;

    v11->_autoEnableNotificationMinimumPlayCount = FCAppConfigurationIntegerValue(v75, (uint64_t)CFSTR("autoEnableNotificationMinimumPlayCount"), 0x7FFFFFFFFFFFFFFFLL);
    v11->_autoEnableNotificationPlayTimeInterval = (double)FCAppConfigurationIntegerValue(v75, (uint64_t)CFSTR("autoEnableNotificationPlayTimeInterval"), 0);
    v11->_autoDisableNotificationEngagementInterval = (double)FCAppConfigurationIntegerValue(v75, (uint64_t)CFSTR("autoDisableNotificationEngagementInterval"), 2592000);
    v11->_progressUpdateTimeInterval = (double)FCAppConfigurationIntegerValue(v75, (uint64_t)CFSTR("progressUpdateTimeInterval"), 5);
    v11->_badgingUpdateQuiesenceInterval = (double)FCAppConfigurationIntegerValue(v75, (uint64_t)CFSTR("badgingUpdateQuiesenceInterval"), 21600);
    v11->_numberOfHistoryPuzzlesToPrewarm = FCAppConfigurationIntegerValue(v75, (uint64_t)CFSTR("numberOfHistoryPuzzlesToPrewarm"), 5);
    v11->_puzzleHistoryPrewarmTimeInterval = FCAppConfigurationDoubleValue(v75, (uint64_t)CFSTR("puzzleHistoryPrewarmTimeInterval"), 604800.0);
    v11->_puzzlesPrewarmTimeInterval = FCAppConfigurationDoubleValue(v75, (uint64_t)CFSTR("puzzlesPrewarmTimeInterval"), 43200.0);
    v11->_puzzlesEngineRefreshTimeInterval = FCAppConfigurationDoubleValue(v75, (uint64_t)CFSTR("puzzlesEngineRefreshTimeInterval"), 86400.0);
    v11->_puzzlesCacheLifetime = FCAppConfigurationDoubleValue(v75, (uint64_t)CFSTR("puzzlesCacheLifetime"), 21600.0);
    v73 = v11;
    v11->_recentPuzzlesCacheLifetime = FCAppConfigurationDoubleValue(v75, (uint64_t)CFSTR("recentPuzzlesCacheLifetime"), 3600.0);
    FCAppConfigurationArrayValueWithDefaultValue(v75, (uint64_t)CFSTR("puzzleDifficulties"), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v27, "count"));
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v29 = v27;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v83;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v83 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
          FCAppConfigurationNumberValue(v34, (uint64_t)CFSTR("index"), 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          FCAppConfigurationStringValue(v34, (uint64_t)CFSTR("label"), 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "fc_safelySetObjectAllowingNil:forKeyAllowingNil:", v36, v35);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
      }
      while (v31);
    }

    v37 = objc_msgSend(v28, "copy");
    difficultyDescriptions = v73->_difficultyDescriptions;
    v73->_difficultyDescriptions = (NSDictionary *)v37;

    v8 = v75;
    FCAppConfigurationDictionaryValueWithDefaultValue(v75, (uint64_t)CFSTR("puzzlesFullArchiveMenuConfig"), 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = MEMORY[0x1E0C809B0];
    v40 = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke;
    v80[3] = &unk_1E46430E0;
    v41 = v39;
    v81 = v41;
    objc_msgSend(v71, "enumerateKeysAndObjectsUsingBlock:", v80);
    puzzleFullArchiveMenuOptionsConfigByPuzzleTypeID = v73->_puzzleFullArchiveMenuOptionsConfigByPuzzleTypeID;
    v73->_puzzleFullArchiveMenuOptionsConfigByPuzzleTypeID = v41;
    v70 = v41;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationDictionaryValueWithDefaultValue(v75, (uint64_t)CFSTR("puzzleTypeLeaderboards"), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v40;
    v78[1] = 3221225472;
    v78[2] = __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_3;
    v78[3] = &unk_1E46430E0;
    v45 = v43;
    v79 = v45;
    objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v78);
    puzzleTypeLeaderboards = v73->_puzzleTypeLeaderboards;
    v73->_puzzleTypeLeaderboards = v45;
    v47 = v45;

    FCAppConfigurationDictionaryValueWithDefaultValue(v75, (uint64_t)CFSTR("puzzleTypeRanks"), 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_4;
    v76[3] = &unk_1E463E1E0;
    v50 = v49;
    v77 = v50;
    objc_msgSend(v48, "enumerateKeysAndObjectsUsingBlock:", v76);
    puzzleRanksByPuzzleTypeID = v73->_puzzleRanksByPuzzleTypeID;
    v73->_puzzleRanksByPuzzleTypeID = v50;
    v52 = v50;

    v11 = v73;
    v9 = v74;
    v10 = v72;
  }
  v11->_streakCheckLocalTimeInterval = (double)FCAppConfigurationIntegerValue(v8, (uint64_t)CFSTR("streakCheckLocalTimeInterval"), 66600);
  v11->_streakNotificationDeliveryLocalTime = FCAppConfigurationIntegerValue(v8, (uint64_t)CFSTR("streakNotificationDeliveryLocalTime"), 68400);
  v11->_streakLapseNotificationMinimumStreakCount = FCAppConfigurationIntegerValue(v8, (uint64_t)CFSTR("streakLapseNotificationMinimumStreakCount"), 7);
  FCBundle();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("Apple News+ Puzzles"), &stru_1E464BC40, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v8, (uint64_t)CFSTR("streakNotificationTitle"), v54);
  v55 = objc_claimAutoreleasedReturnValue();
  streakNotificationTitle = v11->_streakNotificationTitle;
  v11->_streakNotificationTitle = (NSString *)v55;

  FCBundle();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("Keep your streak going by solving today's %@."), &stru_1E464BC40, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v8, (uint64_t)CFSTR("streakNotificationBodyOneStreak"), v58);
  v59 = objc_claimAutoreleasedReturnValue();
  streakNotificationBodyOneStreak = v11->_streakNotificationBodyOneStreak;
  v11->_streakNotificationBodyOneStreak = (NSString *)v59;

  FCBundle();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("Keep your streaks going by solving today's %@ and %@."), &stru_1E464BC40, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v8, (uint64_t)CFSTR("streakNotificationBodyTwoStreaks"), v62);
  v63 = objc_claimAutoreleasedReturnValue();
  streakNotificationBodyTwoStreaks = v11->_streakNotificationBodyTwoStreaks;
  v11->_streakNotificationBodyTwoStreaks = (NSString *)v63;

  FCBundle();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("Keep your streaks going by solving today's puzzles."), &stru_1E464BC40, 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v8, (uint64_t)CFSTR("streakNotificationBodyMultipleStreaks"), v66);
  v67 = objc_claimAutoreleasedReturnValue();
  streakNotificationBodyMultipleStreaks = v11->_streakNotificationBodyMultipleStreaks;
  v11->_streakNotificationBodyMultipleStreaks = (NSString *)v67;

  v11->_allowLowerProgressOnCompletedPuzzles = FCAppConfigurationBoolValue(v8, (uint64_t)CFSTR("allowLowerProgressOnCompletedPuzzles"), 0);
  return v11;
}

- (double)puzzlesPrewarmTimeInterval
{
  return self->_puzzlesPrewarmTimeInterval;
}

- (BOOL)puzzlesEnabled
{
  return self->_puzzlesEnabled;
}

- (NSArray)puzzleTypes
{
  return self->_puzzleTypes;
}

void __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  FCPuzzleRank *v6;
  FCPuzzleRank *v7;

  v5 = a2;
  v7 = -[FCPuzzleRank initWithDictionary:index:]([FCPuzzleRank alloc], "initWithDictionary:index:", v5, a3);

  v6 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    v6 = v7;
  }

}

void __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  FCPuzzleFullArchiveMenuOptionsConfiguration *v4;
  FCPuzzleFullArchiveMenuOptionsConfiguration *v5;

  v3 = a2;
  v5 = -[FCPuzzleFullArchiveMenuOptionsConfiguration initWithConfigDictionary:]([FCPuzzleFullArchiveMenuOptionsConfiguration alloc], "initWithConfigDictionary:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

void __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  FCAppConfigurationDictionaryValueWithDefaultValue(a3, (uint64_t)CFSTR("sections"), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v10;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_2;
  v11[3] = &unk_1E463D0B8;
  v12 = v8;
  v9 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v9, v5);

}

void __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  FCAppConfigurationArrayValueWithDefaultValue(a3, (uint64_t)CFSTR("puzzleRanks"), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__FCPuzzlesConfiguration_initWithConfigDictionary_storefrontID_defaultSupportedStorefronts___block_invoke_5;
  v9[3] = &unk_1E463D0B8;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_puzzleRanksByPuzzleTypeID, 0);
  objc_storeStrong((id *)&self->_puzzleTypeLeaderboards, 0);
  objc_storeStrong((id *)&self->_puzzleFullArchiveMenuOptionsConfigByPuzzleTypeID, 0);
  objc_storeStrong((id *)&self->_streakNotificationBodyMultipleStreaks, 0);
  objc_storeStrong((id *)&self->_streakNotificationBodyTwoStreaks, 0);
  objc_storeStrong((id *)&self->_streakNotificationBodyOneStreak, 0);
  objc_storeStrong((id *)&self->_streakNotificationTitle, 0);
  objc_storeStrong((id *)&self->_difficultyDescriptions, 0);
  objc_storeStrong((id *)&self->_puzzleTypes, 0);
  objc_storeStrong((id *)&self->_puzzleFullArchiveTagID, 0);
  objc_storeStrong((id *)&self->_puzzleHubTagID, 0);
}

- (BOOL)puzzlesArchiveAPIEnabled
{
  return self->_puzzlesArchiveAPIEnabled;
}

- (int64_t)autoEnableNotificationMinimumPlayCount
{
  return self->_autoEnableNotificationMinimumPlayCount;
}

- (double)autoEnableNotificationPlayTimeInterval
{
  return self->_autoEnableNotificationPlayTimeInterval;
}

- (double)autoDisableNotificationEngagementInterval
{
  return self->_autoDisableNotificationEngagementInterval;
}

- (double)progressUpdateTimeInterval
{
  return self->_progressUpdateTimeInterval;
}

- (double)badgingUpdateQuiesenceInterval
{
  return self->_badgingUpdateQuiesenceInterval;
}

- (NSDictionary)difficultyDescriptions
{
  return self->_difficultyDescriptions;
}

- (int64_t)numberOfHistoryPuzzlesToPrewarm
{
  return self->_numberOfHistoryPuzzlesToPrewarm;
}

- (double)puzzleHistoryPrewarmTimeInterval
{
  return self->_puzzleHistoryPrewarmTimeInterval;
}

- (double)puzzlesEngineRefreshTimeInterval
{
  return self->_puzzlesEngineRefreshTimeInterval;
}

- (double)streakCheckLocalTimeInterval
{
  return self->_streakCheckLocalTimeInterval;
}

- (int64_t)streakNotificationDeliveryLocalTime
{
  return self->_streakNotificationDeliveryLocalTime;
}

- (int64_t)streakLapseNotificationMinimumStreakCount
{
  return self->_streakLapseNotificationMinimumStreakCount;
}

- (NSString)streakNotificationTitle
{
  return self->_streakNotificationTitle;
}

- (NSString)streakNotificationBodyOneStreak
{
  return self->_streakNotificationBodyOneStreak;
}

- (NSString)streakNotificationBodyTwoStreaks
{
  return self->_streakNotificationBodyTwoStreaks;
}

- (NSString)streakNotificationBodyMultipleStreaks
{
  return self->_streakNotificationBodyMultipleStreaks;
}

- (NSDictionary)puzzleFullArchiveMenuOptionsConfigByPuzzleTypeID
{
  return self->_puzzleFullArchiveMenuOptionsConfigByPuzzleTypeID;
}

- (NSDictionary)puzzleTypeLeaderboards
{
  return self->_puzzleTypeLeaderboards;
}

- (BOOL)allowLowerProgressOnCompletedPuzzles
{
  return self->_allowLowerProgressOnCompletedPuzzles;
}

@end
