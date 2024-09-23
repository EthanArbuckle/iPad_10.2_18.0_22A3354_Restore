@implementation ATXModeSetupPredictionFeatures

- (ATXModeSetupPredictionFeatures)init
{
  ATXModeSetupPredictionFeatures *v2;
  ATXModeSetupPredictionFeatures *v3;
  NSNumber *globalAllPagesFolderCount;
  NSNumber *globalAllPagesWidgetCount;
  NSNumber *homePageFolderCountBucket;
  NSNumber *homePageWidgetCountBucket;
  NSNumber *globalAppLaunchCountWithinLastNDays;
  NSNumber *globalAppLaunchCountWithinLast1Day;
  NSNumber *modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays;
  NSNumber *modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day;
  NSNumber *modeInferredDurationInLastNDays;
  NSNumber *modeInferredDurationInLast1Day;
  NSNumber *modeInferredCountInLastNDays;
  NSNumber *modeInferredCountInLast1Day;
  NSNumber *modeCountOfNotificationsClearedWithinLastNDays;
  NSNumber *modeCountOfNotificationsClearedWithinLast1Day;
  NSNumber *globalCountOfNotificationsClearedWithinLastNDays;
  NSNumber *globalCountOfNotificationsClearedWithinLast1Day;
  NSNumber *modeCountOfNotificationsReceivedWithinLastNDays;
  NSNumber *modeCountOfNotificationsReceivedWithinLast1Day;
  NSNumber *globalCountOfNotificationsReceivedWithinLastNDays;
  NSNumber *globalCountOfNotificationsReceivedWithinLast1Day;
  NSNumber *modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays;
  NSNumber *modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day;
  NSNumber *globalPosterConfigurationsCount;
  NSNumber *globalInterruptedAppSessionsCountWithinLastNDays;
  NSNumber *globalInterruptedAppSessionsCountWithinLast1Day;
  NSNumber *modeInterruptedAppSessionsCountWithinLastNDays;
  NSNumber *modeInterruptedAppSessionsCountWithinLast1Day;
  NSNumber *modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode;
  NSNumber *modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode;
  NSNumber *modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode;
  NSNumber *modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)ATXModeSetupPredictionFeatures;
  v2 = -[ATXModeSetupPredictionFeatures init](&v36, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isDigestCurrentlyEnabled = 0;
    globalAllPagesFolderCount = v2->_globalAllPagesFolderCount;
    v2->_globalAllPagesFolderCount = (NSNumber *)&unk_1E83CBFE0;

    globalAllPagesWidgetCount = v3->_globalAllPagesWidgetCount;
    v3->_globalAllPagesWidgetCount = (NSNumber *)&unk_1E83CBFE0;

    homePageFolderCountBucket = v3->_homePageFolderCountBucket;
    v3->_homePageFolderCountBucket = (NSNumber *)&unk_1E83CBFE0;

    homePageWidgetCountBucket = v3->_homePageWidgetCountBucket;
    v3->_homePageWidgetCountBucket = (NSNumber *)&unk_1E83CBFE0;

    globalAppLaunchCountWithinLastNDays = v3->_globalAppLaunchCountWithinLastNDays;
    v3->_globalAppLaunchCountWithinLastNDays = (NSNumber *)&unk_1E83CBFE0;

    globalAppLaunchCountWithinLast1Day = v3->_globalAppLaunchCountWithinLast1Day;
    v3->_globalAppLaunchCountWithinLast1Day = (NSNumber *)&unk_1E83CBFE0;

    modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays = v3->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays;
    v3->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays = (NSNumber *)&unk_1E83CBFE0;

    modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day = v3->_modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day;
    v3->_modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day = (NSNumber *)&unk_1E83CBFE0;

    modeInferredDurationInLastNDays = v3->_modeInferredDurationInLastNDays;
    v3->_modeInferredDurationInLastNDays = (NSNumber *)&unk_1E83CBFE0;

    modeInferredDurationInLast1Day = v3->_modeInferredDurationInLast1Day;
    v3->_modeInferredDurationInLast1Day = (NSNumber *)&unk_1E83CBFE0;

    modeInferredCountInLastNDays = v3->_modeInferredCountInLastNDays;
    v3->_modeInferredCountInLastNDays = (NSNumber *)&unk_1E83CBFE0;

    modeInferredCountInLast1Day = v3->_modeInferredCountInLast1Day;
    v3->_modeInferredCountInLast1Day = (NSNumber *)&unk_1E83CBFE0;

    modeCountOfNotificationsClearedWithinLastNDays = v3->_modeCountOfNotificationsClearedWithinLastNDays;
    v3->_modeCountOfNotificationsClearedWithinLastNDays = (NSNumber *)&unk_1E83CBFE0;

    modeCountOfNotificationsClearedWithinLast1Day = v3->_modeCountOfNotificationsClearedWithinLast1Day;
    v3->_modeCountOfNotificationsClearedWithinLast1Day = (NSNumber *)&unk_1E83CBFE0;

    globalCountOfNotificationsClearedWithinLastNDays = v3->_globalCountOfNotificationsClearedWithinLastNDays;
    v3->_globalCountOfNotificationsClearedWithinLastNDays = (NSNumber *)&unk_1E83CBFE0;

    globalCountOfNotificationsClearedWithinLast1Day = v3->_globalCountOfNotificationsClearedWithinLast1Day;
    v3->_globalCountOfNotificationsClearedWithinLast1Day = (NSNumber *)&unk_1E83CBFE0;

    modeCountOfNotificationsReceivedWithinLastNDays = v3->_modeCountOfNotificationsReceivedWithinLastNDays;
    v3->_modeCountOfNotificationsReceivedWithinLastNDays = (NSNumber *)&unk_1E83CBFE0;

    modeCountOfNotificationsReceivedWithinLast1Day = v3->_modeCountOfNotificationsReceivedWithinLast1Day;
    v3->_modeCountOfNotificationsReceivedWithinLast1Day = (NSNumber *)&unk_1E83CBFE0;

    globalCountOfNotificationsReceivedWithinLastNDays = v3->_globalCountOfNotificationsReceivedWithinLastNDays;
    v3->_globalCountOfNotificationsReceivedWithinLastNDays = (NSNumber *)&unk_1E83CBFE0;

    globalCountOfNotificationsReceivedWithinLast1Day = v3->_globalCountOfNotificationsReceivedWithinLast1Day;
    v3->_globalCountOfNotificationsReceivedWithinLast1Day = (NSNumber *)&unk_1E83CBFE0;

    modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays = v3->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays;
    v3->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays = (NSNumber *)&unk_1E83CBFE0;

    modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day = v3->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day;
    v3->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day = (NSNumber *)&unk_1E83CBFE0;

    globalPosterConfigurationsCount = v3->_globalPosterConfigurationsCount;
    v3->_globalPosterConfigurationsCount = (NSNumber *)&unk_1E83CBFE0;

    globalInterruptedAppSessionsCountWithinLastNDays = v3->_globalInterruptedAppSessionsCountWithinLastNDays;
    v3->_globalInterruptedAppSessionsCountWithinLastNDays = (NSNumber *)&unk_1E83CBFE0;

    globalInterruptedAppSessionsCountWithinLast1Day = v3->_globalInterruptedAppSessionsCountWithinLast1Day;
    v3->_globalInterruptedAppSessionsCountWithinLast1Day = (NSNumber *)&unk_1E83CBFE0;

    modeInterruptedAppSessionsCountWithinLastNDays = v3->_modeInterruptedAppSessionsCountWithinLastNDays;
    v3->_modeInterruptedAppSessionsCountWithinLastNDays = (NSNumber *)&unk_1E83CBFE0;

    modeInterruptedAppSessionsCountWithinLast1Day = v3->_modeInterruptedAppSessionsCountWithinLast1Day;
    v3->_modeInterruptedAppSessionsCountWithinLast1Day = (NSNumber *)&unk_1E83CBFE0;

    modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode = v3->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode;
    v3->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode = (NSNumber *)&unk_1E83CBFE0;

    modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode = v3->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode;
    v3->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode = (NSNumber *)&unk_1E83CBFE0;

    modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode = v3->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode;
    v3->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode = (NSNumber *)&unk_1E83CBFE0;

    modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode = v3->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode;
    v3->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode = (NSNumber *)&unk_1E83CBFE0;

  }
  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXModeSetupPredictionFeatures *v5;
  void *v6;
  uint64_t v7;
  NSNumber *globalAllPagesFolderCount;
  uint64_t v9;
  NSNumber *globalAllPagesWidgetCount;
  uint64_t v11;
  NSNumber *homePageFolderCountBucket;
  uint64_t v13;
  NSNumber *homePageWidgetCountBucket;
  uint64_t v15;
  NSNumber *globalAppLaunchCountWithinLastNDays;
  uint64_t v17;
  NSNumber *globalAppLaunchCountWithinLast1Day;
  uint64_t v19;
  NSNumber *modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays;
  uint64_t v21;
  NSNumber *modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day;
  uint64_t v23;
  NSNumber *modeInferredDurationInLastNDays;
  uint64_t v25;
  NSNumber *modeInferredDurationInLast1Day;
  uint64_t v27;
  NSNumber *modeInferredCountInLastNDays;
  uint64_t v29;
  NSNumber *modeInferredCountInLast1Day;
  uint64_t v31;
  NSNumber *modeCountOfNotificationsClearedWithinLastNDays;
  uint64_t v33;
  NSNumber *modeCountOfNotificationsClearedWithinLast1Day;
  uint64_t v35;
  NSNumber *globalCountOfNotificationsClearedWithinLastNDays;
  uint64_t v37;
  NSNumber *globalCountOfNotificationsClearedWithinLast1Day;
  uint64_t v39;
  NSNumber *modeCountOfNotificationsReceivedWithinLastNDays;
  uint64_t v41;
  NSNumber *modeCountOfNotificationsReceivedWithinLast1Day;
  uint64_t v43;
  NSNumber *globalCountOfNotificationsReceivedWithinLastNDays;
  uint64_t v45;
  NSNumber *globalCountOfNotificationsReceivedWithinLast1Day;
  uint64_t v47;
  NSNumber *modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays;
  uint64_t v49;
  NSNumber *modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day;
  uint64_t v51;
  NSNumber *globalPosterConfigurationsCount;
  uint64_t v53;
  NSNumber *globalInterruptedAppSessionsCountWithinLastNDays;
  uint64_t v55;
  NSNumber *globalInterruptedAppSessionsCountWithinLast1Day;
  uint64_t v57;
  NSNumber *modeInterruptedAppSessionsCountWithinLastNDays;
  uint64_t v59;
  NSNumber *modeInterruptedAppSessionsCountWithinLast1Day;
  uint64_t v61;
  NSNumber *modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode;
  uint64_t v63;
  NSNumber *modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode;
  uint64_t v65;
  NSNumber *modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode;
  uint64_t v67;
  NSNumber *modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode;
  objc_super v70;

  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)ATXModeSetupPredictionFeatures;
  v5 = -[ATXModeSetupPredictionFeatures init](&v70, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDigestCurrentlyEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isDigestCurrentlyEnabled = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalAllPagesFolderCount"));
    v7 = objc_claimAutoreleasedReturnValue();
    globalAllPagesFolderCount = v5->_globalAllPagesFolderCount;
    v5->_globalAllPagesFolderCount = (NSNumber *)v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalAllPagesWidgetCount"));
    v9 = objc_claimAutoreleasedReturnValue();
    globalAllPagesWidgetCount = v5->_globalAllPagesWidgetCount;
    v5->_globalAllPagesWidgetCount = (NSNumber *)v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homePageFolderCountBucket"));
    v11 = objc_claimAutoreleasedReturnValue();
    homePageFolderCountBucket = v5->_homePageFolderCountBucket;
    v5->_homePageFolderCountBucket = (NSNumber *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homePageWidgetCountBucket"));
    v13 = objc_claimAutoreleasedReturnValue();
    homePageWidgetCountBucket = v5->_homePageWidgetCountBucket;
    v5->_homePageWidgetCountBucket = (NSNumber *)v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalAppLaunchCountWithinLastNDays"));
    v15 = objc_claimAutoreleasedReturnValue();
    globalAppLaunchCountWithinLastNDays = v5->_globalAppLaunchCountWithinLastNDays;
    v5->_globalAppLaunchCountWithinLastNDays = (NSNumber *)v15;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalAppLaunchCountWithinLast1Day"));
    v17 = objc_claimAutoreleasedReturnValue();
    globalAppLaunchCountWithinLast1Day = v5->_globalAppLaunchCountWithinLast1Day;
    v5->_globalAppLaunchCountWithinLast1Day = (NSNumber *)v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays"));
    v19 = objc_claimAutoreleasedReturnValue();
    modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays = v5->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays;
    v5->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays = (NSNumber *)v19;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day"));
    v21 = objc_claimAutoreleasedReturnValue();
    modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day = v5->_modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day;
    v5->_modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day = (NSNumber *)v21;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeInferredDurationInLastNDays"));
    v23 = objc_claimAutoreleasedReturnValue();
    modeInferredDurationInLastNDays = v5->_modeInferredDurationInLastNDays;
    v5->_modeInferredDurationInLastNDays = (NSNumber *)v23;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeInferredDurationInLast1Day"));
    v25 = objc_claimAutoreleasedReturnValue();
    modeInferredDurationInLast1Day = v5->_modeInferredDurationInLast1Day;
    v5->_modeInferredDurationInLast1Day = (NSNumber *)v25;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeInferredCountInLastNDays"));
    v27 = objc_claimAutoreleasedReturnValue();
    modeInferredCountInLastNDays = v5->_modeInferredCountInLastNDays;
    v5->_modeInferredCountInLastNDays = (NSNumber *)v27;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeInferredCountInLast1Day"));
    v29 = objc_claimAutoreleasedReturnValue();
    modeInferredCountInLast1Day = v5->_modeInferredCountInLast1Day;
    v5->_modeInferredCountInLast1Day = (NSNumber *)v29;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeCountOfNotificationsClearedWithinLastNDays"));
    v31 = objc_claimAutoreleasedReturnValue();
    modeCountOfNotificationsClearedWithinLastNDays = v5->_modeCountOfNotificationsClearedWithinLastNDays;
    v5->_modeCountOfNotificationsClearedWithinLastNDays = (NSNumber *)v31;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeCountOfNotificationsClearedWithinLast1Day"));
    v33 = objc_claimAutoreleasedReturnValue();
    modeCountOfNotificationsClearedWithinLast1Day = v5->_modeCountOfNotificationsClearedWithinLast1Day;
    v5->_modeCountOfNotificationsClearedWithinLast1Day = (NSNumber *)v33;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalCountOfNotificationsClearedWithinLastNDays"));
    v35 = objc_claimAutoreleasedReturnValue();
    globalCountOfNotificationsClearedWithinLastNDays = v5->_globalCountOfNotificationsClearedWithinLastNDays;
    v5->_globalCountOfNotificationsClearedWithinLastNDays = (NSNumber *)v35;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalCountOfNotificationsClearedWithinLast1Day"));
    v37 = objc_claimAutoreleasedReturnValue();
    globalCountOfNotificationsClearedWithinLast1Day = v5->_globalCountOfNotificationsClearedWithinLast1Day;
    v5->_globalCountOfNotificationsClearedWithinLast1Day = (NSNumber *)v37;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeCountOfNotificationsReceivedWithinLastNDays"));
    v39 = objc_claimAutoreleasedReturnValue();
    modeCountOfNotificationsReceivedWithinLastNDays = v5->_modeCountOfNotificationsReceivedWithinLastNDays;
    v5->_modeCountOfNotificationsReceivedWithinLastNDays = (NSNumber *)v39;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeCountOfNotificationsReceivedWithinLast1Day"));
    v41 = objc_claimAutoreleasedReturnValue();
    modeCountOfNotificationsReceivedWithinLast1Day = v5->_modeCountOfNotificationsReceivedWithinLast1Day;
    v5->_modeCountOfNotificationsReceivedWithinLast1Day = (NSNumber *)v41;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalCountOfNotificationsReceivedWithinLastNDays"));
    v43 = objc_claimAutoreleasedReturnValue();
    globalCountOfNotificationsReceivedWithinLastNDays = v5->_globalCountOfNotificationsReceivedWithinLastNDays;
    v5->_globalCountOfNotificationsReceivedWithinLastNDays = (NSNumber *)v43;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalCountOfNotificationsReceivedWithinLast1Day"));
    v45 = objc_claimAutoreleasedReturnValue();
    globalCountOfNotificationsReceivedWithinLast1Day = v5->_globalCountOfNotificationsReceivedWithinLast1Day;
    v5->_globalCountOfNotificationsReceivedWithinLast1Day = (NSNumber *)v45;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays"));
    v47 = objc_claimAutoreleasedReturnValue();
    modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays = v5->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays;
    v5->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays = (NSNumber *)v47;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day"));
    v49 = objc_claimAutoreleasedReturnValue();
    modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day = v5->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day;
    v5->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day = (NSNumber *)v49;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalPosterConfigurationsCount"));
    v51 = objc_claimAutoreleasedReturnValue();
    globalPosterConfigurationsCount = v5->_globalPosterConfigurationsCount;
    v5->_globalPosterConfigurationsCount = (NSNumber *)v51;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalInterruptedAppSessionsCountWithinLastNDays"));
    v53 = objc_claimAutoreleasedReturnValue();
    globalInterruptedAppSessionsCountWithinLastNDays = v5->_globalInterruptedAppSessionsCountWithinLastNDays;
    v5->_globalInterruptedAppSessionsCountWithinLastNDays = (NSNumber *)v53;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("globalInterruptedAppSessionsCountWithinLast1Day"));
    v55 = objc_claimAutoreleasedReturnValue();
    globalInterruptedAppSessionsCountWithinLast1Day = v5->_globalInterruptedAppSessionsCountWithinLast1Day;
    v5->_globalInterruptedAppSessionsCountWithinLast1Day = (NSNumber *)v55;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeInterruptedAppSessionsCountWithinLastNDays"));
    v57 = objc_claimAutoreleasedReturnValue();
    modeInterruptedAppSessionsCountWithinLastNDays = v5->_modeInterruptedAppSessionsCountWithinLastNDays;
    v5->_modeInterruptedAppSessionsCountWithinLastNDays = (NSNumber *)v57;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeInterruptedAppSessionsCountWithinLast1Day"));
    v59 = objc_claimAutoreleasedReturnValue();
    modeInterruptedAppSessionsCountWithinLast1Day = v5->_modeInterruptedAppSessionsCountWithinLast1Day;
    v5->_modeInterruptedAppSessionsCountWithinLast1Day = (NSNumber *)v59;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode"));
    v61 = objc_claimAutoreleasedReturnValue();
    modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode = v5->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode;
    v5->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode = (NSNumber *)v61;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode"));
    v63 = objc_claimAutoreleasedReturnValue();
    modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode = v5->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode;
    v5->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode = (NSNumber *)v63;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode"));
    v65 = objc_claimAutoreleasedReturnValue();
    modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode = v5->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode;
    v5->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode = (NSNumber *)v65;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode"));
    v67 = objc_claimAutoreleasedReturnValue();
    modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode = v5->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode;
    v5->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode = (NSNumber *)v67;

  }
  return v5;
}

