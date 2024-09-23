@implementation GKFriendServicePrivateInterface

+ (id)interfaceProtocol
{
  return &unk_1EF4D3250;
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
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getCommonFriendsForPlayer_handler_, 0, 1);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_getFriendsForPlayer_withFilter_handler_, 0, 1);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_getConcernsForPlayer_handler_, 0, 1);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_removeMessageInboxEntries_handler_, 0, 0);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_getMessageInboxEntries_, 0, 1);

  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_getFriendCodeDetailWithIdentifiers_handler_, 0, 0);

  v22 = (void *)MEMORY[0x1E0C99E60];
  v23 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_getFriendCodeDetailWithIdentifiers_handler_, 0, 1);

  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_getActiveFriendRequests_, 0, 1);

  v28 = (void *)MEMORY[0x1E0C99E60];
  v29 = objc_opt_class();
  objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_getPlayerActivityFeed_bundleID_continuation_gameCategoryFilter_handler_, 0, 1);

  v31 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_getPlayerActivityFeed_bundleID_continuation_handler_, 0, 1);

  v34 = (void *)MEMORY[0x1E0C99E60];
  v35 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_getPlayerActivityFeed_gameID_continuation_handler_, 0, 1);

  v37 = (void *)MEMORY[0x1E0C99E60];
  v38 = objc_opt_class();
  objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_getFriendsForPlayer_fetchOptions_handler_, 0, 1);

  v40 = (void *)MEMORY[0x1E0C99E60];
  v41 = objc_opt_class();
  objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_getFriendsForPlayer_fetchOptions_withFilter_handler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_getChallengableFriendsForPlayer_fetchOptions_completion_, 0, 0);

  v44 = (void *)MEMORY[0x1E0C99E60];
  v45 = objc_opt_class();
  objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_getChallengableFriendsForPlayer_fetchOptions_completion_, 0, 1);

  v47 = (void *)MEMORY[0x1E0C99E60];
  v48 = objc_opt_class();
  objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v49, sel_getCombinedFriendInvitationListWithCompletion_, 0, 1);

  v50 = (void *)MEMORY[0x1E0C99E60];
  v51 = objc_opt_class();
  objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
  v52 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v52, sel_getFriendsLatestActivityWithCompletion_, 0, 1);

}

@end
