@implementation FCCKPrivateDatabase

+ (id)privateDatabaseSchema
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  __CFString *v58;
  void *v59;
  __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  _QWORD v162[11];
  _QWORD v163[11];
  void *v164;
  const __CFString *v165;
  const __CFString *v166;
  const __CFString *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  const __CFString *v179;
  const __CFString *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  uint64_t v192;

  v192 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  objc_opt_self();
  v179 = CFSTR("static_sentinel");
  v180 = CFSTR("SharedPersonalizationProfile");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v179, 2);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKZoneSchema defaultZoneWithStaticRecordNames:shouldUseSecureContainer:]((uint64_t)FCCKZoneSchema, v124, 0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v114;
  v166 = CFSTR("static_sentinel_secure");
  v167 = CFSTR("SharedPersonalizationProfileSecure");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v166, 2);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKZoneSchema defaultZoneWithStaticRecordNames:shouldUseSecureContainer:]((uint64_t)FCCKZoneSchema, v113, 1);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v111;
  +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("AudioPlaylist"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v109;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("AudioPlaylistSecure"), 7, 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v107;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("AudioPlaylistSecure2"), 7, 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v104;
  +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("IssueReadingHistory"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v100;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("IssueReadingHistorySecure"), 7, 0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v96;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("IssueReadingHistorySecure2"), 7, 0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v92;
  +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("PuzzleHistory"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v90;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("PuzzleHistorySecure"), 7, 0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v88;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("PuzzleHistorySecure2"), 7, 0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v86;
  +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("ReadingHistory"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v84;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("ReadingHistorySecure"), 7, 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v82;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("ReadingHistorySecure2"), 7, 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v80;
  +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("ReadingList"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = v77;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("ReadingListSecure"), 7, 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = v75;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("ReadingListSecure2"), 7, 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = v73;
  +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("ChannelMemberships"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = v71;
  +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("SensitiveSubscriptions"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = v69;
  +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("Shortcuts"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = v67;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("ShortcutsSecure"), 7, 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v65;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("ShortcutsSecure2"), 7, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v63;
  +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("Subscriptions"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = v61;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("Subscriptions_CK"), 3, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = v57;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("SensitiveSubscriptionsSecure"), 7, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = v55;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("SensitiveSubscriptionsSecure2"), 7, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = v53;
  +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("UserEventHistory"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = v50;
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("UserEventHistorySecure"), 7, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v0;
  +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, CFSTR("UserInfo"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = v1;
  v163[0] = CFSTR("user_info_static_record_name_secure");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("UserInfoSecure"), 7, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = v3;
  v162[0] = CFSTR("user_info_static_record_name_secure2");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("UserInfoSecure2"), 7, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = v5;
  v165 = CFSTR("static_user_privacy_exporter_record");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v165, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, CFSTR("UserPrivacyExporter"), 2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v130, 32);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  +[FCCKPrivateDatabase recordSchemas]();
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = *MEMORY[0x1E0C94A30];
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", *MEMORY[0x1E0C94A30]);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v97;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v8, CFSTR("Sentinel"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v93;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v8, CFSTR("SentinelSecure"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v91;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("AudioPlaylist"), CFSTR("AudioPlaylistItem"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v89;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("IssueReadingHistory"), CFSTR("IssueReadingHistoryItem"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v87;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("PuzzleHistory"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v85;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("ReadingHistory"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v83;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("ReadingList"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v81;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("ChannelMemberships"), CFSTR("ReferenceToMembership"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v79;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("SensitiveSubscriptions"), CFSTR("Subscription"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v78;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("Shortcuts"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v76;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("Subscriptions"), CFSTR("Subscription"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v74;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserEventHistory"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v72;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfo"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v68;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfo"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = v66;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfo"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = v64;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserPrivacyExporter"), CFSTR("UserPrivacyExporter"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v130, 17);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v8;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v8, CFSTR("PersonalizationProfile"));
  v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v166 = v58;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v8, CFSTR("PersonalizationProfileSecure"));
  v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v179 = v54;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("AudioPlaylist"), CFSTR("AudioPlaylistItem"));
  v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v167 = v51;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("AudioPlaylistSecure"), CFSTR("AudioPlaylistItemSecure"));
  v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v180 = v60;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("IssueReadingHistory"), CFSTR("IssueReadingHistoryItem"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v47;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("IssueReadingHistorySecure"), CFSTR("IssueReadingHistoryItemSecure"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = v59;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("PuzzleHistory"), CFSTR("PuzzleHistoryItem"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = v45;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("PuzzleHistorySecure"), CFSTR("PuzzleHistoryItemSecure"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = v56;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("ReadingHistory"), CFSTR("ReadingHistoryItem"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = v43;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("ReadingHistorySecure"), CFSTR("ReadingHistoryItemSecure"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = v52;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("ReadingList"), CFSTR("ReadingListEntry"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = v41;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("ReadingListSecure"), CFSTR("ReadingListEntrySecure"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = v49;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("SensitiveSubscriptions"), CFSTR("Subscription"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = v40;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("SensitiveSubscriptionsSecure"), CFSTR("SubscriptionSecure"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = v39;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("Shortcuts"), CFSTR("Shortcut"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = v38;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("ShortcutsSecure"), CFSTR("ShortcutSecure"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = v48;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("Subscriptions"), CFSTR("Subscription"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = v37;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("Subscriptions_CK"), CFSTR("Subscription_CK"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = v46;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserEventHistory"), CFSTR("UserEventHistorySession"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = v36;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserEventHistorySecure"), CFSTR("UserEventHistorySessionSecure"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = v44;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfo"), CFSTR("UserInfo"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = v35;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfoSecure"), CFSTR("UserInfoSecure"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = v34;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfo"), CFSTR("TagSettings"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = v33;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfoSecure"), CFSTR("TagSettingsSecure"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = v32;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfo"), CFSTR("PuzzleTypeSettings"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = v31;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfoSecure"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v166, 13);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("Subscriptions"), CFSTR("Subscription"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = v29;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("SensitiveSubscriptionsSecure"), CFSTR("SubscriptionSecure"));
  v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v165 = v42;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("AudioPlaylist"), CFSTR("AudioPlaylistItem"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v162[0] = v117;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("AudioPlaylistSecure2"), CFSTR("AudioPlaylistItemSecure2"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v163[0] = v99;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("IssueReadingHistory"), CFSTR("IssueReadingHistoryItem"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v162[1] = v116;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("IssueReadingHistorySecure2"), CFSTR("IssueReadingHistoryItemSecure2"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v163[1] = v98;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("PuzzleHistory"), CFSTR("PuzzleHistoryItem"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v162[2] = v115;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("PuzzleHistorySecure2"), CFSTR("PuzzleHistoryItemSecure2"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v163[2] = v105;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("ReadingHistory"), CFSTR("ReadingHistoryItem"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v162[3] = v108;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("ReadingHistorySecure2"), CFSTR("ReadingHistoryItemSecure2"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v163[3] = v95;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("ReadingList"), CFSTR("ReadingListEntry"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v162[4] = v110;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("ReadingListSecure2"), CFSTR("ReadingListEntrySecure2"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v163[4] = v106;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("SensitiveSubscriptions"), CFSTR("Subscription"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v162[5] = v103;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("SensitiveSubscriptionsSecure2"), CFSTR("SubscriptionSecure2"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v163[5] = v94;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("Shortcuts"), CFSTR("Shortcut"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v162[6] = v122;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("ShortcutsSecure2"), CFSTR("ShortcutSecure2"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v163[6] = v112;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("Subscriptions"), CFSTR("Subscription"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v162[7] = v120;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("SensitiveSubscriptionsSecure2"), CFSTR("SubscriptionSecure2"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v163[7] = v9;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfo"), CFSTR("UserInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v162[8] = v10;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfoSecure2"), CFSTR("UserInfoSecure2"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v163[8] = v11;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfo"), CFSTR("TagSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v162[9] = v12;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfoSecure2"), CFSTR("TagSettingsSecure2"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v163[9] = v13;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfo"), CFSTR("PuzzleTypeSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v162[10] = v14;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfoSecure2"), CFSTR("PuzzleTypeSettingsSecure"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v163[10] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v163, v162, 11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKPrivateDatabaseVersionMapping mappingWithBaseValues:V2Changes:V3Changes:V4Changes:](FCCKPrivateDatabaseVersionMapping, "mappingWithBaseValues:V2Changes:V3Changes:V4Changes:", v125, v119, v28, v16);
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v70, CFSTR("static_sentinel"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v127;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v70, CFSTR("static_sentinel_secure"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v126;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v70, CFSTR("SharedPersonalizationProfile"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v123;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfo"), CFSTR("user_info_static_record_name"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v121;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserPrivacyExporter"), CFSTR("static_user_privacy_exporter_record"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v128;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v130, 5);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v70, CFSTR("SharedPersonalizationProfile"));
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v166 = v17;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v70, CFSTR("SharedPersonalizationProfileSecure"));
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v179 = v18;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfo"), CFSTR("user_info_static_record_name"));
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v167 = v19;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfoSecure"), CFSTR("user_info_static_record_name_secure"));
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v180 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v166, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfo"), CFSTR("user_info_static_record_name"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v162[0] = v22;
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", CFSTR("UserInfoSecure2"), CFSTR("user_info_static_record_name_secure2"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v163[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v163, v162, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKPrivateDatabaseVersionMapping mappingWithBaseValues:V2Changes:V3Changes:V4Changes:](FCCKPrivateDatabaseVersionMapping, "mappingWithBaseValues:V2Changes:V3Changes:V4Changes:", v118, v21, MEMORY[0x1E0C9AA70], v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[FCCKPrivateDatabaseSchema databaseSchemaWithZones:records:recordTypeVersionMapping:recordNameVersionMapping:]((uint64_t)FCCKPrivateDatabaseSchema, v102, v101, v129, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)initWithContainerIdentifier:(void *)a3 secureContainerIdentifier:(char)a4 productionEnvironment:(void *)a5 encryptionDelegate:(void *)a6 networkBehaviorMonitor:(char)a7 privateDataSyncingEnabled:
{
  id v13;
  id v14;
  void *v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  _BYTE *v20;
  FCCKDatabaseRecordVersionMiddleware *v21;
  id *v22;
  id *v23;
  id *v24;
  id *v25;
  id *v26;
  _BYTE *v28;
  FCCKAESSIVRecordNameCipher *v29;
  FCCKDatabaseQualityOfServiceUpgradingMiddleware *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  char v40;

  v13 = a2;
  v14 = a3;
  v33 = a1;
  v34 = v13;
  v35 = v14;
  if (a1)
  {
    v15 = v14;
    v16 = (objc_class *)MEMORY[0x1E0D60AD0];
    v32 = a6;
    v31 = a5;
    v17 = [v16 alloc];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __167__FCCKPrivateDatabase_initWithContainerIdentifier_secureContainerIdentifier_productionEnvironment_encryptionDelegate_networkBehaviorMonitor_privateDataSyncingEnabled___block_invoke;
    v37[3] = &unk_1E4643798;
    v40 = a4;
    v38 = v13;
    v39 = v15;
    v36 = (void *)objc_msgSend(v17, "initWithConstructor:", v37);
    +[FCCKPrivateDatabase privateDatabaseSchema]();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_alloc_init(FCCKDatabaseQualityOfServiceUpgradingMiddleware);
    objc_msgSend(v19, "addObject:", v30);
    v28 = -[FCCKDatabaseLoggingMiddleware initAllowingNilDesiredKeys:]([FCCKDatabaseLoggingMiddleware alloc], 1);
    v20 = -[FCCKDatabaseUserAuthenticationMiddleware initWithPrivateDataSyncingEnabled:]([FCCKDatabaseUserAuthenticationMiddleware alloc], a7);
    v21 = objc_alloc_init(FCCKDatabaseRecordVersionMiddleware);
    v29 = objc_alloc_init(FCCKAESSIVRecordNameCipher);
    objc_opt_self();
    v22 = -[FCCKDatabaseEncryptionMiddleware initWithEncryptionSchema:recordNameCipher:]((id *)[FCCKDatabaseEncryptionMiddleware alloc], v18, v29);
    v23 = -[FCCKDatabaseEncryptedZoneMigrator initWithSchema:recordEncryptionMiddleware:deprecatedBlock:]((id *)[FCCKDatabaseEncryptedZoneMigrator alloc], v18, v22, &__block_literal_global_205);
    v24 = -[FCCKDatabaseEncryptionStartUpMiddleware initWithEncryptionMigrator:]((id *)[FCCKDatabaseEncryptionStartUpMiddleware alloc], v23);
    objc_msgSend(v19, "addObject:", v24);
    objc_msgSend(v19, "addObject:", v28);
    objc_msgSend(v19, "addObject:", v20);
    objc_msgSend(v19, "addObject:", v21);
    objc_msgSend(v19, "addObject:", v22);
    v25 = -[FCCKPrivateDatabase initWithCKProperties:schema:middleware:encryptionDelegate:networkBehaviorMonitor:](v33, v36, v18, v19, v31, v32);

    v26 = v25;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)initWithCKProperties:(void *)a3 schema:(void *)a4 middleware:(void *)a5 encryptionDelegate:(void *)a6 networkBehaviorMonitor:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  id *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  dispatch_group_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v52.receiver = a1;
  v52.super_class = (Class)FCCKPrivateDatabase;
  v17 = (id *)objc_msgSendSuper2(&v52, sel_init);
  v18 = v17;
  if (v17)
  {
    v44 = v16;
    v46 = v12;
    objc_storeStrong(v17 + 9, a2);
    objc_storeStrong(v18 + 10, a3);
    objc_storeStrong(v18 + 15, a4);
    v45 = v15;
    objc_storeWeak(v18 + 2, v15);
    objc_storeStrong(v18 + 3, a6);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.news.FCCKPrivateDatabase", v19);
    v21 = v18[11];
    v18[11] = v20;

    v22 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v23 = v18[12];
    v18[12] = v22;

    objc_msgSend(v18[12], "setName:", CFSTR("com.apple.news.FCCKPrivateDatabase.serial"));
    objc_msgSend(v18[12], "setMaxConcurrentOperationCount:", 1);
    v24 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v25 = v18[13];
    v18[13] = v24;

    objc_msgSend(v18[13], "setName:", CFSTR("com.apple.news.FCCKPrivateDatabase.highPriority"));
    objc_msgSend(v18[13], "setMaxConcurrentOperationCount:", 3);
    v26 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v27 = v18[14];
    v18[14] = v26;

    objc_msgSend(v18[14], "setName:", CFSTR("com.apple.news.FCCKPrivateDatabase.noPreflight"));
    objc_msgSend(v18[14], "setMaxConcurrentOperationCount:", -1);
    v28 = dispatch_group_create();
    v29 = v18[19];
    v18[19] = v28;

    dispatch_group_enter((dispatch_group_t)v18[19]);
    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v32 = v18[15];
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v49 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          if (objc_msgSend(v37, "conformsToProtocol:", &unk_1EE6ACD78))
            objc_msgSend(v30, "addObject:", v37);
          if (objc_msgSend(v37, "conformsToProtocol:", &unk_1EE661D20))
            objc_msgSend(v31, "addObject:", v37);
          if (objc_msgSend(v37, "conformsToProtocol:", &unk_1EE66E2C0))
            objc_msgSend(v47, "addObject:", v37);
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v34);
    }

    v38 = v18[16];
    v18[16] = v30;
    v39 = v30;

    v40 = v18[17];
    v18[17] = v31;
    v41 = v31;

    v42 = v18[18];
    v18[18] = v47;

    v12 = v46;
    v16 = v44;
    v15 = v45;
  }

  return v18;
}

- (void)registerZoneRestorationSources:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 184), a2);

}

- (void)registerZonePruningAssistants:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 192), a2);

}

id *__167__FCCKPrivateDatabase_initWithContainerIdentifier_secureContainerIdentifier_productionEnvironment_encryptionDelegate_networkBehaviorMonitor_privateDataSyncingEnabled___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  FCCKPrivateDatabaseCKProperties *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v2 = objc_alloc_init(MEMORY[0x1E0C94C50]);
  objc_msgSend(v2, "setCaptureResponseHTTPHeaders:", 1);
  v21 = v2;
  objc_msgSend(v2, "setUseZoneWidePCS:", 0);
  v3 = objc_alloc_init(MEMORY[0x1E0C94C50]);
  objc_msgSend(v3, "setCaptureResponseHTTPHeaders:", 1);
  objc_msgSend(v3, "setUseZoneWidePCS:", 1);
  if (*(_BYTE *)(a1 + 48))
    v4 = 1;
  else
    v4 = 2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", *(_QWORD *)(a1 + 32), v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v5, v2);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v5, v3);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", *(_QWORD *)(a1 + 40), v4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v20, v3);
  v9 = (void *)MEMORY[0x1E0C99D20];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __167__FCCKPrivateDatabase_initWithContainerIdentifier_secureContainerIdentifier_productionEnvironment_encryptionDelegate_networkBehaviorMonitor_privateDataSyncingEnabled___block_invoke_2;
  v22[3] = &unk_1E463F098;
  v23 = v6;
  v24 = v7;
  v25 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v9, "fc_array:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [FCCKPrivateDatabaseCKProperties alloc];
  objc_msgSend(v12, "privateCloudDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "privateCloudDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "privateCloudDatabase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[FCCKPrivateDatabaseCKProperties initWithContainers:database:databaseWithZoneWidePCS:secureDatabase:]((id *)&v14->super.isa, v13, v15, v16, v17);

  return v18;
}

void __167__FCCKPrivateDatabase_initWithContainerIdentifier_secureContainerIdentifier_productionEnvironment_encryptionDelegate_networkBehaviorMonitor_privateDataSyncingEnabled___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (a1[4])
  {
    objc_msgSend(v3, "addObject:");
    v3 = v4;
  }
  if (a1[5])
  {
    objc_msgSend(v4, "addObject:");
    v3 = v4;
  }
  if (a1[6])
  {
    objc_msgSend(v4, "addObject:");
    v3 = v4;
  }

}

- (id)t_initWithContainers:(void *)a3 database:(void *)a4 databaseWithZoneWidePCS:(void *)a5 secureDatabase:(void *)a6 schema:(void *)a7 middleware:(void *)a8 encryptionDelegate:(void *)a9 networkBehaviorMonitor:
{
  id v16;
  id v17;
  id v18;
  id v19;
  objc_class *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;

  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  if (a1)
  {
    v20 = (objc_class *)MEMORY[0x1E0D60AD0];
    v21 = a9;
    v22 = a8;
    v23 = a7;
    v24 = a6;
    v25 = [v20 alloc];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __152__FCCKPrivateDatabase_t_initWithContainers_database_databaseWithZoneWidePCS_secureDatabase_schema_middleware_encryptionDelegate_networkBehaviorMonitor___block_invoke;
    v28[3] = &unk_1E46437C0;
    v29 = v16;
    v30 = v17;
    v31 = v18;
    v32 = v19;
    v26 = (void *)objc_msgSend(v25, "initWithConstructor:", v28);
    a1 = -[FCCKPrivateDatabase initWithCKProperties:schema:middleware:encryptionDelegate:networkBehaviorMonitor:](a1, v26, v24, v23, v22, v21);

  }
  return a1;
}

id *__152__FCCKPrivateDatabase_t_initWithContainers_database_databaseWithZoneWidePCS_secureDatabase_schema_middleware_encryptionDelegate_networkBehaviorMonitor___block_invoke(void **a1)
{
  return -[FCCKPrivateDatabaseCKProperties initWithContainers:database:databaseWithZoneWidePCS:secureDatabase:]((id *)[FCCKPrivateDatabaseCKProperties alloc], a1[4], a1[5], a1[6], a1[7]);
}

+ (id)testingDatabase
{
  FCCKPrivateDatabase *v2;
  void *v3;

  v2 = [FCCKPrivateDatabase alloc];
  -[FCCKPrivateDatabase t_initWithContainers:database:databaseWithZoneWidePCS:secureDatabase:schema:middleware:encryptionDelegate:networkBehaviorMonitor:]((id *)&v2->super.isa, 0, 0, 0, 0, 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addOperation:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "setDatabase:", a1);
    if (objc_msgSend(v4, "skipPreflight"))
    {
      -[FCCKPrivateDatabase _queueForOperation:]((char *)a1, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addOperation:", v4);

    }
    else
    {
      v6 = objc_msgSend(v4, "qualityOfService");
      v7 = *(void **)(a1 + 88);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __36__FCCKPrivateDatabase_addOperation___block_invoke;
      v8[3] = &unk_1E463D0E0;
      v8[4] = a1;
      v10 = v6;
      v9 = v4;
      FCDispatchAsyncWithQualityOfService(v7, v6, v8);

    }
  }

}

- (char)_queueForOperation:(char *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((objc_msgSend(v3, "skipPreflight") & 1) != 0)
    {
      v5 = 112;
    }
    else
    {
      v6 = objc_msgSend(v4, "relativePriority");
      v5 = 96;
      if (v6 > 0)
        v5 = 104;
    }
    a1 = (char *)*(id *)&a1[v5];
  }

  return a1;
}

void __36__FCCKPrivateDatabase_addOperation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id *v6;
  void (**v7)(void);
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD block[5];
  id v17;

  -[FCCKPrivateDatabase _beginInitialStartUpIfNeeded](*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 152);
  else
    v3 = 0;
  if (FCDispatchGroupIsEmpty(v3))
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__FCCKPrivateDatabase_addOperation___block_invoke_2;
    block[3] = &unk_1E463AD10;
    block[4] = *(_QWORD *)(a1 + 32);
    v6 = &v17;
    v17 = v4;
    FCBlockWithQualityOfService(v5, block);
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = *(void **)(v8 + 152);
      v10 = *(void **)(v8 + 88);
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __36__FCCKPrivateDatabase_addOperation___block_invoke_3;
    v14[3] = &unk_1E463AD10;
    v14[4] = v8;
    v6 = &v15;
    v11 = *(_QWORD *)(a1 + 48);
    v15 = *(id *)(a1 + 40);
    v12 = v10;
    v7 = v9;
    FCBlockWithQualityOfService(v11, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify((dispatch_group_t)v7, v12, v13);

  }
}

- (void)_beginInitialStartUpIfNeeded
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_BYTE *)(a1 + 9))
  {
    v2 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 128);
      v5 = 138412290;
      v6 = v3;
      v4 = v2;
      _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "Starting up with middleware: %@", (uint8_t *)&v5, 0xCu);

    }
    *(_BYTE *)(a1 + 9) = 1;
    -[FCCKPrivateDatabase _continueStartUp](a1);
  }
}

void __36__FCCKPrivateDatabase_addOperation___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 160);
    if (v3 == 2)
    {
LABEL_5:
      objc_msgSend(*(id *)(a1 + 40), "cancel");
      v2 = *(_QWORD *)(a1 + 32);
      goto LABEL_6;
    }
    if (v3 == 1)
    {
      -[FCCKPrivateDatabase _possiblyRetryStartUp](v2);
      if (!*(_QWORD *)(a1 + 32))
      {
        v2 = 0;
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_6:
  -[FCCKPrivateDatabase _queueForOperation:]((char *)v2, *(void **)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", *(_QWORD *)(a1 + 40));

}

- (void)_possiblyRetryStartUp
{
  void *v2;
  double v3;
  double v4;

  if (!*(_BYTE *)(a1 + 11) && *(_QWORD *)(a1 + 160) == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 176));
    v4 = v3;

    if (v4 >= fmin(exp2((double)(unint64_t)(*(_QWORD *)(a1 + 168) - 1)) * 5.0, 60.0))
      -[FCCKPrivateDatabase _continueStartUp](a1);
  }
}

void __36__FCCKPrivateDatabase_addOperation___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 160);
    if (v3 == 2)
    {
LABEL_5:
      objc_msgSend(*(id *)(a1 + 40), "cancel");
      v2 = *(_QWORD *)(a1 + 32);
      goto LABEL_6;
    }
    if (v3 == 1)
    {
      -[FCCKPrivateDatabase _possiblyRetryStartUp](v2);
      if (!*(_QWORD *)(a1 + 32))
      {
        v2 = 0;
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_6:
  -[FCCKPrivateDatabase _queueForOperation:]((char *)v2, *(void **)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", *(_QWORD *)(a1 + 40));

}

- (id)pruningAssistantForZoneName:(id *)a1
{
  id v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20 = v3;
  if (a1)
  {
    v4 = (objc_class *)MEMORY[0x1E0C95098];
    v5 = v3;
    v6 = [v4 alloc];
    v7 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", v5, *MEMORY[0x1E0C94730]);

    -[FCCKPrivateDatabase _serverToClientRecordZoneID:](a1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "zoneName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = a1[24];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v11)
    {
      v12 = v11;
      a1 = 0;
      v13 = MEMORY[0x1E0C81028];
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v16, "canHelpPruneZoneName:", v9))
          {
            if (a1 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't have multiple assistants pruning the same zone"));
              *(_DWORD *)buf = 136315906;
              v26 = "-[FCCKPrivateDatabase pruningAssistantForZoneName:]";
              v27 = 2080;
              v28 = "FCCKPrivateDatabase.m";
              v29 = 1024;
              v30 = 411;
              v31 = 2114;
              v32 = v18;
              _os_log_error_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

            }
            v17 = v16;

            a1 = v17;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v12);
    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

- (void)fetchSecureDatabaseSupportedWithCompletionHandler:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  if (a1)
  {
    -[FCCKPrivateDatabase secureDatabase](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "container");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[FCCKPrivateDatabase secureDatabase](a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "container");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __73__FCCKPrivateDatabase_fetchSecureDatabaseSupportedWithCompletionHandler___block_invoke;
      v8[3] = &unk_1E46437E8;
      v9 = v3;
      objc_msgSend(v7, "accountInfoWithCompletionHandler:", v8);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
    }
  }

}

- (id)secureDatabase
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    v1 = *(id *)(a1 + 72);
    objc_msgSend(v1, "value");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
      v4 = *(void **)(v2 + 24);
    else
      v4 = 0;
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __73__FCCKPrivateDatabase_fetchSecureDatabaseSupportedWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "supportsDeviceToDeviceEncryption"), v5);

}

- (void)enumeratePayloadsWithRecordIDs:(void *)a3 records:(void *)a4 zoneIDs:(void *)a5 zones:(uint64_t)a6 options:(void *)a7 payloadHandler:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void (*v20)(void *, uint64_t, void *);
  void *v21;
  _QWORD aBlock[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke;
    aBlock[3] = &unk_1E46438B0;
    v28 = a6;
    aBlock[4] = a1;
    v23 = v13;
    v24 = v14;
    v25 = v15;
    v26 = v16;
    v27 = v17;
    v18 = _Block_copy(aBlock);
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))v18;
    v20 = (void (*)(void *, uint64_t, void *))*((_QWORD *)v18 + 2);
    if ((a6 & 2) != 0)
    {
      v20(v18, 1, &__block_literal_global_68);
      ((void (**)(_QWORD, uint64_t, void *))v19)[2](v19, 2, &__block_literal_global_123);
      v21 = &__block_literal_global_124;
    }
    else
    {
      v20(v18, 1, &__block_literal_global_125_1);
      v21 = &__block_literal_global_126;
    }
    ((void (**)(_QWORD, uint64_t, void *))v19)[2](v19, 3, v21);

  }
}

void __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke(uint64_t a1, int64_t a2, void *a3)
{
  id v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  FCCKPrivateDatabaseCKPayload *v19;
  FCCKPrivateDatabaseCKPayload *v20;
  int64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  char v27;
  _QWORD v28[4];
  id v29;
  _QWORD aBlock[5];
  id v31;
  uint64_t v32;
  char v33;
  BOOL v34;

  v5 = a3;
  v6 = *(_BYTE *)(a1 + 80);
  v7 = v6 & 1;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_2;
  aBlock[3] = &unk_1E4643810;
  v33 = v6 & 1;
  v9 = *(_QWORD *)(a1 + 32);
  v34 = (v6 & 4) != 0;
  aBlock[4] = v9;
  v21 = a2;
  v32 = a2;
  v10 = v5;
  v31 = v10;
  v28[0] = v8;
  v28[1] = 3221225472;
  v28[2] = __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_3;
  v28[3] = &unk_1E4643838;
  v11 = _Block_copy(aBlock);
  v29 = v11;
  v12 = _Block_copy(v28);
  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_4;
  v25[3] = &unk_1E4643860;
  v27 = v7;
  v25[4] = *(_QWORD *)(a1 + 32);
  v22 = v10;
  v26 = v22;
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_5;
  v23[3] = &unk_1E4643888;
  v13 = _Block_copy(v25);
  v24 = v13;
  v14 = _Block_copy(v23);
  objc_msgSend(*(id *)(a1 + 40), "fc_arrayOfObjectsPassingTest:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "fc_arrayOfObjectsPassingTest:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "fc_arrayOfObjectsPassingTest:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "fc_arrayOfObjectsPassingTest:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count")
    || objc_msgSend(v16, "count")
    || objc_msgSend(v17, "count")
    || objc_msgSend(v18, "count"))
  {
    v19 = objc_alloc_init(FCCKPrivateDatabaseCKPayload);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_recordIDs, v15);
      objc_storeStrong((id *)&v20->_records, v16);
      objc_storeStrong((id *)&v20->_zoneIDs, v17);
      objc_storeStrong((id *)&v20->_zones, v18);
      v20->_destination = v21;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
}

uint64_t __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 56))
  {
    v5 = v3;
  }
  else
  {
    -[FCCKPrivateDatabase _clientToServerRecordZoneID:](*(id *)(a1 + 32), v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (*(_BYTE *)(a1 + 57)
    && (objc_msgSend(v5, "zoneName"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C94A30]),
        v7,
        v8))
  {
    v9 = *(_QWORD *)(a1 + 48) == 3;
  }
  else
  {
    v10 = *(_QWORD **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    if (v10)
      v10 = (_QWORD *)v10[10];
    v12 = v10;
    objc_msgSend(v6, "zoneName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabaseSchema schemaForZoneWithName:](v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v14);

  }
  return v9;
}

- (id)_clientToServerRecordZoneID:(id)a1
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;

  v2 = a1;
  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = a2;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = a2;
    objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:](v2, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject", v8, v9);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

uint64_t __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

uint64_t __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    v5 = v3;
  }
  else
  {
    v5 = *(id *)(a1 + 32);
    if (v5)
    {
      v16 = v3;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = v3;
      objc_msgSend(v6, "arrayWithObjects:count:", &v16, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[FCCKPrivateDatabase _mapRecordIDs:toClient:](v5, v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject", v16, v17);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v10 = *(_QWORD **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  if (v10)
    v10 = (_QWORD *)v10[10];
  v12 = v10;
  -[FCCKPrivateDatabaseSchema schemaForZoneContainingRecordID:](v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v13);

  return v14;
}

uint64_t __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

BOOL __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_6(uint64_t a1, void *a2)
{
  _BYTE *v2;
  _BOOL8 v3;

  v2 = a2;
  if (v2)
  {
    if (v2[10])
      v3 = 0;
    else
      v3 = v2[9] == 0;
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

BOOL __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_7(uint64_t a1, void *a2)
{
  _BYTE *v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = v2 && !v2[10] && v2[9] != 0;

  return v3;
}

BOOL __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return a2 && *(_BYTE *)(a2 + 10) != 0;
}

BOOL __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return !a2 || *(_BYTE *)(a2 + 10) == 0;
}

BOOL __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return a2 && *(_BYTE *)(a2 + 10) != 0;
}

- (void)enumerateActiveDestinationsWithOptions:(void *)a3 handler:
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  if (a1)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v9 = v5;
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
    v5 = v9;
    if (v6 >= 1)
    {
      -[FCCKPrivateDatabase secureDatabase](a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        (*((void (**)(id, uint64_t))v9 + 2))(v9, 3);
      v5 = v9;
      if ((a2 & 2) != 0)
      {
        -[FCCKPrivateDatabase databaseWithZoneWidePCS](a1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v9;
        if (v8)
        {
          (*((void (**)(id, uint64_t))v9 + 2))(v9, 2);
          v5 = v9;
        }
      }
    }
  }

}

- (id)databaseWithZoneWidePCS
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    v1 = *(id *)(a1 + 72);
    objc_msgSend(v1, "value");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
      v4 = *(void **)(v2 + 16);
    else
      v4 = 0;
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)addCKOperation:(uint64_t)a3 destination:
{
  id v5;

  if (a1)
  {
    v5 = a2;
    -[FCCKPrivateDatabase _preflightOperation:](a1, v5);
    -[FCCKPrivateDatabase _addCKOperation:destination:]((uint64_t)a1, v5, a3);

  }
}

- (void)_preflightOperation:(void *)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  _BYTE buf[24];
  __int128 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend(v4, "recordsToSave");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPrivateDatabase _mapRecords:toClient:]((uint64_t)a1, v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRecordsToSave:", v6);

      objc_msgSend(v4, "recordIDsToDelete");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPrivateDatabase _mapRecordIDs:toClient:](a1, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRecordIDsToDelete:", v8);

      objc_msgSend(v4, "perRecordCompletionBlock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CKModifyRecordsOperation.perRecordCompletionBlock is not supported"));
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[FCCKPrivateDatabase _preflightRecordsInModifyOperation:]";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "FCCKPrivateDatabase.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v53) = 821;
        WORD2(v53) = 2114;
        *(_QWORD *)((char *)&v53 + 6) = v39;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      objc_msgSend(v4, "modifyRecordsCompletionBlock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10)
        goto LABEL_15;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __58__FCCKPrivateDatabase__preflightRecordsInModifyOperation___block_invoke;
      *(_QWORD *)&v53 = &unk_1E46438F8;
      *((_QWORD *)&v53 + 1) = a1;
      v54 = v10;
      objc_msgSend(v4, "setModifyRecordsCompletionBlock:", buf);
LABEL_14:

LABEL_15:
LABEL_16:

      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend(v4, "recordIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPrivateDatabase _mapRecordIDs:toClient:](a1, v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRecordIDs:", v13);

      objc_msgSend(v4, "perRecordCompletionBlock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CKFetchRecordsOperation.perRecordCompletionBlock is not supported"));
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[FCCKPrivateDatabase _preflightRecordsInFetchOperation:]";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "FCCKPrivateDatabase.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v53) = 922;
        WORD2(v53) = 2114;
        *(_QWORD *)((char *)&v53 + 6) = v42;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      objc_msgSend(v4, "fetchRecordsCompletionBlock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v14;
      if (!v14)
        goto LABEL_15;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __57__FCCKPrivateDatabase__preflightRecordsInFetchOperation___block_invoke;
      *(_QWORD *)&v53 = &unk_1E463B858;
      *((_QWORD *)&v53 + 1) = a1;
      v54 = v14;
      objc_msgSend(v4, "setFetchRecordsCompletionBlock:", buf);
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend(v4, "recordZonesToSave");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPrivateDatabase _mapZones:toClient:]((uint64_t)a1, v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRecordZonesToSave:", v16);

      objc_msgSend(v4, "recordZoneIDsToDelete");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:](a1, v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRecordZoneIDsToDelete:", v18);

      objc_msgSend(v4, "modifyRecordZonesCompletionBlock");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v19;
      if (!v19)
        goto LABEL_16;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __63__FCCKPrivateDatabase__preflightZoneIDsInModifyZonesOperation___block_invoke;
      *(_QWORD *)&v53 = &unk_1E46438F8;
      *((_QWORD *)&v53 + 1) = a1;
      v54 = v19;
      objc_msgSend(v4, "setModifyRecordZonesCompletionBlock:", buf);
LABEL_24:

      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend(v4, "recordZoneIDs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:](a1, v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRecordZoneIDs:", v21);

      objc_msgSend(v4, "fetchRecordZonesCompletionBlock");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v22;
      if (!v22)
        goto LABEL_16;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __63__FCCKPrivateDatabase__preflightZonesIDsInFetchZonesOperation___block_invoke;
      *(_QWORD *)&v53 = &unk_1E463B858;
      *((_QWORD *)&v53 + 1) = a1;
      v54 = v22;
      objc_msgSend(v4, "setFetchRecordZonesCompletionBlock:", buf);
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend(v4, "recordZoneIDs");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v4, "recordZoneIDs");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:](a1, v24, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setRecordZoneIDs:", v25);

      }
      objc_msgSend(v4, "configurationsByRecordZoneID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = MEMORY[0x1E0C809B0];
      if (v26)
      {
        objc_msgSend(v4, "configurationsByRecordZoneID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v27;
        v51[1] = 3221225472;
        v51[2] = __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke;
        v51[3] = &unk_1E4643920;
        v51[4] = a1;
        objc_msgSend(v28, "fc_dictionaryByTransformingKeysWithBlock:", v51);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setConfigurationsByRecordZoneID:", v29);

      }
      objc_msgSend(v4, "recordChangedBlock");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v30;
      if (v30)
      {
        *(_QWORD *)buf = v27;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_2;
        *(_QWORD *)&v53 = &unk_1E4643948;
        v31 = v30;
        *((_QWORD *)&v53 + 1) = a1;
        v54 = v31;
        objc_msgSend(v4, "setRecordChangedBlock:", buf);

      }
      objc_msgSend(v4, "recordWithIDWasDeletedBlock");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v32;
      if (v32)
      {
        v49[0] = v27;
        v49[1] = 3221225472;
        v49[2] = __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_3;
        v49[3] = &unk_1E4643970;
        v49[4] = a1;
        v50 = v32;
        objc_msgSend(v4, "setRecordWithIDWasDeletedBlock:", v49);

      }
      objc_msgSend(v4, "recordZoneChangeTokensUpdatedBlock");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
      {
        v47[0] = v27;
        v47[1] = 3221225472;
        v47[2] = __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_4;
        v47[3] = &unk_1E4643998;
        v47[4] = a1;
        v48 = v33;
        objc_msgSend(v4, "setRecordZoneChangeTokensUpdatedBlock:", v47);

      }
      objc_msgSend(v4, "recordZoneFetchCompletionBlock");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v35)
      {
        v45[0] = v27;
        v45[1] = 3221225472;
        v45[2] = __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_5;
        v45[3] = &unk_1E46439C0;
        v45[4] = a1;
        v46 = v35;
        objc_msgSend(v4, "setRecordZoneFetchCompletionBlock:", v45);

      }
      objc_msgSend(v4, "fetchRecordZoneChangesCompletionBlock");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        v43[0] = v27;
        v43[1] = 3221225472;
        v43[2] = __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_6;
        v43[3] = &unk_1E463D3F8;
        v43[4] = a1;
        v44 = v37;
        objc_msgSend(v4, "setFetchRecordZoneChangesCompletionBlock:", v43);

      }
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[FCCKPrivateDatabase _preflightRecordsInDatabaseChangesOperation:]((uint64_t)a1, v3);
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't handle queries on the private database"));
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCCKPrivateDatabase _preflightOperation:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCCKPrivateDatabase.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v53) = 797;
      WORD2(v53) = 2114;
      *(_QWORD *)((char *)&v53 + 6) = v40;
      v41 = MEMORY[0x1E0C81028];
LABEL_46:
      _os_log_error_impl(&dword_1A1B90000, v41, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("all CK operations MUST go through database preflight"));
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[FCCKPrivateDatabase _preflightOperation:]";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "FCCKPrivateDatabase.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v53) = 809;
        WORD2(v53) = 2114;
        *(_QWORD *)((char *)&v53 + 6) = v40;
        v41 = MEMORY[0x1E0C81028];
        goto LABEL_46;
      }
    }
  }
LABEL_17:

}

