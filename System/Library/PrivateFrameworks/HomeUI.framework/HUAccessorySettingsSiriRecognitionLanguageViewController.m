@implementation HUAccessorySettingsSiriRecognitionLanguageViewController

- (HUAccessorySettingsSiriRecognitionLanguageViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessoryGroupItem_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsSiriRecognitionLanguageViewController.m"), 44, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAccessorySettingsSiriRecognitionLanguageViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUAccessorySettingsSiriRecognitionLanguageViewController)initWithAccessoryGroupItem:(id)a3
{
  id v4;
  HUAccessorySettingsSiriRecognitionLanguageItemManager *v5;
  HUAccessorySettingsSiriRecognitionLanguageViewController *v6;
  HUAccessorySettingsSiriRecognitionLanguageViewController *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[HUAccessorySettingsSiriRecognitionLanguageItemManager initWithDelegate:groupItem:]([HUAccessorySettingsSiriRecognitionLanguageItemManager alloc], "initWithDelegate:groupItem:", self, v4);

  v9.receiver = self;
  v9.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v9, sel_initWithItemManager_tableViewStyle_, v5, 1);
  v7 = v6;
  if (v6)
    v6->_selectedLanguageIndex = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (HUAccessorySettingsSiriRecognitionLanguageViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v6;
  id v7;
  HUAccessorySettingsSiriRecognitionLanguageItemManager *v8;
  void *v9;
  HUAccessorySettingsSiriRecognitionLanguageItemManager *v10;
  HUAccessorySettingsSiriRecognitionLanguageViewController *v11;
  HUAccessorySettingsSiriRecognitionLanguageViewController *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  v8 = [HUAccessorySettingsSiriRecognitionLanguageItemManager alloc];
  objc_msgSend(v6, "sourceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HUAccessorySettingsSiriRecognitionLanguageItemManager initWithDelegate:accessorySettingItem:accessoryItem:](v8, "initWithDelegate:accessorySettingItem:accessoryItem:", self, v7, v9);
  v14.receiver = self;
  v14.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageViewController;
  v11 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v14, sel_initWithItemManager_tableViewStyle_, v10, 1);
  v12 = v11;
  if (v11)
    v11->_selectedLanguageIndex = 0x7FFFFFFFFFFFFFFFLL;

  return v12;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  objc_super v21;

  v6 = a6;
  v10 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageViewController;
  v11 = a5;
  v12 = a4;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v21, sel_updateCell_forItem_indexPath_animated_, v10, v12, v11, v6);
  objc_msgSend(v12, "latestResults", v21.receiver, v21.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  objc_msgSend(v12, "latestResults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "BOOLValue"))
    v18 = 3;
  else
    v18 = 0;
  objc_msgSend(v10, "setAccessoryType:", v18);

  v19 = objc_msgSend(v11, "row");
  if (v19 - 1 == -[HUAccessorySettingsSiriRecognitionLanguageViewController selectedLanguageIndex](self, "selectedLanguageIndex"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v20, "startAnimating");
    objc_msgSend(v10, "setAccessoryView:", v20);

  }
  else
  {
    objc_msgSend(v10, "setAccessoryView:", 0);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
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
  void *v15;
  unint64_t v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v17, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    objc_msgSend(v12, "languageOption");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recognitionLanguage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAccessorySettingsSiriRecognitionLanguageViewController setSelectedLanguageIndex:](self, "setSelectedLanguageIndex:", objc_msgSend(v7, "row") - 1);
    if (-[HUAccessorySettingsSiriRecognitionLanguageViewController _shouldPresentAlertRequestingToTurnOffVoiceRecognition:](self, "_shouldPresentAlertRequestingToTurnOffVoiceRecognition:", v14))
    {
      -[HUAccessorySettingsSiriRecognitionLanguageViewController _presentAlertConfirmingLanguageChangeAndTurnOffVoiceRecognition:indexPath:](self, "_presentAlertConfirmingLanguageChangeAndTurnOffVoiceRecognition:indexPath:", v10, v7);
    }
    else
    {
      -[HUAccessorySettingsSiriRecognitionLanguageViewController _allMediaAccessories](self, "_allMediaAccessories");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16 < 2)
        -[HUAccessorySettingsSiriRecognitionLanguageViewController _changeSiriLanguageOnlyForThisMediaAccessory:turnOffVoiceID:](self, "_changeSiriLanguageOnlyForThisMediaAccessory:turnOffVoiceID:", v10, 0);
      else
        -[HUAccessorySettingsSiriRecognitionLanguageViewController _presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories:indexPath:](self, "_presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories:indexPath:", v10, v7);
      -[HUAccessorySettingsSiriRecognitionLanguageViewController _attemptToFixVoiceRecognitionOnboardingFailures:](self, "_attemptToFixVoiceRecognitionOnboardingFailures:", v14);
    }
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

  }
  else
  {
    NSLog(CFSTR("Misconfigured HUAccessorySettingsSiriRecognitionLanguageViewController table: selectedSiriLanguageOptionItem == nil"));
  }

}

