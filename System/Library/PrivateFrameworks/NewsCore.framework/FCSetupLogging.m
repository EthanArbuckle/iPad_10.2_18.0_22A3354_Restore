@implementation FCSetupLogging

void __FCSetupLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;
  os_log_t v24;
  void *v25;
  os_log_t v26;
  void *v27;
  os_log_t v28;
  void *v29;
  os_log_t v30;
  void *v31;
  os_log_t v32;
  void *v33;
  os_log_t v34;
  void *v35;
  os_log_t v36;
  void *v37;
  os_log_t v38;
  void *v39;
  os_log_t v40;
  void *v41;
  os_log_t v42;
  void *v43;
  os_log_t v44;
  void *v45;
  os_log_t v46;
  void *v47;
  os_log_t v48;
  void *v49;
  os_log_t v50;
  void *v51;
  os_log_t v52;
  void *v53;
  os_log_t v54;
  void *v55;
  os_log_t v56;
  void *v57;
  os_log_t v58;
  void *v59;
  os_log_t v60;
  void *v61;
  os_log_t v62;
  void *v63;
  os_log_t v64;
  void *v65;
  os_log_t v66;
  void *v67;
  os_log_t v68;
  void *v69;
  os_log_t v70;
  void *v71;
  os_log_t v72;
  void *v73;
  os_log_t v74;
  void *v75;
  os_log_t v76;
  void *v77;
  os_log_t v78;
  void *v79;
  os_log_t v80;
  void *v81;
  os_log_t v82;
  void *v83;
  os_log_t v84;
  void *v85;
  os_log_t v86;
  void *v87;
  os_log_t v88;
  void *v89;
  os_log_t v90;
  void *v91;
  os_log_t v92;
  void *v93;
  os_log_t v94;
  void *v95;
  os_log_t v96;
  void *v97;
  os_log_t v98;
  void *v99;
  os_log_t v100;
  void *v101;
  os_log_t v102;
  void *v103;

  v0 = os_log_create((const char *)FCLogSubsystemIdentifier, "Default");
  v1 = (void *)FCDefaultLog;
  FCDefaultLog = (uint64_t)v0;

  v2 = os_log_create((const char *)FCLogSubsystemIdentifier, "AlternateUniversalLinks");
  v3 = (void *)FCAlternateUniversalLinksLog;
  FCAlternateUniversalLinksLog = (uint64_t)v2;

  v4 = os_log_create((const char *)FCLogSubsystemIdentifier, "Analytics");
  v5 = (void *)FCAnalyticsLog;
  FCAnalyticsLog = (uint64_t)v4;

  v6 = os_log_create((const char *)FCLogSubsystemIdentifier, "AppConfiguration");
  v7 = (void *)FCAppConfigurationLog;
  FCAppConfigurationLog = (uint64_t)v6;

  v8 = os_log_create((const char *)FCLogSubsystemIdentifier, "AutoFavorites");
  v9 = (void *)FCAutoFavoritesLog;
  FCAutoFavoritesLog = (uint64_t)v8;

  v10 = os_log_create((const char *)FCLogSubsystemIdentifier, "AutoFavoritesService");
  v11 = (void *)FCAutoFavoritesServiceLog;
  FCAutoFavoritesServiceLog = (uint64_t)v10;

  v12 = os_log_create((const char *)FCLogSubsystemIdentifier, "AVAsset");
  v13 = (void *)FCAVAssetLog;
  FCAVAssetLog = (uint64_t)v12;

  v14 = os_log_create((const char *)FCLogSubsystemIdentifier, "Biome");
  v15 = (void *)FCBiomeLog;
  FCBiomeLog = (uint64_t)v14;

  v16 = os_log_create((const char *)FCLogSubsystemIdentifier, "ChannelPicker");
  v17 = (void *)FCChannelPickerLog;
  FCChannelPickerLog = (uint64_t)v16;

  v18 = os_log_create((const char *)FCLogSubsystemIdentifier, "CloudKit");
  v19 = (void *)FCCloudKitLog;
  FCCloudKitLog = (uint64_t)v18;

  v20 = os_log_create((const char *)FCLogSubsystemIdentifier, "CommandQueue");
  v21 = (void *)FCCommandQueueLog;
  FCCommandQueueLog = (uint64_t)v20;

  v22 = os_log_create((const char *)FCLogSubsystemIdentifier, "CurrentIssuesChecker");
  v23 = (void *)FCCurrentIssuesCheckerLog;
  FCCurrentIssuesCheckerLog = (uint64_t)v22;

  v24 = os_log_create((const char *)FCLogSubsystemIdentifier, "DES");
  v25 = (void *)FCDESLog;
  FCDESLog = (uint64_t)v24;

  v26 = os_log_create((const char *)FCLogSubsystemIdentifier, "Diagnostics");
  v27 = (void *)FCDiagnosticsLog;
  FCDiagnosticsLog = (uint64_t)v26;

  v28 = os_log_create((const char *)FCLogSubsystemIdentifier, "ESLInventory");
  v29 = (void *)FCESLInventoryLog;
  FCESLInventoryLog = (uint64_t)v28;

  v30 = os_log_create((const char *)FCLogSubsystemIdentifier, "FeedItemInventory");
  v31 = (void *)FCFeedItemInventoryLog;
  FCFeedItemInventoryLog = (uint64_t)v30;

  v32 = os_log_create((const char *)FCLogSubsystemIdentifier, "FeedDatabase");
  v33 = (void *)FCFeedDatabaseLog;
  FCFeedDatabaseLog = (uint64_t)v32;

  v34 = os_log_create((const char *)FCLogSubsystemIdentifier, "FeedTransform");
  v35 = (void *)FCFeedItemTransformationLog;
  FCFeedItemTransformationLog = (uint64_t)v34;

  v36 = os_log_create((const char *)FCLogSubsystemIdentifier, "FeedPrewarm");
  v37 = (void *)FCFeedPrewarmLog;
  FCFeedPrewarmLog = (uint64_t)v36;

  v38 = os_log_create((const char *)FCLogSubsystemIdentifier, "FeedViewport");
  v39 = (void *)FCFeedViewportLog;
  FCFeedViewportLog = (uint64_t)v38;

  v40 = os_log_create((const char *)FCLogSubsystemIdentifier, "LocalAreas");
  v41 = (void *)FCLocalAreasLog;
  FCLocalAreasLog = (uint64_t)v40;

  v42 = os_log_create((const char *)FCLogSubsystemIdentifier, "Network");
  v43 = (void *)FCNetworkLog;
  FCNetworkLog = (uint64_t)v42;

  v44 = os_log_create((const char *)FCLogSubsystemIdentifier, "Newsletter");
  v45 = (void *)FCNewsletterLog;
  FCNewsletterLog = (uint64_t)v44;

  v46 = os_log_create((const char *)FCLogSubsystemIdentifier, "OfflineDownloads");
  v47 = (void *)FCOfflineDownloadsLog;
  FCOfflineDownloadsLog = (uint64_t)v46;

  v48 = os_log_create((const char *)FCLogSubsystemIdentifier, "OpenInNews");
  v49 = (void *)FCOpenInNewsLog;
  FCOpenInNewsLog = (uint64_t)v48;

  v50 = os_log_create((const char *)FCLogSubsystemIdentifier, "Operations");
  v51 = (void *)FCOperationLog;
  FCOperationLog = (uint64_t)v50;

  v52 = os_log_create((const char *)FCLogSubsystemIdentifier, "Paywall");
  v53 = (void *)FCPaywallLog;
  FCPaywallLog = (uint64_t)v52;

  v54 = os_log_create((const char *)FCLogSubsystemIdentifier, "Personalization");
  v55 = (void *)FCPersonalizationLog;
  FCPersonalizationLog = (uint64_t)v54;

  v56 = os_log_create((const char *)FCLogSubsystemIdentifier, "PPT");
  v57 = (void *)FCPPTLog;
  FCPPTLog = (uint64_t)v56;

  v58 = os_log_create((const char *)FCLogSubsystemIdentifier, "PrivateDataEncryptionCrash");
  v59 = (void *)FCPrivateDataEncryptionCrashLog;
  FCPrivateDataEncryptionCrashLog = (uint64_t)v58;

  v60 = os_log_create((const char *)FCLogSubsystemIdentifier, "PrivateDataEncryption");
  v61 = (void *)FCPrivateDataEncryptionLog;
  FCPrivateDataEncryptionLog = (uint64_t)v60;

  v62 = os_log_create((const char *)FCLogSubsystemIdentifier, "PrivateData");
  v63 = (void *)FCPrivateDataLog;
  FCPrivateDataLog = (uint64_t)v62;

  v64 = os_log_create((const char *)FCLogSubsystemIdentifier, "ProgressivePersonalization");
  v65 = (void *)FCProgressivePersonalizationLog;
  FCProgressivePersonalizationLog = (uint64_t)v64;

  v66 = os_log_create((const char *)FCLogSubsystemIdentifier, "Purchase");
  v67 = (void *)FCPurchaseLog;
  FCPurchaseLog = (uint64_t)v66;

  v68 = os_log_create((const char *)FCLogSubsystemIdentifier, "PushNotifications");
  v69 = (void *)FCPushNotificationsLog;
  FCPushNotificationsLog = (uint64_t)v68;

  v70 = os_log_create((const char *)FCLogSubsystemIdentifier, "Puzzle");
  v71 = (void *)FCPuzzleLog;
  FCPuzzleLog = (uint64_t)v70;

  v72 = os_log_create((const char *)FCLogSubsystemIdentifier, "Reachability");
  v73 = (void *)FCReachabilityLog;
  FCReachabilityLog = (uint64_t)v72;

  v74 = os_log_create((const char *)FCLogSubsystemIdentifier, "ReadonlyPersonalizationAggregateStore");
  v75 = (void *)FCReadonlyPersonalizationAggregateStoreLog;
  FCReadonlyPersonalizationAggregateStoreLog = (uint64_t)v74;

  v76 = os_log_create((const char *)FCLogSubsystemIdentifier, "RecordSource");
  v77 = (void *)FCRecordSourceLog;
  FCRecordSourceLog = (uint64_t)v76;

  v78 = os_log_create((const char *)FCLogSubsystemIdentifier, "FavoriteList");
  v79 = (void *)FCShortcutListLog;
  FCShortcutListLog = (uint64_t)v78;

  v80 = os_log_create((const char *)FCLogSubsystemIdentifier, "ShortcutCategoryList");
  v81 = (void *)FCShortcutCategoryListLog;
  FCShortcutCategoryListLog = (uint64_t)v80;

  v82 = os_log_create((const char *)FCLogSubsystemIdentifier, "StatelessPersonalization");
  v83 = (void *)FCStatelessPersonalizationLog;
  FCStatelessPersonalizationLog = (uint64_t)v82;

  v84 = os_log_create((const char *)FCLogSubsystemIdentifier, "SubscriptionList");
  v85 = (void *)FCSubscriptionListLog;
  FCSubscriptionListLog = (uint64_t)v84;

  v86 = os_log_create((const char *)FCLogSubsystemIdentifier, "TabiConfiguration");
  v87 = (void *)FCTabiConfigurationLog;
  FCTabiConfigurationLog = (uint64_t)v86;

  v88 = os_log_create((const char *)FCLogSubsystemIdentifier, "TagRecommendation");
  v89 = (void *)FCTagRecommendationLog;
  FCTagRecommendationLog = (uint64_t)v88;

  v90 = os_log_create((const char *)FCLogSubsystemIdentifier, "TopStories");
  v91 = (void *)FCTopStoriesLog;
  FCTopStoriesLog = (uint64_t)v90;

  v92 = os_log_create((const char *)FCLogSubsystemIdentifier, "Translation");
  v93 = (void *)FCTranslationLog;
  FCTranslationLog = (uint64_t)v92;

  v94 = os_log_create((const char *)FCLogSubsystemIdentifier, "UserEvents");
  v95 = (void *)FCUserEventsLog;
  FCUserEventsLog = (uint64_t)v94;

  v96 = os_log_create((const char *)FCLogSubsystemIdentifier, "UserEventsStorage");
  v97 = (void *)FCUserEventsStorageLog;
  FCUserEventsStorageLog = (uint64_t)v96;

  v98 = os_log_create((const char *)FCLogSubsystemIdentifier, "UserInfo");
  v99 = (void *)FCUserInfoLog;
  FCUserInfoLog = (uint64_t)v98;

  v100 = os_log_create((const char *)FCLogSubsystemIdentifier, "VanityURL");
  v101 = (void *)FCVanityURLLog;
  FCVanityURLLog = (uint64_t)v100;

  v102 = os_log_create((const char *)FCLogSubsystemIdentifier, "WebURLResolution");
  v103 = (void *)FCWebURLResolutionLog;
  FCWebURLResolutionLog = (uint64_t)v102;

}

@end