- (void)_addCKOperation:(uint64_t)a3 destination:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = *(id *)(a1 + 136);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v23;
      while (2)
      {
        v11 = 0;
        v12 = v9;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
          v21 = v12;
          v14 = objc_msgSend(v13, "database:willEnqueueOperation:error:", a1, v5, &v21);
          v9 = v21;

          if (v14 == 2)
          {
LABEL_24:

            goto LABEL_25;
          }
          if (v14 == 1)
          {

            objc_msgSend(v5, "cancelWithUnderlyingError:", v9);
            goto LABEL_14;
          }
          ++v11;
          v12 = v9;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
        if (v8)
          continue;
        break;
      }

    }
    else
    {

      v9 = 0;
    }
LABEL_14:
    switch(a3)
    {
      case 0:
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          break;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case unsupported"));
        *(_DWORD *)buf = 136315906;
        v27 = "-[FCCKPrivateDatabase _addCKOperation:destination:]";
        v28 = 2080;
        v29 = "FCCKPrivateDatabase.m";
        v30 = 1024;
        v31 = 759;
        v32 = 2114;
        v33 = v15;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        goto LABEL_20;
      case 1:
        v17 = *(id *)(a1 + 72);
        objc_msgSend(v17, "value");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = *(void **)(v18 + 8);
        else
          v20 = 0;
        v6 = v20;

        objc_msgSend(v6, "addOperation:", v5);
        goto LABEL_24;
      case 2:
        -[FCCKPrivateDatabase databaseWithZoneWidePCS](a1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      case 3:
        -[FCCKPrivateDatabase secureDatabase](a1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v15 = v16;
        objc_msgSend(v16, "addOperation:", v5);
LABEL_20:

        break;
      default:
        break;
    }
LABEL_25:

  }
}

