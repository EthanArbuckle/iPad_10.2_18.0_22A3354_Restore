@implementation FCNewsAppConfig

uint64_t __75__FCNewsAppConfig_languageConfigDictionaryForConfig_preferredLanguageTags___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lowercaseString");
}

- (FCTopStoriesConfiguration)topStoriesConfig
{
  return self->_topStoriesConfig;
}

- (int64_t)articleRapidUpdatesTimeout
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("articleRapidUpdatesTimeout"), 21600);

  return v3;
}

void __48__FCNewsAppConfig__loadSuperfeedConfigOverrides__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__FCNewsAppConfig__loadSuperfeedConfigOverrides__block_invoke_2;
  v6[3] = &unk_1E463E1E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

- (FCTimesOfDayConfiguration)timesOfDayConfiguration
{
  return self->_timesOfDayConfiguration;
}

- (FCNewsTabiConfiguration)newsTabiConfiguration
{
  return self->_newsTabiConfiguration;
}

- (BOOL)statelessPersonalizationEnabled
{
  void *v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;

  if (!NFInternalBuild())
  {
LABEL_5:
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("statelessPersonalizationEnabled2"), 0);

    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v7);
  }
  NewsCoreUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("news.features.statelessPersonalization"));

  if (v4 != 1)
  {
    if (v4 == 2)
      return 0;
    goto LABEL_5;
  }
  return 1;
}

- (BOOL)clientSideEngagementBoostEnabled
{
  void *v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;

  if (!NFInternalBuild())
  {
LABEL_5:
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("clientSideEngagementBoostEnabled"), 0);

    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v7);
  }
  NewsCoreUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("news.features.clientSideEngagementBoost"));

  if (v4 != 1)
  {
    if (v4 == 2)
      return 0;
    goto LABEL_5;
  }
  return 1;
}

- (id)expFieldForKey:(void *)a1
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;
  void *v11;

  v3 = a2;
  if (!a1)
  {
    v8 = 0;
    goto LABEL_8;
  }
  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("use_cached_exp_fields"));

    if (!v5)
    {
      objc_msgSend(a1, "languageConfigDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      FCAppConfigurationStringValue(v10, (uint64_t)v3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      NewsCoreUserDefaults();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11;
      if (v8)
        objc_msgSend(v11, "setObject:forKey:", v8, v3);
      else
        objc_msgSend(v11, "removeObjectForKey:", v3);
      goto LABEL_7;
    }
    NewsCoreUserDefaults();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringForKey:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "languageConfigDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v6, (uint64_t)v3, 0);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:

LABEL_8:
  return v8;
}

- (FCPaidBundleViaOfferConfig)paidBundleViaOfferConfig
{
  return self->_paidBundleViaOfferConfig;
}

