@implementation HUMediaSelectionViewController

- (HUMediaSelectionViewController)initWithActionSetBuilder:(id)a3
{
  id v4;
  HUMediaSelectionItemManager *v5;
  HUMediaSelectionViewController *v6;
  HUMediaSelectionViewController *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v5 = -[HUMediaSelectionItemManager initWithDelegate:mediaPlaybackActionBuilder:]([HUMediaSelectionItemManager alloc], "initWithDelegate:mediaPlaybackActionBuilder:", self, v4);

  v10.receiver = self;
  v10.super_class = (Class)HUMediaSelectionViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v10, sel_initWithItemManager_tableViewStyle_, v5, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaSelectionItemManager, v5);
    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSelectionTitle"), CFSTR("HUMediaSelectionTitle"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaSelectionViewController setTitle:](v7, "setTitle:", v8);

  }
  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUMediaSelectionViewController;
  -[HUItemTableViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HUMediaSelectionViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v5 = a3;
  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaPickerItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v6)
  {
    if (!v8
      || (-[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "playbackOptionsItems"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "containsObject:", v8),
          v12,
          v11,
          (v13 & 1) == 0))
    {
      -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "chosenMediaItem");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15 != v6)
      {
        -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "volumeSliderItem");

      }
    }
  }
  objc_opt_class();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v17;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v7 = a4;
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playbackStateItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if (v10)
    goto LABEL_10;
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "useCustomVolumeItem");
  v12 = objc_claimAutoreleasedReturnValue();
  if ((id)v12 == v7)
  {

    goto LABEL_10;
  }
  v13 = (void *)v12;
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "useCurrentVolumeItem");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v7)
  {
LABEL_10:
    objc_opt_class();
    v27 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;
    v25 = v28;

    objc_msgSend(v25, "setHideIcon:", 1);
LABEL_14:

    goto LABEL_15;
  }
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "selectedPlaybackStateItem");
  v17 = objc_claimAutoreleasedReturnValue();
  if ((id)v17 == v7)
  {

  }
  else
  {
    v18 = (void *)v17;
    -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "selectedVolumeItem");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v20 != v7)
    {
      -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "volumeSliderItem");
      v22 = (id)objc_claimAutoreleasedReturnValue();

      if (v22 == v7)
      {
        v25 = v32;
        objc_msgSend(v25, "setDelegate:", self);
        objc_msgSend(v25, "setMinimumValue:", 0.0);
        objc_msgSend(v25, "setMaximumValue:", 100.0);
        objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("speaker.fill"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setMinimumValueImage:", v29);

        objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("speaker.wave.3.fill"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setMaximumValueImage:", v30);

        objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTintColor:", v31);

        objc_msgSend(v25, "setShowValue:", 0);
      }
      else
      {
        -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "chosenMediaItem");
        v24 = (id)objc_claimAutoreleasedReturnValue();

        if (v24 != v7)
          goto LABEL_15;
        v25 = v32;
        objc_msgSend(v25, "setIconDisplayStyle:", 1);
        objc_msgSend(v25, "contentMetrics");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setIconSize:", 64.0, 64.0);

        objc_msgSend(v25, "setHideDescriptionIcon:", 1);
        objc_msgSend(v25, "setSeparatorInsetLinesUpWithText:", 0);
      }
      goto LABEL_14;
    }
  }
  objc_msgSend(v32, "setAccessoryType:", 3);
