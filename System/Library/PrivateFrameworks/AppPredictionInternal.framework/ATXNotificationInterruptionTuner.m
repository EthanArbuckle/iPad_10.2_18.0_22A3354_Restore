@implementation ATXNotificationInterruptionTuner

- (ATXNotificationInterruptionTuner)init
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXNotificationInterruptionTuner *v8;

  v3 = objc_alloc(MEMORY[0x1E0CF8F58]);
  +[ATXModeEntityScorerServer sharedInstance](ATXModeEntityScorerServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithModeEntityScorerClient:", v4);
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = -[ATXNotificationInterruptionTuner initWithModesModels:notificationSettingsReader:dataStore:](self, "initWithModesModels:notificationSettingsReader:dataStore:", v5, v6, v7);

  return v8;
}

- (ATXNotificationInterruptionTuner)initWithModesModels:(id)a3 notificationSettingsReader:(id)a4 dataStore:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  ATXNotificationInterruptionTuner *v13;

  v8 = (void *)MEMORY[0x1E0CF8D60];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ATXNotificationInterruptionTuner initWithModesModels:notificationSettingsReader:dataStore:modeConfigClient:](self, "initWithModesModels:notificationSettingsReader:dataStore:modeConfigClient:", v11, v10, v9, v12);

  return v13;
}

- (ATXNotificationInterruptionTuner)initWithModesModels:(id)a3 notificationSettingsReader:(id)a4 dataStore:(id)a5 modeConfigClient:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  ATXNotificationInterruptionTuner *v16;

  v10 = (objc_class *)MEMORY[0x1E0CF8EF0];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend([v10 alloc], "initWithModesModels:notificationSettingsReader:modeConfigurationClient:", v14, v13, v11);
  v16 = -[ATXNotificationInterruptionTuner initWithModesModels:notificationSettingsReader:dataStore:modeConfigClient:interruptionManager:](self, "initWithModesModels:notificationSettingsReader:dataStore:modeConfigClient:interruptionManager:", v14, v13, v12, v11, v15);

  return v16;
}

- (ATXNotificationInterruptionTuner)initWithModesModels:(id)a3 notificationSettingsReader:(id)a4 dataStore:(id)a5 modeConfigClient:(id)a6 interruptionManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ATXNotificationInterruptionTuner *v17;
  ATXNotificationInterruptionTuner *v18;
  uint64_t v19;
  ATXNotificationManagementMAConstants *constants;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ATXNotificationInterruptionTuner;
  v17 = -[ATXNotificationInterruptionTuner init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_modesModels, a3);
    objc_storeStrong((id *)&v18->_notificationSettingsReader, a4);
    objc_storeStrong((id *)&v18->_dataStore, a5);
    objc_storeStrong((id *)&v18->_modeConfigClient, a6);
    objc_msgSend(MEMORY[0x1E0CF8FB0], "sharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    constants = v18->_constants;
    v18->_constants = (ATXNotificationManagementMAConstants *)v19;

    objc_storeStrong((id *)&v18->_interruptionManager, a7);
  }

  return v18;
}

- (ATXNotificationInterruptionTuner)initWithNotificationSettingsReader:(id)a3 dataStore:(id)a4 modeConfigClient:(id)a5 interruptionManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXNotificationInterruptionTuner *v15;
  ATXNotificationInterruptionTuner *v16;
  uint64_t v17;
  ATXNotificationManagementMAConstants *constants;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXNotificationInterruptionTuner;
  v15 = -[ATXNotificationInterruptionTuner init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_notificationSettingsReader, a3);
    objc_storeStrong((id *)&v16->_dataStore, a4);
    objc_storeStrong((id *)&v16->_modeConfigClient, a5);
    objc_msgSend(MEMORY[0x1E0CF8FB0], "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    constants = v16->_constants;
    v16->_constants = (ATXNotificationManagementMAConstants *)v17;

    objc_storeStrong((id *)&v16->_interruptionManager, a6);
  }

  return v16;
}

- (int64_t)recommendedUrgencyForNotification:(id)a3 mode:(unint64_t)a4
{
  return 1;
}

- (id)activeNotificationSuggestionsForMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ATXNotificationAndSuggestionDatastore getTopOfProminentStackNotificationsWithLimit:](self->_dataStore, "getTopOfProminentStackNotificationsWithLimit:", 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationAndSuggestionDatastore getTopOfNonProminentStackNotificationsWithLimit:](self->_dataStore, "getTopOfNonProminentStackNotificationsWithLimit:", 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:](self, "activeNotificationSuggestionsForMode:candidateNotifications:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)activeNotificationSuggestionsForMode:(unint64_t)a3 candidateNotifications:(id)a4
{
  id v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_log_t v19;
  void *v20;
  char *v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  os_log_t v50;
  void *v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t n;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t k;
  uint64_t v79;
  NSObject *v80;
  uint64_t v81;
  ATXInterruptionManager *interruptionManager;
  void *v83;
  void *v84;
  NSObject *v85;
  NSObject *v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  char *v94;
  NSObject *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  NSObject *v100;
  uint64_t j;
  void *v102;
  void *v103;
  NSObject *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  uint64_t v120;
  __int128 v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  char *v126;
  NSObject *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  NSObject *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  NSObject *v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  NSObject *v148;
  uint64_t v149;
  void *v150;
  id v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t i;
  uint64_t v156;
  NSObject *v157;
  __int128 v158;
  __int128 v159;
  uint64_t v160;
  void *v161;
  unint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  NSObject *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  NSObject *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  NSObject *v179;
  NSObject *v180;
  id v181;
  id v182;
  NSObject *v183;
  NSObject *v184;
  os_log_t log;
  os_log_t loga;
  NSObject *logb;
  NSObject *logc;
  void *v189;
  void *v190;
  void *v191;
  ATXNotificationInterruptionTuner *v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  char v233;
  _QWORD v234[4];
  id v235;
  id v236;
  _BYTE v237[128];
  _BYTE v238[128];
  _BYTE v239[128];
  _BYTE v240[128];
  _BYTE v241[128];
  uint8_t v242[128];
  uint8_t buf[4];
  const char *v244;
  __int16 v245;
  uint64_t v246;
  __int16 v247;
  void *v248;
  _BYTE v249[128];
  _BYTE v250[128];
  _BYTE v251[128];
  _BYTE v252[128];
  uint64_t v253;

  v253 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 > 0xD || ((1 << a3) & 0x3021) == 0)
  {
    v162 = a3;
    v165 = v6;
    -[ATXNotificationInterruptionTuner dndModeUUID:](self, "dndModeUUID:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v7 = (void *)MEMORY[0x1E0C9AA60];
LABEL_175:

      v6 = v165;
      goto LABEL_4;
    }
    v161 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v234[0] = MEMORY[0x1E0C809B0];
    v234[1] = 3221225472;
    v234[2] = __96__ATXNotificationInterruptionTuner_activeNotificationSuggestionsForMode_candidateNotifications___block_invoke;
    v234[3] = &unk_1E82DCA90;
    v182 = v10;
    v235 = v182;
    v181 = v11;
    v236 = v181;
    objc_msgSend(v165, "enumerateObjectsUsingBlock:", v234);
    v233 = 0;
    v12 = -[ATXNotificationSettingsReaderProtocol applicationConfigurationTypeForDNDModeUUID:success:](self->_notificationSettingsReader, "applicationConfigurationTypeForDNDModeUUID:success:", v9, &v233);
    v189 = v9;
    v192 = self;
    if (!v233)
    {
      __atxlog_handle_notification_management();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:].cold.3(v37, v38, v39, v40, v41, v42, v43, v44);
      v7 = v161;
LABEL_85:

      v233 = 0;
      v81 = -[ATXNotificationSettingsReaderProtocol senderConfigurationTypeForDNDModeUUID:success:](self->_notificationSettingsReader, "senderConfigurationTypeForDNDModeUUID:success:", v9, &v233);
      if (!v233)
      {
        __atxlog_handle_notification_management();
        v110 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
          -[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:].cold.1(v110, v111, v112, v113, v114, v115, v116, v117);
        goto LABEL_174;
      }
      v160 = v81;
      if (!objc_msgSend(v181, "count"))
      {
        __atxlog_handle_notification_management();
        v110 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v244 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
          _os_log_impl(&dword_1C9A3B000, v110, OS_LOG_TYPE_DEFAULT, "%s: None of the notifications had associated contacts, so not returning any contact suggestions", buf, 0xCu);
        }
        goto LABEL_174;
      }
      interruptionManager = self->_interruptionManager;
      +[ATXModeEntityScorerServer sharedInstance](ATXModeEntityScorerServer, "sharedInstance");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "rankedContactsForMode:options:", v162, 1);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXInterruptionManager recommendedAllowedContactsForContactScores:](interruptionManager, "recommendedAllowedContactsForContactScores:", v84);
      v85 = objc_claimAutoreleasedReturnValue();

      -[ATXInterruptionManager recommendedDeniedContactsForMode:options:](self->_interruptionManager, "recommendedDeniedContactsForMode:options:", v162, 1);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = (void *)objc_opt_new();
      v167 = v85;
      if (v160 == 2)
      {
        __atxlog_handle_notification_management();
        v86 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          ATXModeToString();
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          DNDStringFromConfigurationType();
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v244 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
          v245 = 2114;
          v246 = (uint64_t)v118;
          v247 = 2114;
          v248 = v119;
          _os_log_impl(&dword_1C9A3B000, v86, OS_LOG_TYPE_DEFAULT, "%s: Not returning any notification adjacent suggestions for contacts because mode: %{public}@ is in an unconfigured state: %{public}@", buf, 0x20u);

        }