- (id)jsonRepresentation
{
  void *v3;
  NSNumber *globalAllPagesFolderCount;
  NSNumber *globalAllPagesWidgetCount;
  NSNumber *globalAppLaunchCountWithinLastNDays;
  NSNumber *globalAppLaunchCountWithinLast1Day;
  __int128 v8;
  NSNumber *modeCountOfNotificationsClearedWithinLastNDays;
  NSNumber *globalCountOfNotificationsClearedWithinLastNDays;
  NSNumber *modeCountOfNotificationsReceivedWithinLastNDays;
  NSNumber *globalCountOfNotificationsReceivedWithinLastNDays;
  NSNumber *modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays;
  NSNumber *globalPosterConfigurationsCount;
  NSNumber *globalInterruptedAppSessionsCountWithinLast1Day;
  NSNumber *modeInterruptedAppSessionsCountWithinLast1Day;
  NSNumber *modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode;
  NSNumber *modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode;
  void *v19;
  _QWORD v21[32];
  _QWORD v22[3];
  __int128 v23;
  NSNumber *v24;
  NSNumber *v25;
  __int128 v26;
  NSNumber *modeInferredDurationInLastNDays;
  __int128 v28;
  NSNumber *modeInferredCountInLast1Day;
  NSNumber *v30;
  NSNumber *modeCountOfNotificationsClearedWithinLast1Day;
  NSNumber *v32;
  NSNumber *globalCountOfNotificationsClearedWithinLast1Day;
  NSNumber *v34;
  NSNumber *modeCountOfNotificationsReceivedWithinLast1Day;
  NSNumber *v36;
  NSNumber *globalCountOfNotificationsReceivedWithinLast1Day;
  NSNumber *v38;
  NSNumber *modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day;
  NSNumber *v40;
  NSNumber *globalInterruptedAppSessionsCountWithinLastNDays;
  NSNumber *v42;
  NSNumber *modeInterruptedAppSessionsCountWithinLastNDays;
  NSNumber *v44;
  NSNumber *modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode;
  NSNumber *v46;
  NSNumber *modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode;
  NSNumber *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("isDigestCurrentlyEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDigestCurrentlyEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  globalAllPagesFolderCount = self->_globalAllPagesFolderCount;
  globalAllPagesWidgetCount = self->_globalAllPagesWidgetCount;
  v22[0] = v3;
  v22[1] = globalAllPagesFolderCount;
  v21[1] = CFSTR("globalAllPagesFolderCount");
  v21[2] = CFSTR("globalAllPagesWidgetCount");
  v23 = *(_OWORD *)&self->_homePageFolderCountBucket;
  v21[3] = CFSTR("homePageFolderCountBucket");
  v21[4] = CFSTR("homePageWidgetCountBucket");
  globalAppLaunchCountWithinLastNDays = self->_globalAppLaunchCountWithinLastNDays;
  globalAppLaunchCountWithinLast1Day = self->_globalAppLaunchCountWithinLast1Day;
  v22[2] = globalAllPagesWidgetCount;
  v24 = globalAppLaunchCountWithinLastNDays;
  v25 = globalAppLaunchCountWithinLast1Day;
  v21[5] = CFSTR("globalAppLaunchCountWithinLastNDays");
  v21[6] = CFSTR("globalAppLaunchCountWithinLast1Day");
  v26 = *(_OWORD *)&self->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays;
  v21[7] = CFSTR("modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays");
  v21[8] = CFSTR("modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day");
  modeInferredDurationInLastNDays = self->_modeInferredDurationInLastNDays;
  v21[9] = CFSTR("modeInferredDurationInLastNDays");
  v21[10] = CFSTR("modeInferredDurationInLast1Day");
  v8 = *(_OWORD *)&self->_modeInferredDurationInLast1Day;
  v21[11] = CFSTR("modeInferredCountInLastNDays");
  v21[12] = CFSTR("modeInferredCountInLast1Day");
  modeCountOfNotificationsClearedWithinLastNDays = self->_modeCountOfNotificationsClearedWithinLastNDays;
  modeInferredCountInLast1Day = self->_modeInferredCountInLast1Day;
  v30 = modeCountOfNotificationsClearedWithinLastNDays;
  v21[13] = CFSTR("modeCountOfNotificationsClearedWithinLastNDays");
  v21[14] = CFSTR("modeCountOfNotificationsClearedWithinLast1Day");
  globalCountOfNotificationsClearedWithinLastNDays = self->_globalCountOfNotificationsClearedWithinLastNDays;
  modeCountOfNotificationsClearedWithinLast1Day = self->_modeCountOfNotificationsClearedWithinLast1Day;
  v32 = globalCountOfNotificationsClearedWithinLastNDays;
  v21[15] = CFSTR("globalCountOfNotificationsClearedWithinLastNDays");
  v21[16] = CFSTR("globalCountOfNotificationsClearedWithinLast1Day");
  modeCountOfNotificationsReceivedWithinLastNDays = self->_modeCountOfNotificationsReceivedWithinLastNDays;
  globalCountOfNotificationsClearedWithinLast1Day = self->_globalCountOfNotificationsClearedWithinLast1Day;
  v34 = modeCountOfNotificationsReceivedWithinLastNDays;
  v21[17] = CFSTR("modeCountOfNotificationsReceivedWithinLastNDays");
  v21[18] = CFSTR("modeCountOfNotificationsReceivedWithinLast1Day");
  globalCountOfNotificationsReceivedWithinLastNDays = self->_globalCountOfNotificationsReceivedWithinLastNDays;
  modeCountOfNotificationsReceivedWithinLast1Day = self->_modeCountOfNotificationsReceivedWithinLast1Day;
  v36 = globalCountOfNotificationsReceivedWithinLastNDays;
  v21[19] = CFSTR("globalCountOfNotificationsReceivedWithinLastNDays");
  v21[20] = CFSTR("globalCountOfNotificationsReceivedWithinLast1Day");
  modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays = self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays;
  globalCountOfNotificationsReceivedWithinLast1Day = self->_globalCountOfNotificationsReceivedWithinLast1Day;
  v38 = modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays;
  v21[21] = CFSTR("modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays");
  v21[22] = CFSTR("modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day");
  globalPosterConfigurationsCount = self->_globalPosterConfigurationsCount;
  modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day = self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day;
  v40 = globalPosterConfigurationsCount;
  v21[23] = CFSTR("globalPosterConfigurationsCount");
  v21[24] = CFSTR("globalInterruptedAppSessionsCountWithinLastNDays");
  globalInterruptedAppSessionsCountWithinLast1Day = self->_globalInterruptedAppSessionsCountWithinLast1Day;
  globalInterruptedAppSessionsCountWithinLastNDays = self->_globalInterruptedAppSessionsCountWithinLastNDays;
  v42 = globalInterruptedAppSessionsCountWithinLast1Day;
  v21[25] = CFSTR("globalInterruptedAppSessionsCountWithinLast1Day");
  v21[26] = CFSTR("modeInterruptedAppSessionsCountWithinLastNDays");
  modeInterruptedAppSessionsCountWithinLast1Day = self->_modeInterruptedAppSessionsCountWithinLast1Day;
  modeInterruptedAppSessionsCountWithinLastNDays = self->_modeInterruptedAppSessionsCountWithinLastNDays;
  v44 = modeInterruptedAppSessionsCountWithinLast1Day;
  v21[27] = CFSTR("modeInterruptedAppSessionsCountWithinLast1Day");
  v21[28] = CFSTR("modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode");
  modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode = self->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode;
  modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode = self->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode;
  v46 = modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode;
  v28 = v8;
  v21[29] = CFSTR("modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode");
  v21[30] = CFSTR("modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode");
  v21[31] = CFSTR("modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode");
  modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode = self->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode;
  modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode = self->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode;
  v48 = modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 32);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)isDigestCurrentlyEnabled
{
  return self->_isDigestCurrentlyEnabled;
}

