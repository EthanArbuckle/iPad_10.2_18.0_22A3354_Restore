@implementation HUStatusAndNotificationsViewController

- (HUStatusAndNotificationsViewController)initWithServiceItem:(id)a3 inHome:(id)a4 displayingDetails:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  HUStatusAndNotificationsItemManager *v10;
  HUStatusAndNotificationsViewController *v11;
  HUStatusAndNotificationsViewController *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  HUTriggerConditionEditorItemModuleController *v17;
  void *v18;
  uint64_t v19;
  HUTriggerConditionEditorItemModuleController *conditionModuleController;
  void *v21;
  HUCameraSmartNotificationSettingsModuleController *v22;
  void *v23;
  uint64_t v24;
  HUCameraSmartNotificationSettingsModuleController *cameraSmartSettingsModuleController;
  _BOOL4 v26;
  const __CFString *v27;
  __CFString *v28;
  void *v29;
  objc_super v31;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = -[HUStatusAndNotificationsItemManager initWithServiceItem:delegate:home:]([HUStatusAndNotificationsItemManager alloc], "initWithServiceItem:delegate:home:", v8, self, v9);
  v31.receiver = self;
  v31.super_class = (Class)HUStatusAndNotificationsViewController;
  v11 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v31, sel_initWithItemManager_tableViewStyle_, v10, 1);
  v12 = v11;
  if (v11)
  {
    -[HUStatusAndNotificationsViewController setItem:](v11, "setItem:", v8);
    if (v5)
    {
      -[HUStatusAndNotificationsViewController setUseServiceNameAsTitle:](v12, "setUseServiceNameAsTitle:", 0);
      -[HUItemTableViewController itemManager](v12, "itemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShowsForServiceDetails:", 1);

    }
    else
    {
      -[HUStatusAndNotificationsViewController setShowStatusSection:](v12, "setShowStatusSection:", 0);
      -[HUStatusAndNotificationsViewController setUseServiceNameAsTitle:](v12, "setUseServiceNameAsTitle:", 1);
    }
    if ((objc_msgSend(v9, "hf_currentUserIsAdministrator") & 1) == 0)
      -[HUStatusAndNotificationsViewController setShowStatusSection:](v12, "setShowStatusSection:", 0);
    v14 = objc_msgSend(MEMORY[0x1E0D31228], "cameraContainsMotionServiceItem:", v8);
    -[HUStatusAndNotificationsItemManager conditionModule](v10, "conditionModule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v16 = v14;
    else
      v16 = 1;

    if ((v16 & 1) == 0)
    {
      v17 = [HUTriggerConditionEditorItemModuleController alloc];
      -[HUStatusAndNotificationsItemManager conditionModule](v10, "conditionModule");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[HUTriggerConditionEditorItemModuleController initWithModule:delegate:](v17, "initWithModule:delegate:", v18, v12);
      conditionModuleController = v12->_conditionModuleController;
      v12->_conditionModuleController = (HUTriggerConditionEditorItemModuleController *)v19;

    }
    -[HUStatusAndNotificationsItemManager cameraSmartDetectionSettingsModule](v10, "cameraSmartDetectionSettingsModule");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = [HUCameraSmartNotificationSettingsModuleController alloc];
      -[HUStatusAndNotificationsItemManager cameraSmartDetectionSettingsModule](v10, "cameraSmartDetectionSettingsModule");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[HUCameraSmartNotificationSettingsModuleController initWithModule:](v22, "initWithModule:", v23);
      cameraSmartSettingsModuleController = v12->_cameraSmartSettingsModuleController;
      v12->_cameraSmartSettingsModuleController = (HUCameraSmartNotificationSettingsModuleController *)v24;

      -[HUCameraSmartNotificationSettingsModuleController setDelegate:](v12->_cameraSmartSettingsModuleController, "setDelegate:", v12);
      -[HUItemModuleController setHost:](v12->_cameraSmartSettingsModuleController, "setHost:", v12);
    }
    v26 = -[HUStatusAndNotificationsViewController showStatusSection](v12, "showStatusSection");
    v27 = CFSTR("HUNotificationsTitle");
    if (v26)
      v27 = CFSTR("HUStatusAndNotificationsTitle");
    if (v16)
      v28 = CFSTR("HUStatusTitle");
    else
      v28 = (__CFString *)v27;
    _HULocalizedStringWithDefaultValue(v28, v28, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUStatusAndNotificationsViewController setTitle:](v12, "setTitle:", v29);

  }
  return v12;
}