LABEL_15:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v32, "setDelegate:", self);

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  float v31;
  objc_super v32;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v32.receiver = self;
  v32.super_class = (Class)HUMediaSelectionViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v32, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "chosenMediaItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v11)
  {
    objc_msgSend(v10, "updateUIWithAnimation:", v6);
    goto LABEL_16;
  }
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "playbackStateItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v11);

  if (v16)
  {
    v17 = v10;
    -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectedPlaybackStateItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v27 = v19;

    if (v27 == v11)
      v28 = 3;
    else
      v28 = 0;
    objc_msgSend(v17, "setAccessoryType:", v28);
    goto LABEL_15;
  }
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "useCustomVolumeItem");
  v21 = objc_claimAutoreleasedReturnValue();
  if ((id)v21 == v11)
  {

    goto LABEL_10;
  }
  v22 = (void *)v21;
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "useCurrentVolumeItem");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if (v24 == v11)
  {
LABEL_10:
    v17 = v10;
    -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectedVolumeItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "volumeSliderItem");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (v26 == v11)
  {
    v29 = v10;
    objc_msgSend(v11, "latestResults");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("HOMediaVolumeResultKey"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    objc_msgSend(v29, "setValue:", v31);

LABEL_15:
    goto LABEL_16;
  }
  objc_msgSend(v10, "setAccessoryType:", 0);
LABEL_16:

}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString **v18;
  char v19;
  objc_super v21;

  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "supportsMediaPicker") & 1) != 0)
    goto LABEL_7;
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playbackStatePlayItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  -[HUMediaSelectionViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mediaSelectionViewControllerMessageForMediaActionPlayUnavailable:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v13, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayedSectionIdentifierForSectionIndex:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v11)
    v18 = HOMediaSelectionActionSectionIdentifier;
  else
    v18 = HOMediaSelectionPickerSectionIdentifier;
  v19 = objc_msgSend(v16, "isEqualToString:", *v18);

  if ((v19 & 1) == 0)
  {

LABEL_7:
    v21.receiver = self;
    v21.super_class = (Class)HUMediaSelectionViewController;
    -[HUItemTableViewController tableView:titleForFooterInSection:](&v21, sel_tableView_titleForFooterInSection_, v6, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[HUMediaSelectionViewController _allowRowInteractionForIndexPath:](self, "_allowRowInteractionForIndexPath:", a4);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  if (-[HUMediaSelectionViewController _allowRowInteractionForIndexPath:](self, "_allowRowInteractionForIndexPath:", v5))
  {
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
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
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  HUMediaSourceListViewController *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_super v56;

  v6 = a3;
  v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)HUMediaSelectionViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v56, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
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

  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mediaPickerItem");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v15)
  {
    if (_os_feature_enabled_impl())
    {
      v27 = [HUMediaSourceListViewController alloc];
      -[HUMediaSelectionItemManager actionSetBuilder](self->_mediaSelectionItemManager, "actionSetBuilder");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "mediaAction");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "mediaProfiles");
      v30 = v13;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[HUMediaSourceListViewController initForMediaProfileContainers:forTarget:](v27, "initForMediaProfileContainers:forTarget:", v31, 0);

      v13 = v30;
      objc_msgSend(v32, "setDelegate:", self);
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v32);
      -[HUMediaSelectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v33, 1, 0);
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

      goto LABEL_25;
    }
    v55 = v13;
    objc_msgSend(v10, "latestResults");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("HOMediaPickerUnavailableReasonKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "latestResults");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v36;
    if (v35)
    {
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("HOMediaPickerUnavailableReasonKey"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "integerValue");
      objc_msgSend(v10, "latestResults");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("HUMediaPickerUnavailableReasonStoreKitErrorObjectKey"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUMediaSelectionViewController _presentMediaPickerUnavailablePromptWithReason:storeKitErrorObject:](self, "_presentMediaPickerUnavailablePromptWithReason:storeKitErrorObject:", v38, v40);

    }
    else
    {
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("HOMediaSelectionShowLibraryContentKey"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "BOOLValue");
      objc_msgSend(v10, "latestResults");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("HOMediaSelectionPickingForExternalPlayerKey"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUMediaSelectionViewController _presentMediaPickerWithOptionsShowsLibraryContent:pickingForExternalPlayer:](self, "_presentMediaPickerWithOptionsShowsLibraryContent:pickingForExternalPlayer:", v43, objc_msgSend(v45, "BOOLValue"));

    }
    v13 = v55;
    goto LABEL_21;
  }
  if (v12)
  {
    -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "playbackStateItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsObject:", v12);

    if (v18)
    {
      -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "selectedPlaybackStateItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setAccessoryType:", 3);
      -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSelectedPlaybackStateItem:", v12);
      goto LABEL_17;
    }
  }
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "useCustomVolumeItem");
  v23 = objc_claimAutoreleasedReturnValue();
  if ((id)v23 == v10)
  {

LABEL_16:
    -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "selectedVolumeItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setAccessoryType:", 3);
    -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSelectedVolumeItem:", v12);
LABEL_17:

    -[HUMediaSelectionViewController updateCell:forItem:indexPath:animated:](self, "updateCell:forItem:indexPath:animated:", v13, v10, v7, 1);
    if (v20)
      -[HUMediaSelectionViewController applyAccessory:toItem:onTableView:](self, "applyAccessory:toItem:onTableView:", 0, v20, v6);
LABEL_21:

    goto LABEL_22;
  }
  v24 = (void *)v23;
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "useCurrentVolumeItem");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (v26 == v10)
    goto LABEL_16;