- (void)setIsDigestCurrentlyEnabled:(BOOL)a3
{
  self->_isDigestCurrentlyEnabled = a3;
}

- (NSNumber)globalAllPagesFolderCount
{
  return self->_globalAllPagesFolderCount;
}

- (void)setGlobalAllPagesFolderCount:(id)a3
{
  objc_storeStrong((id *)&self->_globalAllPagesFolderCount, a3);
}

- (NSNumber)globalAllPagesWidgetCount
{
  return self->_globalAllPagesWidgetCount;
}

- (void)setGlobalAllPagesWidgetCount:(id)a3
{
  objc_storeStrong((id *)&self->_globalAllPagesWidgetCount, a3);
}

- (NSNumber)homePageFolderCountBucket
{
  return self->_homePageFolderCountBucket;
}

- (void)setHomePageFolderCountBucket:(id)a3
{
  objc_storeStrong((id *)&self->_homePageFolderCountBucket, a3);
}

- (NSNumber)homePageWidgetCountBucket
{
  return self->_homePageWidgetCountBucket;
}

- (void)setHomePageWidgetCountBucket:(id)a3
{
  objc_storeStrong((id *)&self->_homePageWidgetCountBucket, a3);
}

- (NSNumber)globalAppLaunchCountWithinLastNDays
{
  return self->_globalAppLaunchCountWithinLastNDays;
}

