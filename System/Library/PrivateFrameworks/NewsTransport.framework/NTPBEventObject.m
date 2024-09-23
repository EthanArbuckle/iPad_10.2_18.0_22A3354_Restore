@implementation NTPBEventObject

- (BOOL)hasUserOnboardingBegin
{
  return self->_userOnboardingBegin != 0;
}

- (BOOL)hasUserOnboardingResume
{
  return self->_userOnboardingResume != 0;
}

- (BOOL)hasUserOnboardingResult
{
  return self->_userOnboardingResult != 0;
}

- (BOOL)hasAppSessionStart
{
  return self->_appSessionStart != 0;
}

- (BOOL)hasAppSessionEnd
{
  return self->_appSessionEnd != 0;
}

- (BOOL)hasArticleScroll
{
  return self->_articleScroll != 0;
}

- (BOOL)hasArticleHostViewExposure
{
  return self->_articleHostViewExposure != 0;
}

- (BOOL)hasArticleLikeDislike
{
  return self->_articleLikeDislike != 0;
}

- (BOOL)hasFeedCellExposure
{
  return self->_feedCellExposure != 0;
}

- (BOOL)hasFeedViewExposure
{
  return self->_feedViewExposure != 0;
}

- (BOOL)hasFeedCellHostViewExposure
{
  return self->_feedCellHostViewExposure != 0;
}

- (BOOL)hasFeedSubscribeUnsubscribe
{
  return self->_feedSubscribeUnsubscribe != 0;
}

- (BOOL)hasMediaExposure
{
  return self->_mediaExposure != 0;
}

- (BOOL)hasMediaView
{
  return self->_mediaView != 0;
}

- (BOOL)hasMediaEngage
{
  return self->_mediaEngage != 0;
}

- (BOOL)hasMediaEngageComplete
{
  return self->_mediaEngageComplete != 0;
}

- (BOOL)hasSearchBegin
{
  return self->_searchBegin != 0;
}

- (BOOL)hasSearchExecute
{
  return self->_searchExecute != 0;
}

- (BOOL)hasSearchResultSelect
{
  return self->_searchResultSelect != 0;
}

- (BOOL)hasShareResult
{
  return self->_shareResult != 0;
}

- (BOOL)hasNoUserAction
{
  return self->_noUserAction != 0;
}

- (BOOL)hasReadingListAddRemove
{
  return self->_readingListAddRemove != 0;
}

- (BOOL)hasReadingListShow
{
  return self->_readingListShow != 0;
}

- (BOOL)hasRecommendationBrickExposure
{
  return self->_recommendationBrickExposure != 0;
}

- (BOOL)hasEndOfArticleExposure
{
  return self->_endOfArticleExposure != 0;
}

- (BOOL)hasReportConcernSubmission
{
  return self->_reportConcernSubmission != 0;
}

- (BOOL)hasLocalNotificationReturn
{
  return self->_localNotificationReturn != 0;
}

- (BOOL)hasPullToRefresh
{
  return self->_pullToRefresh != 0;
}

- (BOOL)hasLinkTapArticle
{
  return self->_linkTapArticle != 0;
}

- (BOOL)hasLocalNotificationReceived
{
  return self->_localNotificationReceived != 0;
}

- (BOOL)hasUserOnboardingScreenView
{
  return self->_userOnboardingScreenView != 0;
}

- (BOOL)hasUserOnboardingChannelPickerComplete
{
  return self->_userOnboardingChannelPickerComplete != 0;
}

- (BOOL)hasAdExposureOpportunity
{
  return self->_adExposureOpportunity != 0;
}

- (BOOL)hasChannelMuteUnmute
{
  return self->_channelMuteUnmute != 0;
}

- (BOOL)hasShareSheetExposure
{
  return self->_shareSheetExposure != 0;
}

- (BOOL)hasFeedEngagementMenuExposure
{
  return self->_feedEngagementMenuExposure != 0;
}

- (BOOL)hasSearchViewExposure
{
  return self->_searchViewExposure != 0;
}

- (BOOL)hasGroupViewExposure
{
  return self->_groupViewExposure != 0;
}

- (BOOL)hasPaidSubscriptionConversionPointExposure
{
  return self->_paidSubscriptionConversionPointExposure != 0;
}

- (BOOL)hasPaidSubscriptionSheetView
{
  return self->_paidSubscriptionSheetView != 0;
}

- (BOOL)hasShareSheetIapFail
{
  return self->_shareSheetIapFail != 0;
}

- (BOOL)hasPaidSubscriptionResult
{
  return self->_paidSubscriptionResult != 0;
}

- (BOOL)hasShareInformationScreenView
{
  return self->_shareInformationScreenView != 0;
}

- (BOOL)hasWebAccessScreenView
{
  return self->_webAccessScreenView != 0;
}

- (BOOL)hasAlreadySubscriberSignIn
{
  return self->_alreadySubscriberSignIn != 0;
}

- (BOOL)hasBackgroundSubscriptionValidation
{
  return self->_backgroundSubscriptionValidation != 0;
}

- (BOOL)hasSubscriptionDetectionScreenView
{
  return self->_subscriptionDetectionScreenView != 0;
}

- (BOOL)hasCoverArticleWidgetView
{
  return self->_coverArticleWidgetView != 0;
}

- (BOOL)hasNotificationSubscribeUnsubscribe
{
  return self->_notificationSubscribeUnsubscribe != 0;
}

- (BOOL)hasNotificationSettingsScreenView
{
  return self->_notificationSettingsScreenView != 0;
}

- (BOOL)hasEmailOptInInvite
{
  return self->_emailOptInInvite != 0;
}

- (BOOL)hasCoverArticleWidgetExposure
{
  return self->_coverArticleWidgetExposure != 0;
}

- (BOOL)hasRestorePaidSubscription
{
  return self->_restorePaidSubscription != 0;
}

- (BOOL)hasPaidSubscriptionSheetIapFail
{
  return self->_paidSubscriptionSheetIapFail != 0;
}

- (BOOL)hasComscoreEventSend
{
  return self->_comscoreEventSend != 0;
}

- (BOOL)hasDiscoverMoreInterstitialExposure
{
  return self->_discoverMoreInterstitialExposure != 0;
}

- (BOOL)hasArticleViewNotw
{
  return self->_articleViewNotw != 0;
}

- (BOOL)hasArticleScrollNotw
{
  return self->_articleScrollNotw != 0;
}

- (BOOL)hasUrlMappingMiss
{
  return self->_urlMappingMiss != 0;
}

- (BOOL)hasBundleIdMappingMiss
{
  return self->_bundleIdMappingMiss != 0;
}

- (BOOL)hasExternalAnalyticsEventSend
{
  return self->_externalAnalyticsEventSend != 0;
}

- (BOOL)hasAppSessionStartWatch
{
  return self->_appSessionStartWatch != 0;
}

- (BOOL)hasArticleViewWatch
{
  return self->_articleViewWatch != 0;
}

- (BOOL)hasAppSessionEndWatch
{
  return self->_appSessionEndWatch != 0;
}

- (BOOL)hasAnfComponentExposure
{
  return self->_anfComponentExposure != 0;
}

- (BOOL)hasTodayWidgetSession
{
  return self->_todayWidgetSession != 0;
}

- (BOOL)hasWidgetEngagement
{
  return self->_widgetEngagement != 0;
}

- (BOOL)hasTodayWidgetHeadlineExposure
{
  return self->_todayWidgetHeadlineExposure != 0;
}

- (BOOL)hasTodayWidgetExposure
{
  return self->_todayWidgetExposure != 0;
}

- (BOOL)hasAdExposureIneligible
{
  return self->_adExposureIneligible != 0;
}

- (BOOL)hasOptInButtonExposure
{
  return self->_optInButtonExposure != 0;
}

- (BOOL)hasSuggestionsFeedback
{
  return self->_suggestionsFeedback != 0;
}

- (BOOL)hasUserIgnoreFavoritesSuggestion
{
  return self->_userIgnoreFavoritesSuggestion != 0;
}

- (BOOL)hasArticleEngagement
{
  return self->_articleEngagement != 0;
}

- (BOOL)hasAdImpression
{
  return self->_adImpression != 0;
}

- (BOOL)hasAdEngagement
{
  return self->_adEngagement != 0;
}

- (BOOL)hasAdCtaEngagement
{
  return self->_adCtaEngagement != 0;
}

- (BOOL)hasLinkTap
{
  return self->_linkTap != 0;
}

- (BOOL)hasTopOfFeedModuleExposure
{
  return self->_topOfFeedModuleExposure != 0;
}

- (BOOL)hasInAppWebEmbedExposure
{
  return self->_inAppWebEmbedExposure != 0;
}

- (BOOL)hasTocExposure
{
  return self->_tocExposure != 0;
}

- (BOOL)hasTocReorder
{
  return self->_tocReorder != 0;
}

- (BOOL)hasTocHandleTap
{
  return self->_tocHandleTap != 0;
}

- (BOOL)hasTocCardDrag
{
  return self->_tocCardDrag != 0;
}

- (BOOL)hasTocToggleTap
{
  return self->_tocToggleTap != 0;
}

- (BOOL)hasTocCellExposure
{
  return self->_tocCellExposure != 0;
}

- (BOOL)hasAppSessionResign
{
  return self->_appSessionResign != 0;
}

- (BOOL)hasAppSessionResume
{
  return self->_appSessionResume != 0;
}

- (BOOL)hasArticleSessionResign
{
  return self->_articleSessionResign != 0;
}

- (BOOL)hasArticleSessionResume
{
  return self->_articleSessionResume != 0;
}

- (BOOL)hasBundleSubscriberInfo
{
  return self->_bundleSubscriberInfo != 0;
}

- (BOOL)hasIssueDownload
{
  return self->_issueDownload != 0;
}

- (BOOL)hasPaywallButtonTap
{
  return self->_paywallButtonTap != 0;
}

- (BOOL)hasPdfPageView
{
  return self->_pdfPageView != 0;
}

- (BOOL)hasIssueTocView
{
  return self->_issueTocView != 0;
}

- (BOOL)hasIssueExposure
{
  return self->_issueExposure != 0;
}

- (BOOL)hasAppleidSignInResult
{
  return self->_appleidSignInResult != 0;
}

- (BOOL)hasArticleFeedback
{
  return self->_articleFeedback != 0;
}

- (BOOL)hasAudioEngage
{
  return self->_audioEngage != 0;
}

- (BOOL)hasAudioEngagementCompleted
{
  return self->_audioEngagementCompleted != 0;
}

- (BOOL)hasPurchaseOffersItem
{
  return self->_purchaseOffersItem != 0;
}