- (void)_continueStartUp
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    *(_BYTE *)(a1 + 11) = 1;
    if (objc_msgSend(*(id *)(a1 + 128), "count"))
    {
      v2 = *(id *)(a1 + 128);
      objc_msgSend(v2, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = (void *)FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        v5 = v4;
        *(_DWORD *)buf = 138412290;
        v12 = (id)objc_opt_class();
        v6 = v12;
        _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Performing startup for middleware: %@", buf, 0xCu);

      }
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __39__FCCKPrivateDatabase__continueStartUp__block_invoke;
      v8[3] = &unk_1E463B318;
      v9 = v3;
      v10 = a1;
      v7 = v3;
      objc_msgSend(v7, "performStartUpForDatabase:completion:", a1, v8);

    }
    else
    {
      -[FCCKPrivateDatabase _finishStartUpWithError:](a1, 0);
    }
  }
}

- (void)t_performStartUpWithCompletion:(uint64_t)a1
{
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];

  if (a1)
  {
    v3 = *(NSObject **)(a1 + 88);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__FCCKPrivateDatabase_t_performStartUpWithCompletion___block_invoke;
    block[3] = &unk_1E463AB18;
    block[4] = a1;
    v4 = a2;
    dispatch_async(v3, block);
    v5 = *(void **)(a1 + 152);
    v6 = *(NSObject **)(a1 + 88);
    v7 = v5;
    dispatch_group_notify(v7, v6, v4);

  }
}