LABEL_162:

        __atxlog_handle_notification_management();
        v148 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v148, OS_LOG_TYPE_INFO))
        {
          v149 = objc_msgSend(v191, "count");
          DNDStringFromConfigurationType();
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v244 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
          v245 = 2048;
          v246 = v149;
          v247 = 2112;
          v248 = v150;
          _os_log_impl(&dword_1C9A3B000, v148, OS_LOG_TYPE_INFO, "%s: Created %ld contact suggestions for DND configuration type: %@", buf, 0x20u);

        }
        v195 = 0u;
        v196 = 0u;
        v193 = 0u;
        v194 = 0u;
        v151 = v191;
        v152 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v193, v237, 16);
        if (v152)
        {
          v153 = v152;
          v154 = *(_QWORD *)v194;
          do
          {
            for (i = 0; i != v153; ++i)
            {
              if (*(_QWORD *)v194 != v154)
                objc_enumerationMutation(v151);
              v156 = *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * i);
              __atxlog_handle_notification_management();
              v157 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v244 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
                v245 = 2112;
                v246 = v156;
                _os_log_debug_impl(&dword_1C9A3B000, v157, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
              }

            }
            v153 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v193, v237, 16);
          }
          while (v153);
        }

        v7 = v161;
        objc_msgSend(v161, "addObjectsFromArray:", v151);

        v9 = v189;
        v110 = v167;