- (void)setSelectedLanguageIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  int64_t selectedLanguageIndex;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];

  if (self->_selectedLanguageIndex != a3)
  {
    v17 = (id)objc_opt_new();
    -[HUItemTableViewController itemManager](self, "itemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayedItemsInSection:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    selectedLanguageIndex = self->_selectedLanguageIndex;
    if (selectedLanguageIndex != 0x7FFFFFFFFFFFFFFFLL && selectedLanguageIndex + 1 < v7)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v10);

    }
    if (a3 != 0x7FFFFFFFFFFFFFFFLL && a3 + 1 < v7)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v11);

    }
    self->_selectedLanguageIndex = a3;
    if (objc_msgSend(v17, "count"))
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "diffableDataSourceDisabled");

      if (v13)
      {
        -[HUAccessorySettingsSiriRecognitionLanguageViewController tableView](self, "tableView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "reloadRowsAtIndexPaths:withRowAnimation:", v17, 5);

      }
      else
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __85__HUAccessorySettingsSiriRecognitionLanguageViewController_setSelectedLanguageIndex___block_invoke;
        v18[3] = &unk_1E6F52650;
        v18[4] = self;
        objc_msgSend(v17, "na_map:", v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUItemTableViewController itemManager](self, "itemManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "reloadUIRepresentationForItems:withAnimation:", v15, 0);

      }
    }

  }
}

id __85__HUAccessorySettingsSiriRecognitionLanguageViewController_setSelectedLanguageIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedItemAtIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_shouldPresentAlertRequestingToTurnOffVoiceRecognition:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D31988]);
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithHome:user:nameStyle:", v6, v9, 0);

  if (!objc_msgSend(v10, "isIdentifyVoiceEnabled"))
    goto LABEL_5;
  +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject containsObject:](v11, "containsObject:", v3) & 1) == 0)
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v3;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "Alerting the user that Voice Recognition will be disabled: the selected voice recognition language (%@), is not in the set of supported VR languages: %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "languageCode");
  v13 = objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "isEqualToString:", v13))
  {
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v3;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Alerting the user that Voice Recognition will be disabled: the selected voice recognition language (%@), though supported, is not the Siri language of this phone: %@", (uint8_t *)&v17, 0x16u);
    }

LABEL_11:
    v14 = 1;
    goto LABEL_12;
  }

LABEL_5:
  v14 = 0;
LABEL_12:

  return v14;
}

- (void)_presentAlertConfirmingLanguageChangeAndTurnOffVoiceRecognition:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;
  id v36;
  uint64_t v37;

  v6 = a3;
  v7 = a4;
  HULocalizedModelString(CFSTR("HUSiriLanguageChange_TurnOff_VoiceID_Confirmation_Title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v31 = v12;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessoryIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hf_accessoryWithIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "hf_categoryOrPrimaryServiceType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedCategoryOrPrimaryServiceTypeModelString(CFSTR("HUSiriLanguageChange_TurnOff_VoiceID_Confirmation_Title"), v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v18;
  }
  -[UITableViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", 0, v8, v7, v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessorySettingsSiriRecognitionLanguageViewController _allMediaAccessories](self, "_allMediaAccessories");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  v22 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSiriLanguageChange_TurnOff_VoiceID_Confirmation_Button_Title"), CFSTR("HUSiriLanguageChange_TurnOff_VoiceID_Confirmation_Button_Title"), 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __134__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeAndTurnOffVoiceRecognition_indexPath___block_invoke;
  v34[3] = &unk_1E6F52678;
  v34[4] = self;
  v35 = v6;
  v36 = v7;
  v37 = v21;
  v25 = v6;
  v26 = v7;
  objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 0, v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v27);

  v28 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSiriLanguageChange_TurnOff_VoiceID_Cancel_Button_Title"), CFSTR("HUSiriLanguageChange_TurnOff_VoiceID_Cancel_Button_Title"), 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v24;
  v33[1] = 3221225472;
  v33[2] = __134__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeAndTurnOffVoiceRecognition_indexPath___block_invoke_2;
  v33[3] = &unk_1E6F4C6E0;
  v33[4] = self;
  objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 1, v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v30);

  -[HUAccessorySettingsSiriRecognitionLanguageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);
}

