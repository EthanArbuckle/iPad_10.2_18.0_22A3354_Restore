@implementation AssistantOptInController

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupSiri;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

+ (void)skippedByCloudConfig
{
  id v2;
  id v3;

  v2 = objc_msgSend(sub_1000BA568(), "sharedPreferences", a2, a1);
  objc_msgSend(v2, "setDictationIsEnabled:", 0);

  v3 = objc_msgSend(sub_1000BA568(), "sharedPreferences");
  objc_msgSend(v3, "synchronize");

}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  AssistantOptInController *v9;
  id v10;
  id location[2];
  AssistantOptInController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000BA744;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)controllerWasPopped
{
  BYPreferencesController *v2;

  -[AssistantOptInController didCompleteOrSkipVoiceTraining](self, "didCompleteOrSkipVoiceTraining", a2);
  v2 = -[AssistantOptInController buddyPreferences](self, "buddyPreferences");
  -[BYPreferencesController removeObjectForKey:](v2, "removeObjectForKey:", BYBuddyAssistantPresentedKey);

}

- (id)viewController
{
  VTUIEnrollTrainingViewController *v2;
  BOOL v3;
  id v4;
  VTUIEnrollTrainingViewController *v5;

  v2 = -[AssistantOptInController enrollmentController](self, "enrollmentController", a2);
  v3 = v2 == 0;

  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)sub_1000BB520()), "init:", 0);
    -[AssistantOptInController setEnrollmentController:](self, "setEnrollmentController:", v4);

    v5 = -[AssistantOptInController enrollmentController](self, "enrollmentController");
    -[VTUIEnrollTrainingViewController setDelegate:](v5, "setDelegate:", self);

  }
  return -[AssistantOptInController enrollmentController](self, "enrollmentController");
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (void)_removeSiriPanesFromNavHierarchy
{
  VTUIEnrollTrainingViewController *v2;
  id v3;
  VTUIEnrollTrainingViewController *v4;
  _BYTE *v5;
  id v6;
  id v7;
  id v8;
  NSIndexSet *v9;
  BFFFlowItemDelegate *v10;
  id location;
  _BYTE *v12;
  id v13[2];
  AssistantOptInController *v14;
  char *v15;
  id v16;
  id v17;
  char *v18;

  v14 = self;
  v13[1] = (id)a2;
  v2 = -[AssistantOptInController enrollmentController](self, "enrollmentController");
  v13[0] = -[VTUIEnrollTrainingViewController navigationController](v2, "navigationController");

  v3 = objc_msgSend(v13[0], "viewControllers");
  v4 = -[AssistantOptInController enrollmentController](v14, "enrollmentController");
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  v12 = v5;
  v6 = objc_msgSend(v13[0], "viewControllers");
  v7 = v5;
  v8 = objc_msgSend(v13[0], "viewControllers");
  v16 = v7;
  v15 = (char *)((_BYTE *)objc_msgSend(v8, "count") - v12);
  v17 = v7;
  v18 = v15;
  v9 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v7, v15);
  location = objc_msgSend(v6, "objectsAtIndexes:", v9);

  v10 = -[AssistantOptInController delegate](v14, "delegate");
  -[BFFFlowItemDelegate removeViewControllersOnNextPush:](v10, "removeViewControllersOnNextPush:", location);

  objc_storeStrong(&location, 0);
  objc_storeStrong(v13, 0);
}

+ (void)setAssistantEnabled:(BOOL)a3 settingsManager:(id)a4
{
  id v4;
  id v5;
  BOOL v6;
  SEL v7;
  id v8;

  v8 = a1;
  v7 = a2;
  v6 = a3;
  v5 = 0;
  objc_storeStrong(&v5, a4);
  v4 = objc_msgSend(sub_1000BA568(), "sharedPreferences");
  objc_msgSend(v4, "setAssistantIsEnabled:", v6);

  objc_msgSend(v5, "setAssistantEnabled:", v6);
  objc_storeStrong(&v5, 0);
}

