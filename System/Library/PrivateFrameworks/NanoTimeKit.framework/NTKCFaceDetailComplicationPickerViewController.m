@implementation NTKCFaceDetailComplicationPickerViewController

- (void)_configureWithSlot:(id)a3 listProvider:(id)a4 selectedComplication:(id)a5
{
  id v8;
  NSString *v9;
  NSString *slot;
  id v11;

  objc_storeStrong((id *)&self->_listProvider, a4);
  v11 = a4;
  v8 = a3;
  v9 = (NSString *)objc_msgSend(v8, "copy");

  slot = self->_slot;
  self->_slot = v9;

}

- (NTKCFaceDetailComplicationPickerViewController)initWithSlot:(id)a3 listProvider:(id)a4 title:(id)a5 selectedComplication:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NTKCFaceDetailComplicationPickerViewController *v14;
  NTKCFaceDetailComplicationPickerViewController *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)NTKCFaceDetailComplicationPickerViewController;
  v14 = -[NTKCFaceDetailComplicationPickerViewController initWithStyle:](&v17, sel_initWithStyle_, 2);
  v15 = v14;
  if (v14)
  {
    -[NTKCFaceDetailComplicationPickerViewController _configureWithSlot:listProvider:selectedComplication:](v14, "_configureWithSlot:listProvider:selectedComplication:", v10, v11, v13);
    -[NTKCFaceDetailComplicationPickerViewController setTitle:](v15, "setTitle:", v12);
  }

  return v15;
}

