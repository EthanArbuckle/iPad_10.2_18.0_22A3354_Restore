@implementation HUCameraSmartNotificationSettingsModuleController

- (HUCameraSmartNotificationSettingsModuleController)initWithModule:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  HUCameraSmartNotificationSettingsModuleController *v15;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (!v6)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v6;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

LABEL_7:
    v8 = 0;
  }

  v11 = &unk_1EF267288;
  v12 = v6;
  v13 = v12;
  if (v6)
  {
    if (objc_msgSend(v12, "conformsToProtocol:", v11))
      v14 = v13;
    else
      v14 = 0;
    v6 = v13;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromProtocol((Protocol *)v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v19);

      v6 = 0;
    }
  }

  v20.receiver = self;
  v20.super_class = (Class)HUCameraSmartNotificationSettingsModuleController;
  v15 = -[HUItemModuleController initWithModule:](&v20, sel_initWithModule_, v13);

  return v15;
}

- (BOOL)isItemHeader:(id)a3
{
  return 0;
}

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isItemHeader:", v4);

  if ((v6 & 1) == 0)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  objc_opt_class();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v7;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUCameraSmartNotificationSettingsModuleController;
  -[HUItemModuleController setupCell:forItem:](&v22, sel_setupCell_forItem_, v6, v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setValueColorFollowsTintColor:", 1);
  objc_msgSend(v7, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    v10 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentMode:", 5);

    objc_msgSend(v12, "setImageViewRecommendedSize:", 50.0, 50.0);
  }
  -[HUItemModuleController module](self, "module");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isItemHeader:", v7);

  if ((v15 & 1) == 0)
  {
    objc_opt_class();
    v16 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    objc_msgSend(v18, "setHideIcon:", 1);
  }
  objc_opt_class();
  v19 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  if (v21)
    objc_msgSend(v21, "setDelegate:", self);

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v12;

  v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)HUCameraSmartNotificationSettingsModuleController;
  v7 = a4;
  v8 = a3;
  -[HUItemModuleController updateCell:forItem:animated:](&v12, sel_updateCell_forItem_animated_, v8, v7, v5);
  objc_msgSend(v7, "latestResults", v12.receiver, v12.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "BOOLValue"))
    v11 = 3;
  else
    v11 = 0;
  objc_msgSend(v8, "setAccessoryType:", v11);

}

+ (BOOL)shouldDisplayAlertForItem:(id)a3 withSmartDetectionModule:(id)a4 forProfile:(id)a5
{
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(a5, "hf_cameraIsNotSetToRecord");
  objc_msgSend(v8, "specificMotionDetectedItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v10) & 1) == 0)
  {
    objc_msgSend(v8, "aClipIsRecordedItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 &= objc_msgSend(v7, "isEqual:", v11);

  }
  return v9;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  id v39;
  id v40;
  _QWORD aBlock[4];
  id v42;
  id location;

  v4 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      -[HUItemModuleController module](self, "module");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v10, "didSelectItem:", v4);

      -[HUCameraSmartNotificationSettingsModuleController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        -[HUCameraSmartNotificationSettingsModuleController delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "conditionCollection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "smartNotificationSettingsModuleController:didUpdateConditionCollection:", self, v15);

      }
    }
    else
    {
      objc_initWeak(&location, self);
      v16 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __67__HUCameraSmartNotificationSettingsModuleController_didSelectItem___block_invoke;
      aBlock[3] = &unk_1E6F52988;
      objc_copyWeak(&v42, &location);
      v17 = _Block_copy(aBlock);
      objc_msgSend(v7, "cameraProfiles");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "anyObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = +[HUCameraSmartNotificationSettingsModuleController shouldDisplayAlertForItem:withSmartDetectionModule:forProfile:](HUCameraSmartNotificationSettingsModuleController, "shouldDisplayAlertForItem:withSmartDetectionModule:forProfile:", v4, v7, v19);

      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "home");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "hf_currentUserIsOwner"))
          v23 = CFSTR("HUCameraStatusAndNotificationsSmartAlertDescription_Owner");
        else
          v23 = CFSTR("HUCameraStatusAndNotificationsSmartAlertDescription");
        _HULocalizedStringWithDefaultValue(v23, v23, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = (void *)MEMORY[0x1E0CEA2E8];
        _HULocalizedStringWithDefaultValue(CFSTR("HUCameraStatusAndNotificationsSmartAlertTitle"), CFSTR("HUCameraStatusAndNotificationsSmartAlertTitle"), 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "alertControllerWithTitle:message:preferredStyle:", v26, v24, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = (void *)MEMORY[0x1E0CEA2E0];
        _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v16;
        v36 = 3221225472;
        v37 = __67__HUCameraSmartNotificationSettingsModuleController_didSelectItem___block_invoke_2;
        v38 = &unk_1E6F529B0;
        v40 = v17;
        v39 = v4;
        objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 0, &v35);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addAction:", v30, v35, v36, v37, v38);

        +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v27);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setPreferredPresentationType:", 0);
        -[HUItemModuleController host](self, "host");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (id)objc_msgSend(v32, "moduleController:presentViewControllerForRequest:", self, v31);

      }
      else
      {
        (*((void (**)(void *, id))v17 + 2))(v17, v4);
      }

      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
    }
  }

  return 0;
}

