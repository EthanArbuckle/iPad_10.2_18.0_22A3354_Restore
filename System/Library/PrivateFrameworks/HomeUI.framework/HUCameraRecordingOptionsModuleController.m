@implementation HUCameraRecordingOptionsModuleController

- (HUCameraRecordingOptionsModuleController)initWithModule:(id)a3
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
  HUCameraRecordingOptionsModuleController *v15;
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
  v20.super_class = (Class)HUCameraRecordingOptionsModuleController;
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
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if ((objc_msgSend(v7, "isItemHeader:", v4) & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v7, "smartDetectionModule");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "anyMotionDetectedItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqual:", v9) & 1) == 0)
      {
        objc_msgSend(v7, "smartDetectionModule");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "specificMotionDetectedItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "isEqual:", v11) & 1) == 0)
        {
          objc_msgSend(v7, "smartDetectionModule");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "aClipIsRecordedItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "isEqual:", v13);

          goto LABEL_11;
        }

      }
    }
  }
LABEL_11:
  objc_opt_class();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v14;
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
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)HUCameraRecordingOptionsModuleController;
  -[HUItemModuleController setupCell:forItem:](&v29, sel_setupCell_forItem_, v6, v7);
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
  objc_opt_class();
  v22 = v19;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  if (v24)
  {
    objc_opt_class();
    v25 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v27 = v26;

    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTintColor:", v28);

      objc_msgSend(v24, "setTextAlignment:", 4);
    }
  }

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
  v12.super_class = (Class)HUCameraRecordingOptionsModuleController;
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

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    -[HUItemModuleController module](self, "module");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = (void *)MEMORY[0x1E0CEA2E8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraEraseAllRecordingsAlertMessage"), CFSTR("HUCameraEraseAllRecordingsAlertMessage"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", 0, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraEraseAllRecordings"), CFSTR("HUCameraEraseAllRecordings"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __58__HUCameraRecordingOptionsModuleController_didSelectItem___block_invoke;
    v26[3] = &unk_1E6F4C6E0;
    v27 = v7;
    v13 = v7;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 2, v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v14);

    v15 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRemoveDeviceAlertCancelButton"), CFSTR("HUServiceDetailsRemoveDeviceAlertCancelButton"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v17);

    +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPreferredPresentationType:", 0);
    -[HUItemModuleController host](self, "host");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v19, "moduleController:presentViewControllerForRequest:", self, v18);

  }
  -[HUItemModuleController module](self, "module");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    -[HUItemModuleController module](self, "module");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)objc_msgSend(v23, "didSelectItem:", v4);

  }
  return 0;
}

void __58__HUCameraRecordingOptionsModuleController_didSelectItem___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cloudStorageModule");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "removeAllCameraRecordings");

}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;

  v4 = a4;
  v27 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v27, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordAudioItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    objc_msgSend(v8, "updateRecordAudioValue:", v4);
  }
  else
  {
    if (v4
      || (objc_msgSend(v27, "item"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = -[HUCameraRecordingOptionsModuleController hasNotificationSettingForItem:](self, "hasNotificationSettingForItem:", v12), v12, !v13))
    {
      objc_msgSend(v8, "smartDetectionModule");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "item");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v14, "updateMotionDetectionSettingForItem:", v15);

    }
    else
    {
      objc_msgSend(v27, "setOn:animated:", 1, 1);
      objc_msgSend(v27, "item");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraRecordingOptionsModuleController displayAlertForItem:](self, "displayAlertForItem:", v14);
    }

  }
  objc_opt_class();
  -[HUItemModuleController host](self, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  if (v19)
  {
    objc_opt_class();
    objc_msgSend(v27, "item");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "latestResults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D20]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    v25 = (void *)MEMORY[0x1E0D31170];
    objc_msgSend(v27, "item");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sendSwitchCellToggleEventForItem:isOn:title:fromSourceViewController:", v26, v4, v24, v19);

  }
}

- (BOOL)hasNotificationSettingForItem:(id)a3
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

  v12 = (void *)MEMORY[0x1E0D31268];
  objc_msgSend(v7, "cameraProfiles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configurationForCameraProfilesNotificationSettings:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "eventTypes");
  LOBYTE(v15) = (objc_msgSend(v11, "eventTypes") & v15) != 0;

  return v15;
}

- (void)displayAlertForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  HUCameraRecordingOptionsModuleController *v29;
  id v30;

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

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "hf_currentUserIsOwner") & 1) != 0)
    -[HUCameraRecordingOptionsModuleController alertMessageForEventType:](self, "alertMessageForEventType:", objc_msgSend(v8, "eventTypes"));
  else
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraStatusAndNotificationsSmartAlertDescription"), CFSTR("HUCameraStatusAndNotificationsSmartAlertDescription"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CEA2E8];
  -[HUCameraRecordingOptionsModuleController alertTitleForEventType:](self, "alertTitleForEventType:", objc_msgSend(v8, "eventTypes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v13, v11, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __64__HUCameraRecordingOptionsModuleController_displayAlertForItem___block_invoke;
  v28 = &unk_1E6F526C8;
  v29 = self;
  v30 = v4;
  v17 = v4;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, &v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v18, v25, v26, v27, v28, v29);

  v19 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, &__block_literal_global_139);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v21);

  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPreferredPresentationType:", 0);
  -[HUItemModuleController host](self, "host");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v23, "moduleController:presentViewControllerForRequest:", self, v22);

}

void __64__HUCameraRecordingOptionsModuleController_displayAlertForItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "module");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "smartDetectionModule");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v6, "updateMotionDetectionSettingForItem:", *(_QWORD *)(a1 + 40));
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
      v5 = CFSTR("HUCameraRecordingOptionsWarningPeopleTitle");
      goto LABEL_6;
    case 1uLL:
      v5 = CFSTR("HUCameraRecordingOptionsWarningAnimalsTitle");
      goto LABEL_6;
    case 3uLL:
      v5 = CFSTR("HUCameraRecordingOptionsWarningVehiclesTitle");
      goto LABEL_6;
    case 7uLL:
      v5 = CFSTR("HUCameraRecordingOptionsWarningPackagesTitle");
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
      v5 = CFSTR("HUCameraRecordingOptionsWarningPeopleDescription");
      goto LABEL_6;
    case 1uLL:
      v5 = CFSTR("HUCameraRecordingOptionsWarningAnimalsDescription");
      goto LABEL_6;
    case 3uLL:
      v5 = CFSTR("HUCameraRecordingOptionsWarningVehiclesDescription");
      goto LABEL_6;
    case 7uLL:
      v5 = CFSTR("HUCameraRecordingOptionsWarningPackagesDescription");
LABEL_6:
      _HULocalizedStringWithDefaultValue(v5, v5, 1);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v4;
  }
  return v4;
}

@end
