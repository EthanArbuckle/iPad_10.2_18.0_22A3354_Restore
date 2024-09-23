@implementation IMFeatureFlags

- (BOOL)isConversationSIMLabelEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isConversationSIMLabelEnabled"));
  if (qword_1ECFC6CC8 != -1)
    dispatch_once(&qword_1ECFC6CC8, &unk_1E3FB8BF8);
  return byte_1ECFC6CC0;
}

- (BOOL)isStickersAppEnabled_iOS
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isStickersAppEnabled_iOS"));
  if (qword_1ECFC6E48 != -1)
    dispatch_once(&qword_1ECFC6E48, &unk_1E3FB8B18);
  return byte_1ECFC6E40;
}

- (BOOL)isSMSFilterSyncEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSMSFilterSyncEnabled"));
  if (qword_1ECFC6EA0 != -1)
    dispatch_once(&qword_1ECFC6EA0, &unk_1E3FB88B8);
  return byte_1ECFC6E98;
}

- (BOOL)isPriusEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isPriusEnabled"));
  if (qword_1ECFC70A0 != -1)
    dispatch_once(&qword_1ECFC70A0, &unk_1E3FB4148);
  return byte_1ECFC7098;
}

- (BOOL)isClingEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isClingEnabled"));
  if (qword_1ECFC6FA8 != -1)
    dispatch_once(&qword_1ECFC6FA8, &unk_1E3FB8AD8);
  return byte_1ECFC6FA0;
}

- (BOOL)stewieEnabled
{
  if (qword_1ECFC7108 != -1)
    dispatch_once(&qword_1ECFC7108, &unk_1E3FB3608);
  return byte_1ECFC7170;
}

+ (IMFeatureFlags)sharedFeatureFlags
{
  if (qword_1ECFC7518 != -1)
    dispatch_once(&qword_1ECFC7518, &unk_1E3FB3BC8);
  return (IMFeatureFlags *)(id)qword_1ECFC7520;
}

- (BOOL)isTranscriptSharingEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isTranscriptSharingEnabled"));
  if (qword_1ECFC7358 != -1)
    dispatch_once(&qword_1ECFC7358, &unk_1E3FB15C8);
  return byte_1ECFC7350;
}

- (BOOL)isSendMenuEnabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19E24B1D0;
  block[3] = &unk_1E3FB6B98;
  block[4] = self;
  if (qword_1ECFC6E38 != -1)
    dispatch_once(&qword_1ECFC6E38, block);
  return byte_1ECFC6E30;
}

- (BOOL)avatarViewAllowsStaleRendering
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

- (BOOL)isZelkovaEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isZelkovaEnabled"));
  if (qword_1ECFC6FC8 != -1)
    dispatch_once(&qword_1ECFC6FC8, &unk_1E3FB8B98);
  return byte_1ECFC6E60;
}

- (BOOL)isWaldoEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isWaldoEnabled"));
  if (qword_1ECFC6FC0 != -1)
    dispatch_once(&qword_1ECFC6FC0, &unk_1E3FB8A78);
  return byte_1ECFC6FB8;
}

- (BOOL)isTextKit2Enabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isTextKit2Enabled"));
  if (qword_1ECFC6E58 != -1)
    dispatch_once(&qword_1ECFC6E58, &unk_1E3FB4128);
  return byte_1ECFC6E50;
}

- (BOOL)isStickersAppEnabled
{
  return MEMORY[0x1E0DE7D20](self, sel_isStickersAppEnabled_iOS);
}

- (BOOL)isSearchTokensEnabled_iOS
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSearchTokensEnabled_iOS"));
  if (qword_1ECFC6CF0 != -1)
    dispatch_once(&qword_1ECFC6CF0, &unk_1E3FB8978);
  return byte_1ECFC6CE8;
}

- (BOOL)isSearchTokensEnabled
{
  return MEMORY[0x1E0DE7D20](self, sel_isSearchTokensEnabled_iOS);
}

- (BOOL)isModernPersistenceXPCEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isModernPersistenceXPCEnabled"));
  if (qword_1ECFC7268 != -1)
    dispatch_once(&qword_1ECFC7268, &unk_1E3FB8C98);
  return byte_1EE503DB0;
}

- (BOOL)isMessagesInICloudNewUIEnabled_iOS
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isMessagesInICloudNewUIEnabled_iOS"));
  if (qword_1EE5038A8 != -1)
    dispatch_once(&qword_1EE5038A8, &unk_1E3FB2858);
  return byte_1EE5038A0;
}