void __54__FCCKPrivateDatabase_t_performStartUpWithCompletion___block_invoke(uint64_t a1)
{
  -[FCCKPrivateDatabase _beginInitialStartUpIfNeeded](*(_QWORD *)(a1 + 32));
}

void __39__FCCKPrivateDatabase__continueStartUp__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 138412546;
    v14 = (id)objc_opt_class();
    v15 = 2112;
    v16 = v3;
    v6 = v14;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Finished startup for middleware: %@, result error %@", buf, 0x16u);

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    v8 = *(void **)(v7 + 88);
  else
    v8 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__FCCKPrivateDatabase__continueStartUp__block_invoke_128;
  v10[3] = &unk_1E463AD10;
  v11 = v3;
  v12 = v7;
  v9 = v3;
  FCDispatchAsyncWithQualityOfService(v8, 25, v10);

}

void __39__FCCKPrivateDatabase__continueStartUp__block_invoke_128(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    -[FCCKPrivateDatabase _finishStartUpWithError:](v2, v3);
  }
  else
  {
    if (v2)
      v4 = *(void **)(v2 + 128);
    else
      v4 = 0;
    v5 = v4;
    objc_msgSend(v5, "fc_arrayByRemovingFirstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      objc_storeStrong((id *)(v7 + 128), v6);

    -[FCCKPrivateDatabase _continueStartUp](*(_QWORD *)(a1 + 40));
  }
}

- (void)_finishStartUpWithError:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  uint64_t started;
  uint64_t v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = FCPrivateDataEncryptionLog;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
      {
        v5 = CFSTR("disabled");
        if (*(uint64_t *)(a1 + 40) > 0)
          v5 = CFSTR("enabled");
        v13 = 138543618;
        v14 = v5;
        v15 = 2114;
        v16 = v3;
        _os_log_error_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_ERROR, "Private database startup failed with encryption %{public}@, error: %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      if (v6 <= 0)
        v7 = CFSTR("disabled");
      else
        v7 = CFSTR("enabled");
      v8 = v4;
      FCCKPrivateDatabaseVersionString(v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "Private database startup succeeded with encryption %{public}@, version=%{public}@", (uint8_t *)&v13, 0x16u);

    }
    started = FCCKDatabaseStartUpResultFromError(v3);
    if (started == 2)
      -[FCCKPrivateDatabase _possiblySimulateCrashForError:message:](v3, CFSTR("Private database startup failed with fatal error"));
    *(_BYTE *)(a1 + 11) = 0;
    *(_QWORD *)(a1 + 160) = started;
    if (!*(_BYTE *)(a1 + 10))
    {
      *(_BYTE *)(a1 + 10) = 1;
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 152));
    }
    if (started)
    {
      ++*(_QWORD *)(a1 + 168);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 176);
      *(_QWORD *)(a1 + 176) = v11;

    }
  }

}

- (void)_preflightRecordsInDatabaseChangesOperation:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v3 = a2;
  objc_msgSend(v3, "recordZoneWithIDChangedBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__FCCKPrivateDatabase__preflightRecordsInDatabaseChangesOperation___block_invoke;
    v15[3] = &unk_1E46439E8;
    v15[4] = a1;
    v16 = v4;
    objc_msgSend(v3, "setRecordZoneWithIDChangedBlock:", v15);

  }
  objc_msgSend(v3, "recordZoneWithIDWasDeletedBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __67__FCCKPrivateDatabase__preflightRecordsInDatabaseChangesOperation___block_invoke_2;
    v13[3] = &unk_1E46439E8;
    v13[4] = a1;
    v14 = v7;
    objc_msgSend(v3, "setRecordZoneWithIDWasDeletedBlock:", v13);

  }
  objc_msgSend(v3, "fetchDatabaseChangesCompletionBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __67__FCCKPrivateDatabase__preflightRecordsInDatabaseChangesOperation___block_invoke_3;
    v11[3] = &unk_1E4643A10;
    v11[4] = a1;
    v12 = v9;
    objc_msgSend(v3, "setFetchDatabaseChangesCompletionBlock:", v11);

  }
}

- (id)_mapRecords:(char)a3 toClient:
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  char v12;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if ((a3 & 1) == 0)
    {
      v7 = v5;
      v8 = *(id *)(a1 + 80);
      if (v8)
      {

      }
      else if (*(uint64_t *)(a1 + 40) <= 0)
      {
        NSClassFromString(CFSTR("XCTest"));
      }

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44__FCCKPrivateDatabase__mapRecords_toClient___block_invoke;
    v11[3] = &unk_1E4643AD8;
    v12 = a3;
    v11[4] = a1;
    -[FCCKPrivateDatabase _mapObjects:toClient:withBlock:](a1, v6, a3, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_mapRecordIDs:(char)a3 toClient:
{
  _QWORD v4[5];
  char v5;

  if (a1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __46__FCCKPrivateDatabase__mapRecordIDs_toClient___block_invoke;
    v4[3] = &unk_1E4643A88;
    v5 = a3;
    v4[4] = a1;
    -[FCCKPrivateDatabase _mapObjects:toClient:withBlock:]((uint64_t)a1, a2, a3, v4);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __58__FCCKPrivateDatabase__preflightRecordsInModifyOperation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = a4;
  v9 = a3;
  -[FCCKPrivateDatabase _mapRecords:toClient:](v7, a2, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabase _mapRecordIDs:toClient:](*(void **)(a1 + 32), v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCCKPrivateDatabase _serverToClientError:](*(_QWORD *)(a1 + 32), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_serverToClientError:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C947D8]);

      if (v8)
      {
        objc_msgSend(v6, "userInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *MEMORY[0x1E0C94940];
        objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *MEMORY[0x1E0C949A8];
        objc_msgSend(v9, "objectForKeyedSubscript:");
        v12 = objc_claimAutoreleasedReturnValue();
        v33 = *MEMORY[0x1E0C949B8];
        objc_msgSend(v9, "objectForKeyedSubscript:");
        v13 = objc_claimAutoreleasedReturnValue();
        v34 = *MEMORY[0x1E0C949B0];
        objc_msgSend(v9, "objectForKeyedSubscript:");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        v16 = (void *)v12;
        if (v11)
          v17 = 0;
        else
          v17 = v12 == 0;
        v18 = (void *)v13;
        if (!v17 || v13 != 0 || v14 != 0)
        {
          v21 = (void *)objc_msgSend(v9, "mutableCopy");
          v31 = v11;
          if (v11)
          {
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __44__FCCKPrivateDatabase__serverToClientError___block_invoke;
            v35[3] = &unk_1E4643B50;
            v35[4] = a1;
            objc_msgSend(v11, "fc_dictionaryByTransformingKeysWithBlock:", v35);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v10);

          }
          v23 = v21;
          if (v16)
          {
            -[FCCKPrivateDatabase _serverToClientRecord:](a1, v16);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, v32);

          }
          if (v18)
          {
            -[FCCKPrivateDatabase _serverToClientRecord:](a1, v18);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, v33);

          }
          if (v15)
          {
            -[FCCKPrivateDatabase _serverToClientRecord:](a1, v15);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, v34);

          }
          v27 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v6, "domain");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, objc_msgSend(v6, "code"), v23);
          v29 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v29;
          v11 = v31;
        }

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_mapRecordZoneIDs:(char)a3 toClient:
{
  if (a1)
  {
    -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:expectUnknownZones:]((uint64_t)a1, a2, a3, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke(uint64_t a1, void *a2)
{
  return -[FCCKPrivateDatabase _clientToServerRecordZoneID:](*(id *)(a1 + 32), a2);
}

void __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  -[FCCKPrivateDatabase _serverToClientRecord:](*(_QWORD *)(a1 + 32), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)_serverToClientRecord:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabase _mapRecords:toClient:](a1, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  v8 = a2;
  -[FCCKPrivateDatabase _clientRecordID:](v6, v8);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  v10 = v8;
  if (v9)
  {
    v19[0] = v7;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = v7;
    objc_msgSend(v11, "arrayWithObjects:count:", v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__FCCKPrivateDatabase__serverToClientRecordType_withRecordID___block_invoke;
    v16[3] = &unk_1E4643B28;
    v17 = v10;
    v18 = v9;
    -[FCCKPrivateDatabase _mapObjects:toClient:withBlock:]((uint64_t)v9, v13, 1, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v15, v9);

}

- (id)_clientRecordID:(id)a1
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;

  v2 = a1;
  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = a2;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = a2;
    objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCCKPrivateDatabase _mapRecordIDs:toClient:](v2, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject", v8, v9);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

void __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = a4;
  v9 = a3;
  -[FCCKPrivateDatabase _serverToClientRecordZoneID:](v7, a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, id))(v6 + 16))(v6, v10, v9, v8);

}

- (id)_serverToClientRecordZoneID:(id)a1
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;

  v2 = a1;
  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = a2;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = a2;
    objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:](v2, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject", v8, v9);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

void __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v12 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v13 = a6;
  v14 = a4;
  v15 = a3;
  -[FCCKPrivateDatabase _serverToClientRecordZoneID:](v12, a2);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabase _serverToClientError:](*(_QWORD *)(a1 + 32), v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, id, id, uint64_t, void *))(v11 + 16))(v11, v17, v15, v14, a5, v16);
}

void __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  -[FCCKPrivateDatabase _serverToClientError:](*(_QWORD *)(a1 + 32), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __67__FCCKPrivateDatabase__preflightRecordsInDatabaseChangesOperation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  -[FCCKPrivateDatabase _serverToClientRecordZoneID:expectUnknownZones:](*(id *)(a1 + 32), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)_serverToClientRecordZoneID:(id)a1 expectUnknownZones:(void *)a2
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;

  v2 = a1;
  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = a2;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = a2;
    objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:expectUnknownZones:]((uint64_t)v2, v5, 1, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject", v8, v9);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

void __67__FCCKPrivateDatabase__preflightRecordsInDatabaseChangesOperation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  -[FCCKPrivateDatabase _serverToClientRecordZoneID:expectUnknownZones:](*(id *)(a1 + 32), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __67__FCCKPrivateDatabase__preflightRecordsInDatabaseChangesOperation___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = a2;
  -[FCCKPrivateDatabase _serverToClientError:](v7, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, id))(v6 + 16))(v6, v8, a3, v9);

}

void __57__FCCKPrivateDatabase__preflightRecordsInFetchOperation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__FCCKPrivateDatabase__preflightRecordsInFetchOperation___block_invoke_2;
  v11[3] = &unk_1E4643A38;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v10 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

  -[FCCKPrivateDatabase _serverToClientError:](*(_QWORD *)(a1 + 32), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __57__FCCKPrivateDatabase__preflightRecordsInFetchOperation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  -[FCCKPrivateDatabase _clientRecordID:](v5, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabase _serverToClientRecord:](*(_QWORD *)(a1 + 32), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v9);

}

void __63__FCCKPrivateDatabase__preflightZonesIDsInFetchZonesOperation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v8 = a2;
  -[FCCKPrivateDatabase _serverToClientError:](*(_QWORD *)(a1 + 32), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__FCCKPrivateDatabase__preflightZonesIDsInFetchZonesOperation___block_invoke_2;
    v9[3] = &unk_1E4643A60;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v7 = v6;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __63__FCCKPrivateDatabase__preflightZonesIDsInFetchZonesOperation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  -[FCCKPrivateDatabase _serverToClientRecordZoneID:](v5, a2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = v8;
  v10 = 0;
  if (v8 && v7)
  {
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabase _mapZones:toClient:](v7, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v13 && v10)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v13);

}