- (void)setGlobalAppLaunchCountWithinLastNDays:(id)a3
{
  objc_storeStrong((id *)&self->_globalAppLaunchCountWithinLastNDays, a3);
}

- (NSNumber)globalAppLaunchCountWithinLast1Day
{
  return self->_globalAppLaunchCountWithinLast1Day;
}

- (void)setGlobalAppLaunchCountWithinLast1Day:(id)a3
{
  objc_storeStrong((id *)&self->_globalAppLaunchCountWithinLast1Day, a3);
}

- (NSNumber)modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays
{
  return self->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays;
}

- (void)setModeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays:(id)a3
{
  objc_storeStrong((id *)&self->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays, a3);
}

- (NSNumber)modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day
{
  return self->_modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day;
}

- (void)setModeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day:(id)a3
{
  objc_storeStrong((id *)&self->_modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day, a3);
}

- (NSNumber)modeInferredDurationInLastNDays
{
  return self->_modeInferredDurationInLastNDays;
}

- (void)setModeInferredDurationInLastNDays:(id)a3
{
  objc_storeStrong((id *)&self->_modeInferredDurationInLastNDays, a3);
}

- (NSNumber)modeInferredDurationInLast1Day
{
  return self->_modeInferredDurationInLast1Day;
}