- (BOOL)isMessagesInICloudNewUIEnabled
{
  return MEMORY[0x1E0DE7D20](self, sel_isMessagesInICloudNewUIEnabled_iOS);
}

- (BOOL)isDynamicLQMDisabledByWRM
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isDynamicLQMDisabledByWRM"));
  if (qword_1ECFC7498 != -1)
    dispatch_once(&qword_1ECFC7498, &unk_1E3FB88F8);
  return byte_1ECFC74A0;
}

- (BOOL)_isSendMenuEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("_isSendMenuEnabled"));
  if (qword_1EE503BA8 != -1)
    dispatch_once(&qword_1EE503BA8, &unk_1E3FB1768);
  return byte_1EE503BA0;
}

+ (void)testWithFeature:(SEL)a3 block:(id)a4
{
  MEMORY[0x1E0DE7D20](a1, sel_testWithFeature_enabled_block_);
}

+ (void)testWithFeature:(SEL)a3 enabled:(BOOL)a4 block:(id)a5
{
  _BOOL8 v5;
  IMFeatureFlagsTestSwizzler *v7;
  void (**v8)(void);

  v5 = a4;
  v8 = (void (**)(void))a5;
  v7 = -[IMFeatureFlagsTestSwizzler initWithFeature:enabled:]([IMFeatureFlagsTestSwizzler alloc], "initWithFeature:enabled:", a3, v5);
  -[IMFeatureFlagsTestSwizzler swizzle](v7, "swizzle");
  v8[2]();
  -[IMFeatureFlagsTestSwizzler unswizzle](v7, "unswizzle");

}

- (BOOL)certifiedDeliveryEnabled
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

- (BOOL)manuallyAckMessagesEnabled
{
  return IMGetCachedDomainBoolForKey();
}

- (BOOL)conversationPinningUsesLastNameForDuplicatesEnabled
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

- (BOOL)conversationPinningMultiDragEnabled
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

- (BOOL)conversationPinningTouchdownDimEnabled
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

- (BOOL)showAllInstalledMessageApps
{
  int v2;
  void *v3;
  char v4;

  v2 = IMGetCachedDomainBoolForKeyWithDefaultValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isInternalInstall");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)showTapToRadarMessagesApp
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalInstall");

  if (v3)
    return IMGetCachedDomainBoolForKeyWithDefaultValue();
  else
    return 0;
}

- (BOOL)macToolbarEnabled
{
  return 0;
}

- (BOOL)macApplicationMetricsGatheringEnabled
{
  return 0;
}

- (BOOL)messageSyncP2Enabled
{
  if (qword_1EE503AD8 != -1)
    dispatch_once(&qword_1EE503AD8, &unk_1E3FB4108);
  return byte_1EE503AD0;
}

- (BOOL)fullTranscriptLoggingEnabled
{
  if (qword_1EE503D08 != -1)
    dispatch_once(&qword_1EE503D08, &unk_1E3FB41C8);
  return byte_1EE503EA8;
}

- (BOOL)micGroupPhotoEnabled
{
  if (qword_1EE503EB8 != -1)
    dispatch_once(&qword_1EE503EB8, &unk_1E3FB16E8);
  return byte_1EE503EB0;
}

- (BOOL)photoAnalysisInSpotlightEnabled
{
  return 0;
}

- (BOOL)threeAttachmentStackEnabled
{
  void *v2;
  char v3;

  if (qword_1ECFC6C68 != -1)
    dispatch_once(&qword_1ECFC6C68, &unk_1E3FB27D8);
  if (!byte_1EE503EC0)
    return 0;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalInstall");

  return v3;
}

- (BOOL)CKScreenshotTestFeatureFlagValue
{
  return IMGetCachedDomainBoolForKey();
}

- (id)CKScreenshotTestFeatureFlagMembers
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (BOOL)isCKScreenshotTestFeatureFlagMember:(id)a3 withDomain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[IMFeatureFlags CKScreenshotTestFeatureFlagMembers](self, "CKScreenshotTestFeatureFlagMembers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v9, "containsObject:", v7);
  return (char)v6;
}

- (BOOL)isCarrierPigeonEnabled
{
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
    return _os_feature_enabled_impl();
  else
    return 0;
}

- (BOOL)isParakeetCompressionEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isParakeetCompressionEnabled"));
  if (qword_1EE504018 != -1)
    dispatch_once(&qword_1EE504018, &unk_1E3FB38E8);
  return byte_1EE504010;
}

- (BOOL)isWatchMultiReplyEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isWatchMultiReplyEnabled"));
  if (qword_1EE504028 != -1)
    dispatch_once(&qword_1EE504028, &unk_1E3FB78A0);
  return byte_1EE504020;
}