void __67__HUCameraSmartNotificationSettingsModuleController_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  objc_msgSend(WeakRetained, "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    v7 = (id)objc_msgSend(v6, "didSelectItem:", v12);
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conditionCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "smartNotificationSettingsModuleController:didUpdateConditionCollection:", WeakRetained, v11);

  }
}

uint64_t __67__HUCameraSmartNotificationSettingsModuleController_didSelectItem___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  v10 = v6;
  if (v4
    && (objc_msgSend(v6, "item"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = -[HUCameraSmartNotificationSettingsModuleController canEnableNotificationForItem:](self, "canEnableNotificationForItem:", v7), v7, v6 = v10, !v8))
  {
    objc_msgSend(v10, "setOn:animated:", 0, 1);
    -[HUCameraSmartNotificationSettingsModuleController displayAlertForItemCell:](self, "displayAlertForItemCell:", v10);
  }
  else
  {
    objc_msgSend(v6, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraSmartNotificationSettingsModuleController updateNotificationSettingForItem:](self, "updateNotificationSettingForItem:", v9);

  }
}

- (void)updateNotificationSettingForItem:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = (id)objc_msgSend(v7, "updateMotionDetectionSettingForItem:", v18);
  -[HUCameraSmartNotificationSettingsModuleController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[HUCameraSmartNotificationSettingsModuleController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conditionCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "smartNotificationSettingsModuleController:didUpdateConditionCollection:", self, v12);

  }
  objc_msgSend(v7, "itemUpdater");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(v7, "itemProviders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestToReloadItemProviders:senderSelector:", v15, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v13, "performItemUpdateRequest:", v16);

}

- (BOOL)canEnableNotificationForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  objc_msgSend(v4, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HUCameraSettingResultKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v7, "cameraProfiles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "recordingEventTriggers");
  LOBYTE(v15) = (objc_msgSend(v11, "eventTypes") & v15) != 0;

  return v15;
}

- (void)displayAlertForItemCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id location;

  v4 = a3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HUCameraSettingResultKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hf_currentUserIsOwner") & 1) != 0)
    -[HUCameraSmartNotificationSettingsModuleController alertMessageForEventType:](self, "alertMessageForEventType:", objc_msgSend(v9, "eventTypes"));
  else
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraStatusAndNotificationsSmartAlertDescription"), CFSTR("HUCameraStatusAndNotificationsSmartAlertDescription"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CEA2E8];
  -[HUCameraSmartNotificationSettingsModuleController alertTitleForEventType:](self, "alertTitleForEventType:", objc_msgSend(v9, "eventTypes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", v14, v12, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v16 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __77__HUCameraSmartNotificationSettingsModuleController_displayAlertForItemCell___block_invoke;
  v28[3] = &unk_1E6F52A00;
  objc_copyWeak(&v32, &location);
  v18 = v9;
  v29 = v18;
  v19 = v4;
  v30 = v19;
  v20 = v5;
  v31 = v20;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v21);

  v22 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 0, &__block_literal_global_79);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v24);

  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPreferredPresentationType:", 0);
  -[HUItemModuleController host](self, "host");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v26, "moduleController:presentViewControllerForRequest:", self, v25);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

