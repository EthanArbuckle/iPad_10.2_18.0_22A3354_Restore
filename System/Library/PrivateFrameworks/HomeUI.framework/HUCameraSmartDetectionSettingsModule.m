@implementation HUCameraSmartDetectionSettingsModule

- (HUCameraSmartDetectionSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4 conditionCollection:(id)a5 settingsContext:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  HUCameraSmartDetectionSettingsModule *v14;
  uint64_t v15;
  NSSet *cameraProfiles;
  void *v17;
  void *v18;
  uint64_t v19;
  HFCameraSmartDetectionCondition *condition;
  void *v22;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraSmartDetectionSettingsModule.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cameraProfiles.count > 0"));

  }
  v23.receiver = self;
  v23.super_class = (Class)HUCameraSmartDetectionSettingsModule;
  v14 = -[HFItemModule initWithItemUpdater:](&v23, sel_initWithItemUpdater_, v11);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    cameraProfiles = v14->_cameraProfiles;
    v14->_cameraProfiles = (NSSet *)v15;

    v14->_settingsContext = a6;
    objc_storeStrong((id *)&v14->_conditionCollection, a5);
    objc_msgSend(v13, "conditions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "na_map:", &__block_literal_global_238);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = objc_claimAutoreleasedReturnValue();
    condition = v14->_condition;
    v14->_condition = (HFCameraSmartDetectionCondition *)v19;

  }
  return v14;
}