- (FCPersonalizationPublisherDampeningConfig)shadowPublisherDampeningConfig
{
  void *v3;
  void *v4;
  FCPersonalizationPublisherDampeningConfig *v5;
  FCPersonalizationPublisherDampeningConfig *v6;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v3, (uint64_t)CFSTR("shadowPublisherDampeningConfig"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[FCPersonalizationPublisherDampeningConfig initWithConfig:]([FCPersonalizationPublisherDampeningConfig alloc], "initWithConfig:", v4);
  }
  else
  {
    -[FCNewsAppConfig publisherDampeningConfig](self, "publisherDampeningConfig");
    v5 = (FCPersonalizationPublisherDampeningConfig *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (FCPersonalizationPublisherDampeningConfig)publisherDampeningConfig
{
  void *v2;
  void *v3;
  FCPersonalizationPublisherDampeningConfig *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("publisherDampeningConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[FCPersonalizationPublisherDampeningConfig initWithConfig:]([FCPersonalizationPublisherDampeningConfig alloc], "initWithConfig:", v3);
  return v4;
}

- (FCStatelessPersonalizationPublisherFavorability)statelessPersonalizationPublisherFavorability
{
  FCStatelessPersonalizationPublisherFavorability *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  FCStatelessPersonalizationPublisherFavorability *v8;

  v3 = [FCStatelessPersonalizationPublisherFavorability alloc];
  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("statelessPersonalizationPublisherFavorability"), 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5;
  else
    v7 = MEMORY[0x1E0C9AA60];
  v8 = -[FCStatelessPersonalizationPublisherFavorability initWithArray:](v3, "initWithArray:", v7);

  return v8;
}

- (NSString)engagementCohortsExpField
{
  return (NSString *)-[FCNewsAppConfig expFieldForKey:](self, CFSTR("engagementCohortsExpField"));
}

- (NSString)conversionCohortsExpField
{
  return (NSString *)-[FCNewsAppConfig expFieldForKey:](self, CFSTR("conversionCohortsExpField"));
}

- (BOOL)checkForPaywallConfigChangesEnabled
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("checkForPaywallConfigChangesEnabled"), 0);

  return v3;
}

- (NSDictionary)endpointConfigsByEnvironment
{
  return self->_endpointConfigsByEnvironment;
}

- (NSString)audioConfigRecordID
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  -[FCNewsAppConfig localizedStorefrontID](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  if (qword_1ED0F7EC0 != -1)
    dispatch_once(&qword_1ED0F7EC0, &__block_literal_global_991);
  v4 = (id)qword_1ED0F7EB8;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("U-%@-en"), CFSTR("143441"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v9, (uint64_t)CFSTR("audioConfigId"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (FCPuzzlesConfiguration)puzzlesConfig
{
  return self->_puzzlesConfig;
}

- (NSString)trendingTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("trendingTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)spotlightChannelID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("spotlightChannelId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sportsTopStoriesTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("sportsTopStoriesTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sportsStandingsTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("sportLeagueStandingsTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sportsBracketTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("sportBracketTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sportTeamScoresTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("sportTeamScoresTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sportTeamHighlightsTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("sportTeamHighlightsTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sportScoresTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("sportScoresTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sportLeagueScoresTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("sportLeagueScoresTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sportLeagueHighlightsTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("sportLeagueHighlightsTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sportHighlightsTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("sportHighlightsTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sportEventHighlightsTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("sportEventHighlightsTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)shortcutsTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("shortcutsTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)savedStoriesTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("savedStoriesTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)mySportsTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("mySportsTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)mySportsScoresTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("mySportsScoresTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)mySportsHighlightsTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("mySportsHighlightsTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)myMagazinesTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("myMagazinesTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)featuredStoriesTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("featuredStoriesTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)briefingsTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("briefingsTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (_BYTE)initWithConfigDictionary:(void *)a3 storefrontID:(void *)a4 languageConfigDictionary:
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  FCPeopleAlsoReadConfiguration *v23;
  void *v24;
  FCOfflineDownloadsConfiguration *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  FCOfflineDownloadsConfiguration *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __int16 v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  uint64_t v41;
  void *v42;
  unsigned __int8 v43;
  void *v44;
  uint64_t v45;
  id v46;
  _BYTE *v47;
  void *v48;
  uint64_t v49;
  _BYTE *v50;
  _BYTE *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
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
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  FCNotificationsConfiguration *v83;
  void *v84;
  void *v85;
  void *v86;
  FCTopStoriesConfiguration *v87;
  void *v88;
  void *v89;
  void *v90;
  FCForYouGroupsConfiguration *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  FCPuzzlesConfiguration *v97;
  void *v98;
  void *v99;
  void *v100;
  FCIAdConfiguration *v101;
  void *v102;
  void *v103;
  void *v104;
  FCPrefetchConfiguration *v105;
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
  FCWidgetConfig *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t i;
  uint64_t v126;
  FCChannelPaywallConfig *v127;
  void *v128;
  FCChannelPaywallConfig *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t j;
  uint64_t v140;
  FCChannelUpsellConfig *v141;
  void *v142;
  FCChannelUpsellConfig *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  FCSportsUpsellConfig *v148;
  void *v149;
  void *v150;
  void *v151;
  FCLocationSharingUpsellConfig *v152;
  void *v153;
  void *v154;
  void *v155;
  FCPaidBundleViaOfferConfig *v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  FCPaidBundleConfiguration *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  NSObject *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  NSObject *v174;
  FCNewsPersonalizationConfiguration *v175;
  void *v176;
  const __CFString *v177;
  NSObject *v178;
  void *v179;
  uint64_t v180;
  void *v181;
  FCNewsTabiConfiguration *v182;
  void *v183;
  void *v184;
  void *v185;
  NSObject *v186;
  void *v187;
  void *v188;
  FCNewsTabiConfiguration *v189;
  id v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  FCNewsTabiConfiguration *v195;
  NSObject *v196;
  FCNewsTabiConfiguration *v197;
  FCNewsTabiConfiguration *v198;
  NSObject *v199;
  NSObject *v200;
  _BOOL4 v201;
  uint64_t v202;
  void *v203;
  NSObject *v204;
  void *v205;
  NSObject *v206;
  void *v207;
  uint64_t v208;
  NSObject *v209;
  void *v210;
  void *v211;
  void *v212;
  id v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t k;
  uint64_t v218;
  FCChannelPickerConfig *v219;
  void *v220;
  FCChannelPickerConfig *v221;
  uint64_t v222;
  void *v223;
  void *v224;
  void *v225;
  FCLaunchPresentationConfig *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  id v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t m;
  uint64_t v236;
  FCCampaignReferralConfig *v237;
  void *v238;
  FCCampaignReferralConfig *v239;
  uint64_t v240;
  void *v241;
  void *v242;
  void *v243;
  FCTimesOfDayConfiguration *v244;
  void *v245;
  void *v246;
  uint64_t v247;
  void *v248;
  uint64_t v249;
  void *v250;
  void *v251;
  void *v252;
  id v253;
  uint64_t v254;
  void *v255;
  void *v256;
  void *v257;
  id v258;
  void *v259;
  id v260;
  NSObject *v261;
  _BOOL4 v262;
  id v263;
  NSObject *v264;
  uint64_t v265;
  void *v266;
  NSObject *v268;
  uint64_t v269;
  void *v270;
  uint64_t v271;
  NSObject *v272;
  NSObject *v273;
  void *v274;
  uint64_t v275;
  FCNewsTabiConfiguration *v276;
  void *v277;
  uint64_t v278;
  void *v279;
  NSObject *v280;
  NSObject *v281;
  void *v282;
  id v283;
  void *v284;
  void *v285;
  _BYTE *v286;
  id obj;
  uint64_t v288;
  void *v289;
  void *v290;
  uint64_t v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  FCEndpointConfiguration *v298;
  FCEndpointConfiguration *v299;
  uint64_t v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  char log;
  os_log_t loga;
  NSObject *logb;
  _QWORD v312[4];
  id v313;
  objc_super v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  uint8_t buf[32];
  _DWORD v320[8];
  void *v321;
  _BYTE v322[24];
  const __CFString *v323;
  id v324;
  uint64_t v325;

  v325 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1
    || (v314.receiver = a1,
        v314.super_class = (Class)FCNewsAppConfig,
        (v10 = objc_msgSendSuper2(&v314, sel_init)) == 0))
  {
    v51 = 0;
    goto LABEL_104;
  }
  v11 = v10;
  v12 = objc_msgSend(v7, "copy");
  v13 = (void *)v11[2];
  v11[2] = v12;

  v14 = objc_msgSend(v8, "copy");
  v15 = (void *)v11[6];
  v11[6] = v14;

  v283 = v9;
  v16 = objc_msgSend(v9, "copy");
  v17 = (void *)v11[7];
  v11[7] = v16;

  v18 = objc_alloc(MEMORY[0x1E0D60AD0]);
  v312[0] = MEMORY[0x1E0C809B0];
  v312[1] = 3221225472;
  v312[2] = __82__FCNewsAppConfig_initWithConfigDictionary_storefrontID_languageConfigDictionary___block_invoke;
  v312[3] = &unk_1E463B350;
  v313 = v7;
  v19 = objc_msgSend(v18, "initWithConstructor:", v312);
  v20 = (void *)v11[48];
  v11[48] = v19;

  objc_msgSend(v11, "languageConfigDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithOverride(v21, CFSTR("peopleAlsoReadConfiguration"), CFSTR("news.news_personalization.people_also_read_config_overrides.enabled"), CFSTR("news.news_personalization.people_also_read_config_overrides.json"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[FCPeopleAlsoReadConfiguration initWithDictionary:]([FCPeopleAlsoReadConfiguration alloc], "initWithDictionary:", v22);
  v24 = (void *)v11[3];
  v11[3] = v23;

  v25 = [FCOfflineDownloadsConfiguration alloc];
  objc_msgSend(v11, "configDictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v26, (uint64_t)CFSTR("offlineDownloadsConfig"), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[FCOfflineDownloadsConfiguration initWithDictionary:optimized:](v25, "initWithDictionary:optimized:", v27, 0);
  v29 = (void *)v11[4];
  v11[4] = v28;

  v30 = [FCOfflineDownloadsConfiguration alloc];
  objc_msgSend(v11, "configDictionary");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v31, (uint64_t)CFSTR("offlineDownloadsConfigOptimized"), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[FCOfflineDownloadsConfiguration initWithDictionary:optimized:](v30, "initWithDictionary:optimized:", v32, 1);
  v34 = (void *)v11[5];
  v11[5] = v33;

  objc_msgSend(v11, "configDictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = FCAppConfigurationIntegerValue(v35, (uint64_t)CFSTR("enabledPrivateDataEncryptionLevel"), 896);

  objc_msgSend(v11, "configDictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  log = FCAppConfigurationIntegerValue(v37, (uint64_t)CFSTR("privateDataMigrationCleanupLevel"), 7);

  objc_msgSend(v11, "configDictionary");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = FCAppConfigurationIntegerValue(v38, (uint64_t)CFSTR("privateDataSecureSubscriptionsLevel"), 7);

  objc_msgSend(v11, "configDictionary");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = FCAppConfigurationIntegerValue(v40, (uint64_t)CFSTR("privateDataSecureSubscriptionsCleanupLevel"), 0xFFFFFFFFLL);

  objc_msgSend(v11, "configDictionary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = FCAppConfigurationIntegerValue(v42, (uint64_t)CFSTR("privateDataEncryptionRequiredLevel"), 7);

  objc_msgSend(v11, "configDictionary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = FCAppConfigurationIntegerValue(v44, (uint64_t)CFSTR("privateDataMigrateToV4Level"), 0);

  objc_msgSend(v11, "configDictionary");
  v46 = v7;
  v47 = v11;
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = FCAppConfigurationIntegerValue(v48, (uint64_t)CFSTR("privateDataCleanupToV4Level"), 0);

  v285 = v8;
  v286 = v47;
  v284 = v46;
  if (NFInternalBuild())
  {
    v47[8] = (v36 & 0x480) != 0;
    v47[9] = (v36 & 0x80) != 0;
    v47[10] = log & 1;
    v47[11] = v39 & 1;
    v50 = v47;
  }
  else
  {
    v50 = v47;
    if (NFSeedBuild())
    {
      v47[8] = (v36 & 0x900) != 0;
      v47[9] = HIBYTE(v36) & 1;
      v47[10] = (log & 2) != 0;
      v47[11] = (v39 & 2) != 0;
      v43 >>= 1;
    }
    else
    {
      v47[8] = (v36 & 0x1200) != 0;
      v47[9] = (v36 & 0x200) != 0;
      v47[10] = (log & 4) != 0;
      v47[11] = (v39 & 4) != 0;
      v43 >>= 2;
    }
  }
  v50[13] = v43 & 1;
  v50[12] = +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v41);
  v50[14] = +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v45);
  v50[15] = +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v49);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v290 = (void *)objc_opt_new();
  objc_msgSend(v50, "configDictionary");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v52, (uint64_t)CFSTR("endpointConfigs"), 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v317 = 0u;
  v318 = 0u;
  v315 = 0u;
  v316 = 0u;
  obj = v53;
  v291 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v315, v322, 16);
  if (v291)
  {
    v288 = *(_QWORD *)v316;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v316 != v288)
          objc_enumerationMutation(obj);
        v300 = v54;
        v55 = *(void **)(*((_QWORD *)&v315 + 1) + 8 * v54);
        v298 = [FCEndpointConfiguration alloc];
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("clientApiBaseUrl"), 0);
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("newsNotificationsBaseUrl"), 0);
        loga = (os_log_t)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("staticAssetBaseUrl"), 0);
        v307 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("remoteDataSourceBaseUrl"), 0);
        v297 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("newsletterApiBaseUrl"), 0);
        v296 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("appAnalyticsEndpointUrl"), 0);
        v295 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("fairPlayEndpointUrl"), 0);
        v306 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("searchApiBaseUrl"), 0);
        v305 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("puzzlesArchiveApiBaseUrl"), 0);
        v304 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("appAnalyticsNotificationReceiptBaseUrl"), 0);
        v303 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("authTokenApiBaseUrl"), 0);
        v302 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("sportsDataVisualizationApiBaseUrl"), 0);
        v301 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("fineGrainedNewsletterSubscriptionBaseUrl"), 0);
        v294 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("appAnalyticsSportsEventsEndpointUrl"), 0);
        v293 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("appHealthEventsEndpointUrl"), 0);
        v292 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("appHeartbeatEventsEndpointUrl"), 0);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("ckOrderFeedBaseUrl"), 0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("ckMultiFetchBaseUrl"), 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("ckRecordFetchBaseUrl"), 0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("ckEdgeCachedOrderFeedBaseUrl"), 0);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("ckEdgeCachedMultiFetchBaseUrl"), 0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v299 = -[FCEndpointConfiguration initWithClientAPIBaseURLString:notificationsBaseURLString:staticAssetBaseURLString:remoteDataSourceBaseURLString:newsletterAPIBaseURLString:appAnalyticsBaseURLString:fairPlayBaseURLString:searchAPIBaseURLString:puzzlesArchiveAPIBaseURLString:appAnalyticsNotificationReceiptBaseURLString:authTokenAPIBaseURLString:sportsDataVisualizationAPIBaseURLString:fineGrainedNewsletterSubscriptionBaseURLString:appAnalyticsSportsEventsBaseURLString:appAnalyticsAppHealthBaseURLString:appAnalyticsAppHeartbeatBaseURLString:ckOrderFeedBaseURLString:ckMultiFetchBaseURLString:ckRecordFetchBaseURLString:ckEdgeCachedOrderFeedBaseURLString:ckEdgeCachedMultiFetchBaseURLString:](v298, "initWithClientAPIBaseURLString:notificationsBaseURLString:staticAssetBaseURLString:remoteDataSourceBaseURLString:newsletterAPIBaseURLString:appAnalyticsBaseURLString:fairPlayBaseURLString:searchAPIBaseURLString:puzzlesArchiveAPIBaseURLString:appAnalyticsNotificationReceiptBaseURLString:authTokenAPIBaseURLString:sportsDataVisualizationAPIBaseURLString:fineGrainedNewsletterSubscriptionBaseURLString:appAnalyticsSportsEventsBaseURLString:appAnalyticsAppHealthBaseURLString:appAnalyticsAppHeartbeatBaseURLString:ckOrderFeedBaseURLString:ckMultiFetchBaseURLString:ckRecordFetchBaseURLString:ckEdgeCachedOrderFeedBaseURLString:ckEdgeCachedMultiFetchBaseURLString:", v308, loga, v307, v297, v296, v295, v306, v305, v304, v303, v302,
                 v301,
                 v294,
                 v293,
                 v292,
                 v56,
                 v57,
                 v58,
                 v59,
                 v60,
                 v61);

        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("environment"), 0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = FCEndpointEnvironmentForEnvironment(v62);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v289, "setObject:forKey:", v299, v64);
        v65 = (void *)FCAppConfigurationLog;
        if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_INFO))
        {
          logb = v65;
          -[FCEndpointConfiguration clientAPIBaseURLString](v299, "clientAPIBaseURLString");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCEndpointConfiguration notificationsBaseURLString](v299, "notificationsBaseURLString");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCEndpointConfiguration staticAssetBaseURLString](v299, "staticAssetBaseURLString");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCEndpointConfiguration remoteDataSourceBaseURLString](v299, "remoteDataSourceBaseURLString");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCEndpointConfiguration newsletterAPIBaseURLString](v299, "newsletterAPIBaseURLString");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCEndpointConfiguration appAnalyticsAppHeartbeatBaseURLString](v299, "appAnalyticsAppHeartbeatBaseURLString");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219522;
          *(_QWORD *)&buf[4] = v63;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v66;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v67;
          LOWORD(v320[0]) = 2112;
          *(_QWORD *)((char *)v320 + 2) = v68;
          HIWORD(v320[2]) = 2112;
          *(_QWORD *)&v320[3] = v69;
          LOWORD(v320[5]) = 2112;
          *(_QWORD *)((char *)&v320[5] + 2) = v70;
          HIWORD(v320[7]) = 2112;
          v321 = v71;
          _os_log_impl(&dword_1A1B90000, logb, OS_LOG_TYPE_INFO, "endpointConfig - environment: %ld, clientAPIURL: %@, notificationsURL: %@, staticAssetURL: %@, remoteDataSourcesURL: %@, newsletterURL: %@, appHeartbeatUrl: %@", buf, 0x48u);

        }
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("analyticsEndpointUrlsJson"), 0);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        FCAppConfigurationStringValue(v55, (uint64_t)CFSTR("analyticsEnvelopeContentTypePropJson"), 0);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        FCAnalyticsEnvelopeContentTypeConfigsByContentType(v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v290, "setObject:forKeyedSubscript:", v74, v64);

        v54 = v300 + 1;
      }
      while (v291 != v300 + 1);
      v291 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v315, v322, 16);
    }
    while (v291);
  }

  v75 = (void *)*((_QWORD *)v286 + 9);
  *((_QWORD *)v286 + 9) = v289;
  v76 = v289;

  v77 = (void *)*((_QWORD *)v286 + 49);
  *((_QWORD *)v286 + 49) = v290;

  objc_msgSend(v286, "languageConfigDictionary");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v78, (uint64_t)CFSTR("preSubscribedNotificationsChannelIds"), 0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v286, "languageConfigDictionary");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v80, (uint64_t)CFSTR("recommendedNotificationChannels"), 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v81, "fc_arrayByTransformingWithBlock:", &__block_literal_global_118);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = -[FCNotificationsConfiguration initWithPresubscribedChannelIDs:recommendedNotificationChannelIDs:]([FCNotificationsConfiguration alloc], "initWithPresubscribedChannelIDs:recommendedNotificationChannelIDs:", v79, v82);
  v84 = (void *)*((_QWORD *)v286 + 10);
  *((_QWORD *)v286 + 10) = v83;

  objc_msgSend(v286, "languageConfigDictionary");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v85, (uint64_t)CFSTR("topStoriesConfig"), 0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  v87 = -[FCTopStoriesConfiguration initWithConfigDictionary:]([FCTopStoriesConfiguration alloc], "initWithConfigDictionary:", v86);
  v88 = (void *)*((_QWORD *)v286 + 11);
  *((_QWORD *)v286 + 11) = v87;

  objc_msgSend(v286, "configDictionary");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v89, (uint64_t)CFSTR("forYouNonPersonalizedGroupsOrder"), 0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = -[FCForYouGroupsConfiguration initWithJSONConfiguration:]([FCForYouGroupsConfiguration alloc], "initWithJSONConfiguration:", v90);
  v92 = (void *)*((_QWORD *)v286 + 12);
  *((_QWORD *)v286 + 12) = v91;

  v93 = v285;
  objc_msgSend(v286, "languageConfigDictionary");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v94, (uint64_t)CFSTR("puzzlesConfig"), 0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)v322 = CFSTR("143441");
  *(_QWORD *)&v322[8] = CFSTR("143455");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v322, 2);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = -[FCPuzzlesConfiguration initWithConfigDictionary:storefrontID:defaultSupportedStorefronts:]([FCPuzzlesConfiguration alloc], "initWithConfigDictionary:storefrontID:defaultSupportedStorefronts:", v95, v93, v96);

  v98 = (void *)*((_QWORD *)v286 + 13);
  *((_QWORD *)v286 + 13) = v97;

  objc_msgSend(v286, "configDictionary");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v99, (uint64_t)CFSTR("iadConfig"), 0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  v101 = -[FCIAdConfiguration initWithConfigDictionary:]([FCIAdConfiguration alloc], "initWithConfigDictionary:", v100);
  v102 = (void *)*((_QWORD *)v286 + 14);
  *((_QWORD *)v286 + 14) = v101;

  objc_msgSend(v286, "configDictionary");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v103, (uint64_t)CFSTR("prefetchConfig"), 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = -[FCPrefetchConfiguration initWithConfigDictionary:]([FCPrefetchConfiguration alloc], "initWithConfigDictionary:", v104);
  v106 = (void *)*((_QWORD *)v286 + 15);
  *((_QWORD *)v286 + 15) = v105;

  objc_msgSend(v286, "languageConfigDictionary");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v107, (uint64_t)CFSTR("shareVideoPlayerConfig"), 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = (void *)objc_opt_new();
  FCAppConfigurationStringValue(v108, (uint64_t)CFSTR("discoverMoreVideosTitle"), 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setTitle:", v110);

  FCAppConfigurationStringValue(v108, (uint64_t)CFSTR("discoverMoreVideosSubtitle"), 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setSubtitle:", v111);

  FCAppConfigurationStringValue(v108, (uint64_t)CFSTR("discoverMoreVideosUrl"), 0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setActionURLString:", v112);

  v113 = (void *)*((_QWORD *)v286 + 17);
  *((_QWORD *)v286 + 17) = v109;

  objc_msgSend(v286, "configDictionary");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v114, (uint64_t)CFSTR("widgetConfig2"), 0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  v116 = -[FCWidgetConfig initWithConfigDictionary:]([FCWidgetConfig alloc], "initWithConfigDictionary:", v115);
  v117 = (void *)*((_QWORD *)v286 + 50);
  *((_QWORD *)v286 + 50) = v116;

  objc_msgSend(v286, "languageConfigDictionary");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v118, (uint64_t)CFSTR("channelPaywallConfigurations"), 0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v119, "count"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  memset(buf, 0, sizeof(buf));
  memset(v320, 0, sizeof(v320));
  v121 = v119;
  v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", buf, v322, 16);
  if (v122)
  {
    v123 = v122;
    v124 = **(_QWORD **)&buf[16];
    do
    {
      for (i = 0; i != v123; ++i)
      {
        if (**(_QWORD **)&buf[16] != v124)
          objc_enumerationMutation(v121);
        v126 = *(_QWORD *)(*(_QWORD *)&buf[8] + 8 * i);
        v127 = [FCChannelPaywallConfig alloc];
        objc_msgSend(v121, "objectForKeyedSubscript:", v126);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = -[FCChannelPaywallConfig initWithChannelID:configDictionary:](v127, "initWithChannelID:configDictionary:", v126, v128);

        objc_msgSend(v120, "setObject:forKeyedSubscript:", v129, v126);
      }
      v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", buf, v322, 16);
    }
    while (v123);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v120);
  v130 = objc_claimAutoreleasedReturnValue();
  v131 = (void *)*((_QWORD *)v286 + 19);
  *((_QWORD *)v286 + 19) = v130;

  objc_msgSend(v286, "languageConfigDictionary");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v132, (uint64_t)CFSTR("channelUpsellConfigurations2"), 0);
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v133, "count"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  memset(buf, 0, sizeof(buf));
  memset(v320, 0, sizeof(v320));
  v135 = v133;
  v136 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", buf, v322, 16);
  if (v136)
  {
    v137 = v136;
    v138 = **(_QWORD **)&buf[16];
    do
    {
      for (j = 0; j != v137; ++j)
      {
        if (**(_QWORD **)&buf[16] != v138)
          objc_enumerationMutation(v135);
        v140 = *(_QWORD *)(*(_QWORD *)&buf[8] + 8 * j);
        v141 = [FCChannelUpsellConfig alloc];
        objc_msgSend(v135, "objectForKeyedSubscript:", v140);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = -[FCChannelUpsellConfig initWithChannelID:configDictionary:](v141, "initWithChannelID:configDictionary:", v140, v142);

        objc_msgSend(v134, "setObject:forKeyedSubscript:", v143, v140);
      }
      v137 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", buf, v322, 16);
    }
    while (v137);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v134);
  v144 = objc_claimAutoreleasedReturnValue();
  v145 = (void *)*((_QWORD *)v286 + 18);
  *((_QWORD *)v286 + 18) = v144;

  objc_msgSend(v286, "languageConfigDictionary");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v146, (uint64_t)CFSTR("sportsUpsellConfiguration"), 0);
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  v148 = -[FCSportsUpsellConfig initWithConfigDictionary:]([FCSportsUpsellConfig alloc], "initWithConfigDictionary:", v147);
  v149 = (void *)*((_QWORD *)v286 + 20);
  *((_QWORD *)v286 + 20) = v148;

  objc_msgSend(v286, "languageConfigDictionary");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v150, (uint64_t)CFSTR("locationSharingUpsellConfiguration"), 0);
  v151 = (void *)objc_claimAutoreleasedReturnValue();

  v152 = -[FCLocationSharingUpsellConfig initWithConfigDictionary:]([FCLocationSharingUpsellConfig alloc], "initWithConfigDictionary:", v151);
  v153 = (void *)*((_QWORD *)v286 + 21);
  *((_QWORD *)v286 + 21) = v152;

  objc_msgSend(v286, "languageConfigDictionary");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v154, (uint64_t)CFSTR("paidBundleViaOfferConfiguration"), 0);
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  v156 = -[FCPaidBundleViaOfferConfig initWithConfigDictionary:]([FCPaidBundleViaOfferConfig alloc], "initWithConfigDictionary:", v155);
  v157 = (void *)*((_QWORD *)v286 + 22);
  *((_QWORD *)v286 + 22) = v156;

  v158 = v93;
  objc_msgSend(v286, "languageConfigDictionary");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v159, (uint64_t)CFSTR("paidBundleConfig"), 0);
  v160 = (void *)objc_claimAutoreleasedReturnValue();

  v161 = [FCPaidBundleConfiguration alloc];
  -[FCNewsAppConfig localizedStorefrontID](v286);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v322 = CFSTR("143441");
  *(_QWORD *)&v322[8] = CFSTR("143455");
  *(_QWORD *)&v322[16] = CFSTR("143444");
  v323 = CFSTR("143460");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v322, 4);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = -[FCPaidBundleConfiguration initWithConfigDictionary:storefrontID:localizedStorefrontID:defaultSupportedStoreFronts:](v161, "initWithConfigDictionary:storefrontID:localizedStorefrontID:defaultSupportedStoreFronts:", v160, v158, v162, v163);

  v165 = (void *)*((_QWORD *)v286 + 23);
  *((_QWORD *)v286 + 23) = v164;

  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v166, "integerForKey:", CFSTR("news.features.statelessPersonalization")) == 1)
    {
      objc_msgSend(v286, "configDictionary");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      FCAppConfigurationDictionaryValueWithDefaultValue(v167, (uint64_t)CFSTR("newsPersonalizationConfiguration"), 0);
      v168 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v168)
      {
        v169 = FCStatelessPersonalizationLog;
        if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v322 = 0;
          _os_log_impl(&dword_1A1B90000, v169, OS_LOG_TYPE_DEFAULT, "Stateless Personalization Enabled, but not personalization configuration was specified, falling back to default", v322, 2u);
        }
        +[FCNewsPersonalizationConfiguration defaultConfiguration](FCNewsPersonalizationConfiguration, "defaultConfiguration");
        v170 = objc_claimAutoreleasedReturnValue();
        v171 = (void *)*((_QWORD *)v286 + 40);
        *((_QWORD *)v286 + 40) = v170;
        goto LABEL_48;
      }
    }
    else
    {

    }
  }
  if (NFInternalBuild()
    && (objc_msgSend(v286, "configDictionary"),
        v172 = (void *)objc_claimAutoreleasedReturnValue(),
        FCAppConfigurationDictionaryValueWithDefaultValue(v172, (uint64_t)CFSTR("internalNewsPersonalizationConfiguration"), 0), v173 = (void *)objc_claimAutoreleasedReturnValue(), v173, v172, v173))
  {
    v174 = FCStatelessPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v322 = 0;
      _os_log_impl(&dword_1A1B90000, v174, OS_LOG_TYPE_DEFAULT, "Loading internal news personalization configuration", v322, 2u);
    }
    v175 = [FCNewsPersonalizationConfiguration alloc];
    objc_msgSend(v286, "configDictionary");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = v176;
    v177 = CFSTR("internalNewsPersonalizationConfiguration");
  }
  else
  {
    v178 = FCStatelessPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v322 = 0;
      _os_log_impl(&dword_1A1B90000, v178, OS_LOG_TYPE_DEFAULT, "Loading news personalization configuration", v322, 2u);
    }
    v175 = [FCNewsPersonalizationConfiguration alloc];
    objc_msgSend(v286, "configDictionary");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = v176;
    v177 = CFSTR("newsPersonalizationConfiguration");
  }
  FCAppConfigurationDictionaryValueWithDefaultValue(v176, (uint64_t)v177, 0);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = -[FCNewsPersonalizationConfiguration initWithDictionary:](v175, "initWithDictionary:", v179);
  v181 = (void *)*((_QWORD *)v286 + 40);
  *((_QWORD *)v286 + 40) = v180;