void __77__HUCameraSmartNotificationSettingsModuleController_displayAlertForItemCell___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_opt_class();
  objc_msgSend(WeakRetained, "module");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = (void *)MEMORY[0x1E0D31268];
  objc_msgSend(v5, "cameraProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationForCameraProfilesRecordingSettings:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addConfiguration:", *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(v8, "eventTypes") & 1) != 0)
    objc_msgSend(v8, "setEventTypes:", objc_msgSend(v8, "eventTypes") ^ 1);
  objc_msgSend(v5, "cameraProfiles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "userSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "eventTypes");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__HUCameraSmartNotificationSettingsModuleController_displayAlertForItemCell___block_invoke_2;
  v15[3] = &unk_1E6F529D8;
  v16 = v8;
  v17 = v10;
  v18 = *(id *)(a1 + 40);
  v19 = WeakRetained;
  v20 = *(id *)(a1 + 48);
  v13 = v8;
  v14 = v10;
  objc_msgSend(v11, "updateRecordingEventTriggers:completionHandler:", v12, v15);

}

void __77__HUCameraSmartNotificationSettingsModuleController_displayAlertForItemCell___block_invoke_2(uint64_t a1, void *a2)
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

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setOn:animated:", 1, 1);
    objc_msgSend(*(id *)(a1 + 56), "updateNotificationSettingForItem:", *(_QWORD *)(a1 + 64));
  }

}

- (id)alertTitleForEventType:(unint64_t)a3
{
  __int128 v3;
  __CFString *v4;
  __CFString *v5;

  *((_QWORD *)&v3 + 1) = a3;
  *(_QWORD *)&v3 = a3 - 2;
  v4 = &stru_1E6F60E80;
  switch((unint64_t)(v3 >> 1))
  {
    case 0uLL:
      v5 = CFSTR("HUCameraStatusAndNotificationsSmartAlertPeopleTitle");
      goto LABEL_6;
    case 1uLL:
      v5 = CFSTR("HUCameraStatusAndNotificationsSmartAlertAnimalsTitle");
      goto LABEL_6;
    case 3uLL:
      v5 = CFSTR("HUCameraStatusAndNotificationsSmartAlertVehiclesTitle");
      goto LABEL_6;
    case 7uLL:
      v5 = CFSTR("HUCameraStatusAndNotificationsSmartAlertPackagesTitle");
LABEL_6:
      _HULocalizedStringWithDefaultValue(v5, v5, 1);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v4;
  }
  return v4;
}

- (id)alertMessageForEventType:(unint64_t)a3
{
  __int128 v3;
  __CFString *v4;
  __CFString *v5;

  *((_QWORD *)&v3 + 1) = a3;
  *(_QWORD *)&v3 = a3 - 2;
  v4 = &stru_1E6F60E80;
  switch((unint64_t)(v3 >> 1))
  {
    case 0uLL:
      v5 = CFSTR("HUCameraStatusAndNotificationsSmartAlertPeopleDescription");
      goto LABEL_6;
    case 1uLL:
      v5 = CFSTR("HUCameraStatusAndNotificationsSmartAlertAnimalsDescription");
      goto LABEL_6;
    case 3uLL:
      v5 = CFSTR("HUCameraStatusAndNotificationsSmartAlertVehiclesDescription");
      goto LABEL_6;
    case 7uLL:
      v5 = CFSTR("HUCameraStatusAndNotificationsSmartAlertPackagesDescription");
LABEL_6:
      _HULocalizedStringWithDefaultValue(v5, v5, 1);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v4;
  }
  return v4;
}

- (HUCameraSmartNotificationSettingsModuleControllerDelegate)delegate
{
  return (HUCameraSmartNotificationSettingsModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