uint64_t __134__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeAndTurnOffVoiceRecognition_indexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "users");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    return objc_msgSend(*(id *)(a1 + 32), "_presentAlertConfirmingLanguageChangeForAllHomeMembers:indexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 56) < 2uLL)
    return objc_msgSend(v7, "_changeSiriLanguageOnlyForThisMediaAccessory:turnOffVoiceID:", v8, 1);
  else
    return objc_msgSend(v7, "_presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories:indexPath:", v8, *(_QWORD *)(a1 + 48));
}

uint64_t __134__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeAndTurnOffVoiceRecognition_indexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearSpinner");
}

- (void)_presentAlertConfirmingLanguageChangeForAllHomeMembers:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  _HULocalizedStringWithDefaultValue(CFSTR("HUSiriLanguageChange_OtherUsers_Confirmation_Title"), CFSTR("HUSiriLanguageChange_OtherUsers_Confirmation_Title"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", 0, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HULanguageChangeLanguage_Button_Title"), CFSTR("HULanguageChangeLanguage_Button_Title"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __125__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForAllHomeMembers_indexPath___block_invoke;
  v20[3] = &unk_1E6F526A0;
  v20[4] = self;
  v21 = v6;
  v22 = v7;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v15);

  v16 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSiriLanguageChange_TurnOff_VoiceID_Cancel_Button_Title"), CFSTR("HUSiriLanguageChange_TurnOff_VoiceID_Cancel_Button_Title"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __125__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForAllHomeMembers_indexPath___block_invoke_2;
  v19[3] = &unk_1E6F4C6E0;
  v19[4] = self;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v18);

  -[HUAccessorySettingsSiriRecognitionLanguageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

uint64_t __125__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForAllHomeMembers_indexPath___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "_allMediaAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v3 < 2)
    return objc_msgSend(v4, "_changeSiriLanguageOnlyForThisMediaAccessory:turnOffVoiceID:", v5, 1);
  else
    return objc_msgSend(v4, "_presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories:indexPath:", v5, *(_QWORD *)(a1 + 48));
}

uint64_t __125__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForAllHomeMembers_indexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearSpinner");
}