- (BOOL)isZelkovaOnWatchEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isZelkovaOnWatchEnabled"));
  if (qword_1EE504038 != -1)
    dispatch_once(&qword_1EE504038, &unk_1E3FB2678);
  return byte_1EE504030;
}

- (BOOL)isEmojiTapbacksEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isEmojiTapbacksEnabled"));
  if (qword_1EE503D28 != -1)
    dispatch_once(&qword_1EE503D28, &unk_1E3FB2778);
  return byte_1EE503D58;
}

- (BOOL)_isModernScreenSharingEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("_isModernScreenSharingEnabled"));
  if (qword_1EE503878 != -1)
    dispatch_once(&qword_1EE503878, &unk_1E3FB17C8);
  return byte_1EE503870;
}

- (BOOL)isModernScreenSharingEnabled
{
  return MEMORY[0x1E0DE7D20](self, sel__isModernScreenSharingEnabled);
}

- (BOOL)isSwipeToReplyOnWatchEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSwipeToReplyOnWatchEnabled"));
  if (qword_1EE504048 != -1)
    dispatch_once(&qword_1EE504048, &unk_1E3FB78C0);
  return byte_1EE504040;
}

- (BOOL)isExpressiveTextEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isStaticTextEffectMenusEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isStaticTextEffectMenusEnabled"));
  if (qword_1EE503A98 != -1)
    dispatch_once(&qword_1EE503A98, &unk_1E3FB4488);
  return byte_1EE504050;
}

- (BOOL)isLazuliEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)_isSMSRefactorEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("_isSMSRefactorEnabled"));
  if (qword_1EE503A00 != -1)
    dispatch_once(&qword_1EE503A00, &unk_1E3FB78E0);
  return byte_1EE5039F8;
}

- (BOOL)isSMSRefactorEnabled
{
  return -[IMFeatureFlags _isSMSRefactorEnabled](self, "_isSMSRefactorEnabled")
      || -[IMFeatureFlags isLazuliEnabled](self, "isLazuliEnabled")
      || -[IMFeatureFlags isCarrierPigeonEnabled](self, "isCarrierPigeonEnabled");
}

- (BOOL)isConsolidatedChatItemsEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isConsolidatedChatItemsEnabled"));
  if (qword_1EE503890 != -1)
    dispatch_once(&qword_1EE503890, &unk_1E3FB4608);
  return byte_1EE503A90;
}

- (BOOL)isGenPlaygroundEnabled
{
  int v2;

  v2 = -[IMFeatureFlags generativePlaygroundModelsAvailable](self, "generativePlaygroundModelsAvailable");
  if (v2)
    LOBYTE(v2) = _os_feature_enabled_impl();
  return v2;
}

- (BOOL)isGenPlaygroundSparkleButtonEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isGenPlaygroundSparkleButtonEnabled"));
  if (qword_1EE504060 != -1)
    dispatch_once(&qword_1EE504060, &unk_1E3FB4688);
  return byte_1EE504058;
}

- (BOOL)isDashedBalloonsEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isDashedBalloonsEnabled"));
  if (qword_1EE503CF8 != -1)
    dispatch_once(&qword_1EE503CF8, &unk_1E3FB1848);
  return byte_1EE503CF0;
}

- (BOOL)isScheduledMessagesCoreEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isScheduledMessagesCoreEnabled"));
  if (qword_1EE503D80 != -1)
    dispatch_once(&qword_1EE503D80, &unk_1E3FB7900);
  return byte_1EE503D90;
}

- (BOOL)isScheduledMessagesEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isScheduledMessagesEnabled"));
  if (qword_1EE503D88 != -1)
    dispatch_once(&qword_1EE503D88, &unk_1E3FB28F8);
  return byte_1EE503D60;
}

- (BOOL)isRichLinkImprovementsEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isRichLinkImprovementsEnabled"));
  if (qword_1EE503B80 != -1)
    dispatch_once(&qword_1EE503B80, &unk_1E3FB7920);
  return byte_1EE503D00;
}

- (BOOL)isInboxSummaryEnabled_iOS
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isInboxSummaryEnabled_iOS"));
  if (qword_1EE503D48 != -1)
    dispatch_once(&qword_1EE503D48, &unk_1E3FB4808);
  return byte_1EE503D40;
}

- (BOOL)isInboxSummaryEnabled_mac
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isInboxSummaryEnabled_mac"));
  if (qword_1EE504070 != -1)
    dispatch_once(&qword_1EE504070, &unk_1E3FB24F8);
  return byte_1EE504068;
}