LABEL_174:

        goto LABEL_175;
      }
      if (v160 != 1)
      {
        if (!v160)
        {
          v211 = 0u;
          v212 = 0u;
          v209 = 0u;
          v210 = 0u;
          v86 = v85;
          v87 = -[NSObject countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v209, v241, 16);
          if (!v87)
            goto LABEL_162;
          v89 = v87;
          v90 = *(_QWORD *)v210;
          *(_QWORD *)&v88 = 138412290;
          v158 = v88;
          v91 = v168;
          v179 = v86;
          v163 = *(_QWORD *)v210;
          while (1)
          {
            v92 = 0;
            v170 = v89;
            do
            {
              if (*(_QWORD *)v210 != v90)
                objc_enumerationMutation(v86);
              v93 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * v92);
              if (v93)
              {
                objc_msgSend(v93, "cnContactId");
                v94 = (char *)objc_claimAutoreleasedReturnValue();
                if (v94)
                {
                  if (-[ATXNotificationSettingsReaderProtocol contactIsOnAllowList:dndModeUUID:](self->_notificationSettingsReader, "contactIsOnAllowList:dndModeUUID:", v94, v189))
                  {
                    __atxlog_handle_notification_management();
                    logb = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(logb, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = v158;
                      v244 = v94;
                      _os_log_debug_impl(&dword_1C9A3B000, logb, OS_LOG_TYPE_DEBUG, "Not suggesting contact: %@ for allow list because it's already there", buf, 0xCu);
                    }
                    goto LABEL_117;
                  }
                  if (!-[ATXNotificationInterruptionTuner contactWithIdentifier:isRecommendedByDenyListModel:](self, "contactWithIdentifier:isRecommendedByDenyListModel:", v94, v91))
                  {
                    v207 = 0u;
                    v208 = 0u;
                    v205 = 0u;
                    v206 = 0u;
                    objc_msgSend(v181, "objectForKeyedSubscript:", v94);
                    logb = objc_claimAutoreleasedReturnValue();
                    v96 = -[NSObject countByEnumeratingWithState:objects:count:](logb, "countByEnumeratingWithState:objects:count:", &v205, v240, 16);
                    if (!v96)
                      goto LABEL_117;
                    v97 = v96;
                    v175 = v92;
                    v98 = *(_QWORD *)v206;
                    v100 = logb;
                    v99 = v189;
                    while (1)
                    {
                      for (j = 0; j != v97; ++j)
                      {
                        if (*(_QWORD *)v206 != v98)
                          objc_enumerationMutation(v100);
                        v102 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * j);
                        objc_msgSend(v102, "bundleID", v158);
                        v103 = (void *)objc_claimAutoreleasedReturnValue();
                        if (-[ATXNotificationSettingsReaderProtocol appIsOnAllowList:dndModeUUID:](self->_notificationSettingsReader, "appIsOnAllowList:dndModeUUID:", v103, v99))
                        {
                          __atxlog_handle_notification_management();
                          v104 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412546;
                            v244 = v94;
                            v245 = 2112;
                            v246 = (uint64_t)v103;
                            _os_log_impl(&dword_1C9A3B000, v104, OS_LOG_TYPE_INFO, "Not suggesting contact: %@ because app: %@ is already allowed so no reason to suggest allowing the contact as well.", buf, 0x16u);
                          }
                        }
                        else
                        {
                          if (!-[ATXNotificationInterruptionTuner validateNotificationUrgency:](self, "validateNotificationUrgency:", v102))goto LABEL_114;
                          v104 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF8EF8]), "initWithSuggestionType:", 1);
                          v105 = objc_alloc(MEMORY[0x1E0CF8F90]);
                          v106 = (void *)objc_opt_new();
                          v107 = (void *)objc_opt_new();
                          objc_msgSend(v102, "uuid");
                          v108 = (void *)objc_claimAutoreleasedReturnValue();
                          v109 = (void *)objc_msgSend(v105, "initWithInterruptionManagerTuningSuggestion:scope:entityIdentifier:uuid:timestamp:triggerNotificationUUID:", v104, 3, v94, v106, v107, v108);

                          self = v192;
                          objc_msgSend(v191, "addObject:", v109);

                          v100 = logb;
                          v99 = v189;
                        }

LABEL_114:
                      }
                      v97 = -[NSObject countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v205, v240, 16);
                      if (!v97)
                      {
                        v91 = v168;
                        v92 = v175;
                        v86 = v179;
                        v90 = v163;
                        v89 = v170;
                        goto LABEL_117;
                      }
                    }
                  }
                }
                else
                {
                  __atxlog_handle_notification_management();
                  v95 = objc_claimAutoreleasedReturnValue();
                  logb = v95;
                  if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315138;
                    v244 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
                    _os_log_impl(&dword_1C9A3B000, v95, OS_LOG_TYPE_INFO, "%s: Contact doesn't have a cnContactId. Skipping.", buf, 0xCu);
                  }
LABEL_117:

                }
              }
              ++v92;
            }
            while (v92 != v89);
            v89 = -[NSObject countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v209, v241, 16);
            if (!v89)
              goto LABEL_162;
          }
        }
        __atxlog_handle_notification_management();
        v86 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
          -[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:].cold.2(v160, v86, v142, v143, v144, v145, v146, v147);
        goto LABEL_162;
      }
      v203 = 0u;
      v204 = 0u;
      v201 = 0u;
      v202 = 0u;
      v86 = v168;
      v120 = -[NSObject countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v201, v239, 16);
      if (!v120)
        goto LABEL_162;
      v122 = v120;
      v123 = *(_QWORD *)v202;
      *(_QWORD *)&v121 = 138412290;
      v159 = v121;
      v180 = v86;
      v164 = *(_QWORD *)v202;