id __111__HUCameraSmartDetectionSettingsModule_initWithItemUpdater_cameraProfiles_conditionCollection_settingsContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (HUCameraSmartDetectionSettingsModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_cameraProfiles_conditionCollection_settingsContext_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraSmartDetectionSettingsModule.m"), 59, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraSmartDetectionSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)enableSmartMotion:(BOOL)a3 forItem:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v6 = a4;
  objc_msgSend(v6, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
    v10 = !v4;
  else
    v10 = 1;
  if (v10)
  {
    if (-[HUCameraSmartDetectionSettingsModule settingsContext](self, "settingsContext") == 1)
    {
      +[HUCameraSmartDetectionSettingsModule selectedNotificationConfigurationForSmartMotion](HUCameraSmartDetectionSettingsModule, "selectedNotificationConfigurationForSmartMotion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraSmartDetectionSettingsModule aClipIsRecordedItem](self, "aClipIsRecordedItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v6, "isEqual:", v12);

      if (v13)
        +[HUCameraSmartDetectionSettingsModule selectedNotificationConfigurationForAClipIsRecorded](HUCameraSmartDetectionSettingsModule, "selectedNotificationConfigurationForAClipIsRecorded");
      else
        +[HUCameraSmartDetectionSettingsModule selectedNotificationConfigurationForAnyMotion](HUCameraSmartDetectionSettingsModule, "selectedNotificationConfigurationForAnyMotion");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[HUCameraSmartDetectionSettingsModule selectedRecordingConfigurationForSmartMotion](HUCameraSmartDetectionSettingsModule, "selectedRecordingConfigurationForSmartMotion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUCameraSmartDetectionSettingsModule selectedRecordingConfigurationForAnyMotion](HUCameraSmartDetectionSettingsModule, "selectedRecordingConfigurationForAnyMotion");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v14;
    if (v4)
      v17 = v11;
    else
      v17 = (void *)v14;
    -[HUCameraSmartDetectionSettingsModule updateSignificantEventConfiguration:](self, "updateSignificantEventConfiguration:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

+ (id)selectedRecordingConfigurationForAnyMotion
{
  return (id)objc_msgSend(MEMORY[0x1E0D31268], "configurationWithEventTypes:personFamiliarityOptions:", 1, 0);
}

+ (id)selectedRecordingConfigurationForSmartMotion
{
  return (id)objc_msgSend(MEMORY[0x1E0D31268], "defaultSmartMotionConfiguration");
}

+ (id)selectedNotificationConfigurationForAClipIsRecorded
{
  return (id)objc_msgSend(MEMORY[0x1E0D31268], "configurationWithEventTypes:personFamiliarityOptions:", 1, 0);
}

+ (id)selectedNotificationConfigurationForAnyMotion
{
  return (id)objc_msgSend(MEMORY[0x1E0D31268], "configurationWithEventTypes:personFamiliarityOptions:", 0, 0);
}

+ (id)selectedNotificationConfigurationForSmartMotion
{
  return (id)objc_msgSend(MEMORY[0x1E0D31268], "defaultSmartMotionConfiguration");
}

- (id)updateMotionDetectionSettingForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUCameraSettingResultKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8
    && (-[HUCameraSmartDetectionSettingsModule motionDetectionSettingsItemProvider](self, "motionDetectionSettingsItemProvider"), v9 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v9, "items"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v10, "containsObject:", v4), v10, v9, v11))
  {
    -[HUCameraSmartDetectionSettingsModule updateSignificantEventConfiguration:](self, "updateSignificantEventConfiguration:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (id)updateSignificantEventConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  -[HUCameraSmartDetectionSettingsModule cameraProfiles](self, "cameraProfiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke;
  v17[3] = &unk_1E6F5CA00;
  objc_copyWeak(&v19, &location);
  v9 = v5;
  v18 = v9;
  objc_msgSend(v7, "na_map:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "combineAllFutures:ignoringErrors:scheduler:", v10, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_3_27;
  v16[3] = &unk_1E6F4F960;
  v16[4] = self;
  v16[5] = a2;
  objc_msgSend(v13, "addCompletionBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v14;
}

id __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_2;
  v13[3] = &unk_1E6F4E990;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v14 = *(id *)(a1 + 32);
  v6 = v3;
  v15 = v6;
  objc_msgSend(v4, "futureWithBlock:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_20;
  v11[3] = &unk_1E6F502A0;
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "addSuccessBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  return v9;
}

void __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
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
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!objc_msgSend(WeakRetained, "settingsContext"))
  {
    v8 = (void *)MEMORY[0x1E0D31268];
    objc_msgSend(WeakRetained, "cameraProfiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationForCameraProfilesRecordingSettings:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(WeakRetained, "settingsContext") == 1)
  {
    v5 = (void *)MEMORY[0x1E0D31268];
    objc_msgSend(WeakRetained, "cameraProfiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationForCameraProfilesNotificationSettings:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v7;

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:
  +[HUCameraSmartDetectionSettingsModule updateCurrentSignificantEventConfiguration:withSelectedConfiguration:cameraProfile:context:](HUCameraSmartDetectionSettingsModule, "updateCurrentSignificantEventConfiguration:withSelectedConfiguration:cameraProfile:context:", v9, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(WeakRetained, "settingsContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "settingsContext"))
  {
    if (objc_msgSend(WeakRetained, "settingsContext") == 1)
    {
      objc_msgSend(v10, "predicateRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31270]), "initWithPredicate:", v11);
      objc_msgSend(WeakRetained, "conditionCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "condition");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeCondition:", v14);

      objc_msgSend(WeakRetained, "setCondition:", v12);
      objc_msgSend(WeakRetained, "conditionCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "condition");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addCondition:", v16);

      objc_msgSend(v3, "finishWithNoResult");
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "userSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v10, "eventTypes");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_3;
    v19[3] = &unk_1E6F56310;
    v20 = v10;
    v21 = *(id *)(a1 + 40);
    v22 = v3;
    objc_msgSend(v17, "updateRecordingEventTriggers:completionHandler:", v18, v19);

  }
}

void __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "eventTypes");
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 134218498;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Error updating smart motion recording eventTypes: %lu for camera: %@ (error: %@)", (uint8_t *)&v7, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");
  }

}

void __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_20(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_2_22;
  v3[3] = &unk_1E6F575C8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "dispatchCameraObserverMessage:sender:", v3, 0);

}

void __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_2_22(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "userSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraUserSettingsDidUpdate:", v4);

}

void __76__HUCameraSmartDetectionSettingsModule_updateSignificantEventConfiguration___block_invoke_3_27(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "itemUpdater");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(*(id *)(a1 + 32), "itemProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestToReloadItemProviders:senderSelector:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "performItemUpdateRequest:", v4);

}

+ (id)updateCurrentSignificantEventConfiguration:(id)a3 withSelectedConfiguration:(id)a4 cameraProfile:(id)a5 context:(unint64_t)a6
{
  if (a6)
    +[HUCameraSmartDetectionSettingsModule _updatedNotificationCurrentSignificantEventConfiguration:withSelectedConfiguration:cameraProfile:](HUCameraSmartDetectionSettingsModule, "_updatedNotificationCurrentSignificantEventConfiguration:withSelectedConfiguration:cameraProfile:", a3, a4, a5);
  else
    +[HUCameraSmartDetectionSettingsModule _updatedRecordingCurrentSignificantEventConfiguration:withSelectedConfiguration:cameraProfile:](HUCameraSmartDetectionSettingsModule, "_updatedRecordingCurrentSignificantEventConfiguration:withSelectedConfiguration:cameraProfile:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_updatedRecordingCurrentSignificantEventConfiguration:(id)a3 withSelectedConfiguration:(id)a4 cameraProfile:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "eventTypes"))
  {
    if (objc_msgSend(v8, "eventTypes") != 1)
    {
      +[HUCameraSmartDetectionSettingsModule _updatedCurrentSignificantEventConfiguration:withSelectedConfiguration:context:](HUCameraSmartDetectionSettingsModule, "_updatedCurrentSignificantEventConfiguration:withSelectedConfiguration:context:", v7, v8, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUCameraSmartDetectionSettingsModule recordingConfiguration:withCurrentConfiguration:forProfile:](HUCameraSmartDetectionSettingsModule, "recordingConfiguration:withCurrentConfiguration:forProfile:", v12, v7, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0D31268], "defaultAnyMotionConfiguration");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_msgSend(v8, "copy");
  }
  v11 = (void *)v10;
LABEL_7:

  return v11;
}

+ (id)_updatedNotificationCurrentSignificantEventConfiguration:(id)a3 withSelectedConfiguration:(id)a4 cameraProfile:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "eventTypes") == 1)
  {
    objc_msgSend((id)objc_opt_class(), "notificationConfigurationForAClipIsRecorded");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "eventTypes"))
  {
    if (objc_msgSend((id)objc_opt_class(), "isSpecificMotionSelectedForConfiguration:withCurrentConfiguration:", v8, v7))objc_msgSend((id)objc_opt_class(), "specificMotionNotificationConfigurationForCameraProfile:", v9);
    else
      +[HUCameraSmartDetectionSettingsModule _updatedCurrentSignificantEventConfiguration:withSelectedConfiguration:context:](HUCameraSmartDetectionSettingsModule, "_updatedCurrentSignificantEventConfiguration:withSelectedConfiguration:context:", v7, v8, 1);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_msgSend(v8, "copy");
  }
  v11 = (void *)v10;

  return v11;
}

+ (id)_updatedCurrentSignificantEventConfiguration:(id)a3 withSelectedConfiguration:(id)a4 context:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(v8, "copy");
  v10 = objc_msgSend(v8, "containsConfiguration:", v7);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D31268], "defaultAnyMotionConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31268], "configurationWithEventTypes:personFamiliarityOptions:", 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "removeConfiguration:", v12);
    objc_msgSend(v9, "addConfiguration:", v7);
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v9, "removeConfiguration:", v7);
  if (!objc_msgSend(v9, "eventTypes"))
  {
    if (a5)
      objc_msgSend(MEMORY[0x1E0D31268], "defaultNotificationAnyMotionIsDetected");
    else
      objc_msgSend(MEMORY[0x1E0D31268], "defaultAnyMotionConfiguration");
    v12 = v9;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

+ (BOOL)isSpecificMotionSelectedForConfiguration:(id)a3 withCurrentConfiguration:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "eventTypes");
  objc_msgSend(MEMORY[0x1E0D31268], "defaultSmartMotionConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "eventTypes");

  if (v7 == v9)
  {
    v10 = objc_msgSend(v6, "eventTypes");
    v11 = v10 != objc_msgSend(v5, "eventTypes");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)notificationConfigurationForAClipIsRecorded
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D31268], "defaultSmartMotionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEventTypes:", objc_msgSend(v2, "eventTypes") | 1);
  return v2;
}

