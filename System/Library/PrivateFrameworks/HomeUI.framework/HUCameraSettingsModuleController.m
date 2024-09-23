@implementation HUCameraSettingsModuleController

- (HUCameraSettingsModuleController)initWithModule:(id)a3
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
  HUCameraSettingsModuleController *v15;
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
  v20.super_class = (Class)HUCameraSettingsModuleController;
  v15 = -[HUItemModuleController initWithModule:](&v20, sel_initWithModule_, v13);

  return v15;
}

- (void)setHost:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)HUCameraSettingsModuleController;
  -[HUItemModuleController setHost:](&v22, sel_setHost_, a3);
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = v6;
  objc_msgSend(v6, "presenceModules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HUItemModuleController host](self, "host");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_opt_respondsToSelector();

          if ((v14 & 1) != 0)
          {
            -[HUItemModuleController host](self, "host");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "presentingViewControllerForModuleController:", self);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setPresentingViewController:", v16);

          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v9);
  }

}

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isItemHeader:", v4);

  if ((v6 & 1) == 0)
  {
    -[HUItemModuleController module](self, "module");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isOptionItem:", v4);

    if ((v8 & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v4, "latestResults");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C88]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "BOOLValue");

      }
    }
  }
  objc_opt_class();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v11;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  char isKindOfClass;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  HUDynamicAlignmentTitleValueCellLayoutOptions *v21;
  void *v22;
  void *v23;
  HUDynamicAlignmentTitleValueCellLayoutOptions *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)HUCameraSettingsModuleController;
  -[HUItemModuleController setupCell:forItem:](&v29, sel_setupCell_forItem_, v6, v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "setValueColorFollowsTintColor:", 1);
    if (-[HUCameraSettingsModuleController useProxSetupPresentationStyle](self, "useProxSetupPresentationStyle"))
      objc_msgSend(v6, "setUseVerticalLayoutOnly:", 1);
  }
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isItemHeader:", v7);

  if (v9)
  {
    objc_opt_class();
    v10 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      objc_msgSend(v12, "messageTextView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDelegate:", self);

    }
  }
  -[HUItemModuleController module](self, "module");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isItemHeader:", v7) & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_18;
    objc_opt_class();
    v16 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v14 = v17;

    objc_msgSend(v14, "setHideIcon:", 1);
  }

LABEL_18:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    -[HUItemModuleController module](self, "module");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    v21 = [HUDynamicAlignmentTitleValueCellLayoutOptions alloc];
    objc_msgSend(v20, "longestCameraUsageOptionItemTitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "longestCameraPresenceItemTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HUDynamicAlignmentTitleValueCellLayoutOptions initWithCellSizeSubclass:longestPossibleValueText:longestPossibleTitleText:](v21, "initWithCellSizeSubclass:longestPossibleValueText:longestPossibleTitleText:", 1, v22, v23);

    objc_msgSend(v6, "setLayoutOptions:", v24);
  }
  if (-[HUCameraSettingsModuleController useProxSetupPresentationStyle](self, "useProxSetupPresentationStyle"))
  {
    -[HUItemModuleController module](self, "module");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isItemHeader:", v7);

    if ((v26 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setBackgroundColor:", v27);

    }
  }

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  objc_super v54;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v54.receiver = self;
  v54.super_class = (Class)HUCameraSettingsModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v54, sel_updateCell_forItem_animated_, v8, v9, v5);
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = objc_msgSend(v12, "isOptionItem:", v9);
  v14 = (_QWORD *)MEMORY[0x1E0D30D18];
  if (!v13)
    goto LABEL_19;
  v15 = objc_opt_class();
  v16 = v8;
  if (v16)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v16;
    if (v17)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v15, objc_opt_class());

  }
  v18 = 0;
LABEL_12:

  objc_msgSend(v9, "latestResults");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", *v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitleText:", v22);

  objc_msgSend(v9, "latestResults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDescriptionText:", v24);

  objc_opt_class();
  v25 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v25;
  else
    v26 = 0;
  v27 = v26;

  if (objc_msgSend(v27, "updateInProgress"))
  {
    objc_msgSend(v18, "setAnimating:", 1);
  }
  else
  {
    objc_msgSend(v25, "latestResults");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    objc_msgSend(v18, "setAnimating:", 0);
    objc_msgSend(v18, "setChecked:", v30);
  }