- (void)_presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  id v53;
  _QWORD v54[5];
  id v55;

  v6 = a3;
  v7 = a4;
  _HULocalizedStringWithDefaultValue(CFSTR("HUSiriLanguageChange_AllHomePods_Confirmation_Title"), CFSTR("HUSiriLanguageChange_AllHomePods_Confirmation_Title"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_siriEndPointAccessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUSiriLanguageChange_AllHomePods_Confirmation_Title_Accessory"), CFSTR("HUSiriLanguageChange_AllHomePods_Confirmation_Title_Accessory"), 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
  }
  v49 = v8;
  v50 = v7;
  -[UITableViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", 0, v8, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSiriLanguageChange_AllHomePods_Confirmation_Button_Title"), CFSTR("HUSiriLanguageChange_AllHomePods_Confirmation_Button_Title"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __136__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories_indexPath___block_invoke;
  v54[3] = &unk_1E6F526C8;
  v54[4] = self;
  v17 = v6;
  v55 = v17;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v54);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v18);

  objc_opt_class();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "groupItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "home");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "accessoryIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hf_accessoryWithIdentifier:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "mediaProfile");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hf_displayName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "groupItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "homeKitSettingsVendor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
  }
  v48 = v22;

  objc_msgSend(v29, "homeKitObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    objc_opt_class();
    v37 = v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v38 = v37;
    else
      v38 = 0;
    v39 = v38;

    objc_msgSend(v39, "hf_displayName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  HULocalizedStringWithFormat(CFSTR("HUSiriLanguageChange_ThisHomePod_Confirmation_Button_Title"), CFSTR("%@"), v30, v31, v32, v33, v34, v35, (uint64_t)v28);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x1E0CEA2E0];
  v42 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __136__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories_indexPath___block_invoke_2;
  v52[3] = &unk_1E6F526C8;
  v52[4] = self;
  v53 = v17;
  v43 = v17;
  objc_msgSend(v41, "actionWithTitle:style:handler:", v40, 0, v52);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v44);

  v45 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSiriLanguageChange_TurnOff_VoiceID_Cancel_Button_Title"), CFSTR("HUSiriLanguageChange_TurnOff_VoiceID_Cancel_Button_Title"), 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v42;
  v51[1] = 3221225472;
  v51[2] = __136__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories_indexPath___block_invoke_3;
  v51[3] = &unk_1E6F4C6E0;
  v51[4] = self;
  objc_msgSend(v45, "actionWithTitle:style:handler:", v46, 1, v51);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v47);

  -[HUAccessorySettingsSiriRecognitionLanguageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

uint64_t __136__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories_indexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories:", *(_QWORD *)(a1 + 40));
}

uint64_t __136__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories_indexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_changeSiriLanguageOnlyForThisMediaAccessory:turnOffVoiceID:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __136__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories_indexPath___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearSpinner");
}

- (void)_attemptToFixVoiceRecognitionOnboardingFailures:(id)a3
{
  id v5;
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
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void *);
  void *v24;
  HUAccessorySettingsSiriRecognitionLanguageViewController *v25;
  id v26;
  uint8_t buf[4];
  HUAccessorySettingsSiriRecognitionLanguageViewController *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0D31988]);
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentUser");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v8, "initWithHome:user:nameStyle:", v10, v13, 0);

  if (objc_msgSend(v14, "hasDismissedIdentifyVoiceReminderBanner"))
  {
    +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "containsObject:", v5)
      && objc_msgSend(v5, "isEqualToString:", v7)
      && (objc_msgSend(v14, "isIdentifyVoiceEnabled") & 1) == 0)
    {
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __108__HUAccessorySettingsSiriRecognitionLanguageViewController__attemptToFixVoiceRecognitionOnboardingFailures___block_invoke;
      v24 = &unk_1E6F4EE80;
      v25 = self;
      v26 = v7;
      v16 = _Block_copy(&v21);
      -[HUAccessorySettingsSiriRecognitionLanguageViewController _allMediaAccessories](self, "_allMediaAccessories", v21, v22, v23, v24, v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "na_all:", v16))
      {
        HFLogForCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v28 = self;
          v29 = 2112;
          v30 = v19;
          _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@: User may be trying to fix Voice Recognition, enabling Reminder Banner", buf, 0x16u);

        }
        v20 = (id)objc_msgSend(v14, "setDismissIdentifyVoiceReminderBanner:", 0);
      }

    }
  }

}

uint64_t __108__HUAccessorySettingsSiriRecognitionLanguageViewController__attemptToFixVoiceRecognitionOnboardingFailures___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_siriLanguageOptionForMediaProfile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recognitionLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40));

  return v6;
}