LABEL_130:
      v124 = 0;
      v171 = v122;
      while (1)
      {
        if (*(_QWORD *)v202 != v123)
          objc_enumerationMutation(v86);
        v125 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * v124);
        if (!v125)
          goto LABEL_157;
        objc_msgSend(v125, "cnContactId");
        v126 = (char *)objc_claimAutoreleasedReturnValue();
        if (!v126)
        {
          __atxlog_handle_notification_management();
          v127 = objc_claimAutoreleasedReturnValue();
          logc = v127;
          if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v244 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
            _os_log_impl(&dword_1C9A3B000, v127, OS_LOG_TYPE_INFO, "%s: Contact doesn't have a cnContactId. Skipping.", buf, 0xCu);
          }
          goto LABEL_155;
        }
        if (-[ATXNotificationSettingsReaderProtocol contactIsOnDenyList:dndModeUUID:](self->_notificationSettingsReader, "contactIsOnDenyList:dndModeUUID:", v126, v189))
        {
          __atxlog_handle_notification_management();
          logc = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(logc, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v159;
            v244 = v126;
            _os_log_debug_impl(&dword_1C9A3B000, logc, OS_LOG_TYPE_DEBUG, "Not suggesting contact: %@ for deny list because it's already there", buf, 0xCu);
          }
LABEL_155:

          goto LABEL_156;
        }
        if (!-[ATXNotificationInterruptionTuner contactWithIdentifier:isRecommendedByAllowListModel:](self, "contactWithIdentifier:isRecommendedByAllowListModel:", v126, v85))break;
LABEL_156:

LABEL_157:
        if (++v124 == v122)
        {
          v122 = -[NSObject countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v201, v239, 16);
          if (!v122)
            goto LABEL_162;
          goto LABEL_130;
        }
      }
      v199 = 0u;
      v200 = 0u;
      v197 = 0u;
      v198 = 0u;
      objc_msgSend(v181, "objectForKeyedSubscript:", v126);
      logc = objc_claimAutoreleasedReturnValue();
      v128 = -[NSObject countByEnumeratingWithState:objects:count:](logc, "countByEnumeratingWithState:objects:count:", &v197, v238, 16);
      if (!v128)
        goto LABEL_155;
      v129 = v128;
      v176 = v124;
      v130 = *(_QWORD *)v198;
      v132 = logc;
      v131 = v189;
LABEL_143:
      v133 = 0;
      while (1)
      {
        if (*(_QWORD *)v198 != v130)
          objc_enumerationMutation(v132);
        v134 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * v133);
        objc_msgSend(v134, "bundleID", v159);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[ATXNotificationSettingsReaderProtocol appIsOnDenyList:dndModeUUID:](self->_notificationSettingsReader, "appIsOnDenyList:dndModeUUID:", v135, v131))break;
        if (-[ATXNotificationInterruptionTuner validateNotificationUrgency:](self, "validateNotificationUrgency:", v134))
        {
          v136 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF8EF8]), "initWithSuggestionType:", 3);
          v137 = objc_alloc(MEMORY[0x1E0CF8F90]);
          v138 = (void *)objc_opt_new();
          v139 = (void *)objc_opt_new();
          objc_msgSend(v134, "uuid");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          v141 = (void *)objc_msgSend(v137, "initWithInterruptionManagerTuningSuggestion:scope:entityIdentifier:uuid:timestamp:triggerNotificationUUID:", v136, 3, v126, v138, v139, v140);

          self = v192;
          objc_msgSend(v191, "addObject:", v141);

          v132 = logc;
          v131 = v189;
