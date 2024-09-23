@implementation FCNewsTabiFeedPersonalizationOutputConfiguration

- (FCNewsTabiFeedPersonalizationOutputConfiguration)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  FCNewsTabiFeedPersonalizationOutputConfiguration *v8;
  FCNewsTabiFeedPersonalizationOutputConfiguration *v9;
  uint64_t v10;
  NSString *topicFeedHeadlineScoringOutputName;
  uint64_t v12;
  NSString *magazineFeedHeadlineScoringOutputName;
  uint64_t v14;
  NSString *magazineFeedIssuesHeadlineScoringOutputName;
  uint64_t v16;
  NSString *legacyAudioFeedHeadlineScoringOutputName;
  uint64_t v18;
  NSString *audioFeedHeadlineScoringOutputName;
  uint64_t v20;
  NSString *articleRecirculationPrimaryHeadlineScoringOutputName;
  uint64_t v22;
  NSString *articleRecirculationSecondaryHeadlineScoringOutputName;
  uint64_t v24;
  NSString *articleRecirculationTertiaryHeadlineScoringOutputName;
  uint64_t v26;
  NSString *articleRecirculationQuaternaryHeadlineScoringOutputName;
  uint64_t v28;
  NSString *bestOfBundleHeadlineScoringOutputName;
  uint64_t v30;
  NSString *forYouGroupHeadlineScoringOutputName;
  uint64_t v32;
  NSString *greatStoriesYouMissedGroupHeadlineScoringOutputName;
  uint64_t v34;
  NSString *latestStoriesGroupHeadlineScoringOutputName;
  uint64_t v36;
  NSString *localNewsGroupHeadlineScoringOutputName;
  uint64_t v38;
  NSString *newspaperGroupMagazineFeedHeadlineScoringOutputName;
  uint64_t v40;
  NSString *todayWidgetHeadlineScoringOutputName;
  uint64_t v42;
  NSString *tagWidgetHeadlineScoringOutputName;
  uint64_t v44;
  NSString *notificationHeadlineScoringOutputName;
  uint64_t v46;
  NSString *mySportsGroupHeadlineScoringOutputName;
  uint64_t v48;
  NSString *sportsTopStoriesHeadlineScoringOutputName;
  uint64_t v50;
  NSString *introToSportsGroupHeadlineScoringOutputName;
  uint64_t v52;
  NSString *highlightsGroupHeadlineScoringOutputName;
  uint64_t v54;
  NSString *articleListTagFeedGroupHeadlineScoringOutputName;
  uint64_t v56;
  NSString *tagFeedHeadlineScoringOutputName;
  uint64_t v58;
  NSString *newspaperGroupTodayFeedHeadlineScoringOutputName;
  uint64_t v60;
  NSString *moreForYouGroupHeadlineScoringOutputName;
  uint64_t v62;
  NSString *introToSportsGroupForYouHeadlineScoringOutputName;
  uint64_t v64;
  NSString *mySportsGroupForYouHeadlineScoringOutputName;
  uint64_t v66;
  NSString *mySportsTopicsHeadlineScoringOutputName;
  uint64_t v68;
  NSString *curatedGroupHeadlineScoringOutputName;
  uint64_t v70;
  NSString *curatedGroupIssuesHeadlineScoringOutputName;
  uint64_t v72;
  NSString *localSectionGroupHeadlineScoringOutputName;
  uint64_t v74;
  NSString *newspaperSectionGroupHeadlineScoringOutputName;
  uint64_t v76;
  NSString *sportsEventArticlesGroupHeadlineScoringOutputName;
  uint64_t v78;
  NSString *tagFeedForYouGroupHeadlineScoringOutputName;
  uint64_t v80;
  NSString *tagRecentStoriesGroupHeadlineScoringOutputName;
  uint64_t v82;
  NSString *tagDateRangeGroupHeadlineScoringOutputName;
  uint64_t v84;
  NSString *sportsEventTopicGroupHeadlineScoringOutputName;
  uint64_t v86;
  NSString *shadowDefaultHeadlineScoringOutputName;
  uint64_t v88;
  NSString *shadowMagazineFeedHeadlineScoringOutputName;
  uint64_t v90;
  NSString *shadowMagazineFeedIssuesHeadlineScoringOutputName;
  uint64_t v92;
  NSString *shadowLegacyAudioFeedHeadlineScoringOutputName;
  uint64_t v94;
  NSString *shadowAudioFeedHeadlineScoringOutputName;
  uint64_t v96;
  NSString *shadowArticleRecirculationPrimaryHeadlineScoringOutputName;
  uint64_t v98;
  NSString *shadowArticleRecirculationSecondaryHeadlineScoringOutputName;
  uint64_t v100;
  NSString *shadowArticleRecirculationTertiaryHeadlineScoringOutputName;
  uint64_t v102;
  NSString *shadowArticleRecirculationQuaternaryHeadlineScoringOutputName;
  uint64_t v104;
  NSString *shadowBestOfBundleHeadlineScoringOutputName;
  uint64_t v106;
  NSString *shadowForYouGroupHeadlineScoringOutputName;
  uint64_t v108;
  NSString *shadowGreatStoriesYouMissedGroupHeadlineScoringOutputName;
  uint64_t v110;
  NSString *shadowLatestStoriesGroupHeadlineScoringOutputName;
  uint64_t v112;
  NSString *shadowLocalNewsGroupHeadlineScoringOutputName;
  uint64_t v114;
  NSString *shadowNewspaperGroupMagazineFeedHeadlineScoringOutputName;
  uint64_t v116;
  NSString *shadowTodayWidgetHeadlineScoringOutputName;
  uint64_t v118;
  NSString *shadowTagWidgetHeadlineScoringOutputName;
  uint64_t v120;
  NSString *shadowNotificationHeadlineScoringOutputName;
  uint64_t v122;
  NSString *shadowMySportsGroupHeadlineScoringOutputName;
  uint64_t v124;
  NSString *shadowSportsTopStoriesHeadlineScoringOutputName;
  uint64_t v126;
  NSString *shadowIntroToSportsGroupHeadlineScoringOutputName;
  uint64_t v128;
  NSString *shadowHighlightsGroupHeadlineScoringOutputName;
  uint64_t v130;
  NSString *shadowArticleListTagFeedGroupHeadlineScoringOutputName;
  uint64_t v132;
  NSString *shadowTagFeedHeadlineScoringOutputName;
  uint64_t v134;
  NSString *shadowNewspaperGroupTodayFeedHeadlineScoringOutputName;
  uint64_t v136;
  NSString *shadowMoreForYouGroupHeadlineScoringOutputName;
  uint64_t v138;
  NSString *shadowIntroToSportsGroupForYouHeadlineScoringOutputName;
  uint64_t v140;
  NSString *shadowMySportsGroupForYouHeadlineScoringOutputName;
  uint64_t v142;
  NSString *shadowMySportsTopicsHeadlineScoringOutputName;
  uint64_t v144;
  NSString *shadowCuratedGroupHeadlineScoringOutputName;
  uint64_t v146;
  NSString *shadowCuratedGroupIssuesHeadlineScoringOutputName;
  uint64_t v148;
  NSString *shadowLocalSectionGroupHeadlineScoringOutputName;
  uint64_t v150;
  NSString *shadowNewspaperSectionGroupHeadlineScoringOutputName;
  uint64_t v152;
  NSString *shadowSportsEventArticlesGroupHeadlineScoringOutputName;
  uint64_t v154;
  NSString *shadowTagFeedForYouGroupHeadlineScoringOutputName;
  uint64_t v156;
  NSString *shadowTagRecentStoriesGroupHeadlineScoringOutputName;
  uint64_t v158;
  NSString *shadowTagDateRangeGroupHeadlineScoringOutputName;
  uint64_t v160;
  NSString *shadowSportsEventTopicGroupHeadlineScoringOutputName;
  FCNewsTabiFeedPersonalizationOutputConfiguration *v162;
  objc_super v164;
  _QWORD v165[4];
  id v166;

  v4 = a3;
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("defaultHeadlineScoringOutputName"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v164.receiver = self;
    v164.super_class = (Class)FCNewsTabiFeedPersonalizationOutputConfiguration;
    v8 = -[FCNewsTabiFeedPersonalizationOutputConfiguration init](&v164, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_defaultHeadlineScoringOutputName, v6);
      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("topicFeedHeadlineScoringOutputName"), v7);
      v10 = objc_claimAutoreleasedReturnValue();
      topicFeedHeadlineScoringOutputName = v9->_topicFeedHeadlineScoringOutputName;
      v9->_topicFeedHeadlineScoringOutputName = (NSString *)v10;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("magazineFeedHeadlineScoringOutputName"), v7);
      v12 = objc_claimAutoreleasedReturnValue();
      magazineFeedHeadlineScoringOutputName = v9->_magazineFeedHeadlineScoringOutputName;
      v9->_magazineFeedHeadlineScoringOutputName = (NSString *)v12;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("magazineFeedIssuesHeadlineScoringOutputName"), v7);
      v14 = objc_claimAutoreleasedReturnValue();
      magazineFeedIssuesHeadlineScoringOutputName = v9->_magazineFeedIssuesHeadlineScoringOutputName;
      v9->_magazineFeedIssuesHeadlineScoringOutputName = (NSString *)v14;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("legacyAudioFeedHeadlineScoringOutputName"), v7);
      v16 = objc_claimAutoreleasedReturnValue();
      legacyAudioFeedHeadlineScoringOutputName = v9->_legacyAudioFeedHeadlineScoringOutputName;
      v9->_legacyAudioFeedHeadlineScoringOutputName = (NSString *)v16;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("audioFeedHeadlineScoringOutputName"), v7);
      v18 = objc_claimAutoreleasedReturnValue();
      audioFeedHeadlineScoringOutputName = v9->_audioFeedHeadlineScoringOutputName;
      v9->_audioFeedHeadlineScoringOutputName = (NSString *)v18;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("articleRecirculationPrimaryHeadlineScoringOutputName"), v7);
      v20 = objc_claimAutoreleasedReturnValue();
      articleRecirculationPrimaryHeadlineScoringOutputName = v9->_articleRecirculationPrimaryHeadlineScoringOutputName;
      v9->_articleRecirculationPrimaryHeadlineScoringOutputName = (NSString *)v20;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("articleRecirculationSecondaryHeadlineScoringOutputName"), v7);
      v22 = objc_claimAutoreleasedReturnValue();
      articleRecirculationSecondaryHeadlineScoringOutputName = v9->_articleRecirculationSecondaryHeadlineScoringOutputName;
      v9->_articleRecirculationSecondaryHeadlineScoringOutputName = (NSString *)v22;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("articleRecirculationTertiaryHeadlineScoringOutputName"), v7);
      v24 = objc_claimAutoreleasedReturnValue();
      articleRecirculationTertiaryHeadlineScoringOutputName = v9->_articleRecirculationTertiaryHeadlineScoringOutputName;
      v9->_articleRecirculationTertiaryHeadlineScoringOutputName = (NSString *)v24;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("articleRecirculationQuaternaryHeadlineScoringOutputName"), v7);
      v26 = objc_claimAutoreleasedReturnValue();
      articleRecirculationQuaternaryHeadlineScoringOutputName = v9->_articleRecirculationQuaternaryHeadlineScoringOutputName;
      v9->_articleRecirculationQuaternaryHeadlineScoringOutputName = (NSString *)v26;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("bestOfBundleHeadlineScoringOutputName"), v7);
      v28 = objc_claimAutoreleasedReturnValue();
      bestOfBundleHeadlineScoringOutputName = v9->_bestOfBundleHeadlineScoringOutputName;
      v9->_bestOfBundleHeadlineScoringOutputName = (NSString *)v28;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("forYouGroupHeadlineScoringOutputName"), v7);
      v30 = objc_claimAutoreleasedReturnValue();
      forYouGroupHeadlineScoringOutputName = v9->_forYouGroupHeadlineScoringOutputName;
      v9->_forYouGroupHeadlineScoringOutputName = (NSString *)v30;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("greatStoriesYouMissedGroupHeadlineScoringOutputName"), v7);
      v32 = objc_claimAutoreleasedReturnValue();
      greatStoriesYouMissedGroupHeadlineScoringOutputName = v9->_greatStoriesYouMissedGroupHeadlineScoringOutputName;
      v9->_greatStoriesYouMissedGroupHeadlineScoringOutputName = (NSString *)v32;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("latestStoriesGroupHeadlineScoringOutputName"), v7);
      v34 = objc_claimAutoreleasedReturnValue();
      latestStoriesGroupHeadlineScoringOutputName = v9->_latestStoriesGroupHeadlineScoringOutputName;
      v9->_latestStoriesGroupHeadlineScoringOutputName = (NSString *)v34;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("localNewsGroupHeadlineScoringOutputName"), v7);
      v36 = objc_claimAutoreleasedReturnValue();
      localNewsGroupHeadlineScoringOutputName = v9->_localNewsGroupHeadlineScoringOutputName;
      v9->_localNewsGroupHeadlineScoringOutputName = (NSString *)v36;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("newspaperGroupMagazineFeedHeadlineScoringOutputName"), v7);
      v38 = objc_claimAutoreleasedReturnValue();
      newspaperGroupMagazineFeedHeadlineScoringOutputName = v9->_newspaperGroupMagazineFeedHeadlineScoringOutputName;
      v9->_newspaperGroupMagazineFeedHeadlineScoringOutputName = (NSString *)v38;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("todayWidgetHeadlineScoringOutputName"), v7);
      v40 = objc_claimAutoreleasedReturnValue();
      todayWidgetHeadlineScoringOutputName = v9->_todayWidgetHeadlineScoringOutputName;
      v9->_todayWidgetHeadlineScoringOutputName = (NSString *)v40;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("tagWidgetHeadlineScoringOutputName"), v7);
      v42 = objc_claimAutoreleasedReturnValue();
      tagWidgetHeadlineScoringOutputName = v9->_tagWidgetHeadlineScoringOutputName;
      v9->_tagWidgetHeadlineScoringOutputName = (NSString *)v42;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("notificationHeadlineScoringOutputName"), v7);
      v44 = objc_claimAutoreleasedReturnValue();
      notificationHeadlineScoringOutputName = v9->_notificationHeadlineScoringOutputName;
      v9->_notificationHeadlineScoringOutputName = (NSString *)v44;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("mySportsGroupHeadlineScoringOutputName"), v7);
      v46 = objc_claimAutoreleasedReturnValue();
      mySportsGroupHeadlineScoringOutputName = v9->_mySportsGroupHeadlineScoringOutputName;
      v9->_mySportsGroupHeadlineScoringOutputName = (NSString *)v46;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("sportsTopStoriesHeadlineScoringOutputName"), v7);
      v48 = objc_claimAutoreleasedReturnValue();
      sportsTopStoriesHeadlineScoringOutputName = v9->_sportsTopStoriesHeadlineScoringOutputName;
      v9->_sportsTopStoriesHeadlineScoringOutputName = (NSString *)v48;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("introToSportsGroupHeadlineScoringOutputName"), v7);
      v50 = objc_claimAutoreleasedReturnValue();
      introToSportsGroupHeadlineScoringOutputName = v9->_introToSportsGroupHeadlineScoringOutputName;
      v9->_introToSportsGroupHeadlineScoringOutputName = (NSString *)v50;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("highlightsGroupHeadlineScoringOutputName"), v7);
      v52 = objc_claimAutoreleasedReturnValue();
      highlightsGroupHeadlineScoringOutputName = v9->_highlightsGroupHeadlineScoringOutputName;
      v9->_highlightsGroupHeadlineScoringOutputName = (NSString *)v52;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("articleListTagFeedGroupHeadlineScoringOutputName"), v7);
      v54 = objc_claimAutoreleasedReturnValue();
      articleListTagFeedGroupHeadlineScoringOutputName = v9->_articleListTagFeedGroupHeadlineScoringOutputName;
      v9->_articleListTagFeedGroupHeadlineScoringOutputName = (NSString *)v54;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("tagFeedHeadlineScoringOutputName"), v7);
      v56 = objc_claimAutoreleasedReturnValue();
      tagFeedHeadlineScoringOutputName = v9->_tagFeedHeadlineScoringOutputName;
      v9->_tagFeedHeadlineScoringOutputName = (NSString *)v56;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("newspaperGroupTodayFeedHeadlineScoringOutputName"), v7);
      v58 = objc_claimAutoreleasedReturnValue();
      newspaperGroupTodayFeedHeadlineScoringOutputName = v9->_newspaperGroupTodayFeedHeadlineScoringOutputName;
      v9->_newspaperGroupTodayFeedHeadlineScoringOutputName = (NSString *)v58;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("moreForYouGroupHeadlineScoringOutputName"), v7);
      v60 = objc_claimAutoreleasedReturnValue();
      moreForYouGroupHeadlineScoringOutputName = v9->_moreForYouGroupHeadlineScoringOutputName;
      v9->_moreForYouGroupHeadlineScoringOutputName = (NSString *)v60;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("introToSportsGroupForYouHeadlineScoringOutputName"), v7);
      v62 = objc_claimAutoreleasedReturnValue();
      introToSportsGroupForYouHeadlineScoringOutputName = v9->_introToSportsGroupForYouHeadlineScoringOutputName;
      v9->_introToSportsGroupForYouHeadlineScoringOutputName = (NSString *)v62;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("mySportsGroupForYouHeadlineScoringOutputName"), v7);
      v64 = objc_claimAutoreleasedReturnValue();
      mySportsGroupForYouHeadlineScoringOutputName = v9->_mySportsGroupForYouHeadlineScoringOutputName;
      v9->_mySportsGroupForYouHeadlineScoringOutputName = (NSString *)v64;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("mySportsTopicsHeadlineScoringOutputName"), v7);
      v66 = objc_claimAutoreleasedReturnValue();
      mySportsTopicsHeadlineScoringOutputName = v9->_mySportsTopicsHeadlineScoringOutputName;
      v9->_mySportsTopicsHeadlineScoringOutputName = (NSString *)v66;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("curatedGroupHeadlineScoringOutputName"), v7);
      v68 = objc_claimAutoreleasedReturnValue();
      curatedGroupHeadlineScoringOutputName = v9->_curatedGroupHeadlineScoringOutputName;
      v9->_curatedGroupHeadlineScoringOutputName = (NSString *)v68;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("curatedGroupIssuesHeadlineScoringOutputName"), v7);
      v70 = objc_claimAutoreleasedReturnValue();
      curatedGroupIssuesHeadlineScoringOutputName = v9->_curatedGroupIssuesHeadlineScoringOutputName;
      v9->_curatedGroupIssuesHeadlineScoringOutputName = (NSString *)v70;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("localSectionGroupHeadlineScoringOutputName"), v7);
      v72 = objc_claimAutoreleasedReturnValue();
      localSectionGroupHeadlineScoringOutputName = v9->_localSectionGroupHeadlineScoringOutputName;
      v9->_localSectionGroupHeadlineScoringOutputName = (NSString *)v72;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("newspaperSectionGroupHeadlineScoringOutputName"), v7);
      v74 = objc_claimAutoreleasedReturnValue();
      newspaperSectionGroupHeadlineScoringOutputName = v9->_newspaperSectionGroupHeadlineScoringOutputName;
      v9->_newspaperSectionGroupHeadlineScoringOutputName = (NSString *)v74;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("sportsEventArticlesGroupHeadlineScoringOutputName"), v7);
      v76 = objc_claimAutoreleasedReturnValue();
      sportsEventArticlesGroupHeadlineScoringOutputName = v9->_sportsEventArticlesGroupHeadlineScoringOutputName;
      v9->_sportsEventArticlesGroupHeadlineScoringOutputName = (NSString *)v76;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("tagFeedForYouGroupHeadlineScoringOutputName"), v7);
      v78 = objc_claimAutoreleasedReturnValue();
      tagFeedForYouGroupHeadlineScoringOutputName = v9->_tagFeedForYouGroupHeadlineScoringOutputName;
      v9->_tagFeedForYouGroupHeadlineScoringOutputName = (NSString *)v78;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("tagRecentStoriesGroupHeadlineScoringOutputName"), v7);
      v80 = objc_claimAutoreleasedReturnValue();
      tagRecentStoriesGroupHeadlineScoringOutputName = v9->_tagRecentStoriesGroupHeadlineScoringOutputName;
      v9->_tagRecentStoriesGroupHeadlineScoringOutputName = (NSString *)v80;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("tagDateRangeGroupHeadlineScoringOutputName"), v7);
      v82 = objc_claimAutoreleasedReturnValue();
      tagDateRangeGroupHeadlineScoringOutputName = v9->_tagDateRangeGroupHeadlineScoringOutputName;
      v9->_tagDateRangeGroupHeadlineScoringOutputName = (NSString *)v82;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("sportsEventTopicGroupHeadlineScoringOutputName"), v7);
      v84 = objc_claimAutoreleasedReturnValue();
      sportsEventTopicGroupHeadlineScoringOutputName = v9->_sportsEventTopicGroupHeadlineScoringOutputName;
      v9->_sportsEventTopicGroupHeadlineScoringOutputName = (NSString *)v84;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowDefaultHeadlineScoringOutputName"), v7);
      v86 = objc_claimAutoreleasedReturnValue();
      shadowDefaultHeadlineScoringOutputName = v9->_shadowDefaultHeadlineScoringOutputName;
      v9->_shadowDefaultHeadlineScoringOutputName = (NSString *)v86;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowMagazineFeedHeadlineScoringOutputName"), v9->_magazineFeedHeadlineScoringOutputName);
      v88 = objc_claimAutoreleasedReturnValue();
      shadowMagazineFeedHeadlineScoringOutputName = v9->_shadowMagazineFeedHeadlineScoringOutputName;
      v9->_shadowMagazineFeedHeadlineScoringOutputName = (NSString *)v88;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowMagazineFeedIssuesHeadlineScoringOutputName"), v9->_magazineFeedIssuesHeadlineScoringOutputName);
      v90 = objc_claimAutoreleasedReturnValue();
      shadowMagazineFeedIssuesHeadlineScoringOutputName = v9->_shadowMagazineFeedIssuesHeadlineScoringOutputName;
      v9->_shadowMagazineFeedIssuesHeadlineScoringOutputName = (NSString *)v90;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowLegacyAudioFeedHeadlineScoringOutputName"), v9->_legacyAudioFeedHeadlineScoringOutputName);
      v92 = objc_claimAutoreleasedReturnValue();
      shadowLegacyAudioFeedHeadlineScoringOutputName = v9->_shadowLegacyAudioFeedHeadlineScoringOutputName;
      v9->_shadowLegacyAudioFeedHeadlineScoringOutputName = (NSString *)v92;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowAudioFeedHeadlineScoringOutputName"), v9->_audioFeedHeadlineScoringOutputName);
      v94 = objc_claimAutoreleasedReturnValue();
      shadowAudioFeedHeadlineScoringOutputName = v9->_shadowAudioFeedHeadlineScoringOutputName;
      v9->_shadowAudioFeedHeadlineScoringOutputName = (NSString *)v94;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowArticleRecirculationPrimaryHeadlineScoringOutputName"), v9->_articleRecirculationPrimaryHeadlineScoringOutputName);
      v96 = objc_claimAutoreleasedReturnValue();
      shadowArticleRecirculationPrimaryHeadlineScoringOutputName = v9->_shadowArticleRecirculationPrimaryHeadlineScoringOutputName;
      v9->_shadowArticleRecirculationPrimaryHeadlineScoringOutputName = (NSString *)v96;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowArticleRecirculationSecondaryHeadlineScoringOutputName"), v9->_articleRecirculationSecondaryHeadlineScoringOutputName);
      v98 = objc_claimAutoreleasedReturnValue();
      shadowArticleRecirculationSecondaryHeadlineScoringOutputName = v9->_shadowArticleRecirculationSecondaryHeadlineScoringOutputName;
      v9->_shadowArticleRecirculationSecondaryHeadlineScoringOutputName = (NSString *)v98;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowArticleRecirculationTertiaryHeadlineScoringOutputName"), v9->_articleRecirculationTertiaryHeadlineScoringOutputName);
      v100 = objc_claimAutoreleasedReturnValue();
      shadowArticleRecirculationTertiaryHeadlineScoringOutputName = v9->_shadowArticleRecirculationTertiaryHeadlineScoringOutputName;
      v9->_shadowArticleRecirculationTertiaryHeadlineScoringOutputName = (NSString *)v100;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowArticleRecirculationQuaternaryHeadlineScoringOutputName"), v9->_articleRecirculationQuaternaryHeadlineScoringOutputName);
      v102 = objc_claimAutoreleasedReturnValue();
      shadowArticleRecirculationQuaternaryHeadlineScoringOutputName = v9->_shadowArticleRecirculationQuaternaryHeadlineScoringOutputName;
      v9->_shadowArticleRecirculationQuaternaryHeadlineScoringOutputName = (NSString *)v102;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowBestOfBundleHeadlineScoringOutputName"), v9->_bestOfBundleHeadlineScoringOutputName);
      v104 = objc_claimAutoreleasedReturnValue();
      shadowBestOfBundleHeadlineScoringOutputName = v9->_shadowBestOfBundleHeadlineScoringOutputName;
      v9->_shadowBestOfBundleHeadlineScoringOutputName = (NSString *)v104;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowForYouGroupHeadlineScoringOutputName"), v9->_forYouGroupHeadlineScoringOutputName);
      v106 = objc_claimAutoreleasedReturnValue();
      shadowForYouGroupHeadlineScoringOutputName = v9->_shadowForYouGroupHeadlineScoringOutputName;
      v9->_shadowForYouGroupHeadlineScoringOutputName = (NSString *)v106;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowGreatStoriesYouMissedGroupHeadlineScoringOutputName"), v9->_greatStoriesYouMissedGroupHeadlineScoringOutputName);
      v108 = objc_claimAutoreleasedReturnValue();
      shadowGreatStoriesYouMissedGroupHeadlineScoringOutputName = v9->_shadowGreatStoriesYouMissedGroupHeadlineScoringOutputName;
      v9->_shadowGreatStoriesYouMissedGroupHeadlineScoringOutputName = (NSString *)v108;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowLatestStoriesGroupHeadlineScoringOutputName"), v9->_latestStoriesGroupHeadlineScoringOutputName);
      v110 = objc_claimAutoreleasedReturnValue();
      shadowLatestStoriesGroupHeadlineScoringOutputName = v9->_shadowLatestStoriesGroupHeadlineScoringOutputName;
      v9->_shadowLatestStoriesGroupHeadlineScoringOutputName = (NSString *)v110;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowLocalNewsGroupHeadlineScoringOutputName"), v9->_localNewsGroupHeadlineScoringOutputName);
      v112 = objc_claimAutoreleasedReturnValue();
      shadowLocalNewsGroupHeadlineScoringOutputName = v9->_shadowLocalNewsGroupHeadlineScoringOutputName;
      v9->_shadowLocalNewsGroupHeadlineScoringOutputName = (NSString *)v112;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowNewspaperGroupMagazineFeedHeadlineScoringOutputName"), v9->_newspaperGroupMagazineFeedHeadlineScoringOutputName);
      v114 = objc_claimAutoreleasedReturnValue();
      shadowNewspaperGroupMagazineFeedHeadlineScoringOutputName = v9->_shadowNewspaperGroupMagazineFeedHeadlineScoringOutputName;
      v9->_shadowNewspaperGroupMagazineFeedHeadlineScoringOutputName = (NSString *)v114;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowTodayWidgetHeadlineScoringOutputName"), v9->_todayWidgetHeadlineScoringOutputName);
      v116 = objc_claimAutoreleasedReturnValue();
      shadowTodayWidgetHeadlineScoringOutputName = v9->_shadowTodayWidgetHeadlineScoringOutputName;
      v9->_shadowTodayWidgetHeadlineScoringOutputName = (NSString *)v116;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowTagWidgetHeadlineScoringOutputName"), v9->_tagWidgetHeadlineScoringOutputName);
      v118 = objc_claimAutoreleasedReturnValue();
      shadowTagWidgetHeadlineScoringOutputName = v9->_shadowTagWidgetHeadlineScoringOutputName;
      v9->_shadowTagWidgetHeadlineScoringOutputName = (NSString *)v118;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowNotificationHeadlineScoringOutputName"), v9->_notificationHeadlineScoringOutputName);
      v120 = objc_claimAutoreleasedReturnValue();
      shadowNotificationHeadlineScoringOutputName = v9->_shadowNotificationHeadlineScoringOutputName;
      v9->_shadowNotificationHeadlineScoringOutputName = (NSString *)v120;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowMySportsGroupHeadlineScoringOutputName"), v9->_mySportsGroupHeadlineScoringOutputName);
      v122 = objc_claimAutoreleasedReturnValue();
      shadowMySportsGroupHeadlineScoringOutputName = v9->_shadowMySportsGroupHeadlineScoringOutputName;
      v9->_shadowMySportsGroupHeadlineScoringOutputName = (NSString *)v122;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowSportsTopStoriesHeadlineScoringOutputName"), v9->_sportsTopStoriesHeadlineScoringOutputName);
      v124 = objc_claimAutoreleasedReturnValue();
      shadowSportsTopStoriesHeadlineScoringOutputName = v9->_shadowSportsTopStoriesHeadlineScoringOutputName;
      v9->_shadowSportsTopStoriesHeadlineScoringOutputName = (NSString *)v124;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowIntroToSportsGroupHeadlineScoringOutputName"), v9->_introToSportsGroupHeadlineScoringOutputName);
      v126 = objc_claimAutoreleasedReturnValue();
      shadowIntroToSportsGroupHeadlineScoringOutputName = v9->_shadowIntroToSportsGroupHeadlineScoringOutputName;
      v9->_shadowIntroToSportsGroupHeadlineScoringOutputName = (NSString *)v126;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowHighlightsGroupHeadlineScoringOutputName"), v9->_highlightsGroupHeadlineScoringOutputName);
      v128 = objc_claimAutoreleasedReturnValue();
      shadowHighlightsGroupHeadlineScoringOutputName = v9->_shadowHighlightsGroupHeadlineScoringOutputName;
      v9->_shadowHighlightsGroupHeadlineScoringOutputName = (NSString *)v128;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowArticleListTagFeedGroupHeadlineScoringOutputName"), v9->_articleListTagFeedGroupHeadlineScoringOutputName);
      v130 = objc_claimAutoreleasedReturnValue();
      shadowArticleListTagFeedGroupHeadlineScoringOutputName = v9->_shadowArticleListTagFeedGroupHeadlineScoringOutputName;
      v9->_shadowArticleListTagFeedGroupHeadlineScoringOutputName = (NSString *)v130;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowTagFeedHeadlineScoringOutputName"), v9->_tagFeedHeadlineScoringOutputName);
      v132 = objc_claimAutoreleasedReturnValue();
      shadowTagFeedHeadlineScoringOutputName = v9->_shadowTagFeedHeadlineScoringOutputName;
      v9->_shadowTagFeedHeadlineScoringOutputName = (NSString *)v132;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowNewspaperGroupTodayFeedHeadlineScoringOutputName"), v9->_newspaperGroupTodayFeedHeadlineScoringOutputName);
      v134 = objc_claimAutoreleasedReturnValue();
      shadowNewspaperGroupTodayFeedHeadlineScoringOutputName = v9->_shadowNewspaperGroupTodayFeedHeadlineScoringOutputName;
      v9->_shadowNewspaperGroupTodayFeedHeadlineScoringOutputName = (NSString *)v134;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowMoreForYouGroupHeadlineScoringOutputName"), v9->_moreForYouGroupHeadlineScoringOutputName);
      v136 = objc_claimAutoreleasedReturnValue();
      shadowMoreForYouGroupHeadlineScoringOutputName = v9->_shadowMoreForYouGroupHeadlineScoringOutputName;
      v9->_shadowMoreForYouGroupHeadlineScoringOutputName = (NSString *)v136;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowIntroToSportsGroupForYouHeadlineScoringOutputName"), v9->_introToSportsGroupForYouHeadlineScoringOutputName);
      v138 = objc_claimAutoreleasedReturnValue();
      shadowIntroToSportsGroupForYouHeadlineScoringOutputName = v9->_shadowIntroToSportsGroupForYouHeadlineScoringOutputName;
      v9->_shadowIntroToSportsGroupForYouHeadlineScoringOutputName = (NSString *)v138;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowMySportsGroupForYouHeadlineScoringOutputName"), v9->_mySportsGroupForYouHeadlineScoringOutputName);
      v140 = objc_claimAutoreleasedReturnValue();
      shadowMySportsGroupForYouHeadlineScoringOutputName = v9->_shadowMySportsGroupForYouHeadlineScoringOutputName;
      v9->_shadowMySportsGroupForYouHeadlineScoringOutputName = (NSString *)v140;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowMySportsTopicsHeadlineScoringOutputName"), v9->_mySportsTopicsHeadlineScoringOutputName);
      v142 = objc_claimAutoreleasedReturnValue();
      shadowMySportsTopicsHeadlineScoringOutputName = v9->_shadowMySportsTopicsHeadlineScoringOutputName;
      v9->_shadowMySportsTopicsHeadlineScoringOutputName = (NSString *)v142;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowCuratedGroupHeadlineScoringOutputName"), v9->_curatedGroupHeadlineScoringOutputName);
      v144 = objc_claimAutoreleasedReturnValue();
      shadowCuratedGroupHeadlineScoringOutputName = v9->_shadowCuratedGroupHeadlineScoringOutputName;
      v9->_shadowCuratedGroupHeadlineScoringOutputName = (NSString *)v144;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowCuratedGroupIssuesHeadlineScoringOutputName"), v9->_curatedGroupIssuesHeadlineScoringOutputName);
      v146 = objc_claimAutoreleasedReturnValue();
      shadowCuratedGroupIssuesHeadlineScoringOutputName = v9->_shadowCuratedGroupIssuesHeadlineScoringOutputName;
      v9->_shadowCuratedGroupIssuesHeadlineScoringOutputName = (NSString *)v146;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowLocalSectionGroupHeadlineScoringOutputName"), v9->_localSectionGroupHeadlineScoringOutputName);
      v148 = objc_claimAutoreleasedReturnValue();
      shadowLocalSectionGroupHeadlineScoringOutputName = v9->_shadowLocalSectionGroupHeadlineScoringOutputName;
      v9->_shadowLocalSectionGroupHeadlineScoringOutputName = (NSString *)v148;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowNewspaperSectionGroupHeadlineScoringOutputName"), v9->_newspaperSectionGroupHeadlineScoringOutputName);
      v150 = objc_claimAutoreleasedReturnValue();
      shadowNewspaperSectionGroupHeadlineScoringOutputName = v9->_shadowNewspaperSectionGroupHeadlineScoringOutputName;
      v9->_shadowNewspaperSectionGroupHeadlineScoringOutputName = (NSString *)v150;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowSportsEventArticlesGroupHeadlineScoringOutputName"), v9->_sportsEventArticlesGroupHeadlineScoringOutputName);
      v152 = objc_claimAutoreleasedReturnValue();
      shadowSportsEventArticlesGroupHeadlineScoringOutputName = v9->_shadowSportsEventArticlesGroupHeadlineScoringOutputName;
      v9->_shadowSportsEventArticlesGroupHeadlineScoringOutputName = (NSString *)v152;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowTagFeedForYouGroupHeadlineScoringOutputName"), v9->_tagFeedForYouGroupHeadlineScoringOutputName);
      v154 = objc_claimAutoreleasedReturnValue();
      shadowTagFeedForYouGroupHeadlineScoringOutputName = v9->_shadowTagFeedForYouGroupHeadlineScoringOutputName;
      v9->_shadowTagFeedForYouGroupHeadlineScoringOutputName = (NSString *)v154;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowTagRecentStoriesGroupHeadlineScoringOutputName"), v9->_tagRecentStoriesGroupHeadlineScoringOutputName);
      v156 = objc_claimAutoreleasedReturnValue();
      shadowTagRecentStoriesGroupHeadlineScoringOutputName = v9->_shadowTagRecentStoriesGroupHeadlineScoringOutputName;
      v9->_shadowTagRecentStoriesGroupHeadlineScoringOutputName = (NSString *)v156;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowTagDateRangeGroupHeadlineScoringOutputName"), v9->_tagDateRangeGroupHeadlineScoringOutputName);
      v158 = objc_claimAutoreleasedReturnValue();
      shadowTagDateRangeGroupHeadlineScoringOutputName = v9->_shadowTagDateRangeGroupHeadlineScoringOutputName;
      v9->_shadowTagDateRangeGroupHeadlineScoringOutputName = (NSString *)v158;

      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("shadowSportsEventTopicGroupHeadlineScoringOutputName"), v9->_sportsEventTopicGroupHeadlineScoringOutputName);
      v160 = objc_claimAutoreleasedReturnValue();
      shadowSportsEventTopicGroupHeadlineScoringOutputName = v9->_shadowSportsEventTopicGroupHeadlineScoringOutputName;
      v9->_shadowSportsEventTopicGroupHeadlineScoringOutputName = (NSString *)v160;

    }
    self = v9;

    v162 = self;
  }
  else
  {
    v165[0] = MEMORY[0x1E0C809B0];
    v165[1] = 3221225472;
    v165[2] = __71__FCNewsTabiFeedPersonalizationOutputConfiguration_initWithDictionary___block_invoke;
    v165[3] = &unk_1E463B350;
    v166 = v4;
    __71__FCNewsTabiFeedPersonalizationOutputConfiguration_initWithDictionary___block_invoke((uint64_t)v165);
    v162 = (FCNewsTabiFeedPersonalizationOutputConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v162;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowSportsEventTopicGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowTagDateRangeGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowTagRecentStoriesGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowTagFeedForYouGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowSportsEventArticlesGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperSectionGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowLocalSectionGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowCuratedGroupIssuesHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowCuratedGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowMySportsTopicsHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowMySportsGroupForYouHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupForYouHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowMoreForYouGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperGroupTodayFeedHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowTagFeedHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowArticleListTagFeedGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowHighlightsGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowSportsTopStoriesHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowMySportsGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowNotificationHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowTagWidgetHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowTodayWidgetHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowNewspaperGroupMagazineFeedHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowLocalNewsGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowLatestStoriesGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowGreatStoriesYouMissedGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowForYouGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowBestOfBundleHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationQuaternaryHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationTertiaryHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationSecondaryHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowArticleRecirculationPrimaryHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowAudioFeedHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowLegacyAudioFeedHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowMagazineFeedIssuesHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowMagazineFeedHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowTopicFeedHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_shadowDefaultHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_sportsEventTopicGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_tagDateRangeGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_tagRecentStoriesGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_tagFeedForYouGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_sportsEventArticlesGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_newspaperSectionGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_localSectionGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_curatedGroupIssuesHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_curatedGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_mySportsTopicsHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_mySportsGroupForYouHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_introToSportsGroupForYouHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_moreForYouGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_newspaperGroupTodayFeedHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_tagFeedHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_articleListTagFeedGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_highlightsGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_introToSportsGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_sportsTopStoriesHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_mySportsGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_notificationHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_tagWidgetHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_todayWidgetHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_newspaperGroupMagazineFeedHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_localNewsGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_latestStoriesGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_greatStoriesYouMissedGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_forYouGroupHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_bestOfBundleHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_articleRecirculationQuaternaryHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_articleRecirculationTertiaryHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_articleRecirculationSecondaryHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_articleRecirculationPrimaryHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_audioFeedHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_legacyAudioFeedHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_magazineFeedIssuesHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_magazineFeedHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_topicFeedHeadlineScoringOutputName, 0);
  objc_storeStrong((id *)&self->_defaultHeadlineScoringOutputName, 0);
}