- (NTKCFaceDetailComplicationPickerViewController)initWithFace:(id)a3 slot:(id)a4 selectedComplication:(id)a5
{
  id v8;
  id v9;
  id v10;
  NTKCFaceDetailComplicationPickerViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NTKFaceSlotComplicationTopLevelListProvider *v20;
  NTKFaceSlotComplicationTopLevelListProvider *topLevelListProvider;
  void *v22;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)NTKCFaceDetailComplicationPickerViewController;
  v11 = -[NTKCFaceDetailComplicationPickerViewController initWithStyle:](&v24, sel_initWithStyle_, 2);
  if (v11)
  {
    v12 = (void *)objc_opt_class();
    objc_msgSend(v8, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "richComplicationSlotsForDevice:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v9);

    objc_msgSend(v8, "rankedComplicationFamiliesForSlot:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerValue");

    objc_msgSend(v8, "allowedComplicationsForSlot:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[NTKFaceSlotComplicationTopLevelListProvider initWithRichSlot:complicationFamily:complications:selectedComplication:]([NTKFaceSlotComplicationTopLevelListProvider alloc], "initWithRichSlot:complicationFamily:complications:selectedComplication:", v15, v18, v19, v10);
    topLevelListProvider = v11->_topLevelListProvider;
    v11->_topLevelListProvider = v20;

    NTKCompanionClockFaceLocalizedString(CFSTR("EDIT_MODE_LABEL_COMPLICATIONS_COMPANION"), CFSTR("Complications"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailComplicationPickerViewController setTitle:](v11, "setTitle:", v22);
    -[NTKCFaceDetailComplicationPickerViewController _configureWithSlot:listProvider:selectedComplication:](v11, "_configureWithSlot:listProvider:selectedComplication:", v9, v11->_topLevelListProvider, v10);

  }
  return v11;
}

- (id)detailViewControllerForSectionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NTKCFaceDetailComplicationPickerViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NTKCFaceDetailComplicationPickerViewController *v13;

  v4 = a3;
  objc_msgSend(v4, "ntk_identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailComplicationPickerViewController topLevelListProvider](self, "topLevelListProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailListProviderForSectionIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [NTKCFaceDetailComplicationPickerViewController alloc];
    -[NTKCFaceDetailComplicationPickerViewController slot](self, "slot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ntk_localizedSectionName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailComplicationPickerViewController topLevelListProvider](self, "topLevelListProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectedItemIgnoringMoreButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NTKCFaceDetailComplicationPickerViewController initWithSlot:listProvider:title:selectedComplication:](v8, "initWithSlot:listProvider:title:selectedComplication:", v9, v7, v10, v12);

    -[NTKCFaceDetailComplicationPickerViewController setDelegate:](v13, "setDelegate:", self);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)viewDidLoad
{
  NTKCFaceDetailDiffableDataSource *v3;
  void *v4;
  NTKCFaceDetailDiffableDataSource *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NTKCFaceDetailComplicationCellProvider *v10;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, uint64_t, void *, void *);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NTKCFaceDetailComplicationPickerViewController;
  -[NTKCFaceDetailComplicationPickerViewController viewDidLoad](&v17, sel_viewDidLoad);
  objc_initWeak(&location, self);
  v3 = [NTKCFaceDetailDiffableDataSource alloc];
  -[NTKCFaceDetailComplicationPickerViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __61__NTKCFaceDetailComplicationPickerViewController_viewDidLoad__block_invoke;
  v14 = &unk_1E6BD91A0;
  objc_copyWeak(&v15, &location);
  v5 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](v3, "initWithTableView:cellProvider:", v4, &v11);

  -[NTKCFaceDetailComplicationPickerViewController listProvider](self, "listProvider", v11, v12, v13, v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailComplicationPickerViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC53D8];
  objc_msgSend(v7, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  v9 = *MEMORY[0x1E0DC53E0];
  objc_msgSend(v7, "setEstimatedRowHeight:", v9);
  objc_msgSend(v7, "setSectionHeaderHeight:", v8);
  objc_msgSend(v7, "setEstimatedSectionHeaderHeight:", v9);
  v10 = -[NTKCFaceDetailComplicationCellProvider initWithTableView:listProvider:]([NTKCFaceDetailComplicationCellProvider alloc], "initWithTableView:listProvider:", v7, v6);
  -[NTKCFaceDetailComplicationPickerViewController setCellProvider:](self, "setCellProvider:", v10);
  -[NTKCFaceDetailComplicationPickerViewController setDataSource:](self, "setDataSource:", v5);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

id __61__NTKCFaceDetailComplicationPickerViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "cellProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItem:atIndexPath:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKCFaceDetailComplicationPickerViewController;
  -[NTKCFaceDetailComplicationPickerViewController viewWillAppear:](&v13, sel_viewWillAppear_, a3);
  -[NTKCFaceDetailComplicationPickerViewController listProvider](self, "listProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickerListDataSourceSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKCFaceDetailComplicationPickerViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySnapshot:animatingDifferences:completion:", v5, 0, 0);

  -[NTKCFaceDetailComplicationPickerViewController listProvider](self, "listProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickerSelectedItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NTKCFaceDetailComplicationPickerViewController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathForItemIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailComplicationPickerViewController setIndexPathToScrollToAfterLayout:](self, "setIndexPathToScrollToAfterLayout:", v10);

    -[NTKCFaceDetailComplicationPickerViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailComplicationPickerViewController indexPathToScrollToAfterLayout](self, "indexPathToScrollToAfterLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollToRowAtIndexPath:atScrollPosition:animated:", v12, 2, 0);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKCFaceDetailComplicationPickerViewController;
  -[NTKCFaceDetailComplicationPickerViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[NTKCFaceDetailComplicationPickerViewController indexPathToScrollToAfterLayout](self, "indexPathToScrollToAfterLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && !-[NTKCFaceDetailComplicationPickerViewController hasDoneInitialScrollToItem](self, "hasDoneInitialScrollToItem"))
  {
    -[NTKCFaceDetailComplicationPickerViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollToRowAtIndexPath:atScrollPosition:animated:", v3, 2, 0);

    -[NTKCFaceDetailComplicationPickerViewController setHasDoneInitialScrollToItem:](self, "setHasDoneInitialScrollToItem:", 1);
  }

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v4;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessoryType:", 0);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NTKComplicationPickerDetailViewConfiguration *v23;
  __objc2_class *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NTKCFaceDetailComplicationPickerViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifierForIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v9, "ntk_itemType"))
  {
    case 1:
    case 2:
    case 4:
      -[NTKCFaceDetailComplicationPickerViewController _setCheckmarkForTableView:atIndexPath:](self, "_setCheckmarkForTableView:atIndexPath:", v6, v7);
      v10 = v9;
      -[NTKCFaceDetailComplicationPickerViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "faceDetailComplicationPickerViewController:didSelectComplication:", self, v10);

      goto LABEL_24;
    case 3:
      v12 = objc_msgSend(v7, "section");
      -[NTKCFaceDetailComplicationPickerViewController dataSource](self, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "snapshot");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sectionIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "ntk_identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.nanotimekit.contacts"));

      if ((_DWORD)v14)
      {
        _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v41) = 0;
          _os_log_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_DEFAULT, "Did select \"More...\" under Contacts. Loading Contacts-specific picker UI.", (uint8_t *)&v41, 2u);
        }

        objc_msgSend(v16, "ntk_identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "ntk_localizedSectionName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKCFaceDetailComplicationPickerViewController topLevelListProvider](self, "topLevelListProvider");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "detailListProviderForSectionIdentifier:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = -[NTKComplicationPickerDetailViewConfiguration initWithDetailListProvider:title:]([NTKComplicationPickerDetailViewConfiguration alloc], "initWithDetailListProvider:title:", v22, v20);
        v24 = NTKPeopleComplicationPickerViewController;
LABEL_7:
        v25 = (void *)objc_msgSend([v24 alloc], "initWithDetailConfiguration:", v23);
        objc_msgSend(v25, "setDelegate:", self);

LABEL_23:
        -[NTKCFaceDetailComplicationPickerViewController showViewController:sender:](self, "showViewController:sender:", v25, self);

        goto LABEL_24;
      }
      objc_msgSend(v16, "ntk_identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D515C8], "appContainerBundleIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "isEqualToString:", v35))
      {
        v36 = -[NTKCFaceDetailComplicationPickerViewController _showCustomHomePickerUI](self, "_showCustomHomePickerUI");

        if (v36)
        {
          _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v41) = 0;
            _os_log_impl(&dword_1B72A3000, v37, OS_LOG_TYPE_DEFAULT, "Did select \"More...\" under NanoHome. Loading Home-specific picker UI.", (uint8_t *)&v41, 2u);
          }

          objc_msgSend(v16, "ntk_identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "ntk_localizedSectionName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKCFaceDetailComplicationPickerViewController topLevelListProvider](self, "topLevelListProvider");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "detailListProviderForSectionIdentifier:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = -[NTKComplicationPickerDetailViewConfiguration initWithDetailListProvider:title:]([NTKComplicationPickerDetailViewConfiguration alloc], "initWithDetailListProvider:title:", v22, v20);
          v24 = NTKHomeListPickerViewController;
          goto LABEL_7;
        }
      }
      else
      {

      }
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "ntk_identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138412290;
        v42 = v40;
        _os_log_impl(&dword_1B72A3000, v39, OS_LOG_TYPE_DEFAULT, "Did select \"More...\" under section %@", (uint8_t *)&v41, 0xCu);

      }
      -[NTKCFaceDetailComplicationPickerViewController detailViewControllerForSectionInfo:](self, "detailViewControllerForSectionInfo:", v16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 6:
      -[NTKCFaceDetailComplicationPickerViewController _setCheckmarkForTableView:atIndexPath:](self, "_setCheckmarkForTableView:atIndexPath:", v6, v7);
      if (!-[NTKCFaceDetailComplicationPickerViewController _handleWidgetItemSelection:](self, "_handleWidgetItemSelection:", v9))
      {
        _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[NTKCFaceDetailComplicationPickerViewController tableView:didSelectRowAtIndexPath:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);
        goto LABEL_13;
      }
      goto LABEL_24;
    default:
      _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[NTKCFaceDetailComplicationPickerViewController tableView:didSelectRowAtIndexPath:].cold.1(v9, v26);
LABEL_13:

LABEL_24:
      return;
  }
}

