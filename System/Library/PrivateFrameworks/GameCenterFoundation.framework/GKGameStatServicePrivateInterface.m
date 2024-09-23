@implementation GKGameStatServicePrivateInterface

+ (id)interfaceProtocol
{
  return &unk_1EF4D3370;
}

+ (void)configureInterface:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_loadAchievementsForGameWithProfileFetchOptions_players_includeUnreported_includeHidden_profileFetchOptions_withCompletionHandler_, 0, 0);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_loadAchievementsForGameWithProfileFetchOptions_players_includeUnreported_includeHidden_profileFetchOptions_withCompletionHandler_, 1, 0);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_loadAchievementsForGameWithProfileFetchOptions_players_includeUnreported_includeHidden_profileFetchOptions_withCompletionHandler_, 0, 1);

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_getHypotheticalLeaderboardRanksForScores_forGameDescriptor_handler_, 0, 0);

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_getHypotheticalLeaderboardRanksForScores_forGameDescriptor_handler_, 1, 0);

  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_getGamesFriendsPlayed_type_withinSecs_matchingBundleIDs_handler_, 0, 1);

  v24 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_getGamesFriendsPlayed_type_fetchOptions_withinSecs_matchingBundleIDs_handler_, 0, 1);

  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_getReengagementAchievements_, 0, 1);

  v30 = (void *)MEMORY[0x1E0C99E60];
  v31 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_getReengagementAchievements_, 1, 1);

  v33 = (void *)MEMORY[0x1E0C99E60];
  v34 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_getReengagementAchievement_, 0, 1);

  v36 = (void *)MEMORY[0x1E0C99E60];
  v37 = objc_opt_class();
  objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_getReengagementAchievement_, 1, 1);

  v39 = (void *)MEMORY[0x1E0C99E60];
  v40 = objc_opt_class();
  objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_getEntriesForLeaderboard_fetchOptions_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_, 0, 0);

  v42 = (void *)MEMORY[0x1E0C99E60];
  v43 = objc_opt_class();
  objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_getEntriesForLeaderboard_fetchOptions_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_, 2, 0);

  v45 = (void *)MEMORY[0x1E0C99E60];
  v46 = objc_opt_class();
  objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_getEntriesForLeaderboard_fetchOptions_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_, 3, 0);

  v48 = (void *)MEMORY[0x1E0C99E60];
  v49 = objc_opt_class();
  objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_getEntriesForLeaderboard_fetchOptions_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_, 7, 0);

  v51 = (void *)MEMORY[0x1E0C99E60];
  v52 = objc_opt_class();
  objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_getEntriesForLeaderboard_fetchOptions_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_, 0, 1);

  v54 = (void *)MEMORY[0x1E0C99E60];
  v55 = objc_opt_class();
  objc_msgSend(v54, "setWithObjects:", v55, objc_opt_class(), 0);
  v56 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v56, sel_getEntriesForLeaderboard_fetchOptions_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_, 1, 1);

}

@end