- (FCNewsTabiFeedPersonalizationOutputConfiguration)init
{
  return -[FCNewsTabiFeedPersonalizationOutputConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

uint64_t __71__FCNewsTabiFeedPersonalizationOutputConfiguration_initWithDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiFeedPersonalizationOutputConfiguration due to failure to decode defaultHeadlineScoringOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (id)description
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsTabiFeedPersonalizationOutputConfiguration defaultHeadlineScoringOutputName](self, "defaultHeadlineScoringOutputName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tdefaultHeadlineScoringOutputName: %@;"), v4);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration topicFeedHeadlineScoringOutputName](self, "topicFeedHeadlineScoringOutputName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttopicFeedHeadlineScoringOutputName: %@;"), v5);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration magazineFeedHeadlineScoringOutputName](self, "magazineFeedHeadlineScoringOutputName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmagazineFeedHeadlineScoringOutputName: %@;"), v6);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration magazineFeedIssuesHeadlineScoringOutputName](self, "magazineFeedIssuesHeadlineScoringOutputName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmagazineFeedIssuesHeadlineScoringOutputName: %@;"), v7);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration legacyAudioFeedHeadlineScoringOutputName](self, "legacyAudioFeedHeadlineScoringOutputName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tlegacyAudioFeedHeadlineScoringOutputName: %@;"), v8);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration audioFeedHeadlineScoringOutputName](self, "audioFeedHeadlineScoringOutputName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\taudioFeedHeadlineScoringOutputName: %@;"), v9);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration articleRecirculationPrimaryHeadlineScoringOutputName](self, "articleRecirculationPrimaryHeadlineScoringOutputName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleRecirculationPrimaryHeadlineScoringOutputName: %@;"), v10);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration articleRecirculationSecondaryHeadlineScoringOutputName](self, "articleRecirculationSecondaryHeadlineScoringOutputName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleRecirculationSecondaryHeadlineScoringOutputName: %@;"), v11);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration articleRecirculationTertiaryHeadlineScoringOutputName](self, "articleRecirculationTertiaryHeadlineScoringOutputName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleRecirculationTertiaryHeadlineScoringOutputName: %@;"), v12);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration articleRecirculationQuaternaryHeadlineScoringOutputName](self, "articleRecirculationQuaternaryHeadlineScoringOutputName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleRecirculationQuaternaryHeadlineScoringOutputName: %@;"), v13);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration bestOfBundleHeadlineScoringOutputName](self, "bestOfBundleHeadlineScoringOutputName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tbestOfBundleHeadlineScoringOutputName: %@;"), v14);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration forYouGroupHeadlineScoringOutputName](self, "forYouGroupHeadlineScoringOutputName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tforYouGroupHeadlineScoringOutputName: %@;"), v15);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration greatStoriesYouMissedGroupHeadlineScoringOutputName](self, "greatStoriesYouMissedGroupHeadlineScoringOutputName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tgreatStoriesYouMissedGroupHeadlineScoringOutputName: %@;"), v16);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration latestStoriesGroupHeadlineScoringOutputName](self, "latestStoriesGroupHeadlineScoringOutputName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tlatestStoriesGroupHeadlineScoringOutputName: %@;"), v17);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration localNewsGroupHeadlineScoringOutputName](self, "localNewsGroupHeadlineScoringOutputName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tlocalNewsGroupHeadlineScoringOutputName: %@;"), v18);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration newspaperGroupMagazineFeedHeadlineScoringOutputName](self, "newspaperGroupMagazineFeedHeadlineScoringOutputName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tnewspaperGroupMagazineFeedHeadlineScoringOutputName: %@;"), v19);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration todayWidgetHeadlineScoringOutputName](self, "todayWidgetHeadlineScoringOutputName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttodayWidgetHeadlineScoringOutputName: %@;"), v20);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration tagWidgetHeadlineScoringOutputName](self, "tagWidgetHeadlineScoringOutputName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttagWidgetHeadlineScoringOutputName: %@;"), v21);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration notificationHeadlineScoringOutputName](self, "notificationHeadlineScoringOutputName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tnotificationHeadlineScoringOutputName: %@;"), v22);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration mySportsGroupHeadlineScoringOutputName](self, "mySportsGroupHeadlineScoringOutputName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmySportsGroupHeadlineScoringOutputName: %@;"), v23);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration sportsTopStoriesHeadlineScoringOutputName](self, "sportsTopStoriesHeadlineScoringOutputName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tsportsTopStoriesHeadlineScoringOutputName: %@;"), v24);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration introToSportsGroupHeadlineScoringOutputName](self, "introToSportsGroupHeadlineScoringOutputName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tintroToSportsGroupHeadlineScoringOutputName: %@;"), v25);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration highlightsGroupHeadlineScoringOutputName](self, "highlightsGroupHeadlineScoringOutputName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\thighlightsGroupHeadlineScoringOutputName: %@;"), v26);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration articleListTagFeedGroupHeadlineScoringOutputName](self, "articleListTagFeedGroupHeadlineScoringOutputName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleListTagFeedGroupHeadlineScoringOutputName: %@;"), v27);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration tagFeedHeadlineScoringOutputName](self, "tagFeedHeadlineScoringOutputName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttagFeedHeadlineScoringOutputName: %@;"), v28);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration newspaperGroupTodayFeedHeadlineScoringOutputName](self, "newspaperGroupTodayFeedHeadlineScoringOutputName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tnewspaperGroupTodayFeedHeadlineScoringOutputName: %@;"), v29);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration moreForYouGroupHeadlineScoringOutputName](self, "moreForYouGroupHeadlineScoringOutputName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmoreForYouGroupHeadlineScoringOutputName: %@;"), v30);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration introToSportsGroupForYouHeadlineScoringOutputName](self, "introToSportsGroupForYouHeadlineScoringOutputName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tintroToSportsGroupForYouHeadlineScoringOutputName: %@;"), v31);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration mySportsGroupForYouHeadlineScoringOutputName](self, "mySportsGroupForYouHeadlineScoringOutputName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmySportsGroupForYouHeadlineScoringOutputName: %@;"), v32);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration mySportsTopicsHeadlineScoringOutputName](self, "mySportsTopicsHeadlineScoringOutputName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmySportsTopicsHeadlineScoringOutputName: %@;"), v33);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration curatedGroupHeadlineScoringOutputName](self, "curatedGroupHeadlineScoringOutputName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tcuratedGroupHeadlineScoringOutputName: %@;"), v34);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration curatedGroupIssuesHeadlineScoringOutputName](self, "curatedGroupIssuesHeadlineScoringOutputName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tcuratedGroupIssuesHeadlineScoringOutputName: %@;"), v35);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration localSectionGroupHeadlineScoringOutputName](self, "localSectionGroupHeadlineScoringOutputName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tlocalSectionGroupHeadlineScoringOutputName: %@;"), v36);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration newspaperSectionGroupHeadlineScoringOutputName](self, "newspaperSectionGroupHeadlineScoringOutputName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tnewspaperSectionGroupHeadlineScoringOutputName: %@;"), v37);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration sportsEventArticlesGroupHeadlineScoringOutputName](self, "sportsEventArticlesGroupHeadlineScoringOutputName");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tsportsEventArticlesGroupHeadlineScoringOutputName: %@;"), v38);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration tagFeedForYouGroupHeadlineScoringOutputName](self, "tagFeedForYouGroupHeadlineScoringOutputName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttagFeedForYouGroupHeadlineScoringOutputName: %@;"), v39);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration tagRecentStoriesGroupHeadlineScoringOutputName](self, "tagRecentStoriesGroupHeadlineScoringOutputName");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttagRecentStoriesGroupHeadlineScoringOutputName: %@;"), v40);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration tagDateRangeGroupHeadlineScoringOutputName](self, "tagDateRangeGroupHeadlineScoringOutputName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttagDateRangeGroupHeadlineScoringOutputName: %@;"), v41);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration sportsEventTopicGroupHeadlineScoringOutputName](self, "sportsEventTopicGroupHeadlineScoringOutputName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tsportsEventTopicGroupHeadlineScoringOutputName: %@;"), v42);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowDefaultHeadlineScoringOutputName](self, "shadowDefaultHeadlineScoringOutputName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowDefaultHeadlineScoringOutputName: %@;"), v43);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowTopicFeedHeadlineScoringOutputName](self, "shadowTopicFeedHeadlineScoringOutputName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowTopicFeedHeadlineScoringOutputName: %@;"), v44);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowMagazineFeedHeadlineScoringOutputName](self, "shadowMagazineFeedHeadlineScoringOutputName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowMagazineFeedHeadlineScoringOutputName: %@;"), v45);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowMagazineFeedIssuesHeadlineScoringOutputName](self, "shadowMagazineFeedIssuesHeadlineScoringOutputName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowMagazineFeedIssuesHeadlineScoringOutputName: %@;"), v46);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowLegacyAudioFeedHeadlineScoringOutputName](self, "shadowLegacyAudioFeedHeadlineScoringOutputName");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowLegacyAudioFeedHeadlineScoringOutputName: %@;"), v47);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowAudioFeedHeadlineScoringOutputName](self, "shadowAudioFeedHeadlineScoringOutputName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowAudioFeedHeadlineScoringOutputName: %@;"), v48);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowArticleRecirculationPrimaryHeadlineScoringOutputName](self, "shadowArticleRecirculationPrimaryHeadlineScoringOutputName");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowArticleRecirculationPrimaryHeadlineScoringOutputName: %@;"), v49);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowArticleRecirculationSecondaryHeadlineScoringOutputName](self, "shadowArticleRecirculationSecondaryHeadlineScoringOutputName");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowArticleRecirculationSecondaryHeadlineScoringOutputName: %@;"), v50);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowArticleRecirculationTertiaryHeadlineScoringOutputName](self, "shadowArticleRecirculationTertiaryHeadlineScoringOutputName");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowArticleRecirculationTertiaryHeadlineScoringOutputName: %@;"), v51);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowArticleRecirculationQuaternaryHeadlineScoringOutputName](self, "shadowArticleRecirculationQuaternaryHeadlineScoringOutputName");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowArticleRecirculationQuaternaryHeadlineScoringOutputName: %@;"),
    v52);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowBestOfBundleHeadlineScoringOutputName](self, "shadowBestOfBundleHeadlineScoringOutputName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowBestOfBundleHeadlineScoringOutputName: %@;"), v53);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowForYouGroupHeadlineScoringOutputName](self, "shadowForYouGroupHeadlineScoringOutputName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowForYouGroupHeadlineScoringOutputName: %@;"), v54);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowGreatStoriesYouMissedGroupHeadlineScoringOutputName](self, "shadowGreatStoriesYouMissedGroupHeadlineScoringOutputName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowGreatStoriesYouMissedGroupHeadlineScoringOutputName: %@;"), v55);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowLatestStoriesGroupHeadlineScoringOutputName](self, "shadowLatestStoriesGroupHeadlineScoringOutputName");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowLatestStoriesGroupHeadlineScoringOutputName: %@;"), v56);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowLocalNewsGroupHeadlineScoringOutputName](self, "shadowLocalNewsGroupHeadlineScoringOutputName");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowLocalNewsGroupHeadlineScoringOutputName: %@;"), v57);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowNewspaperGroupMagazineFeedHeadlineScoringOutputName](self, "shadowNewspaperGroupMagazineFeedHeadlineScoringOutputName");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowNewspaperGroupMagazineFeedHeadlineScoringOutputName: %@;"), v58);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowTodayWidgetHeadlineScoringOutputName](self, "shadowTodayWidgetHeadlineScoringOutputName");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowTodayWidgetHeadlineScoringOutputName: %@;"), v59);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowTagWidgetHeadlineScoringOutputName](self, "shadowTagWidgetHeadlineScoringOutputName");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowTagWidgetHeadlineScoringOutputName: %@;"), v60);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowNotificationHeadlineScoringOutputName](self, "shadowNotificationHeadlineScoringOutputName");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowNotificationHeadlineScoringOutputName: %@;"), v61);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowMySportsGroupHeadlineScoringOutputName](self, "shadowMySportsGroupHeadlineScoringOutputName");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowMySportsGroupHeadlineScoringOutputName: %@;"), v62);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowSportsTopStoriesHeadlineScoringOutputName](self, "shadowSportsTopStoriesHeadlineScoringOutputName");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowSportsTopStoriesHeadlineScoringOutputName: %@;"), v63);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowIntroToSportsGroupHeadlineScoringOutputName](self, "shadowIntroToSportsGroupHeadlineScoringOutputName");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowIntroToSportsGroupHeadlineScoringOutputName: %@;"), v64);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowHighlightsGroupHeadlineScoringOutputName](self, "shadowHighlightsGroupHeadlineScoringOutputName");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowHighlightsGroupHeadlineScoringOutputName: %@;"), v65);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowArticleListTagFeedGroupHeadlineScoringOutputName](self, "shadowArticleListTagFeedGroupHeadlineScoringOutputName");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowArticleListTagFeedGroupHeadlineScoringOutputName: %@;"), v66);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowTagFeedHeadlineScoringOutputName](self, "shadowTagFeedHeadlineScoringOutputName");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowTagFeedHeadlineScoringOutputName: %@;"), v67);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowNewspaperGroupTodayFeedHeadlineScoringOutputName](self, "shadowNewspaperGroupTodayFeedHeadlineScoringOutputName");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowNewspaperGroupTodayFeedHeadlineScoringOutputName: %@;"), v68);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowMoreForYouGroupHeadlineScoringOutputName](self, "shadowMoreForYouGroupHeadlineScoringOutputName");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowMoreForYouGroupHeadlineScoringOutputName: %@;"), v69);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowIntroToSportsGroupForYouHeadlineScoringOutputName](self, "shadowIntroToSportsGroupForYouHeadlineScoringOutputName");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowIntroToSportsGroupForYouHeadlineScoringOutputName: %@;"), v70);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowMySportsGroupForYouHeadlineScoringOutputName](self, "shadowMySportsGroupForYouHeadlineScoringOutputName");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowMySportsGroupForYouHeadlineScoringOutputName: %@;"), v71);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowMySportsTopicsHeadlineScoringOutputName](self, "shadowMySportsTopicsHeadlineScoringOutputName");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowMySportsTopicsHeadlineScoringOutputName: %@;"), v72);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowCuratedGroupHeadlineScoringOutputName](self, "shadowCuratedGroupHeadlineScoringOutputName");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowCuratedGroupHeadlineScoringOutputName: %@;"), v73);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowCuratedGroupIssuesHeadlineScoringOutputName](self, "shadowCuratedGroupIssuesHeadlineScoringOutputName");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowCuratedGroupIssuesHeadlineScoringOutputName: %@;"), v74);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowLocalSectionGroupHeadlineScoringOutputName](self, "shadowLocalSectionGroupHeadlineScoringOutputName");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowLocalSectionGroupHeadlineScoringOutputName: %@;"), v75);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowNewspaperSectionGroupHeadlineScoringOutputName](self, "shadowNewspaperSectionGroupHeadlineScoringOutputName");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowNewspaperSectionGroupHeadlineScoringOutputName: %@;"), v76);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowSportsEventArticlesGroupHeadlineScoringOutputName](self, "shadowSportsEventArticlesGroupHeadlineScoringOutputName");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowSportsEventArticlesGroupHeadlineScoringOutputName: %@;"), v77);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowTagFeedForYouGroupHeadlineScoringOutputName](self, "shadowTagFeedForYouGroupHeadlineScoringOutputName");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowTagFeedForYouGroupHeadlineScoringOutputName: %@;"), v78);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowTagRecentStoriesGroupHeadlineScoringOutputName](self, "shadowTagRecentStoriesGroupHeadlineScoringOutputName");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowTagRecentStoriesGroupHeadlineScoringOutputName: %@;"), v79);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowTagDateRangeGroupHeadlineScoringOutputName](self, "shadowTagDateRangeGroupHeadlineScoringOutputName");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowTagDateRangeGroupHeadlineScoringOutputName: %@;"), v80);

  -[FCNewsTabiFeedPersonalizationOutputConfiguration shadowSportsEventTopicGroupHeadlineScoringOutputName](self, "shadowSportsEventTopicGroupHeadlineScoringOutputName");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tshadowSportsEventTopicGroupHeadlineScoringOutputName: %@;"), v81);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (NSString)defaultHeadlineScoringOutputName
{
  return self->_defaultHeadlineScoringOutputName;
}