LABEL_48:
  if (!NFInternalBuild())
    goto LABEL_58;
  NewsCoreUserDefaults();
  v182 = (FCNewsTabiConfiguration *)objc_claimAutoreleasedReturnValue();
  if (-[FCNewsTabiConfiguration BOOLForKey:](v182, "BOOLForKey:", CFSTR("news.news_personalization.tabi.allow_tabi_configuration_from_user_defaults")))
  {
    NewsCoreUserDefaults();
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "stringForKey:", CFSTR("news.news_personalization.tabi.custom_tabi_configuration"));
    v184 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v184)
      goto LABEL_58;
    NewsCoreUserDefaults();
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "stringForKey:", CFSTR("news.news_personalization.tabi.custom_tabi_configuration"));
    v182 = (FCNewsTabiConfiguration *)objc_claimAutoreleasedReturnValue();

    v186 = FCTabiConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v322 = 138543362;
      *(_QWORD *)&v322[4] = v182;
      _os_log_impl(&dword_1A1B90000, v186, OS_LOG_TYPE_DEFAULT, "Found tabi config override enabled, specified as %{public}@", v322, 0xCu);
    }
    v187 = (void *)MEMORY[0x1E0CB36D8];
    -[FCNewsTabiConfiguration dataUsingEncoding:](v182, "dataUsingEncoding:", 4);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    objc_msgSend(v187, "JSONObjectWithData:options:error:", v188, 0, buf);
    v189 = (FCNewsTabiConfiguration *)objc_claimAutoreleasedReturnValue();
    v190 = *(id *)buf;

    if (v190)
    {
      v191 = (void *)FCTabiConfigurationLog;
      if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
      {
        v281 = v191;
        objc_msgSend(v190, "localizedDescription");
        v282 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v322 = 138543362;
        *(_QWORD *)&v322[4] = v282;
        _os_log_error_impl(&dword_1A1B90000, v281, OS_LOG_TYPE_ERROR, "Failed to decode tabi config into Dictionary, proceeding as if no override is in place %{public}@", v322, 0xCu);

      }
    }
    else
    {
      v195 = -[FCNewsTabiConfiguration initWithDictionary:]([FCNewsTabiConfiguration alloc], "initWithDictionary:", v189);
      -[FCNewsTabiConfiguration packageAssetIDs](v195, "packageAssetIDs");
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      v271 = objc_msgSend(v270, "count");

      if (v271)
      {
        objc_storeStrong((id *)v286 + 41, v195);
        v272 = FCTabiConfigurationLog;
        if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_DEFAULT))
        {
          v273 = v272;
          -[FCNewsTabiConfiguration version](v195, "version");
          v274 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v322 = 138543362;
          *(_QWORD *)&v322[4] = v274;
          _os_log_impl(&dword_1A1B90000, v273, OS_LOG_TYPE_DEFAULT, "Loaded user defaults tabi configuration version %{public}@", v322, 0xCu);

          v272 = FCTabiConfigurationLog;
        }
        if (!os_log_type_enabled(v272, OS_LOG_TYPE_DEFAULT))
          goto LABEL_76;
        v275 = *((_QWORD *)v286 + 41);
        *(_DWORD *)v322 = 138543362;
        *(_QWORD *)&v322[4] = v275;
        v209 = v272;
        goto LABEL_75;
      }
      v280 = FCTabiConfigurationLog;
      if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v322 = 0;
        _os_log_error_impl(&dword_1A1B90000, v280, OS_LOG_TYPE_ERROR, "Defaults specified tabi configuration didn't specify any packageAssetIDs, proceeding as if no override is in place", v322, 2u);
      }

    }
  }

LABEL_58:
  objc_msgSend(v286, "languageConfigDictionary");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v192, (uint64_t)CFSTR("newsTabiConfigurationV2"), 0);
  v182 = (FCNewsTabiConfiguration *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v286, "languageConfigDictionary");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v193, (uint64_t)CFSTR("newsTabiConfigurationDawnburstD"), 0);
  v189 = (FCNewsTabiConfiguration *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v286, "languageConfigDictionary");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v194, (uint64_t)CFSTR("newsTabiConfigurationDawnburstB"), 0);
  v195 = (FCNewsTabiConfiguration *)objc_claimAutoreleasedReturnValue();

  if (v182)
  {
    v196 = FCTabiConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v322 = 0;
      _os_log_impl(&dword_1A1B90000, v196, OS_LOG_TYPE_DEFAULT, "Found V2 tabi configuration", v322, 2u);
    }
    v197 = [FCNewsTabiConfiguration alloc];
    v198 = v182;
  }
  else if (v189)
  {
    v199 = FCTabiConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v322 = 0;
      _os_log_impl(&dword_1A1B90000, v199, OS_LOG_TYPE_DEFAULT, "Found DawnburstD tabi configuration", v322, 2u);
    }
    v197 = [FCNewsTabiConfiguration alloc];
    v198 = v189;
  }
  else
  {
    v200 = FCTabiConfigurationLog;
    v201 = os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_DEFAULT);
    if (!v195)
    {
      if (v201)
      {
        *(_WORD *)v322 = 0;
        _os_log_impl(&dword_1A1B90000, v200, OS_LOG_TYPE_DEFAULT, "Using baseline tabi configuration", v322, 2u);
      }
      v276 = [FCNewsTabiConfiguration alloc];
      objc_msgSend(v286, "languageConfigDictionary");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      FCAppConfigurationDictionaryValueWithDefaultValue(v203, (uint64_t)CFSTR("newsTabiConfiguration"), MEMORY[0x1E0C9AA70]);
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      v278 = -[FCNewsTabiConfiguration initWithDictionary:](v276, "initWithDictionary:", v277);
      v279 = (void *)*((_QWORD *)v286 + 41);
      *((_QWORD *)v286 + 41) = v278;

      goto LABEL_71;
    }
    if (v201)
    {
      *(_WORD *)v322 = 0;
      _os_log_impl(&dword_1A1B90000, v200, OS_LOG_TYPE_DEFAULT, "Found DawnburstB tabi configuration", v322, 2u);
    }
    v197 = [FCNewsTabiConfiguration alloc];
    v198 = v195;
  }
  v202 = -[FCNewsTabiConfiguration initWithDictionary:](v197, "initWithDictionary:", v198);
  v203 = (void *)*((_QWORD *)v286 + 41);
  *((_QWORD *)v286 + 41) = v202;
LABEL_71:

  v204 = FCAppConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
  {
    v205 = (void *)*((_QWORD *)v286 + 41);
    v206 = v204;
    objc_msgSend(v205, "version");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v322 = 138543362;
    *(_QWORD *)&v322[4] = v207;
    _os_log_impl(&dword_1A1B90000, v206, OS_LOG_TYPE_DEFAULT, "Loaded tabi configuration version %{public}@", v322, 0xCu);

    v204 = FCAppConfigurationLog;
  }
  if (!os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT))
    goto LABEL_76;
  v208 = *((_QWORD *)v286 + 41);
  *(_DWORD *)v322 = 138543362;
  *(_QWORD *)&v322[4] = v208;
  v209 = v204;
LABEL_75:
  _os_log_impl(&dword_1A1B90000, v209, OS_LOG_TYPE_DEFAULT, "Full configuration %{public}@", v322, 0xCu);
LABEL_76:

  objc_msgSend(v286, "languageConfigDictionary");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v210, (uint64_t)CFSTR("channelPickerConfigurations"), 0);
  v211 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v211, "count"));
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  memset(buf, 0, sizeof(buf));
  memset(v320, 0, sizeof(v320));
  v213 = v211;
  v214 = objc_msgSend(v213, "countByEnumeratingWithState:objects:count:", buf, v322, 16);
  if (v214)
  {
    v215 = v214;
    v216 = **(_QWORD **)&buf[16];
    do
    {
      for (k = 0; k != v215; ++k)
      {
        if (**(_QWORD **)&buf[16] != v216)
          objc_enumerationMutation(v213);
        v218 = *(_QWORD *)(*(_QWORD *)&buf[8] + 8 * k);
        v219 = [FCChannelPickerConfig alloc];
        objc_msgSend(v213, "objectForKeyedSubscript:", v218);
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        v221 = -[FCChannelPickerConfig initWithPickerID:configDictionary:](v219, "initWithPickerID:configDictionary:", v218, v220);

        objc_msgSend(v212, "setObject:forKeyedSubscript:", v221, v218);
      }
      v215 = objc_msgSend(v213, "countByEnumeratingWithState:objects:count:", buf, v322, 16);
    }
    while (v215);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v212);
  v222 = objc_claimAutoreleasedReturnValue();
  v223 = (void *)*((_QWORD *)v286 + 44);
  *((_QWORD *)v286 + 44) = v222;

  objc_msgSend(v286, "configDictionary");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v224, (uint64_t)CFSTR("launchPresentationConfigV2"), 0);
  v225 = (void *)objc_claimAutoreleasedReturnValue();

  v226 = -[FCLaunchPresentationConfig initWithConfigDictionary:]([FCLaunchPresentationConfig alloc], "initWithConfigDictionary:", v225);
  v227 = (void *)*((_QWORD *)v286 + 45);
  *((_QWORD *)v286 + 45) = v226;

  objc_msgSend(v286, "languageConfigDictionary");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v228, (uint64_t)CFSTR("campaignReferralConfigurations"), 0);
  v229 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v229, "count"));
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  memset(buf, 0, sizeof(buf));
  memset(v320, 0, sizeof(v320));
  v231 = v229;
  v232 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", buf, v322, 16);
  if (v232)
  {
    v233 = v232;
    v234 = **(_QWORD **)&buf[16];
    do
    {
      for (m = 0; m != v233; ++m)
      {
        if (**(_QWORD **)&buf[16] != v234)
          objc_enumerationMutation(v231);
        v236 = *(_QWORD *)(*(_QWORD *)&buf[8] + 8 * m);
        v237 = [FCCampaignReferralConfig alloc];
        objc_msgSend(v231, "objectForKeyedSubscript:", v236);
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        v239 = -[FCCampaignReferralConfig initWithCampaignID:configDictionary:](v237, "initWithCampaignID:configDictionary:", v236, v238);

        objc_msgSend(v230, "setObject:forKeyedSubscript:", v239, v236);
      }
      v233 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", buf, v322, 16);
    }
    while (v233);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v230);
  v240 = objc_claimAutoreleasedReturnValue();
  v51 = v286;
  v241 = (void *)*((_QWORD *)v286 + 46);
  *((_QWORD *)v286 + 46) = v240;

  if (NFInternalBuild()
    && (objc_msgSend(v286, "configDictionary"),
        v242 = (void *)objc_claimAutoreleasedReturnValue(),
        FCAppConfigurationDictionaryValueWithDefaultValue(v242, (uint64_t)CFSTR("timesOfDayConfiguration"), 0),
        v243 = (void *)objc_claimAutoreleasedReturnValue(),
        v243,
        v242,
        !v243))
  {
    v268 = FCStatelessPersonalizationLog;
    v8 = v285;
    v9 = v283;
    if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v322 = 0;
      _os_log_impl(&dword_1A1B90000, v268, OS_LOG_TYPE_DEFAULT, "See an internal build with no times of day configuration in the app config, falling back to default", v322, 2u);
    }
    +[FCTimesOfDayConfiguration defaultConfiguration](FCTimesOfDayConfiguration, "defaultConfiguration");
    v269 = objc_claimAutoreleasedReturnValue();
    v245 = (void *)*((_QWORD *)v286 + 43);
    *((_QWORD *)v286 + 43) = v269;
  }
  else
  {
    v244 = [FCTimesOfDayConfiguration alloc];
    objc_msgSend(v286, "configDictionary");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationDictionaryValueWithDefaultValue(v245, (uint64_t)CFSTR("timesOfDayConfiguration"), 0);
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    v247 = -[FCTimesOfDayConfiguration initWithDictionary:](v244, "initWithDictionary:", v246);
    v248 = (void *)*((_QWORD *)v286 + 43);
    *((_QWORD *)v286 + 43) = v247;

    v8 = v285;
    v9 = v283;
  }
  v249 = MEMORY[0x1E0C809B0];

  objc_msgSend(v286, "languageConfigDictionary");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v250, (uint64_t)CFSTR("superfeedConfigOverrides"), 0);
  v251 = (void *)objc_claimAutoreleasedReturnValue();

  v252 = (void *)MEMORY[0x1E0C99D80];
  *(_QWORD *)v322 = v249;
  *(_QWORD *)&v322[8] = 3221225472;
  *(_QWORD *)&v322[16] = __48__FCNewsAppConfig__loadSuperfeedConfigOverrides__block_invoke;
  v323 = (const __CFString *)&unk_1E463AA78;
  v324 = v251;
  v253 = v251;
  objc_msgSend(v252, "fc_dictionary:", v322);
  v254 = objc_claimAutoreleasedReturnValue();
  v255 = (void *)*((_QWORD *)v286 + 47);
  *((_QWORD *)v286 + 47) = v254;

  objc_msgSend(v286, "languageConfigDictionary");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v256, (uint64_t)CFSTR("autoFavoritesServiceConfiguration"), 0);
  v257 = (void *)objc_claimAutoreleasedReturnValue();

  if (v257)
  {
    v258 = v257;
    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v258, 0, buf);
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    v260 = *(id *)buf;
    v261 = FCAutoFavoritesServiceLog;
    v262 = os_log_type_enabled((os_log_t)FCAutoFavoritesServiceLog, OS_LOG_TYPE_DEFAULT);
    if (v260)
    {
      if (v262)
      {
        *(_DWORD *)v322 = 138543362;
        *(_QWORD *)&v322[4] = v260;
        _os_log_impl(&dword_1A1B90000, v261, OS_LOG_TYPE_DEFAULT, "Encountered error when encoding auto favorites service configuration as data, storing empty configuration. Error=%{public}@", v322, 0xCu);
      }
      objc_msgSend(CFSTR("{}"), "dataUsingEncoding:", 4);
      v263 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v262)
      {
        v264 = v261;
        v265 = objc_msgSend(v259, "length");
        *(_DWORD *)v322 = 134218242;
        *(_QWORD *)&v322[4] = v265;
        *(_WORD *)&v322[12] = 2114;
        *(_QWORD *)&v322[14] = v258;
        _os_log_impl(&dword_1A1B90000, v264, OS_LOG_TYPE_DEFAULT, "Successfully encoded %lu bytes for auto favorites service configuration %{public}@", v322, 0x16u);

      }
      v263 = v259;
    }
    v266 = (void *)*((_QWORD *)v286 + 42);
    *((_QWORD *)v286 + 42) = v263;

  }
  else
  {
    *(_QWORD *)v322 = v249;
    *(_QWORD *)&v322[8] = 3221225472;
    *(_QWORD *)&v322[16] = __57__FCNewsAppConfig__loadAutoFavoritesServiceConfiguration__block_invoke;
    v323 = (const __CFString *)&unk_1E463AB18;
    v324 = v286;
    __57__FCNewsAppConfig__loadAutoFavoritesServiceConfiguration__block_invoke((uint64_t)v322);
  }
  v7 = v284;