- (void)setModeInferredDurationInLast1Day:(id)a3
{
  objc_storeStrong((id *)&self->_modeInferredDurationInLast1Day, a3);
}

- (NSNumber)modeInferredCountInLastNDays
{
  return self->_modeInferredCountInLastNDays;
}

- (void)setModeInferredCountInLastNDays:(id)a3
{
  objc_storeStrong((id *)&self->_modeInferredCountInLastNDays, a3);
}

- (NSNumber)modeInferredCountInLast1Day
{
  return self->_modeInferredCountInLast1Day;
}

- (void)setModeInferredCountInLast1Day:(id)a3
{
  objc_storeStrong((id *)&self->_modeInferredCountInLast1Day, a3);
}

- (NSNumber)modeCountOfNotificationsClearedWithinLastNDays
{
  return self->_modeCountOfNotificationsClearedWithinLastNDays;
}

- (void)setModeCountOfNotificationsClearedWithinLastNDays:(id)a3
{
  objc_storeStrong((id *)&self->_modeCountOfNotificationsClearedWithinLastNDays, a3);
}

- (NSNumber)modeCountOfNotificationsClearedWithinLast1Day
{
  return self->_modeCountOfNotificationsClearedWithinLast1Day;
}

- (void)setModeCountOfNotificationsClearedWithinLast1Day:(id)a3
{
  objc_storeStrong((id *)&self->_modeCountOfNotificationsClearedWithinLast1Day, a3);
}

