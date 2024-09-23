@implementation ATXModeSetupPredictionFeaturesCorrelator

- (ATXModeSetupPredictionFeaturesCorrelator)initWithMode:(unint64_t)a3 features:(id)a4
{
  id v7;
  ATXModeSetupPredictionFeaturesCorrelator *v8;
  ATXModeSetupPredictionFeaturesCorrelator *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ATXModeSetupPredictionFeaturesCorrelator;
  v8 = -[ATXModeSetupPredictionFeaturesCorrelator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    objc_storeStrong((id *)&v8->_modeSetupPredictionFeatures, a4);
  }

  return v9;
}

- (void)createFeatureVectorWithModeSetupPredictionFeatures
{
  void *v3;
  ATXModeInferredDurationAndCountProvider *v4;
  ATXNotificationsEventProvider *v5;
  ATXAppLaunchProvider *v6;
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
  ATXAppSessionInterruptionsProvider *v42;

  v42 = -[ATXAppSessionInterruptionsProvider initWithLastNDays:]([ATXAppSessionInterruptionsProvider alloc], "initWithLastNDays:", 7);
  v3 = (void *)objc_opt_new();
  v4 = -[ATXModeInferredDurationAndCountProvider initWithLastNDays:]([ATXModeInferredDurationAndCountProvider alloc], "initWithLastNDays:", 7);
  v5 = -[ATXNotificationsEventProvider initWithLastNDays:]([ATXNotificationsEventProvider alloc], "initWithLastNDays:", 7);
  v6 = -[ATXAppLaunchProvider initWithLastNDays:]([ATXAppLaunchProvider alloc], "initWithLastNDays:", 7);
  -[ATXModeSetupPredictionFeatures setIsDigestCurrentlyEnabled:](self->_modeSetupPredictionFeatures, "setIsDigestCurrentlyEnabled:", -[ATXModeSetupPredictionFeaturesCorrelator isDigestCurrentlyEnabled](self, "isDigestCurrentlyEnabled"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "globalAllPagesFolderCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setGlobalAllPagesFolderCount:](self->_modeSetupPredictionFeatures, "setGlobalAllPagesFolderCount:", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "globalAllPagesWidgetCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setGlobalAllPagesWidgetCount:](self->_modeSetupPredictionFeatures, "setGlobalAllPagesWidgetCount:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "homePageFolderCountBucket"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setHomePageFolderCountBucket:](self->_modeSetupPredictionFeatures, "setHomePageFolderCountBucket:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "homePageWidgetCountBucket"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setHomePageWidgetCountBucket:](self->_modeSetupPredictionFeatures, "setHomePageWidgetCountBucket:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppLaunchProvider globalAppLaunchCountWithinLastNDays](v6, "globalAppLaunchCountWithinLastNDays"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setGlobalAppLaunchCountWithinLastNDays:](self->_modeSetupPredictionFeatures, "setGlobalAppLaunchCountWithinLastNDays:", v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppLaunchProvider globalAppLaunchCountWithinLast1Day](v6, "globalAppLaunchCountWithinLast1Day"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setGlobalAppLaunchCountWithinLast1Day:](self->_modeSetupPredictionFeatures, "setGlobalAppLaunchCountWithinLast1Day:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppLaunchProvider modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDaysForMode:](v6, "modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDaysForMode:", self->_mode));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays:](self->_modeSetupPredictionFeatures, "setModeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays:", v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppLaunchProvider modeAppLaunchCountBasedOnGlobalPriorsWithinLast1DayForMode:](v6, "modeAppLaunchCountBasedOnGlobalPriorsWithinLast1DayForMode:", self->_mode));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day:](self->_modeSetupPredictionFeatures, "setModeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day:", v14);

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXModeInferredDurationAndCountProvider modeInferredDurationInLastNDaysForMode:](v4, "modeInferredDurationInLastNDaysForMode:", self->_mode);
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeInferredDurationInLastNDays:](self->_modeSetupPredictionFeatures, "setModeInferredDurationInLastNDays:", v16);

  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXModeInferredDurationAndCountProvider modeInferredDurationInLast1DayForMode:](v4, "modeInferredDurationInLast1DayForMode:", self->_mode);
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeInferredDurationInLast1Day:](self->_modeSetupPredictionFeatures, "setModeInferredDurationInLast1Day:", v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeInferredDurationAndCountProvider modeInferredCountInLastNDaysForMode:](v4, "modeInferredCountInLastNDaysForMode:", self->_mode));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeInferredCountInLastNDays:](self->_modeSetupPredictionFeatures, "setModeInferredCountInLastNDays:", v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeInferredDurationAndCountProvider modeInferredCountInLast1DayForMode:](v4, "modeInferredCountInLast1DayForMode:", self->_mode));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeInferredCountInLast1Day:](self->_modeSetupPredictionFeatures, "setModeInferredCountInLast1Day:", v20);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider modeCountOfNotificationsClearedWithinLastNDaysForMode:](v5, "modeCountOfNotificationsClearedWithinLastNDaysForMode:", self->_mode));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeCountOfNotificationsClearedWithinLastNDays:](self->_modeSetupPredictionFeatures, "setModeCountOfNotificationsClearedWithinLastNDays:", v21);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider modeCountOfNotificationsClearedWithinLast1DayForMode:](v5, "modeCountOfNotificationsClearedWithinLast1DayForMode:", self->_mode));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeCountOfNotificationsClearedWithinLast1Day:](self->_modeSetupPredictionFeatures, "setModeCountOfNotificationsClearedWithinLast1Day:", v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider globalCountOfNotificationsClearedWithinLastNDays](v5, "globalCountOfNotificationsClearedWithinLastNDays"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setGlobalCountOfNotificationsClearedWithinLastNDays:](self->_modeSetupPredictionFeatures, "setGlobalCountOfNotificationsClearedWithinLastNDays:", v23);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider globalCountOfNotificationsClearedWithinLast1Day](v5, "globalCountOfNotificationsClearedWithinLast1Day"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setGlobalCountOfNotificationsClearedWithinLast1Day:](self->_modeSetupPredictionFeatures, "setGlobalCountOfNotificationsClearedWithinLast1Day:", v24);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider modeCountOfNotificationsReceivedWithinLastNDaysForMode:](v5, "modeCountOfNotificationsReceivedWithinLastNDaysForMode:", self->_mode));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeCountOfNotificationsReceivedWithinLastNDays:](self->_modeSetupPredictionFeatures, "setModeCountOfNotificationsReceivedWithinLastNDays:", v25);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider modeCountOfNotificationsReceivedWithinLast1DayForMode:](v5, "modeCountOfNotificationsReceivedWithinLast1DayForMode:", self->_mode));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeCountOfNotificationsReceivedWithinLast1Day:](self->_modeSetupPredictionFeatures, "setModeCountOfNotificationsReceivedWithinLast1Day:", v26);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider globalCountOfNotificationsReceivedWithinLastNDays](v5, "globalCountOfNotificationsReceivedWithinLastNDays"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setGlobalCountOfNotificationsReceivedWithinLastNDays:](self->_modeSetupPredictionFeatures, "setGlobalCountOfNotificationsReceivedWithinLastNDays:", v27);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider globalCountOfNotificationsReceivedWithinLast1Day](v5, "globalCountOfNotificationsReceivedWithinLast1Day"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setGlobalCountOfNotificationsReceivedWithinLast1Day:](self->_modeSetupPredictionFeatures, "setGlobalCountOfNotificationsReceivedWithinLast1Day:", v28);

  v29 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppLaunchProvider modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDaysForMode:](v6, "modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDaysForMode:", self->_mode);
  objc_msgSend(v29, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays:](self->_modeSetupPredictionFeatures, "setModeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays:", v30);

  v31 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppLaunchProvider modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1DayForMode:](v6, "modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1DayForMode:", self->_mode);
  objc_msgSend(v31, "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day:](self->_modeSetupPredictionFeatures, "setModeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day:", v32);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeSetupPredictionFeaturesCorrelator globalPosterConfigurationsCount](self, "globalPosterConfigurationsCount"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setGlobalPosterConfigurationsCount:](self->_modeSetupPredictionFeatures, "setGlobalPosterConfigurationsCount:", v33);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider globalInterruptedAppSessionsCountWithinLastNDays](v42, "globalInterruptedAppSessionsCountWithinLastNDays"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setGlobalInterruptedAppSessionsCountWithinLastNDays:](self->_modeSetupPredictionFeatures, "setGlobalInterruptedAppSessionsCountWithinLastNDays:", v34);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider globalInterruptedAppSessionsCountWithinLast1Day](v42, "globalInterruptedAppSessionsCountWithinLast1Day"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setGlobalInterruptedAppSessionsCountWithinLast1Day:](self->_modeSetupPredictionFeatures, "setGlobalInterruptedAppSessionsCountWithinLast1Day:", v35);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider modeInterruptedAppSessionsCountWithinLastNDaysForMode:](v42, "modeInterruptedAppSessionsCountWithinLastNDaysForMode:", self->_mode));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeInterruptedAppSessionsCountWithinLastNDays:](self->_modeSetupPredictionFeatures, "setModeInterruptedAppSessionsCountWithinLastNDays:", v36);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider modeInterruptedAppSessionsCountWithinLast1DayForMode:](v42, "modeInterruptedAppSessionsCountWithinLast1DayForMode:", self->_mode));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeInterruptedAppSessionsCountWithinLast1Day:](self->_modeSetupPredictionFeatures, "setModeInterruptedAppSessionsCountWithinLast1Day:", v37);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode:](v42, "modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode:", self->_mode));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode:](self->_modeSetupPredictionFeatures, "setModeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode:", v38);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode:](v42, "modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode:", self->_mode));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode:](self->_modeSetupPredictionFeatures, "setModeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode:", v39);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode:](v42, "modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode:", self->_mode));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode:](self->_modeSetupPredictionFeatures, "setModeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode:", v40);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode:](v42, "modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode:", self->_mode));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionFeatures setModeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode:](self->_modeSetupPredictionFeatures, "setModeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode:", v41);

}

- (unint64_t)globalPosterConfigurationsCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  +[ATXPosterConfigurationCache sharedInstance](ATXPosterConfigurationCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") <= 0xA)
    v4 = objc_msgSend(v3, "count");
  else
    v4 = 10;

  return v4;
}

- (BOOL)isDigestCurrentlyEnabled
{
  void *v2;
  char v3;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "digestSetupComplete");

  return v3;
}

- (id)featureVector
{
  -[ATXModeSetupPredictionFeaturesCorrelator createFeatureVectorWithModeSetupPredictionFeatures](self, "createFeatureVectorWithModeSetupPredictionFeatures");
  return -[ATXModeSetupPredictionFeatures jsonRepresentation](self->_modeSetupPredictionFeatures, "jsonRepresentation");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeSetupPredictionFeatures, 0);
}

@end