- (BOOL)isInboxSummaryEnabled
{
  return MEMORY[0x1E0DE7D20](self, sel_isInboxSummaryEnabled_iOS);
}

- (BOOL)generativeModelsAvailable
{
  return MEMORY[0x1E0DE7D20](IMGenerativeModelsAvailabilityProvider, sel_summarizationModelsAvailable);
}

- (BOOL)generativePlaygroundModelsAvailable
{
  return +[IMGenerativeModelsAvailabilityProvider generativePlaygroundModelsAvailable](IMGenerativeModelsAvailabilityProvider, "generativePlaygroundModelsAvailable");
}

- (BOOL)summarizationUserPreferenceEnabled
{
  return MEMORY[0x1E0DE7D20](IMGenerativeModelsAvailabilityProvider, sel_summarizationUserPreferenceEnabled);
}

- (void)setSummarizationUserPreferenceEnabled:(BOOL)a3
{
  MEMORY[0x1E0DE7D20](IMGenerativeModelsAvailabilityProvider, sel_setMessageSummarizationUserPreference_);
}

- (BOOL)_isServiceForSendingRefactorEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("_isServiceForSendingRefactorEnabled"));
  if (qword_1EE503D20 != -1)
    dispatch_once(&qword_1EE503D20, &unk_1E3FB3E48);
  return byte_1EE503BB0;
}

- (BOOL)isServiceForSendingRefactorEnabled
{
  if (-[IMFeatureFlags isLazuliEnabled](self, "isLazuliEnabled")
    || -[IMFeatureFlags isCarrierPigeonEnabled](self, "isCarrierPigeonEnabled"))
  {
    return 1;
  }
  else
  {
    return MEMORY[0x1E0DE7D20](self, sel__isServiceForSendingRefactorEnabled);
  }
}

- (BOOL)isWatchWorkoutRemoteViewPreviewEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isWatchWorkoutRemoteViewPreviewEnabled"));
  if (qword_1EE504080 != -1)
    dispatch_once(&qword_1EE504080, &unk_1E3FB3E88);
  return byte_1EE504078;
}

- (BOOL)isSiriReactionReadingEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSiriReactionReadingEnabled"));
  if (qword_1EE504090 != -1)
    dispatch_once(&qword_1EE504090, &unk_1E3FB7940);
  return byte_1EE504088;
}

- (BOOL)isHighQualityPhotosEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isHighQualityPhotosEnabled"));
  if (qword_1EE503B60 != -1)
    dispatch_once(&qword_1EE503B60, &unk_1E3FB15A8);
  return byte_1EE503B88;
}

- (BOOL)isFluidTransitioningEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isFluidTransitioningEnabled"));
  if (qword_1EE503898 != -1)
    dispatch_once(&qword_1EE503898, &unk_1E3FB25D8);
  return byte_1EE504098;
}

- (BOOL)isSpotlightDaemonDelegateEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSpotlightDaemonDelegateEnabled"));
  if (qword_1EE503AC8 != -1)
    dispatch_once(&qword_1EE503AC8, &unk_1E3FB25F8);
  return byte_1EE503AC0;
}

- (BOOL)isSessionAnimatedImageUnpackerEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSessionAnimatedImageUnpackerEnabled"));
  if (qword_1EE5040A8 != -1)
    dispatch_once(&qword_1EE5040A8, &unk_1E3FB7960);
  return byte_1EE5040A0;
}

- (BOOL)isSpotlightClientStateEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSpotlightClientStateEnabled"));
  if (qword_1EE503A30 != -1)
    dispatch_once(&qword_1EE503A30, &unk_1E3FB7980);
  return byte_1EE503A50;
}

- (BOOL)isModernSettingsEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isModernSettingsEnabled"));
  if (qword_1EE5040B8 != -1)
    dispatch_once(&qword_1EE5040B8, &unk_1E3FB2618);
  return byte_1EE5040B0;
}

- (void)checkForUnitTestingWithFeatureName:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  if (qword_1ECFC7508 != -1)
  {
    v5 = v3;
    dispatch_once(&qword_1ECFC7508, &unk_1E3FB8878);
    v3 = v5;
  }
  if (byte_1EE504278)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Called into IMFeatureFlags from a unit test without mocking the feature flag (%@) with [IMFeatureFlags testWithFeature:block:]. Ensure any test code that hits this path is enclosed in a test feature call."), v3);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("IMFeatureFlagNotMockedInTest"), objc_claimAutoreleasedReturnValue(), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }

}

- (BOOL)_isEntryViewInTranscriptEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("_isEntryViewInTranscriptEnabled"));
  if (qword_1EE503B98 != -1)
    dispatch_once(&qword_1EE503B98, &unk_1E3FB2598);
  return byte_1EE503B90;
}

- (BOOL)_isEntryViewInTranscriptEnabledForiPad
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("_isEntryViewInTranscriptEnabledForiPad"));
  if (qword_1ECFC6ED8 != -1)
    dispatch_once(&qword_1ECFC6ED8, &unk_1E3FB40E8);
  return byte_1ECFC6ED0;
}

- (BOOL)isEntryViewInTranscriptEnabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19E2F73C4;
  block[3] = &unk_1E3FB6B98;
  block[4] = self;
  if (qword_1ECFC6E08 != -1)
    dispatch_once(&qword_1ECFC6E08, block);
  return byte_1ECFC6E00;
}

- (BOOL)isEntryViewUsesKeyboardLayoutGuideEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isEntryViewUsesKeyboardLayoutGuideEnabled"));
  if (qword_1ECFC6E18 != -1)
    dispatch_once(&qword_1ECFC6E18, &unk_1E3FB27B8);
  return byte_1ECFC6E10;
}

- (BOOL)_isSendMenuEnabledForiPad
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("_isSendMenuEnabledForiPad"));
  if (qword_1ECFC6EE8 != -1)
    dispatch_once(&qword_1ECFC6EE8, &unk_1E3FB4388);
  return byte_1ECFC6EE0;
}

- (BOOL)isUnitTestableFeatureEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isUnitTestableFeatureEnabled"));
  if (qword_1EE504288 != -1)
    dispatch_once(&qword_1EE504288, &unk_1E3FB1808);
  return byte_1EE504280;
}

- (BOOL)isUnitTestableFeatureForNewPlatformEnabled
{
  if (qword_1EE504298 != -1)
    dispatch_once(&qword_1EE504298, &unk_1E3FB44E8);
  return byte_1EE504290;
}

- (BOOL)isKeyTransparencyEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isKeyTransparencyReportToAppleEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isMessagesIniCloudVersion2
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isMessagesIniCloudVersion2"));
  if (qword_1ECFC6EB8 != -1)
    dispatch_once(&qword_1ECFC6EB8, &unk_1E3FB4588);
  return byte_1ECFC6EB0;
}

- (BOOL)isMessagesInICloudNewUIEnabled_mac
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isMessagesInICloudNewUIEnabled_mac"));
  if (qword_1EE5038B0 != -1)
    dispatch_once(&qword_1EE5038B0, &unk_1E3FB8898);
  return byte_1EE5042A0;
}

- (BOOL)isMessagesIniCloudOnboardingUIEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isMessagesIniCloudOnboardingUIEnabled"));
  if (qword_1EE5038C0 != -1)
    dispatch_once(&qword_1EE5038C0, &unk_1E3FB18C8);
  return byte_1EE5038B8;
}

- (BOOL)isSMSForwardingEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSMSForwardingEnabled"));
  if (qword_1ECFC6D48 != -1)
    dispatch_once(&qword_1ECFC6D48, &unk_1E3FB2898);
  return byte_1ECFC6D40;
}

- (BOOL)isBackgroundAudioEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isBackgroundAudioEnabled"));
  if (qword_1ECFC6CB8 != -1)
    dispatch_once(&qword_1ECFC6CB8, &unk_1E3FB2918);
  return byte_1ECFC6CB0;
}

- (BOOL)isSMSFilterEnabledForUS
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSMSFilterEnabledForUS"));
  if (qword_1EE5038C8[0] != -1)
    dispatch_once(qword_1EE5038C8, &unk_1E3FB1948);
  return byte_1EE5042A8;
}

- (BOOL)isSMSFilterEnabledForUK
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSMSFilterEnabledForUK"));
  if (qword_1EE5042B8 != -1)
    dispatch_once(&qword_1EE5042B8, &unk_1E3FB24B8);
  return byte_1EE5042B0;
}

- (BOOL)isLQMImageQualityEstimatorEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isLQMImageQualityEstimatorEnabled"));
  if (qword_1ECFC6C88 != -1)
    dispatch_once(&qword_1ECFC6C88, &unk_1E3FB88D8);
  return byte_1ECFC6C90;
}

- (BOOL)isAttachmentsPurgeabilityMonitoringEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isAttachmentsPurgeabilityMonitoringEnabled"));
  if (qword_1EE503A08 != -1)
    dispatch_once(&qword_1EE503A08, &unk_1E3FB3EA8);
  return byte_1EE5042C0;
}