LABEL_104:
  return v51;
}

- (NSDictionary)languageConfigDictionary
{
  return self->_languageConfigDictionary;
}

- (int64_t)appConfigRefreshRate
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("appConfigRefreshRate"), 3600);

  return v3;
}

- (BOOL)isDefaultConfiguration
{
  void *v2;
  BOOL v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (NSDictionary)configDictionary
{
  return self->_configDictionary;
}

- (id)localizedStorefrontID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (a1)
  {
    objc_msgSend(a1, "storefrontID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "languageConfigDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("languageTag"), &stru_1E464BC40);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v2, "isEqualToString:", CFSTR("143455"))
      && objc_msgSend(v5, "isEqualToString:", CFSTR("fr-ca")))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v2, v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v6;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (BOOL)statelessPersonalizationAllowedForExtensions
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("statelessPersonalizationAllowedForExtensions"), 1);

  return v3;
}

- (FCNotificationsConfiguration)notificationsConfig
{
  return self->_notificationsConfig;
}

- (FCNewsPersonalizationConfiguration)newsPersonalizationConfiguration
{
  return self->_newsPersonalizationConfiguration;
}

- (BOOL)useSecureConnectionForAssets
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("useSecureConnectionForAssets"), 1);

  return v3;
}

- (int64_t)maximumRetryAfterForCK
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("maximumRetryAfterForCK"), 3600);

  return v3;
}

- (BOOL)isOrderFeedEndpointEnabled
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("orderFeedEnabledLevel"), 7);

  if ((NFInternalBuild() & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = NFSeedBuild();
    v4 = 4;
    if (v5)
      v4 = 2;
  }
  return (v4 & v3) != 0;
}

- (NSString)experimentalizableFieldPostfix
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("experimentalizableFieldPostfix"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)currentTreatment
{
  return 0;
}

- (BOOL)articleEmbeddingsEnabled
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("articleEmbeddingsEnabled"), 0);

  if (!NFInternalBuild())
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  NewsCoreUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("news.features.articleEmbeddingsEnabled"));

  if (v5 == 2)
    return 0;
  if (v5 != 1)
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  return 1;
}

- (BOOL)adInstrumentationEnabled
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("adInstrumentationEnabled"), 0);

  return v3;
}

- (FCSportsPrivacyConfiguration)sportsPrivacyConfiguration
{
  void *v2;
  void *v3;
  FCSportsPrivacyConfiguration *v4;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("sportsPrivacyConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[FCSportsPrivacyConfiguration initWithConfigDictionary:]([FCSportsPrivacyConfiguration alloc], "initWithConfigDictionary:", v3);
  return v4;
}

- (FCPaidBundleConfiguration)paidBundleConfig
{
  return self->_paidBundleConfig;
}

+ (_BYTE)configurationWithData:(void *)a3 storefrontID:(void *)a4 preferredLanguageTags:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _BYTE *v36;
  void *v37;
  id v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  id obj;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "data");
    *(_DWORD *)buf = 136315906;
    v61 = "+[FCNewsAppConfig configurationWithData:storefrontID:preferredLanguageTags:]";
    v62 = 2080;
    v63 = "FCNewsAppConfig.m";
    v64 = 1024;
    v65 = 170;
    v66 = 2114;
    v67 = v40;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "preferredLanguageTags");
    *(_DWORD *)buf = 136315906;
    v61 = "+[FCNewsAppConfig configurationWithData:storefrontID:preferredLanguageTags:]";
    v62 = 2080;
    v63 = "FCNewsAppConfig.m";
    v64 = 1024;
    v65 = 171;
    v66 = 2114;
    v67 = v41;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (v6
    && (objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, 0),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v46 = v7;
    v47 = v6;
    v10 = v9;
    v45 = v8;
    v11 = v8;
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v10, (uint64_t)CFSTR("languageConfigs"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v10;
    FCAppConfigurationStringValue(v10, (uint64_t)CFSTR("fallbackLanguageTag"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lowercaseString");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = v11;
    objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", &__block_literal_global_28);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = v13;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, buf, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v56 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          FCAppConfigurationStringValue(v19, (uint64_t)CFSTR("languageTag"), &stru_1E464BC40);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lowercaseString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v21);
          __75__FCNewsAppConfig_languageConfigDictionaryForConfig_preferredLanguageTags___block_invoke_2(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v22);
          if (objc_msgSend(v21, "isEqualToString:", v50))
          {
            v24 = v19;

            v49 = v24;
          }

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, buf, 16);
      }
      while (v16);
    }

    if (objc_msgSend(v12, "count"))
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v25 = v42;
      v26 = v42;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v52;
        while (2)
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v52 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
            __75__FCNewsAppConfig_languageConfigDictionaryForConfig_preferredLanguageTags___block_invoke_2(v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", v31);
            v33 = objc_claimAutoreleasedReturnValue();
            if (v33
              || (objc_msgSend(v12, "objectForKeyedSubscript:", v32), (v33 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v34 = (void *)v33;

              goto LABEL_34;
            }

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          v34 = 0;
          if (v28)
            continue;
          break;
        }
      }
      else
      {
        v34 = 0;
      }
LABEL_34:

    }
    else
    {
      v34 = 0;
      v25 = v42;
    }
    if (v34)
      v37 = v34;
    else
      v37 = v49;
    v38 = v37;

    v35 = v44;
    v6 = v47;
    v8 = v45;
    if (v38)
    {
      v7 = v46;
      v36 = -[FCNewsAppConfig initWithConfigDictionary:storefrontID:languageConfigDictionary:]([FCNewsAppConfig alloc], v44, v46, v38);

    }
    else
    {
      v36 = 0;
      v7 = v46;
    }
  }
  else
  {
    v35 = 0;
    v36 = 0;
  }

  return v36;
}

id __75__FCNewsAppConfig_languageConfigDictionaryForConfig_preferredLanguageTags___block_invoke_2(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("-"));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(v1, "substringToIndex:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (id)personalizationTreatment
{
  if (self)
    self = (FCNewsAppConfig *)self->_lazyPersonalizationTreatment;
  return (id)-[FCNewsAppConfig value](self, "value");
}

- (int64_t)entitlementsRequestTimeoutDurationInSeconds
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("entitlementsRequestTimeoutDurationInSeconds"), 5);

  return v3;
}

- (BOOL)personalizationAnalyticsEnabled
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("personalizationAnalytics"), 0);

  if (!NFInternalBuild())
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  NewsCoreUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("news.features.personalizationAnalytics"));

  if (v5 == 2)
    return 0;
  if (v5 != 1)
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  return 1;
}

- (BOOL)fallbackToReverseChronSorting
{
  void *v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;

  if (!NFInternalBuild())
  {
LABEL_5:
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("fallbackToReverseChronSorting"), 0);

    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v7);
  }
  NewsCoreUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("news.features.fallbackToReverseChronSorting"));

  if (v4 != 1)
  {
    if (v4 == 2)
      return 0;
    goto LABEL_5;
  }
  return 1;
}

- (BOOL)articleEmbeddingsScoringEnabled
{
  void *v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;

  if (!NFInternalBuild())
  {
LABEL_5:
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("articleEmbeddingsScoringEnabled"), 0);

    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v7);
  }
  NewsCoreUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("news.features.articleEmbeddingsScoring"));

  if (v4 != 1)
  {
    if (v4 == 2)
      return 0;
    goto LABEL_5;
  }
  return 1;
}

- (BOOL)shouldShowAlternateHeadlines
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("shouldShowAlternateHeadlines"), 1);

  return v3;
}

- (int64_t)stateRestorationAllowedTimeWindow
{
  void *v3;
  char v4;
  void *v6;
  int64_t v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("news.demo.allow_long_state_restoration"));

  if ((v4 & 1) != 0)
    return 86400;
  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("stateRestorationAllowedTimeWindow"), 7200);

  return v7;
}

- (BOOL)todayFeedEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("feed3EnabledLevel"), 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (FCPrefetchConfiguration)prefetchConfig
{
  return self->_prefetchConfig;
}

- (FCOfflineDownloadsConfiguration)offlineDownloadsConfig
{
  void *v3;
  void *v4;

  NewsCoreUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("optimized_storage_enabled")) & 1) != 0)
    -[FCNewsAppConfig offlineDownloadsConfigOptimized](self, "offlineDownloadsConfigOptimized");
  else
    -[FCNewsAppConfig offlineDownloadsConfigDefault](self, "offlineDownloadsConfigDefault");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCOfflineDownloadsConfiguration *)v4;
}

- (FCOfflineDownloadsConfiguration)offlineDownloadsConfigDefault
{
  return self->_offlineDownloadsConfigDefault;
}

- (int64_t)autoRefreshMinimumInterval
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("autoRefreshMinimumInterval"), 120);

  return v3;
}

- (double)analyticsJitterUpperBound
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("analyticsJitterUpperBound"), 600.0);

  return v3;
}

- (double)analyticsJitterLowerBound
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("analyticsJitterLowerBound"), -600.0);

  return v3;
}

- (BOOL)isAnalyticsJitterEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("analyticsJitterEnabledLevel"), 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (NSArray)analyticsDenylistDescriptorsInternal
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("analyticsDenylistDescriptorsInternal"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (BOOL)todayFeedConfigRequestsEnabled
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("todayFeedConfigRequestsEnabledLevel"), 0);

  if (!NFInternalBuild())
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  NewsCoreUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("news.features.todayfeedconfigrequests"));

  if (v5 == 2)
    return 0;
  if (v5 != 1)
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  return 1;
}

- (double)todayFeedConfigEndpointTimeoutAfterCK
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("todayFeedConfigEndpointTimeoutAfterCK"), 2.0);

  return v3;
}

- (BOOL)smarterMessagingEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("smarterMessagingEnabledLevel"), 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)appReviewRequestEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("appReviewRequestEnabledLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (FCSmarterMessagingConfig)smarterMessagingConfig
{
  void *v2;
  void *v3;
  FCSmarterMessagingConfig *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("smarterMessagingConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[FCSmarterMessagingConfig initWithDictionary:]([FCSmarterMessagingConfig alloc], "initWithDictionary:", v3);
  return v4;
}

- (NSArray)topStoriesPublishDates
{
  void *v2;
  void *v3;
  void *v4;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("topStoriesPublishTimeIntervals"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_629);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (int64_t)todayFeedLoadToCacheTimeWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  int64_t v9;

  if (!NFInternalBuild())
    goto LABEL_11;
  NewsCoreUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("enable_config_overrides")) & 1) == 0)
  {

LABEL_11:
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = FCAppConfigurationIntegerValue(v7, (uint64_t)CFSTR("todayFeedLoadToCacheTimeWindow"), 7200);
    goto LABEL_12;
  }
  objc_opt_class();
  NewsCoreUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("override_today_feed_load_to_cache_time_window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (!v7)
    goto LABEL_11;
  v8 = objc_msgSend(v7, "integerValue");
LABEL_12:
  v9 = v8;

  return v9;
}

- (NSString)embedConfigurationAssetID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("anfEmbedConfigurationAsset"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)subscriptionsGlobalMeteredCount
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("subscriptionsGlobalMeteredCount"), 30);

  return v3;
}

- (int64_t)feedAdScreenfulsToPrefetch
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("feedAdScreenfulsToPrefetch"), 3);

  return v3;
}

- (id)appAnalyticsEndpointUrlForEnvironment:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;

  -[FCNewsAppConfig endpointConfigsByEnvironment](self, "endpointConfigsByEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appAnalyticsBaseURLString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("https://news-events.apple.com/analyticseventsv2/async");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v10);
  return v11;
}

- (id)appAnalyticsAppHeartbeatEndpointUrlForEnvironment:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  -[FCNewsAppConfig endpointConfigsByEnvironment](self, "endpointConfigsByEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appAnalyticsAppHeartbeatBaseURLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(v7, "appAnalyticsAppHeartbeatBaseURLString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithString:", v10);

  }
  else
  {
    -[FCNewsAppConfig appAnalyticsEndpointUrlForEnvironment:](self, "appAnalyticsEndpointUrlForEnvironment:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (NSString)todayFeedEditionConfigJSON
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("todayFeedEditionConfigJson"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)financeURLAnalyticsAllowLists
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("financeURLAnalyticsAllowLists"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)sportsSyncingV2Enabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("sportsSyncingV2EnabledLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)offlineModeEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("offlineModeEnabledLevel"), 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)liveActivitiesEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("liveActivitiesEnabledLevel"), 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)inFeedDebugging
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("inFeedDebuggingLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)enableAIAttribution
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("enableAIAttributionEnabledLevelV2"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (NSArray)aLaCartePaidSubscriptionGroupWhitelistedChannelIDs
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("paidALaCarteSubscriptionGroupWhitelistedChannelIds"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSString)personalizationWhitelistResourceId
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("personalizationWhitelistResourceId"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v7, (uint64_t)CFSTR("personalizationWhitelistResourceId"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)personalizationUrlMappingResourceId
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("personalizationUrlMappingResourceId"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v7, (uint64_t)CFSTR("personalizationUrlMappingResourceId"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)personalizationFavorabilityResourceId
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("personalizationPublisherFavorabilityScoresResourceId"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v7, (uint64_t)CFSTR("personalizationPublisherFavorabilityScoresResourceId"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)personalizationBundleIdMappingResourceId
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("personalizationBundleIdMappingResourceId"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v7, (uint64_t)CFSTR("personalizationBundleIdMappingResourceId"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (BOOL)foregroundHeartbeatEventShouldUseQueue
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  if (NFInternalBuild()
    && (NewsCoreUserDefaults(),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "objectForKey:", CFSTR("news.features.foregroundHeartbeatEventShouldUseQueue")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    NewsCoreUserDefaults();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("news.features.foregroundHeartbeatEventShouldUseQueue"));
  }
  else
  {
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = FCAppConfigurationBoolValue(v5, (uint64_t)CFSTR("foregroundHeartbeatEventShouldUseQueue"), 1);
  }
  v7 = v6;

  return v7;
}

- (BOOL)audioFeedConfigRequestsEnabled
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioFeedConfigRequestsEnabledLevel"), 0);

  if (!NFInternalBuild())
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  NewsCoreUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("news.features.audiofeedconfigrequests"));

  if (v5 == 2)
    return 0;
  if (v5 != 1)
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  return 1;
}

- (BOOL)foregroundHeartbeatEventEnabled
{
  void *v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;

  if (!NFInternalBuild())
  {
LABEL_5:
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("foregroundHeartbeatEventEnabled2"), 0xFFFFFFFFLL);

    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v7);
  }
  NewsCoreUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("news.features.foregroundHeartbeatEventEnabled"));

  if (v4 != 1)
  {
    if (v4 == 2)
      return 0;
    goto LABEL_5;
  }
  return 1;
}

void __68__FCNewsAppConfig_defaultAudioConfigRecordIDByLocalizedStorefrontID__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("143441");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("U"), CFSTR("143441"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("143455");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("U"), CFSTR("143455"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("143455-fr-ca");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-fr"), CFSTR("U"), CFSTR("143455"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("143444");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("U"), CFSTR("143444"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = CFSTR("143460");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("U"), CFSTR("143460"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0F7EB8;
  qword_1ED0F7EB8 = v5;

}

- (NSDictionary)todayFeedGroupClusteringKnobOverrides
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  NewsCoreUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("news.news_personalization.cluster_config_overrides.enabled"));

  if (NFInternalBuild() && v4)
  {
    NewsCoreUserDefaults();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringForKey:", CFSTR("news.news_personalization.cluster_config_overrides.json"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      if (!v9)
      {

        goto LABEL_10;
      }
      v10 = v9;
      v11 = FCAppConfigurationLog;
      if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_error_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_ERROR, "Failed to parse debug override value for todayFeedGroupClusteringKnobOverrides error: %@", buf, 0xCu);
      }

    }
  }
  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("todayFeedGroupClusteringKnobOverrides"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return (NSDictionary *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPaidALaCartePaywallConfigs, 0);
  objc_storeStrong((id *)&self->_widgetConfig, 0);
  objc_storeStrong((id *)&self->_analyticsContentTypeConfigsByContentTypeByEnvironment, 0);
  objc_storeStrong((id *)&self->_lazyPersonalizationTreatment, 0);
  objc_storeStrong((id *)&self->_superfeedConfigOverrideResourceIDs, 0);
  objc_storeStrong((id *)&self->_campaignReferralConfigsByID, 0);
  objc_storeStrong((id *)&self->_launchPresentationConfig, 0);
  objc_storeStrong((id *)&self->_channelPickerConfigsByName, 0);
  objc_storeStrong((id *)&self->_timesOfDayConfiguration, 0);
  objc_storeStrong((id *)&self->_autoFavoritesServiceConfigurationJSONData, 0);
  objc_storeStrong((id *)&self->_newsTabiConfiguration, 0);
  objc_storeStrong((id *)&self->_newsPersonalizationConfiguration, 0);
  objc_storeStrong((id *)&self->_sportsPrivacyConfiguration, 0);
  objc_storeStrong((id *)&self->_sportEventHighlightsTagID, 0);
  objc_storeStrong((id *)&self->_sportLeagueHighlightsTagID, 0);
  objc_storeStrong((id *)&self->_sportLeagueScoresTagID, 0);
  objc_storeStrong((id *)&self->_sportTeamHighlightsTagID, 0);
  objc_storeStrong((id *)&self->_sportTeamScoresTagID, 0);
  objc_storeStrong((id *)&self->_sportHighlightsTagID, 0);
  objc_storeStrong((id *)&self->_sportScoresTagID, 0);
  objc_storeStrong((id *)&self->_mySportsHighlightsTagID, 0);
  objc_storeStrong((id *)&self->_mySportsScoresTagID, 0);
  objc_storeStrong((id *)&self->_sportsTopStoriesTagID, 0);
  objc_storeStrong((id *)&self->_mySportsTagID, 0);
  objc_storeStrong((id *)&self->_blockedArticleLearnMoreURL, 0);
  objc_storeStrong((id *)&self->_shortcutsTagID, 0);
  objc_storeStrong((id *)&self->_sharedWithYouTagID, 0);
  objc_storeStrong((id *)&self->_myMagazinesTagID, 0);
  objc_storeStrong((id *)&self->_paidBundleConfig, 0);
  objc_storeStrong((id *)&self->_paidBundleViaOfferConfig, 0);
  objc_storeStrong((id *)&self->_locationSharingUpsellConfig, 0);
  objc_storeStrong((id *)&self->_sportsUpsellConfig, 0);
  objc_storeStrong((id *)&self->_channelPaywallConfigsByChannelID, 0);
  objc_storeStrong((id *)&self->_channelUpsellConfigsByChannelID, 0);
  objc_storeStrong((id *)&self->_shareDiscoverMoreVideosInfo, 0);
  objc_storeStrong((id *)&self->_externalAnalyticsConfigurations, 0);
  objc_storeStrong((id *)&self->_prefetchConfig, 0);
  objc_storeStrong((id *)&self->_iAdConfig, 0);
  objc_storeStrong((id *)&self->_puzzlesConfig, 0);
  objc_storeStrong((id *)&self->_forYouGroupsConfiguration, 0);
  objc_storeStrong((id *)&self->_topStoriesConfig, 0);
  objc_storeStrong((id *)&self->_notificationsConfig, 0);
  objc_storeStrong((id *)&self->_endpointConfigsByEnvironment, 0);
  objc_storeStrong((id *)&self->_forYouVideoGroupsConfig, 0);
  objc_storeStrong((id *)&self->_languageConfigDictionary, 0);
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_offlineDownloadsConfigOptimized, 0);
  objc_storeStrong((id *)&self->_offlineDownloadsConfigDefault, 0);
  objc_storeStrong((id *)&self->_peopleAlsoReadConfiguration, 0);
  objc_storeStrong((id *)&self->_configDictionary, 0);
}