- (BOOL)hasFeedLoad
{
  return self->_feedLoad != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBEventObject;
  -[NTPBEventObject description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBEventObject dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBUserOnboardingBegin *userOnboardingBegin;
  void *v5;
  NTPBUserOnboardingResume *userOnboardingResume;
  void *v7;
  NTPBUserOnboardingResult *userOnboardingResult;
  void *v9;
  NTPBAppSessionStart *appSessionStart;
  void *v11;
  NTPBAppSessionEnd *appSessionEnd;
  void *v13;
  NTPBArticleScroll *articleScroll;
  void *v15;
  NTPBArticleHostViewExposure *articleHostViewExposure;
  void *v17;
  NTPBArticleLikeDislike *articleLikeDislike;
  void *v19;
  NTPBFeedCellExposure *feedCellExposure;
  void *v21;
  NTPBFeedViewExposure *feedViewExposure;
  void *v23;
  NTPBFeedCellHostViewExposure *feedCellHostViewExposure;
  void *v25;
  NTPBFeedSubscribeUnsubscribe *feedSubscribeUnsubscribe;
  void *v27;
  NTPBMediaExposure *mediaExposure;
  void *v29;
  NTPBMediaView *mediaView;
  void *v31;
  NTPBMediaEngage *mediaEngage;
  void *v33;
  NTPBMediaEngageComplete *mediaEngageComplete;
  void *v35;
  NTPBSearchBegin *searchBegin;
  void *v37;
  NTPBSearchExecute *searchExecute;
  void *v39;
  NTPBSearchResultSelect *searchResultSelect;
  void *v41;
  NTPBShareResult *shareResult;
  void *v43;
  NTPBNoUserAction *noUserAction;
  void *v45;
  NTPBReadingListAddRemove *readingListAddRemove;
  void *v47;
  NTPBReadingListShow *readingListShow;
  void *v49;
  NTPBRecommendationBrickExposure *recommendationBrickExposure;
  void *v51;
  NTPBEndOfArticleExposure *endOfArticleExposure;
  void *v53;
  NTPBReportConcernSubmission *reportConcernSubmission;
  void *v55;
  NTPBLocalNotificationReturn *localNotificationReturn;
  void *v57;
  NTPBPullToRefresh *pullToRefresh;
  void *v59;
  NTPBLinkTapArticle *linkTapArticle;
  void *v61;
  NTPBLocalNotificationReceived *localNotificationReceived;
  void *v63;
  NTPBUserOnboardingScreenView *userOnboardingScreenView;
  void *v65;
  NTPBUserOnboardingChannelPickerComplete *userOnboardingChannelPickerComplete;
  void *v67;
  NTPBAdExposureOpportunity *adExposureOpportunity;
  void *v69;
  NTPBChannelMuteUnmute *channelMuteUnmute;
  void *v71;
  NTPBShareSheetExposure *shareSheetExposure;
  void *v73;
  NTPBFeedEngagementMenuExposure *feedEngagementMenuExposure;
  void *v75;
  NTPBSearchViewExposure *searchViewExposure;
  void *v77;
  NTPBGroupViewExposure *groupViewExposure;
  void *v79;
  NTPBPaidSubscriptionConversionPointExposure *paidSubscriptionConversionPointExposure;
  void *v81;
  NTPBPaidSubscriptionSheetView *paidSubscriptionSheetView;
  void *v83;
  NTPBShareSheetIapFail *shareSheetIapFail;
  void *v85;
  NTPBPaidSubscriptionResult *paidSubscriptionResult;
  void *v87;
  NTPBShareInformationScreenView *shareInformationScreenView;
  void *v89;
  NTPBWebAccessScreenView *webAccessScreenView;
  void *v91;
  NTPBAlreadySubscriberSignIn *alreadySubscriberSignIn;
  void *v93;
  NTPBBackgroundSubscriptionValidation *backgroundSubscriptionValidation;
  void *v95;
  NTPBSubscriptionDetectionScreenView *subscriptionDetectionScreenView;
  void *v97;
  NTPBCoverArticleWidgetView *coverArticleWidgetView;
  void *v99;
  NTPBNotificationSubscribeUnsubscribe *notificationSubscribeUnsubscribe;
  void *v101;
  NTPBNotificationSettingsScreenView *notificationSettingsScreenView;
  void *v103;
  NTPBEmailOptInInvite *emailOptInInvite;
  void *v105;
  NTPBCoverArticleWidgetExposure *coverArticleWidgetExposure;
  void *v107;
  NTPBRestorePaidSubscription *restorePaidSubscription;
  void *v109;
  NTPBPaidSubscriptionSheetIapFail *paidSubscriptionSheetIapFail;
  void *v111;
  NTPBComscoreEventSend *comscoreEventSend;
  void *v113;
  NTPBDiscoverMoreInterstitialExposure *discoverMoreInterstitialExposure;
  void *v115;
  NTPBArticleViewNotw *articleViewNotw;
  void *v117;
  NTPBArticleScrollNotw *articleScrollNotw;
  void *v119;
  NTPBUrlMappingMiss *urlMappingMiss;
  void *v121;
  NTPBBundleIdMappingMiss *bundleIdMappingMiss;
  void *v123;
  NTPBExternalAnalyticsEventSend *externalAnalyticsEventSend;
  void *v125;
  NTPBAppSessionStartWatch *appSessionStartWatch;
  void *v127;
  NTPBArticleViewWatch *articleViewWatch;
  void *v129;
  NTPBAppSessionEndWatch *appSessionEndWatch;
  void *v131;
  NTPBAnfComponentExposure *anfComponentExposure;
  void *v133;
  NTPBTodayWidgetSession *todayWidgetSession;
  void *v135;
  NTPBWidgetEngagement *widgetEngagement;
  void *v137;
  NTPBTodayWidgetHeadlineExposure *todayWidgetHeadlineExposure;
  void *v139;
  NTPBTodayWidgetExposure *todayWidgetExposure;
  void *v141;
  NTPBAdExposureIneligible *adExposureIneligible;
  void *v143;
  NTPBOptInButtonExposure *optInButtonExposure;
  void *v145;
  NTPBSuggestionsFeedback *suggestionsFeedback;
  void *v147;
  NTPBUserIgnoreFavoritesSuggestion *userIgnoreFavoritesSuggestion;
  void *v149;
  NTPBArticleEngagement *articleEngagement;
  void *v151;
  NTPBAdImpression *adImpression;
  void *v153;
  NTPBAdEngagement *adEngagement;
  void *v155;
  NTPBAdCtaEngagement *adCtaEngagement;
  void *v157;
  NTPBLinkTap *linkTap;
  void *v159;
  NTPBTopOfFeedModuleExposure *topOfFeedModuleExposure;
  void *v161;
  NTPBInAppWebEmbedExposure *inAppWebEmbedExposure;
  void *v163;
  NTPBTocExposure *tocExposure;
  void *v165;
  NTPBTocReorder *tocReorder;
  void *v167;
  NTPBTocHandleTap *tocHandleTap;
  void *v169;
  NTPBTocCardDrag *tocCardDrag;
  void *v171;
  NTPBTocToggleTap *tocToggleTap;
  void *v173;
  NTPBTocCellExposure *tocCellExposure;
  void *v175;
  NTPBAppSessionResign *appSessionResign;
  void *v177;
  NTPBAppSessionResume *appSessionResume;
  void *v179;
  NTPBArticleSessionResign *articleSessionResign;
  void *v181;
  NTPBArticleSessionResume *articleSessionResume;
  void *v183;
  NTPBBundleSubscriberInfo *bundleSubscriberInfo;
  void *v185;
  NTPBIssueDownload *issueDownload;
  void *v187;
  NTPBPaywallButtonTap *paywallButtonTap;
  void *v189;
  NTPBPDFPageView *pdfPageView;
  void *v191;
  NTPBIssueTocView *issueTocView;
  void *v193;
  NTPBIssueExposure *issueExposure;
  void *v195;
  NTPBAppleIdSignInResult *appleidSignInResult;
  void *v197;
  NTPBArticleFeedback *articleFeedback;
  void *v199;
  NTPBAudioEngage *audioEngage;
  void *v201;
  NTPBAudioEngagementCompleted *audioEngagementCompleted;
  void *v203;
  NTPBPurchaseOffersItem *purchaseOffersItem;
  void *v205;
  NTPBFeedLoad *feedLoad;
  void *v207;
  id v208;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  userOnboardingBegin = self->_userOnboardingBegin;
  if (userOnboardingBegin)
  {
    -[NTPBUserOnboardingBegin dictionaryRepresentation](userOnboardingBegin, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("user_onboarding_begin"));

  }
  userOnboardingResume = self->_userOnboardingResume;
  if (userOnboardingResume)
  {
    -[NTPBUserOnboardingResume dictionaryRepresentation](userOnboardingResume, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("user_onboarding_resume"));

  }
  userOnboardingResult = self->_userOnboardingResult;
  if (userOnboardingResult)
  {
    -[NTPBUserOnboardingResult dictionaryRepresentation](userOnboardingResult, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("user_onboarding_result"));

  }
  appSessionStart = self->_appSessionStart;
  if (appSessionStart)
  {
    -[NTPBAppSessionStart dictionaryRepresentation](appSessionStart, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("app_session_start"));

  }
  appSessionEnd = self->_appSessionEnd;
  if (appSessionEnd)
  {
    -[NTPBAppSessionEnd dictionaryRepresentation](appSessionEnd, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("app_session_end"));

  }
  articleScroll = self->_articleScroll;
  if (articleScroll)
  {
    -[NTPBArticleScroll dictionaryRepresentation](articleScroll, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("article_scroll"));

  }
  articleHostViewExposure = self->_articleHostViewExposure;
  if (articleHostViewExposure)
  {
    -[NTPBArticleHostViewExposure dictionaryRepresentation](articleHostViewExposure, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("article_host_view_exposure"));

  }
  articleLikeDislike = self->_articleLikeDislike;
  if (articleLikeDislike)
  {
    -[NTPBArticleLikeDislike dictionaryRepresentation](articleLikeDislike, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("article_like_dislike"));

  }
  feedCellExposure = self->_feedCellExposure;
  if (feedCellExposure)
  {
    -[NTPBFeedCellExposure dictionaryRepresentation](feedCellExposure, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("feed_cell_exposure"));

  }
  feedViewExposure = self->_feedViewExposure;
  if (feedViewExposure)
  {
    -[NTPBFeedViewExposure dictionaryRepresentation](feedViewExposure, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("feed_view_exposure"));

  }
  feedCellHostViewExposure = self->_feedCellHostViewExposure;
  if (feedCellHostViewExposure)
  {
    -[NTPBFeedCellHostViewExposure dictionaryRepresentation](feedCellHostViewExposure, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("feed_cell_host_view_exposure"));

  }
  feedSubscribeUnsubscribe = self->_feedSubscribeUnsubscribe;
  if (feedSubscribeUnsubscribe)
  {
    -[NTPBFeedSubscribeUnsubscribe dictionaryRepresentation](feedSubscribeUnsubscribe, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("feed_subscribe_unsubscribe"));

  }
  mediaExposure = self->_mediaExposure;
  if (mediaExposure)
  {
    -[NTPBMediaExposure dictionaryRepresentation](mediaExposure, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("media_exposure"));

  }
  mediaView = self->_mediaView;
  if (mediaView)
  {
    -[NTPBMediaView dictionaryRepresentation](mediaView, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("media_view"));

  }
  mediaEngage = self->_mediaEngage;
  if (mediaEngage)
  {
    -[NTPBMediaEngage dictionaryRepresentation](mediaEngage, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("media_engage"));

  }
  mediaEngageComplete = self->_mediaEngageComplete;
  if (mediaEngageComplete)
  {
    -[NTPBMediaEngageComplete dictionaryRepresentation](mediaEngageComplete, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("media_engage_complete"));

  }
  searchBegin = self->_searchBegin;
  if (searchBegin)
  {
    -[NTPBSearchBegin dictionaryRepresentation](searchBegin, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("search_begin"));

  }
  searchExecute = self->_searchExecute;
  if (searchExecute)
  {
    -[NTPBSearchExecute dictionaryRepresentation](searchExecute, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("search_execute"));

  }
  searchResultSelect = self->_searchResultSelect;
  if (searchResultSelect)
  {
    -[NTPBSearchResultSelect dictionaryRepresentation](searchResultSelect, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("search_result_select"));

  }
  shareResult = self->_shareResult;
  if (shareResult)
  {
    -[NTPBShareResult dictionaryRepresentation](shareResult, "dictionaryRepresentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("share_result"));

  }
  noUserAction = self->_noUserAction;
  if (noUserAction)
  {
    -[NTPBNoUserAction dictionaryRepresentation](noUserAction, "dictionaryRepresentation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("no_user_action"));

  }
  readingListAddRemove = self->_readingListAddRemove;
  if (readingListAddRemove)
  {
    -[NTPBReadingListAddRemove dictionaryRepresentation](readingListAddRemove, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("reading_list_add_remove"));

  }
  readingListShow = self->_readingListShow;
  if (readingListShow)
  {
    -[NTPBReadingListShow dictionaryRepresentation](readingListShow, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("reading_list_show"));

  }
  recommendationBrickExposure = self->_recommendationBrickExposure;
  if (recommendationBrickExposure)
  {
    -[NTPBRecommendationBrickExposure dictionaryRepresentation](recommendationBrickExposure, "dictionaryRepresentation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("recommendation_brick_exposure"));

  }
  endOfArticleExposure = self->_endOfArticleExposure;
  if (endOfArticleExposure)
  {
    -[NTPBEndOfArticleExposure dictionaryRepresentation](endOfArticleExposure, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("end_of_article_exposure"));

  }
  reportConcernSubmission = self->_reportConcernSubmission;
  if (reportConcernSubmission)
  {
    -[NTPBReportConcernSubmission dictionaryRepresentation](reportConcernSubmission, "dictionaryRepresentation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("report_concern_submission"));

  }
  localNotificationReturn = self->_localNotificationReturn;
  if (localNotificationReturn)
  {
    -[NTPBLocalNotificationReturn dictionaryRepresentation](localNotificationReturn, "dictionaryRepresentation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("local_notification_return"));

  }
  pullToRefresh = self->_pullToRefresh;
  if (pullToRefresh)
  {
    -[NTPBPullToRefresh dictionaryRepresentation](pullToRefresh, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("pull_to_refresh"));

  }
  linkTapArticle = self->_linkTapArticle;
  if (linkTapArticle)
  {
    -[NTPBLinkTapArticle dictionaryRepresentation](linkTapArticle, "dictionaryRepresentation");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("link_tap_article"));

  }
  localNotificationReceived = self->_localNotificationReceived;
  if (localNotificationReceived)
  {
    -[NTPBLocalNotificationReceived dictionaryRepresentation](localNotificationReceived, "dictionaryRepresentation");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("local_notification_received"));

  }
  userOnboardingScreenView = self->_userOnboardingScreenView;
  if (userOnboardingScreenView)
  {
    -[NTPBUserOnboardingScreenView dictionaryRepresentation](userOnboardingScreenView, "dictionaryRepresentation");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("user_onboarding_screen_view"));

  }
  userOnboardingChannelPickerComplete = self->_userOnboardingChannelPickerComplete;
  if (userOnboardingChannelPickerComplete)
  {
    -[NTPBUserOnboardingChannelPickerComplete dictionaryRepresentation](userOnboardingChannelPickerComplete, "dictionaryRepresentation");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("user_onboarding_channel_picker_complete"));

  }
  adExposureOpportunity = self->_adExposureOpportunity;
  if (adExposureOpportunity)
  {
    -[NTPBAdExposureOpportunity dictionaryRepresentation](adExposureOpportunity, "dictionaryRepresentation");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("ad_exposure_opportunity"));

  }
  channelMuteUnmute = self->_channelMuteUnmute;
  if (channelMuteUnmute)
  {
    -[NTPBChannelMuteUnmute dictionaryRepresentation](channelMuteUnmute, "dictionaryRepresentation");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("channel_mute_unmute"));

  }
  shareSheetExposure = self->_shareSheetExposure;
  if (shareSheetExposure)
  {
    -[NTPBShareSheetExposure dictionaryRepresentation](shareSheetExposure, "dictionaryRepresentation");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v73, CFSTR("share_sheet_exposure"));

  }
  feedEngagementMenuExposure = self->_feedEngagementMenuExposure;
  if (feedEngagementMenuExposure)
  {
    -[NTPBFeedEngagementMenuExposure dictionaryRepresentation](feedEngagementMenuExposure, "dictionaryRepresentation");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v75, CFSTR("feed_engagement_menu_exposure"));

  }
  searchViewExposure = self->_searchViewExposure;
  if (searchViewExposure)
  {
    -[NTPBSearchViewExposure dictionaryRepresentation](searchViewExposure, "dictionaryRepresentation");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("search_view_exposure"));

  }
  groupViewExposure = self->_groupViewExposure;
  if (groupViewExposure)
  {
    -[NTPBGroupViewExposure dictionaryRepresentation](groupViewExposure, "dictionaryRepresentation");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v79, CFSTR("group_view_exposure"));

  }
  paidSubscriptionConversionPointExposure = self->_paidSubscriptionConversionPointExposure;
  if (paidSubscriptionConversionPointExposure)
  {
    -[NTPBPaidSubscriptionConversionPointExposure dictionaryRepresentation](paidSubscriptionConversionPointExposure, "dictionaryRepresentation");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v81, CFSTR("paid_subscription_conversion_point_exposure"));

  }
  paidSubscriptionSheetView = self->_paidSubscriptionSheetView;
  if (paidSubscriptionSheetView)
  {
    -[NTPBPaidSubscriptionSheetView dictionaryRepresentation](paidSubscriptionSheetView, "dictionaryRepresentation");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v83, CFSTR("paid_subscription_sheet_view"));

  }
  shareSheetIapFail = self->_shareSheetIapFail;
  if (shareSheetIapFail)
  {
    -[NTPBShareSheetIapFail dictionaryRepresentation](shareSheetIapFail, "dictionaryRepresentation");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("share_sheet_iap_fail"));

  }
  paidSubscriptionResult = self->_paidSubscriptionResult;
  if (paidSubscriptionResult)
  {
    -[NTPBPaidSubscriptionResult dictionaryRepresentation](paidSubscriptionResult, "dictionaryRepresentation");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v87, CFSTR("paid_subscription_result"));

  }
  shareInformationScreenView = self->_shareInformationScreenView;
  if (shareInformationScreenView)
  {
    -[NTPBShareInformationScreenView dictionaryRepresentation](shareInformationScreenView, "dictionaryRepresentation");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v89, CFSTR("share_information_screen_view"));

  }
  webAccessScreenView = self->_webAccessScreenView;
  if (webAccessScreenView)
  {
    -[NTPBWebAccessScreenView dictionaryRepresentation](webAccessScreenView, "dictionaryRepresentation");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v91, CFSTR("web_access_screen_view"));

  }
  alreadySubscriberSignIn = self->_alreadySubscriberSignIn;
  if (alreadySubscriberSignIn)
  {
    -[NTPBAlreadySubscriberSignIn dictionaryRepresentation](alreadySubscriberSignIn, "dictionaryRepresentation");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v93, CFSTR("already_subscriber_sign_in"));

  }
  backgroundSubscriptionValidation = self->_backgroundSubscriptionValidation;
  if (backgroundSubscriptionValidation)
  {
    -[NTPBBackgroundSubscriptionValidation dictionaryRepresentation](backgroundSubscriptionValidation, "dictionaryRepresentation");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v95, CFSTR("background_subscription_validation"));

  }
  subscriptionDetectionScreenView = self->_subscriptionDetectionScreenView;
  if (subscriptionDetectionScreenView)
  {
    -[NTPBSubscriptionDetectionScreenView dictionaryRepresentation](subscriptionDetectionScreenView, "dictionaryRepresentation");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v97, CFSTR("subscription_detection_screen_view"));

  }
  coverArticleWidgetView = self->_coverArticleWidgetView;
  if (coverArticleWidgetView)
  {
    -[NTPBCoverArticleWidgetView dictionaryRepresentation](coverArticleWidgetView, "dictionaryRepresentation");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v99, CFSTR("cover_article_widget_view"));

  }
  notificationSubscribeUnsubscribe = self->_notificationSubscribeUnsubscribe;
  if (notificationSubscribeUnsubscribe)
  {
    -[NTPBNotificationSubscribeUnsubscribe dictionaryRepresentation](notificationSubscribeUnsubscribe, "dictionaryRepresentation");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v101, CFSTR("notification_subscribe_unsubscribe"));

  }
  notificationSettingsScreenView = self->_notificationSettingsScreenView;
  if (notificationSettingsScreenView)
  {
    -[NTPBNotificationSettingsScreenView dictionaryRepresentation](notificationSettingsScreenView, "dictionaryRepresentation");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v103, CFSTR("notification_settings_screen_view"));

  }
  emailOptInInvite = self->_emailOptInInvite;
  if (emailOptInInvite)
  {
    -[NTPBEmailOptInInvite dictionaryRepresentation](emailOptInInvite, "dictionaryRepresentation");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v105, CFSTR("email_opt_in_invite"));

  }
  coverArticleWidgetExposure = self->_coverArticleWidgetExposure;
  if (coverArticleWidgetExposure)
  {
    -[NTPBCoverArticleWidgetExposure dictionaryRepresentation](coverArticleWidgetExposure, "dictionaryRepresentation");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v107, CFSTR("cover_article_widget_exposure"));

  }
  restorePaidSubscription = self->_restorePaidSubscription;
  if (restorePaidSubscription)
  {
    -[NTPBRestorePaidSubscription dictionaryRepresentation](restorePaidSubscription, "dictionaryRepresentation");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v109, CFSTR("restore_paid_subscription"));

  }
  paidSubscriptionSheetIapFail = self->_paidSubscriptionSheetIapFail;
  if (paidSubscriptionSheetIapFail)
  {
    -[NTPBPaidSubscriptionSheetIapFail dictionaryRepresentation](paidSubscriptionSheetIapFail, "dictionaryRepresentation");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v111, CFSTR("paid_subscription_sheet_iap_fail"));

  }
  comscoreEventSend = self->_comscoreEventSend;
  if (comscoreEventSend)
  {
    -[NTPBComscoreEventSend dictionaryRepresentation](comscoreEventSend, "dictionaryRepresentation");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v113, CFSTR("comscore_event_send"));

  }
  discoverMoreInterstitialExposure = self->_discoverMoreInterstitialExposure;
  if (discoverMoreInterstitialExposure)
  {
    -[NTPBDiscoverMoreInterstitialExposure dictionaryRepresentation](discoverMoreInterstitialExposure, "dictionaryRepresentation");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v115, CFSTR("discover_more_interstitial_exposure"));

  }
  articleViewNotw = self->_articleViewNotw;
  if (articleViewNotw)
  {
    -[NTPBArticleViewNotw dictionaryRepresentation](articleViewNotw, "dictionaryRepresentation");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v117, CFSTR("article_view_notw"));

  }
  articleScrollNotw = self->_articleScrollNotw;
  if (articleScrollNotw)
  {
    -[NTPBArticleScrollNotw dictionaryRepresentation](articleScrollNotw, "dictionaryRepresentation");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v119, CFSTR("article_scroll_notw"));

  }
  urlMappingMiss = self->_urlMappingMiss;
  if (urlMappingMiss)
  {
    -[NTPBUrlMappingMiss dictionaryRepresentation](urlMappingMiss, "dictionaryRepresentation");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v121, CFSTR("url_mapping_miss"));

  }
  bundleIdMappingMiss = self->_bundleIdMappingMiss;
  if (bundleIdMappingMiss)
  {
    -[NTPBBundleIdMappingMiss dictionaryRepresentation](bundleIdMappingMiss, "dictionaryRepresentation");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v123, CFSTR("bundle_id_mapping_miss"));

  }
  externalAnalyticsEventSend = self->_externalAnalyticsEventSend;
  if (externalAnalyticsEventSend)
  {
    -[NTPBExternalAnalyticsEventSend dictionaryRepresentation](externalAnalyticsEventSend, "dictionaryRepresentation");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v125, CFSTR("external_analytics_event_send"));

  }
  appSessionStartWatch = self->_appSessionStartWatch;
  if (appSessionStartWatch)
  {
    -[NTPBAppSessionStartWatch dictionaryRepresentation](appSessionStartWatch, "dictionaryRepresentation");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v127, CFSTR("app_session_start_watch"));

  }
  articleViewWatch = self->_articleViewWatch;
  if (articleViewWatch)
  {
    -[NTPBArticleViewWatch dictionaryRepresentation](articleViewWatch, "dictionaryRepresentation");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v129, CFSTR("article_view_watch"));

  }
  appSessionEndWatch = self->_appSessionEndWatch;
  if (appSessionEndWatch)
  {
    -[NTPBAppSessionEndWatch dictionaryRepresentation](appSessionEndWatch, "dictionaryRepresentation");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v131, CFSTR("app_session_end_watch"));

  }
  anfComponentExposure = self->_anfComponentExposure;
  if (anfComponentExposure)
  {
    -[NTPBAnfComponentExposure dictionaryRepresentation](anfComponentExposure, "dictionaryRepresentation");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v133, CFSTR("anf_component_exposure"));

  }
  todayWidgetSession = self->_todayWidgetSession;
  if (todayWidgetSession)
  {
    -[NTPBTodayWidgetSession dictionaryRepresentation](todayWidgetSession, "dictionaryRepresentation");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v135, CFSTR("today_widget_session"));

  }
  widgetEngagement = self->_widgetEngagement;
  if (widgetEngagement)
  {
    -[NTPBWidgetEngagement dictionaryRepresentation](widgetEngagement, "dictionaryRepresentation");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v137, CFSTR("widget_engagement"));

  }
  todayWidgetHeadlineExposure = self->_todayWidgetHeadlineExposure;
  if (todayWidgetHeadlineExposure)
  {
    -[NTPBTodayWidgetHeadlineExposure dictionaryRepresentation](todayWidgetHeadlineExposure, "dictionaryRepresentation");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v139, CFSTR("today_widget_headline_exposure"));

  }
  todayWidgetExposure = self->_todayWidgetExposure;
  if (todayWidgetExposure)
  {
    -[NTPBTodayWidgetExposure dictionaryRepresentation](todayWidgetExposure, "dictionaryRepresentation");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v141, CFSTR("today_widget_exposure"));

  }
  adExposureIneligible = self->_adExposureIneligible;
  if (adExposureIneligible)
  {
    -[NTPBAdExposureIneligible dictionaryRepresentation](adExposureIneligible, "dictionaryRepresentation");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v143, CFSTR("ad_exposure_ineligible"));

  }
  optInButtonExposure = self->_optInButtonExposure;
  if (optInButtonExposure)
  {
    -[NTPBOptInButtonExposure dictionaryRepresentation](optInButtonExposure, "dictionaryRepresentation");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v145, CFSTR("opt_in_button_exposure"));

  }
  suggestionsFeedback = self->_suggestionsFeedback;
  if (suggestionsFeedback)
  {
    -[NTPBSuggestionsFeedback dictionaryRepresentation](suggestionsFeedback, "dictionaryRepresentation");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v147, CFSTR("suggestions_feedback"));

  }
  userIgnoreFavoritesSuggestion = self->_userIgnoreFavoritesSuggestion;
  if (userIgnoreFavoritesSuggestion)
  {
    -[NTPBUserIgnoreFavoritesSuggestion dictionaryRepresentation](userIgnoreFavoritesSuggestion, "dictionaryRepresentation");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v149, CFSTR("user_ignore_favorites_suggestion"));

  }
  articleEngagement = self->_articleEngagement;
  if (articleEngagement)
  {
    -[NTPBArticleEngagement dictionaryRepresentation](articleEngagement, "dictionaryRepresentation");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v151, CFSTR("article_engagement"));

  }
  adImpression = self->_adImpression;
  if (adImpression)
  {
    -[NTPBAdImpression dictionaryRepresentation](adImpression, "dictionaryRepresentation");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v153, CFSTR("ad_impression"));

  }
  adEngagement = self->_adEngagement;
  if (adEngagement)
  {
    -[NTPBAdEngagement dictionaryRepresentation](adEngagement, "dictionaryRepresentation");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v155, CFSTR("ad_engagement"));

  }
  adCtaEngagement = self->_adCtaEngagement;
  if (adCtaEngagement)
  {
    -[NTPBAdCtaEngagement dictionaryRepresentation](adCtaEngagement, "dictionaryRepresentation");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v157, CFSTR("ad_cta_engagement"));

  }
  linkTap = self->_linkTap;
  if (linkTap)
  {
    -[NTPBLinkTap dictionaryRepresentation](linkTap, "dictionaryRepresentation");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v159, CFSTR("link_tap"));

  }
  topOfFeedModuleExposure = self->_topOfFeedModuleExposure;
  if (topOfFeedModuleExposure)
  {
    -[NTPBTopOfFeedModuleExposure dictionaryRepresentation](topOfFeedModuleExposure, "dictionaryRepresentation");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v161, CFSTR("top_of_feed_module_exposure"));

  }
  inAppWebEmbedExposure = self->_inAppWebEmbedExposure;
  if (inAppWebEmbedExposure)
  {
    -[NTPBInAppWebEmbedExposure dictionaryRepresentation](inAppWebEmbedExposure, "dictionaryRepresentation");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v163, CFSTR("in_app_web_embed_exposure"));

  }
  tocExposure = self->_tocExposure;
  if (tocExposure)
  {
    -[NTPBTocExposure dictionaryRepresentation](tocExposure, "dictionaryRepresentation");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v165, CFSTR("toc_exposure"));

  }
  tocReorder = self->_tocReorder;
  if (tocReorder)
  {
    -[NTPBTocReorder dictionaryRepresentation](tocReorder, "dictionaryRepresentation");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v167, CFSTR("toc_reorder"));

  }
  tocHandleTap = self->_tocHandleTap;
  if (tocHandleTap)
  {
    -[NTPBTocHandleTap dictionaryRepresentation](tocHandleTap, "dictionaryRepresentation");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v169, CFSTR("toc_handle_tap"));

  }
  tocCardDrag = self->_tocCardDrag;
  if (tocCardDrag)
  {
    -[NTPBTocCardDrag dictionaryRepresentation](tocCardDrag, "dictionaryRepresentation");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v171, CFSTR("toc_card_drag"));

  }
  tocToggleTap = self->_tocToggleTap;
  if (tocToggleTap)
  {
    -[NTPBTocToggleTap dictionaryRepresentation](tocToggleTap, "dictionaryRepresentation");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v173, CFSTR("toc_toggle_tap"));

  }
  tocCellExposure = self->_tocCellExposure;
  if (tocCellExposure)
  {
    -[NTPBTocCellExposure dictionaryRepresentation](tocCellExposure, "dictionaryRepresentation");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v175, CFSTR("toc_cell_exposure"));

  }
  appSessionResign = self->_appSessionResign;
  if (appSessionResign)
  {
    -[NTPBAppSessionResign dictionaryRepresentation](appSessionResign, "dictionaryRepresentation");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v177, CFSTR("app_session_resign"));

  }
  appSessionResume = self->_appSessionResume;
  if (appSessionResume)
  {
    -[NTPBAppSessionResume dictionaryRepresentation](appSessionResume, "dictionaryRepresentation");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v179, CFSTR("app_session_resume"));

  }
  articleSessionResign = self->_articleSessionResign;
  if (articleSessionResign)
  {
    -[NTPBArticleSessionResign dictionaryRepresentation](articleSessionResign, "dictionaryRepresentation");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v181, CFSTR("article_session_resign"));

  }
  articleSessionResume = self->_articleSessionResume;
  if (articleSessionResume)
  {
    -[NTPBArticleSessionResume dictionaryRepresentation](articleSessionResume, "dictionaryRepresentation");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v183, CFSTR("article_session_resume"));

  }
  bundleSubscriberInfo = self->_bundleSubscriberInfo;
  if (bundleSubscriberInfo)
  {
    -[NTPBBundleSubscriberInfo dictionaryRepresentation](bundleSubscriberInfo, "dictionaryRepresentation");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v185, CFSTR("bundle_subscriber_info"));

  }
  issueDownload = self->_issueDownload;
  if (issueDownload)
  {
    -[NTPBIssueDownload dictionaryRepresentation](issueDownload, "dictionaryRepresentation");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v187, CFSTR("issue_download"));

  }
  paywallButtonTap = self->_paywallButtonTap;
  if (paywallButtonTap)
  {
    -[NTPBPaywallButtonTap dictionaryRepresentation](paywallButtonTap, "dictionaryRepresentation");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v189, CFSTR("paywall_button_tap"));

  }
  pdfPageView = self->_pdfPageView;
  if (pdfPageView)
  {
    -[NTPBPDFPageView dictionaryRepresentation](pdfPageView, "dictionaryRepresentation");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v191, CFSTR("pdf_page_view"));

  }
  issueTocView = self->_issueTocView;
  if (issueTocView)
  {
    -[NTPBIssueTocView dictionaryRepresentation](issueTocView, "dictionaryRepresentation");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v193, CFSTR("issue_toc_view"));

  }
  issueExposure = self->_issueExposure;
  if (issueExposure)
  {
    -[NTPBIssueExposure dictionaryRepresentation](issueExposure, "dictionaryRepresentation");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v195, CFSTR("issue_exposure"));

  }
  appleidSignInResult = self->_appleidSignInResult;
  if (appleidSignInResult)
  {
    -[NTPBAppleIdSignInResult dictionaryRepresentation](appleidSignInResult, "dictionaryRepresentation");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v197, CFSTR("appleid_sign_in_result"));

  }
  articleFeedback = self->_articleFeedback;
  if (articleFeedback)
  {
    -[NTPBArticleFeedback dictionaryRepresentation](articleFeedback, "dictionaryRepresentation");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v199, CFSTR("article_feedback"));

  }
  audioEngage = self->_audioEngage;
  if (audioEngage)
  {
    -[NTPBAudioEngage dictionaryRepresentation](audioEngage, "dictionaryRepresentation");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v201, CFSTR("audio_engage"));

  }
  audioEngagementCompleted = self->_audioEngagementCompleted;
  if (audioEngagementCompleted)
  {
    -[NTPBAudioEngagementCompleted dictionaryRepresentation](audioEngagementCompleted, "dictionaryRepresentation");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v203, CFSTR("audio_engagement_completed"));

  }
  purchaseOffersItem = self->_purchaseOffersItem;
  if (purchaseOffersItem)
  {
    -[NTPBPurchaseOffersItem dictionaryRepresentation](purchaseOffersItem, "dictionaryRepresentation");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v205, CFSTR("purchase_offers_item"));

  }
  feedLoad = self->_feedLoad;
  if (feedLoad)
  {
    -[NTPBFeedLoad dictionaryRepresentation](feedLoad, "dictionaryRepresentation");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v207, CFSTR("feed_load"));

  }
  v208 = v3;

  return v208;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEventObjectReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_userOnboardingBegin)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userOnboardingResume)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userOnboardingResult)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_appSessionStart)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_appSessionEnd)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_articleScroll)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_articleHostViewExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_articleLikeDislike)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_feedCellExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_feedViewExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_feedCellHostViewExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_feedSubscribeUnsubscribe)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mediaExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mediaView)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mediaEngage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mediaEngageComplete)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_searchBegin)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_searchExecute)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_searchResultSelect)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_shareResult)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_noUserAction)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_readingListAddRemove)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_readingListShow)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recommendationBrickExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_endOfArticleExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_reportConcernSubmission)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_localNotificationReturn)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_pullToRefresh)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_linkTapArticle)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_localNotificationReceived)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userOnboardingScreenView)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userOnboardingChannelPickerComplete)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_adExposureOpportunity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_channelMuteUnmute)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_shareSheetExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_feedEngagementMenuExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_searchViewExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_groupViewExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_paidSubscriptionConversionPointExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_paidSubscriptionSheetView)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_shareSheetIapFail)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_paidSubscriptionResult)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_shareInformationScreenView)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_webAccessScreenView)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_alreadySubscriberSignIn)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_backgroundSubscriptionValidation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_subscriptionDetectionScreenView)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_coverArticleWidgetView)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_notificationSubscribeUnsubscribe)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_notificationSettingsScreenView)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_emailOptInInvite)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_coverArticleWidgetExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_restorePaidSubscription)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_paidSubscriptionSheetIapFail)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_comscoreEventSend)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_discoverMoreInterstitialExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_articleViewNotw)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_articleScrollNotw)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_urlMappingMiss)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_bundleIdMappingMiss)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_externalAnalyticsEventSend)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_appSessionStartWatch)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_articleViewWatch)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_appSessionEndWatch)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_anfComponentExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_todayWidgetSession)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_widgetEngagement)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_todayWidgetHeadlineExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_todayWidgetExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_adExposureIneligible)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_optInButtonExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_suggestionsFeedback)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userIgnoreFavoritesSuggestion)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_articleEngagement)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_adImpression)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_adEngagement)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_adCtaEngagement)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_linkTap)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_topOfFeedModuleExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_inAppWebEmbedExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_tocExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_tocReorder)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_tocHandleTap)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_tocCardDrag)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_tocToggleTap)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_tocCellExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_appSessionResign)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_appSessionResume)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_articleSessionResign)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_articleSessionResume)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_bundleSubscriberInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_issueDownload)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_paywallButtonTap)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_pdfPageView)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_issueTocView)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_issueExposure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_appleidSignInResult)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_articleFeedback)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_audioEngage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_audioEngagementCompleted)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_purchaseOffersItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_feedLoad)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  void *v123;
  id v124;
  void *v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  id v130;
  void *v131;
  id v132;
  void *v133;
  id v134;
  void *v135;
  id v136;
  void *v137;
  id v138;
  void *v139;
  id v140;
  void *v141;
  id v142;
  void *v143;
  id v144;
  void *v145;
  id v146;
  void *v147;
  id v148;
  void *v149;
  id v150;
  void *v151;
  id v152;
  void *v153;
  id v154;
  void *v155;
  id v156;
  void *v157;
  id v158;
  void *v159;
  id v160;
  void *v161;
  id v162;
  void *v163;
  id v164;
  void *v165;
  id v166;
  void *v167;
  id v168;
  void *v169;
  id v170;
  void *v171;
  id v172;
  void *v173;
  id v174;
  void *v175;
  id v176;
  void *v177;
  id v178;
  void *v179;
  id v180;
  void *v181;
  id v182;
  void *v183;
  id v184;
  void *v185;
  id v186;
  void *v187;
  id v188;
  void *v189;
  id v190;
  void *v191;
  id v192;
  void *v193;
  id v194;
  void *v195;
  id v196;
  void *v197;
  id v198;
  void *v199;
  id v200;
  void *v201;
  id v202;
  void *v203;
  id v204;
  void *v205;
  id v206;
  void *v207;
  id v208;
  void *v209;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NTPBUserOnboardingBegin copyWithZone:](self->_userOnboardingBegin, "copyWithZone:", a3);
  v7 = (void *)v5[96];
  v5[96] = v6;

  v8 = -[NTPBUserOnboardingResume copyWithZone:](self->_userOnboardingResume, "copyWithZone:", a3);
  v9 = (void *)v5[99];
  v5[99] = v8;

  v10 = -[NTPBUserOnboardingResult copyWithZone:](self->_userOnboardingResult, "copyWithZone:", a3);
  v11 = (void *)v5[98];
  v5[98] = v10;

  v12 = -[NTPBAppSessionStart copyWithZone:](self->_appSessionStart, "copyWithZone:", a3);
  v13 = (void *)v5[12];
  v5[12] = v12;

  v14 = -[NTPBAppSessionEnd copyWithZone:](self->_appSessionEnd, "copyWithZone:", a3);
  v15 = (void *)v5[8];
  v5[8] = v14;

  v16 = -[NTPBArticleScroll copyWithZone:](self->_articleScroll, "copyWithZone:", a3);
  v17 = (void *)v5[19];
  v5[19] = v16;

  v18 = -[NTPBArticleHostViewExposure copyWithZone:](self->_articleHostViewExposure, "copyWithZone:", a3);
  v19 = (void *)v5[17];
  v5[17] = v18;

  v20 = -[NTPBArticleLikeDislike copyWithZone:](self->_articleLikeDislike, "copyWithZone:", a3);
  v21 = (void *)v5[18];
  v5[18] = v20;

  v22 = -[NTPBFeedCellExposure copyWithZone:](self->_feedCellExposure, "copyWithZone:", a3);
  v23 = (void *)v5[38];
  v5[38] = v22;

  v24 = -[NTPBFeedViewExposure copyWithZone:](self->_feedViewExposure, "copyWithZone:", a3);
  v25 = (void *)v5[43];
  v5[43] = v24;

  v26 = -[NTPBFeedCellHostViewExposure copyWithZone:](self->_feedCellHostViewExposure, "copyWithZone:", a3);
  v27 = (void *)v5[39];
  v5[39] = v26;

  v28 = -[NTPBFeedSubscribeUnsubscribe copyWithZone:](self->_feedSubscribeUnsubscribe, "copyWithZone:", a3);
  v29 = (void *)v5[42];
  v5[42] = v28;

  v30 = -[NTPBMediaExposure copyWithZone:](self->_mediaExposure, "copyWithZone:", a3);
  v31 = (void *)v5[55];
  v5[55] = v30;

  v32 = -[NTPBMediaView copyWithZone:](self->_mediaView, "copyWithZone:", a3);
  v33 = (void *)v5[56];
  v5[56] = v32;

  v34 = -[NTPBMediaEngage copyWithZone:](self->_mediaEngage, "copyWithZone:", a3);
  v35 = (void *)v5[53];
  v5[53] = v34;

  v36 = -[NTPBMediaEngageComplete copyWithZone:](self->_mediaEngageComplete, "copyWithZone:", a3);
  v37 = (void *)v5[54];
  v5[54] = v36;

  v38 = -[NTPBSearchBegin copyWithZone:](self->_searchBegin, "copyWithZone:", a3);
  v39 = (void *)v5[74];
  v5[74] = v38;

  v40 = -[NTPBSearchExecute copyWithZone:](self->_searchExecute, "copyWithZone:", a3);
  v41 = (void *)v5[75];
  v5[75] = v40;

  v42 = -[NTPBSearchResultSelect copyWithZone:](self->_searchResultSelect, "copyWithZone:", a3);
  v43 = (void *)v5[76];
  v5[76] = v42;

  v44 = -[NTPBShareResult copyWithZone:](self->_shareResult, "copyWithZone:", a3);
  v45 = (void *)v5[79];
  v5[79] = v44;

  v46 = -[NTPBNoUserAction copyWithZone:](self->_noUserAction, "copyWithZone:", a3);
  v47 = (void *)v5[57];
  v5[57] = v46;

  v48 = -[NTPBReadingListAddRemove copyWithZone:](self->_readingListAddRemove, "copyWithZone:", a3);
  v49 = (void *)v5[69];
  v5[69] = v48;

  v50 = -[NTPBReadingListShow copyWithZone:](self->_readingListShow, "copyWithZone:", a3);
  v51 = (void *)v5[70];
  v5[70] = v50;

  v52 = -[NTPBRecommendationBrickExposure copyWithZone:](self->_recommendationBrickExposure, "copyWithZone:", a3);
  v53 = (void *)v5[71];
  v5[71] = v52;

  v54 = -[NTPBEndOfArticleExposure copyWithZone:](self->_endOfArticleExposure, "copyWithZone:", a3);
  v55 = (void *)v5[36];
  v5[36] = v54;

  v56 = -[NTPBReportConcernSubmission copyWithZone:](self->_reportConcernSubmission, "copyWithZone:", a3);
  v57 = (void *)v5[72];
  v5[72] = v56;

  v58 = -[NTPBLocalNotificationReturn copyWithZone:](self->_localNotificationReturn, "copyWithZone:", a3);
  v59 = (void *)v5[52];
  v5[52] = v58;

  v60 = -[NTPBPullToRefresh copyWithZone:](self->_pullToRefresh, "copyWithZone:", a3);
  v61 = (void *)v5[67];
  v5[67] = v60;

  v62 = -[NTPBLinkTapArticle copyWithZone:](self->_linkTapArticle, "copyWithZone:", a3);
  v63 = (void *)v5[50];
  v5[50] = v62;

  v64 = -[NTPBLocalNotificationReceived copyWithZone:](self->_localNotificationReceived, "copyWithZone:", a3);
  v65 = (void *)v5[51];
  v5[51] = v64;

  v66 = -[NTPBUserOnboardingScreenView copyWithZone:](self->_userOnboardingScreenView, "copyWithZone:", a3);
  v67 = (void *)v5[100];
  v5[100] = v66;

  v68 = -[NTPBUserOnboardingChannelPickerComplete copyWithZone:](self->_userOnboardingChannelPickerComplete, "copyWithZone:", a3);
  v69 = (void *)v5[97];
  v5[97] = v68;

  v70 = -[NTPBAdExposureOpportunity copyWithZone:](self->_adExposureOpportunity, "copyWithZone:", a3);
  v71 = (void *)v5[4];
  v5[4] = v70;

  v72 = -[NTPBChannelMuteUnmute copyWithZone:](self->_channelMuteUnmute, "copyWithZone:", a3);
  v73 = (void *)v5[30];
  v5[30] = v72;

  v74 = -[NTPBShareSheetExposure copyWithZone:](self->_shareSheetExposure, "copyWithZone:", a3);
  v75 = (void *)v5[80];
  v5[80] = v74;

  v76 = -[NTPBFeedEngagementMenuExposure copyWithZone:](self->_feedEngagementMenuExposure, "copyWithZone:", a3);
  v77 = (void *)v5[40];
  v5[40] = v76;

  v78 = -[NTPBSearchViewExposure copyWithZone:](self->_searchViewExposure, "copyWithZone:", a3);
  v79 = (void *)v5[77];
  v5[77] = v78;

  v80 = -[NTPBGroupViewExposure copyWithZone:](self->_groupViewExposure, "copyWithZone:", a3);
  v81 = (void *)v5[44];
  v5[44] = v80;

  v82 = -[NTPBPaidSubscriptionConversionPointExposure copyWithZone:](self->_paidSubscriptionConversionPointExposure, "copyWithZone:", a3);
  v83 = (void *)v5[61];
  v5[61] = v82;

  v84 = -[NTPBPaidSubscriptionSheetView copyWithZone:](self->_paidSubscriptionSheetView, "copyWithZone:", a3);
  v85 = (void *)v5[64];
  v5[64] = v84;

  v86 = -[NTPBShareSheetIapFail copyWithZone:](self->_shareSheetIapFail, "copyWithZone:", a3);
  v87 = (void *)v5[81];
  v5[81] = v86;

  v88 = -[NTPBPaidSubscriptionResult copyWithZone:](self->_paidSubscriptionResult, "copyWithZone:", a3);
  v89 = (void *)v5[62];
  v5[62] = v88;

  v90 = -[NTPBShareInformationScreenView copyWithZone:](self->_shareInformationScreenView, "copyWithZone:", a3);
  v91 = (void *)v5[78];
  v5[78] = v90;

  v92 = -[NTPBWebAccessScreenView copyWithZone:](self->_webAccessScreenView, "copyWithZone:", a3);
  v93 = (void *)v5[101];
  v5[101] = v92;

  v94 = -[NTPBAlreadySubscriberSignIn copyWithZone:](self->_alreadySubscriberSignIn, "copyWithZone:", a3);
  v95 = (void *)v5[6];
  v5[6] = v94;

  v96 = -[NTPBBackgroundSubscriptionValidation copyWithZone:](self->_backgroundSubscriptionValidation, "copyWithZone:", a3);
  v97 = (void *)v5[27];
  v5[27] = v96;

  v98 = -[NTPBSubscriptionDetectionScreenView copyWithZone:](self->_subscriptionDetectionScreenView, "copyWithZone:", a3);
  v99 = (void *)v5[82];
  v5[82] = v98;

  v100 = -[NTPBCoverArticleWidgetView copyWithZone:](self->_coverArticleWidgetView, "copyWithZone:", a3);
  v101 = (void *)v5[33];
  v5[33] = v100;

  v102 = -[NTPBNotificationSubscribeUnsubscribe copyWithZone:](self->_notificationSubscribeUnsubscribe, "copyWithZone:", a3);
  v103 = (void *)v5[59];
  v5[59] = v102;

  v104 = -[NTPBNotificationSettingsScreenView copyWithZone:](self->_notificationSettingsScreenView, "copyWithZone:", a3);
  v105 = (void *)v5[58];
  v5[58] = v104;

  v106 = -[NTPBEmailOptInInvite copyWithZone:](self->_emailOptInInvite, "copyWithZone:", a3);
  v107 = (void *)v5[35];
  v5[35] = v106;

  v108 = -[NTPBCoverArticleWidgetExposure copyWithZone:](self->_coverArticleWidgetExposure, "copyWithZone:", a3);
  v109 = (void *)v5[32];
  v5[32] = v108;

  v110 = -[NTPBRestorePaidSubscription copyWithZone:](self->_restorePaidSubscription, "copyWithZone:", a3);
  v111 = (void *)v5[73];
  v5[73] = v110;

  v112 = -[NTPBPaidSubscriptionSheetIapFail copyWithZone:](self->_paidSubscriptionSheetIapFail, "copyWithZone:", a3);
  v113 = (void *)v5[63];
  v5[63] = v112;

  v114 = -[NTPBComscoreEventSend copyWithZone:](self->_comscoreEventSend, "copyWithZone:", a3);
  v115 = (void *)v5[31];
  v5[31] = v114;

  v116 = -[NTPBDiscoverMoreInterstitialExposure copyWithZone:](self->_discoverMoreInterstitialExposure, "copyWithZone:", a3);
  v117 = (void *)v5[34];
  v5[34] = v116;

  v118 = -[NTPBArticleViewNotw copyWithZone:](self->_articleViewNotw, "copyWithZone:", a3);
  v119 = (void *)v5[23];
  v5[23] = v118;

  v120 = -[NTPBArticleScrollNotw copyWithZone:](self->_articleScrollNotw, "copyWithZone:", a3);
  v121 = (void *)v5[20];
  v5[20] = v120;

  v122 = -[NTPBUrlMappingMiss copyWithZone:](self->_urlMappingMiss, "copyWithZone:", a3);
  v123 = (void *)v5[94];
  v5[94] = v122;

  v124 = -[NTPBBundleIdMappingMiss copyWithZone:](self->_bundleIdMappingMiss, "copyWithZone:", a3);
  v125 = (void *)v5[28];
  v5[28] = v124;

  v126 = -[NTPBExternalAnalyticsEventSend copyWithZone:](self->_externalAnalyticsEventSend, "copyWithZone:", a3);
  v127 = (void *)v5[37];
  v5[37] = v126;

  v128 = -[NTPBAppSessionStartWatch copyWithZone:](self->_appSessionStartWatch, "copyWithZone:", a3);
  v129 = (void *)v5[13];
  v5[13] = v128;

  v130 = -[NTPBArticleViewWatch copyWithZone:](self->_articleViewWatch, "copyWithZone:", a3);
  v131 = (void *)v5[24];
  v5[24] = v130;

  v132 = -[NTPBAppSessionEndWatch copyWithZone:](self->_appSessionEndWatch, "copyWithZone:", a3);
  v133 = (void *)v5[9];
  v5[9] = v132;

  v134 = -[NTPBAnfComponentExposure copyWithZone:](self->_anfComponentExposure, "copyWithZone:", a3);
  v135 = (void *)v5[7];
  v5[7] = v134;

  v136 = -[NTPBTodayWidgetSession copyWithZone:](self->_todayWidgetSession, "copyWithZone:", a3);
  v137 = (void *)v5[92];
  v5[92] = v136;

  v138 = -[NTPBWidgetEngagement copyWithZone:](self->_widgetEngagement, "copyWithZone:", a3);
  v139 = (void *)v5[102];
  v5[102] = v138;

  v140 = -[NTPBTodayWidgetHeadlineExposure copyWithZone:](self->_todayWidgetHeadlineExposure, "copyWithZone:", a3);
  v141 = (void *)v5[91];
  v5[91] = v140;

  v142 = -[NTPBTodayWidgetExposure copyWithZone:](self->_todayWidgetExposure, "copyWithZone:", a3);
  v143 = (void *)v5[90];
  v5[90] = v142;

  v144 = -[NTPBAdExposureIneligible copyWithZone:](self->_adExposureIneligible, "copyWithZone:", a3);
  v145 = (void *)v5[3];
  v5[3] = v144;

  v146 = -[NTPBOptInButtonExposure copyWithZone:](self->_optInButtonExposure, "copyWithZone:", a3);
  v147 = (void *)v5[60];
  v5[60] = v146;

  v148 = -[NTPBSuggestionsFeedback copyWithZone:](self->_suggestionsFeedback, "copyWithZone:", a3);
  v149 = (void *)v5[83];
  v5[83] = v148;

  v150 = -[NTPBUserIgnoreFavoritesSuggestion copyWithZone:](self->_userIgnoreFavoritesSuggestion, "copyWithZone:", a3);
  v151 = (void *)v5[95];
  v5[95] = v150;

  v152 = -[NTPBArticleEngagement copyWithZone:](self->_articleEngagement, "copyWithZone:", a3);
  v153 = (void *)v5[15];
  v5[15] = v152;

  v154 = -[NTPBAdImpression copyWithZone:](self->_adImpression, "copyWithZone:", a3);
  v155 = (void *)v5[5];
  v5[5] = v154;

  v156 = -[NTPBAdEngagement copyWithZone:](self->_adEngagement, "copyWithZone:", a3);
  v157 = (void *)v5[2];
  v5[2] = v156;

  v158 = -[NTPBAdCtaEngagement copyWithZone:](self->_adCtaEngagement, "copyWithZone:", a3);
  v159 = (void *)v5[1];
  v5[1] = v158;

  v160 = -[NTPBLinkTap copyWithZone:](self->_linkTap, "copyWithZone:", a3);
  v161 = (void *)v5[49];
  v5[49] = v160;

  v162 = -[NTPBTopOfFeedModuleExposure copyWithZone:](self->_topOfFeedModuleExposure, "copyWithZone:", a3);
  v163 = (void *)v5[93];
  v5[93] = v162;

  v164 = -[NTPBInAppWebEmbedExposure copyWithZone:](self->_inAppWebEmbedExposure, "copyWithZone:", a3);
  v165 = (void *)v5[45];
  v5[45] = v164;

  v166 = -[NTPBTocExposure copyWithZone:](self->_tocExposure, "copyWithZone:", a3);
  v167 = (void *)v5[86];
  v5[86] = v166;

  v168 = -[NTPBTocReorder copyWithZone:](self->_tocReorder, "copyWithZone:", a3);
  v169 = (void *)v5[88];
  v5[88] = v168;

  v170 = -[NTPBTocHandleTap copyWithZone:](self->_tocHandleTap, "copyWithZone:", a3);
  v171 = (void *)v5[87];
  v5[87] = v170;

  v172 = -[NTPBTocCardDrag copyWithZone:](self->_tocCardDrag, "copyWithZone:", a3);
  v173 = (void *)v5[84];
  v5[84] = v172;

  v174 = -[NTPBTocToggleTap copyWithZone:](self->_tocToggleTap, "copyWithZone:", a3);
  v175 = (void *)v5[89];
  v5[89] = v174;

  v176 = -[NTPBTocCellExposure copyWithZone:](self->_tocCellExposure, "copyWithZone:", a3);
  v177 = (void *)v5[85];
  v5[85] = v176;

  v178 = -[NTPBAppSessionResign copyWithZone:](self->_appSessionResign, "copyWithZone:", a3);
  v179 = (void *)v5[10];
  v5[10] = v178;

  v180 = -[NTPBAppSessionResume copyWithZone:](self->_appSessionResume, "copyWithZone:", a3);
  v181 = (void *)v5[11];
  v5[11] = v180;

  v182 = -[NTPBArticleSessionResign copyWithZone:](self->_articleSessionResign, "copyWithZone:", a3);
  v183 = (void *)v5[21];
  v5[21] = v182;

  v184 = -[NTPBArticleSessionResume copyWithZone:](self->_articleSessionResume, "copyWithZone:", a3);
  v185 = (void *)v5[22];
  v5[22] = v184;

  v186 = -[NTPBBundleSubscriberInfo copyWithZone:](self->_bundleSubscriberInfo, "copyWithZone:", a3);
  v187 = (void *)v5[29];
  v5[29] = v186;

  v188 = -[NTPBIssueDownload copyWithZone:](self->_issueDownload, "copyWithZone:", a3);
  v189 = (void *)v5[46];
  v5[46] = v188;

  v190 = -[NTPBPaywallButtonTap copyWithZone:](self->_paywallButtonTap, "copyWithZone:", a3);
  v191 = (void *)v5[65];
  v5[65] = v190;

  v192 = -[NTPBPDFPageView copyWithZone:](self->_pdfPageView, "copyWithZone:", a3);
  v193 = (void *)v5[66];
  v5[66] = v192;

  v194 = -[NTPBIssueTocView copyWithZone:](self->_issueTocView, "copyWithZone:", a3);
  v195 = (void *)v5[48];
  v5[48] = v194;

  v196 = -[NTPBIssueExposure copyWithZone:](self->_issueExposure, "copyWithZone:", a3);
  v197 = (void *)v5[47];
  v5[47] = v196;

  v198 = -[NTPBAppleIdSignInResult copyWithZone:](self->_appleidSignInResult, "copyWithZone:", a3);
  v199 = (void *)v5[14];
  v5[14] = v198;

  v200 = -[NTPBArticleFeedback copyWithZone:](self->_articleFeedback, "copyWithZone:", a3);
  v201 = (void *)v5[16];
  v5[16] = v200;

  v202 = -[NTPBAudioEngage copyWithZone:](self->_audioEngage, "copyWithZone:", a3);
  v203 = (void *)v5[25];
  v5[25] = v202;

  v204 = -[NTPBAudioEngagementCompleted copyWithZone:](self->_audioEngagementCompleted, "copyWithZone:", a3);
  v205 = (void *)v5[26];
  v5[26] = v204;

  v206 = -[NTPBPurchaseOffersItem copyWithZone:](self->_purchaseOffersItem, "copyWithZone:", a3);
  v207 = (void *)v5[68];
  v5[68] = v206;

  v208 = -[NTPBFeedLoad copyWithZone:](self->_feedLoad, "copyWithZone:", a3);
  v209 = (void *)v5[41];
  v5[41] = v208;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NTPBUserOnboardingBegin *userOnboardingBegin;
  NTPBUserOnboardingResume *userOnboardingResume;
  NTPBUserOnboardingResult *userOnboardingResult;
  NTPBAppSessionStart *appSessionStart;
  NTPBAppSessionEnd *appSessionEnd;
  NTPBArticleScroll *articleScroll;
  NTPBArticleHostViewExposure *articleHostViewExposure;
  NTPBArticleLikeDislike *articleLikeDislike;
  NTPBFeedCellExposure *feedCellExposure;
  NTPBFeedViewExposure *feedViewExposure;
  NTPBFeedCellHostViewExposure *feedCellHostViewExposure;
  NTPBFeedSubscribeUnsubscribe *feedSubscribeUnsubscribe;
  NTPBMediaExposure *mediaExposure;
  NTPBMediaView *mediaView;
  NTPBMediaEngage *mediaEngage;
  NTPBMediaEngageComplete *mediaEngageComplete;
  NTPBSearchBegin *searchBegin;
  NTPBSearchExecute *searchExecute;
  NTPBSearchResultSelect *searchResultSelect;
  NTPBShareResult *shareResult;
  NTPBNoUserAction *noUserAction;
  NTPBReadingListAddRemove *readingListAddRemove;
  NTPBReadingListShow *readingListShow;
  NTPBRecommendationBrickExposure *recommendationBrickExposure;
  NTPBEndOfArticleExposure *endOfArticleExposure;
  NTPBReportConcernSubmission *reportConcernSubmission;
  NTPBLocalNotificationReturn *localNotificationReturn;
  NTPBPullToRefresh *pullToRefresh;
  NTPBLinkTapArticle *linkTapArticle;
  NTPBLocalNotificationReceived *localNotificationReceived;
  NTPBUserOnboardingScreenView *userOnboardingScreenView;
  NTPBUserOnboardingChannelPickerComplete *userOnboardingChannelPickerComplete;
  NTPBAdExposureOpportunity *adExposureOpportunity;
  NTPBChannelMuteUnmute *channelMuteUnmute;
  NTPBShareSheetExposure *shareSheetExposure;
  NTPBFeedEngagementMenuExposure *feedEngagementMenuExposure;
  NTPBSearchViewExposure *searchViewExposure;
  NTPBGroupViewExposure *groupViewExposure;
  NTPBPaidSubscriptionConversionPointExposure *paidSubscriptionConversionPointExposure;
  NTPBPaidSubscriptionSheetView *paidSubscriptionSheetView;
  NTPBShareSheetIapFail *shareSheetIapFail;
  NTPBPaidSubscriptionResult *paidSubscriptionResult;
  NTPBShareInformationScreenView *shareInformationScreenView;
  NTPBWebAccessScreenView *webAccessScreenView;
  NTPBAlreadySubscriberSignIn *alreadySubscriberSignIn;
  NTPBBackgroundSubscriptionValidation *backgroundSubscriptionValidation;
  NTPBSubscriptionDetectionScreenView *subscriptionDetectionScreenView;
  NTPBCoverArticleWidgetView *coverArticleWidgetView;
  NTPBNotificationSubscribeUnsubscribe *notificationSubscribeUnsubscribe;
  NTPBNotificationSettingsScreenView *notificationSettingsScreenView;
  NTPBEmailOptInInvite *emailOptInInvite;
  NTPBCoverArticleWidgetExposure *coverArticleWidgetExposure;
  NTPBRestorePaidSubscription *restorePaidSubscription;
  NTPBPaidSubscriptionSheetIapFail *paidSubscriptionSheetIapFail;
  NTPBComscoreEventSend *comscoreEventSend;
  NTPBDiscoverMoreInterstitialExposure *discoverMoreInterstitialExposure;
  NTPBArticleViewNotw *articleViewNotw;
  NTPBArticleScrollNotw *articleScrollNotw;
  NTPBUrlMappingMiss *urlMappingMiss;
  NTPBBundleIdMappingMiss *bundleIdMappingMiss;
  NTPBExternalAnalyticsEventSend *externalAnalyticsEventSend;
  NTPBAppSessionStartWatch *appSessionStartWatch;
  NTPBArticleViewWatch *articleViewWatch;
  NTPBAppSessionEndWatch *appSessionEndWatch;
  NTPBAnfComponentExposure *anfComponentExposure;
  NTPBTodayWidgetSession *todayWidgetSession;
  NTPBWidgetEngagement *widgetEngagement;
  NTPBTodayWidgetHeadlineExposure *todayWidgetHeadlineExposure;
  NTPBTodayWidgetExposure *todayWidgetExposure;
  NTPBAdExposureIneligible *adExposureIneligible;
  NTPBOptInButtonExposure *optInButtonExposure;
  NTPBSuggestionsFeedback *suggestionsFeedback;
  NTPBUserIgnoreFavoritesSuggestion *userIgnoreFavoritesSuggestion;
  NTPBArticleEngagement *articleEngagement;
  NTPBAdImpression *adImpression;
  NTPBAdEngagement *adEngagement;
  NTPBAdCtaEngagement *adCtaEngagement;
  NTPBLinkTap *linkTap;
  NTPBTopOfFeedModuleExposure *topOfFeedModuleExposure;
  NTPBInAppWebEmbedExposure *inAppWebEmbedExposure;
  NTPBTocExposure *tocExposure;
  NTPBTocReorder *tocReorder;
  NTPBTocHandleTap *tocHandleTap;
  NTPBTocCardDrag *tocCardDrag;
  NTPBTocToggleTap *tocToggleTap;
  NTPBTocCellExposure *tocCellExposure;
  NTPBAppSessionResign *appSessionResign;
  NTPBAppSessionResume *appSessionResume;
  NTPBArticleSessionResign *articleSessionResign;
  NTPBArticleSessionResume *articleSessionResume;
  NTPBBundleSubscriberInfo *bundleSubscriberInfo;
  NTPBIssueDownload *issueDownload;
  NTPBPaywallButtonTap *paywallButtonTap;
  NTPBPDFPageView *pdfPageView;
  NTPBIssueTocView *issueTocView;
  NTPBIssueExposure *issueExposure;
  NTPBAppleIdSignInResult *appleidSignInResult;
  NTPBArticleFeedback *articleFeedback;
  NTPBAudioEngage *audioEngage;
  NTPBAudioEngagementCompleted *audioEngagementCompleted;
  NTPBPurchaseOffersItem *purchaseOffersItem;
  NTPBFeedLoad *feedLoad;
  char v107;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_206;
  userOnboardingBegin = self->_userOnboardingBegin;
  if ((unint64_t)userOnboardingBegin | v4[96])
  {
    if (!-[NTPBUserOnboardingBegin isEqual:](userOnboardingBegin, "isEqual:"))
      goto LABEL_206;
  }
  userOnboardingResume = self->_userOnboardingResume;
  if ((unint64_t)userOnboardingResume | v4[99]
    && !-[NTPBUserOnboardingResume isEqual:](userOnboardingResume, "isEqual:"))
  {
    goto LABEL_206;
  }
  userOnboardingResult = self->_userOnboardingResult;
  if ((unint64_t)userOnboardingResult | v4[98]
    && !-[NTPBUserOnboardingResult isEqual:](userOnboardingResult, "isEqual:"))
  {
    goto LABEL_206;
  }
  appSessionStart = self->_appSessionStart;
  if ((unint64_t)appSessionStart | v4[12] && !-[NTPBAppSessionStart isEqual:](appSessionStart, "isEqual:"))
    goto LABEL_206;
  appSessionEnd = self->_appSessionEnd;
  if ((unint64_t)appSessionEnd | v4[8] && !-[NTPBAppSessionEnd isEqual:](appSessionEnd, "isEqual:"))
    goto LABEL_206;
  articleScroll = self->_articleScroll;
  if ((unint64_t)articleScroll | v4[19] && !-[NTPBArticleScroll isEqual:](articleScroll, "isEqual:"))
    goto LABEL_206;
  articleHostViewExposure = self->_articleHostViewExposure;
  if ((unint64_t)articleHostViewExposure | v4[17]
    && !-[NTPBArticleHostViewExposure isEqual:](articleHostViewExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  articleLikeDislike = self->_articleLikeDislike;
  if ((unint64_t)articleLikeDislike | v4[18]
    && !-[NTPBArticleLikeDislike isEqual:](articleLikeDislike, "isEqual:"))
  {
    goto LABEL_206;
  }
  feedCellExposure = self->_feedCellExposure;
  if ((unint64_t)feedCellExposure | v4[38] && !-[NTPBFeedCellExposure isEqual:](feedCellExposure, "isEqual:"))
    goto LABEL_206;
  feedViewExposure = self->_feedViewExposure;
  if ((unint64_t)feedViewExposure | v4[43] && !-[NTPBFeedViewExposure isEqual:](feedViewExposure, "isEqual:"))
    goto LABEL_206;
  feedCellHostViewExposure = self->_feedCellHostViewExposure;
  if ((unint64_t)feedCellHostViewExposure | v4[39]
    && !-[NTPBFeedCellHostViewExposure isEqual:](feedCellHostViewExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  feedSubscribeUnsubscribe = self->_feedSubscribeUnsubscribe;
  if ((unint64_t)feedSubscribeUnsubscribe | v4[42]
    && !-[NTPBFeedSubscribeUnsubscribe isEqual:](feedSubscribeUnsubscribe, "isEqual:"))
  {
    goto LABEL_206;
  }
  mediaExposure = self->_mediaExposure;
  if ((unint64_t)mediaExposure | v4[55] && !-[NTPBMediaExposure isEqual:](mediaExposure, "isEqual:"))
    goto LABEL_206;
  mediaView = self->_mediaView;
  if ((unint64_t)mediaView | v4[56] && !-[NTPBMediaView isEqual:](mediaView, "isEqual:"))
    goto LABEL_206;
  mediaEngage = self->_mediaEngage;
  if ((unint64_t)mediaEngage | v4[53] && !-[NTPBMediaEngage isEqual:](mediaEngage, "isEqual:"))
    goto LABEL_206;
  mediaEngageComplete = self->_mediaEngageComplete;
  if ((unint64_t)mediaEngageComplete | v4[54]
    && !-[NTPBMediaEngageComplete isEqual:](mediaEngageComplete, "isEqual:"))
  {
    goto LABEL_206;
  }
  searchBegin = self->_searchBegin;
  if ((unint64_t)searchBegin | v4[74] && !-[NTPBSearchBegin isEqual:](searchBegin, "isEqual:"))
    goto LABEL_206;
  searchExecute = self->_searchExecute;
  if ((unint64_t)searchExecute | v4[75] && !-[NTPBSearchExecute isEqual:](searchExecute, "isEqual:"))
    goto LABEL_206;
  searchResultSelect = self->_searchResultSelect;
  if ((unint64_t)searchResultSelect | v4[76]
    && !-[NTPBSearchResultSelect isEqual:](searchResultSelect, "isEqual:"))
  {
    goto LABEL_206;
  }
  shareResult = self->_shareResult;
  if ((unint64_t)shareResult | v4[79] && !-[NTPBShareResult isEqual:](shareResult, "isEqual:"))
    goto LABEL_206;
  noUserAction = self->_noUserAction;
  if ((unint64_t)noUserAction | v4[57] && !-[NTPBNoUserAction isEqual:](noUserAction, "isEqual:"))
    goto LABEL_206;
  readingListAddRemove = self->_readingListAddRemove;
  if ((unint64_t)readingListAddRemove | v4[69]
    && !-[NTPBReadingListAddRemove isEqual:](readingListAddRemove, "isEqual:"))
  {
    goto LABEL_206;
  }
  readingListShow = self->_readingListShow;
  if ((unint64_t)readingListShow | v4[70] && !-[NTPBReadingListShow isEqual:](readingListShow, "isEqual:"))
    goto LABEL_206;
  recommendationBrickExposure = self->_recommendationBrickExposure;
  if ((unint64_t)recommendationBrickExposure | v4[71]
    && !-[NTPBRecommendationBrickExposure isEqual:](recommendationBrickExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  endOfArticleExposure = self->_endOfArticleExposure;
  if ((unint64_t)endOfArticleExposure | v4[36]
    && !-[NTPBEndOfArticleExposure isEqual:](endOfArticleExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  reportConcernSubmission = self->_reportConcernSubmission;
  if ((unint64_t)reportConcernSubmission | v4[72]
    && !-[NTPBReportConcernSubmission isEqual:](reportConcernSubmission, "isEqual:"))
  {
    goto LABEL_206;
  }
  localNotificationReturn = self->_localNotificationReturn;
  if ((unint64_t)localNotificationReturn | v4[52]
    && !-[NTPBLocalNotificationReturn isEqual:](localNotificationReturn, "isEqual:"))
  {
    goto LABEL_206;
  }
  pullToRefresh = self->_pullToRefresh;
  if ((unint64_t)pullToRefresh | v4[67] && !-[NTPBPullToRefresh isEqual:](pullToRefresh, "isEqual:"))
    goto LABEL_206;
  linkTapArticle = self->_linkTapArticle;
  if ((unint64_t)linkTapArticle | v4[50] && !-[NTPBLinkTapArticle isEqual:](linkTapArticle, "isEqual:"))
    goto LABEL_206;
  localNotificationReceived = self->_localNotificationReceived;
  if ((unint64_t)localNotificationReceived | v4[51]
    && !-[NTPBLocalNotificationReceived isEqual:](localNotificationReceived, "isEqual:"))
  {
    goto LABEL_206;
  }
  userOnboardingScreenView = self->_userOnboardingScreenView;
  if ((unint64_t)userOnboardingScreenView | v4[100]
    && !-[NTPBUserOnboardingScreenView isEqual:](userOnboardingScreenView, "isEqual:"))
  {
    goto LABEL_206;
  }
  userOnboardingChannelPickerComplete = self->_userOnboardingChannelPickerComplete;
  if ((unint64_t)userOnboardingChannelPickerComplete | v4[97]
    && !-[NTPBUserOnboardingChannelPickerComplete isEqual:](userOnboardingChannelPickerComplete, "isEqual:"))
  {
    goto LABEL_206;
  }
  adExposureOpportunity = self->_adExposureOpportunity;
  if ((unint64_t)adExposureOpportunity | v4[4]
    && !-[NTPBAdExposureOpportunity isEqual:](adExposureOpportunity, "isEqual:"))
  {
    goto LABEL_206;
  }
  channelMuteUnmute = self->_channelMuteUnmute;
  if ((unint64_t)channelMuteUnmute | v4[30] && !-[NTPBChannelMuteUnmute isEqual:](channelMuteUnmute, "isEqual:"))
    goto LABEL_206;
  shareSheetExposure = self->_shareSheetExposure;
  if ((unint64_t)shareSheetExposure | v4[80]
    && !-[NTPBShareSheetExposure isEqual:](shareSheetExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  feedEngagementMenuExposure = self->_feedEngagementMenuExposure;
  if ((unint64_t)feedEngagementMenuExposure | v4[40]
    && !-[NTPBFeedEngagementMenuExposure isEqual:](feedEngagementMenuExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  searchViewExposure = self->_searchViewExposure;
  if ((unint64_t)searchViewExposure | v4[77]
    && !-[NTPBSearchViewExposure isEqual:](searchViewExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  groupViewExposure = self->_groupViewExposure;
  if ((unint64_t)groupViewExposure | v4[44] && !-[NTPBGroupViewExposure isEqual:](groupViewExposure, "isEqual:"))
    goto LABEL_206;
  paidSubscriptionConversionPointExposure = self->_paidSubscriptionConversionPointExposure;
  if ((unint64_t)paidSubscriptionConversionPointExposure | v4[61]
    && !-[NTPBPaidSubscriptionConversionPointExposure isEqual:](paidSubscriptionConversionPointExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  paidSubscriptionSheetView = self->_paidSubscriptionSheetView;
  if ((unint64_t)paidSubscriptionSheetView | v4[64]
    && !-[NTPBPaidSubscriptionSheetView isEqual:](paidSubscriptionSheetView, "isEqual:"))
  {
    goto LABEL_206;
  }
  shareSheetIapFail = self->_shareSheetIapFail;
  if ((unint64_t)shareSheetIapFail | v4[81] && !-[NTPBShareSheetIapFail isEqual:](shareSheetIapFail, "isEqual:"))
    goto LABEL_206;
  paidSubscriptionResult = self->_paidSubscriptionResult;
  if ((unint64_t)paidSubscriptionResult | v4[62]
    && !-[NTPBPaidSubscriptionResult isEqual:](paidSubscriptionResult, "isEqual:"))
  {
    goto LABEL_206;
  }
  shareInformationScreenView = self->_shareInformationScreenView;
  if ((unint64_t)shareInformationScreenView | v4[78]
    && !-[NTPBShareInformationScreenView isEqual:](shareInformationScreenView, "isEqual:"))
  {
    goto LABEL_206;
  }
  webAccessScreenView = self->_webAccessScreenView;
  if ((unint64_t)webAccessScreenView | v4[101]
    && !-[NTPBWebAccessScreenView isEqual:](webAccessScreenView, "isEqual:"))
  {
    goto LABEL_206;
  }
  alreadySubscriberSignIn = self->_alreadySubscriberSignIn;
  if ((unint64_t)alreadySubscriberSignIn | v4[6]
    && !-[NTPBAlreadySubscriberSignIn isEqual:](alreadySubscriberSignIn, "isEqual:"))
  {
    goto LABEL_206;
  }
  backgroundSubscriptionValidation = self->_backgroundSubscriptionValidation;
  if ((unint64_t)backgroundSubscriptionValidation | v4[27]
    && !-[NTPBBackgroundSubscriptionValidation isEqual:](backgroundSubscriptionValidation, "isEqual:"))
  {
    goto LABEL_206;
  }
  subscriptionDetectionScreenView = self->_subscriptionDetectionScreenView;
  if ((unint64_t)subscriptionDetectionScreenView | v4[82]
    && !-[NTPBSubscriptionDetectionScreenView isEqual:](subscriptionDetectionScreenView, "isEqual:"))
  {
    goto LABEL_206;
  }
  coverArticleWidgetView = self->_coverArticleWidgetView;
  if ((unint64_t)coverArticleWidgetView | v4[33]
    && !-[NTPBCoverArticleWidgetView isEqual:](coverArticleWidgetView, "isEqual:"))
  {
    goto LABEL_206;
  }
  notificationSubscribeUnsubscribe = self->_notificationSubscribeUnsubscribe;
  if ((unint64_t)notificationSubscribeUnsubscribe | v4[59]
    && !-[NTPBNotificationSubscribeUnsubscribe isEqual:](notificationSubscribeUnsubscribe, "isEqual:"))
  {
    goto LABEL_206;
  }
  notificationSettingsScreenView = self->_notificationSettingsScreenView;
  if ((unint64_t)notificationSettingsScreenView | v4[58]
    && !-[NTPBNotificationSettingsScreenView isEqual:](notificationSettingsScreenView, "isEqual:"))
  {
    goto LABEL_206;
  }
  emailOptInInvite = self->_emailOptInInvite;
  if ((unint64_t)emailOptInInvite | v4[35] && !-[NTPBEmailOptInInvite isEqual:](emailOptInInvite, "isEqual:"))
    goto LABEL_206;
  coverArticleWidgetExposure = self->_coverArticleWidgetExposure;
  if ((unint64_t)coverArticleWidgetExposure | v4[32]
    && !-[NTPBCoverArticleWidgetExposure isEqual:](coverArticleWidgetExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  restorePaidSubscription = self->_restorePaidSubscription;
  if ((unint64_t)restorePaidSubscription | v4[73]
    && !-[NTPBRestorePaidSubscription isEqual:](restorePaidSubscription, "isEqual:"))
  {
    goto LABEL_206;
  }
  paidSubscriptionSheetIapFail = self->_paidSubscriptionSheetIapFail;
  if ((unint64_t)paidSubscriptionSheetIapFail | v4[63]
    && !-[NTPBPaidSubscriptionSheetIapFail isEqual:](paidSubscriptionSheetIapFail, "isEqual:"))
  {
    goto LABEL_206;
  }
  comscoreEventSend = self->_comscoreEventSend;
  if ((unint64_t)comscoreEventSend | v4[31] && !-[NTPBComscoreEventSend isEqual:](comscoreEventSend, "isEqual:"))
    goto LABEL_206;
  discoverMoreInterstitialExposure = self->_discoverMoreInterstitialExposure;
  if ((unint64_t)discoverMoreInterstitialExposure | v4[34]
    && !-[NTPBDiscoverMoreInterstitialExposure isEqual:](discoverMoreInterstitialExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  articleViewNotw = self->_articleViewNotw;
  if ((unint64_t)articleViewNotw | v4[23] && !-[NTPBArticleViewNotw isEqual:](articleViewNotw, "isEqual:"))
    goto LABEL_206;
  articleScrollNotw = self->_articleScrollNotw;
  if ((unint64_t)articleScrollNotw | v4[20] && !-[NTPBArticleScrollNotw isEqual:](articleScrollNotw, "isEqual:"))
    goto LABEL_206;
  urlMappingMiss = self->_urlMappingMiss;
  if ((unint64_t)urlMappingMiss | v4[94] && !-[NTPBUrlMappingMiss isEqual:](urlMappingMiss, "isEqual:"))
    goto LABEL_206;
  bundleIdMappingMiss = self->_bundleIdMappingMiss;
  if ((unint64_t)bundleIdMappingMiss | v4[28]
    && !-[NTPBBundleIdMappingMiss isEqual:](bundleIdMappingMiss, "isEqual:"))
  {
    goto LABEL_206;
  }
  externalAnalyticsEventSend = self->_externalAnalyticsEventSend;
  if ((unint64_t)externalAnalyticsEventSend | v4[37]
    && !-[NTPBExternalAnalyticsEventSend isEqual:](externalAnalyticsEventSend, "isEqual:"))
  {
    goto LABEL_206;
  }
  appSessionStartWatch = self->_appSessionStartWatch;
  if ((unint64_t)appSessionStartWatch | v4[13]
    && !-[NTPBAppSessionStartWatch isEqual:](appSessionStartWatch, "isEqual:"))
  {
    goto LABEL_206;
  }
  articleViewWatch = self->_articleViewWatch;
  if ((unint64_t)articleViewWatch | v4[24] && !-[NTPBArticleViewWatch isEqual:](articleViewWatch, "isEqual:"))
    goto LABEL_206;
  appSessionEndWatch = self->_appSessionEndWatch;
  if ((unint64_t)appSessionEndWatch | v4[9]
    && !-[NTPBAppSessionEndWatch isEqual:](appSessionEndWatch, "isEqual:"))
  {
    goto LABEL_206;
  }
  anfComponentExposure = self->_anfComponentExposure;
  if ((unint64_t)anfComponentExposure | v4[7]
    && !-[NTPBAnfComponentExposure isEqual:](anfComponentExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  todayWidgetSession = self->_todayWidgetSession;
  if ((unint64_t)todayWidgetSession | v4[92]
    && !-[NTPBTodayWidgetSession isEqual:](todayWidgetSession, "isEqual:"))
  {
    goto LABEL_206;
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | v4[102] && !-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:"))
    goto LABEL_206;
  todayWidgetHeadlineExposure = self->_todayWidgetHeadlineExposure;
  if ((unint64_t)todayWidgetHeadlineExposure | v4[91]
    && !-[NTPBTodayWidgetHeadlineExposure isEqual:](todayWidgetHeadlineExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  todayWidgetExposure = self->_todayWidgetExposure;
  if ((unint64_t)todayWidgetExposure | v4[90]
    && !-[NTPBTodayWidgetExposure isEqual:](todayWidgetExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  adExposureIneligible = self->_adExposureIneligible;
  if ((unint64_t)adExposureIneligible | v4[3]
    && !-[NTPBAdExposureIneligible isEqual:](adExposureIneligible, "isEqual:"))
  {
    goto LABEL_206;
  }
  optInButtonExposure = self->_optInButtonExposure;
  if ((unint64_t)optInButtonExposure | v4[60]
    && !-[NTPBOptInButtonExposure isEqual:](optInButtonExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  suggestionsFeedback = self->_suggestionsFeedback;
  if ((unint64_t)suggestionsFeedback | v4[83]
    && !-[NTPBSuggestionsFeedback isEqual:](suggestionsFeedback, "isEqual:"))
  {
    goto LABEL_206;
  }
  userIgnoreFavoritesSuggestion = self->_userIgnoreFavoritesSuggestion;
  if ((unint64_t)userIgnoreFavoritesSuggestion | v4[95]
    && !-[NTPBUserIgnoreFavoritesSuggestion isEqual:](userIgnoreFavoritesSuggestion, "isEqual:"))
  {
    goto LABEL_206;
  }
  articleEngagement = self->_articleEngagement;
  if ((unint64_t)articleEngagement | v4[15] && !-[NTPBArticleEngagement isEqual:](articleEngagement, "isEqual:"))
    goto LABEL_206;
  adImpression = self->_adImpression;
  if ((unint64_t)adImpression | v4[5] && !-[NTPBAdImpression isEqual:](adImpression, "isEqual:"))
    goto LABEL_206;
  adEngagement = self->_adEngagement;
  if ((unint64_t)adEngagement | v4[2] && !-[NTPBAdEngagement isEqual:](adEngagement, "isEqual:"))
    goto LABEL_206;
  adCtaEngagement = self->_adCtaEngagement;
  if ((unint64_t)adCtaEngagement | v4[1] && !-[NTPBAdCtaEngagement isEqual:](adCtaEngagement, "isEqual:"))
    goto LABEL_206;
  linkTap = self->_linkTap;
  if ((unint64_t)linkTap | v4[49] && !-[NTPBLinkTap isEqual:](linkTap, "isEqual:"))
    goto LABEL_206;
  topOfFeedModuleExposure = self->_topOfFeedModuleExposure;
  if ((unint64_t)topOfFeedModuleExposure | v4[93]
    && !-[NTPBTopOfFeedModuleExposure isEqual:](topOfFeedModuleExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  inAppWebEmbedExposure = self->_inAppWebEmbedExposure;
  if ((unint64_t)inAppWebEmbedExposure | v4[45]
    && !-[NTPBInAppWebEmbedExposure isEqual:](inAppWebEmbedExposure, "isEqual:"))
  {
    goto LABEL_206;
  }
  tocExposure = self->_tocExposure;
  if ((unint64_t)tocExposure | v4[86] && !-[NTPBTocExposure isEqual:](tocExposure, "isEqual:"))
    goto LABEL_206;
  tocReorder = self->_tocReorder;
  if ((unint64_t)tocReorder | v4[88] && !-[NTPBTocReorder isEqual:](tocReorder, "isEqual:"))
    goto LABEL_206;
  tocHandleTap = self->_tocHandleTap;
  if ((unint64_t)tocHandleTap | v4[87] && !-[NTPBTocHandleTap isEqual:](tocHandleTap, "isEqual:"))
    goto LABEL_206;
  tocCardDrag = self->_tocCardDrag;
  if ((unint64_t)tocCardDrag | v4[84] && !-[NTPBTocCardDrag isEqual:](tocCardDrag, "isEqual:"))
    goto LABEL_206;
  tocToggleTap = self->_tocToggleTap;
  if ((unint64_t)tocToggleTap | v4[89] && !-[NTPBTocToggleTap isEqual:](tocToggleTap, "isEqual:"))
    goto LABEL_206;
  tocCellExposure = self->_tocCellExposure;
  if ((unint64_t)tocCellExposure | v4[85] && !-[NTPBTocCellExposure isEqual:](tocCellExposure, "isEqual:"))
    goto LABEL_206;
  appSessionResign = self->_appSessionResign;
  if ((unint64_t)appSessionResign | v4[10] && !-[NTPBAppSessionResign isEqual:](appSessionResign, "isEqual:"))
    goto LABEL_206;
  appSessionResume = self->_appSessionResume;
  if ((unint64_t)appSessionResume | v4[11] && !-[NTPBAppSessionResume isEqual:](appSessionResume, "isEqual:"))
    goto LABEL_206;
  articleSessionResign = self->_articleSessionResign;
  if ((unint64_t)articleSessionResign | v4[21]
    && !-[NTPBArticleSessionResign isEqual:](articleSessionResign, "isEqual:"))
  {
    goto LABEL_206;
  }
  articleSessionResume = self->_articleSessionResume;
  if ((unint64_t)articleSessionResume | v4[22]
    && !-[NTPBArticleSessionResume isEqual:](articleSessionResume, "isEqual:"))
  {
    goto LABEL_206;
  }
  bundleSubscriberInfo = self->_bundleSubscriberInfo;
  if ((unint64_t)bundleSubscriberInfo | v4[29]
    && !-[NTPBBundleSubscriberInfo isEqual:](bundleSubscriberInfo, "isEqual:"))
  {
    goto LABEL_206;
  }
  issueDownload = self->_issueDownload;
  if ((unint64_t)issueDownload | v4[46] && !-[NTPBIssueDownload isEqual:](issueDownload, "isEqual:"))
    goto LABEL_206;
  paywallButtonTap = self->_paywallButtonTap;
  if ((unint64_t)paywallButtonTap | v4[65] && !-[NTPBPaywallButtonTap isEqual:](paywallButtonTap, "isEqual:"))
    goto LABEL_206;
  pdfPageView = self->_pdfPageView;
  if ((unint64_t)pdfPageView | v4[66] && !-[NTPBPDFPageView isEqual:](pdfPageView, "isEqual:"))
    goto LABEL_206;
  if (((issueTocView = self->_issueTocView, !((unint64_t)issueTocView | v4[48]))
     || -[NTPBIssueTocView isEqual:](issueTocView, "isEqual:"))
    && ((issueExposure = self->_issueExposure, !((unint64_t)issueExposure | v4[47]))
     || -[NTPBIssueExposure isEqual:](issueExposure, "isEqual:"))
    && ((appleidSignInResult = self->_appleidSignInResult, !((unint64_t)appleidSignInResult | v4[14]))
     || -[NTPBAppleIdSignInResult isEqual:](appleidSignInResult, "isEqual:"))
    && ((articleFeedback = self->_articleFeedback, !((unint64_t)articleFeedback | v4[16]))
     || -[NTPBArticleFeedback isEqual:](articleFeedback, "isEqual:"))
    && ((audioEngage = self->_audioEngage, !((unint64_t)audioEngage | v4[25]))
     || -[NTPBAudioEngage isEqual:](audioEngage, "isEqual:"))
    && ((audioEngagementCompleted = self->_audioEngagementCompleted,
         !((unint64_t)audioEngagementCompleted | v4[26]))
     || -[NTPBAudioEngagementCompleted isEqual:](audioEngagementCompleted, "isEqual:"))
    && ((purchaseOffersItem = self->_purchaseOffersItem, !((unint64_t)purchaseOffersItem | v4[68]))
     || -[NTPBPurchaseOffersItem isEqual:](purchaseOffersItem, "isEqual:")))
  {
    feedLoad = self->_feedLoad;
    if ((unint64_t)feedLoad | v4[41])
      v107 = -[NTPBFeedLoad isEqual:](feedLoad, "isEqual:");
    else
      v107 = 1;
  }
  else
  {
LABEL_206:
    v107 = 0;
  }

  return v107;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;

  v3 = -[NTPBUserOnboardingBegin hash](self->_userOnboardingBegin, "hash");
  v4 = -[NTPBUserOnboardingResume hash](self->_userOnboardingResume, "hash") ^ v3;
  v5 = -[NTPBUserOnboardingResult hash](self->_userOnboardingResult, "hash");
  v6 = v4 ^ v5 ^ -[NTPBAppSessionStart hash](self->_appSessionStart, "hash");
  v7 = -[NTPBAppSessionEnd hash](self->_appSessionEnd, "hash");
  v8 = v7 ^ -[NTPBArticleScroll hash](self->_articleScroll, "hash");
  v9 = v6 ^ v8 ^ -[NTPBArticleHostViewExposure hash](self->_articleHostViewExposure, "hash");
  v10 = -[NTPBArticleLikeDislike hash](self->_articleLikeDislike, "hash");
  v11 = v10 ^ -[NTPBFeedCellExposure hash](self->_feedCellExposure, "hash");
  v12 = v11 ^ -[NTPBFeedViewExposure hash](self->_feedViewExposure, "hash");
  v13 = v9 ^ v12 ^ -[NTPBFeedCellHostViewExposure hash](self->_feedCellHostViewExposure, "hash");
  v14 = -[NTPBFeedSubscribeUnsubscribe hash](self->_feedSubscribeUnsubscribe, "hash");
  v15 = v14 ^ -[NTPBMediaExposure hash](self->_mediaExposure, "hash");
  v16 = v15 ^ -[NTPBMediaView hash](self->_mediaView, "hash");
  v17 = v16 ^ -[NTPBMediaEngage hash](self->_mediaEngage, "hash");
  v18 = v13 ^ v17 ^ -[NTPBMediaEngageComplete hash](self->_mediaEngageComplete, "hash");
  v19 = -[NTPBSearchBegin hash](self->_searchBegin, "hash");
  v20 = v19 ^ -[NTPBSearchExecute hash](self->_searchExecute, "hash");
  v21 = v20 ^ -[NTPBSearchResultSelect hash](self->_searchResultSelect, "hash");
  v22 = v21 ^ -[NTPBShareResult hash](self->_shareResult, "hash");
  v23 = v22 ^ -[NTPBNoUserAction hash](self->_noUserAction, "hash");
  v24 = v18 ^ v23 ^ -[NTPBReadingListAddRemove hash](self->_readingListAddRemove, "hash");
  v25 = -[NTPBReadingListShow hash](self->_readingListShow, "hash");
  v26 = v25 ^ -[NTPBRecommendationBrickExposure hash](self->_recommendationBrickExposure, "hash");
  v27 = v26 ^ -[NTPBEndOfArticleExposure hash](self->_endOfArticleExposure, "hash");
  v28 = v27 ^ -[NTPBReportConcernSubmission hash](self->_reportConcernSubmission, "hash");
  v29 = v28 ^ -[NTPBLocalNotificationReturn hash](self->_localNotificationReturn, "hash");
  v30 = v29 ^ -[NTPBPullToRefresh hash](self->_pullToRefresh, "hash");
  v31 = v24 ^ v30 ^ -[NTPBLinkTapArticle hash](self->_linkTapArticle, "hash");
  v32 = -[NTPBLocalNotificationReceived hash](self->_localNotificationReceived, "hash");
  v33 = v32 ^ -[NTPBUserOnboardingScreenView hash](self->_userOnboardingScreenView, "hash");
  v34 = v33 ^ -[NTPBUserOnboardingChannelPickerComplete hash](self->_userOnboardingChannelPickerComplete, "hash");
  v35 = v34 ^ -[NTPBAdExposureOpportunity hash](self->_adExposureOpportunity, "hash");
  v36 = v35 ^ -[NTPBChannelMuteUnmute hash](self->_channelMuteUnmute, "hash");
  v37 = v36 ^ -[NTPBShareSheetExposure hash](self->_shareSheetExposure, "hash");
  v38 = v37 ^ -[NTPBFeedEngagementMenuExposure hash](self->_feedEngagementMenuExposure, "hash");
  v39 = v31 ^ v38 ^ -[NTPBSearchViewExposure hash](self->_searchViewExposure, "hash");
  v40 = -[NTPBGroupViewExposure hash](self->_groupViewExposure, "hash");
  v41 = v40 ^ -[NTPBPaidSubscriptionConversionPointExposure hash](self->_paidSubscriptionConversionPointExposure, "hash");
  v42 = v41 ^ -[NTPBPaidSubscriptionSheetView hash](self->_paidSubscriptionSheetView, "hash");
  v43 = v42 ^ -[NTPBShareSheetIapFail hash](self->_shareSheetIapFail, "hash");
  v44 = v43 ^ -[NTPBPaidSubscriptionResult hash](self->_paidSubscriptionResult, "hash");
  v45 = v44 ^ -[NTPBShareInformationScreenView hash](self->_shareInformationScreenView, "hash");
  v46 = v45 ^ -[NTPBWebAccessScreenView hash](self->_webAccessScreenView, "hash");
  v47 = v46 ^ -[NTPBAlreadySubscriberSignIn hash](self->_alreadySubscriberSignIn, "hash");
  v48 = v39 ^ v47 ^ -[NTPBBackgroundSubscriptionValidation hash](self->_backgroundSubscriptionValidation, "hash");
  v49 = -[NTPBSubscriptionDetectionScreenView hash](self->_subscriptionDetectionScreenView, "hash");
  v50 = v49 ^ -[NTPBCoverArticleWidgetView hash](self->_coverArticleWidgetView, "hash");
  v51 = v50 ^ -[NTPBNotificationSubscribeUnsubscribe hash](self->_notificationSubscribeUnsubscribe, "hash");
  v52 = v51 ^ -[NTPBNotificationSettingsScreenView hash](self->_notificationSettingsScreenView, "hash");
  v53 = v52 ^ -[NTPBEmailOptInInvite hash](self->_emailOptInInvite, "hash");
  v54 = v53 ^ -[NTPBCoverArticleWidgetExposure hash](self->_coverArticleWidgetExposure, "hash");
  v55 = v54 ^ -[NTPBRestorePaidSubscription hash](self->_restorePaidSubscription, "hash");
  v56 = v55 ^ -[NTPBPaidSubscriptionSheetIapFail hash](self->_paidSubscriptionSheetIapFail, "hash");
  v57 = v56 ^ -[NTPBComscoreEventSend hash](self->_comscoreEventSend, "hash");
  v58 = v48 ^ v57 ^ -[NTPBDiscoverMoreInterstitialExposure hash](self->_discoverMoreInterstitialExposure, "hash");
  v59 = -[NTPBArticleViewNotw hash](self->_articleViewNotw, "hash");
  v60 = v59 ^ -[NTPBArticleScrollNotw hash](self->_articleScrollNotw, "hash");
  v61 = v60 ^ -[NTPBUrlMappingMiss hash](self->_urlMappingMiss, "hash");
  v62 = v61 ^ -[NTPBBundleIdMappingMiss hash](self->_bundleIdMappingMiss, "hash");
  v63 = v62 ^ -[NTPBExternalAnalyticsEventSend hash](self->_externalAnalyticsEventSend, "hash");
  v64 = v63 ^ -[NTPBAppSessionStartWatch hash](self->_appSessionStartWatch, "hash");
  v65 = v64 ^ -[NTPBArticleViewWatch hash](self->_articleViewWatch, "hash");
  v66 = v65 ^ -[NTPBAppSessionEndWatch hash](self->_appSessionEndWatch, "hash");
  v67 = v66 ^ -[NTPBAnfComponentExposure hash](self->_anfComponentExposure, "hash");
  v68 = v67 ^ -[NTPBTodayWidgetSession hash](self->_todayWidgetSession, "hash");
  v69 = v58 ^ v68 ^ -[NTPBWidgetEngagement hash](self->_widgetEngagement, "hash");
  v70 = -[NTPBTodayWidgetHeadlineExposure hash](self->_todayWidgetHeadlineExposure, "hash");
  v71 = v70 ^ -[NTPBTodayWidgetExposure hash](self->_todayWidgetExposure, "hash");
  v72 = v71 ^ -[NTPBAdExposureIneligible hash](self->_adExposureIneligible, "hash");
  v73 = v72 ^ -[NTPBOptInButtonExposure hash](self->_optInButtonExposure, "hash");
  v74 = v73 ^ -[NTPBSuggestionsFeedback hash](self->_suggestionsFeedback, "hash");
  v75 = v74 ^ -[NTPBUserIgnoreFavoritesSuggestion hash](self->_userIgnoreFavoritesSuggestion, "hash");
  v76 = v75 ^ -[NTPBArticleEngagement hash](self->_articleEngagement, "hash");
  v77 = v76 ^ -[NTPBAdImpression hash](self->_adImpression, "hash");
  v78 = v77 ^ -[NTPBAdEngagement hash](self->_adEngagement, "hash");
  v79 = v78 ^ -[NTPBAdCtaEngagement hash](self->_adCtaEngagement, "hash");
  v80 = v79 ^ -[NTPBLinkTap hash](self->_linkTap, "hash");
  v81 = v69 ^ v80 ^ -[NTPBTopOfFeedModuleExposure hash](self->_topOfFeedModuleExposure, "hash");
  v82 = -[NTPBInAppWebEmbedExposure hash](self->_inAppWebEmbedExposure, "hash");
  v83 = v82 ^ -[NTPBTocExposure hash](self->_tocExposure, "hash");
  v84 = v83 ^ -[NTPBTocReorder hash](self->_tocReorder, "hash");
  v85 = v84 ^ -[NTPBTocHandleTap hash](self->_tocHandleTap, "hash");
  v86 = v85 ^ -[NTPBTocCardDrag hash](self->_tocCardDrag, "hash");
  v87 = v86 ^ -[NTPBTocToggleTap hash](self->_tocToggleTap, "hash");
  v88 = v87 ^ -[NTPBTocCellExposure hash](self->_tocCellExposure, "hash");
  v89 = v88 ^ -[NTPBAppSessionResign hash](self->_appSessionResign, "hash");
  v90 = v89 ^ -[NTPBAppSessionResume hash](self->_appSessionResume, "hash");
  v91 = v90 ^ -[NTPBArticleSessionResign hash](self->_articleSessionResign, "hash");
  v92 = v91 ^ -[NTPBArticleSessionResume hash](self->_articleSessionResume, "hash");
  v93 = v92 ^ -[NTPBBundleSubscriberInfo hash](self->_bundleSubscriberInfo, "hash");
  v94 = v81 ^ v93 ^ -[NTPBIssueDownload hash](self->_issueDownload, "hash");
  v95 = -[NTPBPaywallButtonTap hash](self->_paywallButtonTap, "hash");
  v96 = v95 ^ -[NTPBPDFPageView hash](self->_pdfPageView, "hash");
  v97 = v96 ^ -[NTPBIssueTocView hash](self->_issueTocView, "hash");
  v98 = v97 ^ -[NTPBIssueExposure hash](self->_issueExposure, "hash");
  v99 = v98 ^ -[NTPBAppleIdSignInResult hash](self->_appleidSignInResult, "hash");
  v100 = v99 ^ -[NTPBArticleFeedback hash](self->_articleFeedback, "hash");
  v101 = v100 ^ -[NTPBAudioEngage hash](self->_audioEngage, "hash");
  v102 = v101 ^ -[NTPBAudioEngagementCompleted hash](self->_audioEngagementCompleted, "hash");
  v103 = v102 ^ -[NTPBPurchaseOffersItem hash](self->_purchaseOffersItem, "hash");
  return v94 ^ v103 ^ -[NTPBFeedLoad hash](self->_feedLoad, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NTPBUserOnboardingBegin *userOnboardingBegin;
  uint64_t v6;
  NTPBUserOnboardingResume *userOnboardingResume;
  uint64_t v8;
  NTPBUserOnboardingResult *userOnboardingResult;
  uint64_t v10;
  NTPBAppSessionStart *appSessionStart;
  uint64_t v12;
  NTPBAppSessionEnd *appSessionEnd;
  uint64_t v14;
  NTPBArticleScroll *articleScroll;
  uint64_t v16;
  NTPBArticleHostViewExposure *articleHostViewExposure;
  uint64_t v18;
  NTPBArticleLikeDislike *articleLikeDislike;
  uint64_t v20;
  NTPBFeedCellExposure *feedCellExposure;
  uint64_t v22;
  NTPBFeedViewExposure *feedViewExposure;
  uint64_t v24;
  NTPBFeedCellHostViewExposure *feedCellHostViewExposure;
  uint64_t v26;
  NTPBFeedSubscribeUnsubscribe *feedSubscribeUnsubscribe;
  uint64_t v28;
  NTPBMediaExposure *mediaExposure;
  uint64_t v30;
  NTPBMediaView *mediaView;
  uint64_t v32;
  NTPBMediaEngage *mediaEngage;
  uint64_t v34;
  NTPBMediaEngageComplete *mediaEngageComplete;
  uint64_t v36;
  NTPBSearchBegin *searchBegin;
  uint64_t v38;
  NTPBSearchExecute *searchExecute;
  uint64_t v40;
  NTPBSearchResultSelect *searchResultSelect;
  uint64_t v42;
  NTPBShareResult *shareResult;
  uint64_t v44;
  NTPBNoUserAction *noUserAction;
  uint64_t v46;
  NTPBReadingListAddRemove *readingListAddRemove;
  uint64_t v48;
  NTPBReadingListShow *readingListShow;
  uint64_t v50;
  NTPBRecommendationBrickExposure *recommendationBrickExposure;
  uint64_t v52;
  NTPBEndOfArticleExposure *endOfArticleExposure;
  uint64_t v54;
  NTPBReportConcernSubmission *reportConcernSubmission;
  uint64_t v56;
  NTPBLocalNotificationReturn *localNotificationReturn;
  uint64_t v58;
  NTPBPullToRefresh *pullToRefresh;
  uint64_t v60;
  NTPBLinkTapArticle *linkTapArticle;
  uint64_t v62;
  NTPBLocalNotificationReceived *localNotificationReceived;
  uint64_t v64;
  NTPBUserOnboardingScreenView *userOnboardingScreenView;
  uint64_t v66;
  NTPBUserOnboardingChannelPickerComplete *userOnboardingChannelPickerComplete;
  uint64_t v68;
  NTPBAdExposureOpportunity *adExposureOpportunity;
  uint64_t v70;
  NTPBChannelMuteUnmute *channelMuteUnmute;
  uint64_t v72;
  NTPBShareSheetExposure *shareSheetExposure;
  uint64_t v74;
  NTPBFeedEngagementMenuExposure *feedEngagementMenuExposure;
  uint64_t v76;
  NTPBSearchViewExposure *searchViewExposure;
  uint64_t v78;
  NTPBGroupViewExposure *groupViewExposure;
  uint64_t v80;
  NTPBPaidSubscriptionConversionPointExposure *paidSubscriptionConversionPointExposure;
  uint64_t v82;
  NTPBPaidSubscriptionSheetView *paidSubscriptionSheetView;
  uint64_t v84;
  NTPBShareSheetIapFail *shareSheetIapFail;
  uint64_t v86;
  NTPBPaidSubscriptionResult *paidSubscriptionResult;
  uint64_t v88;
  NTPBShareInformationScreenView *shareInformationScreenView;
  uint64_t v90;
  NTPBWebAccessScreenView *webAccessScreenView;
  uint64_t v92;
  NTPBAlreadySubscriberSignIn *alreadySubscriberSignIn;
  uint64_t v94;
  NTPBBackgroundSubscriptionValidation *backgroundSubscriptionValidation;
  uint64_t v96;
  NTPBSubscriptionDetectionScreenView *subscriptionDetectionScreenView;
  uint64_t v98;
  NTPBCoverArticleWidgetView *coverArticleWidgetView;
  uint64_t v100;
  NTPBNotificationSubscribeUnsubscribe *notificationSubscribeUnsubscribe;
  uint64_t v102;
  NTPBNotificationSettingsScreenView *notificationSettingsScreenView;
  uint64_t v104;
  NTPBEmailOptInInvite *emailOptInInvite;
  uint64_t v106;
  NTPBCoverArticleWidgetExposure *coverArticleWidgetExposure;
  uint64_t v108;
  NTPBRestorePaidSubscription *restorePaidSubscription;
  uint64_t v110;
  NTPBPaidSubscriptionSheetIapFail *paidSubscriptionSheetIapFail;
  uint64_t v112;
  NTPBComscoreEventSend *comscoreEventSend;
  uint64_t v114;
  NTPBDiscoverMoreInterstitialExposure *discoverMoreInterstitialExposure;
  uint64_t v116;
  NTPBArticleViewNotw *articleViewNotw;
  uint64_t v118;
  NTPBArticleScrollNotw *articleScrollNotw;
  uint64_t v120;
  NTPBUrlMappingMiss *urlMappingMiss;
  uint64_t v122;
  NTPBBundleIdMappingMiss *bundleIdMappingMiss;
  uint64_t v124;
  NTPBExternalAnalyticsEventSend *externalAnalyticsEventSend;
  uint64_t v126;
  NTPBAppSessionStartWatch *appSessionStartWatch;
  uint64_t v128;
  NTPBArticleViewWatch *articleViewWatch;
  uint64_t v130;
  NTPBAppSessionEndWatch *appSessionEndWatch;
  uint64_t v132;
  NTPBAnfComponentExposure *anfComponentExposure;
  uint64_t v134;
  NTPBTodayWidgetSession *todayWidgetSession;
  uint64_t v136;
  NTPBWidgetEngagement *widgetEngagement;
  uint64_t v138;
  NTPBTodayWidgetHeadlineExposure *todayWidgetHeadlineExposure;
  uint64_t v140;
  NTPBTodayWidgetExposure *todayWidgetExposure;
  uint64_t v142;
  NTPBAdExposureIneligible *adExposureIneligible;
  uint64_t v144;
  NTPBOptInButtonExposure *optInButtonExposure;
  uint64_t v146;
  NTPBSuggestionsFeedback *suggestionsFeedback;
  uint64_t v148;
  NTPBUserIgnoreFavoritesSuggestion *userIgnoreFavoritesSuggestion;
  uint64_t v150;
  NTPBArticleEngagement *articleEngagement;
  uint64_t v152;
  NTPBAdImpression *adImpression;
  uint64_t v154;
  NTPBAdEngagement *adEngagement;
  uint64_t v156;
  NTPBAdCtaEngagement *adCtaEngagement;
  uint64_t v158;
  NTPBLinkTap *linkTap;
  uint64_t v160;
  NTPBTopOfFeedModuleExposure *topOfFeedModuleExposure;
  uint64_t v162;
  NTPBInAppWebEmbedExposure *inAppWebEmbedExposure;
  uint64_t v164;
  NTPBTocExposure *tocExposure;
  uint64_t v166;
  NTPBTocReorder *tocReorder;
  uint64_t v168;
  NTPBTocHandleTap *tocHandleTap;
  uint64_t v170;
  NTPBTocCardDrag *tocCardDrag;
  uint64_t v172;
  NTPBTocToggleTap *tocToggleTap;
  uint64_t v174;
  NTPBTocCellExposure *tocCellExposure;
  uint64_t v176;
  NTPBAppSessionResign *appSessionResign;
  uint64_t v178;
  NTPBAppSessionResume *appSessionResume;
  uint64_t v180;
  NTPBArticleSessionResign *articleSessionResign;
  uint64_t v182;
  NTPBArticleSessionResume *articleSessionResume;
  uint64_t v184;
  NTPBBundleSubscriberInfo *bundleSubscriberInfo;
  uint64_t v186;
  NTPBIssueDownload *issueDownload;
  uint64_t v188;
  NTPBPaywallButtonTap *paywallButtonTap;
  uint64_t v190;
  NTPBPDFPageView *pdfPageView;
  uint64_t v192;
  NTPBIssueTocView *issueTocView;
  uint64_t v194;
  NTPBIssueExposure *issueExposure;
  uint64_t v196;
  NTPBAppleIdSignInResult *appleidSignInResult;
  uint64_t v198;
  NTPBArticleFeedback *articleFeedback;
  uint64_t v200;
  NTPBAudioEngage *audioEngage;
  uint64_t v202;
  NTPBAudioEngagementCompleted *audioEngagementCompleted;
  uint64_t v204;
  NTPBPurchaseOffersItem *purchaseOffersItem;
  uint64_t v206;
  NTPBFeedLoad *feedLoad;
  uint64_t v208;
  _QWORD *v209;

  v4 = a3;
  userOnboardingBegin = self->_userOnboardingBegin;
  v209 = v4;
  v6 = v4[96];
  if (userOnboardingBegin)
  {
    if (v6)
      -[NTPBUserOnboardingBegin mergeFrom:](userOnboardingBegin, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBEventObject setUserOnboardingBegin:](self, "setUserOnboardingBegin:");
  }
  userOnboardingResume = self->_userOnboardingResume;
  v8 = v209[99];
  if (userOnboardingResume)
  {
    if (v8)
      -[NTPBUserOnboardingResume mergeFrom:](userOnboardingResume, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBEventObject setUserOnboardingResume:](self, "setUserOnboardingResume:");
  }
  userOnboardingResult = self->_userOnboardingResult;
  v10 = v209[98];
  if (userOnboardingResult)
  {
    if (v10)
      -[NTPBUserOnboardingResult mergeFrom:](userOnboardingResult, "mergeFrom:");
  }
  else if (v10)
  {
    -[NTPBEventObject setUserOnboardingResult:](self, "setUserOnboardingResult:");
  }
  appSessionStart = self->_appSessionStart;
  v12 = v209[12];
  if (appSessionStart)
  {
    if (v12)
      -[NTPBAppSessionStart mergeFrom:](appSessionStart, "mergeFrom:");
  }
  else if (v12)
  {
    -[NTPBEventObject setAppSessionStart:](self, "setAppSessionStart:");
  }
  appSessionEnd = self->_appSessionEnd;
  v14 = v209[8];
  if (appSessionEnd)
  {
    if (v14)
      -[NTPBAppSessionEnd mergeFrom:](appSessionEnd, "mergeFrom:");
  }
  else if (v14)
  {
    -[NTPBEventObject setAppSessionEnd:](self, "setAppSessionEnd:");
  }
  articleScroll = self->_articleScroll;
  v16 = v209[19];
  if (articleScroll)
  {
    if (v16)
      -[NTPBArticleScroll mergeFrom:](articleScroll, "mergeFrom:");
  }
  else if (v16)
  {
    -[NTPBEventObject setArticleScroll:](self, "setArticleScroll:");
  }
  articleHostViewExposure = self->_articleHostViewExposure;
  v18 = v209[17];
  if (articleHostViewExposure)
  {
    if (v18)
      -[NTPBArticleHostViewExposure mergeFrom:](articleHostViewExposure, "mergeFrom:");
  }
  else if (v18)
  {
    -[NTPBEventObject setArticleHostViewExposure:](self, "setArticleHostViewExposure:");
  }
  articleLikeDislike = self->_articleLikeDislike;
  v20 = v209[18];
  if (articleLikeDislike)
  {
    if (v20)
      -[NTPBArticleLikeDislike mergeFrom:](articleLikeDislike, "mergeFrom:");
  }
  else if (v20)
  {
    -[NTPBEventObject setArticleLikeDislike:](self, "setArticleLikeDislike:");
  }
  feedCellExposure = self->_feedCellExposure;
  v22 = v209[38];
  if (feedCellExposure)
  {
    if (v22)
      -[NTPBFeedCellExposure mergeFrom:](feedCellExposure, "mergeFrom:");
  }
  else if (v22)
  {
    -[NTPBEventObject setFeedCellExposure:](self, "setFeedCellExposure:");
  }
  feedViewExposure = self->_feedViewExposure;
  v24 = v209[43];
  if (feedViewExposure)
  {
    if (v24)
      -[NTPBFeedViewExposure mergeFrom:](feedViewExposure, "mergeFrom:");
  }
  else if (v24)
  {
    -[NTPBEventObject setFeedViewExposure:](self, "setFeedViewExposure:");
  }
  feedCellHostViewExposure = self->_feedCellHostViewExposure;
  v26 = v209[39];
  if (feedCellHostViewExposure)
  {
    if (v26)
      -[NTPBFeedCellHostViewExposure mergeFrom:](feedCellHostViewExposure, "mergeFrom:");
  }
  else if (v26)
  {
    -[NTPBEventObject setFeedCellHostViewExposure:](self, "setFeedCellHostViewExposure:");
  }
  feedSubscribeUnsubscribe = self->_feedSubscribeUnsubscribe;
  v28 = v209[42];
  if (feedSubscribeUnsubscribe)
  {
    if (v28)
      -[NTPBFeedSubscribeUnsubscribe mergeFrom:](feedSubscribeUnsubscribe, "mergeFrom:");
  }
  else if (v28)
  {
    -[NTPBEventObject setFeedSubscribeUnsubscribe:](self, "setFeedSubscribeUnsubscribe:");
  }
  mediaExposure = self->_mediaExposure;
  v30 = v209[55];
  if (mediaExposure)
  {
    if (v30)
      -[NTPBMediaExposure mergeFrom:](mediaExposure, "mergeFrom:");
  }
  else if (v30)
  {
    -[NTPBEventObject setMediaExposure:](self, "setMediaExposure:");
  }
  mediaView = self->_mediaView;
  v32 = v209[56];
  if (mediaView)
  {
    if (v32)
      -[NTPBMediaView mergeFrom:](mediaView, "mergeFrom:");
  }
  else if (v32)
  {
    -[NTPBEventObject setMediaView:](self, "setMediaView:");
  }
  mediaEngage = self->_mediaEngage;
  v34 = v209[53];
  if (mediaEngage)
  {
    if (v34)
      -[NTPBMediaEngage mergeFrom:](mediaEngage, "mergeFrom:");
  }
  else if (v34)
  {
    -[NTPBEventObject setMediaEngage:](self, "setMediaEngage:");
  }
  mediaEngageComplete = self->_mediaEngageComplete;
  v36 = v209[54];
  if (mediaEngageComplete)
  {
    if (v36)
      -[NTPBMediaEngageComplete mergeFrom:](mediaEngageComplete, "mergeFrom:");
  }
  else if (v36)
  {
    -[NTPBEventObject setMediaEngageComplete:](self, "setMediaEngageComplete:");
  }
  searchBegin = self->_searchBegin;
  v38 = v209[74];
  if (searchBegin)
  {
    if (v38)
      -[NTPBSearchBegin mergeFrom:](searchBegin, "mergeFrom:");
  }
  else if (v38)
  {
    -[NTPBEventObject setSearchBegin:](self, "setSearchBegin:");
  }
  searchExecute = self->_searchExecute;
  v40 = v209[75];
  if (searchExecute)
  {
    if (v40)
      -[NTPBSearchExecute mergeFrom:](searchExecute, "mergeFrom:");
  }
  else if (v40)
  {
    -[NTPBEventObject setSearchExecute:](self, "setSearchExecute:");
  }
  searchResultSelect = self->_searchResultSelect;
  v42 = v209[76];
  if (searchResultSelect)
  {
    if (v42)
      -[NTPBSearchResultSelect mergeFrom:](searchResultSelect, "mergeFrom:");
  }
  else if (v42)
  {
    -[NTPBEventObject setSearchResultSelect:](self, "setSearchResultSelect:");
  }
  shareResult = self->_shareResult;
  v44 = v209[79];
  if (shareResult)
  {
    if (v44)
      -[NTPBShareResult mergeFrom:](shareResult, "mergeFrom:");
  }
  else if (v44)
  {
    -[NTPBEventObject setShareResult:](self, "setShareResult:");
  }
  noUserAction = self->_noUserAction;
  v46 = v209[57];
  if (noUserAction)
  {
    if (v46)
      -[NTPBNoUserAction mergeFrom:](noUserAction, "mergeFrom:");
  }
  else if (v46)
  {
    -[NTPBEventObject setNoUserAction:](self, "setNoUserAction:");
  }
  readingListAddRemove = self->_readingListAddRemove;
  v48 = v209[69];
  if (readingListAddRemove)
  {
    if (v48)
      -[NTPBReadingListAddRemove mergeFrom:](readingListAddRemove, "mergeFrom:");
  }
  else if (v48)
  {
    -[NTPBEventObject setReadingListAddRemove:](self, "setReadingListAddRemove:");
  }
  readingListShow = self->_readingListShow;
  v50 = v209[70];
  if (readingListShow)
  {
    if (v50)
      -[NTPBReadingListShow mergeFrom:](readingListShow, "mergeFrom:");
  }
  else if (v50)
  {
    -[NTPBEventObject setReadingListShow:](self, "setReadingListShow:");
  }
  recommendationBrickExposure = self->_recommendationBrickExposure;
  v52 = v209[71];
  if (recommendationBrickExposure)
  {
    if (v52)
      -[NTPBRecommendationBrickExposure mergeFrom:](recommendationBrickExposure, "mergeFrom:");
  }
  else if (v52)
  {
    -[NTPBEventObject setRecommendationBrickExposure:](self, "setRecommendationBrickExposure:");
  }
  endOfArticleExposure = self->_endOfArticleExposure;
  v54 = v209[36];
  if (endOfArticleExposure)
  {
    if (v54)
      -[NTPBEndOfArticleExposure mergeFrom:](endOfArticleExposure, "mergeFrom:");
  }
  else if (v54)
  {
    -[NTPBEventObject setEndOfArticleExposure:](self, "setEndOfArticleExposure:");
  }
  reportConcernSubmission = self->_reportConcernSubmission;
  v56 = v209[72];
  if (reportConcernSubmission)
  {
    if (v56)
      -[NTPBReportConcernSubmission mergeFrom:](reportConcernSubmission, "mergeFrom:");
  }
  else if (v56)
  {
    -[NTPBEventObject setReportConcernSubmission:](self, "setReportConcernSubmission:");
  }
  localNotificationReturn = self->_localNotificationReturn;
  v58 = v209[52];
  if (localNotificationReturn)
  {
    if (v58)
      -[NTPBLocalNotificationReturn mergeFrom:](localNotificationReturn, "mergeFrom:");
  }
  else if (v58)
  {
    -[NTPBEventObject setLocalNotificationReturn:](self, "setLocalNotificationReturn:");
  }
  pullToRefresh = self->_pullToRefresh;
  v60 = v209[67];
  if (pullToRefresh)
  {
    if (v60)
      -[NTPBPullToRefresh mergeFrom:](pullToRefresh, "mergeFrom:");
  }
  else if (v60)
  {
    -[NTPBEventObject setPullToRefresh:](self, "setPullToRefresh:");
  }
  linkTapArticle = self->_linkTapArticle;
  v62 = v209[50];
  if (linkTapArticle)
  {
    if (v62)
      -[NTPBLinkTapArticle mergeFrom:](linkTapArticle, "mergeFrom:");
  }
  else if (v62)
  {
    -[NTPBEventObject setLinkTapArticle:](self, "setLinkTapArticle:");
  }
  localNotificationReceived = self->_localNotificationReceived;
  v64 = v209[51];
  if (localNotificationReceived)
  {
    if (v64)
      -[NTPBLocalNotificationReceived mergeFrom:](localNotificationReceived, "mergeFrom:");
  }
  else if (v64)
  {
    -[NTPBEventObject setLocalNotificationReceived:](self, "setLocalNotificationReceived:");
  }
  userOnboardingScreenView = self->_userOnboardingScreenView;
  v66 = v209[100];
  if (userOnboardingScreenView)
  {
    if (v66)
      -[NTPBUserOnboardingScreenView mergeFrom:](userOnboardingScreenView, "mergeFrom:");
  }
  else if (v66)
  {
    -[NTPBEventObject setUserOnboardingScreenView:](self, "setUserOnboardingScreenView:");
  }
  userOnboardingChannelPickerComplete = self->_userOnboardingChannelPickerComplete;
  v68 = v209[97];
  if (userOnboardingChannelPickerComplete)
  {
    if (v68)
      -[NTPBUserOnboardingChannelPickerComplete mergeFrom:](userOnboardingChannelPickerComplete, "mergeFrom:");
  }
  else if (v68)
  {
    -[NTPBEventObject setUserOnboardingChannelPickerComplete:](self, "setUserOnboardingChannelPickerComplete:");
  }
  adExposureOpportunity = self->_adExposureOpportunity;
  v70 = v209[4];
  if (adExposureOpportunity)
  {
    if (v70)
      -[NTPBAdExposureOpportunity mergeFrom:](adExposureOpportunity, "mergeFrom:");
  }
  else if (v70)
  {
    -[NTPBEventObject setAdExposureOpportunity:](self, "setAdExposureOpportunity:");
  }
  channelMuteUnmute = self->_channelMuteUnmute;
  v72 = v209[30];
  if (channelMuteUnmute)
  {
    if (v72)
      -[NTPBChannelMuteUnmute mergeFrom:](channelMuteUnmute, "mergeFrom:");
  }
  else if (v72)
  {
    -[NTPBEventObject setChannelMuteUnmute:](self, "setChannelMuteUnmute:");
  }
  shareSheetExposure = self->_shareSheetExposure;
  v74 = v209[80];
  if (shareSheetExposure)
  {
    if (v74)
      -[NTPBShareSheetExposure mergeFrom:](shareSheetExposure, "mergeFrom:");
  }
  else if (v74)
  {
    -[NTPBEventObject setShareSheetExposure:](self, "setShareSheetExposure:");
  }
  feedEngagementMenuExposure = self->_feedEngagementMenuExposure;
  v76 = v209[40];
  if (feedEngagementMenuExposure)
  {
    if (v76)
      -[NTPBFeedEngagementMenuExposure mergeFrom:](feedEngagementMenuExposure, "mergeFrom:");
  }
  else if (v76)
  {
    -[NTPBEventObject setFeedEngagementMenuExposure:](self, "setFeedEngagementMenuExposure:");
  }
  searchViewExposure = self->_searchViewExposure;
  v78 = v209[77];
  if (searchViewExposure)
  {
    if (v78)
      -[NTPBSearchViewExposure mergeFrom:](searchViewExposure, "mergeFrom:");
  }
  else if (v78)
  {
    -[NTPBEventObject setSearchViewExposure:](self, "setSearchViewExposure:");
  }
  groupViewExposure = self->_groupViewExposure;
  v80 = v209[44];
  if (groupViewExposure)
  {
    if (v80)
      -[NTPBGroupViewExposure mergeFrom:](groupViewExposure, "mergeFrom:");
  }
  else if (v80)
  {
    -[NTPBEventObject setGroupViewExposure:](self, "setGroupViewExposure:");
  }
  paidSubscriptionConversionPointExposure = self->_paidSubscriptionConversionPointExposure;
  v82 = v209[61];
  if (paidSubscriptionConversionPointExposure)
  {
    if (v82)
      -[NTPBPaidSubscriptionConversionPointExposure mergeFrom:](paidSubscriptionConversionPointExposure, "mergeFrom:");
  }
  else if (v82)
  {
    -[NTPBEventObject setPaidSubscriptionConversionPointExposure:](self, "setPaidSubscriptionConversionPointExposure:");
  }
  paidSubscriptionSheetView = self->_paidSubscriptionSheetView;
  v84 = v209[64];
  if (paidSubscriptionSheetView)
  {
    if (v84)
      -[NTPBPaidSubscriptionSheetView mergeFrom:](paidSubscriptionSheetView, "mergeFrom:");
  }
  else if (v84)
  {
    -[NTPBEventObject setPaidSubscriptionSheetView:](self, "setPaidSubscriptionSheetView:");
  }
  shareSheetIapFail = self->_shareSheetIapFail;
  v86 = v209[81];
  if (shareSheetIapFail)
  {
    if (v86)
      -[NTPBShareSheetIapFail mergeFrom:](shareSheetIapFail, "mergeFrom:");
  }
  else if (v86)
  {
    -[NTPBEventObject setShareSheetIapFail:](self, "setShareSheetIapFail:");
  }
  paidSubscriptionResult = self->_paidSubscriptionResult;
  v88 = v209[62];
  if (paidSubscriptionResult)
  {
    if (v88)
      -[NTPBPaidSubscriptionResult mergeFrom:](paidSubscriptionResult, "mergeFrom:");
  }
  else if (v88)
  {
    -[NTPBEventObject setPaidSubscriptionResult:](self, "setPaidSubscriptionResult:");
  }
  shareInformationScreenView = self->_shareInformationScreenView;
  v90 = v209[78];
  if (shareInformationScreenView)
  {
    if (v90)
      -[NTPBShareInformationScreenView mergeFrom:](shareInformationScreenView, "mergeFrom:");
  }
  else if (v90)
  {
    -[NTPBEventObject setShareInformationScreenView:](self, "setShareInformationScreenView:");
  }
  webAccessScreenView = self->_webAccessScreenView;
  v92 = v209[101];
  if (webAccessScreenView)
  {
    if (v92)
      -[NTPBWebAccessScreenView mergeFrom:](webAccessScreenView, "mergeFrom:");
  }
  else if (v92)
  {
    -[NTPBEventObject setWebAccessScreenView:](self, "setWebAccessScreenView:");
  }
  alreadySubscriberSignIn = self->_alreadySubscriberSignIn;
  v94 = v209[6];
  if (alreadySubscriberSignIn)
  {
    if (v94)
      -[NTPBAlreadySubscriberSignIn mergeFrom:](alreadySubscriberSignIn, "mergeFrom:");
  }
  else if (v94)
  {
    -[NTPBEventObject setAlreadySubscriberSignIn:](self, "setAlreadySubscriberSignIn:");
  }
  backgroundSubscriptionValidation = self->_backgroundSubscriptionValidation;
  v96 = v209[27];
  if (backgroundSubscriptionValidation)
  {
    if (v96)
      -[NTPBBackgroundSubscriptionValidation mergeFrom:](backgroundSubscriptionValidation, "mergeFrom:");
  }
  else if (v96)
  {
    -[NTPBEventObject setBackgroundSubscriptionValidation:](self, "setBackgroundSubscriptionValidation:");
  }
  subscriptionDetectionScreenView = self->_subscriptionDetectionScreenView;
  v98 = v209[82];
  if (subscriptionDetectionScreenView)
  {
    if (v98)
      -[NTPBSubscriptionDetectionScreenView mergeFrom:](subscriptionDetectionScreenView, "mergeFrom:");
  }
  else if (v98)
  {
    -[NTPBEventObject setSubscriptionDetectionScreenView:](self, "setSubscriptionDetectionScreenView:");
  }
  coverArticleWidgetView = self->_coverArticleWidgetView;
  v100 = v209[33];
  if (coverArticleWidgetView)
  {
    if (v100)
      -[NTPBCoverArticleWidgetView mergeFrom:](coverArticleWidgetView, "mergeFrom:");
  }
  else if (v100)
  {
    -[NTPBEventObject setCoverArticleWidgetView:](self, "setCoverArticleWidgetView:");
  }
  notificationSubscribeUnsubscribe = self->_notificationSubscribeUnsubscribe;
  v102 = v209[59];
  if (notificationSubscribeUnsubscribe)
  {
    if (v102)
      -[NTPBNotificationSubscribeUnsubscribe mergeFrom:](notificationSubscribeUnsubscribe, "mergeFrom:");
  }
  else if (v102)
  {
    -[NTPBEventObject setNotificationSubscribeUnsubscribe:](self, "setNotificationSubscribeUnsubscribe:");
  }
  notificationSettingsScreenView = self->_notificationSettingsScreenView;
  v104 = v209[58];
  if (notificationSettingsScreenView)
  {
    if (v104)
      -[NTPBNotificationSettingsScreenView mergeFrom:](notificationSettingsScreenView, "mergeFrom:");
  }
  else if (v104)
  {
    -[NTPBEventObject setNotificationSettingsScreenView:](self, "setNotificationSettingsScreenView:");
  }
  emailOptInInvite = self->_emailOptInInvite;
  v106 = v209[35];
  if (emailOptInInvite)
  {
    if (v106)
      -[NTPBEmailOptInInvite mergeFrom:](emailOptInInvite, "mergeFrom:");
  }
  else if (v106)
  {
    -[NTPBEventObject setEmailOptInInvite:](self, "setEmailOptInInvite:");
  }
  coverArticleWidgetExposure = self->_coverArticleWidgetExposure;
  v108 = v209[32];
  if (coverArticleWidgetExposure)
  {
    if (v108)
      -[NTPBCoverArticleWidgetExposure mergeFrom:](coverArticleWidgetExposure, "mergeFrom:");
  }
  else if (v108)
  {
    -[NTPBEventObject setCoverArticleWidgetExposure:](self, "setCoverArticleWidgetExposure:");
  }
  restorePaidSubscription = self->_restorePaidSubscription;
  v110 = v209[73];
  if (restorePaidSubscription)
  {
    if (v110)
      -[NTPBRestorePaidSubscription mergeFrom:](restorePaidSubscription, "mergeFrom:");
  }
  else if (v110)
  {
    -[NTPBEventObject setRestorePaidSubscription:](self, "setRestorePaidSubscription:");
  }
  paidSubscriptionSheetIapFail = self->_paidSubscriptionSheetIapFail;
  v112 = v209[63];
  if (paidSubscriptionSheetIapFail)
  {
    if (v112)
      -[NTPBPaidSubscriptionSheetIapFail mergeFrom:](paidSubscriptionSheetIapFail, "mergeFrom:");
  }
  else if (v112)
  {
    -[NTPBEventObject setPaidSubscriptionSheetIapFail:](self, "setPaidSubscriptionSheetIapFail:");
  }
  comscoreEventSend = self->_comscoreEventSend;
  v114 = v209[31];
  if (comscoreEventSend)
  {
    if (v114)
      -[NTPBComscoreEventSend mergeFrom:](comscoreEventSend, "mergeFrom:");
  }
  else if (v114)
  {
    -[NTPBEventObject setComscoreEventSend:](self, "setComscoreEventSend:");
  }
  discoverMoreInterstitialExposure = self->_discoverMoreInterstitialExposure;
  v116 = v209[34];
  if (discoverMoreInterstitialExposure)
  {
    if (v116)
      -[NTPBDiscoverMoreInterstitialExposure mergeFrom:](discoverMoreInterstitialExposure, "mergeFrom:");
  }
  else if (v116)
  {
    -[NTPBEventObject setDiscoverMoreInterstitialExposure:](self, "setDiscoverMoreInterstitialExposure:");
  }
  articleViewNotw = self->_articleViewNotw;
  v118 = v209[23];
  if (articleViewNotw)
  {
    if (v118)
      -[NTPBArticleViewNotw mergeFrom:](articleViewNotw, "mergeFrom:");
  }
  else if (v118)
  {
    -[NTPBEventObject setArticleViewNotw:](self, "setArticleViewNotw:");
  }
  articleScrollNotw = self->_articleScrollNotw;
  v120 = v209[20];
  if (articleScrollNotw)
  {
    if (v120)
      -[NTPBArticleScrollNotw mergeFrom:](articleScrollNotw, "mergeFrom:");
  }
  else if (v120)
  {
    -[NTPBEventObject setArticleScrollNotw:](self, "setArticleScrollNotw:");
  }
  urlMappingMiss = self->_urlMappingMiss;
  v122 = v209[94];
  if (urlMappingMiss)
  {
    if (v122)
      -[NTPBUrlMappingMiss mergeFrom:](urlMappingMiss, "mergeFrom:");
  }
  else if (v122)
  {
    -[NTPBEventObject setUrlMappingMiss:](self, "setUrlMappingMiss:");
  }
  bundleIdMappingMiss = self->_bundleIdMappingMiss;
  v124 = v209[28];
  if (bundleIdMappingMiss)
  {
    if (v124)
      -[NTPBBundleIdMappingMiss mergeFrom:](bundleIdMappingMiss, "mergeFrom:");
  }
  else if (v124)
  {
    -[NTPBEventObject setBundleIdMappingMiss:](self, "setBundleIdMappingMiss:");
  }
  externalAnalyticsEventSend = self->_externalAnalyticsEventSend;
  v126 = v209[37];
  if (externalAnalyticsEventSend)
  {
    if (v126)
      -[NTPBExternalAnalyticsEventSend mergeFrom:](externalAnalyticsEventSend, "mergeFrom:");
  }
  else if (v126)
  {
    -[NTPBEventObject setExternalAnalyticsEventSend:](self, "setExternalAnalyticsEventSend:");
  }
  appSessionStartWatch = self->_appSessionStartWatch;
  v128 = v209[13];
  if (appSessionStartWatch)
  {
    if (v128)
      -[NTPBAppSessionStartWatch mergeFrom:](appSessionStartWatch, "mergeFrom:");
  }
  else if (v128)
  {
    -[NTPBEventObject setAppSessionStartWatch:](self, "setAppSessionStartWatch:");
  }
  articleViewWatch = self->_articleViewWatch;
  v130 = v209[24];
  if (articleViewWatch)
  {
    if (v130)
      -[NTPBArticleViewWatch mergeFrom:](articleViewWatch, "mergeFrom:");
  }
  else if (v130)
  {
    -[NTPBEventObject setArticleViewWatch:](self, "setArticleViewWatch:");
  }
  appSessionEndWatch = self->_appSessionEndWatch;
  v132 = v209[9];
  if (appSessionEndWatch)
  {
    if (v132)
      -[NTPBAppSessionEndWatch mergeFrom:](appSessionEndWatch, "mergeFrom:");
  }
  else if (v132)
  {
    -[NTPBEventObject setAppSessionEndWatch:](self, "setAppSessionEndWatch:");
  }
  anfComponentExposure = self->_anfComponentExposure;
  v134 = v209[7];
  if (anfComponentExposure)
  {
    if (v134)
      -[NTPBAnfComponentExposure mergeFrom:](anfComponentExposure, "mergeFrom:");
  }
  else if (v134)
  {
    -[NTPBEventObject setAnfComponentExposure:](self, "setAnfComponentExposure:");
  }
  todayWidgetSession = self->_todayWidgetSession;
  v136 = v209[92];
  if (todayWidgetSession)
  {
    if (v136)
      -[NTPBTodayWidgetSession mergeFrom:](todayWidgetSession, "mergeFrom:");
  }
  else if (v136)
  {
    -[NTPBEventObject setTodayWidgetSession:](self, "setTodayWidgetSession:");
  }
  widgetEngagement = self->_widgetEngagement;
  v138 = v209[102];
  if (widgetEngagement)
  {
    if (v138)
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
  }
  else if (v138)
  {
    -[NTPBEventObject setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  todayWidgetHeadlineExposure = self->_todayWidgetHeadlineExposure;
  v140 = v209[91];
  if (todayWidgetHeadlineExposure)
  {
    if (v140)
      -[NTPBTodayWidgetHeadlineExposure mergeFrom:](todayWidgetHeadlineExposure, "mergeFrom:");
  }
  else if (v140)
  {
    -[NTPBEventObject setTodayWidgetHeadlineExposure:](self, "setTodayWidgetHeadlineExposure:");
  }
  todayWidgetExposure = self->_todayWidgetExposure;
  v142 = v209[90];
  if (todayWidgetExposure)
  {
    if (v142)
      -[NTPBTodayWidgetExposure mergeFrom:](todayWidgetExposure, "mergeFrom:");
  }
  else if (v142)
  {
    -[NTPBEventObject setTodayWidgetExposure:](self, "setTodayWidgetExposure:");
  }
  adExposureIneligible = self->_adExposureIneligible;
  v144 = v209[3];
  if (adExposureIneligible)
  {
    if (v144)
      -[NTPBAdExposureIneligible mergeFrom:](adExposureIneligible, "mergeFrom:");
  }
  else if (v144)
  {
    -[NTPBEventObject setAdExposureIneligible:](self, "setAdExposureIneligible:");
  }
  optInButtonExposure = self->_optInButtonExposure;
  v146 = v209[60];
  if (optInButtonExposure)
  {
    if (v146)
      -[NTPBOptInButtonExposure mergeFrom:](optInButtonExposure, "mergeFrom:");
  }
  else if (v146)
  {
    -[NTPBEventObject setOptInButtonExposure:](self, "setOptInButtonExposure:");
  }
  suggestionsFeedback = self->_suggestionsFeedback;
  v148 = v209[83];
  if (suggestionsFeedback)
  {
    if (v148)
      -[NTPBSuggestionsFeedback mergeFrom:](suggestionsFeedback, "mergeFrom:");
  }
  else if (v148)
  {
    -[NTPBEventObject setSuggestionsFeedback:](self, "setSuggestionsFeedback:");
  }
  userIgnoreFavoritesSuggestion = self->_userIgnoreFavoritesSuggestion;
  v150 = v209[95];
  if (userIgnoreFavoritesSuggestion)
  {
    if (v150)
      -[NTPBUserIgnoreFavoritesSuggestion mergeFrom:](userIgnoreFavoritesSuggestion, "mergeFrom:");
  }
  else if (v150)
  {
    -[NTPBEventObject setUserIgnoreFavoritesSuggestion:](self, "setUserIgnoreFavoritesSuggestion:");
  }
  articleEngagement = self->_articleEngagement;
  v152 = v209[15];
  if (articleEngagement)
  {
    if (v152)
      -[NTPBArticleEngagement mergeFrom:](articleEngagement, "mergeFrom:");
  }
  else if (v152)
  {
    -[NTPBEventObject setArticleEngagement:](self, "setArticleEngagement:");
  }
  adImpression = self->_adImpression;
  v154 = v209[5];
  if (adImpression)
  {
    if (v154)
      -[NTPBAdImpression mergeFrom:](adImpression, "mergeFrom:");
  }
  else if (v154)
  {
    -[NTPBEventObject setAdImpression:](self, "setAdImpression:");
  }
  adEngagement = self->_adEngagement;
  v156 = v209[2];
  if (adEngagement)
  {
    if (v156)
      -[NTPBAdEngagement mergeFrom:](adEngagement, "mergeFrom:");
  }
  else if (v156)
  {
    -[NTPBEventObject setAdEngagement:](self, "setAdEngagement:");
  }
  adCtaEngagement = self->_adCtaEngagement;
  v158 = v209[1];
  if (adCtaEngagement)
  {
    if (v158)
      -[NTPBAdCtaEngagement mergeFrom:](adCtaEngagement, "mergeFrom:");
  }
  else if (v158)
  {
    -[NTPBEventObject setAdCtaEngagement:](self, "setAdCtaEngagement:");
  }
  linkTap = self->_linkTap;
  v160 = v209[49];
  if (linkTap)
  {
    if (v160)
      -[NTPBLinkTap mergeFrom:](linkTap, "mergeFrom:");
  }
  else if (v160)
  {
    -[NTPBEventObject setLinkTap:](self, "setLinkTap:");
  }
  topOfFeedModuleExposure = self->_topOfFeedModuleExposure;
  v162 = v209[93];
  if (topOfFeedModuleExposure)
  {
    if (v162)
      -[NTPBTopOfFeedModuleExposure mergeFrom:](topOfFeedModuleExposure, "mergeFrom:");
  }
  else if (v162)
  {
    -[NTPBEventObject setTopOfFeedModuleExposure:](self, "setTopOfFeedModuleExposure:");
  }
  inAppWebEmbedExposure = self->_inAppWebEmbedExposure;
  v164 = v209[45];
  if (inAppWebEmbedExposure)
  {
    if (v164)
      -[NTPBInAppWebEmbedExposure mergeFrom:](inAppWebEmbedExposure, "mergeFrom:");
  }
  else if (v164)
  {
    -[NTPBEventObject setInAppWebEmbedExposure:](self, "setInAppWebEmbedExposure:");
  }
  tocExposure = self->_tocExposure;
  v166 = v209[86];
  if (tocExposure)
  {
    if (v166)
      -[NTPBTocExposure mergeFrom:](tocExposure, "mergeFrom:");
  }
  else if (v166)
  {
    -[NTPBEventObject setTocExposure:](self, "setTocExposure:");
  }
  tocReorder = self->_tocReorder;
  v168 = v209[88];
  if (tocReorder)
  {
    if (v168)
      -[NTPBTocReorder mergeFrom:](tocReorder, "mergeFrom:");
  }
  else if (v168)
  {
    -[NTPBEventObject setTocReorder:](self, "setTocReorder:");
  }
  tocHandleTap = self->_tocHandleTap;
  v170 = v209[87];
  if (tocHandleTap)
  {
    if (v170)
      -[NTPBTocHandleTap mergeFrom:](tocHandleTap, "mergeFrom:");
  }
  else if (v170)
  {
    -[NTPBEventObject setTocHandleTap:](self, "setTocHandleTap:");
  }
  tocCardDrag = self->_tocCardDrag;
  v172 = v209[84];
  if (tocCardDrag)
  {
    if (v172)
      -[NTPBTocCardDrag mergeFrom:](tocCardDrag, "mergeFrom:");
  }
  else if (v172)
  {
    -[NTPBEventObject setTocCardDrag:](self, "setTocCardDrag:");
  }
  tocToggleTap = self->_tocToggleTap;
  v174 = v209[89];
  if (tocToggleTap)
  {
    if (v174)
      -[NTPBTocToggleTap mergeFrom:](tocToggleTap, "mergeFrom:");
  }
  else if (v174)
  {
    -[NTPBEventObject setTocToggleTap:](self, "setTocToggleTap:");
  }
  tocCellExposure = self->_tocCellExposure;
  v176 = v209[85];
  if (tocCellExposure)
  {
    if (v176)
      -[NTPBTocCellExposure mergeFrom:](tocCellExposure, "mergeFrom:");
  }
  else if (v176)
  {
    -[NTPBEventObject setTocCellExposure:](self, "setTocCellExposure:");
  }
  appSessionResign = self->_appSessionResign;
  v178 = v209[10];
  if (appSessionResign)
  {
    if (v178)
      -[NTPBAppSessionResign mergeFrom:](appSessionResign, "mergeFrom:");
  }
  else if (v178)
  {
    -[NTPBEventObject setAppSessionResign:](self, "setAppSessionResign:");
  }
  appSessionResume = self->_appSessionResume;
  v180 = v209[11];
  if (appSessionResume)
  {
    if (v180)
      -[NTPBAppSessionResume mergeFrom:](appSessionResume, "mergeFrom:");
  }
  else if (v180)
  {
    -[NTPBEventObject setAppSessionResume:](self, "setAppSessionResume:");
  }
  articleSessionResign = self->_articleSessionResign;
  v182 = v209[21];
  if (articleSessionResign)
  {
    if (v182)
      -[NTPBArticleSessionResign mergeFrom:](articleSessionResign, "mergeFrom:");
  }
  else if (v182)
  {
    -[NTPBEventObject setArticleSessionResign:](self, "setArticleSessionResign:");
  }
  articleSessionResume = self->_articleSessionResume;
  v184 = v209[22];
  if (articleSessionResume)
  {
    if (v184)
      -[NTPBArticleSessionResume mergeFrom:](articleSessionResume, "mergeFrom:");
  }
  else if (v184)
  {
    -[NTPBEventObject setArticleSessionResume:](self, "setArticleSessionResume:");
  }
  bundleSubscriberInfo = self->_bundleSubscriberInfo;
  v186 = v209[29];
  if (bundleSubscriberInfo)
  {
    if (v186)
      -[NTPBBundleSubscriberInfo mergeFrom:](bundleSubscriberInfo, "mergeFrom:");
  }
  else if (v186)
  {
    -[NTPBEventObject setBundleSubscriberInfo:](self, "setBundleSubscriberInfo:");
  }
  issueDownload = self->_issueDownload;
  v188 = v209[46];
  if (issueDownload)
  {
    if (v188)
      -[NTPBIssueDownload mergeFrom:](issueDownload, "mergeFrom:");
  }
  else if (v188)
  {
    -[NTPBEventObject setIssueDownload:](self, "setIssueDownload:");
  }
  paywallButtonTap = self->_paywallButtonTap;
  v190 = v209[65];
  if (paywallButtonTap)
  {
    if (v190)
      -[NTPBPaywallButtonTap mergeFrom:](paywallButtonTap, "mergeFrom:");
  }
  else if (v190)
  {
    -[NTPBEventObject setPaywallButtonTap:](self, "setPaywallButtonTap:");
  }
  pdfPageView = self->_pdfPageView;
  v192 = v209[66];
  if (pdfPageView)
  {
    if (v192)
      -[NTPBPDFPageView mergeFrom:](pdfPageView, "mergeFrom:");
  }
  else if (v192)
  {
    -[NTPBEventObject setPdfPageView:](self, "setPdfPageView:");
  }
  issueTocView = self->_issueTocView;
  v194 = v209[48];
  if (issueTocView)
  {
    if (v194)
      -[NTPBIssueTocView mergeFrom:](issueTocView, "mergeFrom:");
  }
  else if (v194)
  {
    -[NTPBEventObject setIssueTocView:](self, "setIssueTocView:");
  }
  issueExposure = self->_issueExposure;
  v196 = v209[47];
  if (issueExposure)
  {
    if (v196)
      -[NTPBIssueExposure mergeFrom:](issueExposure, "mergeFrom:");
  }
  else if (v196)
  {
    -[NTPBEventObject setIssueExposure:](self, "setIssueExposure:");
  }
  appleidSignInResult = self->_appleidSignInResult;
  v198 = v209[14];
  if (appleidSignInResult)
  {
    if (v198)
      -[NTPBAppleIdSignInResult mergeFrom:](appleidSignInResult, "mergeFrom:");
  }
  else if (v198)
  {
    -[NTPBEventObject setAppleidSignInResult:](self, "setAppleidSignInResult:");
  }
  articleFeedback = self->_articleFeedback;
  v200 = v209[16];
  if (articleFeedback)
  {
    if (v200)
      -[NTPBArticleFeedback mergeFrom:](articleFeedback, "mergeFrom:");
  }
  else if (v200)
  {
    -[NTPBEventObject setArticleFeedback:](self, "setArticleFeedback:");
  }
  audioEngage = self->_audioEngage;
  v202 = v209[25];
  if (audioEngage)
  {
    if (v202)
      -[NTPBAudioEngage mergeFrom:](audioEngage, "mergeFrom:");
  }
  else if (v202)
  {
    -[NTPBEventObject setAudioEngage:](self, "setAudioEngage:");
  }
  audioEngagementCompleted = self->_audioEngagementCompleted;
  v204 = v209[26];
  if (audioEngagementCompleted)
  {
    if (v204)
      -[NTPBAudioEngagementCompleted mergeFrom:](audioEngagementCompleted, "mergeFrom:");
  }
  else if (v204)
  {
    -[NTPBEventObject setAudioEngagementCompleted:](self, "setAudioEngagementCompleted:");
  }
  purchaseOffersItem = self->_purchaseOffersItem;
  v206 = v209[68];
  if (purchaseOffersItem)
  {
    if (v206)
      -[NTPBPurchaseOffersItem mergeFrom:](purchaseOffersItem, "mergeFrom:");
  }
  else if (v206)
  {
    -[NTPBEventObject setPurchaseOffersItem:](self, "setPurchaseOffersItem:");
  }
  feedLoad = self->_feedLoad;
  v208 = v209[41];
  if (feedLoad)
  {
    if (v208)
      -[NTPBFeedLoad mergeFrom:](feedLoad, "mergeFrom:");
  }
  else if (v208)
  {
    -[NTPBEventObject setFeedLoad:](self, "setFeedLoad:");
  }

}

- (NTPBUserOnboardingBegin)userOnboardingBegin
{
  return self->_userOnboardingBegin;
}

- (void)setUserOnboardingBegin:(id)a3
{
  objc_storeStrong((id *)&self->_userOnboardingBegin, a3);
}

- (NTPBUserOnboardingResume)userOnboardingResume
{
  return self->_userOnboardingResume;
}

- (void)setUserOnboardingResume:(id)a3
{
  objc_storeStrong((id *)&self->_userOnboardingResume, a3);
}

- (NTPBUserOnboardingResult)userOnboardingResult
{
  return self->_userOnboardingResult;
}

- (void)setUserOnboardingResult:(id)a3
{
  objc_storeStrong((id *)&self->_userOnboardingResult, a3);
}

- (NTPBAppSessionStart)appSessionStart
{
  return self->_appSessionStart;
}

- (void)setAppSessionStart:(id)a3
{
  objc_storeStrong((id *)&self->_appSessionStart, a3);
}

- (NTPBAppSessionEnd)appSessionEnd
{
  return self->_appSessionEnd;
}

- (void)setAppSessionEnd:(id)a3
{
  objc_storeStrong((id *)&self->_appSessionEnd, a3);
}

- (NTPBArticleScroll)articleScroll
{
  return self->_articleScroll;
}

- (void)setArticleScroll:(id)a3
{
  objc_storeStrong((id *)&self->_articleScroll, a3);
}

- (NTPBArticleHostViewExposure)articleHostViewExposure
{
  return self->_articleHostViewExposure;
}

- (void)setArticleHostViewExposure:(id)a3
{
  objc_storeStrong((id *)&self->_articleHostViewExposure, a3);
}

- (NTPBArticleLikeDislike)articleLikeDislike
{
  return self->_articleLikeDislike;
}

- (void)setArticleLikeDislike:(id)a3
{
  objc_storeStrong((id *)&self->_articleLikeDislike, a3);
}

- (NTPBFeedCellExposure)feedCellExposure
{
  return self->_feedCellExposure;
}

- (void)setFeedCellExposure:(id)a3
{
  objc_storeStrong((id *)&self->_feedCellExposure, a3);
}

- (NTPBFeedViewExposure)feedViewExposure
{
  return self->_feedViewExposure;
}

- (void)setFeedViewExposure:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewExposure, a3);
}

- (NTPBFeedCellHostViewExposure)feedCellHostViewExposure
{
  return self->_feedCellHostViewExposure;
}

- (void)setFeedCellHostViewExposure:(id)a3
{
  objc_storeStrong((id *)&self->_feedCellHostViewExposure, a3);
}

- (NTPBFeedSubscribeUnsubscribe)feedSubscribeUnsubscribe
{
  return self->_feedSubscribeUnsubscribe;
}

- (void)setFeedSubscribeUnsubscribe:(id)a3
{
  objc_storeStrong((id *)&self->_feedSubscribeUnsubscribe, a3);
}

- (NTPBMediaExposure)mediaExposure
{
  return self->_mediaExposure;
}

- (void)setMediaExposure:(id)a3
{
  objc_storeStrong((id *)&self->_mediaExposure, a3);
}

- (NTPBMediaView)mediaView
{
  return self->_mediaView;
}

- (void)setMediaView:(id)a3
{
  objc_storeStrong((id *)&self->_mediaView, a3);
}

- (NTPBMediaEngage)mediaEngage
{
  return self->_mediaEngage;
}

- (void)setMediaEngage:(id)a3
{
  objc_storeStrong((id *)&self->_mediaEngage, a3);
}

- (NTPBMediaEngageComplete)mediaEngageComplete
{
  return self->_mediaEngageComplete;
}

- (void)setMediaEngageComplete:(id)a3
{
  objc_storeStrong((id *)&self->_mediaEngageComplete, a3);
}

- (NTPBSearchBegin)searchBegin
{
  return self->_searchBegin;
}

- (void)setSearchBegin:(id)a3
{
  objc_storeStrong((id *)&self->_searchBegin, a3);
}

- (NTPBSearchExecute)searchExecute
{
  return self->_searchExecute;
}

- (void)setSearchExecute:(id)a3
{
  objc_storeStrong((id *)&self->_searchExecute, a3);
}

- (NTPBSearchResultSelect)searchResultSelect
{
  return self->_searchResultSelect;
}

- (void)setSearchResultSelect:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultSelect, a3);
}

- (NTPBShareResult)shareResult
{
  return self->_shareResult;
}

- (void)setShareResult:(id)a3
{
  objc_storeStrong((id *)&self->_shareResult, a3);
}

- (NTPBNoUserAction)noUserAction
{
  return self->_noUserAction;
}

- (void)setNoUserAction:(id)a3
{
  objc_storeStrong((id *)&self->_noUserAction, a3);
}

- (NTPBReadingListAddRemove)readingListAddRemove
{
  return self->_readingListAddRemove;
}

- (void)setReadingListAddRemove:(id)a3
{
  objc_storeStrong((id *)&self->_readingListAddRemove, a3);
}

- (NTPBReadingListShow)readingListShow
{
  return self->_readingListShow;
}

- (void)setReadingListShow:(id)a3
{
  objc_storeStrong((id *)&self->_readingListShow, a3);
}

- (NTPBRecommendationBrickExposure)recommendationBrickExposure
{
  return self->_recommendationBrickExposure;
}

- (void)setRecommendationBrickExposure:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationBrickExposure, a3);
}

- (NTPBEndOfArticleExposure)endOfArticleExposure
{
  return self->_endOfArticleExposure;
}

- (void)setEndOfArticleExposure:(id)a3
{
  objc_storeStrong((id *)&self->_endOfArticleExposure, a3);
}

- (NTPBReportConcernSubmission)reportConcernSubmission
{
  return self->_reportConcernSubmission;
}

- (void)setReportConcernSubmission:(id)a3
{
  objc_storeStrong((id *)&self->_reportConcernSubmission, a3);
}

- (NTPBLocalNotificationReturn)localNotificationReturn
{
  return self->_localNotificationReturn;
}

- (void)setLocalNotificationReturn:(id)a3
{
  objc_storeStrong((id *)&self->_localNotificationReturn, a3);
}

- (NTPBPullToRefresh)pullToRefresh
{
  return self->_pullToRefresh;
}

- (void)setPullToRefresh:(id)a3
{
  objc_storeStrong((id *)&self->_pullToRefresh, a3);
}

- (NTPBLinkTapArticle)linkTapArticle
{
  return self->_linkTapArticle;
}

- (void)setLinkTapArticle:(id)a3
{
  objc_storeStrong((id *)&self->_linkTapArticle, a3);
}

- (NTPBLocalNotificationReceived)localNotificationReceived
{
  return self->_localNotificationReceived;
}

- (void)setLocalNotificationReceived:(id)a3
{
  objc_storeStrong((id *)&self->_localNotificationReceived, a3);
}

- (NTPBUserOnboardingScreenView)userOnboardingScreenView
{
  return self->_userOnboardingScreenView;
}

- (void)setUserOnboardingScreenView:(id)a3
{
  objc_storeStrong((id *)&self->_userOnboardingScreenView, a3);
}

- (NTPBUserOnboardingChannelPickerComplete)userOnboardingChannelPickerComplete
{
  return self->_userOnboardingChannelPickerComplete;
}

- (void)setUserOnboardingChannelPickerComplete:(id)a3
{
  objc_storeStrong((id *)&self->_userOnboardingChannelPickerComplete, a3);
}

- (NTPBAdExposureOpportunity)adExposureOpportunity
{
  return self->_adExposureOpportunity;
}

- (void)setAdExposureOpportunity:(id)a3
{
  objc_storeStrong((id *)&self->_adExposureOpportunity, a3);
}

- (NTPBChannelMuteUnmute)channelMuteUnmute
{
  return self->_channelMuteUnmute;
}

- (void)setChannelMuteUnmute:(id)a3
{
  objc_storeStrong((id *)&self->_channelMuteUnmute, a3);
}

- (NTPBShareSheetExposure)shareSheetExposure
{
  return self->_shareSheetExposure;
}

- (void)setShareSheetExposure:(id)a3
{
  objc_storeStrong((id *)&self->_shareSheetExposure, a3);
}

- (NTPBFeedEngagementMenuExposure)feedEngagementMenuExposure
{
  return self->_feedEngagementMenuExposure;
}

- (void)setFeedEngagementMenuExposure:(id)a3
{
  objc_storeStrong((id *)&self->_feedEngagementMenuExposure, a3);
}

- (NTPBSearchViewExposure)searchViewExposure
{
  return self->_searchViewExposure;
}

- (void)setSearchViewExposure:(id)a3
{
  objc_storeStrong((id *)&self->_searchViewExposure, a3);
}

- (NTPBGroupViewExposure)groupViewExposure
{
  return self->_groupViewExposure;
}

- (void)setGroupViewExposure:(id)a3
{
  objc_storeStrong((id *)&self->_groupViewExposure, a3);
}

- (NTPBPaidSubscriptionConversionPointExposure)paidSubscriptionConversionPointExposure
{
  return self->_paidSubscriptionConversionPointExposure;
}

- (void)setPaidSubscriptionConversionPointExposure:(id)a3
{
  objc_storeStrong((id *)&self->_paidSubscriptionConversionPointExposure, a3);
}

- (NTPBPaidSubscriptionSheetView)paidSubscriptionSheetView
{
  return self->_paidSubscriptionSheetView;
}

- (void)setPaidSubscriptionSheetView:(id)a3
{
  objc_storeStrong((id *)&self->_paidSubscriptionSheetView, a3);
}

- (NTPBShareSheetIapFail)shareSheetIapFail
{
  return self->_shareSheetIapFail;
}

- (void)setShareSheetIapFail:(id)a3
{
  objc_storeStrong((id *)&self->_shareSheetIapFail, a3);
}

- (NTPBPaidSubscriptionResult)paidSubscriptionResult
{
  return self->_paidSubscriptionResult;
}

- (void)setPaidSubscriptionResult:(id)a3
{
  objc_storeStrong((id *)&self->_paidSubscriptionResult, a3);
}

- (NTPBShareInformationScreenView)shareInformationScreenView
{
  return self->_shareInformationScreenView;
}

- (void)setShareInformationScreenView:(id)a3
{
  objc_storeStrong((id *)&self->_shareInformationScreenView, a3);
}

- (NTPBWebAccessScreenView)webAccessScreenView
{
  return self->_webAccessScreenView;
}

- (void)setWebAccessScreenView:(id)a3
{
  objc_storeStrong((id *)&self->_webAccessScreenView, a3);
}

- (NTPBAlreadySubscriberSignIn)alreadySubscriberSignIn
{
  return self->_alreadySubscriberSignIn;
}

- (void)setAlreadySubscriberSignIn:(id)a3
{
  objc_storeStrong((id *)&self->_alreadySubscriberSignIn, a3);
}

- (NTPBBackgroundSubscriptionValidation)backgroundSubscriptionValidation
{
  return self->_backgroundSubscriptionValidation;
}

- (void)setBackgroundSubscriptionValidation:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSubscriptionValidation, a3);
}

- (NTPBSubscriptionDetectionScreenView)subscriptionDetectionScreenView
{
  return self->_subscriptionDetectionScreenView;
}

- (void)setSubscriptionDetectionScreenView:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionDetectionScreenView, a3);
}

- (NTPBCoverArticleWidgetView)coverArticleWidgetView
{
  return self->_coverArticleWidgetView;
}

- (void)setCoverArticleWidgetView:(id)a3
{
  objc_storeStrong((id *)&self->_coverArticleWidgetView, a3);
}

- (NTPBNotificationSubscribeUnsubscribe)notificationSubscribeUnsubscribe
{
  return self->_notificationSubscribeUnsubscribe;
}

- (void)setNotificationSubscribeUnsubscribe:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSubscribeUnsubscribe, a3);
}

- (NTPBNotificationSettingsScreenView)notificationSettingsScreenView
{
  return self->_notificationSettingsScreenView;
}

- (void)setNotificationSettingsScreenView:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSettingsScreenView, a3);
}

- (NTPBEmailOptInInvite)emailOptInInvite
{
  return self->_emailOptInInvite;
}

- (void)setEmailOptInInvite:(id)a3
{
  objc_storeStrong((id *)&self->_emailOptInInvite, a3);
}

- (NTPBCoverArticleWidgetExposure)coverArticleWidgetExposure
{
  return self->_coverArticleWidgetExposure;
}

- (void)setCoverArticleWidgetExposure:(id)a3
{
  objc_storeStrong((id *)&self->_coverArticleWidgetExposure, a3);
}

- (NTPBRestorePaidSubscription)restorePaidSubscription
{
  return self->_restorePaidSubscription;
}

- (void)setRestorePaidSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_restorePaidSubscription, a3);
}

- (NTPBPaidSubscriptionSheetIapFail)paidSubscriptionSheetIapFail
{
  return self->_paidSubscriptionSheetIapFail;
}

- (void)setPaidSubscriptionSheetIapFail:(id)a3
{
  objc_storeStrong((id *)&self->_paidSubscriptionSheetIapFail, a3);
}

- (NTPBComscoreEventSend)comscoreEventSend
{
  return self->_comscoreEventSend;
}

- (void)setComscoreEventSend:(id)a3
{
  objc_storeStrong((id *)&self->_comscoreEventSend, a3);
}

- (NTPBDiscoverMoreInterstitialExposure)discoverMoreInterstitialExposure
{
  return self->_discoverMoreInterstitialExposure;
}

- (void)setDiscoverMoreInterstitialExposure:(id)a3
{
  objc_storeStrong((id *)&self->_discoverMoreInterstitialExposure, a3);
}

- (NTPBArticleViewNotw)articleViewNotw
{
  return self->_articleViewNotw;
}

- (void)setArticleViewNotw:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewNotw, a3);
}

- (NTPBArticleScrollNotw)articleScrollNotw
{
  return self->_articleScrollNotw;
}

- (void)setArticleScrollNotw:(id)a3
{
  objc_storeStrong((id *)&self->_articleScrollNotw, a3);
}

- (NTPBUrlMappingMiss)urlMappingMiss
{
  return self->_urlMappingMiss;
}

- (void)setUrlMappingMiss:(id)a3
{
  objc_storeStrong((id *)&self->_urlMappingMiss, a3);
}

- (NTPBBundleIdMappingMiss)bundleIdMappingMiss
{
  return self->_bundleIdMappingMiss;
}

- (void)setBundleIdMappingMiss:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdMappingMiss, a3);
}

- (NTPBExternalAnalyticsEventSend)externalAnalyticsEventSend
{
  return self->_externalAnalyticsEventSend;
}

- (void)setExternalAnalyticsEventSend:(id)a3
{
  objc_storeStrong((id *)&self->_externalAnalyticsEventSend, a3);
}

- (NTPBAppSessionStartWatch)appSessionStartWatch
{
  return self->_appSessionStartWatch;
}

- (void)setAppSessionStartWatch:(id)a3
{
  objc_storeStrong((id *)&self->_appSessionStartWatch, a3);
}

- (NTPBArticleViewWatch)articleViewWatch
{
  return self->_articleViewWatch;
}

- (void)setArticleViewWatch:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewWatch, a3);
}

- (NTPBAppSessionEndWatch)appSessionEndWatch
{
  return self->_appSessionEndWatch;
}

- (void)setAppSessionEndWatch:(id)a3
{
  objc_storeStrong((id *)&self->_appSessionEndWatch, a3);
}

- (NTPBAnfComponentExposure)anfComponentExposure
{
  return self->_anfComponentExposure;
}

- (void)setAnfComponentExposure:(id)a3
{
  objc_storeStrong((id *)&self->_anfComponentExposure, a3);
}

- (NTPBTodayWidgetSession)todayWidgetSession
{
  return self->_todayWidgetSession;
}

- (void)setTodayWidgetSession:(id)a3
{
  objc_storeStrong((id *)&self->_todayWidgetSession, a3);
}

- (NTPBWidgetEngagement)widgetEngagement
{
  return self->_widgetEngagement;
}

- (void)setWidgetEngagement:(id)a3
{
  objc_storeStrong((id *)&self->_widgetEngagement, a3);
}

- (NTPBTodayWidgetHeadlineExposure)todayWidgetHeadlineExposure
{
  return self->_todayWidgetHeadlineExposure;
}

- (void)setTodayWidgetHeadlineExposure:(id)a3
{
  objc_storeStrong((id *)&self->_todayWidgetHeadlineExposure, a3);
}

- (NTPBTodayWidgetExposure)todayWidgetExposure
{
  return self->_todayWidgetExposure;
}

- (void)setTodayWidgetExposure:(id)a3
{
  objc_storeStrong((id *)&self->_todayWidgetExposure, a3);
}

- (NTPBAdExposureIneligible)adExposureIneligible
{
  return self->_adExposureIneligible;
}

- (void)setAdExposureIneligible:(id)a3
{
  objc_storeStrong((id *)&self->_adExposureIneligible, a3);
}

- (NTPBOptInButtonExposure)optInButtonExposure
{
  return self->_optInButtonExposure;
}

- (void)setOptInButtonExposure:(id)a3
{
  objc_storeStrong((id *)&self->_optInButtonExposure, a3);
}

- (NTPBSuggestionsFeedback)suggestionsFeedback
{
  return self->_suggestionsFeedback;
}

- (void)setSuggestionsFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsFeedback, a3);
}

- (NTPBUserIgnoreFavoritesSuggestion)userIgnoreFavoritesSuggestion
{
  return self->_userIgnoreFavoritesSuggestion;
}

- (void)setUserIgnoreFavoritesSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_userIgnoreFavoritesSuggestion, a3);
}

- (NTPBArticleEngagement)articleEngagement
{
  return self->_articleEngagement;
}

- (void)setArticleEngagement:(id)a3
{
  objc_storeStrong((id *)&self->_articleEngagement, a3);
}

- (NTPBAdImpression)adImpression
{
  return self->_adImpression;
}

- (void)setAdImpression:(id)a3
{
  objc_storeStrong((id *)&self->_adImpression, a3);
}

- (NTPBAdEngagement)adEngagement
{
  return self->_adEngagement;
}

- (void)setAdEngagement:(id)a3
{
  objc_storeStrong((id *)&self->_adEngagement, a3);
}

- (NTPBAdCtaEngagement)adCtaEngagement
{
  return self->_adCtaEngagement;
}

- (void)setAdCtaEngagement:(id)a3
{
  objc_storeStrong((id *)&self->_adCtaEngagement, a3);
}

- (NTPBLinkTap)linkTap
{
  return self->_linkTap;
}

- (void)setLinkTap:(id)a3
{
  objc_storeStrong((id *)&self->_linkTap, a3);
}

- (NTPBTopOfFeedModuleExposure)topOfFeedModuleExposure
{
  return self->_topOfFeedModuleExposure;
}

- (void)setTopOfFeedModuleExposure:(id)a3
{
  objc_storeStrong((id *)&self->_topOfFeedModuleExposure, a3);
}

- (NTPBInAppWebEmbedExposure)inAppWebEmbedExposure
{
  return self->_inAppWebEmbedExposure;
}

- (void)setInAppWebEmbedExposure:(id)a3
{
  objc_storeStrong((id *)&self->_inAppWebEmbedExposure, a3);
}

- (NTPBTocExposure)tocExposure
{
  return self->_tocExposure;
}

- (void)setTocExposure:(id)a3
{
  objc_storeStrong((id *)&self->_tocExposure, a3);
}

- (NTPBTocReorder)tocReorder
{
  return self->_tocReorder;
}

- (void)setTocReorder:(id)a3
{
  objc_storeStrong((id *)&self->_tocReorder, a3);
}

- (NTPBTocHandleTap)tocHandleTap
{
  return self->_tocHandleTap;
}

- (void)setTocHandleTap:(id)a3
{
  objc_storeStrong((id *)&self->_tocHandleTap, a3);
}

- (NTPBTocCardDrag)tocCardDrag
{
  return self->_tocCardDrag;
}

- (void)setTocCardDrag:(id)a3
{
  objc_storeStrong((id *)&self->_tocCardDrag, a3);
}

- (NTPBTocToggleTap)tocToggleTap
{
  return self->_tocToggleTap;
}

- (void)setTocToggleTap:(id)a3
{
  objc_storeStrong((id *)&self->_tocToggleTap, a3);
}

- (NTPBTocCellExposure)tocCellExposure
{
  return self->_tocCellExposure;
}

- (void)setTocCellExposure:(id)a3
{
  objc_storeStrong((id *)&self->_tocCellExposure, a3);
}

- (NTPBAppSessionResign)appSessionResign
{
  return self->_appSessionResign;
}

- (void)setAppSessionResign:(id)a3
{
  objc_storeStrong((id *)&self->_appSessionResign, a3);
}

- (NTPBAppSessionResume)appSessionResume
{
  return self->_appSessionResume;
}

- (void)setAppSessionResume:(id)a3
{
  objc_storeStrong((id *)&self->_appSessionResume, a3);
}

- (NTPBArticleSessionResign)articleSessionResign
{
  return self->_articleSessionResign;
}

- (void)setArticleSessionResign:(id)a3
{
  objc_storeStrong((id *)&self->_articleSessionResign, a3);
}

- (NTPBArticleSessionResume)articleSessionResume
{
  return self->_articleSessionResume;
}

- (void)setArticleSessionResume:(id)a3
{
  objc_storeStrong((id *)&self->_articleSessionResume, a3);
}

- (NTPBBundleSubscriberInfo)bundleSubscriberInfo
{
  return self->_bundleSubscriberInfo;
}

- (void)setBundleSubscriberInfo:(id)a3
{
  objc_storeStrong((id *)&self->_bundleSubscriberInfo, a3);
}

- (NTPBIssueDownload)issueDownload
{
  return self->_issueDownload;
}

- (void)setIssueDownload:(id)a3
{
  objc_storeStrong((id *)&self->_issueDownload, a3);
}

- (NTPBPaywallButtonTap)paywallButtonTap
{
  return self->_paywallButtonTap;
}

- (void)setPaywallButtonTap:(id)a3
{
  objc_storeStrong((id *)&self->_paywallButtonTap, a3);
}

- (NTPBPDFPageView)pdfPageView
{
  return self->_pdfPageView;
}

- (void)setPdfPageView:(id)a3
{
  objc_storeStrong((id *)&self->_pdfPageView, a3);
}

- (NTPBIssueTocView)issueTocView
{
  return self->_issueTocView;
}

- (void)setIssueTocView:(id)a3
{
  objc_storeStrong((id *)&self->_issueTocView, a3);
}

- (NTPBIssueExposure)issueExposure
{
  return self->_issueExposure;
}

- (void)setIssueExposure:(id)a3
{
  objc_storeStrong((id *)&self->_issueExposure, a3);
}

- (NTPBAppleIdSignInResult)appleidSignInResult
{
  return self->_appleidSignInResult;
}

- (void)setAppleidSignInResult:(id)a3
{
  objc_storeStrong((id *)&self->_appleidSignInResult, a3);
}

- (NTPBArticleFeedback)articleFeedback
{
  return self->_articleFeedback;
}

- (void)setArticleFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_articleFeedback, a3);
}

- (NTPBAudioEngage)audioEngage
{
  return self->_audioEngage;
}

- (void)setAudioEngage:(id)a3
{
  objc_storeStrong((id *)&self->_audioEngage, a3);
}

- (NTPBAudioEngagementCompleted)audioEngagementCompleted
{
  return self->_audioEngagementCompleted;
}

- (void)setAudioEngagementCompleted:(id)a3
{
  objc_storeStrong((id *)&self->_audioEngagementCompleted, a3);
}

- (NTPBPurchaseOffersItem)purchaseOffersItem
{
  return self->_purchaseOffersItem;
}

- (void)setPurchaseOffersItem:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseOffersItem, a3);
}

- (NTPBFeedLoad)feedLoad
{
  return self->_feedLoad;
}

- (void)setFeedLoad:(id)a3
{
  objc_storeStrong((id *)&self->_feedLoad, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetEngagement, 0);
  objc_storeStrong((id *)&self->_webAccessScreenView, 0);
  objc_storeStrong((id *)&self->_userOnboardingScreenView, 0);
  objc_storeStrong((id *)&self->_userOnboardingResume, 0);
  objc_storeStrong((id *)&self->_userOnboardingResult, 0);
  objc_storeStrong((id *)&self->_userOnboardingChannelPickerComplete, 0);
  objc_storeStrong((id *)&self->_userOnboardingBegin, 0);
  objc_storeStrong((id *)&self->_userIgnoreFavoritesSuggestion, 0);
  objc_storeStrong((id *)&self->_urlMappingMiss, 0);
  objc_storeStrong((id *)&self->_topOfFeedModuleExposure, 0);
  objc_storeStrong((id *)&self->_todayWidgetSession, 0);
  objc_storeStrong((id *)&self->_todayWidgetHeadlineExposure, 0);
  objc_storeStrong((id *)&self->_todayWidgetExposure, 0);
  objc_storeStrong((id *)&self->_tocToggleTap, 0);
  objc_storeStrong((id *)&self->_tocReorder, 0);
  objc_storeStrong((id *)&self->_tocHandleTap, 0);
  objc_storeStrong((id *)&self->_tocExposure, 0);
  objc_storeStrong((id *)&self->_tocCellExposure, 0);
  objc_storeStrong((id *)&self->_tocCardDrag, 0);
  objc_storeStrong((id *)&self->_suggestionsFeedback, 0);
  objc_storeStrong((id *)&self->_subscriptionDetectionScreenView, 0);
  objc_storeStrong((id *)&self->_shareSheetIapFail, 0);
  objc_storeStrong((id *)&self->_shareSheetExposure, 0);
  objc_storeStrong((id *)&self->_shareResult, 0);
  objc_storeStrong((id *)&self->_shareInformationScreenView, 0);
  objc_storeStrong((id *)&self->_searchViewExposure, 0);
  objc_storeStrong((id *)&self->_searchResultSelect, 0);
  objc_storeStrong((id *)&self->_searchExecute, 0);
  objc_storeStrong((id *)&self->_searchBegin, 0);
  objc_storeStrong((id *)&self->_restorePaidSubscription, 0);
  objc_storeStrong((id *)&self->_reportConcernSubmission, 0);
  objc_storeStrong((id *)&self->_recommendationBrickExposure, 0);
  objc_storeStrong((id *)&self->_readingListShow, 0);
  objc_storeStrong((id *)&self->_readingListAddRemove, 0);
  objc_storeStrong((id *)&self->_purchaseOffersItem, 0);
  objc_storeStrong((id *)&self->_pullToRefresh, 0);
  objc_storeStrong((id *)&self->_pdfPageView, 0);
  objc_storeStrong((id *)&self->_paywallButtonTap, 0);
  objc_storeStrong((id *)&self->_paidSubscriptionSheetView, 0);
  objc_storeStrong((id *)&self->_paidSubscriptionSheetIapFail, 0);
  objc_storeStrong((id *)&self->_paidSubscriptionResult, 0);
  objc_storeStrong((id *)&self->_paidSubscriptionConversionPointExposure, 0);
  objc_storeStrong((id *)&self->_optInButtonExposure, 0);
  objc_storeStrong((id *)&self->_notificationSubscribeUnsubscribe, 0);
  objc_storeStrong((id *)&self->_notificationSettingsScreenView, 0);
  objc_storeStrong((id *)&self->_noUserAction, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_mediaExposure, 0);
  objc_storeStrong((id *)&self->_mediaEngageComplete, 0);
  objc_storeStrong((id *)&self->_mediaEngage, 0);
  objc_storeStrong((id *)&self->_localNotificationReturn, 0);
  objc_storeStrong((id *)&self->_localNotificationReceived, 0);
  objc_storeStrong((id *)&self->_linkTapArticle, 0);
  objc_storeStrong((id *)&self->_linkTap, 0);
  objc_storeStrong((id *)&self->_issueTocView, 0);
  objc_storeStrong((id *)&self->_issueExposure, 0);
  objc_storeStrong((id *)&self->_issueDownload, 0);
  objc_storeStrong((id *)&self->_inAppWebEmbedExposure, 0);
  objc_storeStrong((id *)&self->_groupViewExposure, 0);
  objc_storeStrong((id *)&self->_feedViewExposure, 0);
  objc_storeStrong((id *)&self->_feedSubscribeUnsubscribe, 0);
  objc_storeStrong((id *)&self->_feedLoad, 0);
  objc_storeStrong((id *)&self->_feedEngagementMenuExposure, 0);
  objc_storeStrong((id *)&self->_feedCellHostViewExposure, 0);
  objc_storeStrong((id *)&self->_feedCellExposure, 0);
  objc_storeStrong((id *)&self->_externalAnalyticsEventSend, 0);
  objc_storeStrong((id *)&self->_endOfArticleExposure, 0);
  objc_storeStrong((id *)&self->_emailOptInInvite, 0);
  objc_storeStrong((id *)&self->_discoverMoreInterstitialExposure, 0);
  objc_storeStrong((id *)&self->_coverArticleWidgetView, 0);
  objc_storeStrong((id *)&self->_coverArticleWidgetExposure, 0);
  objc_storeStrong((id *)&self->_comscoreEventSend, 0);
  objc_storeStrong((id *)&self->_channelMuteUnmute, 0);
  objc_storeStrong((id *)&self->_bundleSubscriberInfo, 0);
  objc_storeStrong((id *)&self->_bundleIdMappingMiss, 0);
  objc_storeStrong((id *)&self->_backgroundSubscriptionValidation, 0);
  objc_storeStrong((id *)&self->_audioEngagementCompleted, 0);
  objc_storeStrong((id *)&self->_audioEngage, 0);
  objc_storeStrong((id *)&self->_articleViewWatch, 0);
  objc_storeStrong((id *)&self->_articleViewNotw, 0);
  objc_storeStrong((id *)&self->_articleSessionResume, 0);
  objc_storeStrong((id *)&self->_articleSessionResign, 0);
  objc_storeStrong((id *)&self->_articleScrollNotw, 0);
  objc_storeStrong((id *)&self->_articleScroll, 0);
  objc_storeStrong((id *)&self->_articleLikeDislike, 0);
  objc_storeStrong((id *)&self->_articleHostViewExposure, 0);
  objc_storeStrong((id *)&self->_articleFeedback, 0);
  objc_storeStrong((id *)&self->_articleEngagement, 0);
  objc_storeStrong((id *)&self->_appleidSignInResult, 0);
  objc_storeStrong((id *)&self->_appSessionStartWatch, 0);
  objc_storeStrong((id *)&self->_appSessionStart, 0);
  objc_storeStrong((id *)&self->_appSessionResume, 0);
  objc_storeStrong((id *)&self->_appSessionResign, 0);
  objc_storeStrong((id *)&self->_appSessionEndWatch, 0);
  objc_storeStrong((id *)&self->_appSessionEnd, 0);
  objc_storeStrong((id *)&self->_anfComponentExposure, 0);
  objc_storeStrong((id *)&self->_alreadySubscriberSignIn, 0);
  objc_storeStrong((id *)&self->_adImpression, 0);
  objc_storeStrong((id *)&self->_adExposureOpportunity, 0);
  objc_storeStrong((id *)&self->_adExposureIneligible, 0);
  objc_storeStrong((id *)&self->_adEngagement, 0);
  objc_storeStrong((id *)&self->_adCtaEngagement, 0);
}

@end
