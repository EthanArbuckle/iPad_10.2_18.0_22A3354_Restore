@implementation GKGameStatServiceInterface

+ (id)interfaceProtocol
{
  return &unk_1EF4CEB68;
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
  uint64_t v39;
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
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  uint64_t v166;
  id v167;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getRecentMatchesForGameDescriptor_leaderboardIdentifier_handler_, 0, 0);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_getRecentMatchesForGameDescriptor_leaderboardIdentifier_handler_, 0, 1);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_getRecentMatchesForGameDescriptor_achievementIdentifier_handler_, 0, 0);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_getRecentMatchesForGameDescriptor_achievementIdentifier_handler_, 0, 1);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_getRecentMatchesForGameDescriptor_includeCompatibleMultiplayerGames_handler_, 0, 0);

  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_getRecentMatchesForGameDescriptor_includeCompatibleMultiplayerGames_handler_, 0, 1);

  v22 = (void *)MEMORY[0x1E0C99E60];
  v23 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_getRecentMatchesForGameDescriptor_otherPlayer_handler_, 0, 0);

  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_getRecentMatchesForGameDescriptor_otherPlayer_handler_, 0, 1);

  v28 = (void *)MEMORY[0x1E0C99E60];
  v29 = objc_opt_class();
  objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_getRecentPlayersWithHandler_, 0, 1);

  v31 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_getAchievementDescriptionsForGameDescriptor_handler_, 0, 0);

  v34 = (void *)MEMORY[0x1E0C99E60];
  v35 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_getAchievementDescriptionsForGameDescriptor_handler_, 0, 1);

  v37 = (void *)MEMORY[0x1E0C99E60];
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  objc_msgSend(v37, "setWithObjects:", v38, v39, v40, objc_opt_class(), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_getAchievementsForGameDescriptor_players_handler_, 0, 1);

  v42 = (void *)MEMORY[0x1E0C99E60];
  v43 = objc_opt_class();
  objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_getAchievementsForGameDescriptor_players_handler_, 0, 0);

  v45 = (void *)MEMORY[0x1E0C99E60];
  v46 = objc_opt_class();
  objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_getAchievementsForGameDescriptor_players_handler_, 1, 0);

  v48 = (void *)MEMORY[0x1E0C99E60];
  v49 = objc_opt_class();
  objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_submitAchievements_whileScreeningChallenges_withEligibleChallenges_handler_, 0, 0);

  v51 = (void *)MEMORY[0x1E0C99E60];
  v52 = objc_opt_class();
  objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_submitAchievements_whileScreeningChallenges_withEligibleChallenges_handler_, 2, 0);

  v54 = (void *)MEMORY[0x1E0C99E60];
  v55 = objc_opt_class();
  objc_msgSend(v54, "setWithObjects:", v55, objc_opt_class(), 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v56, sel_submitScores_whileScreeningChallenges_withEligibleChallenges_handler_, 0, 0);

  v57 = (void *)MEMORY[0x1E0C99E60];
  v58 = objc_opt_class();
  objc_msgSend(v57, "setWithObjects:", v58, objc_opt_class(), 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_submitScores_whileScreeningChallenges_withEligibleChallenges_handler_, 2, 0);

  v60 = (void *)MEMORY[0x1E0C99E60];
  v61 = objc_opt_class();
  objc_msgSend(v60, "setWithObjects:", v61, objc_opt_class(), 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_getLeaderboardSummaryForGameDescriptor_localPlayer_baseLeaderboardID_leaderboardID_timeScope_handler_, 0, 0);

  v63 = (void *)MEMORY[0x1E0C99E60];
  v64 = objc_opt_class();
  objc_msgSend(v63, "setWithObjects:", v64, objc_opt_class(), 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v65, sel_getLeaderboardSummaryForGameDescriptor_localPlayer_baseLeaderboardID_leaderboardID_timeScope_handler_, 1, 0);

  v66 = (void *)MEMORY[0x1E0C99E60];
  v67 = objc_opt_class();
  objc_msgSend(v66, "setWithObjects:", v67, objc_opt_class(), 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v68, sel_getLeaderboardSummaryForGameDescriptor_localPlayer_baseLeaderboardID_leaderboardID_timeScope_handler_, 2, 0);

  v69 = (void *)MEMORY[0x1E0C99E60];
  v70 = objc_opt_class();
  objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v71, sel_getLeaderboardSummaryForGameDescriptor_localPlayer_baseLeaderboardID_leaderboardID_timeScope_handler_, 3, 0);

  v72 = (void *)MEMORY[0x1E0C99E60];
  v73 = objc_opt_class();
  objc_msgSend(v72, "setWithObjects:", v73, objc_opt_class(), 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v74, sel_getLeaderboardSummaryForGameDescriptor_localPlayer_baseLeaderboardID_leaderboardID_timeScope_handler_, 0, 1);

  v75 = (void *)MEMORY[0x1E0C99E60];
  v76 = objc_opt_class();
  objc_msgSend(v75, "setWithObjects:", v76, objc_opt_class(), 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v77, sel_getLeaderboardsForGameDescriptor_player_setIdentifier_handler_, 0, 0);

  v78 = (void *)MEMORY[0x1E0C99E60];
  v79 = objc_opt_class();
  objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v80, sel_getLeaderboardsForGameDescriptor_player_setIdentifier_handler_, 1, 0);

  v81 = (void *)MEMORY[0x1E0C99E60];
  v82 = objc_opt_class();
  objc_msgSend(v81, "setWithObjects:", v82, objc_opt_class(), 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v83, sel_getLeaderboardsForGameDescriptor_player_setIdentifier_handler_, 0, 1);

  v84 = (void *)MEMORY[0x1E0C99E60];
  v85 = objc_opt_class();
  objc_msgSend(v84, "setWithObjects:", v85, objc_opt_class(), 0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v86, sel_getLeaderboardSetsForGameDescriptor_handler_, 0, 0);

  v87 = (void *)MEMORY[0x1E0C99E60];
  v88 = objc_opt_class();
  objc_msgSend(v87, "setWithObjects:", v88, objc_opt_class(), 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v89, sel_getLeaderboardSetsForGameDescriptor_handler_, 0, 1);

  v90 = (void *)MEMORY[0x1E0C99E60];
  v91 = objc_opt_class();
  objc_msgSend(v90, "setWithObjects:", v91, objc_opt_class(), 0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v92, sel_getLeaderboardsForGameDescriptor_player_leaderboardIDs_setIdentifier_handler_, 0, 0);

  v93 = (void *)MEMORY[0x1E0C99E60];
  v94 = objc_opt_class();
  objc_msgSend(v93, "setWithObjects:", v94, objc_opt_class(), 0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v95, sel_getLeaderboardsForGameDescriptor_player_leaderboardIDs_setIdentifier_handler_, 1, 0);

  v96 = (void *)MEMORY[0x1E0C99E60];
  v97 = objc_opt_class();
  objc_msgSend(v96, "setWithObjects:", v97, objc_opt_class(), 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v98, sel_getLeaderboardsForGameDescriptor_player_leaderboardIDs_setIdentifier_handler_, 2, 0);

  v99 = (void *)MEMORY[0x1E0C99E60];
  v100 = objc_opt_class();
  objc_msgSend(v99, "setWithObjects:", v100, objc_opt_class(), 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v101, sel_getLeaderboardsForGameDescriptor_player_leaderboardIDs_setIdentifier_handler_, 0, 1);

  v102 = (void *)MEMORY[0x1E0C99E60];
  v103 = objc_opt_class();
  objc_msgSend(v102, "setWithObjects:", v103, objc_opt_class(), 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v104, sel_getPreviousInstanceForLeaderboard_gameDescriptor_player_handler_, 0, 0);

  v105 = (void *)MEMORY[0x1E0C99E60];
  v106 = objc_opt_class();
  objc_msgSend(v105, "setWithObjects:", v106, objc_opt_class(), 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v107, sel_getPreviousInstanceForLeaderboard_gameDescriptor_player_handler_, 1, 0);

  v108 = (void *)MEMORY[0x1E0C99E60];
  v109 = objc_opt_class();
  objc_msgSend(v108, "setWithObjects:", v109, objc_opt_class(), 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v110, sel_getPreviousInstanceForLeaderboard_gameDescriptor_player_handler_, 2, 0);

  v111 = (void *)MEMORY[0x1E0C99E60];
  v112 = objc_opt_class();
  objc_msgSend(v111, "setWithObjects:", v112, objc_opt_class(), 0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v113, sel_getPreviousInstanceForLeaderboard_gameDescriptor_player_handler_, 0, 1);

  v114 = (void *)MEMORY[0x1E0C99E60];
  v115 = objc_opt_class();
  objc_msgSend(v114, "setWithObjects:", v115, objc_opt_class(), 0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v116, sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_, 0, 0);

  v117 = (void *)MEMORY[0x1E0C99E60];
  v118 = objc_opt_class();
  objc_msgSend(v117, "setWithObjects:", v118, objc_opt_class(), 0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v119, sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_, 1, 0);

  v120 = (void *)MEMORY[0x1E0C99E60];
  v121 = objc_opt_class();
  objc_msgSend(v120, "setWithObjects:", v121, objc_opt_class(), 0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v122, sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_, 2, 0);

  v123 = (void *)MEMORY[0x1E0C99E60];
  v124 = objc_opt_class();
  objc_msgSend(v123, "setWithObjects:", v124, objc_opt_class(), 0);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v125, sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_, 6, 0);

  v126 = (void *)MEMORY[0x1E0C99E60];
  v127 = objc_opt_class();
  objc_msgSend(v126, "setWithObjects:", v127, objc_opt_class(), 0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v128, sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_, 0, 1);

  v129 = (void *)MEMORY[0x1E0C99E60];
  v130 = objc_opt_class();
  objc_msgSend(v129, "setWithObjects:", v130, objc_opt_class(), 0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v131, sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_, 1, 1);

  v132 = (void *)MEMORY[0x1E0C99E60];
  v133 = objc_opt_class();
  objc_msgSend(v132, "setWithObjects:", v133, objc_opt_class(), 0);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v134, sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_locale_handler_, 0, 0);

  v135 = (void *)MEMORY[0x1E0C99E60];
  v136 = objc_opt_class();
  objc_msgSend(v135, "setWithObjects:", v136, objc_opt_class(), 0);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v137, sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_locale_handler_, 1, 0);

  v138 = (void *)MEMORY[0x1E0C99E60];
  v139 = objc_opt_class();
  objc_msgSend(v138, "setWithObjects:", v139, objc_opt_class(), 0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v140, sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_locale_handler_, 2, 0);

  v141 = (void *)MEMORY[0x1E0C99E60];
  v142 = objc_opt_class();
  objc_msgSend(v141, "setWithObjects:", v142, objc_opt_class(), 0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v143, sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_locale_handler_, 6, 0);

  v144 = (void *)MEMORY[0x1E0C99E60];
  v145 = objc_opt_class();
  objc_msgSend(v144, "setWithObjects:", v145, objc_opt_class(), 0);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v146, sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_locale_handler_, 0, 1);

  v147 = (void *)MEMORY[0x1E0C99E60];
  v148 = objc_opt_class();
  objc_msgSend(v147, "setWithObjects:", v148, objc_opt_class(), 0);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v149, sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_locale_handler_, 1, 1);

  v150 = (void *)MEMORY[0x1E0C99E60];
  v151 = objc_opt_class();
  objc_msgSend(v150, "setWithObjects:", v151, objc_opt_class(), 0);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v152, sel_submitScore_context_leaderboardIDs_forPlayer_whileScreeningChallenges_withEligibleChallenges_gameDescriptor_handler_, 2, 0);

  v153 = (void *)MEMORY[0x1E0C99E60];
  v154 = objc_opt_class();
  objc_msgSend(v153, "setWithObjects:", v154, objc_opt_class(), 0);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v155, sel_submitScore_context_leaderboardIDs_forPlayer_whileScreeningChallenges_withEligibleChallenges_gameDescriptor_handler_, 3, 0);

  v156 = (void *)MEMORY[0x1E0C99E60];
  v157 = objc_opt_class();
  objc_msgSend(v156, "setWithObjects:", v157, objc_opt_class(), 0);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v158, sel_submitScore_context_leaderboardIDs_forPlayer_whileScreeningChallenges_withEligibleChallenges_gameDescriptor_handler_, 5, 0);

  v159 = (void *)MEMORY[0x1E0C99E60];
  v160 = objc_opt_class();
  objc_msgSend(v159, "setWithObjects:", v160, objc_opt_class(), 0);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v161, sel_submitScore_context_leaderboardIDs_forPlayer_whileScreeningChallenges_withEligibleChallenges_gameDescriptor_handler_, 6, 0);

  v162 = (void *)MEMORY[0x1E0C99E60];
  v163 = objc_opt_class();
  objc_msgSend(v162, "setWithObjects:", v163, objc_opt_class(), 0);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v164, sel_submitInstanceScore_context_leaderboard_forPlayer_whileScreeningChallenges_withEligibleChallenges_handler_, 2, 0);

  v165 = (void *)MEMORY[0x1E0C99E60];
  v166 = objc_opt_class();
  objc_msgSend(v165, "setWithObjects:", v166, objc_opt_class(), 0);
  v167 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v167, sel_submitInstanceScore_context_leaderboard_forPlayer_whileScreeningChallenges_withEligibleChallenges_handler_, 3, 0);

}

@end