- (BOOL)showStatusSection
{
  void *v2;
  char v3;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showStatusSection");

  return v3;
}

- (void)setShowStatusSection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowStatusSection:", v3);

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chimeOnAccessoriesListItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isEqual:", v7);

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  objc_super v21;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUStatusAndNotificationsViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v21, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v10;
    objc_msgSend(v12, "setDelegate:", self);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "includeInStatusItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "isEqual:", v14);

    if (v15)
    {
      -[HUStatusAndNotificationsViewController item](self, "item");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "homeKitObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "conformsToProtocol:", &unk_1EF329C38))
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;

      v20 = objc_msgSend(v19, "hf_isForcedVisibleInHomeStatus");
      objc_msgSend(v12, "setDisabled:", v20);
    }

  }
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chimeOnAccessoriesListItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    v11 = objc_opt_class();
    v12 = v17;
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v12;
      if (v13)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v11, objc_opt_class());

    }
    v14 = 0;
LABEL_9:

    objc_msgSend(v14, "setHideIcon:", 1);
    objc_msgSend(v14, "setAccessoryType:", 1);

  }
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUStatusAndNotificationsViewController;
  v5 = -[HUItemTableViewController automaticDisablingReasonsForItem:](&v13, sel_automaticDisablingReasonsForItem_, v4);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allowNotificationsItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if ((id)v7 == v4)
  {

  }
  else
  {
    v8 = (void *)v7;
    -[HUItemTableViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "conditionModule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsItem:", v4);

    if (!v11)
      goto LABEL_6;
  }
  v5 = 1;
LABEL_6:

  return v5;
}

- (id)itemModuleControllers
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[HUStatusAndNotificationsViewController conditionModuleController](self, "conditionModuleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v4);

  -[HUStatusAndNotificationsViewController cameraSmartSettingsModuleController](self, "cameraSmartSettingsModuleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v5);

  return v3;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  objc_super v17;

  v6 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedSectionIdentifierForSectionIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("HUStatusAndNotificationsConditionSectionIdentifier"));

  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "numberOfSections") - 1 <= (unint64_t)a4)
  {

  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayedSectionIdentifierForSectionIndex:", a4 + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("HUCameraSmartDetectionSettingsOnOffSectionIdentifier"));

    v14 = 10.0;
    if ((v9 & v13 & 1) != 0)
      goto LABEL_6;
  }
  v17.receiver = self;
  v17.super_class = (Class)HUStatusAndNotificationsViewController;
  -[HUItemTableViewController tableView:heightForFooterInSection:](&v17, sel_tableView_heightForFooterInSection_, v6, a4);
  v14 = v15;