- (void)_recordAnalyticsEvent
{
  id v2;
  unsigned __int8 v3;
  BYPaneFeatureAnalyticsManager *v4;
  NSNumber *v5;
  id v6;
  id v7;
  BYPaneFeatureAnalyticsManager *v8;
  BYPaneFeatureAnalyticsManager *v9;
  BYPaneFeatureAnalyticsManager *v10;

  v2 = objc_msgSend(sub_1000BA568(), "sharedPreferences");
  v3 = objc_msgSend(v2, "assistantIsEnabled");

  v4 = -[AssistantOptInController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3 & 1);
  -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v4, "recordActionWithValue:forFeature:", v5, 7);

  v6 = objc_msgSend(sub_1000BA568(), "sharedPreferences");
  v7 = objc_msgSend(v6, "siriDataSharingOptInStatus");

  switch((unint64_t)v7)
  {
    case 0uLL:
    case 3uLL:
      v10 = -[AssistantOptInController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
      -[BYPaneFeatureAnalyticsManager clearActionForFeature:](v10, "clearActionForFeature:", 8);

      break;
    case 1uLL:
      v8 = -[AssistantOptInController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
      -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v8, "recordActionWithValue:forFeature:", &__kCFBooleanTrue, 8);

      break;
    case 2uLL:
      v9 = -[AssistantOptInController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
      -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v9, "recordActionWithValue:forFeature:", &__kCFBooleanFalse, 8);

      break;
    default:
      return;
  }
}

- (void)setBuddyBackgroundViewController:(id)a3
{
  id location[2];
  AssistantOptInController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_buddyBackgroundViewController, location[0]);
  objc_storeStrong(location, 0);
}

- (void)continueSetup
{
  id v2;
  unsigned __int8 v3;
  uint64_t v4;
  BYPreferencesController *v5;
  BYPreferencesController *v6;
  BFFSettingsManager *v7;
  VTUIEnrollTrainingViewController *v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  BFFSettingsManager *v13;
  BFFFlowItemDelegate *v14;
  BYPreferencesController *v15;
  BYFlowSkipController *v16;
  _WORD v17[7];
  os_log_type_t v18;
  os_log_t v19;
  os_log_type_t v20;
  os_log_t oslog;
  char v22;
  SEL v23;
  AssistantOptInController *v24;
  uint8_t buf[24];

  v24 = self;
  v23 = a2;
  v2 = objc_msgSend(sub_1000BA568(), "sharedPreferences");
  v3 = objc_msgSend(v2, "assistantIsEnabled");

  v22 = v3 & 1;
  oslog = (os_log_t)(id)_BYLoggingFacility(v4);
  v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10003CBAC((uint64_t)buf, v22 & 1, v24->_didOfferVoiceTrigger);
    _os_log_impl((void *)&_mh_execute_header, oslog, v20, "Siri setup success, enabled = %d, offered PHS = %d", buf, 0xEu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v5 = -[AssistantOptInController buddyPreferences](v24, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v5, "setObject:forKey:", &__kCFBooleanTrue, BYBuddyAssistantPresentedKey);

  if (v24->_didOfferVoiceTrigger)
  {
    v6 = -[AssistantOptInController buddyPreferences](v24, "buddyPreferences");
    -[BYPreferencesController setObject:forKey:](v6, "setObject:forKey:", &__kCFBooleanTrue, BYBuddyAssistantPHSOfferedKey);

  }
  v7 = -[AssistantOptInController settingsManager](v24, "settingsManager");
  -[BFFSettingsManager setAssistantEnabled:](v7, "setAssistantEnabled:", v22 & 1);

  v8 = -[AssistantOptInController enrollmentController](v24, "enrollmentController");
  v9 = -[VTUIEnrollTrainingViewController didShowVoiceTriggerPrompt](v8, "didShowVoiceTriggerPrompt");

  if ((v9 & 1) != 0)
  {
    v19 = (os_log_t)(id)_BYLoggingFacility(v10);
    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v19;
      v12 = v18;
      sub_100038C3C(v17);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Storing voice trigger enabled in settings manager, because voice trigger prompt was shown", (uint8_t *)v17, 2u);
    }
    objc_storeStrong((id *)&v19, 0);
    v13 = -[AssistantOptInController settingsManager](v24, "settingsManager");
    -[BFFSettingsManager setAssistantVoiceTriggerEnabled:](v13, "setAssistantVoiceTriggerEnabled:", 1);

  }
  if ((+[BYSiriUtilities deviceSupportsSystemAssistantExperience](BYSiriUtilities, "deviceSupportsSystemAssistantExperience") & 1) != 0)+[BYSiriUtilities intelligenceVoiceSelectionDidComplete](BYSiriUtilities, "intelligenceVoiceSelectionDidComplete");
  -[AssistantOptInController _removeSiriPanesFromNavHierarchy](v24, "_removeSiriPanesFromNavHierarchy");
  -[AssistantOptInController _recordAnalyticsEvent](v24, "_recordAnalyticsEvent");
  v14 = -[AssistantOptInController delegate](v24, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v14, "flowItemDone:", v24);

  v15 = -[AssistantOptInController buddyPreferences](v24, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v15, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("SiriOnBoardingPresented"));

  v16 = -[AssistantOptInController flowSkipController](v24, "flowSkipController");
  -[BYFlowSkipController didCompleteFlow:](v16, "didCompleteFlow:", BYFlowSkipIdentifierSiri);

}