- (void)_turnOffVoiceIDForTargetLanguageOption:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  int v29;
  HUAccessorySettingsSiriRecognitionLanguageViewController *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v8 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "languageOption");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recognitionLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqualToString:", v12);

  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((v13 & 1) != 0)
  {
    if (v15)
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "languageOption");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "recognitionLanguage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138413058;
      v30 = self;
      v31 = 2112;
      v32 = v16;
      v33 = 2112;
      v34 = v18;
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@: NOT Turning OFF Voice ID since Siri language changed to [%@] which is the same Siri language as this iOS Device [%@]", (uint8_t *)&v29, 0x2Au);

    }
  }
  else
  {
    if (v15)
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "languageOption");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "recognitionLanguage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138413058;
      v30 = self;
      v31 = 2112;
      v32 = v19;
      v33 = 2112;
      v34 = v21;
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@: Turning OFF Voice ID since Siri language changed to [%@] which is NOT the same Siri language as this iOS Device [%@]", (uint8_t *)&v29, 0x2Au);

    }
    v22 = objc_alloc(MEMORY[0x1E0D31988]);
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "home");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "home");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "currentUser");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v22, "initWithHome:user:nameStyle:", v24, v27, 0);

    v28 = (id)-[NSObject setEnableIdentifyVoice:](v14, "setEnableIdentifyVoice:", 0);
  }

}

- (void)_changeSiriLanguageOnlyForThisMediaAccessory:(id)a3 turnOffVoiceID:(BOOL)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  BOOL v16;

  v7 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateSelectionWithOptionItem:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v9, "addFailureBlock:", &__block_literal_global_77);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __120__HUAccessorySettingsSiriRecognitionLanguageViewController__changeSiriLanguageOnlyForThisMediaAccessory_turnOffVoiceID___block_invoke_2;
  v13[3] = &unk_1E6F52710;
  v16 = a4;
  v14 = v7;
  v15 = a2;
  v13[4] = self;
  v11 = v7;
  v12 = (id)objc_msgSend(v9, "addSuccessBlock:", v13);

}

void __120__HUAccessorySettingsSiriRecognitionLanguageViewController__changeSiriLanguageOnlyForThisMediaAccessory_turnOffVoiceID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  void *v4;
  id v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "na_isCancelledError");
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "logError:operationDescription:", v2, CFSTR("Updating siri recognition language"));
  else
    objc_msgSend(v4, "handleError:", v2);

}

uint64_t __120__HUAccessorySettingsSiriRecognitionLanguageViewController__changeSiriLanguageOnlyForThisMediaAccessory_turnOffVoiceID___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  int v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_clearSpinner");
  result = objc_msgSend(*(id *)(a1 + 32), "_isAnyMediaAccessoryOnSupportedVoiceRecognitionLanguage");
  v3 = result;
  if (*(_BYTE *)(a1 + 56) || (result & 1) == 0)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(unsigned __int8 *)(a1 + 56);
      v8 = 138413058;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      v12 = 1024;
      v13 = v7;
      v14 = 1024;
      v15 = v3;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: Turning OFF Voice ID because turnOffVoiceID = [%d] and anyMediaAccessoriesOnSupportedVoiceRecognitionLanguage = [%d]", (uint8_t *)&v8, 0x22u);

    }
    return objc_msgSend(*(id *)(a1 + 32), "_turnOffVoiceIDForTargetLanguageOption:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (BOOL)_isAnyMediaAccessoryOnSupportedVoiceRecognitionLanguage
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  HUAccessorySettingsSiriRecognitionLanguageViewController *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HUAccessorySettingsSiriRecognitionLanguageViewController _allMediaAccessories](self, "_allMediaAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __115__HUAccessorySettingsSiriRecognitionLanguageViewController__isAnyMediaAccessoryOnSupportedVoiceRecognitionLanguage__block_invoke;
    v16[3] = &unk_1E6F52738;
    v16[4] = self;
    v8 = v7;
    v17 = v8;
    v18 = v5;
    LODWORD(v9) = objc_msgSend(v4, "na_any:", v16);
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("No Media Accessories");
      *(_DWORD *)buf = 138413058;
      v20 = self;
      v21 = 2112;
      if ((_DWORD)v9)
        v13 = CFSTR("At least one Media Accessory");
      v22 = v11;
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@: %@ in this Home support the voice recognition language and matches the iPhone language [%@]", buf, 0x2Au);

    }
  }
  else
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = (uint64_t)v14;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@:  returning NO, because supported voice recognition languages could not be found ", buf, 0x16u);

    }
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