LABEL_6:

  return v14;
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  int64_t v9;
  void *v10;
  void *v11;
  char v12;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedSectionIdentifierForSectionIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("HUCameraSmartDetectionSettingsOnOffSectionIdentifier"));

  v8 = a3 < 1;
  v9 = a3 - 1;
  if (v8)
  {
    v12 = 0;
  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayedSectionIdentifierForSectionIndex:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("HUStatusAndNotificationsConditionSectionIdentifier"));

  }
  return v7 & v12;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  BOOL v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HUStatusAndNotificationsViewController;
    v10 = -[HUItemTableViewController tableView:shouldHighlightRowAtIndexPath:](&v12, sel_tableView_shouldHighlightRowAtIndexPath_, v6, v7);
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  HUDoorbellChimeDevicesViewController *v12;
  void *v13;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUStatusAndNotificationsViewController;
  v6 = a4;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v15, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  -[HUItemTableViewController itemManager](self, "itemManager", v15.receiver, v15.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "chimeOnAccessoriesListItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (v11)
  {
    v12 = objc_alloc_init(HUDoorbellChimeDevicesViewController);
    -[HUStatusAndNotificationsViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "hu_pushPreloadableViewController:animated:", v12, 1);

  }
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  uint64_t v59;
  _QWORD v60[5];
  BOOL v61;
  _QWORD aBlock[5];

  v4 = a4;
  v6 = a3;
  -[HUStatusAndNotificationsViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "includeInStatusItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqual:", v12);

  if (v13)
  {
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke;
    aBlock[3] = &unk_1E6F502A0;
    aBlock[4] = self;
    v15 = _Block_copy(aBlock);
    v60[0] = v14;
    v60[1] = 3221225472;
    v60[2] = __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_3;
    v60[3] = &unk_1E6F4DF80;
    v60[4] = self;
    v61 = v4;
    __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_3((uint64_t)v60);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "addSuccessBlock:", v15);
  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allowNotificationsItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v10, "isEqual:", v19);

    -[HUItemTableViewController itemManager](self, "itemManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;
    if (v20)
    {
      objc_msgSend(v21, "updateAllowNotifications:", v4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v22;
      v23 = &__block_literal_global_185;
    }
    else
    {
      objc_msgSend(v21, "allowAudioNotificationsItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v10, "isEqual:", v24);

      -[HUItemTableViewController itemManager](self, "itemManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v26;
      if (v25)
      {
        objc_msgSend(v26, "updateAllowAudioNotifications:", v4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v22;
        v23 = &__block_literal_global_87_0;
      }
      else
      {
        objc_msgSend(v26, "allowActivityNotificationsItem");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v10, "isEqual:", v27);

        if (v28)
        {
          -[HUStatusAndNotificationsViewController _toggleSmartActivityNotificationWithAlertNotificationForCell:didTurnOn:](self, "_toggleSmartActivityNotificationWithAlertNotificationForCell:didTurnOn:", v6, v4);
          goto LABEL_25;
        }
        -[HUItemTableViewController itemManager](self, "itemManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "allowDoorbellNotificationsItem");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v10, "isEqual:", v30);

        -[HUItemTableViewController itemManager](self, "itemManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v32;
        if (v31)
        {
          objc_msgSend(v32, "updateAllowDoorbellNotifications:", v4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v22;
          v23 = &__block_literal_global_88_0;
        }
        else
        {
          objc_msgSend(v32, "allowAnalogChimeNotificationItem");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v10, "isEqual:", v33);

          -[HUItemTableViewController itemManager](self, "itemManager");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v35;
          if (v34)
          {
            objc_msgSend(v35, "updateAllowChimeAnalogNotifications:", v4);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v22;
            v23 = &__block_literal_global_89;
          }
          else
          {
            objc_msgSend(v35, "allowMotionNotificationsItem");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v10, "isEqual:", v36);

            -[HUItemTableViewController itemManager](self, "itemManager");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v38;
            if (v37)
            {
              objc_msgSend(v38, "updateAllowMotionNotifications:", v4);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v22;
              v23 = &__block_literal_global_90_1;
            }
            else
            {
              objc_msgSend(v38, "chimeOnHomePodSingleItem");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v10, "isEqual:", v39);

              -[HUItemTableViewController itemManager](self, "itemManager");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = v41;
              if (v40)
              {
                objc_msgSend(v41, "updateChimeOnHomePod:", v4);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = v22;
                v23 = &__block_literal_global_91_2;
              }
              else
              {
                objc_msgSend(v41, "allowCameraSnapshotsItem");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v10, "isEqual:", v42);

                -[HUItemTableViewController itemManager](self, "itemManager");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = v44;
                if (v43)
                {
                  objc_msgSend(v44, "updateAllowSnapshotsInNotifications:", v4);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = v22;
                  v23 = &__block_literal_global_92;
                }
                else
                {
                  objc_msgSend(v44, "allowCameraStatusChangesItem");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = objc_msgSend(v10, "isEqual:", v45);

                  -[HUItemTableViewController itemManager](self, "itemManager");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v15 = v47;
                  if (v46)
                  {
                    objc_msgSend(v47, "updateAllowCameraStatusChangeNotifications:", v4);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v16 = v22;
                    v23 = &__block_literal_global_93_4;
                  }
                  else
                  {
                    objc_msgSend(v47, "allowCameraReachabilityChangeNotificationsItem");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    v49 = objc_msgSend(v10, "isEqual:", v48);

                    if (!v49)
                      goto LABEL_25;
                    -[HUItemTableViewController itemManager](self, "itemManager");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "updateAllowCameraReachabilityStatusChangeNotifications:", v4);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v16 = v22;
                    v23 = &__block_literal_global_94_0;
                  }
                }
              }
            }
          }
        }
      }
    }
    v50 = (id)objc_msgSend(v22, "addFailureBlock:", v23);
  }

LABEL_25:
  objc_msgSend(v10, "latestResults");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = *MEMORY[0x1E0D30D20];
  objc_msgSend(v51, "objectForKey:", *MEMORY[0x1E0D30D20]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    objc_msgSend(v10, "latestResults");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectForKeyedSubscript:", v52);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v55 = 0;
  }
  v56 = v10;
  if (objc_msgSend(v56, "conformsToProtocol:", &unk_1EF299828))
    v57 = v56;
  else
    v57 = 0;
  v58 = v57;

  if (!objc_msgSend(v55, "length") && v58)
  {
    objc_msgSend(v58, "itemTitleLocalizationKey");
    v59 = objc_claimAutoreleasedReturnValue();

    v55 = (void *)v59;
  }
  objc_msgSend(MEMORY[0x1E0D31170], "sendSwitchCellToggleEventForItem:isOn:title:fromSourceViewController:", v56, v4, v55, self);

}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "item");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = v6;
        v10[1] = 3221225472;
        v10[2] = __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_2;
        v10[3] = &unk_1E6F56FC0;
        v10[4] = v8;
        objc_msgSend(v9, "dispatchAccessoryObserverMessage:sender:", v10, 0);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessory:didUpdateApplicationDataForService:", v3, *(_QWORD *)(a1 + 32));

  }
}