- (void)setDefaultHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_defaultHeadlineScoringOutputName, a3);
}

- (NSString)topicFeedHeadlineScoringOutputName
{
  return self->_topicFeedHeadlineScoringOutputName;
}

- (void)setTopicFeedHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_topicFeedHeadlineScoringOutputName, a3);
}

- (NSString)magazineFeedHeadlineScoringOutputName
{
  return self->_magazineFeedHeadlineScoringOutputName;
}

- (void)setMagazineFeedHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_magazineFeedHeadlineScoringOutputName, a3);
}

- (NSString)magazineFeedIssuesHeadlineScoringOutputName
{
  return self->_magazineFeedIssuesHeadlineScoringOutputName;
}

- (void)setMagazineFeedIssuesHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_magazineFeedIssuesHeadlineScoringOutputName, a3);
}

- (NSString)legacyAudioFeedHeadlineScoringOutputName
{
  return self->_legacyAudioFeedHeadlineScoringOutputName;
}

- (void)setLegacyAudioFeedHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_legacyAudioFeedHeadlineScoringOutputName, a3);
}

- (NSString)audioFeedHeadlineScoringOutputName
{
  return self->_audioFeedHeadlineScoringOutputName;
}

- (void)setAudioFeedHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_audioFeedHeadlineScoringOutputName, a3);
}