- (FCNewsAppConfig)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNewsAppConfig init]";
    v9 = 2080;
    v10 = "FCNewsAppConfig.m";
    v11 = 1024;
    v12 = 151;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCNewsAppConfig init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (_BYTE)defaultConfigurationForStoreFrontID:(uint64_t)a1
{
  id v2;
  _BYTE *v3;

  v2 = a2;
  objc_opt_self();
  v3 = -[FCNewsAppConfig initWithConfigDictionary:storefrontID:languageConfigDictionary:]([FCNewsAppConfig alloc], 0, v2, 0);

  return v3;
}

FCPersonalizationTreatment *__82__FCNewsAppConfig_initWithConfigDictionary_storefrontID_languageConfigDictionary___block_invoke(uint64_t a1)
{
  FCPersonalizationTreatment *v2;
  void *v3;
  FCPersonalizationTreatment *v4;

  v2 = [FCPersonalizationTreatment alloc];
  FCAppConfigurationDictionaryValueWithDefaultValue(*(void **)(a1 + 32), (uint64_t)CFSTR("personalizationTreatment"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FCPersonalizationTreatment initWithPersonalizationTreatmentDictionary:](v2, "initWithPersonalizationTreatmentDictionary:", v3);

  return v4;
}

- (int64_t)optimizedStorageAutoEnablementThreshold
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("optimizedStorageAutoEnablementThreshold"), 3000000000);

  return v3;
}

uint64_t __50__FCNewsAppConfig__loadNotificationsConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("channelId"));
}

void __48__FCNewsAppConfig__loadSuperfeedConfigOverrides__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("resourceId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

void __57__FCNewsAppConfig__loadAutoFavoritesServiceConfiguration__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  v2 = FCAutoFavoritesServiceLog;
  if (os_log_type_enabled((os_log_t)FCAutoFavoritesServiceLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Found nil auto favorites service configuration, storing empty configuration", v6, 2u);
  }
  objc_msgSend(CFSTR("{}"), "dataUsingEncoding:", 4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 336);
  *(_QWORD *)(v4 + 336) = v3;

}

- (int64_t)trendingTopicsRefreshRate
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("trendingTopicsRefreshRate"), 3600);

  return v3;
}

- (int64_t)dailyChannelUpsellsCountLimit
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("dailyChannelUpsellsCountLimit"), 3);

  return v3;
}

- (int64_t)shortcutsMaxCount
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("shortcutsMaxCount"), 8);

  return v3;
}

- (BOOL)autoOnboardShortcuts
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("autoOnboardShortcuts"), 0);

  return v3;
}

- (int64_t)minShortcutsOnboardCount
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("minShortcutsOnboardCount"), 4);

  return v3;
}

- (int64_t)shortcutsOnboardCount
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("shortcutsOnboardCount"), 6);

  return v3;
}

- (int64_t)maxCuratedShortcutsCount
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("maxCuratedShortcutsCount"), 1);

  return v3;
}

- (int64_t)maxSuggestedShortcutsCount
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("maxSuggestedShortcutsCount"), 5);

  return v3;
}

- (int64_t)shortcutsCustomizeAffordanceDisplayMinLaunchCount
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("shortcutsCustomizeAffordanceDisplayMinLaunchCount"), 2);

  return v3;
}

- (int64_t)shortcutsCustomizeAffordanceSendToBackPositionMinLaunchCount
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("shortcutsCustomizeAffordanceSendToBackPositionMinLaunchCount"), 15);

  return v3;
}

- (int64_t)notificationEnabledChannelsRefreshFrequency
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("notificationEnabledChannelsRefreshFrequency"), 604800);

  return v3;
}

- (int64_t)savedArticlesCutoffTime
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("savedArticlesCutoffTime"), 15552000);

  return v3;
}

- (int64_t)savedArticlesOpenedCutoffTime
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("savedArticlesOpenedCutoffTime"), 21600);

  return v3;
}

- (int64_t)savedArticlesMaximumCountWiFi
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("savedArticlesMaximumCountWifi"), 100);

  return v3;
}

- (int64_t)savedArticlesMaximumCountCellular
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("savedArticlesMaximumCountCellular"), 10);

  return v3;
}

- (NSString)blockedArticleLearnMoreURL
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("blockedArticleLearnMoreURL"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)presubscribedFeedIDs
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("preSubscribedFeedIds"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)permanentChannelIDs
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("permanentChannelIds"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)appleNewsNotificationChannelIDs
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("appleNewsNotificationChannelIds"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isPrivateDataEncryptionAllowed
{
  return self->_privateDataEncryptionAllowed;
}

- (BOOL)isPrivateDataEncryptionMigrationDesired
{
  return self->_privateDataEncryptionMigrationDesired;
}

- (BOOL)isPrivateDataMigrationCleanupEnabled
{
  return self->_privateDataMigrationCleanupEnabled;
}

- (BOOL)privateDataShouldSecureSubscriptions
{
  return self->_privateDataShouldSecureSubscriptions;
}

- (BOOL)privateDataShouldCleanupAfterSecureSubscriptions
{
  return self->_privateDataShouldCleanupAfterSecureSubscriptions;
}

- (BOOL)isPrivateDataEncryptionRequired
{
  return self->_privateDataEncryptionRequired;
}

- (NSString)breakingNewsChannelID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("breakingNewsChannelId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sharedWithYouTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("sharedWithYouTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)editorialChannelID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("appleEditorialChannelId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)editorialGemsSectionID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("editorialGemsSectionId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)feedLineHeightMultiplier
{
  void *v2;
  double v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("feedLineHeightMultiplier"), 1.0);

  return v3;
}

- (id)paidALaCartePaywallConfigForChannelID:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  FCPaidALaCartePaywallConfig *v15;
  void *v16;
  FCPaidALaCartePaywallConfig *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSDictionary *cachedPaidALaCartePaywallConfigs;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_cachedPaidALaCartePaywallConfigs)
  {
    v24 = v4;
    v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationDictionaryValueWithDefaultValue(v7, (uint64_t)CFSTR("paidALaCartePaywallConfigs2"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13);
          v15 = [FCPaidALaCartePaywallConfig alloc];
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[FCPaidALaCartePaywallConfig initWithChannelID:configDictionary:](v15, "initWithChannelID:configDictionary:", v14, v16);

          -[FCPaidALaCartePaywallConfig channelID](v17, "channelID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "length");

          if (v19)
          {
            -[FCPaidALaCartePaywallConfig channelID](v17, "channelID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v17, v20);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }

    cachedPaidALaCartePaywallConfigs = self->_cachedPaidALaCartePaywallConfigs;
    self->_cachedPaidALaCartePaywallConfigs = v6;

    v5 = v24;
  }
  if (objc_msgSend(v5, "length"))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_cachedPaidALaCartePaywallConfigs, "objectForKeyedSubscript:", v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (NSString)todayFeedKnobs
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("todayFeedKnobs"), CFSTR("{}"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)hiddenFeedIDs
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("hiddenFeedId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (FCForYouGroupsConfiguration)forYouGroupsConfiguration
{
  return self->_forYouGroupsConfiguration;
}

- (int64_t)minimumDurationBetweenForYouGroupsWeekday
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("minimumDurationBetweenForYouGroupsWeekday"), 28800);

  return v3;
}

- (int64_t)minimumDurationBetweenForYouGroupsWeekend
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("minimumDurationBetweenForYouGroupsWeekend"), 14400);

  return v3;
}

- (int64_t)minimumDurationBetweenTrendingGroupsWeekday
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("minimumDurationBetweenTrendingGroupsWeekday"), 28800);

  return v3;
}

- (int64_t)minimumDurationBetweenTrendingGroupsWeekend
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("minimumDurationBetweenTrendingGroupsWeekend"), 14400);

  return v3;
}

- (int64_t)expiredPaidSubscriptionGroupCutoffTime
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("expiredPaidSubscriptionGroupCutoffTime"), 0);

  return v3;
}

- (int64_t)maximumNumberOfExpiredPaidSubscriptionGroups
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("maxExpiredPaidSubscriptionGroupCount"), 0);

  return v3;
}

- (int64_t)maximumTimesHeadlineInPaidSubscriptionGroup
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("maxTimesHeadlineInPaidSubscriptionGroup"), 0);

  return v3;
}

- (int64_t)maximumPaidSubscriptionGroupSizeiPad
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("maxPaidSubscriptionGroupSizeIPad"), 0);

  return v3;
}

- (int64_t)maximumPaidSubscriptionGroupSizeiPhone
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("maxPaidSubscriptionGroupSizeIPhone"), 0);

  return v3;
}

- (BOOL)diversifyOptionalTopStories
{
  void *v2;
  BOOL v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("diversifyOptionalTopStories"), 1) != 0;

  return v3;
}

- (int64_t)optionalTopStoriesRefreshRate
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("optionalTopStoriesRefreshRate"), 14400);

  return v3;
}

- (double)minimumTrendingUnseenRatio
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("minimumTrendingUnseenRatio"), 0.5);

  return v3;
}

- (FCVideoGroupsConfig)forYouVideoGroupsConfig
{
  FCVideoGroupsConfig *forYouVideoGroupsConfig;
  void *v4;
  void *v5;
  FCVideoGroupsConfig *v6;
  FCVideoGroupsConfig *v7;

  forYouVideoGroupsConfig = self->_forYouVideoGroupsConfig;
  if (!forYouVideoGroupsConfig)
  {
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("forYouVideoGroupsConfig"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = -[FCVideoGroupsConfig initWithConfigDictionary:]([FCVideoGroupsConfig alloc], "initWithConfigDictionary:", v5);
      v7 = self->_forYouVideoGroupsConfig;
      self->_forYouVideoGroupsConfig = v6;

    }
    forYouVideoGroupsConfig = self->_forYouVideoGroupsConfig;
  }
  return forYouVideoGroupsConfig;
}

- (double)endOfArticleMinPaidHeadlineRatio
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("endOfArticleMinPaidHeadlineRatio"), 0.25);

  return v3;
}

- (int64_t)endOfArticleMaxInaccessiblePaidArticleCount
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("endOfArticleMaxInaccessiblePaidArticles"), 2);

  return v3;
}

- (int64_t)endOfArticleExpireArticlesAfter
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("endOfArticleExpireArticlesAfter"), 7776000);

  return v3;
}

- (NSString)endOfArticleFeedConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("endOfArticleFeedConfigurationResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)minimumDistanceBetweenImageOnTopTiles
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("minimumDistanceBetweenImageOnTopTiles"), 4);

  return v3;
}

