@implementation GKGameServicePrivateInterface

+ (id)interfaceProtocol
{
  return &unk_1EF4D3310;
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
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
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
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getTopGamesWithHandler_, 0, 1);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_getGamesForPlayer_includeInstalled_handler_, 0, 1);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_getGameStatsForPlayer_bundleIDs_handler_, 0, 1);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_getGamesWithAchievementStatsForPlayer_handler_, 0, 1);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_getGameMetadataForBundleIDs_handler_, 0, 1);

  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_getGamesPlayedSummaries_limit_handler_, 0, 0);

  v22 = (void *)MEMORY[0x1E0C99E60];
  v23 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_getGamesPlayedSummaries_limit_handler_, 1, 0);

  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_getGamesPlayedSummaries_limit_handler_, 0, 1);

  v28 = (void *)MEMORY[0x1E0C99E60];
  v29 = objc_opt_class();
  objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_getGamesPlayedSummaries_limit_withinSecs_handler_, 0, 0);

  v31 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_getGamesPlayedSummaries_limit_withinSecs_handler_, 1, 0);

  v34 = (void *)MEMORY[0x1E0C99E60];
  v35 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_getGamesPlayedSummaries_limit_withinSecs_handler_, 2, 0);

  v37 = (void *)MEMORY[0x1E0C99E60];
  v38 = objc_opt_class();
  objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_getGamesPlayedSummaries_limit_withinSecs_handler_, 0, 1);

  v40 = (void *)MEMORY[0x1E0C99E60];
  v41 = objc_opt_class();
  objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_getGamesPlayedMetaData_handler_, 0, 0);

  v43 = (void *)MEMORY[0x1E0C99E60];
  v44 = objc_opt_class();
  v45 = objc_opt_class();
  v46 = objc_opt_class();
  objc_msgSend(v43, "setWithObjects:", v44, v45, v46, objc_opt_class(), 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_getGamesPlayedMetaData_handler_, 0, 1);

  v48 = (void *)MEMORY[0x1E0C99E60];
  v49 = objc_opt_class();
  objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_submitFriendListAccess_value_handler_, 0, 0);

  v51 = (void *)MEMORY[0x1E0C99E60];
  v52 = objc_opt_class();
  objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_submitFriendListAccess_value_handler_, 1, 0);

  v54 = (void *)MEMORY[0x1E0C99E60];
  v55 = objc_opt_class();
  objc_msgSend(v54, "setWithObjects:", v55, objc_opt_class(), 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v56, sel_getFriendListAccessForAllGames_, 0, 1);

  v57 = (void *)MEMORY[0x1E0C99E60];
  v58 = objc_opt_class();
  v59 = objc_opt_class();
  v60 = objc_opt_class();
  objc_msgSend(v57, "setWithObjects:", v58, v59, v60, objc_opt_class(), 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v61, sel_getAppMetadataForBundleIDs_adamIDs_withCompletion_, 0, 1);

  v62 = (void *)MEMORY[0x1E0C99E60];
  v63 = objc_opt_class();
  v64 = objc_opt_class();
  objc_msgSend(v62, "setWithObjects:", v63, v64, objc_opt_class(), 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v65, sel_addGameActivityForActivityType_BundleID_userInfo_handler_, 2, 0);

  v66 = (void *)MEMORY[0x1E0C99E60];
  v67 = objc_opt_class();
  objc_msgSend(v66, "setWithObjects:", v67, objc_opt_class(), 0);
  v68 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v68, sel_fetchActivitiesForBundleID_ascending_handler_, 0, 1);

}

@end