LABEL_22:
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "playbackStateAdjustVolumeOnlyItem");
  v47 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v47)
  {
    -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "useCustomVolumeItem");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setSelectedVolumeItem:", v49);

    -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "useCurrentVolumeItem");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaSelectionViewController applyAccessory:toItem:onTableView:](self, "applyAccessory:toItem:onTableView:", 0, v52, v6);

    -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "useCustomVolumeItem");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaSelectionViewController applyAccessory:toItem:onTableView:](self, "applyAccessory:toItem:onTableView:", 3, v54, v6);

  }
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
LABEL_25:

}

- (void)applyAccessory:(int64_t)a3 toItem:(id)a4 onTableView:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForItem:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cellForRowAtIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAccessoryType:", a3);
  if (v11)
    -[HUMediaSelectionViewController updateCell:forItem:indexPath:animated:](self, "updateCell:forItem:indexPath:animated:", v11, v12, v10, 1);

}

- (BOOL)_allowRowInteractionForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;

  v4 = a3;
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionSetBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_currentUserIsAdministrator");

  if (v8)
  {
    -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v4, "section"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[HUItemTableViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayedItemAtIndexPath:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == CFSTR("HOMediaSelectionActionSectionIdentifier")
      || v10 == CFSTR("HOMediaSelectionVolumeSelectionSectionIdentifier")
      || (-[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "mediaPickerItem"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v12 == v14))
    {
      objc_msgSend(v12, "latestResults");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v17, "BOOLValue") ^ 1;

    }
    else
    {
      LOBYTE(v15) = 0;
    }

  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (void)_presentMediaPickerWithOptionsShowsLibraryContent:(BOOL)a3 pickingForExternalPlayer:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  objc_class *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a4;
  v5 = a3;
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickedPlaybackArchive");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionViewController setLastTargetOptions:](self, "setLastTargetOptions:", objc_msgSend(v8, "targetOptions"));

  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v9 = (void *)_MergedGlobals_5;
  v30 = _MergedGlobals_5;
  if (!_MergedGlobals_5)
  {
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __getMPMediaPickerControllerClass_block_invoke;
    v25 = &unk_1E6F4C868;
    v26 = &v27;
    __getMPMediaPickerControllerClass_block_invoke((uint64_t)&v22);
    v9 = (void *)v28[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v27, 8);
  v11 = (void *)objc_msgSend([v10 alloc], "initWithSupportedTypeIdentifiers:selectionMode:", &unk_1E7042948, 4);
  objc_msgSend(v11, "setShowsCloudItems:", 1);
  objc_msgSend(v11, "setShowsItemsWithProtectedAssets:", 1);
  objc_msgSend(v11, "setShowsCatalogContent:", 1);
  objc_msgSend(v11, "setShowsLibraryContent:", v5);
  objc_msgSend(v11, "setPickingForExternalPlayer:", v4);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  v14 = v13;

  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v15 = (void *)qword_1ED580578;
  v30 = qword_1ED580578;
  if (!qword_1ED580578)
  {
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __getMPPlaybackArchiveConfigurationClass_block_invoke;
    v25 = &unk_1E6F4C868;
    v26 = &v27;
    __getMPPlaybackArchiveConfigurationClass_block_invoke((uint64_t)&v22);
    v15 = (void *)v28[3];
  }
  if (v14 <= 4.0)
    v16 = 256.0;
  else
    v16 = v14 * 64.0;
  v17 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v27, 8);
  v18 = (void *)objc_msgSend([v17 alloc], "initWithPreferredArtworkSize:", v16, v16);
  objc_msgSend(v11, "setPlaybackArchiveConfiguration:", v18);

  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v11, "setModalPresentationStyle:", 2);
  -[HUMediaSelectionViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  objc_msgSend(v11, "setPreferredContentSize:", v20, v21);

  -[HUMediaSelectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

- (void)_presentMediaPickerUnavailablePromptWithReason:(int64_t)a3 storeKitErrorObject:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  int v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;

  v6 = a4;
  if (a3 == 2)
  {
    v7 = 0;
    v9 = 0;
    v10 = 0;
    v8 = CFSTR("HUAlertError");
  }
  else if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("music://subscribe"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptTitle");
    v9 = 1;
    v10 = CFSTR("HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptGetAppleMusicButton");
  }
  else if (a3)
  {
    v7 = 0;
    v9 = 0;
    v10 = 0;
    v8 = 0;
  }
  else
  {
    +[HUMediaAccountUtilities musicAppURL](HUMediaAccountUtilities, "musicAppURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("HUMediaPickerUnavailableMusicAppUninstalledPromptTitle");
    v9 = 1;
    v10 = CFSTR("HUMediaPickerUnavailableMusicAppUninstalledPromptOpenAppStoreButton");
  }
  -[HUMediaSelectionViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaSelectionViewController:messageForMediaPickerUnavailableReason:", self, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v6;
  if (v12)
    _HULocalizedStringWithDefaultValue(v12, v12, 1);
  else
    objc_msgSend(v6, "localizedDescription", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(v8, v8, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v15, v13, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v19);

  if (v7)
    v20 = v9;
  else
    v20 = 0;
  if (v20 == 1)
  {
    v21 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(v10, v10, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __101__HUMediaSelectionViewController__presentMediaPickerUnavailablePromptWithReason_storeKitErrorObject___block_invoke;
    v29 = &unk_1E6F4C6E0;
    v30 = v7;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, &v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAction:", v23);

  }
  -[HUMediaSelectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0, v24, v26, v27, v28, v29);

}

void __101__HUMediaSelectionViewController__presentMediaPickerUnavailablePromptWithReason_storeKitErrorObject___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "openURL:", *(_QWORD *)(a1 + 32));

}

- (void)mediaPicker:(id)a3 didPickPlaybackArchive:(id)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
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
  id v21;
  id v22;

  v6 = (objc_class *)MEMORY[0x1E0D31660];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithMediaPlayerPlaybackArchive:", v7);

  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPickedPlaybackArchive:", v8);

  v10 = -[HUMediaSelectionViewController lastTargetOptions](self, "lastTargetOptions");
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pickedPlaybackArchive");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTargetOptions:", v10);

  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pickedPlaybackArchive");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAutoPlayEnabled:", 0);

  v15 = (void *)MEMORY[0x1E0C99E20];
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "playbackOptionsItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v17);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "chosenMediaItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v19);

  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "updateResultsForItems:senderSelector:", v22, a2);

  -[HUMediaSelectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)mediaPickerDidCancel:(id)a3
{
  -[HUMediaSelectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)mediaPickerDidPickPlaybackArchive:(id)a3
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
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
  id v20;
  id v21;

  v5 = (objc_class *)MEMORY[0x1E0D31660];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithMediaPlayerPlaybackArchive:", v6);

  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPickedPlaybackArchive:", v7);

  v9 = -[HUMediaSelectionViewController lastTargetOptions](self, "lastTargetOptions");
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pickedPlaybackArchive");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTargetOptions:", v9);

  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pickedPlaybackArchive");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAutoPlayEnabled:", 0);

  v14 = (void *)MEMORY[0x1E0C99E20];
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "playbackOptionsItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v16);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "chosenMediaItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v18);

  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v19, "updateResultsForItems:senderSelector:", v21, a2);

  -[HUMediaSelectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v6 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSelectionViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForCell:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "displayedItemAtIndexPath:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaPlaybackOptionsItem:switchedOn:", v11, v4);

}