- (NSString)nonBundleChannelPickerSuggestionsTabiPackageResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("nonBundleChannelPickerSuggestionsTabiPackageResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleChannelPickerSuggestionsTabiPackageResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("bundleChannelPickerSuggestionsTabiPackageResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)forYouRecordConfigID
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  objc_opt_self();
  if (qword_1ED0F7E50 != -1)
    dispatch_once(&qword_1ED0F7E50, &__block_literal_global_968);
  v3 = (id)_MergedGlobals_146;
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    -[FCNewsAppConfig localizedStorefrontID](self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    if (qword_1ED0F7E80 != -1)
      dispatch_once(&qword_1ED0F7E80, &__block_literal_global_975);
    v6 = (id)qword_1ED0F7E78;
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Y-%@-en"), CFSTR("143441"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v11, (uint64_t)CFSTR("forYouConfigId"), v10);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (NSString)forYouPremiumRecordConfigID
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  objc_opt_self();
  if (qword_1ED0F7E60 != -1)
    dispatch_once(&qword_1ED0F7E60, &__block_literal_global_969);
  v3 = (id)qword_1ED0F7E58;
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    -[FCNewsAppConfig localizedStorefrontID](self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    if (qword_1ED0F7E90 != -1)
      dispatch_once(&qword_1ED0F7E90, &__block_literal_global_982);
    v6 = (id)qword_1ED0F7E88;
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("YP-%@-en"), CFSTR("143441"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v11, (uint64_t)CFSTR("forYouPremiumConfigId"), v10);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (NSArray)freeGlobalESLArticleListIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("freeEvergreenArticleListId"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v5, (uint64_t)CFSTR("freeEvergreenArticleListId2"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v8, (uint64_t)CFSTR("freeEvergreenArticleListIds"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    FCAppConfigurationArrayValueWithDefaultValue(v7, (uint64_t)CFSTR("freeEvergreenArticleListIds"), MEMORY[0x1E0C9AA60]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v10;
}

- (NSArray)paidGlobalESLArticleListIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("paidEvergreenArticleListId"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v5, (uint64_t)CFSTR("paidEvergreenArticleListId2"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v8, (uint64_t)CFSTR("paidEvergreenArticleListIds"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    FCAppConfigurationArrayValueWithDefaultValue(v7, (uint64_t)CFSTR("paidEvergreenArticleListIds"), MEMORY[0x1E0C9AA60]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v10;
}

- (NSString)freeTagESLArticleListIDPrefix
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("freeTagEvergreenArticleListIdPrefix"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)paidTagESLArticleListIDPrefix
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("paidTagEvergreenArticleListIdPrefix"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)maxTagESLArticleListsToQuery
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("maxTagEvergreenArticleListsToQuery"), 30);

  return v3;
}

- (BOOL)shouldManuallySupplementEvergreenWithIssueArticles
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v3, (uint64_t)CFSTR("freeEvergreenArticleListIds"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v6, (uint64_t)CFSTR("paidEvergreenArticleListIds"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 == 0;

  }
  return v5;
}

- (int64_t)forYouMaxDailyEvergreenArticlesForFreeUsers
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("forYouMaxDailyEvergreenArticlesForFreeUsers"), 30);

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("forYouMaxDailyEvergreenArticlesForFreeUsers2"), v4);

  return v6;
}

- (int64_t)forYouMaxDailyEvergreenArticlesForPaidUsers
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("forYouMaxDailyEvergreenArticlesForPaidUsers"), 30);

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("forYouMaxDailyEvergreenArticlesForPaidUsers2"), v4);

  return v6;
}

- (int64_t)maxIssuesPerESLInventoryRequest
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("maxIssuesPerESLInventoryRequest"), 100);

  return v3;
}

- (int64_t)expirePinnedArticlesAfter
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("expirePinnedArticlesAfter"), 0);

  return v3;
}

- (int64_t)singleTopicFeedMinFeedItemsPerRequest
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("singleTopicFeedMinFeedItemsPerRequest"), 20);

  return v3;
}

- (int64_t)singleChannelFeedMinFeedItemsPerRequest
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("singleChannelFeedMinFeedItemsPerRequest"), 20);

  return v3;
}

- (id)todayConfigWithIdentifier:(id)a3 queueConfigs:(id)a4 backgroundColorLight:(id)a5 backgroundColorDark:(id)a6 audioIndicatorColor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FCWidgetConfig *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    if (self)
      goto LABEL_4;
LABEL_16:
    v17 = 0;
    goto LABEL_14;
  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "queueConfigs");
  *(_DWORD *)buf = 136315906;
  v33 = "-[FCNewsAppConfig todayConfigWithIdentifier:queueConfigs:backgroundColorLight:backgroundColorDark:audioIndicatorColor:]";
  v34 = 2080;
  v35 = "FCNewsAppConfig.m";
  v36 = 1024;
  v37 = 1376;
  v38 = 2114;
  v39 = v25;
  _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  if (!self)
    goto LABEL_16;
LABEL_4:
  v17 = self->_widgetConfig;
  if (v17)
  {
    self = (FCNewsAppConfig *)objc_opt_new();
    v26 = v14;
    -[FCNewsAppConfig setBackgroundColorLight:](self, "setBackgroundColorLight:", v14);
    -[FCNewsAppConfig setBackgroundColorDark:](self, "setBackgroundColorDark:", v15);
    -[FCNewsAppConfig setAudioIndicatorColor:](self, "setAudioIndicatorColor:", v16);
    v18 = v12;
    -[FCNewsAppConfig setWidgetIdentifier:](self, "setWidgetIdentifier:", v12);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v19 = v13;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          -[FCNewsAppConfig addTodayQueueConfigs:](self, "addTodayQueueConfigs:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v21);
    }

    v12 = v18;
    v14 = v26;
  }
  else
  {
    self = 0;
  }
LABEL_14:

  return self;
}

- (int64_t)widgetForYouBackgroundMinimumUpdateInterval
{
  if (self)
    self = (FCNewsAppConfig *)self->_widgetConfig;
  return -[FCNewsAppConfig forYouBackgroundMinimumUpdateInterval](self, "forYouBackgroundMinimumUpdateInterval");
}

- (id)analyticsEnvelopeContentTypeConfigsForEnvironment:(unint64_t)a3
{
  NSDictionary *analyticsContentTypeConfigsByContentTypeByEnvironment;
  void *v5;
  NSDictionary *v6;
  void *v7;
  void *v8;

  if (self)
    analyticsContentTypeConfigsByContentTypeByEnvironment = self->_analyticsContentTypeConfigsByContentTypeByEnvironment;
  else
    analyticsContentTypeConfigsByContentTypeByEnvironment = 0;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = analyticsContentTypeConfigsByContentTypeByEnvironment;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)appAnalyticsNotificationReceiptEndpointUrlForEnvironment:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[FCNewsAppConfig endpointConfigsByEnvironment](self, "endpointConfigsByEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appAnalyticsNotificationReceiptBaseURLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(v6, "appAnalyticsNotificationReceiptBaseURLString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithString:", v9);

  }
  return v7;
}

- (id)appAnalyticsAppHealthEndpointUrlForEnvironment:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  -[FCNewsAppConfig endpointConfigsByEnvironment](self, "endpointConfigsByEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appAnalyticsAppHealthBaseURLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(v7, "appAnalyticsAppHealthBaseURLString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithString:", v10);

  }
  else
  {
    -[FCNewsAppConfig appAnalyticsEndpointUrlForEnvironment:](self, "appAnalyticsEndpointUrlForEnvironment:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (int64_t)maxRetriesForDroppedFeeds
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("maxRetriesForDroppedFeeds"), 2);

  return v3;
}

- (double)delayBeforeRetryingDroppedFeeds
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("delayBeforeRetryingDroppedFeeds"), 1.5);

  return v3;
}

- (int64_t)subscriptionsPlacardPublisherFrequencyInSeconds
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("subscriptionsPlacardPublisherFrequencySeconds"), 86400);

  return v3;
}

- (int64_t)subscriptionsPlacardGlobalMaximumPerDay
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("subscriptionsPlacardGlobalMaxPerDay"), 1);

  return v3;
}

- (int64_t)subscriptionsGracePeriodForTokenVerificationSeconds
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("subscriptionsGracePeriodForTokenVerificationSeconds"), 1296000);

  return v3;
}

- (BOOL)hideAllPaywalls
{
  return 0;
}

- (BOOL)hideAlacartePaywalls
{
  return 0;
}

- (int64_t)entitlementsCacheRecoveryAttemptDurationInSeconds
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("entitlementsCacheRecoveryAttemptDurationSeconds"), 2592000);

  return v3;
}

- (int64_t)bestOfferRequestTimeoutDurationInSeconds
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("bestOfferRequestTimeoutDurationInSeconds"), 5);

  return v3;
}

- (BOOL)enableCacheFallbackForArticleRecirculation
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("enableCacheFallbackForArticleRecirculation"), 1);

  return v3;
}

- (NSArray)onboardingFeedIDs
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("onboardingTagIds"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)discoverNewsPlusChannelIDs
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("discoverNewsPlusChannelIds"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)recommendedIssueAllowList
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("recommendedIssueAllowList"), MEMORY[0x1E0C9AA60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)recommendedIssueDenyList
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("recommendedIssueDenyList"), MEMORY[0x1E0C9AA60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)todayPerformanceAlertsEnabled
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("todayPerformanceAlertsEnabled"), 1);

  return v3;
}

- (int64_t)todayPerformanceAlertsMinNewsVersion
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("todayPerformanceAlertsMinNewsVersion"), 0);

  return v3;
}

- (double)todayPerformanceAlertPrewarmThreshold
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("todayPerformanceAlertPrewarmThreshold"), 10.0);

  return v3;
}

- (double)todayPerformanceAlertGapExpansionThreshold
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("todayPerformanceAlertGapExpansionThreshold"), 10.0);

  return v3;
}

- (double)todayPerformanceAlertSpinnerThreshold
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("todayPerformanceAlertSpinnerThreshold"), 5.0);

  return v3;
}

- (int64_t)autoScrollToTopFeedTimeout
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("autoScrollToTopFeedTimeout"), 14400);

  return v3;
}

- (NSString)webEmbedContentBlockers
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("webEmbedContentBlockers"), CFSTR("[{\"trigger\": {\"url-filter\": \".*\",\"unless-domain\": [\"*apple.com\"]},\"action\": {\"type\": \"block\"}}]"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)webEmbedContentBlockerOverrides
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("webEmbedContentBlockerOverrides"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)anfRenderingConfiguration
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("anfRenderingConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)interstitialAdLoadDelay
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("interstitialAdLoadDelay"), 1.0);

  return v3;
}

- (double)prerollLoadingTimeout
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("prerollLoadingTimeout"), 0.0);

  return v3;
}

- (double)prerollReadyToPlayTimeout
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("prerollReadyToPlayTimeout"), 2.0);

  return v3;
}

- (double)feedBannerAdRequestThrottle
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("feedBannerAdRequestThrottle"), 1.0);

  return v3;
}

- (double)articleBannerAdRequestThrottle
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("articleBannerAdRequestThrottle"), 1.0);

  return v3;
}

- (double)interstitialAdRequestThrottle
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("interstitialAdRequestThrottle"), 1.0);

  return v3;
}

- (double)prerollAdRequestThrottle
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("prerollAdRequestThrottle"), 1.0);

  return v3;
}

- (double)nativeInFeedAdRequestThrottle
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("nativeInFeedAdRequestThrottle"), 1.0);

  return v3;
}

- (double)nativeInArticleAdRequestThrottle
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("nativeInArticleAdRequestThrottle"), 1.0);

  return v3;
}

- (int64_t)articleAdPrefetchLimit
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("articleAdPrefetchLimit"), 3);

  return v3;
}

- (BOOL)widgetContentPrefetchEnabled
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("widgetContentPrefetchEnabled"), 1);

  return v3;
}

- (BOOL)widgetBackgroundInteractionEnabled
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("widgetBackgroundInteractionEnabled"), 0);

  return v3;
}

- (BOOL)widgetFetchOfTodayFeedLiteConfigEnabled
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("widgetFetchOfTodayFeedLiteConfigEnabled"), 1);

  return v3;
}

- (BOOL)widgetAnalyticsEnabled
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("widgetAnalyticsEnabled2"), 1);

  return v3;
}

- (BOOL)userSegmentationInWidgetAllowed
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("userSegmentationInWidgetAllowed"), 1);

  return v3;
}

- (FCIAdConfiguration)iAdConfig
{
  return self->_iAdConfig;
}

- (int64_t)newFavoriteNotificationAlertsFrequency
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("newFavoriteNotificationAlertsFrequency"), 0);

  return v3;
}

- (int64_t)notificationArticleCacheTimeout
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("notificationArticleCacheTimeout"), 300);

  return v3;
}

- (int64_t)notificationArticleWithRapidUpdatesCacheTimeout
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("notificationArticleWithRapidUpdatesCacheTimeout"), 120);

  return v3;
}

- (BOOL)notificationEnableAssetPrefetching
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("notificationEnableAssetPrefetching"), 1);

  return v3;
}

- (BOOL)notificationAssetPrefetchingRequiresWatch
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("notificationAssetPrefetchingRequiresWatch"), 1);

  return v3;
}

- (BOOL)universalLinksEnabled
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("universalLinksEnabled"), 0);

  return v3;
}

- (NSString)widgetConfigID
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  objc_opt_self();
  if (qword_1ED0F7E70 != -1)
    dispatch_once(&qword_1ED0F7E70, &__block_literal_global_970);
  v3 = (id)qword_1ED0F7E68;
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    -[FCNewsAppConfig localizedStorefrontID](self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    if (qword_1ED0F7EA0 != -1)
      dispatch_once(&qword_1ED0F7EA0, &__block_literal_global_985);
    v6 = (id)qword_1ED0F7E98;
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("W-%@-en"), CFSTR("143441"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v11, (uint64_t)CFSTR("widgetSectionConfigId"), v10);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (int64_t)widgetMinimumArticleExposureDurationToBePreseenInMilliseconds
{
  return -[FCWidgetConfig minimumArticleExposureDurationToBePreseen](self->_widgetConfig, "minimumArticleExposureDurationToBePreseen");
}

- (unsigned)widgetMinimumNumberOfTimesPreseenToBeSeen
{
  return -[FCWidgetConfig minimumNumberOfTimesPreseenToBeSeen](self->_widgetConfig, "minimumNumberOfTimesPreseenToBeSeen");
}

- (int64_t)widgetSystemReloadInterval
{
  return -[FCWidgetConfig widgetSystemReloadInterval](self->_widgetConfig, "widgetSystemReloadInterval");
}

- (int64_t)widgetSystemReloadJitterMax
{
  return -[FCWidgetConfig widgetSystemReloadJitterMax](self->_widgetConfig, "widgetSystemReloadJitterMax");
}

- (int64_t)widgetSystemHoneymoonDuration
{
  return -[FCWidgetConfig widgetSystemHoneymoonDuration](self->_widgetConfig, "widgetSystemHoneymoonDuration");
}

- (int64_t)widgetSystemReloadIntervalHoneymoon
{
  return -[FCWidgetConfig widgetSystemReloadIntervalHoneymoon](self->_widgetConfig, "widgetSystemReloadIntervalHoneymoon");
}

- (int64_t)widgetSystemReloadJitterMaxHoneymoon
{
  return -[FCWidgetConfig widgetSystemReloadJitterMaxHoneymoon](self->_widgetConfig, "widgetSystemReloadJitterMaxHoneymoon");
}

- (double)widgetTelemetrySamplingRate
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("widgetTelemetrySamplingRate2"), 0.01);

  return v3;
}

- (int64_t)smallWidgetSystemReloadInterval
{
  return -[FCWidgetConfig smallWidgetSystemReloadInterval](self->_widgetConfig, "smallWidgetSystemReloadInterval");
}

- (int64_t)smallWidgetSystemReloadJitterMax
{
  return -[FCWidgetConfig smallWidgetSystemReloadJitterMax](self->_widgetConfig, "smallWidgetSystemReloadJitterMax");
}

- (int64_t)smallWidgetSystemHoneymoonDuration
{
  return -[FCWidgetConfig smallWidgetSystemHoneymoonDuration](self->_widgetConfig, "smallWidgetSystemHoneymoonDuration");
}

- (int64_t)smallWidgetSystemReloadIntervalHoneymoon
{
  return -[FCWidgetConfig smallWidgetSystemReloadIntervalHoneymoon](self->_widgetConfig, "smallWidgetSystemReloadIntervalHoneymoon");
}

- (int64_t)smallWidgetSystemReloadJitterMaxHoneymoon
{
  return -[FCWidgetConfig smallWidgetSystemReloadJitterMaxHoneymoon](self->_widgetConfig, "smallWidgetSystemReloadJitterMaxHoneymoon");
}

- (double)articleDiversificationSimilarityExpectationStart
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("articleDiversitySimilarityExpectationStart"), 0.0);

  return v3;
}

- (double)articleDiversificationSimilarityExpectationEnd
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("articleDiversitySimilarityExpectationEnd"), 0.1);

  return v3;
}

- (double)articleDiversificationUniquePublisherExpectationSlope
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("publisherDiversitySlope"), 0.75);

  return v3;
}

- (double)articleDiversificationUniquePublisherExpectationYIntercept
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("publisherDiversityYIntercept"), 0.25);

  return v3;
}

- (int64_t)analyticsEndpointMaxPayloadSize
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("analyticsEndpointMaxPayloadSize"), 500000);

  return v3;
}