- (BOOL)isAVLessSharePlayEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isAVLessSharePlayEnabled"));
  if (qword_1EE5042D0 != -1)
    dispatch_once(&qword_1EE5042D0, &unk_1E3FB3F08);
  return byte_1EE5042C8;
}

- (BOOL)isSWYAttachmentsEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSWYAttachmentsEnabled"));
  if (qword_1ECFC6FB0 != -1)
    dispatch_once(&qword_1ECFC6FB0, &unk_1E3FB8918);
  return byte_1EE503B20;
}

- (BOOL)isNameAndPhotoC3Enabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isNameAndPhotoC3Enabled"));
  if (qword_1ECFC6E90 != -1)
    dispatch_once(&qword_1ECFC6E90, &unk_1E3FB3F28);
  return byte_1ECFC6E88;
}

- (BOOL)isWatchNamePhotoEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isWatchNamePhotoEnabled"));
  if (qword_1EE5042E0 != -1)
    dispatch_once(&qword_1EE5042E0, &unk_1E3FB8938);
  return byte_1EE5042D8;
}

- (BOOL)isAllowU18SnapAssetsEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isAllowU18SnapAssetsEnabled"));
  if (qword_1EE5042F0 != -1)
    dispatch_once(&qword_1EE5042F0, &unk_1E3FB8958);
  return byte_1EE5042E8;
}

- (BOOL)isAllowU18SnapWatchAssetsEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isAllowU18SnapWatchAssetsEnabled"));
  if (qword_1EE504300 != -1)
    dispatch_once(&qword_1EE504300, &unk_1E3FB2638);
  return byte_1EE5042F8;
}

- (BOOL)arePreResolvedSiriMatchesEnabled
{
  if (qword_1EE504310 != -1)
    dispatch_once(&qword_1EE504310, &unk_1E3FB3FC8);
  return byte_1EE504308;
}

- (BOOL)isCroppingAvoidanceEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isCroppingAvoidanceEnabled"));
  if (qword_1ECFC6E80 != -1)
    dispatch_once(&qword_1ECFC6E80, &unk_1E3FB3FE8);
  return byte_1ECFC6E78;
}

- (BOOL)isSearchImprovementsEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSearchImprovementsEnabled"));
  if (qword_1ECFC6CE0 != -1)
    dispatch_once(&qword_1ECFC6CE0, &unk_1E3FB2658);
  return byte_1ECFC6CD8;
}

- (BOOL)isSearchTokensEnabled_mac
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSearchTokensEnabled_mac"));
  if (qword_1EE504320 != -1)
    dispatch_once(&qword_1EE504320, &unk_1E3FB1648);
  return byte_1EE504318;
}

- (BOOL)isSearchTokensForDatesEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSearchTokensForDatesEnabled"));
  if (qword_1EE503848 != -1)
    dispatch_once(&qword_1EE503848, &unk_1E3FB4088);
  return byte_1EE504328;
}

- (BOOL)isRichAudioMessagesEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isRichAudioMessagesEnabled"));
  if (qword_1ECFC6E28 != -1)
    dispatch_once(&qword_1ECFC6E28, &unk_1E3FB26D8);
  return byte_1ECFC6E20;
}

- (BOOL)_isAudioMessagesEntryViewRecordingEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("_isAudioMessagesEntryViewRecordingEnabled"));
  if (qword_1ECFC6DC8 != -1)
    dispatch_once(&qword_1ECFC6DC8, &unk_1E3FB8998);
  return byte_1ECFC6DC0;
}

- (BOOL)isAudioMessagesEntryViewRecordingEnabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19E2F8478;
  block[3] = &unk_1E3FB6B98;
  block[4] = self;
  if (qword_1ECFC6DF8 != -1)
    dispatch_once(&qword_1ECFC6DF8, block);
  return byte_1ECFC6DF0;
}

- (BOOL)isAppCardsEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isAppCardsEnabled"));
  if (qword_1ECFC6DE8 != -1)
    dispatch_once(&qword_1ECFC6DE8, &unk_1E3FB89B8);
  return byte_1ECFC6DE0;
}

- (BOOL)isSOSAlertingEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSOSAlertingEnabled"));
  if (qword_1ECFC6DA8 != -1)
    dispatch_once(&qword_1ECFC6DA8, &unk_1E3FB89D8);
  return byte_1ECFC6DA0;
}

- (BOOL)isCriticalAlertingEnabled
{
  if (-[IMFeatureFlags isSOSAlertingEnabled](self, "isSOSAlertingEnabled"))
    return 1;
  else
    return MEMORY[0x1E0DE7D20](self, sel_isZelkovaEnabled);
}