- (id)_mapZones:(char)a3 toClient:
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  char v12;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if ((a3 & 1) == 0)
    {
      v7 = v5;
      v8 = *(id *)(a1 + 80);
      if (v8)
      {

      }
      else if (*(uint64_t *)(a1 + 40) <= 0)
      {
        NSClassFromString(CFSTR("XCTest"));
      }

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__FCCKPrivateDatabase__mapZones_toClient___block_invoke;
    v11[3] = &unk_1E4643B00;
    v12 = a3;
    v11[4] = a1;
    -[FCCKPrivateDatabase _mapObjects:toClient:withBlock:](a1, v6, a3, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __63__FCCKPrivateDatabase__preflightZoneIDsInModifyZonesOperation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = a4;
  v9 = a3;
  -[FCCKPrivateDatabase _mapZones:toClient:](v7, a2, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:](*(void **)(a1 + 32), v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCCKPrivateDatabase _serverToClientError:](*(_QWORD *)(a1 + 32), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __46__FCCKPrivateDatabase__mapRecordIDs_toClient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    v13 = 0;
    objc_msgSend(a3, "serverToClientRecordID:inDatabase:error:", v5, v6, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (!v7)
    {
      v9 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v5;
        v16 = 2114;
        v17 = v8;
        v10 = "Failed to map server record ID %{public}@ to client with error: %{public}@";
LABEL_10:
        _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v12 = 0;
    objc_msgSend(a3, "clientToServerRecordID:inDatabase:error:", v5, v6, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if (!v7)
    {
      v9 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v5;
        v16 = 2114;
        v17 = v8;
        v10 = "Failed to map client record ID %{public}@ to server with error: %{public}@";
        goto LABEL_10;
      }
LABEL_7:
      v7 = 0;
    }
  }

  return v7;
}

- (id)_mapObjects:(char)a3 toClient:(void *)a4 withBlock:
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v22;
  id obj;
  uint64_t v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v26 = *(id *)(a1 + 144);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v24 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "copy");
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        if ((a3 & 1) != 0)
        {
          objc_msgSend(v26, "reverseObjectEnumerator");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = v26;
        }
        v13 = v12;
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v28;
LABEL_11:
          v17 = 0;
          v18 = (void *)v11;
          while (1)
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(v13);
            v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17);
            v20 = (void *)MEMORY[0x1A8580B64]();
            v7[2](v7, v18, v19);
            v11 = objc_claimAutoreleasedReturnValue();

            objc_autoreleasePoolPop(v20);
            if (!v11)
              break;
            ++v17;
            v18 = (void *)v11;
            if (v15 == v17)
            {
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              if (v15)
                goto LABEL_11;

              goto LABEL_19;
            }
          }
        }
        else
        {

          if (!v11)
            continue;
LABEL_19:
          objc_msgSend(v22, "addObject:", v11);
          v13 = (void *)v11;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v9);
  }

  return v22;
}

- (id)_mapRecordZoneIDs:(char)a3 toClient:(char)a4 expectUnknownZones:
{
  _QWORD v5[5];
  char v6;
  char v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__FCCKPrivateDatabase__mapRecordZoneIDs_toClient_expectUnknownZones___block_invoke;
  v5[3] = &unk_1E4643AB0;
  v6 = a3;
  v5[4] = a1;
  v7 = a4;
  -[FCCKPrivateDatabase _mapObjects:toClient:withBlock:](a1, a2, a3, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __69__FCCKPrivateDatabase__mapRecordZoneIDs_toClient_expectUnknownZones___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  const char *v13;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C94A30]);

  if (!v8)
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 40))
    {
      v16 = 0;
      objc_msgSend(v6, "serverToClientRecordZoneID:inDatabase:error:", v5, v10, &v16);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v16;
      if (v9)
        goto LABEL_11;
      if (*(_BYTE *)(a1 + 41))
        goto LABEL_11;
      v12 = FCPrivateDataEncryptionLog;
      if (!os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 138543618;
      v18 = v5;
      v19 = 2114;
      v20 = v11;
      v13 = "Failed to map server record zone ID %{public}@ to client with error: %{public}@";
    }
    else
    {
      v15 = 0;
      objc_msgSend(v6, "clientToServerRecordZoneID:inDatabase:error:", v5, v10, &v15);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v15;
      if (v9)
        goto LABEL_11;
      if (*(_BYTE *)(a1 + 41))
        goto LABEL_11;
      v12 = FCPrivateDataEncryptionLog;
      if (!os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 138543618;
      v18 = v5;
      v19 = 2114;
      v20 = v11;
      v13 = "Failed to map client record zone ID %{public}@ to server with error: %{public}@";
    }
    _os_log_error_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);
LABEL_11:

    goto LABEL_12;
  }
  v9 = v5;
LABEL_12:

  return v9;
}

- (id)_clientToServerRecord:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabase _mapRecords:toClient:](a1, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __44__FCCKPrivateDatabase__mapRecords_toClient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    v13 = 0;
    objc_msgSend(a3, "serverToClientRecord:inDatabase:error:", v5, v6, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (!v7)
    {
      v9 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v5;
        v16 = 2114;
        v17 = v8;
        v10 = "Failed to map server record %{public}@ to client with error: %{public}@";
LABEL_10:
        _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v12 = 0;
    objc_msgSend(a3, "clientToServerRecord:inDatabase:error:", v5, v6, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if (!v7)
    {
      v9 = FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v5;
        v16 = 2114;
        v17 = v8;
        v10 = "Failed to map client record %{public}@ to server with error: %{public}@";
        goto LABEL_10;
      }
LABEL_7:
      v7 = 0;
    }
  }

  return v7;
}

id __42__FCCKPrivateDatabase__mapZones_toClient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  const char *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C94A30]);

  if (!v9)
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 40))
    {
      v17 = 0;
      objc_msgSend(v6, "serverToClientRecordZone:inDatabase:error:", v5, v11, &v17);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v17;
      if (v10)
        goto LABEL_9;
      v13 = FCPrivateDataEncryptionLog;
      if (!os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      *(_DWORD *)buf = 138543618;
      v19 = v5;
      v20 = 2114;
      v21 = v12;
      v14 = "Failed to map server record zone %{public}@ to client with error: %{public}@";
    }
    else
    {
      v16 = 0;
      objc_msgSend(v6, "clientToServerRecordZone:inDatabase:error:", v5, v11, &v16);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v16;
      if (v10)
        goto LABEL_9;
      v13 = FCPrivateDataEncryptionLog;
      if (!os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      *(_DWORD *)buf = 138543618;
      v19 = v5;
      v20 = 2114;
      v21 = v12;
      v14 = "Failed to map client record zone %{public}@ to server with error: %{public}@";
    }
    _os_log_error_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
LABEL_9:

    goto LABEL_10;
  }
  v10 = v5;
LABEL_10:

  return v10;
}

id __62__FCCKPrivateDatabase__serverToClientRecordType_withRecordID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  objc_msgSend(a3, "serverToClientRecordType:withRecordID:inDatabase:error:", v5, v6, v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (!v8)
  {
    v10 = FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v15 = v5;
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v9;
      _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "Failed to map server record type %{public}@ and ID %{public}@ to client with error: %{public}@", buf, 0x20u);
    }
  }

  return v8;
}

id __44__FCCKPrivateDatabase__serverToClientError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[FCCKPrivateDatabase _clientRecordID:](*(id *)(a1 + 32), v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[FCCKPrivateDatabase _serverToClientRecordZoneID:](*(id *)(a1 + 32), v3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = v3;
    }
  }
  v5 = v4;

  return v5;
}

- (_QWORD)zoneIDsUsingSecureContainer
{
  _QWORD *v1;
  void *v2;
  id *v3;
  uint64_t v4;
  id v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  _QWORD *v12;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id *)v1[10];
    v4 = v1[5];
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __50__FCCKPrivateDatabase_zoneIDsUsingSecureContainer__block_invoke;
    v10 = &unk_1E4643B78;
    v11 = v2;
    v12 = v1;
    v5 = v2;
    -[FCCKPrivateDatabaseSchema enumerateZoneSchemasForVersion:withBlock:](v3, v4, &v7);
    objc_msgSend(v5, "allObjects", v7, v8, v9, v10);
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

void __50__FCCKPrivateDatabase_zoneIDsUsingSecureContainer__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  FCCKRecordZoneIDMapping *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id *v19;

  v3 = a2;
  if (v3 && *((_BYTE *)v3 + 10))
  {
    v19 = v3;
    v4 = objc_alloc(MEMORY[0x1E0C95098]);
    v5 = v19[2];
    v6 = *MEMORY[0x1E0C94730];
    v7 = (void *)objc_msgSend(v4, "initWithZoneName:ownerName:", v5, *MEMORY[0x1E0C94730]);

    objc_msgSend(v7, "zoneName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C94A30]);

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
    else
    {
      v10 = *(_QWORD *)(a1 + 40);
      if (v10)
        v11 = *(FCCKRecordZoneIDMapping **)(v10 + 80);
      else
        v11 = 0;
      -[FCCKPrivateDatabaseSchema mappingFromRecordZoneID:toVersion:](v11, v7, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc(MEMORY[0x1E0C95098]);
      objc_msgSend(v12, "toZoneSchema");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v14)
        v16 = *(void **)(v14 + 16);
      else
        v16 = 0;
      v17 = v16;
      v18 = (void *)objc_msgSend(v13, "initWithZoneName:ownerName:", v17, v6);

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v18);
    }

    v3 = v19;
  }

}

- (void)takeDatabaseOfflineDueToError:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v8 = v3;
      _os_log_error_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_ERROR, "Taking database offline due to error: %{public}@", buf, 0xCu);
    }
    v5 = *(NSObject **)(a1 + 88);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__FCCKPrivateDatabase_takeDatabaseOfflineDueToError___block_invoke;
    block[3] = &unk_1E463AB18;
    block[4] = a1;
    dispatch_sync(v5, block);
  }

}

uint64_t __53__FCCKPrivateDatabase_takeDatabaseOfflineDueToError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 96);
  else
    v3 = 0;
  objc_msgSend(v3, "cancelAllOperations");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 104);
  else
    v5 = 0;
  result = objc_msgSend(v5, "cancelAllOperations");
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    *(_QWORD *)(v7 + 160) = 2;
  return result;
}

- (void)reportRecoverableStartUpError:(uint64_t)a1
{
  if (a1)
    -[FCCKPrivateDatabase _possiblySimulateCrashForError:message:](a2, CFSTR("Private database startup failed with recoverable error"));
}

- (void)_possiblySimulateCrashForError:(void *)a1 message:(void *)a2
{
  id v3;
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "BOOLForKey:", CFSTR("disable_simulated_crashes_for_encryption")) & 1) != 0
      || NSClassFromString(CFSTR("XCTest")))
    {

    }
    else
    {
      v6 = FCShouldErrorBeExcludedFromSimulatedCrashes(v3);

      if ((v6 & 1) == 0)
      {
        v7 = FCPrivateDataEncryptionCrashLog;
        if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionCrashLog, OS_LOG_TYPE_INFO))
        {
          v8 = 138543618;
          v9 = v4;
          v10 = 2114;
          v11 = v3;
          _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
          v7 = FCPrivateDataEncryptionCrashLog;
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          v8 = 138543618;
          v9 = v4;
          v10 = 2114;
          v11 = v3;
          _os_log_fault_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
        }
      }
    }
  }

}

- (void)reportEncryptionMigrationError:(uint64_t)a1
{
  if (a1)
    -[FCCKPrivateDatabase _possiblySimulateCrashForError:message:](a2, CFSTR("Private database encryption migration failed with error"));
}

- (void)reportPostMigrationCleanupError:(uint64_t)a1
{
  if (a1)
    -[FCCKPrivateDatabase _possiblySimulateCrashForError:message:](a2, CFSTR("Private database encryption data cleanup failed with error"));
}