- (NSString)articleRecirculationPrimaryHeadlineScoringOutputName
{
  return self->_articleRecirculationPrimaryHeadlineScoringOutputName;
}

- (void)setArticleRecirculationPrimaryHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_articleRecirculationPrimaryHeadlineScoringOutputName, a3);
}

- (NSString)articleRecirculationSecondaryHeadlineScoringOutputName
{
  return self->_articleRecirculationSecondaryHeadlineScoringOutputName;
}

- (void)setArticleRecirculationSecondaryHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_articleRecirculationSecondaryHeadlineScoringOutputName, a3);
}

- (NSString)articleRecirculationTertiaryHeadlineScoringOutputName
{
  return self->_articleRecirculationTertiaryHeadlineScoringOutputName;
}

- (void)setArticleRecirculationTertiaryHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_articleRecirculationTertiaryHeadlineScoringOutputName, a3);
}

- (NSString)articleRecirculationQuaternaryHeadlineScoringOutputName
{
  return self->_articleRecirculationQuaternaryHeadlineScoringOutputName;
}

- (void)setArticleRecirculationQuaternaryHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_articleRecirculationQuaternaryHeadlineScoringOutputName, a3);
}

- (NSString)bestOfBundleHeadlineScoringOutputName
{
  return self->_bestOfBundleHeadlineScoringOutputName;
}