+ (id)specificMotionNotificationConfigurationForCameraProfile:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0D31268];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "userSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setEventTypes:", objc_msgSend(v6, "recordingEventTriggers"));
  if ((objc_msgSend(v5, "eventTypes") & 1) != 0)
    objc_msgSend(v5, "setEventTypes:", objc_msgSend(v5, "eventTypes") ^ 1);
  return v5;
}

+ (id)recordingConfiguration:(id)a3 withCurrentConfiguration:(id)a4 forProfile:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a5, "hf_hasDoorbellService") & 1) == 0 && (objc_msgSend(v8, "eventTypes") & 1) != 0)
    objc_msgSend(v7, "setEventTypes:", objc_msgSend(v7, "eventTypes") ^ 0x10);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

+ (id)notificationConfiguration:(id)a3 forRecordingTriggers:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (objc_msgSend(v5, "eventTypes") == 1 || !objc_msgSend(v5, "eventTypes"))
    goto LABEL_5;
  if ((objc_msgSend(v5, "eventTypes") & 1) != 0)
  {
    a4 = objc_msgSend(v5, "eventTypes") ^ 1;
LABEL_5:
    objc_msgSend(v5, "setEventTypes:", a4);
  }
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (id)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HUCameraSmartDetectionSettingsModule motionDetectionOffOnItemProvider](self, "motionDetectionOffOnItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    -[HUCameraSmartDetectionSettingsModule specificMotionDetectedItem](self, "specificMotionDetectedItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraSmartDetectionSettingsModule enableSmartMotion:forItem:](self, "enableSmartMotion:forItem:", objc_msgSend(v4, "isEqual:", v8), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)itemProviders
{
  NSSet *itemProviders;
  NSSet *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HFItemProvider *v24;
  HFItemProvider *motionDetectionOffOnItemProvider;
  HUCameraSmartDetectionSettingsItemProvider *v26;
  void *v27;
  HFItemProvider *v28;
  HFItemProvider *motionDetectionSettingsItemProvider;
  NSSet *v30;
  NSSet *v31;
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;

  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    v3 = itemProviders;
  }
  else
  {
    -[HUCameraSmartDetectionSettingsModule cameraProfiles](self, "cameraProfiles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0D31840]);
    v10 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __53__HUCameraSmartDetectionSettingsModule_itemProviders__block_invoke;
    v38[3] = &unk_1E6F4DB68;
    v38[4] = self;
    v11 = v8;
    v39 = v11;
    v12 = (void *)objc_msgSend(v9, "initWithResultsBlock:", v38);
    -[HUCameraSmartDetectionSettingsModule setAClipIsRecordedItem:](self, "setAClipIsRecordedItem:", v12);

    v13 = objc_alloc(MEMORY[0x1E0D31840]);
    v36[0] = v10;
    v36[1] = 3221225472;
    v36[2] = __53__HUCameraSmartDetectionSettingsModule_itemProviders__block_invoke_37;
    v36[3] = &unk_1E6F4DB68;
    v36[4] = self;
    v14 = v11;
    v37 = v14;
    v15 = (void *)objc_msgSend(v13, "initWithResultsBlock:", v36);
    -[HUCameraSmartDetectionSettingsModule setAnyMotionDetectedItem:](self, "setAnyMotionDetectedItem:", v15);

    v16 = objc_alloc(MEMORY[0x1E0D31840]);
    v34[0] = v10;
    v34[1] = 3221225472;
    v34[2] = __53__HUCameraSmartDetectionSettingsModule_itemProviders__block_invoke_41;
    v34[3] = &unk_1E6F4DB68;
    v34[4] = self;
    v35 = v14;
    v33 = v14;
    v17 = (void *)objc_msgSend(v16, "initWithResultsBlock:", v34);
    -[HUCameraSmartDetectionSettingsModule setSpecificMotionDetectedItem:](self, "setSpecificMotionDetectedItem:", v17);

    v18 = objc_alloc(MEMORY[0x1E0D31848]);
    v19 = (void *)MEMORY[0x1E0C99E60];
    -[HUCameraSmartDetectionSettingsModule anyMotionDetectedItem](self, "anyMotionDetectedItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraSmartDetectionSettingsModule aClipIsRecordedItem](self, "aClipIsRecordedItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraSmartDetectionSettingsModule specificMotionDetectedItem](self, "specificMotionDetectedItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithObjects:", v20, v21, v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (HFItemProvider *)objc_msgSend(v18, "initWithItems:", v23);
    motionDetectionOffOnItemProvider = self->_motionDetectionOffOnItemProvider;
    self->_motionDetectionOffOnItemProvider = v24;

    v26 = [HUCameraSmartDetectionSettingsItemProvider alloc];
    -[HUCameraSmartDetectionSettingsModule cameraProfiles](self, "cameraProfiles");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[HUCameraSmartDetectionSettingsItemProvider initWithCameraProfiles:settingsContext:](v26, "initWithCameraProfiles:settingsContext:", v27, -[HUCameraSmartDetectionSettingsModule settingsContext](self, "settingsContext"));
    motionDetectionSettingsItemProvider = self->_motionDetectionSettingsItemProvider;
    self->_motionDetectionSettingsItemProvider = v28;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", self->_motionDetectionOffOnItemProvider, self->_motionDetectionSettingsItemProvider, 0);
    v30 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v31 = self->_itemProviders;
    self->_itemProviders = v30;

    v3 = self->_itemProviders;
  }
  return v3;
}

id __53__HUCameraSmartDetectionSettingsModule_itemProviders__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[7];
  _QWORD v22[8];

  v22[7] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "settingsContext"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "settingsContext") != 1)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v2 = (void *)MEMORY[0x1E0D31268];
    objc_msgSend(*(id *)(a1 + 32), "cameraProfiles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "configurationForCameraProfilesNotificationSettings:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D31268];
    objc_msgSend(*(id *)(a1 + 32), "cameraProfiles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationForCameraProfilesRecordingSettings:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;

LABEL_7:
  v7 = objc_msgSend(v6, "eventTypes");
  if (objc_msgSend(*(id *)(a1 + 32), "settingsContext")
    || objc_msgSend(*(id *)(a1 + 40), "hf_currentUserIsAdministrator"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "settingsContext") == 1)
      v8 = objc_msgSend(*(id *)(a1 + 40), "areBulletinNotificationsSupported") ^ 1;
    else
      v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  v21[0] = *MEMORY[0x1E0D30DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 & 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  v21[1] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraStreamingSettingAClipIsRecorded"), CFSTR("HUCameraStreamingSettingAClipIsRecorded"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  v21[2] = *MEMORY[0x1E0D30B80];
  objc_msgSend(*(id *)(a1 + 32), "cameraProfiles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D30CE8];
  v13 = MEMORY[0x1E0C9AAA0];
  v22[2] = v11;
  v22[3] = MEMORY[0x1E0C9AAA0];
  v14 = *MEMORY[0x1E0D30DA8];
  v21[3] = v12;
  v21[4] = v14;
  v22[4] = &unk_1E7041878;
  v21[5] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v15;
  v21[6] = *MEMORY[0x1E0D30D70];
  v16 = objc_msgSend(*(id *)(a1 + 32), "settingsContext");
  v17 = MEMORY[0x1E0C9AAB0];
  if (v16)
    v17 = v13;
  v22[6] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __53__HUCameraSmartDetectionSettingsModule_itemProviders__block_invoke_37(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[6];
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "settingsContext"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "settingsContext") != 1)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v2 = (void *)MEMORY[0x1E0D31268];
    objc_msgSend(*(id *)(a1 + 32), "cameraProfiles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "configurationForCameraProfilesNotificationSettings:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D31268];
    objc_msgSend(*(id *)(a1 + 32), "cameraProfiles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationForCameraProfilesRecordingSettings:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;

LABEL_7:
  v7 = objc_msgSend(*(id *)(a1 + 32), "settingsContext");
  v8 = objc_msgSend(v6, "eventTypes");
  if (objc_msgSend(*(id *)(a1 + 32), "settingsContext")
    || objc_msgSend(*(id *)(a1 + 40), "hf_currentUserIsAdministrator"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "settingsContext") == 1)
      v9 = objc_msgSend(*(id *)(a1 + 40), "areBulletinNotificationsSupported") ^ 1;
    else
      v9 = 0;
  }
  else
  {
    v9 = 1;
  }
  if (v7 == 1)
    v10 = v8 == 0;
  else
    v10 = v8;
  v19[0] = *MEMORY[0x1E0D30DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v19[1] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraStreamingSettingAnyMotion"), CFSTR("HUCameraStreamingSettingAnyMotion"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  v19[2] = *MEMORY[0x1E0D30B80];
  objc_msgSend(*(id *)(a1 + 32), "cameraProfiles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v13;
  v20[3] = MEMORY[0x1E0C9AAA0];
  v14 = *MEMORY[0x1E0D30DA8];
  v19[3] = *MEMORY[0x1E0D30CE8];
  v19[4] = v14;
  v20[4] = &unk_1E7041890;
  v19[5] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id __53__HUCameraSmartDetectionSettingsModule_itemProviders__block_invoke_41(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "settingsContext"))
  {
    v5 = (void *)MEMORY[0x1E0D31268];
    objc_msgSend(*(id *)(a1 + 32), "cameraProfiles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationForCameraProfilesRecordingSettings:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "settingsContext") == 1)
  {
    v2 = (void *)MEMORY[0x1E0D31268];
    objc_msgSend(*(id *)(a1 + 32), "cameraProfiles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "configurationForCameraProfilesNotificationSettings:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v4;

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:
  v7 = (objc_msgSend(v6, "eventTypes") & 1) == 0 && objc_msgSend(v6, "eventTypes") != 0;
  if (objc_msgSend(*(id *)(a1 + 32), "settingsContext")
    || objc_msgSend(*(id *)(a1 + 40), "hf_currentUserIsAdministrator"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "settingsContext") == 1)
      v8 = objc_msgSend(*(id *)(a1 + 40), "areBulletinNotificationsSupported") ^ 1;
    else
      v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  v17[0] = *MEMORY[0x1E0D30DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v17[1] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraStreamingSettingSpecificMotion"), CFSTR("HUCameraStreamingSettingSpecificMotion"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  v17[2] = *MEMORY[0x1E0D30B80];
  objc_msgSend(*(id *)(a1 + 32), "cameraProfiles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  v18[3] = MEMORY[0x1E0C9AAA0];
  v12 = *MEMORY[0x1E0D30DA8];
  v17[3] = *MEMORY[0x1E0D30CE8];
  v17[4] = v12;
  v18[4] = &unk_1E70418A8;
  v17[5] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;

  v4 = a3;
  -[HUCameraSmartDetectionSettingsModule itemProviders](self, "itemProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __72__HUCameraSmartDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke;
  v26[3] = &unk_1E6F57F28;
  v7 = v4;
  v27 = v7;
  objc_msgSend(v5, "na_flatMap:", v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUCameraSmartDetectionSettingsOnOffSectionIdentifier"));
  v25[0] = v6;
  v25[1] = 3221225472;
  v25[2] = __72__HUCameraSmartDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v25[3] = &unk_1E6F4DAD8;
  v25[4] = self;
  objc_msgSend(v8, "na_filter:", v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "itemResultManualSortComparator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingComparator:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setItems:", v14);

  if (-[HUCameraSmartDetectionSettingsModule settingsContext](self, "settingsContext"))
    v15 = CFSTR("HUStatusAndNotificationCameraMotionHeader");
  else
    v15 = CFSTR("HUCameraStreamingSettingsMotionDetectionSettings");
  _HULocalizedStringWithDefaultValue(v15, v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHeaderTitle:", v16);

  if (-[HUCameraSmartDetectionSettingsModule settingsContext](self, "settingsContext")
    && !_os_feature_enabled_impl())
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUStatusAndNotificationsCameraSmartSectionFooter"), CFSTR("HUStatusAndNotificationsCameraSmartSectionFooter"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFooterTitle:", v17);

  }
  else
  {
    objc_msgSend(v10, "setFooterTitle:", &stru_1E6F60E80);
  }
  objc_msgSend(v9, "addObject:", v10);
  -[HUCameraSmartDetectionSettingsModule motionDetectionSettingsItemProvider](self, "motionDetectionSettingsItemProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUCameraSmartDetectionSettingsMotionDetectionSectionIdentifier"));
  objc_msgSend(v18, "items");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "itemResultManualSortComparator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sortedArrayUsingComparator:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setItems:filteringToDisplayedItems:", v23, v8);
  objc_msgSend(v9, "addObject:", v19);

  return v9;
}

id __72__HUCameraSmartDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_setByIntersectingWithSet:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __72__HUCameraSmartDetectionSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v3 = a2;
  objc_msgSend(v2, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (BOOL)isItemHeader:(id)a3
{
  return 0;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (HFConditionCollection)conditionCollection
{
  return self->_conditionCollection;
}

- (HFStaticItem)aClipIsRecordedItem
{
  return self->_aClipIsRecordedItem;
}

- (void)setAClipIsRecordedItem:(id)a3
{
  objc_storeStrong((id *)&self->_aClipIsRecordedItem, a3);
}

- (HFStaticItem)anyMotionDetectedItem
{
  return self->_anyMotionDetectedItem;
}

- (void)setAnyMotionDetectedItem:(id)a3
{
  objc_storeStrong((id *)&self->_anyMotionDetectedItem, a3);
}

- (HFStaticItem)specificMotionDetectedItem
{
  return self->_specificMotionDetectedItem;
}

- (void)setSpecificMotionDetectedItem:(id)a3
{
  objc_storeStrong((id *)&self->_specificMotionDetectedItem, a3);
}

- (HFItemProvider)motionDetectionSettingsItemProvider
{
  return self->_motionDetectionSettingsItemProvider;
}

- (HFItemProvider)motionDetectionOffOnItemProvider
{
  return self->_motionDetectionOffOnItemProvider;
}

- (unint64_t)settingsContext
{
  return self->_settingsContext;
}

- (HFCameraSmartDetectionCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_storeStrong((id *)&self->_condition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_motionDetectionOffOnItemProvider, 0);
  objc_storeStrong((id *)&self->_motionDetectionSettingsItemProvider, 0);
  objc_storeStrong((id *)&self->_specificMotionDetectedItem, 0);
  objc_storeStrong((id *)&self->_anyMotionDetectedItem, 0);
  objc_storeStrong((id *)&self->_aClipIsRecordedItem, 0);
  objc_storeStrong((id *)&self->_conditionCollection, 0);
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