LABEL_151:

        }
        if (v129 == ++v133)
        {
          v129 = -[NSObject countByEnumeratingWithState:objects:count:](v132, "countByEnumeratingWithState:objects:count:", &v197, v238, 16);
          if (!v129)
          {
            v85 = v167;
            v124 = v176;
            v86 = v180;
            v123 = v164;
            v122 = v171;
            goto LABEL_155;
          }
          goto LABEL_143;
        }
      }
      __atxlog_handle_notification_management();
      v136 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v244 = v126;
        v245 = 2112;
        v246 = (uint64_t)v135;
        _os_log_impl(&dword_1C9A3B000, v136, OS_LOG_TYPE_INFO, "Not suggesting contact: %@ because app: %@ is already denied so no reason to suggest denying the contact as well.", buf, 0x16u);
      }
      goto LABEL_151;
    }
    v166 = v12;
    -[ATXInterruptionManager recommendedAllowedAppsForMode:](self->_interruptionManager, "recommendedAllowedAppsForMode:", v162);
    v13 = objc_claimAutoreleasedReturnValue();
    -[ATXInterruptionManager recommendedDeniedAppsForMode:](self->_interruptionManager, "recommendedDeniedAppsForMode:", v162);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = (void *)objc_opt_new();
    v174 = v13;
    v169 = v14;
    if (v166 == 2)
    {
      __atxlog_handle_notification_management();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        ATXModeToString();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        DNDStringFromConfigurationType();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v244 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
        v245 = 2114;
        v246 = (uint64_t)v45;
        v247 = 2114;
        v248 = v46;
        _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "%s: Not returning any notification adjacent suggestions for apps because mode: %{public}@ is in an unconfigured state: %{public}@", buf, 0x20u);

      }
LABEL_73:

      __atxlog_handle_notification_management();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        v72 = objc_msgSend(v190, "count");
        DNDStringFromConfigurationType();
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v244 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
        v245 = 2048;
        v246 = v72;
        v247 = 2112;
        v248 = v73;
        _os_log_impl(&dword_1C9A3B000, v71, OS_LOG_TYPE_INFO, "%s: Created %ld app suggestions for DND configuration type: %@", buf, 0x20u);

      }
      v215 = 0u;
      v216 = 0u;
      v213 = 0u;
      v214 = 0u;
      v74 = v190;
      v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v213, v242, 16);
      if (v75)
      {
        v76 = v75;
        v77 = *(_QWORD *)v214;
        do
        {
          for (k = 0; k != v76; ++k)
          {
            if (*(_QWORD *)v214 != v77)
              objc_enumerationMutation(v74);
            v79 = *(_QWORD *)(*((_QWORD *)&v213 + 1) + 8 * k);
            __atxlog_handle_notification_management();
            v80 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v244 = "-[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:]";
              v245 = 2112;
              v246 = v79;
              _os_log_debug_impl(&dword_1C9A3B000, v80, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
            }

          }
          v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v213, v242, 16);
        }
        while (v76);
      }

      v7 = v161;
      objc_msgSend(v161, "addObjectsFromArray:", v74);

      v9 = v189;
      v37 = v174;
      goto LABEL_85;
    }
    if (v166 != 1)
    {
      if (!v166)
      {
        v231 = 0u;
        v232 = 0u;
        v229 = 0u;
        v230 = 0u;
        v15 = v13;
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v229, v252, 16);
        if (!v16)
          goto LABEL_73;
        v17 = v16;
        v18 = *(_QWORD *)v230;
        v183 = v15;
        v172 = *(_QWORD *)v230;
        while (1)
        {
          v19 = 0;
          v177 = v17;
          do
          {
            if (*(_QWORD *)v230 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v229 + 1) + 8 * (_QWORD)v19);
            if (v20)
            {
              objc_msgSend(v20, "bundleId");
              v21 = (char *)objc_claimAutoreleasedReturnValue();
              if (-[ATXNotificationSettingsReaderProtocol appIsOnAllowList:dndModeUUID:](self->_notificationSettingsReader, "appIsOnAllowList:dndModeUUID:", v21, v189))
              {
                __atxlog_handle_notification_management();
                v22 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                  goto LABEL_18;
                *(_DWORD *)buf = 138412290;
                v244 = v21;
                v23 = v22;
                v24 = "Not suggesting app: %@ for allow list because it's already there";
LABEL_37:
                _os_log_debug_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEBUG, v24, buf, 0xCu);
                goto LABEL_18;
              }
              if (!-[ATXNotificationInterruptionTuner appWithBundleId:isRecommendedByDenyListModel:](self, "appWithBundleId:isRecommendedByDenyListModel:", v21, v14))
              {
                if (-[ATXNotificationSettingsReaderProtocol doesAppSendNotificationsToDigest:](self->_notificationSettingsReader, "doesAppSendNotificationsToDigest:", v21))
                {
                  __atxlog_handle_notification_management();
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v244 = v21;
                    v23 = v22;
                    v24 = "Not suggesting app: %@ for allow list because app is configured to go to digest";
                    goto LABEL_37;
                  }
                }
                else
                {
                  v227 = 0u;
                  v228 = 0u;
                  v225 = 0u;
                  v226 = 0u;
                  objc_msgSend(v182, "objectForKeyedSubscript:", v21);
                  v22 = objc_claimAutoreleasedReturnValue();
                  v25 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v225, v251, 16);
                  if (v25)
                  {
                    v26 = v25;
                    log = v19;
                    v27 = *(_QWORD *)v226;
                    do
                    {
                      for (m = 0; m != v26; ++m)
                      {
                        if (*(_QWORD *)v226 != v27)
                          objc_enumerationMutation(v22);
                        v29 = *(void **)(*((_QWORD *)&v225 + 1) + 8 * m);
                        if (-[ATXNotificationInterruptionTuner validateNotificationUrgency:](self, "validateNotificationUrgency:", v29))
                        {
                          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8EF8]), "initWithSuggestionType:", 1);
                          v31 = objc_alloc(MEMORY[0x1E0CF8F90]);
                          v32 = (void *)objc_opt_new();
                          v33 = (void *)objc_opt_new();
                          objc_msgSend(v29, "uuid");
                          v34 = (void *)objc_claimAutoreleasedReturnValue();
                          v35 = (void *)objc_msgSend(v31, "initWithInterruptionManagerTuningSuggestion:scope:entityIdentifier:uuid:timestamp:triggerNotificationUUID:", v30, 1, v21, v32, v33, v34);

                          objc_msgSend(v190, "addObject:", v35);
                          self = v192;

                        }
                      }
                      v26 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v225, v251, 16);
                    }
                    while (v26);
                    v14 = v169;
                    v18 = v172;
                    v15 = v183;
                    v17 = v177;
                    v19 = log;
                  }
                }