id __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF329C38))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "hf_updateIsVisibleInHomeStatus:", *(unsigned __int8 *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Attempting to toggle status on item %@ that does not support status!"), v7);

    v8 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithError:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

void __63__HUStatusAndNotificationsViewController_switchCell_didTurnOn___block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4
{
  id v4;

  v4 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", a4, 1);
}

- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4
{
  -[HUStatusAndNotificationsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)conditionEditorModuleController:(id)a3 didUpdateConditionCollection:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "conditions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_108_2);

  if ((v7 & 1) != 0)
  {
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v5, "conditions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[HUItemTableViewController itemManager](self, "itemManager");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "predicate");
            v15 = v5;
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "updateCameraSmartNotificationCondition:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (id)objc_msgSend(v17, "addFailureBlock:", &__block_literal_global_112_0);

            v5 = v15;
          }
          else
          {
            objc_msgSend(v28, "addObject:", v13);
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v10);
    }

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31308]), "initWithConditions:", v28);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "predicate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateNotificationCondition:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v22, "addFailureBlock:", &__block_literal_global_114_0);

  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "updateNotificationCondition:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)objc_msgSend(v26, "addFailureBlock:", &__block_literal_global_110);

  }
}

uint64_t __103__HUStatusAndNotificationsViewController_conditionEditorModuleController_didUpdateConditionCollection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __103__HUStatusAndNotificationsViewController_conditionEditorModuleController_didUpdateConditionCollection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:operationType:options:retryBlock:cancelBlock:", v3, *MEMORY[0x1E0D309B8], 0, 0, 0);

}

void __103__HUStatusAndNotificationsViewController_conditionEditorModuleController_didUpdateConditionCollection___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:operationType:options:retryBlock:cancelBlock:", v3, *MEMORY[0x1E0D309B8], 0, 0, 0);

}

void __103__HUStatusAndNotificationsViewController_conditionEditorModuleController_didUpdateConditionCollection___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:operationType:options:retryBlock:cancelBlock:", v3, *MEMORY[0x1E0D309B8], 0, 0, 0);

}

- (void)smartNotificationSettingsModuleController:(id)a3 didUpdateConditionCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "updateCameraSmartNotificationCondition:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "addFailureBlock:", &__block_literal_global_115_2);

}

void __113__HUStatusAndNotificationsViewController_smartNotificationSettingsModuleController_didUpdateConditionCollection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:operationType:options:retryBlock:cancelBlock:", v3, *MEMORY[0x1E0D309B8], 0, 0, 0);

}