- (BOOL)isReplicationEnabled
{
  return -[IMFeatureFlags isPriusEnabled](self, "isPriusEnabled")
      || -[IMFeatureFlags isSOSAlertingEnabled](self, "isSOSAlertingEnabled");
}

- (BOOL)isPriusCompatibilityEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isPriusCompatibilityEnabled"));
  if (qword_1EE503858 != -1)
    dispatch_once(&qword_1EE503858, &unk_1E3FB16A8);
  return byte_1EE503A10;
}

- (BOOL)isSwipeToReplyEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSwipeToReplyEnabled"));
  if (qword_1ECFC6D00 != -1)
    dispatch_once(&qword_1ECFC6D00, &unk_1E3FB2758);
  return byte_1ECFC6CF8;
}

- (BOOL)isCatchUpEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isCatchUpEnabled"));
  if (qword_1ECFC6F98 != -1)
    dispatch_once(&qword_1ECFC6F98, &unk_1E3FB89F8);
  return byte_1EE503D38;
}

- (BOOL)isGFTOnWatchEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isGFTOnWatchEnabled"));
  if (qword_1EE504338 != -1)
    dispatch_once(&qword_1EE504338, &unk_1E3FB8A18);
  return byte_1EE504330;
}

- (BOOL)isDiffableTranscriptDataSourceEnabled
{
  if (qword_1ECFC6CD0 != -1)
    dispatch_once(&qword_1ECFC6CD0, &unk_1E3FB8A38);
  return byte_1EE503AF8;
}

- (BOOL)isReadMMSDefaultFromCBEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isReadMMSDefaultFromCBEnabled"));
  if (qword_1ECFC71E8 != -1)
    dispatch_once(&qword_1ECFC71E8, &unk_1E3FB8A58);
  return byte_1ECFC71E0;
}

- (BOOL)isBIAEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isBIAEnabled"));
  if (qword_1ECFC6FE0 != -1)
    dispatch_once(&qword_1ECFC6FE0, &unk_1E3FB8A98);
  return byte_1EE503860;
}

- (BOOL)isIMLLegacyRelayEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isIMLLegacyRelayEnabled"));
  if (qword_1EE504348 != -1)
    dispatch_once(&qword_1EE504348, &unk_1E3FB8AB8);
  return byte_1EE504340;
}

- (BOOL)isClingBackwardsCompatibilityEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isClingBackwardsCompatibilityEnabled"));
  if (qword_1ECFC6D38 != -1)
    dispatch_once(&qword_1ECFC6D38, &unk_1E3FB8AF8);
  return byte_1ECFC6D30;
}

- (BOOL)isStickersAppEnabled_mac
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isStickersAppEnabled_mac"));
  if (qword_1EE504358 != -1)
    dispatch_once(&qword_1EE504358, &unk_1E3FB8B38);
  return byte_1EE504350;
}

- (BOOL)isStickerRepositioningEnabled_iOS
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isStickerRepositioningEnabled_iOS"));
  if (qword_1EE504368 != -1)
    dispatch_once(&qword_1EE504368, &unk_1E3FB8B58);
  return byte_1EE504360;
}

- (BOOL)isStickerRepositioningEnabled_macOS
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isStickerRepositioningEnabled_macOS"));
  if (qword_1EE504378 != -1)
    dispatch_once(&qword_1EE504378, &unk_1E3FB4308);
  return byte_1EE504370;
}

- (BOOL)isStickerRepositioningEnabled
{
  return MEMORY[0x1E0DE7D20](self, sel_isStickerRepositioningEnabled_iOS);
}

- (BOOL)isAlwaysShowStickerDropUIEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isAlwaysShowStickerDropUIEnabled"));
  if (qword_1EE504388 != -1)
    dispatch_once(&qword_1EE504388, &unk_1E3FB8B78);
  return byte_1EE504380;
}

- (BOOL)isZelkovaGroupEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isZelkovaGroupEnabled"));
  if (qword_1EE503850 != -1)
    dispatch_once(&qword_1EE503850, &unk_1E3FB8BB8);
  return byte_1EE503AA0;
}

- (BOOL)isPinnedConversationOnWatchEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isPinnedConversationOnWatchEnabled"));
  if (qword_1EE504398 != -1)
    dispatch_once(&qword_1EE504398, &unk_1E3FB8BD8);
  return byte_1EE504390;
}

- (BOOL)isSyncedSettingsEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isSyncedSettingsEnabled"));
  if (qword_1ECFC7048 != -1)
    dispatch_once(&qword_1ECFC7048, &unk_1E3FB8C18);
  return byte_1ECFC7050;
}