LABEL_19:
  objc_opt_class();
  v31 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v32 = v31;
  else
    v32 = 0;
  v33 = v32;

  if (v33)
  {
    v34 = objc_opt_class();
    v35 = v8;
    if (v35)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v36 = v35;
      else
        v36 = 0;
      v37 = v35;
      if (v36)
        goto LABEL_30;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v34, objc_opt_class());

    }
    v37 = 0;
LABEL_30:

    objc_msgSend(v33, "home");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "user");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "hf_handleForUser:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setUserHandle:", v42);

    objc_msgSend(MEMORY[0x1E0CEA718], "valueCellConfiguration");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "latestResults");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", *v14);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setText:", v45);

    objc_msgSend(v31, "latestResults");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED0]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setSecondaryText:", v47);

    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "secondaryTextProperties");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setColor:", v48);

    objc_msgSend(v37, "setContentConfiguration:", v43);
  }
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v51 = v50;
  else
    v51 = 0;
  v52 = v51;

  objc_msgSend(v52, "recordingOptionsItem");
  v53 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAccessoryType:", v53 == v31);
}

- (void)viewSizeDidChanged
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  -[HUItemModuleController host](self, "host");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraPresenceItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "updateCellForItems:", v6);
}

- (BOOL)canSelectItem:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isItemHeader:", v4);

  return v6 ^ 1;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  HUCameraSmartOptionsTableViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  _QWORD v28[5];
  _QWORD aBlock[4];
  id v30;

  v4 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (objc_msgSend(v7, "isShowOptionsItem:", v4))
    objc_msgSend(v7, "setModuleExpanded:forItem:", objc_msgSend(v7, "shouldExpandModuleForShowOptionsItem:", v4) ^ 1, v4);
  objc_opt_class();
  v8 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    objc_msgSend(v10, "cameraProfiles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__HUCameraSettingsModuleController_didSelectItem___block_invoke;
    aBlock[3] = &unk_1E6F4FDA0;
    v30 = v12;
    v14 = v12;
    v15 = _Block_copy(aBlock);
    v28[0] = v13;
    v28[1] = 3221225472;
    v28[2] = __50__HUCameraSettingsModuleController_didSelectItem___block_invoke_2;
    v28[3] = &unk_1E6F57F50;
    v28[4] = self;
    v16 = _Block_copy(v28);
    v17 = -[HUSimpleItemModuleTableViewController initWithTableViewStyle:moduleCreator:moduleControllerBuilder:]([HUCameraSmartOptionsTableViewController alloc], "initWithTableViewStyle:moduleCreator:moduleControllerBuilder:", 1, v15, v16);
    objc_msgSend(v8, "latestResults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraSmartOptionsTableViewController setTitle:](v17, "setTitle:", v19);

    +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPreferredPresentationType:", 1);
    -[HUItemModuleController host](self, "host");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v21, "moduleController:presentViewControllerForRequest:", self, v20);

  }
  -[HUItemModuleController module](self, "module");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    -[HUItemModuleController module](self, "module");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v25, "didSelectItem:", v8);

  }
  return 0;
}

id __50__HUCameraSettingsModuleController_didSelectItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HUCameraRecordingOptionsModule *v5;
  void *v6;
  HUCameraRecordingOptionsModule *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HUCameraRecordingOptionsModule alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUCameraRecordingOptionsModule initWithItemUpdater:cameraProfiles:](v5, "initWithItemUpdater:cameraProfiles:", v4, v6);

  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

HUCameraRecordingOptionsModuleController *__50__HUCameraSettingsModuleController_didSelectItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  HUCameraRecordingOptionsModuleController *v4;
  void *v5;

  v3 = a2;
  v4 = -[HUCameraRecordingOptionsModuleController initWithModule:]([HUCameraRecordingOptionsModuleController alloc], "initWithModule:", v3);

  objc_msgSend(*(id *)(a1 + 32), "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController setHost:](v4, "setHost:", v5);

  return v4;
}

- (BOOL)canSelectDisabledItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6 == 0;
}

- (BOOL)useProxSetupPresentationStyle
{
  return self->_useProxSetupPresentationStyle;
}

- (void)setUseProxSetupPresentationStyle:(BOOL)a3
{
  self->_useProxSetupPresentationStyle = a3;
}

@end