uint64_t __115__HUAccessorySettingsSiriRecognitionLanguageViewController__isAnyMediaAccessoryOnSupportedVoiceRecognitionLanguage__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_siriLanguageOptionForMediaProfile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v4, "recognitionLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", v6);

  if ((_DWORD)v5)
  {
    v7 = *(void **)(a1 + 48);
    objc_msgSend(v4, "recognitionLanguage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_clearSpinner
{
  -[HUAccessorySettingsSiriRecognitionLanguageViewController setSelectedLanguageIndex:](self, "setSelectedLanguageIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)_turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  char v35;
  NSObject *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  HUAccessorySettingsSiriRecognitionLanguageViewController *v44;
  const __CFString *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  HUAccessorySettingsSiriRecognitionLanguageViewController *val;
  id obj;
  id v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  id v68;
  id v69;
  void *v70;
  _QWORD v71[4];
  id v72;
  id v73[3];
  _QWORD v74[4];
  id v75;
  SEL v76;
  _QWORD v77[4];
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  HUAccessorySettingsSiriRecognitionLanguageViewController *v84;
  __int16 v85;
  const __CFString *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUAccessorySettingsSiriRecognitionLanguageViewController _turnOffVoiceIDForTargetLanguageOption:](self, "_turnOffVoiceIDForTargetLanguageOption:", v4);
  val = self;
  -[HUAccessorySettingsSiriRecognitionLanguageViewController _allMediaAccessories](self, "_allMediaAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  v66 = v6;

  v56 = v8;
  objc_msgSend(v8, "languageOption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recognitionLanguage");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[HUItemTableViewController itemManager](val, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaProfileContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v68 = v12;

  objc_opt_class();
  -[HUItemTableViewController itemManager](val, "itemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "groupItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  v57 = v16;
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "accessoryIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hf_accessoryWithIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "mediaProfile");
    v63 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    -[HUItemTableViewController itemManager](val, "itemManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "mediaProfileContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v63 = v22;

  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v5;
  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
  if (v67)
  {
    v64 = *MEMORY[0x1E0D30140];
    v65 = *(_QWORD *)v80;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v80 != v65)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v23);
        objc_msgSend(v24, "mediaProfile");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "home");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "hf_mediaSystemForAccessory:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
          objc_msgSend(v27, "hf_settingsAdapterManager");
        else
          objc_msgSend(v25, "hf_settingsAdapterManager");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "adapterForIdentifier:", v64);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v29 = v28;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v30 = v29;
        else
          v30 = 0;
        v69 = v30;

        objc_opt_class();
        v31 = v66;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v32 = v31;
        else
          v32 = 0;
        v33 = v32;

        if (v68)
        {
          objc_msgSend(v68, "accessories");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v77[0] = MEMORY[0x1E0C809B0];
          v77[1] = 3221225472;
          v77[2] = __119__HUAccessorySettingsSiriRecognitionLanguageViewController__turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories___block_invoke;
          v77[3] = &unk_1E6F4E5D8;
          v78 = v25;
          v35 = objc_msgSend(v34, "na_any:", v77);

          if ((v35 & 1) != 0)
            goto LABEL_44;
        }
        else if (v63 && (objc_msgSend(v63, "isEqual:", v25) & 1) != 0)
        {
          goto LABEL_44;
        }
        HFLogForCategory();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v84 = val;
          v85 = 2112;
          v86 = v37;
          v87 = 2112;
          v88 = v59;
          v89 = 2112;
          v90 = v25;
          _os_log_impl(&dword_1B8E1E000, v36, OS_LOG_TYPE_DEFAULT, "%@:%@: Changing Siri language to [%@] for [%@]", buf, 0x2Au);

        }
        objc_msgSend(v33, "languageOption");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38 && objc_msgSend(v25, "hf_isReachable"))
        {
          objc_msgSend(v24, "mediaProfile");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "hf_siriLanguageOptionsManager");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "uniqueIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "updateSelectedLanguageOption:accessoryIdentifier:", v38, v41);
          v42 = objc_claimAutoreleasedReturnValue();

          if (!v42)
          {
            objc_msgSend(v69, "updateSelectedLanguageOption:", v38);
            v42 = objc_claimAutoreleasedReturnValue();
          }
          v74[0] = MEMORY[0x1E0C809B0];
          v74[1] = 3221225472;
          v74[2] = __119__HUAccessorySettingsSiriRecognitionLanguageViewController__turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories___block_invoke_58;
          v74[3] = &unk_1E6F4E568;
          v76 = a2;
          v75 = v25;
          v43 = (id)-[NSObject addFailureBlock:](v42, "addFailureBlock:", v74);
          objc_msgSend(v58, "addObject:", v42);

        }
        else
        {
          HFLogForCategory();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v44 = (HUAccessorySettingsSiriRecognitionLanguageViewController *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "hf_isReachable"))
              v45 = &stru_1E6F60E80;
            else
              v45 = CFSTR("un");
            objc_msgSend(v25, "hf_displayName");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v84 = v44;
            v85 = 2112;
            v86 = v45;
            v87 = 2112;
            v88 = v46;
            _os_log_error_impl(&dword_1B8E1E000, v42, OS_LOG_TYPE_ERROR, "%@ Controller is %@reachable. Language change failed for [%@]", buf, 0x20u);

          }
        }