- (NSNumber)globalCountOfNotificationsClearedWithinLastNDays
{
  return self->_globalCountOfNotificationsClearedWithinLastNDays;
}

- (void)setGlobalCountOfNotificationsClearedWithinLastNDays:(id)a3
{
  objc_storeStrong((id *)&self->_globalCountOfNotificationsClearedWithinLastNDays, a3);
}

- (NSNumber)globalCountOfNotificationsClearedWithinLast1Day
{
  return self->_globalCountOfNotificationsClearedWithinLast1Day;
}

- (void)setGlobalCountOfNotificationsClearedWithinLast1Day:(id)a3
{
  objc_storeStrong((id *)&self->_globalCountOfNotificationsClearedWithinLast1Day, a3);
}

- (NSNumber)modeCountOfNotificationsReceivedWithinLastNDays
{
  return self->_modeCountOfNotificationsReceivedWithinLastNDays;
}

- (void)setModeCountOfNotificationsReceivedWithinLastNDays:(id)a3
{
  objc_storeStrong((id *)&self->_modeCountOfNotificationsReceivedWithinLastNDays, a3);
}

- (NSNumber)modeCountOfNotificationsReceivedWithinLast1Day
{
  return self->_modeCountOfNotificationsReceivedWithinLast1Day;
}