- (void)_toggleSmartActivityNotificationWithAlertNotificationForCell:(id)a3 didTurnOn:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  int v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD aBlock[4];
  id v35;
  BOOL v36;
  id location;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HUStatusAndNotificationsViewController item](self, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "services");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__HUStatusAndNotificationsViewController__toggleSmartActivityNotificationWithAlertNotificationForCell_didTurnOn___block_invoke;
  aBlock[3] = &unk_1E6F52628;
  objc_copyWeak(&v35, &location);
  v36 = a4;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "restrictedGuests");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __113__HUStatusAndNotificationsViewController__toggleSmartActivityNotificationWithAlertNotificationForCell_didTurnOn___block_invoke_120;
    v31[3] = &unk_1E6F59F50;
    v15 = v13;
    v32 = v15;
    v16 = v28;
    v33 = v16;
    objc_msgSend(v14, "na_firstObjectPassingTest:", v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    if (!a4 && v27)
      v17 = objc_msgSend(v15, "hf_currentUserIsAdministrator");
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v6;
      NSStringFromBooleanValue();
      v26 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromBooleanValue();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromBooleanValue();
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "hf_prettyDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hf_currentUserIsAdministrator");
      NSStringFromBooleanValue();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316930;
      v39 = "-[HUStatusAndNotificationsViewController _toggleSmartActivityNotificationWithAlertNotificationForCell:didTurnOn:]";
      v40 = 2112;
      v41 = v26;
      v42 = 2112;
      v43 = v19;
      v44 = 2112;
      v45 = v20;
      v46 = 2112;
      v47 = v21;
      v48 = 2112;
      v49 = v22;
      v50 = 2112;
      v51 = v16;
      v52 = 2112;
      v53 = v15;
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "(%s) shouldShowNotificationAlert = %@ because isOn = %@, isAccessoryAllowedForRG is '%@' for rg %@, isAdmin = %@, accessory = %@, home = %@", buf, 0x52u);

      v6 = v25;
    }

    if (v17)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __113__HUStatusAndNotificationsViewController__toggleSmartActivityNotificationWithAlertNotificationForCell_didTurnOn___block_invoke_122;
      v29[3] = &unk_1E6F4D988;
      v30 = v6;
      -[UIViewController hu_presentNotificationAlertForNotificationCapableObjects:notificationsEnabled:mainActionBlock:notNowActionBlock:](self, "hu_presentNotificationAlertForNotificationCapableObjects:notificationsEnabled:mainActionBlock:notNowActionBlock:", MEMORY[0x1E0C9AA60], 0, v11, v29);

    }
    else
    {
      v11[2](v11);
    }

  }
  else
  {
    HFLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBooleanValue();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v39 = "-[HUStatusAndNotificationsViewController _toggleSmartActivityNotificationWithAlertNotificationForCell:didTurnOn:]";
      v40 = 2112;
      v41 = v24;
      v42 = 2112;
      v43 = v28;
      _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "(%s) Updating activity notification to %@ for %@.", buf, 0x20u);

    }
    v11[2](v11);
  }

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

void __113__HUStatusAndNotificationsViewController__toggleSmartActivityNotificationWithAlertNotificationForCell_didTurnOn___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAllowSmartActivityNotifications:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "addFailureBlock:", &__block_literal_global_116_0);

}

void __113__HUStatusAndNotificationsViewController__toggleSmartActivityNotificationWithAlertNotificationForCell_didTurnOn___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

uint64_t __113__HUStatusAndNotificationsViewController__toggleSmartActivityNotificationWithAlertNotificationForCell_didTurnOn___block_invoke_120(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "homeAccessControlForUser:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restrictedGuestAccessSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessAllowedToAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 40));

  return v6;
}

uint64_t __113__HUStatusAndNotificationsViewController__toggleSmartActivityNotificationWithAlertNotificationForCell_didTurnOn___block_invoke_122(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOn:animated:", 1, 1);
}

- (HFServiceLikeItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (HUTriggerConditionEditorItemModuleController)conditionModuleController
{
  return self->_conditionModuleController;
}

- (HUCameraSmartNotificationSettingsModuleController)cameraSmartSettingsModuleController
{
  return self->_cameraSmartSettingsModuleController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraSmartSettingsModuleController, 0);
  objc_storeStrong((id *)&self->_conditionModuleController, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