- (void)faceDetailComplicationPickerViewController:(id)a3 didSelectComplication:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NTKCFaceDetailComplicationPickerViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "faceDetailComplicationPickerViewController:didSelectComplication:", self, v5);

}

- (void)peopleComplicationPickerViewController:(id)a3 didSelectItem:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKCFaceDetailComplicationPickerViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "faceDetailComplicationPickerViewController:didSelectComplication:", self, v6);

  }
}

- (void)homeListPickerViewController:(id)a3 didSelectItem:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a4;
  if (!-[NTKCFaceDetailComplicationPickerViewController _handleWidgetItemSelection:](self, "_handleWidgetItemSelection:", v5)&& !-[NTKCFaceDetailComplicationPickerViewController _handleHomeItemSelection:](self, "_handleHomeItemSelection:", v5))
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NTKCFaceDetailComplicationPickerViewController homeListPickerViewController:didSelectItem:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

- (void)homeDetailPickerViewController:(id)a3 didSelectItem:(id)a4
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!-[NTKCFaceDetailComplicationPickerViewController _handleWidgetItemSelection:](self, "_handleWidgetItemSelection:", a4))
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[NTKCFaceDetailComplicationPickerViewController homeDetailPickerViewController:didSelectItem:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

- (BOOL)_showCustomHomePickerUI
{
  void *v2;
  char v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(MEMORY[0x1E0D515B8], "eagleRoostFeatureFlagIsEnabled");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("4AA0FC66-2573-4079-A68E-D366D9AD3489"));
  v5 = objc_msgSend(v2, "supportsCapability:", v4);

  return v3 & v5;
}