- (void)setModeCountOfNotificationsReceivedWithinLast1Day:(id)a3
{
  objc_storeStrong((id *)&self->_modeCountOfNotificationsReceivedWithinLast1Day, a3);
}

- (NSNumber)globalCountOfNotificationsReceivedWithinLastNDays
{
  return self->_globalCountOfNotificationsReceivedWithinLastNDays;
}

- (void)setGlobalCountOfNotificationsReceivedWithinLastNDays:(id)a3
{
  objc_storeStrong((id *)&self->_globalCountOfNotificationsReceivedWithinLastNDays, a3);
}

- (NSNumber)globalCountOfNotificationsReceivedWithinLast1Day
{
  return self->_globalCountOfNotificationsReceivedWithinLast1Day;
}

- (void)setGlobalCountOfNotificationsReceivedWithinLast1Day:(id)a3
{
  objc_storeStrong((id *)&self->_globalCountOfNotificationsReceivedWithinLast1Day, a3);
}

- (NSNumber)modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays
{
  return self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays;
}

- (void)setModeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays:(id)a3
{
  objc_storeStrong((id *)&self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays, a3);
}

- (NSNumber)modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day
{
  return self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day;
}

- (void)setModeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day:(id)a3
{
  objc_storeStrong((id *)&self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day, a3);
}