- (NSString)locationRecommendationMappingsResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("locationRecommendationMappingsResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localAreasMappingResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("localAreasMappingResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)tagFeedLayoutConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("tagFeedLayoutConfigurationResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)topicFeedConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("topicFeedConfigurationResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)channelFeedConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("channelFeedConfigurationResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sectionFeedConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("sectionFeedConfigurationResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sharedWithYouFeedLayoutConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("sharedFeedConfigurationResourceId"), CFSTR("shared-feed-config-143441-en"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)savedFeedConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("savedFeedConfigurationResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)historyFeedConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("historyFeedConfigurationResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)searchFeedConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("searchFeedConfigurationResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)searchMoreFeedConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("searchMoreFeedConfigurationResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)audioHistoryFeedConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("audioHistoryFeedConfigurationResourceId"), CFSTR("audio-history-feed-config-143441-en"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)audioPlaylistFeedConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("audioPlaylistFeedConfigurationResourceId"), CFSTR("audio-playlist-feed-config-143441-en"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)userConcernConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("userConcernConfigurationResourceId"), CFSTR("user-concern-config-143441-en"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)channelPickerConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("channelPickerConfigurationResourceId"), CFSTR("configuration-channel-picker-143441-en"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)searchEndpointConfigurationResourceID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("searchEndpointConfigurationResourceID"), CFSTR("configuration-search-endpoint-143441-en"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)inConversationsAudioTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("inConversationsAudioTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)businessAudioTagID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("businessAudioTagId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)translationMapResourceID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("languageMapResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)userVectorWhitelistResourceId
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("userVectorWhitelistResourceId"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v7, (uint64_t)CFSTR("userVectorWhitelistResourceId"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)userVectorModelResourceId
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("userVectorModelResourceId"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v7, (uint64_t)CFSTR("userVectorModelResourceId"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (int64_t)articleReadCountThreshold
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("articleReadCountThreshold"), 1);

  return v3;
}

- (int64_t)corryBarMaxArticleCountForArticleList
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("corryBarMaxArticleCountForArticleList"), 10);

  return v3;
}

- (int64_t)corryBarMaxArticleCountForSingleArticle
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("corryBarMaxArticleCountForSingleArticle"), 5);

  return v3;
}

- (BOOL)corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers"), 0);

  return v3;
}

- (NSString)exploreArticleID
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("exploreArticleId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)externalAnalyticsConfigurations
{
  NSArray *externalAnalyticsConfigurations;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  externalAnalyticsConfigurations = self->_externalAnalyticsConfigurations;
  if (!externalAnalyticsConfigurations)
  {
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("externalAnalyticsConfig"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_609);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_externalAnalyticsConfigurations;
    self->_externalAnalyticsConfigurations = v6;

    externalAnalyticsConfigurations = self->_externalAnalyticsConfigurations;
  }
  return externalAnalyticsConfigurations;
}

uint64_t __50__FCNewsAppConfig_externalAnalyticsConfigurations__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D626B8], "externalAnalyticsConfigWithDictionary:", a2);
}

- (NSArray)mediaSharingBlacklistedChannelIDs
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("mediaSharingBlacklistedChannelIds"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int64_t)topStoriesLocalNewsExpiration
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("topStoriesLocalNewsExpiration"), 21600);

  return v3;
}

- (BOOL)terminateAppOnBackgroundAfterJoiningOrLeavingExperiment
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("terminateAppOnBackgroundAfterJoiningOrLeavingExperiment"), 0);

  return v3;
}

uint64_t __41__FCNewsAppConfig_topStoriesPublishDates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(a2, "integerValue"));
}

- (unint64_t)trendingStyle
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("trendingStyle"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TrendingCellStyleNumberedCircle")) & 1) == 0)
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TrendingCellStyleImageOnSide"));

  return v4;
}

- (NSString)articleRecirculationConfigJSON
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("articleRecirculationConfig"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v7, (uint64_t)CFSTR("articleRecirculationConfig"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)issueArticleRecirculationConfig
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("issueArticleRecirculationConfig"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[FCNewsAppConfig configDictionary](self, "configDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v7, (uint64_t)CFSTR("issueArticleRecirculationConfig"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NTPBDiscoverMoreVideosInfo)shareDiscoverMoreVideosInfo
{
  return self->_shareDiscoverMoreVideosInfo;
}

- (NSString)articleRecirculationComponentPlacementConfigJSON
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("articleRecirculationComponentPlacementConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)articleRecirculationPopularFeedQueryTimeRange
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("articleRecirculationPopularFeedQueryTimeRange"), 86400);

  return v3;
}

- (BOOL)disableThumbnailsForArticleRecirculation
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("disableThumbnailsForArticleRecirculation"), 0);

  return v3;
}

- (NSString)feedNavigationConfigJSON
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("feedNavConfig"), CFSTR("{\"items\":[]}"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)shortcutsCurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("shortcutsCurationResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)shortcutsConfigResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("shortcutsConfigResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)enableBadgeInSpotlightTabBar
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("enableBadgeInSpotlightTabBar"), 0);

  return v3;
}

- (NSString)magazinesConfigRecordID
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[FCNewsAppConfig localizedStorefrontID](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  if (qword_1ED0F7EB0 != -1)
    dispatch_once(&qword_1ED0F7EB0, &__block_literal_global_988);
  v4 = (id)qword_1ED0F7EA8;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("maConfigId"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isArticleToolbarCompressionEnabled
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("articleToolbarCompressionEnabled"), 1);

  return v3;
}

- (int64_t)lowStorageThreshold
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("lowStorageThreshold"), 1000000000);

  return v3;
}

- (int64_t)criticalStorageThreshold
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("criticalStorageThreshold"), 200000000);

  return v3;
}

- (int64_t)maximumTrendingGroupSizeiPad
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("maxTrendingGroupSizeIpad"), 6);

  return v3;
}

- (int64_t)maximumTrendingGroupSizeiPhone
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("maxTrendingGroupSizeIphone"), 4);

  return v3;
}

- (unint64_t)likeDislikeBehavior
{
  void *v2;
  unint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("likeDislikeBehavior"), 1);

  return v3;
}

- (unint64_t)bestOfBundleFeedGroupKind
{
  void *v2;
  unint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("bestOfBundleFeedGroupKind"), 1);

  return v3;
}

- (int64_t)emailSignupRequiredAppLaunchCount
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("emailSignupRequiredAppLaunchCount"), 4);

  return v3;
}

- (double)newsletterSubscriptionStatusCacheTimeout
{
  void *v2;
  void *v3;
  double v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("newsletterConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (double)FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("newsletterSubscriptionStatusCacheTimeout"), 86400);
  return v4;
}

- (int64_t)newsletterSubscriptionType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("newsletterConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("newsletterSubscriptionType"), 2);
  return v4;
}

- (BOOL)issuesNewsletterOptinEnabled
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("newsletterConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = FCAppConfigurationBoolValue(v3, (uint64_t)CFSTR("issuesNewsletterOptinEnabled"), 0);
  return (char)v2;
}

- (BOOL)enableLocationBasedAutofavorites
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("enableLocationBasedAutofavorites"), 1);

  return v3;
}

- (BOOL)forYouGroupShouldPromoteAccessibleHeadline
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("forYouGroupShouldPromoteAccessibleHeadline"), 0);

  return v3;
}

- (BOOL)useNewsArticleSearch
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("searchConfigurationProfiles"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "containsObject:", CFSTR("newsArticleSearch"));
  return (char)v2;
}

- (BOOL)useFasterSearch
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("fasterSearchEnabledLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)useMultipleNativeAds
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("useMultipleNativeAdsEnabledLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)searchFeaturedStoriesEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("searchFeaturedStoriesEnabledLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (NSArray)searchConfigurationProfiles
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("searchConfigurationProfiles"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  return (NSArray *)v5;
}

- (NSArray)sportsSearchConfigurationProfiles
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("sportsSearchConfigurationProfiles"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  return (NSArray *)v5;
}

- (BOOL)isSportsSyncingSupported
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("isSportsSyncingSupported"), 1);

  return v3;
}

- (BOOL)servicesBundleCIPActivationEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("servicesBundleCIPActivationEnabledLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)paidBundleViaOfferEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("paidBundleViaOfferEnabledLevel"), 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)isSIWAOnMacEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("signInWithAppleOnMacEnabledLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)fineGrainedNewsletterManagementEnabled
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("143441");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsAppConfig storefrontID](self, "storefrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", v4))
    v5 = 0xFFFFFFFFLL;
  else
    v5 = 0;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("fineGrainedNewsletterManagementEnabledLevel"), v5);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v7);
}

- (BOOL)feedDifferentiationModeEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("feedDifferentiationModeEnabledLevel"), 0xFFFFFFFFLL);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)dimNonSubscriberContentOffline
{
  void *v2;
  char v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("dimNonSubscriberContentOffline"), 0);

  return v3;
}

- (NSString)offlineModeUnavailableMessage
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("offlineModeUnavailableMessage"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)offlineStatusBannerUpsellMessage
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("offlineStatusBannerUpsellMessage"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)enterOfflineModeButtonTitle
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("enterOfflineModeButtonTitle"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)exitOfflineModeButtonTitle
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("exitOfflineModeButtonTitle"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)newSearchEndpointConfigEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("newSearchEndpointConfigEnabledLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)moreToReadEOAEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("moreToReadEOAEnabledLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)moreFromIssueEOAEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("moreFromIssueEOAEnabledLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)splitTopicGroups
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("splitTopicGroups"), 0);

  return v3;
}

- (BOOL)inAppMessagesEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("inAppMessagesEnabledLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (double)continueReadingDismissalInterval
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("continueReadingDismissalIntervalSeconds"), 6.0);

  return v3;
}

- (BOOL)isCardFeedRedesignEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("feedRedesignEnabledLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (int64_t)alternateUniversalLinksResourceRefreshRate
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("alternateUniversalLinksResourceRefreshRate"), 86400);

  return v3;
}

- (BOOL)personalizationEventTrackingEnabled
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("personalizationEventTrackingEnabled2"), 0);

  if (!NFInternalBuild())
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  NewsCoreUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("news.features.personalizationEventTracking"));

  if (v5 == 2)
    return 0;
  if (v5 != 1)
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  return 1;
}

- (BOOL)sportsRecordEnabled
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("sportsRecordEnabled"), 0xFFFFFFFFLL);

  if (!NFInternalBuild())
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  NewsCoreUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("news.features.useSportsRecord"));

  if (v5 == 2)
    return 0;
  if (v5 != 1)
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  return 1;
}

- (BOOL)sportsRecommendationHidesIgnoredTags
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("sportsRecommendationHidesIgnoredTags"), 1);

  if (!NFInternalBuild())
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  NewsCoreUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("news.sports.sportsRecommendationHidesIgnoredTags"));

  if (v5 == 2)
    return 0;
  if (v5 != 1)
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  return 1;
}

- (BOOL)sportsNativeAdsEnabled
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("sportsNativeAdsEnabled"), 1);

  if (!NFInternalBuild())
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  NewsCoreUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("news.sports.nativeAdsEnabled"));

  if (v5 == 2)
    return 0;
  if (v5 != 1)
    return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
  return 1;
}

- (BOOL)isImprovedManagedTopicGroupingEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("improvedManagedTopicGroupingEnabledLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (NSArray)analyticsEventNamesPublicAllowlist
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("analyticsEventNamesPublicAllowlist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSArray)analyticsEventNamesSeedAllowlist
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("analyticsEventNamesSeedAllowlist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSArray)analyticsEventNamesInternalAllowlist
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("analyticsEventNamesInternalAllowlist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (BOOL)shouldProxyURLBucketFetch
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("shouldProxyURLBucketFetch"), 1);

  return v3;
}

- (int64_t)minimumBucketGroupConfigVersion
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("minimumBucketGroupConfigVersion"), 2);

  return v3;
}

- (FCEmbedProxyConfiguration)embedProxyConfiguration
{
  void *v2;
  void *v3;
  FCEmbedProxyConfiguration *v4;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("embedProxyConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[FCEmbedProxyConfiguration initWithDictionary:]([FCEmbedProxyConfiguration alloc], "initWithDictionary:", v3);
  return v4;
}

- (double)derivedPersonalizationDataBalanceValue
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("derivedPersonalizationDataBalanceValue"), 1.0);

  return v3;
}

- (FCNewsPlusLabelConfigGroup)newsPlusLabelConfigGroup
{
  void *v2;
  void *v3;
  FCNewsPlusLabelConfigGroup *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("newsPlusLabelConfigGroup"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[FCNewsPlusLabelConfigGroup initWithConfigDictionary:]([FCNewsPlusLabelConfigGroup alloc], "initWithConfigDictionary:", v3);
  return v4;
}

- (FCAppReviewRequestConfig)appReviewRequestConfig
{
  void *v2;
  void *v3;
  FCAppReviewRequestConfig *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("appReviewRequestConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[FCAppReviewRequestConfig initWithDictionary:]([FCAppReviewRequestConfig alloc], "initWithDictionary:", v3);
  return v4;
}

- (NSArray)analyticsDenylistDescriptorsPublic
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("analyticsDenylistDescriptorsPublic"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSArray)analyticsDenylistDescriptorsSeed
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("analyticsDenylistDescriptorsSeed"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSDictionary)editorialTopicEventMapping
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSDictionary *v6;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationDictionaryValueWithDefaultValue(v3, (uint64_t)CFSTR("editorialTopicEventMapping"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA70];
  v6 = v4;

  return v6;
}

- (NSDictionary)editorialTopicEventMappingProperties
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationDictionaryValueWithDefaultValue(v3, (uint64_t)CFSTR("editorialTopicEventMappingProperties"), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0C9AA70];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  objc_msgSend(v7, "fc_dictionaryByTransformingValuesWithBlock:", &__block_literal_global_854);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

FCEditorialTopicEventMappingProperty *__55__FCNewsAppConfig_editorialTopicEventMappingProperties__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FCEditorialTopicEventMappingProperty *v3;

  v2 = a2;
  v3 = -[FCEditorialTopicEventMappingProperty initWithDictionary:]([FCEditorialTopicEventMappingProperty alloc], "initWithDictionary:", v2);

  return v3;
}

- (NSArray)editoralRecommendedSportsTopicTagIds
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationArrayValueWithDefaultValue(v3, (uint64_t)CFSTR("editoralRecommendedSportsTopicTagIds"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (NSArray)editorialFallbackSportsTopicTagIds
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationArrayValueWithDefaultValue(v3, (uint64_t)CFSTR("editorialFallbackSportsTopicTagIds"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (NSArray)deprecatedSportsTopicTagIds
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationArrayValueWithDefaultValue(v3, (uint64_t)CFSTR("deprecatedSportsTopicTagIds"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (int64_t)sportsManagementRecommendedItemsCount
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("sportsManagementRecommendedItemsCount"), 5);
  return v4;
}

- (int64_t)sportsManagementMinChildItemsCount
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("sportsManagementMinChildItemsCount"), 15);
  return v4;
}

- (NSString)sportsTaxonomyResourceId
{
  void *v2;
  void *v3;
  void *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("taxonomyResourceId"), &stru_1E464BC40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sportsStandingConfigurationResourceId
{
  void *v2;
  void *v3;
  void *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("standingConfigurationResourceId"), &stru_1E464BC40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sportsBoxScoreConfigurationResourceId
{
  void *v2;
  void *v3;
  void *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("boxScoreConfigurationResourceId"), &stru_1E464BC40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sportsKeyPlayerConfigurationResourceId
{
  void *v2;
  void *v3;
  void *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("keyPlayerConfigurationResourceId"), &stru_1E464BC40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sportsLineScoreConfigurationResourceId
{
  void *v2;
  void *v3;
  void *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("lineScoreConfigurationResourceId"), &stru_1E464BC40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sportsInjuryReportConfigurationResourceId
{
  void *v2;
  void *v3;
  void *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("injuryReportConfigurationResourceId"), &stru_1E464BC40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sportsBracketConfigurationResourceId
{
  void *v2;
  void *v3;
  void *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("bracketConfigurationResourceId"), &stru_1E464BC40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sportsScoreConfigurationResourceId
{
  void *v2;
  void *v3;
  void *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("scoreConfigurationResourceId"), &stru_1E464BC40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sportsSyncingConfigurationResourceId
{
  void *v2;
  void *v3;
  void *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("sportsSyncingConfigurationResourceId"), &stru_1E464BC40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sportsSyncingConfigurationV2ResourceId
{
  void *v2;
  void *v3;
  void *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("sportsSyncingConfigurationV2ResourceId"), &stru_1E464BC40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sportsFeaturedEventsResourceId
{
  void *v2;
  void *v3;
  void *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("featuredEventsResourceId"), &stru_1E464BC40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sportsConfigurationResourceId
{
  void *v2;
  void *v3;
  void *v4;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("sportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("configurationResourceId"), &stru_1E464BC40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)webEmbedDataSourcesConfigurationResourceId
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("webEmbedDataSourcesConfigurationResourceId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)liveActivityFollowedAlertsThreshold
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("liveActivityFollowedAlertsThreshold"), 3);

  return v3;
}

- (int64_t)liveActivityScheduledAlertsThreshold
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("liveActivityScheduledAlertsThreshold"), 3);

  return v3;
}

- (double)liveActivityScheduleDelay
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("liveActivityScheduleDelay"), 10.0);

  return v3;
}

- (double)liveActivityScheduleRandomInitialDelay
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("liveActivityScheduleRandomInitialDelay"), 30.0);

  return v3;
}

- (double)liveActivityScheduleTimeWindow
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("liveActivityScheduleTimeWindow"), 300.0);

  return v3;
}

- (double)liveActivityScheduleRetryInterval
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("liveActivityScheduleRetryInterval"), 300.0);

  return v3;
}

- (double)liveActivityScheduleRetryTimeWindow
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("liveActivityScheduleRetryTimeWindow"), 3600.0);

  return v3;
}

- (int64_t)liveActivityScheduleRetryCountMax
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("liveActivityScheduleRetryCountMax"), 5);

  return v3;
}

- (NSArray)liveActivityAssetServerURLs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("liveActivityAssetServerURLs"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_915);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

uint64_t __46__FCNewsAppConfig_liveActivityAssetServerURLs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a2);
}