+ (id)recordSchemas
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  void *v444;
  void *v445;
  void *v446;
  void *v447;
  void *v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v472;
  void *v473;
  void *v474;
  void *v475;
  void *v476;
  void *v477;
  void *v478;
  void *v479;
  void *v480;
  void *v481;
  void *v482;
  void *v483;
  void *v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  void *v496;
  void *v497;
  void *v498;
  void *v499;
  void *v500;
  void *v501;
  void *v502;
  void *v503;
  void *v504;
  void *v505;
  void *v506;
  void *v507;
  void *v508;
  void *v509;
  void *v510;
  void *v511;
  void *v512;
  void *v513;
  void *v514;
  void *v515;
  void *v516;
  void *v517;
  _QWORD v518[3];
  _QWORD v519[43];
  _QWORD v520[43];
  _QWORD v521[43];
  _QWORD v522[3];
  _QWORD v523[3];
  _QWORD v524[9];
  _QWORD v525[9];
  _QWORD v526[9];
  _QWORD v527[12];
  _QWORD v528[12];
  _QWORD v529[12];
  _QWORD v530[12];
  _QWORD v531[5];
  _QWORD v532[5];
  _QWORD v533[5];
  _QWORD v534[8];
  _QWORD v535[2];
  void *v536;
  _QWORD v537[5];
  _QWORD v538[5];
  _QWORD v539[5];
  _QWORD v540[23];
  _QWORD v541[23];
  _QWORD v542[23];
  _QWORD v543[5];
  _QWORD v544[5];
  _QWORD v545[18];
  _QWORD v546[18];
  _QWORD v547[18];
  _QWORD v548[4];
  _QWORD v549[4];
  _QWORD v550[10];
  _QWORD v551[10];
  _QWORD v552[10];
  _QWORD v553[5];
  _QWORD v554[5];
  _QWORD v555[5];
  _QWORD v556[40];

  v556[38] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleID"), 0);
  v490 = (void *)objc_claimAutoreleasedReturnValue();
  v555[0] = v490;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("dateAdded"), 0);
  v489 = (void *)objc_claimAutoreleasedReturnValue();
  v555[1] = v489;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("order"), 0);
  v488 = (void *)objc_claimAutoreleasedReturnValue();
  v555[2] = v488;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v487 = (void *)objc_claimAutoreleasedReturnValue();
  v555[3] = v487;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v486 = (void *)objc_claimAutoreleasedReturnValue();
  v555[4] = v486;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v555, 5);
  v485 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("AudioPlaylistItem"), v485);
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  v556[0] = v484;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleID"), 1);
  v483 = (void *)objc_claimAutoreleasedReturnValue();
  v554[0] = v483;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("dateAdded"), 1);
  v482 = (void *)objc_claimAutoreleasedReturnValue();
  v554[1] = v482;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("order"), 0);
  v481 = (void *)objc_claimAutoreleasedReturnValue();
  v554[2] = v481;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v480 = (void *)objc_claimAutoreleasedReturnValue();
  v554[3] = v480;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v479 = (void *)objc_claimAutoreleasedReturnValue();
  v554[4] = v479;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v554, 5);
  v478 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("AudioPlaylistItemSecure"), v478);
  v477 = (void *)objc_claimAutoreleasedReturnValue();
  v556[1] = v477;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleID"), 1);
  v476 = (void *)objc_claimAutoreleasedReturnValue();
  v553[0] = v476;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("dateAdded"), 1);
  v475 = (void *)objc_claimAutoreleasedReturnValue();
  v553[1] = v475;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("order"), 1);
  v474 = (void *)objc_claimAutoreleasedReturnValue();
  v553[2] = v474;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 1);
  v473 = (void *)objc_claimAutoreleasedReturnValue();
  v553[3] = v473;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 1);
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  v553[4] = v472;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v553, 5);
  v471 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("AudioPlaylistItemSecure2"), v471);
  v470 = (void *)objc_claimAutoreleasedReturnValue();
  v556[2] = v470;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("issueID"), 0);
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  v552[0] = v469;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastVisited"), 0);
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  v552[1] = v468;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastBadged"), 0);
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  v552[2] = v467;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastEngaged"), 0);
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  v552[3] = v466;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastSeen"), 0);
  v465 = (void *)objc_claimAutoreleasedReturnValue();
  v552[4] = v465;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastRemovedFromMyMagazines"), 0);
  v464 = (void *)objc_claimAutoreleasedReturnValue();
  v552[5] = v464;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastVisitedArticleID"), 0);
  v463 = (void *)objc_claimAutoreleasedReturnValue();
  v552[6] = v463;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastVisitedPageID"), 0);
  v462 = (void *)objc_claimAutoreleasedReturnValue();
  v552[7] = v462;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v461 = (void *)objc_claimAutoreleasedReturnValue();
  v552[8] = v461;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  v552[9] = v460;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v552, 10);
  v459 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("IssueReadingHistoryItem"), v459);
  v458 = (void *)objc_claimAutoreleasedReturnValue();
  v556[3] = v458;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("issueID"), 1);
  v457 = (void *)objc_claimAutoreleasedReturnValue();
  v551[0] = v457;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastVisited"), 0);
  v456 = (void *)objc_claimAutoreleasedReturnValue();
  v551[1] = v456;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastBadged"), 0);
  v455 = (void *)objc_claimAutoreleasedReturnValue();
  v551[2] = v455;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastEngaged"), 0);
  v454 = (void *)objc_claimAutoreleasedReturnValue();
  v551[3] = v454;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastSeen"), 0);
  v453 = (void *)objc_claimAutoreleasedReturnValue();
  v551[4] = v453;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastRemovedFromMyMagazines"), 0);
  v452 = (void *)objc_claimAutoreleasedReturnValue();
  v551[5] = v452;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastVisitedArticleID"), 1);
  v451 = (void *)objc_claimAutoreleasedReturnValue();
  v551[6] = v451;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastVisitedPageID"), 1);
  v450 = (void *)objc_claimAutoreleasedReturnValue();
  v551[7] = v450;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  v551[8] = v449;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v448 = (void *)objc_claimAutoreleasedReturnValue();
  v551[9] = v448;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v551, 10);
  v447 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("IssueReadingHistoryItemSecure"), v447);
  v446 = (void *)objc_claimAutoreleasedReturnValue();
  v556[4] = v446;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("issueID"), 1);
  v445 = (void *)objc_claimAutoreleasedReturnValue();
  v550[0] = v445;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastVisited"), 1);
  v444 = (void *)objc_claimAutoreleasedReturnValue();
  v550[1] = v444;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastBadged"), 1);
  v443 = (void *)objc_claimAutoreleasedReturnValue();
  v550[2] = v443;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastEngaged"), 1);
  v442 = (void *)objc_claimAutoreleasedReturnValue();
  v550[3] = v442;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastSeen"), 1);
  v441 = (void *)objc_claimAutoreleasedReturnValue();
  v550[4] = v441;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastRemovedFromMyMagazines"), 1);
  v440 = (void *)objc_claimAutoreleasedReturnValue();
  v550[5] = v440;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastVisitedArticleID"), 1);
  v439 = (void *)objc_claimAutoreleasedReturnValue();
  v550[6] = v439;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastVisitedPageID"), 1);
  v438 = (void *)objc_claimAutoreleasedReturnValue();
  v550[7] = v438;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 1);
  v437 = (void *)objc_claimAutoreleasedReturnValue();
  v550[8] = v437;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 1);
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  v550[9] = v436;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v550, 10);
  v435 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("IssueReadingHistoryItemSecure2"), v435);
  v434 = (void *)objc_claimAutoreleasedReturnValue();
  v556[5] = v434;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("data"), 0);
  v433 = (void *)objc_claimAutoreleasedReturnValue();
  v549[0] = v433;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("version"), 0);
  v432 = (void *)objc_claimAutoreleasedReturnValue();
  v549[1] = v432;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v431 = (void *)objc_claimAutoreleasedReturnValue();
  v549[2] = v431;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  v549[3] = v430;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v549, 4);
  v429 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("PersonalizationProfile"), v429);
  v428 = (void *)objc_claimAutoreleasedReturnValue();
  v556[6] = v428;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("data"), 1);
  v427 = (void *)objc_claimAutoreleasedReturnValue();
  v548[0] = v427;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("version"), 0);
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  v548[1] = v426;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  v548[2] = v425;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v424 = (void *)objc_claimAutoreleasedReturnValue();
  v548[3] = v424;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v548, 4);
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("PersonalizationProfileSecure"), v423);
  v422 = (void *)objc_claimAutoreleasedReturnValue();
  v556[7] = v422;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v421 = (void *)objc_claimAutoreleasedReturnValue();
  v547[0] = v421;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v420 = (void *)objc_claimAutoreleasedReturnValue();
  v547[1] = v420;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleID"), 0);
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  v547[2] = v419;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleTypeID"), 0);
  v418 = (void *)objc_claimAutoreleasedReturnValue();
  v547[3] = v418;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("progressData"), 0);
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  v547[4] = v417;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("progressLevel"), 0);
  v416 = (void *)objc_claimAutoreleasedReturnValue();
  v547[5] = v416;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("score"), 0);
  v415 = (void *)objc_claimAutoreleasedReturnValue();
  v547[6] = v415;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("rankID"), 0);
  v414 = (void *)objc_claimAutoreleasedReturnValue();
  v547[7] = v414;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("usedReveal"), 0);
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  v547[8] = v413;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("playDuration"), 0);
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  v547[9] = v412;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastPlayedDate"), 0);
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  v547[10] = v411;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("completedDate"), 0);
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  v547[11] = v410;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("firstCompletedDate"), 0);
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  v547[12] = v409;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("firstPlayDuration"), 0);
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  v547[13] = v408;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("bestScore"), 0);
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  v547[14] = v407;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("difficulty"), 0);
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  v547[15] = v406;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("publishDate"), 0);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  v547[16] = v405;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("behaviorFlags"), 0);
  v404 = (void *)objc_claimAutoreleasedReturnValue();
  v547[17] = v404;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v547, 18);
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("PuzzleHistoryItem"), v403);
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  v556[8] = v402;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  v546[0] = v401;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  v546[1] = v400;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleID"), 1);
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  v546[2] = v399;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleTypeID"), 1);
  v398 = (void *)objc_claimAutoreleasedReturnValue();
  v546[3] = v398;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("progressData"), 1);
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  v546[4] = v397;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("progressLevel"), 0);
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  v546[5] = v396;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("score"), 1);
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  v546[6] = v395;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("rankID"), 1);
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  v546[7] = v394;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("usedReveal"), 1);
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  v546[8] = v393;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("playDuration"), 1);
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  v546[9] = v392;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastPlayedDate"), 1);
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  v546[10] = v391;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("completedDate"), 1);
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  v546[11] = v390;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("firstCompletedDate"), 1);
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  v546[12] = v389;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("firstPlayDuration"), 1);
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  v546[13] = v388;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("bestScore"), 1);
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  v546[14] = v387;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("difficulty"), 1);
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  v546[15] = v386;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("publishDate"), 1);
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  v546[16] = v385;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("behaviorFlags"), 1);
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  v546[17] = v384;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v546, 18);
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("PuzzleHistoryItemSecure"), v383);
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  v556[9] = v382;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 1);
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  v545[0] = v381;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 1);
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  v545[1] = v380;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleID"), 1);
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  v545[2] = v379;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleTypeID"), 1);
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  v545[3] = v378;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("progressData"), 1);
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  v545[4] = v377;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("progressLevel"), 1);
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  v545[5] = v376;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("score"), 1);
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  v545[6] = v375;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("rankID"), 1);
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  v545[7] = v374;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("usedReveal"), 1);
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  v545[8] = v373;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("playDuration"), 1);
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  v545[9] = v372;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastPlayedDate"), 1);
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  v545[10] = v371;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("completedDate"), 1);
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  v545[11] = v370;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("firstCompletedDate"), 1);
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  v545[12] = v369;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("firstPlayDuration"), 1);
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  v545[13] = v368;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("bestScore"), 1);
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  v545[14] = v367;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("difficulty"), 1);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  v545[15] = v366;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("publishDate"), 1);
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  v545[16] = v365;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("behaviorFlags"), 1);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  v545[17] = v364;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v545, 18);
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("PuzzleHistoryItemSecure2"), v363);
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  v556[10] = v362;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  v544[0] = v361;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  v544[1] = v360;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleTypeID"), 0);
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  v544[2] = v359;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("settingsData"), 0);
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  v544[3] = v358;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastSeenPuzzleIDs"), 0);
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  v544[4] = v357;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v544, 5);
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("PuzzleTypeSettings"), v356);
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  v556[11] = v355;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  v543[0] = v354;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  v543[1] = v353;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleTypeID"), 1);
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  v543[2] = v352;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("settingsData"), 1);
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  v543[3] = v351;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastSeenPuzzleIDs"), 1);
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  v543[4] = v350;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v543, 5);
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("PuzzleTypeSettingsSecure"), v349);
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  v556[12] = v348;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleID"), 0);
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  v542[0] = v347;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sourceChannelTagID"), 0);
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  v542[1] = v346;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("deviceID"), 0);
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  v542[2] = v345;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastVisited"), 0);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  v542[3] = v344;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleRead"), 0);
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  v542[4] = v343;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleSeen"), 0);
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  v542[5] = v342;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("completedListening"), 0);
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  v542[6] = v341;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("completedReading"), 0);
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  v542[7] = v340;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("liked"), 0);
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  v542[8] = v339;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("disliked"), 0);
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  v542[9] = v338;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("offensive"), 0);
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  v542[10] = v337;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleConsumed"), 0);
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  v542[11] = v336;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  v542[12] = v335;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  v542[13] = v334;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("listenedCount"), 0);
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  v542[14] = v333;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("listeningProgress"), 0);
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  v542[15] = v332;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("listeningProgressLastSaved"), 0);
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  v542[16] = v331;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastListened"), 0);
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  v542[17] = v330;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readingPosition"), 0);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  v542[18] = v329;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readingPositionLastSaved"), 0);
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  v542[19] = v328;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readCount"), 0);
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  v542[20] = v327;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("removedFromAudio"), 0);
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  v542[21] = v326;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("pruningDisabled"), 0);
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  v542[22] = v325;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v542, 23);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("ReadingHistoryItem"), v324);
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  v556[13] = v323;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleID"), 1);
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  v541[0] = v322;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sourceChannelTagID"), 1);
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  v541[1] = v321;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("deviceID"), 1);
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  v541[2] = v320;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastVisited"), 0);
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  v541[3] = v319;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleRead"), 0);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  v541[4] = v318;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleSeen"), 0);
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  v541[5] = v317;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("completedListening"), 0);
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  v541[6] = v316;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("completedReading"), 0);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  v541[7] = v315;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("liked"), 0);
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  v541[8] = v314;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("disliked"), 0);
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  v541[9] = v313;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("offensive"), 0);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  v541[10] = v312;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleConsumed"), 0);
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  v541[11] = v311;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  v541[12] = v310;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  v541[13] = v309;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("listenedCount"), 0);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  v541[14] = v308;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("listeningProgress"), 1);
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  v541[15] = v307;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("listeningProgressLastSaved"), 1);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  v541[16] = v306;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastListened"), 1);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  v541[17] = v305;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readingPosition"), 1);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  v541[18] = v304;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readingPositionLastSaved"), 1);
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v541[19] = v303;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readCount"), 0);
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  v541[20] = v302;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("removedFromAudio"), 0);
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  v541[21] = v301;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("pruningDisabled"), 0);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  v541[22] = v300;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v541, 23);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("ReadingHistoryItemSecure"), v299);
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v556[14] = v298;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleID"), 1);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v540[0] = v297;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sourceChannelTagID"), 1);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v540[1] = v296;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("deviceID"), 1);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  v540[2] = v295;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastVisited"), 1);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  v540[3] = v294;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleRead"), 1);
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  v540[4] = v293;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleSeen"), 1);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v540[5] = v292;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("completedListening"), 1);
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v540[6] = v291;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("completedReading"), 1);
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  v540[7] = v290;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("liked"), 1);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v540[8] = v289;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("disliked"), 1);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  v540[9] = v288;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("offensive"), 1);
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  v540[10] = v287;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleConsumed"), 1);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v540[11] = v286;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 1);
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  v540[12] = v285;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 1);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  v540[13] = v284;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("listenedCount"), 1);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  v540[14] = v283;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("listeningProgress"), 1);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v540[15] = v282;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("listeningProgressLastSaved"), 1);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  v540[16] = v281;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastListened"), 1);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  v540[17] = v280;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readingPosition"), 1);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  v540[18] = v279;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readingPositionLastSaved"), 1);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  v540[19] = v278;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readCount"), 1);
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  v540[20] = v277;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("removedFromAudio"), 1);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  v540[21] = v276;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("pruningDisabled"), 1);
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  v540[22] = v275;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v540, 23);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("ReadingHistoryItemSecure2"), v274);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v556[15] = v273;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleID"), 0);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  v539[0] = v272;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("dateAdded"), 0);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v539[1] = v271;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("origin"), 0);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v539[2] = v270;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  v539[3] = v269;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  v539[4] = v268;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v539, 5);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("ReadingListEntry"), v267);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  v556[16] = v266;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleID"), 1);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v538[0] = v265;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("dateAdded"), 0);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  v538[1] = v264;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("origin"), 0);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v538[2] = v263;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v538[3] = v262;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v538[4] = v261;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v538, 5);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("ReadingListEntrySecure"), v260);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v556[17] = v259;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("articleID"), 1);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v537[0] = v258;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("dateAdded"), 1);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v537[1] = v257;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("origin"), 1);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v537[2] = v256;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 1);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v537[3] = v255;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 1);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  v537[4] = v254;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v537, 5);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("ReadingListEntrySecure2"), v253);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v556[18] = v252;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("membershipID"), 0);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v536 = v251;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v536, 1);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("ReferenceToMembership"), v250);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v556[19] = v249;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("encryptionKey"), 1);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v535[0] = v248;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("version"), 0);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  v535[1] = v247;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v535, 2);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("SentinelSecure"), v246);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v556[20] = v245;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("encryptionKey"), 1);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v534[0] = v244;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("migratedUnencryptedData"), 0);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v534[1] = v243;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("deletedUnencryptedData"), 0);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v534[2] = v242;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("migratedSubscriptions"), 0);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v534[3] = v241;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("deletedSubscriptions"), 0);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v534[4] = v240;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("migratedToVersion"), 1);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v534[5] = v239;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("deletedToVersion"), 1);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v534[6] = v238;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("version"), 0);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v534[7] = v237;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v534, 8);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("Sentinel"), v236);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v556[21] = v235;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("dateAdded"), 0);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v533[0] = v234;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("order"), 0);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v533[1] = v233;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("type"), 0);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v533[2] = v232;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v533[3] = v231;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v533[4] = v230;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v533, 5);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("Shortcut"), v229);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v556[22] = v228;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("dateAdded"), 0);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v532[0] = v227;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("order"), 0);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v532[1] = v226;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("type"), 0);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v532[2] = v225;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v532[3] = v224;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v532[4] = v223;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v532, 5);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("ShortcutSecure"), v222);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v556[23] = v221;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("dateAdded"), 1);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v531[0] = v220;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("order"), 1);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v531[1] = v219;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("type"), 1);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v531[2] = v218;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 1);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v531[3] = v217;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 1);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v531[4] = v216;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v531, 5);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("ShortcutSecure2"), v215);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v556[24] = v214;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("tagID"), 0);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v530[0] = v213;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("subscriptionType"), 0);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v530[1] = v212;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("subscriptionOrder"), 0);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v530[2] = v211;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("subscriptionOrigin"), 0);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v530[3] = v210;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("dateAdded"), 0);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v530[4] = v209;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("url"), 0);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v530[5] = v208;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("title"), 0);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v530[6] = v207;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("pollingURL"), 0);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v530[7] = v206;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("notificationsEnabled"), 0);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v530[8] = v205;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("groupID"), 0);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v530[9] = v204;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v530[10] = v203;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v530[11] = v202;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v530, 12);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("Subscription"), v201);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v556[25] = v200;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("tagID"), 1);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v529[0] = v199;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("subscriptionType"), 0);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v529[1] = v198;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("subscriptionOrder"), 1);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v529[2] = v197;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("subscriptionOrigin"), 0);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v529[3] = v196;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("dateAdded"), 0);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v529[4] = v195;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("url"), 0);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v529[5] = v194;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("title"), 0);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v529[6] = v193;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("pollingURL"), 0);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v529[7] = v192;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("notificationsEnabled"), 0);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v529[8] = v191;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("groupID"), 1);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v529[9] = v190;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v529[10] = v189;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v529[11] = v188;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v529, 12);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("Subscription_CK"), v187);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v556[26] = v186;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("tagID"), 1);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v528[0] = v185;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("subscriptionType"), 0);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v528[1] = v184;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("subscriptionOrder"), 1);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v528[2] = v183;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("subscriptionOrigin"), 0);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v528[3] = v182;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("dateAdded"), 0);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v528[4] = v181;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("url"), 0);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v528[5] = v180;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("title"), 0);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v528[6] = v179;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("pollingURL"), 0);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v528[7] = v178;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("notificationsEnabled"), 0);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v528[8] = v177;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("groupID"), 1);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v528[9] = v176;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v528[10] = v175;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v528[11] = v174;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v528, 12);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("SubscriptionSecure"), v173);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v556[27] = v172;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("tagID"), 1);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v527[0] = v171;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("subscriptionType"), 1);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v527[1] = v170;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("subscriptionOrder"), 1);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v527[2] = v169;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("subscriptionOrigin"), 1);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v527[3] = v168;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("dateAdded"), 1);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v527[4] = v167;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("url"), 1);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v527[5] = v166;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("title"), 1);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v527[6] = v165;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("pollingURL"), 1);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v527[7] = v164;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("notificationsEnabled"), 1);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v527[8] = v163;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("groupID"), 1);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v527[9] = v162;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 1);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v527[10] = v161;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 1);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v527[11] = v160;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v527, 12);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("SubscriptionSecure2"), v159);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v556[28] = v158;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("accessToken"), 0);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v526[0] = v157;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("tagID"), 0);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v526[1] = v156;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("fontMultiplier"), 0);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v526[2] = v155;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("fontMultiplierMacOS"), 0);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v526[3] = v154;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("contentScale"), 0);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v526[4] = v153;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("contentScaleMacOS"), 0);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v526[5] = v152;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("webAccessOptIn"), 0);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v526[6] = v151;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v526[7] = v150;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v526[8] = v149;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v526, 9);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("TagSettings"), v148);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v556[29] = v147;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("accessToken"), 1);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v525[0] = v146;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("tagID"), 1);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v525[1] = v145;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("fontMultiplier"), 0);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v525[2] = v144;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("fontMultiplierMacOS"), 0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v525[3] = v143;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("contentScale"), 0);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v525[4] = v142;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("contentScaleMacOS"), 0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v525[5] = v141;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("webAccessOptIn"), 0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v525[6] = v140;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v525[7] = v139;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v525[8] = v138;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v525, 9);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("TagSettingsSecure"), v137);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v556[30] = v136;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("accessToken"), 1);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v524[0] = v135;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("tagID"), 1);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v524[1] = v134;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("fontMultiplier"), 1);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v524[2] = v133;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("fontMultiplierMacOS"), 1);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v524[3] = v132;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("contentScale"), 1);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v524[4] = v131;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("contentScaleMacOS"), 1);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v524[5] = v130;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("webAccessOptIn"), 1);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v524[6] = v129;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 1);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v524[7] = v128;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 1);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v524[8] = v127;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v524, 9);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("TagSettingsSecure2"), v126);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v556[31] = v125;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sessionData"), 0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v523[0] = v124;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v523[1] = v123;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v523[2] = v122;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v523, 3);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("UserEventHistorySession"), v121);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v556[32] = v120;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sessionData"), 1);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v522[0] = v119;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v522[1] = v118;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v522[2] = v117;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v522, 3);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("UserEventHistorySessionSecure"), v116);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v556[33] = v115;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("feldsparID"), 0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v521[0] = v114;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("notificationsUserID"), 0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v521[1] = v113;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("adsUserID"), 0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v521[2] = v112;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("adsUserIDCreatedDate"), 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v521[3] = v111;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastOpenedDate"), 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v521[4] = v110;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("finishFirstLaunchVersion"), 0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v521[5] = v109;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("monthlyMeteredCount"), 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v521[6] = v108;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("totalMeteredCount"), 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v521[7] = v107;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("meteredCountLastResetDate"), 0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v521[8] = v106;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("monthlyPaidBundleMeteredCount"), 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v521[9] = v105;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("paidBundleMeteredCountLastResetDate"), 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v521[10] = v104;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("upsellAppLaunchCount"), 0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v521[11] = v103;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastAppLaunchUpsellInstanceID"), 0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v521[12] = v102;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("upsellAppLaunchLastSeenDate"), 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v521[13] = v101;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("upsellAppLaunchLastShownCampaignID"), 0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v521[14] = v100;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("upsellAppLaunchLastPresenterBundleID"), 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v521[15] = v99;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("newsletterSignupLastSeenDate"), 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v521[16] = v98;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("personalizedNewsletterSignupLastSeenDate"), 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v521[17] = v97;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("issuesNewsletterOptinLastSeenDate"), 0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v521[18] = v96;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("userStartDate"), 0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v521[19] = v95;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastViewedSavedDate"), 0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v521[20] = v94;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastViewedSharedWithYouDate"), 0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v521[21] = v93;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("topStoriesIntroduced"), 0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v521[22] = v92;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("editorialArticleVersion"), 0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v521[23] = v91;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v521[24] = v90;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v521[25] = v89;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("marketingNotificationsEnabled"), 0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v521[26] = v88;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("newIssueNotificationsEnabled"), 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v521[27] = v87;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("endOfAudioNotificationsEnabled"), 0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v521[28] = v86;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsTopicNotificationsEnabledState2"), 0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v521[29] = v85;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("canonicalLanguage"), 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v521[30] = v84;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("postPurchaseOnboardingLastSeenDate"), 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v521[31] = v83;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("appReviewRequestLastSeenDate"), 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v521[32] = v82;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsOnboardingState"), 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v521[33] = v81;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("shortcutsOnboardingState"), 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v521[34] = v80;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("shortcutsOnboardingCompletedDate"), 0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v521[35] = v79;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsSyncState"), 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v521[36] = v78;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsSyncStateLastSavedDate"), 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v521[37] = v77;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsOnboardingCompletedDate"), 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v521[38] = v76;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsUserID"), 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v521[39] = v75;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleNotificationsEnabled2"), 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v521[40] = v74;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleNotificationsLastChangedDate"), 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v521[41] = v73;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleStatsStartDate"), 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v521[42] = v72;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v521, 43);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("UserInfo"), v71);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v556[34] = v70;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("feldsparID"), 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v520[0] = v69;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("notificationsUserID"), 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v520[1] = v68;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("adsUserID"), 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v520[2] = v67;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("adsUserIDCreatedDate"), 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v520[3] = v66;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastOpenedDate"), 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v520[4] = v65;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("finishFirstLaunchVersion"), 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v520[5] = v64;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("monthlyMeteredCount"), 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v520[6] = v63;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("totalMeteredCount"), 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v520[7] = v62;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("meteredCountLastResetDate"), 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v520[8] = v61;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("monthlyPaidBundleMeteredCount"), 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v520[9] = v60;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("paidBundleMeteredCountLastResetDate"), 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v520[10] = v59;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("upsellAppLaunchCount"), 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v520[11] = v58;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastAppLaunchUpsellInstanceID"), 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v520[12] = v57;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("upsellAppLaunchLastSeenDate"), 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v520[13] = v56;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("upsellAppLaunchLastShownCampaignID"), 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v520[14] = v55;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("upsellAppLaunchLastPresenterBundleID"), 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v520[15] = v54;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("newsletterSignupLastSeenDate"), 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v520[16] = v53;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("personalizedNewsletterSignupLastSeenDate"), 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v520[17] = v52;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("issuesNewsletterOptinLastSeenDate"), 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v520[18] = v51;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("userStartDate"), 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v520[19] = v50;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastViewedSavedDate"), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v520[20] = v49;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastViewedSharedWithYouDate"), 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v520[21] = v48;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("topStoriesIntroduced"), 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v520[22] = v47;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("editorialArticleVersion"), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v520[23] = v46;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v520[24] = v45;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v520[25] = v44;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("marketingNotificationsEnabled"), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v520[26] = v43;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("newIssueNotificationsEnabled"), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v520[27] = v42;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("endOfAudioNotificationsEnabled"), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v520[28] = v41;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsTopicNotificationsEnabledState2"), 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v520[29] = v40;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("canonicalLanguage"), 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v520[30] = v39;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("postPurchaseOnboardingLastSeenDate"), 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v520[31] = v38;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("appReviewRequestLastSeenDate"), 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v520[32] = v37;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsOnboardingState"), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v520[33] = v36;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("shortcutsOnboardingState"), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v520[34] = v35;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("shortcutsOnboardingCompletedDate"), 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v520[35] = v34;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsSyncState"), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v520[36] = v33;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsSyncStateLastSavedDate"), 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v520[37] = v32;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsOnboardingCompletedDate"), 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v520[38] = v31;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsUserID"), 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v520[39] = v30;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleNotificationsEnabled2"), 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v520[40] = v29;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleNotificationsLastChangedDate"), 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v520[41] = v28;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleStatsStartDate"), 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v520[42] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v520, 43);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("UserInfoSecure"), v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v556[35] = v25;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("feldsparID"), 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v519[0] = v24;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("notificationsUserID"), 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v519[1] = v23;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("adsUserID"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v519[2] = v22;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("adsUserIDCreatedDate"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v519[3] = v21;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastOpenedDate"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v519[4] = v20;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("finishFirstLaunchVersion"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v519[5] = v19;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("monthlyMeteredCount"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v519[6] = v18;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("totalMeteredCount"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v519[7] = v17;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("meteredCountLastResetDate"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v519[8] = v16;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("monthlyPaidBundleMeteredCount"), 1);
  v514 = (void *)objc_claimAutoreleasedReturnValue();
  v519[9] = v514;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("paidBundleMeteredCountLastResetDate"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v519[10] = v15;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("upsellAppLaunchCount"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v519[11] = v14;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastAppLaunchUpsellInstanceID"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v519[12] = v13;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("upsellAppLaunchLastSeenDate"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v519[13] = v12;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("upsellAppLaunchLastShownCampaignID"), 1);
  v517 = (void *)objc_claimAutoreleasedReturnValue();
  v519[14] = v517;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("upsellAppLaunchLastPresenterBundleID"), 1);
  v516 = (void *)objc_claimAutoreleasedReturnValue();
  v519[15] = v516;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("newsletterSignupLastSeenDate"), 1);
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  v519[16] = v515;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("personalizedNewsletterSignupLastSeenDate"), 1);
  v506 = (void *)objc_claimAutoreleasedReturnValue();
  v519[17] = v506;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("issuesNewsletterOptinLastSeenDate"), 1);
  v513 = (void *)objc_claimAutoreleasedReturnValue();
  v519[18] = v513;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("userStartDate"), 1);
  v512 = (void *)objc_claimAutoreleasedReturnValue();
  v519[19] = v512;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastViewedSavedDate"), 1);
  v511 = (void *)objc_claimAutoreleasedReturnValue();
  v519[20] = v511;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("lastViewedSharedWithYouDate"), 1);
  v510 = (void *)objc_claimAutoreleasedReturnValue();
  v519[21] = v510;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("topStoriesIntroduced"), 1);
  v509 = (void *)objc_claimAutoreleasedReturnValue();
  v519[22] = v509;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("editorialArticleVersion"), 1);
  v508 = (void *)objc_claimAutoreleasedReturnValue();
  v519[23] = v508;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v519[24] = v11;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v519[25] = v10;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("marketingNotificationsEnabled"), 1);
  v507 = (void *)objc_claimAutoreleasedReturnValue();
  v519[26] = v507;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("newIssueNotificationsEnabled"), 1);
  v498 = (void *)objc_claimAutoreleasedReturnValue();
  v519[27] = v498;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("endOfAudioNotificationsEnabled"), 1);
  v505 = (void *)objc_claimAutoreleasedReturnValue();
  v519[28] = v505;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsTopicNotificationsEnabledState2"), 1);
  v504 = (void *)objc_claimAutoreleasedReturnValue();
  v519[29] = v504;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("canonicalLanguage"), 1);
  v503 = (void *)objc_claimAutoreleasedReturnValue();
  v519[30] = v503;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("postPurchaseOnboardingLastSeenDate"), 1);
  v502 = (void *)objc_claimAutoreleasedReturnValue();
  v519[31] = v502;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("appReviewRequestLastSeenDate"), 1);
  v501 = (void *)objc_claimAutoreleasedReturnValue();
  v519[32] = v501;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsOnboardingState"), 1);
  v500 = (void *)objc_claimAutoreleasedReturnValue();
  v519[33] = v500;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("shortcutsOnboardingState"), 1);
  v499 = (void *)objc_claimAutoreleasedReturnValue();
  v519[34] = v499;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("shortcutsOnboardingCompletedDate"), 1);
  v491 = (void *)objc_claimAutoreleasedReturnValue();
  v519[35] = v491;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsSyncState"), 1);
  v497 = (void *)objc_claimAutoreleasedReturnValue();
  v519[36] = v497;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsSyncStateLastSavedDate"), 1);
  v496 = (void *)objc_claimAutoreleasedReturnValue();
  v519[37] = v496;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsOnboardingCompletedDate"), 1);
  v495 = (void *)objc_claimAutoreleasedReturnValue();
  v519[38] = v495;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("sportsUserID"), 1);
  v494 = (void *)objc_claimAutoreleasedReturnValue();
  v519[39] = v494;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleNotificationsEnabled2"), 1);
  v493 = (void *)objc_claimAutoreleasedReturnValue();
  v519[40] = v493;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleNotificationsLastChangedDate"), 1);
  v492 = (void *)objc_claimAutoreleasedReturnValue();
  v519[41] = v492;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("puzzleStatsStartDate"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v519[42] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v519, 43);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("UserInfoSecure2"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v556[36] = v2;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("writerVersionHighWatermark"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v518[0] = v3;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("readerMinimumRequiredVersion"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v518[1] = v4;
  +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, CFSTR("subscribedChannelTagIDs"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v518[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v518, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, CFSTR("UserPrivacyExporter"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v556[37] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v556, 38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __64__FCCKPrivateDatabase__privateDatabaseDeprecatedRecordTestBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;

  v2 = a2;
  objc_msgSend(v2, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Subscription"));

  if (v4)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("subscriptionType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("pending"));

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v2, "recordType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ReadingHistoryItem"));

  if (v8)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("articleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v6 = v6;
    else
      v6 = 1;
  }
  objc_msgSend(v2, "recordType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ReadingListEntry"));

  if (v11)
  {
    objc_msgSend(v2, "recordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsString:", CFSTR("http"));

    v6 = v14 | v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zonePruningAssistants, 0);
  objc_storeStrong((id *)&self->_zoneRestorationSources, 0);
  objc_storeStrong((id *)&self->_dateOfLastFailedStartUpAttempt, 0);
  objc_storeStrong((id *)&self->_initialStartUpGroup, 0);
  objc_storeStrong((id *)&self->_recordMiddleware, 0);
  objc_storeStrong((id *)&self->_operationMiddleware, 0);
  objc_storeStrong((id *)&self->_remainingStartUpMiddleware, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_noPreflightOperationQueue, 0);
  objc_storeStrong((id *)&self->_highPriorityOperationQueue, 0);
  objc_storeStrong((id *)&self->_serialOperationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_ckProperties, 0);
  objc_storeStrong((id *)&self->_sentinelRecord, 0);
  objc_storeStrong((id *)&self->_secureEncryptionKey, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_destroyWeak((id *)&self->_encryptionDelegate);
}

- (void)fetchAllDatabaseChangesWithServerChangeToken:(id)a3 qualityOfService:(int64_t)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  FCCKPrivateFetchDatabaseChangesOperation *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  int64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    v13 = objc_alloc_init(FCCKPrivateFetchDatabaseChangesOperation);
    -[FCCKPrivateFetchDatabaseChangesOperation setPreviousServerChangeToken:](v13, "setPreviousServerChangeToken:", v10);
    -[FCOperation setQualityOfService:](v13, "setQualityOfService:", a4);
    if (a4 == 9)
      v14 = -1;
    else
      v14 = a4 == 33 || a4 == 25;
    -[FCOperation setRelativePriority:](v13, "setRelativePriority:", v14);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __130__FCCKPrivateDatabase_Additions__fetchAllDatabaseChangesWithServerChangeToken_qualityOfService_completionQueue_completionHandler___block_invoke;
    v16[3] = &unk_1E4644C18;
    v16[4] = self;
    v20 = a4;
    v17 = v11;
    v19 = v12;
    v18 = v10;
    -[FCCKPrivateFetchDatabaseChangesOperation setFetchDatabaseChangesCompletionBlock:](v13, "setFetchDatabaseChangesCompletionBlock:", v16);
    -[FCCKPrivateDatabase addOperation:]((uint64_t)self, v13);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCCKPrivateDatabase(Additions) fetchAllDatabaseChangesWithServerChangeToken:qualityOfService:completionQueue"
          ":completionHandler:]";
    v23 = 2080;
    v24 = "FCCKPrivateDatabase+Additions.m";
    v25 = 1024;
    v26 = 25;
    v27 = 2114;
    v28 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

void __130__FCCKPrivateDatabase_Additions__fetchAllDatabaseChangesWithServerChangeToken_qualityOfService_completionQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  char v32;
  _QWORD block[4];
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = v14;
  if (v14)
  {
    v16 = objc_msgSend(v14, "fc_isCKErrorWithCode:", 21);
    v17 = FCCloudKitLog;
    if (v16)
    {
      if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_DEFAULT, "Database changes server change token expired, resetting the token and trying again", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "fetchAllDatabaseChangesWithServerChangeToken:qualityOfService:completionQueue:completionHandler:", 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    }
    else
    {
      if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v36 = v15;
        _os_log_error_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_ERROR, "Error fetching database changes: %{public}@", buf, 0xCu);
      }
      v22 = *(void **)(a1 + 56);
      if (v22)
      {
        v23 = *(NSObject **)(a1 + 40);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __130__FCCKPrivateDatabase_Additions__fetchAllDatabaseChangesWithServerChangeToken_qualityOfService_completionQueue_completionHandler___block_invoke_4;
        block[3] = &unk_1E463B598;
        v34 = v22;
        dispatch_async(v23, block);

      }
    }
    goto LABEL_20;
  }
  v18 = FCCloudKitLog;
  if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    v36 = v19;
    _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEFAULT, "Fetched database changes with serverChangeToken: %@", buf, 0xCu);
  }
  if (!v11)
  {
    v20 = 0;
    if (v12)
      goto LABEL_10;
LABEL_16:
    v21 = 0;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_16;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
  v24 = *(void **)(a1 + 56);
  if (v24)
  {
    v25 = *(NSObject **)(a1 + 40);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __130__FCCKPrivateDatabase_Additions__fetchAllDatabaseChangesWithServerChangeToken_qualityOfService_completionQueue_completionHandler___block_invoke_7;
    v26[3] = &unk_1E4644BF0;
    v31 = v24;
    v27 = 0;
    v28 = v20;
    v29 = v21;
    v30 = v13;
    v32 = a5;
    dispatch_async(v25, v26);

  }
LABEL_20:

}

uint64_t __130__FCCKPrivateDatabase_Additions__fetchAllDatabaseChangesWithServerChangeToken_qualityOfService_completionQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __130__FCCKPrivateDatabase_Additions__fetchAllDatabaseChangesWithServerChangeToken_qualityOfService_completionQueue_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32) == 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72));
}