- (void)setBestOfBundleHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_bestOfBundleHeadlineScoringOutputName, a3);
}

- (NSString)forYouGroupHeadlineScoringOutputName
{
  return self->_forYouGroupHeadlineScoringOutputName;
}

- (void)setForYouGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_forYouGroupHeadlineScoringOutputName, a3);
}

- (NSString)greatStoriesYouMissedGroupHeadlineScoringOutputName
{
  return self->_greatStoriesYouMissedGroupHeadlineScoringOutputName;
}

- (void)setGreatStoriesYouMissedGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_greatStoriesYouMissedGroupHeadlineScoringOutputName, a3);
}

- (NSString)latestStoriesGroupHeadlineScoringOutputName
{
  return self->_latestStoriesGroupHeadlineScoringOutputName;
}

- (void)setLatestStoriesGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_latestStoriesGroupHeadlineScoringOutputName, a3);
}

- (NSString)localNewsGroupHeadlineScoringOutputName
{
  return self->_localNewsGroupHeadlineScoringOutputName;
}

- (void)setLocalNewsGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_localNewsGroupHeadlineScoringOutputName, a3);
}

- (NSString)newspaperGroupMagazineFeedHeadlineScoringOutputName
{
  return self->_newspaperGroupMagazineFeedHeadlineScoringOutputName;
}

- (void)setNewspaperGroupMagazineFeedHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_newspaperGroupMagazineFeedHeadlineScoringOutputName, a3);
}

- (NSString)todayWidgetHeadlineScoringOutputName
{
  return self->_todayWidgetHeadlineScoringOutputName;
}

- (void)setTodayWidgetHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_todayWidgetHeadlineScoringOutputName, a3);
}

- (NSString)tagWidgetHeadlineScoringOutputName
{
  return self->_tagWidgetHeadlineScoringOutputName;
}

- (void)setTagWidgetHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_tagWidgetHeadlineScoringOutputName, a3);
}

- (NSString)notificationHeadlineScoringOutputName
{
  return self->_notificationHeadlineScoringOutputName;
}

- (void)setNotificationHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHeadlineScoringOutputName, a3);
}

- (NSString)mySportsGroupHeadlineScoringOutputName
{
  return self->_mySportsGroupHeadlineScoringOutputName;
}

- (void)setMySportsGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_mySportsGroupHeadlineScoringOutputName, a3);
}

- (NSString)sportsTopStoriesHeadlineScoringOutputName
{
  return self->_sportsTopStoriesHeadlineScoringOutputName;
}

- (void)setSportsTopStoriesHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_sportsTopStoriesHeadlineScoringOutputName, a3);
}