- (void)skipSetup
{
  id v2;
  unsigned __int8 v3;
  id v4;
  unsigned __int8 v5;
  uint64_t v6;
  BFFSettingsManager *v7;
  id v8;
  unsigned __int8 v9;
  uint64_t v10;
  BFFSettingsManager *v11;
  BFFSettingsManager *v12;
  char v13;
  uint64_t v14;
  BFFSettingsManager *v15;
  BFFFlowItemDelegate *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  BYPreferencesController *v21;
  BYPreferencesController *v22;
  BYPreferencesController *v23;
  BYFlowSkipController *v24;
  os_log_t v25;
  os_log_type_t v26;
  os_log_t v27;
  os_log_type_t v28;
  os_log_t oslog;
  char v30;
  char v31;
  SEL v32;
  AssistantOptInController *v33;
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t buf[24];

  v33 = self;
  v32 = a2;
  v2 = objc_msgSend(sub_1000BA568(), "sharedPreferences");
  v3 = objc_msgSend(v2, "assistantIsEnabled");

  v31 = v3 & 1;
  v4 = objc_msgSend(sub_1000BAE6C(), "sharedPreferences");
  v5 = objc_msgSend(v4, "voiceTriggerEnabled");

  v30 = v5 & 1;
  oslog = (os_log_t)(id)_BYLoggingFacility(v6);
  v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10003CBAC((uint64_t)buf, v31 & 1, v30 & 1);
    _os_log_impl((void *)&_mh_execute_header, oslog, v28, "User chose to skip Siri setup: enabled %d voice trigger enabled %d", buf, 0xEu);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[AssistantOptInController _removeSiriPanesFromNavHierarchy](v33, "_removeSiriPanesFromNavHierarchy");
  -[AssistantOptInController _recordAnalyticsEvent](v33, "_recordAnalyticsEvent");
  v7 = -[AssistantOptInController settingsManager](v33, "settingsManager");
  -[BFFSettingsManager setAssistantEnabled:](v7, "setAssistantEnabled:", v31 & 1);

  v8 = objc_msgSend(sub_1000BAE6C(), "sharedPreferences");
  v9 = objc_msgSend(v8, "hasExplicitlySetVoiceTriggerEnabled");

  if ((v9 & 1) != 0)
  {
    v27 = (os_log_t)(id)_BYLoggingFacility(v10);
    v26 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      sub_100046FA0(v35, v30 & 1);
      _os_log_impl((void *)&_mh_execute_header, v27, v26, "Storing explicitly set voice trigger enabled %d in settings manager", v35, 8u);
    }
    objc_storeStrong((id *)&v27, 0);
    v11 = -[AssistantOptInController settingsManager](v33, "settingsManager");
    -[BFFSettingsManager setAssistantVoiceTriggerEnabled:](v11, "setAssistantVoiceTriggerEnabled:", v30 & 1);

  }
  else
  {
    v12 = -[AssistantOptInController settingsManager](v33, "settingsManager");
    v13 = -[BFFSettingsManager hasAssistantVoiceTriggerEnabledValue](v12, "hasAssistantVoiceTriggerEnabledValue") ^ 1;

    if ((v13 & 1) != 0)
    {
      v25 = (os_log_t)(id)_BYLoggingFacility(v14);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        sub_100046FA0(v34, v30 & 1);
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Settings manager lacks voice trigger enabled value. Storing %d", v34, 8u);
      }
      objc_storeStrong((id *)&v25, 0);
      v15 = -[AssistantOptInController settingsManager](v33, "settingsManager");
      -[BFFSettingsManager setAssistantVoiceTriggerEnabled:](v15, "setAssistantVoiceTriggerEnabled:", v30 & 1);

    }
  }
  v16 = -[AssistantOptInController delegate](v33, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v16, "flowItemDone:", v33);

  if ((BYSetupAssistantHasCompletedInitialRun(v17, v18) & 1) == 0)
  {
    v19 = objc_msgSend(sub_1000BA568(), "sharedPreferences");
    objc_msgSend(v19, "setDictationIsEnabled:", 0);

    v20 = objc_msgSend(sub_1000BA568(), "sharedPreferences");
    objc_msgSend(v20, "synchronize");

  }
  v21 = -[AssistantOptInController buddyPreferences](v33, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v21, "setObject:forKey:", &__kCFBooleanTrue, BYBuddyAssistantPresentedKey);

  v22 = -[AssistantOptInController buddyPreferences](v33, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v22, "setObject:forKey:", &__kCFBooleanTrue, BYBuddyAssistantPHSOfferedKey);

  v23 = -[AssistantOptInController buddyPreferences](v33, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v23, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("SiriOnBoardingPresented"));

  v24 = -[AssistantOptInController flowSkipController](v33, "flowSkipController");
  -[BYFlowSkipController didSkipFlow:](v24, "didSkipFlow:", BYFlowSkipIdentifierSiri);

  -[AssistantOptInController didCompleteOrSkipVoiceTraining](v33, "didCompleteOrSkipVoiceTraining");
}