- (void)fetchChangesForRecordZoneID:(id)a3 changeToken:(id)a4 desiredKeys:(id)a5 fetchAllChanges:(BOOL)a6 qualityOfService:(int64_t)a7 completionHandler:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  FCCKPrivateFetchRecordZoneChangesOperation *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  FCCKPrivateDatabase *v24;
  id v25;
  id v26;
  id v27;
  int64_t v28;
  BOOL v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v10 = a6;
  v38 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = v17;
  if (v17)
  {
    if (v14)
    {
      v19 = objc_alloc_init(FCCKPrivateFetchRecordZoneChangesOperation);
      -[FCCKPrivateDatabaseOperation setDatabase:](v19, "setDatabase:", self);
      -[FCCKPrivateFetchRecordZoneChangesOperation setRecordZoneID:](v19, "setRecordZoneID:", v14);
      -[FCCKPrivateFetchRecordZoneChangesOperation setPreviousServerChangeToken:](v19, "setPreviousServerChangeToken:", v15);
      -[FCCKPrivateFetchRecordZoneChangesOperation setDesiredKeys:](v19, "setDesiredKeys:", v16);
      -[FCCKPrivateFetchRecordZoneChangesOperation setFetchAllChanges:](v19, "setFetchAllChanges:", v10);
      -[FCOperation setQualityOfService:](v19, "setQualityOfService:", a7);
      if (a7 == 9)
        v20 = -1;
      else
        v20 = a7 == 33 || a7 == 25;
      -[FCOperation setRelativePriority:](v19, "setRelativePriority:", v20);
      -[FCCKPrivateFetchRecordZoneChangesOperation setFetchNewestChangesFirst:](v19, "setFetchNewestChangesFirst:", 1);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __137__FCCKPrivateDatabase_Additions__fetchChangesForRecordZoneID_changeToken_desiredKeys_fetchAllChanges_qualityOfService_completionHandler___block_invoke;
      v22[3] = &unk_1E4644C40;
      v23 = v15;
      v24 = self;
      v25 = v14;
      v29 = v10;
      v26 = v16;
      v28 = a7;
      v27 = v18;
      -[FCCKPrivateFetchRecordZoneChangesOperation setFetchRecordZoneChangesCompletionBlock:](v19, "setFetchRecordZoneChangesCompletionBlock:", v22);
      -[FCCKPrivateDatabase addOperation:]((uint64_t)self, v19);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v17 + 2))(v17, 0, 0, 0, 0, 0, 0);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCCKPrivateDatabase(Additions) fetchChangesForRecordZoneID:changeToken:desiredKeys:fetchAllChanges:qualityOf"
          "Service:completionHandler:]";
    v32 = 2080;
    v33 = "FCCKPrivateDatabase+Additions.m";
    v34 = 1024;
    v35 = 77;
    v36 = 2114;
    v37 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

void __137__FCCKPrivateDatabase_Additions__fetchChangesForRecordZoneID_changeToken_desiredKeys_fetchAllChanges_qualityOfService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  if (objc_msgSend(a6, "fc_isCKErrorWithCode:", 21))
  {
    if (!*(_QWORD *)(a1 + 32) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("how did a nil change token expire?"));
      v15 = 136315906;
      v16 = "-[FCCKPrivateDatabase(Additions) fetchChangesForRecordZoneID:changeToken:desiredKeys:fetchAllChanges:quality"
            "OfService:completionHandler:]_block_invoke";
      v17 = 2080;
      v18 = "FCCKPrivateDatabase+Additions.m";
      v19 = 1024;
      v20 = 101;
      v21 = 2114;
      v22 = v14;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

    }
    objc_msgSend(*(id *)(a1 + 40), "fetchChangesForRecordZoneID:changeToken:desiredKeys:fetchAllChanges:qualityOfService:completionHandler:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
  }
  else
  {
    (*(void (**)(_QWORD, BOOL, id, id, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), a6 == 0, v11, v12, 0, v13, a5);
  }

}

@end