- (NSNumber)globalPosterConfigurationsCount
{
  return self->_globalPosterConfigurationsCount;
}

- (void)setGlobalPosterConfigurationsCount:(id)a3
{
  objc_storeStrong((id *)&self->_globalPosterConfigurationsCount, a3);
}

- (NSNumber)globalInterruptedAppSessionsCountWithinLastNDays
{
  return self->_globalInterruptedAppSessionsCountWithinLastNDays;
}

- (void)setGlobalInterruptedAppSessionsCountWithinLastNDays:(id)a3
{
  objc_storeStrong((id *)&self->_globalInterruptedAppSessionsCountWithinLastNDays, a3);
}

- (NSNumber)globalInterruptedAppSessionsCountWithinLast1Day
{
  return self->_globalInterruptedAppSessionsCountWithinLast1Day;
}

- (void)setGlobalInterruptedAppSessionsCountWithinLast1Day:(id)a3
{
  objc_storeStrong((id *)&self->_globalInterruptedAppSessionsCountWithinLast1Day, a3);
}

- (NSNumber)modeInterruptedAppSessionsCountWithinLastNDays
{
  return self->_modeInterruptedAppSessionsCountWithinLastNDays;
}

- (void)setModeInterruptedAppSessionsCountWithinLastNDays:(id)a3
{
  objc_storeStrong((id *)&self->_modeInterruptedAppSessionsCountWithinLastNDays, a3);
}

- (NSNumber)modeInterruptedAppSessionsCountWithinLast1Day
{
  return self->_modeInterruptedAppSessionsCountWithinLast1Day;
}

- (void)setModeInterruptedAppSessionsCountWithinLast1Day:(id)a3
{
  objc_storeStrong((id *)&self->_modeInterruptedAppSessionsCountWithinLast1Day, a3);
}

- (NSNumber)modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode
{
  return self->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode;
}

- (void)setModeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode:(id)a3
{
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode, a3);
}

- (NSNumber)modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode
{
  return self->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode;
}

- (void)setModeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode:(id)a3
{
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode, a3);
}

- (NSNumber)modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode
{
  return self->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode;
}

- (void)setModeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode:(id)a3
{
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode, a3);
}

- (NSNumber)modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode
{
  return self->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode;
}

- (void)setModeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode:(id)a3
{
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode, 0);
  objc_storeStrong((id *)&self->_modeInterruptedAppSessionsCountWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_modeInterruptedAppSessionsCountWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_globalInterruptedAppSessionsCountWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_globalInterruptedAppSessionsCountWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_globalPosterConfigurationsCount, 0);
  objc_storeStrong((id *)&self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsReceivedWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsReceivedWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsReceivedWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsReceivedWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsClearedWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsClearedWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsClearedWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsClearedWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_modeInferredCountInLast1Day, 0);
  objc_storeStrong((id *)&self->_modeInferredCountInLastNDays, 0);
  objc_storeStrong((id *)&self->_modeInferredDurationInLast1Day, 0);
  objc_storeStrong((id *)&self->_modeInferredDurationInLastNDays, 0);
  objc_storeStrong((id *)&self->_modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_globalAppLaunchCountWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_globalAppLaunchCountWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_homePageWidgetCountBucket, 0);
  objc_storeStrong((id *)&self->_homePageFolderCountBucket, 0);
  objc_storeStrong((id *)&self->_globalAllPagesWidgetCount, 0);
  objc_storeStrong((id *)&self->_globalAllPagesFolderCount, 0);
}

@end