LABEL_18:

              }
            }
            v19 = (os_log_t)((char *)v19 + 1);
          }
          while (v19 != (os_log_t)v17);
          v36 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v229, v252, 16);
          v17 = v36;
          if (!v36)
            goto LABEL_73;
        }
      }
      __atxlog_handle_notification_management();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[ATXNotificationInterruptionTuner activeNotificationSuggestionsForMode:candidateNotifications:].cold.2(v166, v15, v65, v66, v67, v68, v69, v70);
      goto LABEL_73;
    }
    v223 = 0u;
    v224 = 0u;
    v221 = 0u;
    v222 = 0u;
    v15 = v14;
    v47 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v221, v250, 16);
    if (!v47)
      goto LABEL_73;
    v48 = v47;
    v49 = *(_QWORD *)v222;
    v184 = v15;
    v173 = *(_QWORD *)v222;
LABEL_48:
    v50 = 0;
    v178 = v48;
    while (1)
    {
      if (*(_QWORD *)v222 != v49)
        objc_enumerationMutation(v15);
      v51 = *(void **)(*((_QWORD *)&v221 + 1) + 8 * (_QWORD)v50);
      if (!v51)
        goto LABEL_68;
      objc_msgSend(v51, "bundleId");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ATXNotificationSettingsReaderProtocol appIsOnDenyList:dndModeUUID:](self->_notificationSettingsReader, "appIsOnDenyList:dndModeUUID:", v52, v189))break;
      if (!-[ATXNotificationInterruptionTuner appWithBundleId:isRecommendedByAllowListModel:](self, "appWithBundleId:isRecommendedByAllowListModel:", v52, v13))
      {
        v219 = 0u;
        v220 = 0u;
        v217 = 0u;
        v218 = 0u;
        objc_msgSend(v182, "objectForKeyedSubscript:", v52);
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = -[NSObject countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v217, v249, 16);
        if (v54)
        {
          v55 = v54;
          loga = v50;
          v56 = *(_QWORD *)v218;
          do
          {
            for (n = 0; n != v55; ++n)
            {
              if (*(_QWORD *)v218 != v56)
                objc_enumerationMutation(v53);
              v58 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * n);
              if (-[ATXNotificationInterruptionTuner validateNotificationUrgency:](self, "validateNotificationUrgency:", v58))
              {
                v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8EF8]), "initWithSuggestionType:", 3);
                v60 = objc_alloc(MEMORY[0x1E0CF8F90]);
                v61 = (void *)objc_opt_new();
                v62 = (void *)objc_opt_new();
                objc_msgSend(v58, "uuid");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v64 = (void *)objc_msgSend(v60, "initWithInterruptionManagerTuningSuggestion:scope:entityIdentifier:uuid:timestamp:triggerNotificationUUID:", v59, 1, v52, v61, v62, v63);

                self = v192;
                objc_msgSend(v190, "addObject:", v64);

              }
            }
            v55 = -[NSObject countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v217, v249, 16);
          }
          while (v55);
          v13 = v174;
          v48 = v178;
          v15 = v184;
          v49 = v173;
          v50 = loga;
        }
        goto LABEL_66;
      }