LABEL_44:
        ++v23;
      }
      while (v67 != v23);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
      v67 = v47;
    }
    while (v47);
  }

  -[HUItemTableViewController itemManager](val, "itemManager");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "updateSelectionWithOptionItem:", v66);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = (id)objc_msgSend(v49, "addFailureBlock:", &__block_literal_global_64_0);
  objc_msgSend(v58, "addObject:", v49);
  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v58);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessorySettingsSiriRecognitionLanguageViewController setChangeLanguageFuture:](val, "setChangeLanguageFuture:", v51);

  v52 = (void *)objc_msgSend(v58, "count");
  objc_initWeak((id *)buf, val);
  -[HUAccessorySettingsSiriRecognitionLanguageViewController changeLanguageFuture](val, "changeLanguageFuture");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __119__HUAccessorySettingsSiriRecognitionLanguageViewController__turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories___block_invoke_2;
  v71[3] = &unk_1E6F52780;
  objc_copyWeak(v73, (id *)buf);
  v73[1] = (id)a2;
  v54 = v59;
  v72 = v54;
  v73[2] = v52;
  v55 = (id)objc_msgSend(v53, "addCompletionBlock:", v71);

  objc_destroyWeak(v73);
  objc_destroyWeak((id *)buf);

}

uint64_t __119__HUAccessorySettingsSiriRecognitionLanguageViewController__turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __119__HUAccessorySettingsSiriRecognitionLanguageViewController__turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories___block_invoke_58(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_error_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_ERROR, "%@ Language change failed for %@", (uint8_t *)&v5, 0x16u);

  }
}

void __119__HUAccessorySettingsSiriRecognitionLanguageViewController__turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories___block_invoke_63(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  void *v4;
  id v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "na_isCancelledError");
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "logError:operationDescription:", v2, CFSTR("Updating siri recognition language"));
  else
    objc_msgSend(v4, "handleError:", v2);

}

void __119__HUAccessorySettingsSiriRecognitionLanguageViewController__turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_clearSpinner");
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 56);
    v7 = 138413058;
    v8 = WeakRetained;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@:%@: Finished changing Siri language to [%@] for %lu Media Accessories", (uint8_t *)&v7, 0x2Au);

  }
}

- (id)_allMediaAccessories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_homePods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObjectsFromArray:", v5);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_siriEndPointAccessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "na_safeAddObjectsFromArray:", v8);

  }
  v9 = (void *)objc_msgSend(v2, "copy");

  return v9;
}

- (id)_siriLanguageOptionForMediaProfile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasOptedToHH2"))
  {

LABEL_4:
    objc_msgSend(v3, "hf_siriLanguageOptionsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedLanguageOption");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v3, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_isSiriEndpoint");

  if (v7)
    goto LABEL_4;
  objc_msgSend(v3, "hf_settingsAdapterManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adapterForIdentifier:", *MEMORY[0x1E0D30140]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v13, "selectedLanguageOption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v9;
}

- (NAFuture)changeLanguageFuture
{
  return self->_changeLanguageFuture;
}

- (void)setChangeLanguageFuture:(id)a3
{
  objc_storeStrong((id *)&self->_changeLanguageFuture, a3);
}

- (int64_t)selectedLanguageIndex
{
  return self->_selectedLanguageIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeLanguageFuture, 0);
}

@end