- (BOOL)isPinActionEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isPinActionEnabled"));
  if (qword_1EE5043A8 != -1)
    dispatch_once(&qword_1EE5043A8, &unk_1E3FB8C38);
  return byte_1EE5043A0;
}

- (BOOL)isReportJunkTextToAppleServerEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isReportJunkTextToAppleServerEnabled"));
  if (qword_1EE5043B8 != -1)
    dispatch_once(&qword_1EE5043B8, &unk_1E3FB8C58);
  return byte_1EE5043B0;
}

- (BOOL)isUnknownSenderBlastDoorEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isUnknownSenderBlastDoorEnabled"));
  if (qword_1ECFC6EC8 != -1)
    dispatch_once(&qword_1ECFC6EC8, &unk_1E3FB8C78);
  return byte_1ECFC6EC0;
}

- (BOOL)isWidgetKitComplicationsEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isWidgetKitComplicationsEnabled"));
  if (qword_1EE5043C8 != -1)
    dispatch_once(&qword_1EE5043C8, &unk_1E3FB4368);
  return byte_1EE5043C0;
}

- (BOOL)isAudioTranscriptionEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isAudioTranscriptionEnabled"));
  if (qword_1ECFC6D28 != -1)
    dispatch_once(&qword_1ECFC6D28, &unk_1E3FB8CB8);
  return byte_1ECFC6D20;
}

- (BOOL)shouldShowServiceEncryptionIcon
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("shouldShowServiceEncryptionIcon"));
  if (qword_1ECFC6D18 != -1)
    dispatch_once(&qword_1ECFC6D18, &unk_1E3FB8CD8);
  return byte_1EE5043D0;
}

- (BOOL)isProofreadingEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isProofreadingEnabled"));
  if (qword_1EE5043E0 != -1)
    dispatch_once(&qword_1EE5043E0, &unk_1E3FB4408);
  return byte_1EE5043D8;
}

- (BOOL)isInlineTapbackMenuEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isInlineTapbackMenuEnabled"));
  if (qword_1EE5043F0 != -1)
    dispatch_once(&qword_1EE5043F0, &unk_1E3FB8CF8);
  return byte_1EE5043E8;
}

- (BOOL)isReactWithAStickerEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isReactWithAStickerEnabled"));
  if (qword_1EE504400 != -1)
    dispatch_once(&qword_1EE504400, &unk_1E3FB8D18);
  return byte_1EE5043F8;
}

- (BOOL)isAllowMultiplePhoneNumbersSNaPEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isAllowMultiplePhoneNumbersSNaPEnabled"));
  if (qword_1EE503DA0 != -1)
    dispatch_once(&qword_1EE503DA0, &unk_1E3FB8D38);
  return byte_1EE503D98;
}

- (BOOL)isWaldoCPolishEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isWaldoCPolishEnabled"));
  if (qword_1EE504410 != -1)
    dispatch_once(&qword_1EE504410, &unk_1E3FB8D58);
  return byte_1EE504408;
}

- (BOOL)isQuickRepliesEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isQuickRepliesEnabled"));
  if (qword_1EE504420 != -1)
    dispatch_once(&qword_1EE504420, &unk_1E3FB8D78);
  return byte_1EE504418;
}

- (BOOL)isWolfFullScreenEffectsEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isWolfFullScreenEffectsEnabled"));
  if (qword_1EE504430 != -1)
    dispatch_once(&qword_1EE504430, &unk_1E3FB8D98);
  return byte_1EE504428;
}

- (BOOL)isModernDetailsViewEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isModernDetailsViewEnabled"));
  if (qword_1EE504440 != -1)
    dispatch_once(&qword_1EE504440, &unk_1E3FB8DB8);
  return byte_1EE504438;
}

- (BOOL)isRockNRollEnabled
{
  -[IMFeatureFlags checkForUnitTestingWithFeatureName:](self, "checkForUnitTestingWithFeatureName:", CFSTR("isRockNRollEnabled"));
  if (qword_1EE503AB8 != -1)
    dispatch_once(&qword_1EE503AB8, &unk_1E3FB4428);
  return byte_1EE504448;
}

- (BOOL)isOOPKeyboardEnabled
{
  if (qword_1EE504458 != -1)
    dispatch_once(&qword_1EE504458, &unk_1E3FB8DD8);
  return byte_1EE504450;
}

- (BOOL)isTapbackInferenceEnabled
{
  return self->_tapbackInferenceEnabled;
}

- (BOOL)isFeatureFlagEnabledWithName:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4);
  return _os_feature_enabled_impl();
}

@end