- (void)sliderValueTableViewCell:(id)a3 didChangeValue:(double)a4
{
  id v5;

  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaVolumeValueChanged:", a4);

}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUMediaSelectionViewController;
  -[HUItemTableViewController itemManager:didUpdateResultsForItem:atIndexPath:](&v15, sel_itemManager_didUpdateResultsForItem_atIndexPath_, a3, v8, a5);
  -[HUMediaSelectionViewController mediaSelectionItemManager](self, "mediaSelectionItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaPickerItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 != v8)
  {

LABEL_3:
    goto LABEL_4;
  }
  objc_msgSend(v8, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HOMediaPickerUnavailableReasonKey"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    goto LABEL_3;
  }
  v13 = (void *)v12;
  -[HUMediaSelectionViewController presentedViewController](self, "presentedViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    -[HUMediaSelectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_4:

}

- (HUMediaSelectionViewControllerDelegate)delegate
{
  return (HUMediaSelectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUMediaSelectionItemManager)mediaSelectionItemManager
{
  return self->_mediaSelectionItemManager;
}

- (void)setMediaSelectionItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSelectionItemManager, a3);
}

- (unint64_t)lastTargetOptions
{
  return self->_lastTargetOptions;
}

- (void)setLastTargetOptions:(unint64_t)a3
{
  self->_lastTargetOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSelectionItemManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