- (BOOL)useAltSportsRecommendationMapping
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = FCAppConfigurationBoolValue(v3, (uint64_t)CFSTR("useAltSportsRecommendationMapping"), 0);
  return (char)v2;
}

- (double)minMembershipForTaxonomyCandidates
{
  void *v2;
  void *v3;
  double v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = FCAppConfigurationDoubleValue(v3, (uint64_t)CFSTR("minMembershipForTaxonomyCandidates"), 0.0);
  return v4;
}

- (BOOL)considerAutofavoritesInMappingCandidates
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = FCAppConfigurationBoolValue(v3, (uint64_t)CFSTR("considerAutofavoritesInMappingCandidates"), 1);
  return (char)v2;
}

- (double)minScoreThresholdForSportsRecommendations
{
  void *v2;
  void *v3;
  double v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = FCAppConfigurationDoubleValue(v3, (uint64_t)CFSTR("minScoreThresholdForSportsRecommendations"), 0.0);
  return v4;
}

- (double)minMembershipThreshold
{
  void *v2;
  void *v3;
  double v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = FCAppConfigurationDoubleValue(v3, (uint64_t)CFSTR("minMembershipThreshold"), 0.051);
  return v4;
}

- (double)minMembershipThresholdForLocalRecommendation
{
  void *v2;
  void *v3;
  double v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = FCAppConfigurationDoubleValue(v3, (uint64_t)CFSTR("minMembershipThresholdForLocalRecommendation"), 0.0);
  return v4;
}

- (int64_t)maxSportRecommendationsWithLeagueTypeCollege
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("maxSportRecommendationsWithLeagueTypeCollege"), 2);
  return v4;
}

- (int64_t)maxSportRecommendationsPerSport
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("localizedSportsDataConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("maxSportRecommendationsPerSport"), 3);
  return v4;
}

- (NSDictionary)tagFeedGroupClusteringKnobOverrides
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  NewsCoreUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("news.news_personalization.cluster_config_overrides.enabled"));

  if (NFInternalBuild() && v4)
  {
    NewsCoreUserDefaults();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringForKey:", CFSTR("news.news_personalization.cluster_config_overrides.json"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      if (!v9)
      {

        goto LABEL_10;
      }
      v10 = v9;
      v11 = FCAppConfigurationLog;
      if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_error_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_ERROR, "Failed to parse debug override value for topicFeedGroupClusteringKnobOverrides error: %@", buf, 0xCu);
      }

    }
  }
  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("tagFeedGroupClusteringKnobOverrides"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return (NSDictionary *)v8;
}

- (FCArticleLinkBehaviorConfig)articleLinkBehaviorConfig
{
  void *v2;
  void *v3;
  FCArticleLinkBehaviorConfig *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("articleLinkBehaviorConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[FCArticleLinkBehaviorConfig initWithConfigDictionary:]([FCArticleLinkBehaviorConfig alloc], "initWithConfigDictionary:", v3);
  return v4;
}

- (FCArticleModalBrandBarConfig)articleModalBrandBarConfig
{
  void *v2;
  void *v3;
  FCArticleModalBrandBarConfig *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("articleModalBrandBarConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[FCArticleModalBrandBarConfig initWithConfigDictionary:]([FCArticleModalBrandBarConfig alloc], "initWithConfigDictionary:", v3);
  return v4;
}

- (FCSportsFavoritesSyncModalConfig)sportsFavoritesSyncModalConfig
{
  void *v2;
  void *v3;
  FCSportsFavoritesSyncModalConfig *v4;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("sportsFavoritesSyncModalConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[FCSportsFavoritesSyncModalConfig initWithConfigDictionary:]([FCSportsFavoritesSyncModalConfig alloc], "initWithConfigDictionary:", v3);
  return v4;
}

- (NSString)newsFeedFormatConfiguration
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("newsFeedFormatConfiguration"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)articleLinkBehaviorImprovementsEnabled
{
  void *v2;
  uint64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("articleLinkBehaviorImprovementsEnabledLevel"), 0);

  return +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", v3);
}

- (BOOL)allowAnyChannelForTodayChannelGroups
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("allowAnyChannelForTodayChannelGroups"), 0);

  if (NFInternalBuild()
    && (NewsCoreUserDefaults(),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectForKey:", CFSTR("news.personalization.allow_any_channel_for_today_channel_groups")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    NewsCoreUserDefaults();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "BOOLForKey:", CFSTR("news.personalization.allow_any_channel_for_today_channel_groups"));

    v7 = FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v3;
      _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "See internal user with allow any channel for today channel groups override as %d", (uint8_t *)v10, 8u);
    }
  }
  else if (v3)
  {
    v8 = FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "allowAnyChannelForTodayChannelGroups being reported as true from app config", (uint8_t *)v10, 2u);
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (double)tagSubscriptionRepromptDelay
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("tagSubscriptionRepromptDelay"), 0.0);

  return v3;
}

- (id)jsonEncodableObject
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

void __41__FCNewsAppConfig_overrideForYouConfigID__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("enable_config_overrides")) & 1) != 0)
    {
      NewsCoreUserDefaults();
      v0 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "stringForKey:", CFSTR("override_foryouconfig_id"));
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = (void *)_MergedGlobals_146;
      _MergedGlobals_146 = v1;

    }
    else
    {
      v0 = (void *)_MergedGlobals_146;
      _MergedGlobals_146 = 0;
    }

    v3 = v4;
  }
  else
  {
    v3 = (void *)_MergedGlobals_146;
    _MergedGlobals_146 = 0;
  }

}

void __48__FCNewsAppConfig_overrideForYouPremiumConfigID__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("enable_config_overrides")) & 1) != 0)
    {
      NewsCoreUserDefaults();
      v0 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "stringForKey:", CFSTR("override_foryouconfig_premium_id"));
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = (void *)qword_1ED0F7E58;
      qword_1ED0F7E58 = v1;

    }
    else
    {
      v0 = (void *)qword_1ED0F7E58;
      qword_1ED0F7E58 = 0;
    }

    v3 = v4;
  }
  else
  {
    v3 = (void *)qword_1ED0F7E58;
    qword_1ED0F7E58 = 0;
  }

}

void __48__FCNewsAppConfig_overrideWidgetSectionConfigID__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("enable_config_overrides")) & 1) != 0)
    {
      NewsCoreUserDefaults();
      v0 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "stringForKey:", CFSTR("override_widgetsectionconfig_id"));
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = (void *)qword_1ED0F7E68;
      qword_1ED0F7E68 = v1;

    }
    else
    {
      v0 = (void *)qword_1ED0F7E68;
      qword_1ED0F7E68 = 0;
    }

    v3 = v4;
  }
  else
  {
    v3 = (void *)qword_1ED0F7E68;
    qword_1ED0F7E68 = 0;
  }

}

void __69__FCNewsAppConfig_defaultForYouRecordConfigIDByLocalizedStorefrontID__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("143441");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("Y"), CFSTR("143441"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("143455");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("Y"), CFSTR("143455"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("143455-fr-ca");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-fr"), CFSTR("Y"), CFSTR("143455"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("143444");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("Y"), CFSTR("143444"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = CFSTR("143460");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("Y"), CFSTR("143460"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0F7E78;
  qword_1ED0F7E78 = v5;

}

void __76__FCNewsAppConfig_defaultForYouPremiumRecordConfigIDByLocalizedStorefrontID__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("143441");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("YP"), CFSTR("143441"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("143455");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("YP"), CFSTR("143455"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("143455-fr-ca");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-fr"), CFSTR("YP"), CFSTR("143455"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("143444");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("YP"), CFSTR("143444"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = CFSTR("143460");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("YP"), CFSTR("143460"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0F7E88;
  qword_1ED0F7E88 = v5;

}

void __69__FCNewsAppConfig_defaultWidgetRecordConfigIDByLocalizedStorefrontID__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("143441");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("W"), CFSTR("143441"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("143455");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("W"), CFSTR("143455"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("143455-fr-ca");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-fr"), CFSTR("W"), CFSTR("143455"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("143444");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("W"), CFSTR("143444"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = CFSTR("143460");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("W"), CFSTR("143460"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0F7E98;
  qword_1ED0F7E98 = v5;

}

void __72__FCNewsAppConfig_defaultMagazinesConfigRecordIDByLocalizedStorefrontID__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("143441");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("configuration-magazines"), CFSTR("143441"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("143455");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("configuration-magazines"), CFSTR("143455"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("143455-fr-ca");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-fr"), CFSTR("configuration-magazines"), CFSTR("143455"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("143444");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("configuration-magazines"), CFSTR("143444"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = CFSTR("143460");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-en"), CFSTR("configuration-magazines"), CFSTR("143460"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0F7EA8;
  qword_1ED0F7EA8 = v5;

}

- (int64_t)numberOfFetchedHeadlinesToReport
{
  void *v2;
  void *v3;
  int64_t v4;
  uint64_t v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("headlinePersonalizationInstrumentationConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (FCAppConfigurationBoolValue(v3, (uint64_t)CFSTR("sendsAllFetchedHeadlines"), 0))
  {
    v4 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("maxNumberOfHeadlines"), 0);
  }
  else
  {
    v4 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("numberOfSampledHeadlines"), 0);
    v5 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("maxNumberOfHeadlines"), 0);
    if (v4 >= v5)
      v4 = v5;
  }

  return v4;
}

- (BOOL)shouldShuffleReportedHeadlines
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("headlinePersonalizationInstrumentationConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = FCAppConfigurationBoolValue(v3, (uint64_t)CFSTR("sendsAllFetchedHeadlines"), 0) ^ 1;
  return (char)v2;
}

- (NSString)aiAttributionArticleString
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig languageConfigDictionary](self, "languageConfigDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v2, (uint64_t)CFSTR("aiAttributionArticleString"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)enableNewsPersonalizationAutoFavorites
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("enableNewsPersonalizationAutoFavorites"), 0);

  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerForKey:", CFSTR("news.features.enableNewsPersonalizationAutoFavorites"));

    if (v5 == 1)
    {
      return 1;
    }
    else if (v5 == 2)
    {
      return 0;
    }
  }
  return v3;
}

- (BOOL)enableTabiTagScoring
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("enableTabiTagScoring"), 0);

  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerForKey:", CFSTR("news.features.enableTabiTagScoring"));

    if (v5 == 1)
    {
      return 1;
    }
    else if (v5 == 2)
    {
      return 0;
    }
  }
  return v3;
}

- (BOOL)enableTabiAdSegments
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("enableTabiAdSegments"), 0);

  return v3;
}

- (BOOL)enableTabiCohortMemberships
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("enableTabiCohortMemberships"), 0);

  return v3;
}

- (BOOL)enableTabiMyMagazinesPersonalization
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("enableTabiMyMagazinesPersonalization"), 0);

  return v3;
}

- (BOOL)aggregatesInXavierEnabled
{
  void *v2;
  char v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationBoolValue(v2, (uint64_t)CFSTR("aggregatesInXavierEnabled"), 1);

  return v3;
}

- (NSDictionary)articleConfig
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationDictionaryValueWithDefaultValue(v2, (uint64_t)CFSTR("articleConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (int64_t)audioPlaylistSweepRecencyThresholdInDays
{
  void *v2;
  int64_t v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationIntegerValue(v2, (uint64_t)CFSTR("audioPlaylistSweepRecencyThresholdInDays"), 7);

  return v3;
}

- (double)audioPlaylistSweepListeningPercentageThreshold
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("audioPlaylistSweepListeningPercentageThreshold"), 0.4);

  return v3;
}

- (NSArray)offlineModeDetectionIgnoredHosts
{
  void *v2;
  void *v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationArrayValueWithDefaultValue(v2, (uint64_t)CFSTR("offlineModeDetectionIgnoredHosts"), &unk_1E470C648);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (double)offlineModeMinimumSecondsSinceSuccessToOffline
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("offlineModeMinimumSecondsSinceSuccessToOffline"), 10.0);

  return v3;
}

- (double)offlineModeDetectionPingInterval
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("offlineModeDetectionPingInterval"), 1.0);

  return v3;
}

- (double)offlineModeDetectionPingTimeoutInterval
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("offlineModeDetectionPingTimeoutInterval"), 5.0);

  return v3;
}

- (double)offlineModeThrottleUnreliableDetectionTimeoutInterval
{
  void *v2;
  double v3;

  -[FCNewsAppConfig configDictionary](self, "configDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FCAppConfigurationDoubleValue(v2, (uint64_t)CFSTR("offlineModeThrottleUnreliableDetectionTimeoutInterval"), 20.0);

  return v3;
}

- (FCPeopleAlsoReadConfiguration)peopleAlsoReadConfiguration
{
  return self->_peopleAlsoReadConfiguration;
}

- (FCOfflineDownloadsConfiguration)offlineDownloadsConfigOptimized
{
  return self->_offlineDownloadsConfigOptimized;
}

- (NSDictionary)channelUpsellConfigsByChannelID
{
  return self->_channelUpsellConfigsByChannelID;
}

- (NSDictionary)channelPaywallConfigsByChannelID
{
  return self->_channelPaywallConfigsByChannelID;
}

- (FCSportsUpsellConfig)sportsUpsellConfig
{
  return self->_sportsUpsellConfig;
}

- (FCLocationSharingUpsellConfig)locationSharingUpsellConfig
{
  return self->_locationSharingUpsellConfig;
}

- (NSData)autoFavoritesServiceConfigurationJSONData
{
  return self->_autoFavoritesServiceConfigurationJSONData;
}

- (NSDictionary)channelPickerConfigsByName
{
  return self->_channelPickerConfigsByName;
}

- (FCLaunchPresentationConfig)launchPresentationConfig
{
  return self->_launchPresentationConfig;
}

- (NSDictionary)campaignReferralConfigsByID
{
  return self->_campaignReferralConfigsByID;
}

- (NSDictionary)superfeedConfigOverrideResourceIDs
{
  return self->_superfeedConfigOverrideResourceIDs;
}

- (BOOL)privateDataShouldMigrateToV4
{
  return self->_privateDataShouldMigrateToV4;
}

- (BOOL)privateDataShouldCleanupToV4
{
  return self->_privateDataShouldCleanupToV4;
}

@end