- (NSString)introToSportsGroupHeadlineScoringOutputName
{
  return self->_introToSportsGroupHeadlineScoringOutputName;
}

- (void)setIntroToSportsGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_introToSportsGroupHeadlineScoringOutputName, a3);
}

- (NSString)highlightsGroupHeadlineScoringOutputName
{
  return self->_highlightsGroupHeadlineScoringOutputName;
}

- (void)setHighlightsGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_highlightsGroupHeadlineScoringOutputName, a3);
}

- (NSString)articleListTagFeedGroupHeadlineScoringOutputName
{
  return self->_articleListTagFeedGroupHeadlineScoringOutputName;
}

- (void)setArticleListTagFeedGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_articleListTagFeedGroupHeadlineScoringOutputName, a3);
}

- (NSString)tagFeedHeadlineScoringOutputName
{
  return self->_tagFeedHeadlineScoringOutputName;
}

- (void)setTagFeedHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_tagFeedHeadlineScoringOutputName, a3);
}

- (NSString)newspaperGroupTodayFeedHeadlineScoringOutputName
{
  return self->_newspaperGroupTodayFeedHeadlineScoringOutputName;
}

- (void)setNewspaperGroupTodayFeedHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_newspaperGroupTodayFeedHeadlineScoringOutputName, a3);
}

- (NSString)moreForYouGroupHeadlineScoringOutputName
{
  return self->_moreForYouGroupHeadlineScoringOutputName;
}

- (void)setMoreForYouGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_moreForYouGroupHeadlineScoringOutputName, a3);
}

- (NSString)introToSportsGroupForYouHeadlineScoringOutputName
{
  return self->_introToSportsGroupForYouHeadlineScoringOutputName;
}

- (void)setIntroToSportsGroupForYouHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_introToSportsGroupForYouHeadlineScoringOutputName, a3);
}

- (NSString)mySportsGroupForYouHeadlineScoringOutputName
{
  return self->_mySportsGroupForYouHeadlineScoringOutputName;
}

- (void)setMySportsGroupForYouHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_mySportsGroupForYouHeadlineScoringOutputName, a3);
}

- (NSString)mySportsTopicsHeadlineScoringOutputName
{
  return self->_mySportsTopicsHeadlineScoringOutputName;
}

- (void)setMySportsTopicsHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_mySportsTopicsHeadlineScoringOutputName, a3);
}

- (NSString)curatedGroupHeadlineScoringOutputName
{
  return self->_curatedGroupHeadlineScoringOutputName;
}

- (void)setCuratedGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_curatedGroupHeadlineScoringOutputName, a3);
}

- (NSString)curatedGroupIssuesHeadlineScoringOutputName
{
  return self->_curatedGroupIssuesHeadlineScoringOutputName;
}

- (void)setCuratedGroupIssuesHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_curatedGroupIssuesHeadlineScoringOutputName, a3);
}

- (NSString)localSectionGroupHeadlineScoringOutputName
{
  return self->_localSectionGroupHeadlineScoringOutputName;
}

- (void)setLocalSectionGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_localSectionGroupHeadlineScoringOutputName, a3);
}

- (NSString)newspaperSectionGroupHeadlineScoringOutputName
{
  return self->_newspaperSectionGroupHeadlineScoringOutputName;
}

- (void)setNewspaperSectionGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_newspaperSectionGroupHeadlineScoringOutputName, a3);
}

- (NSString)sportsEventArticlesGroupHeadlineScoringOutputName
{
  return self->_sportsEventArticlesGroupHeadlineScoringOutputName;
}

- (void)setSportsEventArticlesGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_sportsEventArticlesGroupHeadlineScoringOutputName, a3);
}

- (NSString)tagFeedForYouGroupHeadlineScoringOutputName
{
  return self->_tagFeedForYouGroupHeadlineScoringOutputName;
}

- (void)setTagFeedForYouGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_tagFeedForYouGroupHeadlineScoringOutputName, a3);
}

- (NSString)tagRecentStoriesGroupHeadlineScoringOutputName
{
  return self->_tagRecentStoriesGroupHeadlineScoringOutputName;
}

- (void)setTagRecentStoriesGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_tagRecentStoriesGroupHeadlineScoringOutputName, a3);
}

- (NSString)tagDateRangeGroupHeadlineScoringOutputName
{
  return self->_tagDateRangeGroupHeadlineScoringOutputName;
}

- (void)setTagDateRangeGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_tagDateRangeGroupHeadlineScoringOutputName, a3);
}

- (NSString)sportsEventTopicGroupHeadlineScoringOutputName
{
  return self->_sportsEventTopicGroupHeadlineScoringOutputName;
}

- (void)setSportsEventTopicGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_sportsEventTopicGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowDefaultHeadlineScoringOutputName
{
  return self->_shadowDefaultHeadlineScoringOutputName;
}

- (void)setShadowDefaultHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowDefaultHeadlineScoringOutputName, a3);
}

- (NSString)shadowTopicFeedHeadlineScoringOutputName
{
  return self->_shadowTopicFeedHeadlineScoringOutputName;
}

- (void)setShadowTopicFeedHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowTopicFeedHeadlineScoringOutputName, a3);
}