LABEL_67:

LABEL_68:
      v50 = (os_log_t)((char *)v50 + 1);
      if (v50 == (os_log_t)v48)
      {
        v48 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v221, v250, 16);
        if (!v48)
          goto LABEL_73;
        goto LABEL_48;
      }
    }
    __atxlog_handle_notification_management();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v244 = (const char *)v52;
      _os_log_debug_impl(&dword_1C9A3B000, v53, OS_LOG_TYPE_DEBUG, "Not suggesting app: %@ for deny list because it's already there", buf, 0xCu);
    }
LABEL_66:

    goto LABEL_67;
  }
  v7 = (void *)MEMORY[0x1E0C9AA60];
LABEL_4:

  return v7;
}

void __96__ATXNotificationInterruptionTuner_activeNotificationSuggestionsForMode_candidateNotifications___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v3);

    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v13);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8FC0]), "initWithUserNotification:", v13);
  objc_msgSend(v7, "contactEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cnContactId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v9);

    }
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
}

- (BOOL)validateNotificationUrgency:(id)a3
{
  id v3;
  NSObject *v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "urgency") && objc_msgSend(v3, "urgency") != 1)
  {
    v5 = 1;
  }
  else
  {
    __atxlog_handle_notification_management();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[ATXNotificationInterruptionTuner validateNotificationUrgency:].cold.1(v3, v4);

    v5 = 0;
  }

  return v5;
}

- (id)dndModeUUID:(unint64_t)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[ATXDNDModeConfigurationClient dndModeForATXMode:](self->_modeConfigClient, "dndModeForATXMode:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    __atxlog_handle_notification_management();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      ATXModeToString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Unable to retrieve dndModeUUID for ATXMode: %@", (uint8_t *)&v7, 0xCu);

    }
  }
  return v3;
}

- (BOOL)appWithBundleId:(id)a3 isRecommendedByAllowListModel:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "bundleId", (_QWORD)v16);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v10, "bundleId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v5);

          if ((v14 & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v7;
}

- (BOOL)appWithBundleId:(id)a3 isRecommendedByDenyListModel:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "bundleId", (_QWORD)v16);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v10, "bundleId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v5);

          if ((v14 & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v7;
}

- (BOOL)contactWithIdentifier:(id)a3 isRecommendedByAllowListModel:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "cnContactId", (_QWORD)v16);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v10, "cnContactId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v5);

          if ((v14 & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v7;
}

- (BOOL)contactWithIdentifier:(id)a3 isRecommendedByDenyListModel:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "cnContactId", (_QWORD)v16);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v10, "cnContactId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v5);

          if ((v14 & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptionManager, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_modeConfigClient, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_notificationSettingsReader, 0);
  objc_storeStrong((id *)&self->_modesModels, 0);
}

- (void)activeNotificationSuggestionsForMode:(uint64_t)a3 candidateNotifications:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%s: Failed to get the DND allow/silence list configuration for contacts", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)activeNotificationSuggestionsForMode:(uint64_t)a3 candidateNotifications:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a2, a3, "Unknown configuration type: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)activeNotificationSuggestionsForMode:(uint64_t)a3 candidateNotifications:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%s: Failed to get the DND allow/silence list configuration for apps", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)validateNotificationUrgency:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[ATXNotificationInterruptionTuner validateNotificationUrgency:]";
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "%s: Not sending suggestion for critical/time sensitive notification from app: %@", (uint8_t *)&v4, 0x16u);

}

@end