- (BOOL)_handleWidgetItemSelection:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "widgetComplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailComplicationPickerViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "faceDetailComplicationPickerViewController:didSelectComplication:", self, v6);

  }
  return isKindOfClass & 1;
}

- (BOOL)_handleHomeItemSelection:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NTKComplicationPickerDetailViewConfiguration *v11;
  NTKHomeDetailPickerViewController *v12;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "homeLocalizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailComplicationPickerViewController topLevelListProvider](self, "topLevelListProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D515C8], "appContainerBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "detailListProviderForSectionIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[NTKComplicationPickerDetailViewConfiguration initWithDetailListProvider:title:]([NTKComplicationPickerDetailViewConfiguration alloc], "initWithDetailListProvider:title:", v10, v7);
    v12 = -[NTKHomeDetailPickerViewController initWithDetailConfiguration:homeListItem:]([NTKHomeDetailPickerViewController alloc], "initWithDetailConfiguration:homeListItem:", v11, v6);

    -[NTKHomeDetailPickerViewController setDelegate:](v12, "setDelegate:", self);
    -[NTKCFaceDetailComplicationPickerViewController showViewController:sender:](self, "showViewController:sender:", v12, self);

  }
  return isKindOfClass & 1;
}

- (void)_setCheckmarkForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[NTKCFaceDetailComplicationPickerViewController listProvider](self, "listProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickerSelectedItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NTKCFaceDetailComplicationPickerViewController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathForItemIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "cellForRowAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ntk_setPickerSelected:", 0);

  }
  objc_msgSend(v13, "cellForRowAtIndexPath:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ntk_setPickerSelected:", 1);

}

- (NSString)slot
{
  return self->_slot;
}

- (NTKCFaceDetailComplicationPickerViewControllerDelegate)delegate
{
  return (NTKCFaceDetailComplicationPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITableViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NTKCFaceDetailComplicationCellProvider)cellProvider
{
  return self->_cellProvider;
}

- (void)setCellProvider:(id)a3
{
  objc_storeStrong((id *)&self->_cellProvider, a3);
}

- (NTKComplicationPickerListProvider)listProvider
{
  return self->_listProvider;
}

- (NTKFaceSlotComplicationTopLevelListProvider)topLevelListProvider
{
  return self->_topLevelListProvider;
}

- (NSIndexPath)indexPathToScrollToAfterLayout
{
  return self->_indexPathToScrollToAfterLayout;
}

- (void)setIndexPathToScrollToAfterLayout:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathToScrollToAfterLayout, a3);
}

- (BOOL)hasDoneInitialScrollToItem
{
  return self->_hasDoneInitialScrollToItem;
}

- (void)setHasDoneInitialScrollToItem:(BOOL)a3
{
  self->_hasDoneInitialScrollToItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathToScrollToAfterLayout, 0);
  objc_storeStrong((id *)&self->_topLevelListProvider, 0);
  objc_storeStrong((id *)&self->_listProvider, 0);
  objc_storeStrong((id *)&self->_cellProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_slot, 0);
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "ntk_itemType");
  objc_msgSend(a1, "ntk_identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "Item with type %ld and identifier %@ not expected to appear on top level detail picker view!", (uint8_t *)&v6, 0x16u);

}

- (void)tableView:(uint64_t)a3 didSelectRowAtIndexPath:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "Failed to handle selection of Home complication item on top level detail picker view!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

- (void)homeListPickerViewController:(uint64_t)a3 didSelectItem:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "Failed to handle selection of list item on Home list!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

- (void)homeDetailPickerViewController:(uint64_t)a3 didSelectItem:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "Failed to handle selection of Home complication item on Home detail!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

@end