- (NSString)shadowMagazineFeedHeadlineScoringOutputName
{
  return self->_shadowMagazineFeedHeadlineScoringOutputName;
}

- (void)setShadowMagazineFeedHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowMagazineFeedHeadlineScoringOutputName, a3);
}

- (NSString)shadowMagazineFeedIssuesHeadlineScoringOutputName
{
  return self->_shadowMagazineFeedIssuesHeadlineScoringOutputName;
}

- (void)setShadowMagazineFeedIssuesHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowMagazineFeedIssuesHeadlineScoringOutputName, a3);
}

- (NSString)shadowLegacyAudioFeedHeadlineScoringOutputName
{
  return self->_shadowLegacyAudioFeedHeadlineScoringOutputName;
}

- (void)setShadowLegacyAudioFeedHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowLegacyAudioFeedHeadlineScoringOutputName, a3);
}

- (NSString)shadowAudioFeedHeadlineScoringOutputName
{
  return self->_shadowAudioFeedHeadlineScoringOutputName;
}

- (void)setShadowAudioFeedHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowAudioFeedHeadlineScoringOutputName, a3);
}

- (NSString)shadowArticleRecirculationPrimaryHeadlineScoringOutputName
{
  return self->_shadowArticleRecirculationPrimaryHeadlineScoringOutputName;
}

- (void)setShadowArticleRecirculationPrimaryHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowArticleRecirculationPrimaryHeadlineScoringOutputName, a3);
}

- (NSString)shadowArticleRecirculationSecondaryHeadlineScoringOutputName
{
  return self->_shadowArticleRecirculationSecondaryHeadlineScoringOutputName;
}

- (void)setShadowArticleRecirculationSecondaryHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowArticleRecirculationSecondaryHeadlineScoringOutputName, a3);
}

- (NSString)shadowArticleRecirculationTertiaryHeadlineScoringOutputName
{
  return self->_shadowArticleRecirculationTertiaryHeadlineScoringOutputName;
}

- (void)setShadowArticleRecirculationTertiaryHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowArticleRecirculationTertiaryHeadlineScoringOutputName, a3);
}

- (NSString)shadowArticleRecirculationQuaternaryHeadlineScoringOutputName
{
  return self->_shadowArticleRecirculationQuaternaryHeadlineScoringOutputName;
}

- (void)setShadowArticleRecirculationQuaternaryHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowArticleRecirculationQuaternaryHeadlineScoringOutputName, a3);
}

- (NSString)shadowBestOfBundleHeadlineScoringOutputName
{
  return self->_shadowBestOfBundleHeadlineScoringOutputName;
}

- (void)setShadowBestOfBundleHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowBestOfBundleHeadlineScoringOutputName, a3);
}

- (NSString)shadowForYouGroupHeadlineScoringOutputName
{
  return self->_shadowForYouGroupHeadlineScoringOutputName;
}

- (void)setShadowForYouGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowForYouGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowGreatStoriesYouMissedGroupHeadlineScoringOutputName
{
  return self->_shadowGreatStoriesYouMissedGroupHeadlineScoringOutputName;
}

- (void)setShadowGreatStoriesYouMissedGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowGreatStoriesYouMissedGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowLatestStoriesGroupHeadlineScoringOutputName
{
  return self->_shadowLatestStoriesGroupHeadlineScoringOutputName;
}

- (void)setShadowLatestStoriesGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowLatestStoriesGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowLocalNewsGroupHeadlineScoringOutputName
{
  return self->_shadowLocalNewsGroupHeadlineScoringOutputName;
}

- (void)setShadowLocalNewsGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowLocalNewsGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowNewspaperGroupMagazineFeedHeadlineScoringOutputName
{
  return self->_shadowNewspaperGroupMagazineFeedHeadlineScoringOutputName;
}

- (void)setShadowNewspaperGroupMagazineFeedHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowNewspaperGroupMagazineFeedHeadlineScoringOutputName, a3);
}

- (NSString)shadowTodayWidgetHeadlineScoringOutputName
{
  return self->_shadowTodayWidgetHeadlineScoringOutputName;
}

- (void)setShadowTodayWidgetHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowTodayWidgetHeadlineScoringOutputName, a3);
}

- (NSString)shadowTagWidgetHeadlineScoringOutputName
{
  return self->_shadowTagWidgetHeadlineScoringOutputName;
}

- (void)setShadowTagWidgetHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowTagWidgetHeadlineScoringOutputName, a3);
}

- (NSString)shadowNotificationHeadlineScoringOutputName
{
  return self->_shadowNotificationHeadlineScoringOutputName;
}

- (void)setShadowNotificationHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowNotificationHeadlineScoringOutputName, a3);
}

- (NSString)shadowMySportsGroupHeadlineScoringOutputName
{
  return self->_shadowMySportsGroupHeadlineScoringOutputName;
}

- (void)setShadowMySportsGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowMySportsGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowSportsTopStoriesHeadlineScoringOutputName
{
  return self->_shadowSportsTopStoriesHeadlineScoringOutputName;
}

- (void)setShadowSportsTopStoriesHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowSportsTopStoriesHeadlineScoringOutputName, a3);
}

- (NSString)shadowIntroToSportsGroupHeadlineScoringOutputName
{
  return self->_shadowIntroToSportsGroupHeadlineScoringOutputName;
}

- (void)setShadowIntroToSportsGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowHighlightsGroupHeadlineScoringOutputName
{
  return self->_shadowHighlightsGroupHeadlineScoringOutputName;
}

- (void)setShadowHighlightsGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowHighlightsGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowArticleListTagFeedGroupHeadlineScoringOutputName
{
  return self->_shadowArticleListTagFeedGroupHeadlineScoringOutputName;
}

- (void)setShadowArticleListTagFeedGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowArticleListTagFeedGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowTagFeedHeadlineScoringOutputName
{
  return self->_shadowTagFeedHeadlineScoringOutputName;
}

- (void)setShadowTagFeedHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowTagFeedHeadlineScoringOutputName, a3);
}

- (NSString)shadowNewspaperGroupTodayFeedHeadlineScoringOutputName
{
  return self->_shadowNewspaperGroupTodayFeedHeadlineScoringOutputName;
}

- (void)setShadowNewspaperGroupTodayFeedHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowNewspaperGroupTodayFeedHeadlineScoringOutputName, a3);
}

- (NSString)shadowMoreForYouGroupHeadlineScoringOutputName
{
  return self->_shadowMoreForYouGroupHeadlineScoringOutputName;
}

- (void)setShadowMoreForYouGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowMoreForYouGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowIntroToSportsGroupForYouHeadlineScoringOutputName
{
  return self->_shadowIntroToSportsGroupForYouHeadlineScoringOutputName;
}

- (void)setShadowIntroToSportsGroupForYouHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowIntroToSportsGroupForYouHeadlineScoringOutputName, a3);
}

- (NSString)shadowMySportsGroupForYouHeadlineScoringOutputName
{
  return self->_shadowMySportsGroupForYouHeadlineScoringOutputName;
}

- (void)setShadowMySportsGroupForYouHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowMySportsGroupForYouHeadlineScoringOutputName, a3);
}

- (NSString)shadowMySportsTopicsHeadlineScoringOutputName
{
  return self->_shadowMySportsTopicsHeadlineScoringOutputName;
}

- (void)setShadowMySportsTopicsHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowMySportsTopicsHeadlineScoringOutputName, a3);
}

- (NSString)shadowCuratedGroupHeadlineScoringOutputName
{
  return self->_shadowCuratedGroupHeadlineScoringOutputName;
}

- (void)setShadowCuratedGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowCuratedGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowCuratedGroupIssuesHeadlineScoringOutputName
{
  return self->_shadowCuratedGroupIssuesHeadlineScoringOutputName;
}

- (void)setShadowCuratedGroupIssuesHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowCuratedGroupIssuesHeadlineScoringOutputName, a3);
}

- (NSString)shadowLocalSectionGroupHeadlineScoringOutputName
{
  return self->_shadowLocalSectionGroupHeadlineScoringOutputName;
}

- (void)setShadowLocalSectionGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowLocalSectionGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowNewspaperSectionGroupHeadlineScoringOutputName
{
  return self->_shadowNewspaperSectionGroupHeadlineScoringOutputName;
}

- (void)setShadowNewspaperSectionGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowNewspaperSectionGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowSportsEventArticlesGroupHeadlineScoringOutputName
{
  return self->_shadowSportsEventArticlesGroupHeadlineScoringOutputName;
}

- (void)setShadowSportsEventArticlesGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowSportsEventArticlesGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowTagFeedForYouGroupHeadlineScoringOutputName
{
  return self->_shadowTagFeedForYouGroupHeadlineScoringOutputName;
}

- (void)setShadowTagFeedForYouGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowTagFeedForYouGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowTagRecentStoriesGroupHeadlineScoringOutputName
{
  return self->_shadowTagRecentStoriesGroupHeadlineScoringOutputName;
}

- (void)setShadowTagRecentStoriesGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowTagRecentStoriesGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowTagDateRangeGroupHeadlineScoringOutputName
{
  return self->_shadowTagDateRangeGroupHeadlineScoringOutputName;
}

- (void)setShadowTagDateRangeGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowTagDateRangeGroupHeadlineScoringOutputName, a3);
}

- (NSString)shadowSportsEventTopicGroupHeadlineScoringOutputName
{
  return self->_shadowSportsEventTopicGroupHeadlineScoringOutputName;
}

- (void)setShadowSportsEventTopicGroupHeadlineScoringOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_shadowSportsEventTopicGroupHeadlineScoringOutputName, a3);
}

@end