- (void)showLearnMore
{
  id location[2];
  AssistantOptInController *v3;

  v3 = self;
  location[1] = (id)a2;
  location[0] = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:](OBPrivacyPresenter, "presenterForPrivacySplashWithIdentifier:", BYPrivacySiriIdentifier);
  objc_msgSend(location[0], "setPresentingViewController:", v3->_enrollmentController);
  objc_msgSend(location[0], "present");
  objc_storeStrong(location, 0);
}

- (void)selectedVoice:(id)a3 recognitionLanguageCode:(id)a4
{
  uint64_t v5;
  NSData *v6;
  uint64_t v7;
  NSString *v8;
  BFFSettingsManager *v9;
  char v10;
  NSString *v11;
  char v12;
  id v13;
  os_log_t v14;
  id obj;
  id v16;
  os_log_type_t v17;
  os_log_t oslog;
  id v19;
  id v20;
  id location[2];
  AssistantOptInController *v22;
  uint8_t v23[16];
  uint8_t buf[24];

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  if (location[0])
  {
    v19 = 0;
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, v17, "Received Siri Voice Selection %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    obj = v19;
    v6 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", location[0], 0, &obj);
    objc_storeStrong(&v19, obj);
    v16 = v6;
    if (v19)
    {
      v14 = (os_log_t)(id)_BYLoggingFacility(v7);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v12 = 0;
        v10 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v8 = (NSString *)v19;
        }
        else if (v19)
        {
          v13 = objc_msgSend(v19, "domain");
          v12 = 1;
          v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v13, objc_msgSend(v19, "code"));
          v11 = v8;
          v10 = 1;
        }
        else
        {
          v8 = 0;
        }
        sub_100039500((uint64_t)v23, (uint64_t)v8);
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to encode Siri output voice: %{public}@", v23, 0xCu);
        if ((v10 & 1) != 0)

        if ((v12 & 1) != 0)
      }
      objc_storeStrong((id *)&v14, 0);
    }
    else
    {
      v9 = -[AssistantOptInController settingsManager](v22, "settingsManager");
      -[BFFSettingsManager setAssistantOutputVoice:languageCode:](v9, "setAssistantOutputVoice:languageCode:", v16, v20);

    }
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)willBeginVoiceTraining
{
  BuddyBackgroundViewController *v2;

  v2 = -[AssistantOptInController buddyBackgroundViewController](self, "buddyBackgroundViewController", a2, self);
  -[BuddyBackgroundViewController setBuddyBackgroundFilterStyle:](v2, "setBuddyBackgroundFilterStyle:", 1);

}

- (void)didCompleteOrSkipVoiceTraining
{
  BuddyBackgroundViewController *v2;

  v2 = -[AssistantOptInController buddyBackgroundViewController](self, "buddyBackgroundViewController", a2, self);
  -[BuddyBackgroundViewController setBuddyBackgroundFilterStyle:](v2, "setBuddyBackgroundFilterStyle:", 0);

}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_settingsManager, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
  objc_storeStrong((id *)&self->_flowSkipController, a3);
}

- (BuddyBackgroundViewController)buddyBackgroundViewController
{
  return (BuddyBackgroundViewController *)objc_loadWeakRetained((id *)&self->_buddyBackgroundViewController);
}

- (VTUIEnrollTrainingViewController)enrollmentController
{
  return self->_enrollmentController;
}

- (void)setEnrollmentController:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentController, a3);
}

- (BOOL)didOfferVoiceTrigger
{
  return self->_didOfferVoiceTrigger;
}

- (void)setDidOfferVoiceTrigger:(BOOL)a3
{
  self->_didOfferVoiceTrigger = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentController, 0);
  objc_destroyWeak((id *)&self->_buddyBackgroundViewController);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
