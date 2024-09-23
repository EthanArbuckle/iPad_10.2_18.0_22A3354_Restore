@implementation HUFaceRecognitionUserPhotosLibrarySettingsViewController

- (HUFaceRecognitionUserPhotosLibrarySettingsViewController)initWithUserPhotosLibraryItem:(id)a3
{
  id v4;
  HUFaceRecognitionUserPhotosLibrarySettingsItemManager *v5;
  void *v6;
  HUFaceRecognitionUserPhotosLibrarySettingsItemManager *v7;
  HUFaceRecognitionUserPhotosLibrarySettingsViewController *v8;
  HUFaceRecognitionUserPhotosLibrarySettingsViewController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v5 = [HUFaceRecognitionUserPhotosLibrarySettingsItemManager alloc];
  v6 = (void *)objc_msgSend(v4, "copy");
  v7 = -[HUFaceRecognitionUserPhotosLibrarySettingsItemManager initWithDelegate:sourceItem:](v5, "initWithDelegate:sourceItem:", 0, v6);

  v20.receiver = self;
  v20.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsViewController;
  v8 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v20, sel_initWithItemManager_tableViewStyle_, v7, 1);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photosLibrarySettingsItemManager, v7);
    -[HFItemManager setDelegate:](v9->_photosLibrarySettingsItemManager, "setDelegate:", v9);
    objc_msgSend(v4, "user");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUFaceRecognitionUsersPhotosLibraryTableViewCellTitle"), CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionUserPhotosLibrarySettingsViewController setTitle:](v9, "setTitle:", v18);

  }
  return v9;
}

- (HUFaceRecognitionUserPhotosLibrarySettingsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFaceRecognitionUserPhotosLibrarySettingsViewController.m"), 49, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUFaceRecognitionUserPhotosLibrarySettingsViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUFaceRecognitionUserPhotosLibrarySettingsModuleController *v5;
  void *v6;
  HUFaceRecognitionUserPhotosLibrarySettingsModuleController *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Unexpected module %@"), v4);
  v5 = [HUFaceRecognitionUserPhotosLibrarySettingsModuleController alloc];
  -[HUFaceRecognitionUserPhotosLibrarySettingsItemManager photosLibrarySettingsModule](self->_photosLibrarySettingsItemManager, "photosLibrarySettingsModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUFaceRecognitionUserPhotosLibrarySettingsModuleController initWithModule:host:](v5, "initWithModule:host:", v6, self);
  -[HUFaceRecognitionUserPhotosLibrarySettingsViewController setPhotosLibrarySettingsModuleController:](self, "setPhotosLibrarySettingsModuleController:", v7);

  -[HUFaceRecognitionUserPhotosLibrarySettingsViewController photosLibrarySettingsModuleController](self, "photosLibrarySettingsModuleController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsViewController;
  -[HUItemTableViewController tableView:viewForFooterInSection:](&v13, sel_tableView_viewForFooterInSection_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "messageTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTappableTextViewDelegate:", self);

  objc_msgSend(v8, "messageTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSelectable:", 0);

  objc_msgSend(v8, "messageTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setInteractiveTextSelectionDisabled:", 1);

  return v6;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[HUFaceRecognitionUserPhotosLibrarySettingsViewController photosLibrarySettingsItemManager](self, "photosLibrarySettingsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addNamesInPhotosLibraryItem");
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
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v18;

  v6 = a6;
  v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsViewController;
  v11 = a4;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v18, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUFaceRecognitionUserPhotosLibrarySettingsViewController photosLibrarySettingsItemManager](self, "photosLibrarySettingsItemManager", v18.receiver, v18.super_class);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addNamesInPhotosLibraryItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v11, "isEqual:", v13);

  if ((_DWORD)self)
  {
    objc_opt_class();
    v14 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_msgSend(v16, "textLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNumberOfLines:", 0);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsViewController;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v19, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v19.receiver, v19.super_class);

  v8 = objc_msgSend(v6, "section");
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUFaceRecognitionAddNamesInPhotosLibrarySection"));

  if (v8 == v10)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayedItemAtIndexPath:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionUserPhotosLibrarySettingsViewController photosLibrarySettingsItemManager](self, "photosLibrarySettingsItemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addNamesInPhotosLibraryItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqual:", v14);

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "hf_photosLibraryPeopleAlbumURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v16, "openURL:", v17);

    }
  }

}

- (id)itemModuleControllers
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)objc_opt_new();
  v7.receiver = self;
  v7.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsViewController;
  -[HUItemTableViewController itemModuleControllers](&v7, sel_itemModuleControllers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[HUFaceRecognitionUserPhotosLibrarySettingsViewController photosLibrarySettingsModuleController](self, "photosLibrarySettingsModuleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v5);

  return v3;
}

- (void)tappableTextView:(id)a3 tappedAtIndex:(unint64_t)a4 withAttributes:(id)a5
{
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  HUFaceRecognitionUserPhotosLibrarySettingsViewController *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0CEA0C0];
  v9 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "hf_photosLibraryPeopleAlbumURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqualToString:", v13);

  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionUsePhotosLibrarySectionFooterPhotosLink"), CFSTR("HUFaceRecognitionUsePhotosLibrarySectionFooterPhotosLink"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "rangeOfString:", v15);
  v19 = v18;

  if (v17 != 0x7FFFFFFFFFFFFFFFLL && v17 <= a4 && v17 + v19 > a4 && v14)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "hf_photosLibraryPeopleAlbumURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v20, "openSensitiveURL:withOptions:error:", v21, 0, &v25);
    v22 = v25;

    if (v22)
    {
      HFLogForCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "hf_photosLibraryPeopleAlbumURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v27 = self;
        v28 = 2080;
        v29 = "-[HUFaceRecognitionUserPhotosLibrarySettingsViewController tappableTextView:tappedAtIndex:withAttributes:]";
        v30 = 2112;
        v31 = v24;
        _os_log_error_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_ERROR, "%@ (%s): Cannot open sensitive url %@", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:", 6);
    }

  }
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (HUFaceRecognitionUserPhotosLibrarySettingsItemManager)photosLibrarySettingsItemManager
{
  return self->_photosLibrarySettingsItemManager;
}

- (void)setPhotosLibrarySettingsItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_photosLibrarySettingsItemManager, a3);
}

- (HUFaceRecognitionUserPhotosLibrarySettingsModuleController)photosLibrarySettingsModuleController
{
  return self->_photosLibrarySettingsModuleController;
}

- (void)setPhotosLibrarySettingsModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_photosLibrarySettingsModuleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLibrarySettingsModuleController, 0);
  objc_storeStrong((id *)&self->_photosLibrarySettingsItemManager, 0);
}

@end
