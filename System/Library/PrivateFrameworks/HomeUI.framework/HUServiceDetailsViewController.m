@implementation HUServiceDetailsViewController

- (id)createAccessoryDetailInfoListModuleControllerWith:(id)a3
{
  id v4;
  HUServiceDetailsViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = HUServiceDetailsViewController.createAccessoryDetailInfoListModuleController(with:)((uint64_t)v4);

  return v6;
}

+ (id)acceptableItemClasses
{
  if (_MergedGlobals_4_3 != -1)
    dispatch_once(&_MergedGlobals_4_3, &__block_literal_global_55);
  return (id)qword_1EF226AD0;
}

void __55__HUServiceDetailsViewController_acceptableItemClasses__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_1EF226AD0;
  qword_1EF226AD0 = v9;

}

- (HUServiceDetailsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithServiceLikeItem_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsViewController.m"), 169, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUServiceDetailsViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUServiceDetailsViewController)initWithServiceLikeItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  HUServiceDetailsItemManager *v11;
  HUServiceDetailsViewController *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NAFuture *accountFuture;
  NAFuture *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  HUControlPanelController *v53;
  HUControlPanelController *controlPanelController;
  uint64_t v55;
  NSHashTable *expandedControlPanelItems;
  uint64_t v57;
  UILongPressGestureRecognizer *longPressRecognizer;
  void *v59;
  HUServiceDetailsTextViewDelegate *v60;
  HUServiceDetailsTextViewDelegate *textViewDelegate;
  uint64_t v62;
  HFNamingComponents *namingComponent;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  HUQuickControlSummaryNavigationBarTitleView *v68;
  HUBaseIconViewConfiguration *v69;
  void *v70;
  void *v71;
  void *v72;
  HUQuickControlProxHandOffSummaryViewUpdater *v73;
  void *v74;
  HUQuickControlProxHandOffSummaryViewUpdater *v75;
  void *v77;
  void *v78;
  id v79;
  HUServiceDetailsItemManager *v80;
  void *v81;
  _QWORD v83[4];
  HUServiceDetailsItemManager *v84;
  id v85[2];
  _QWORD v86[4];
  HUServiceDetailsItemManager *v87;
  id v88[2];
  id location;
  objc_super v90;
  _QWORD v91[4];
  id v92;
  void *v93;
  uint8_t buf[4];
  id v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "acceptableItemClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke;
  v91[3] = &unk_1E6F4E090;
  v6 = v4;
  v92 = v6;
  if ((objc_msgSend(v5, "na_any:", v91) & 1) == 0)
  {
    v7 = objc_opt_class();
    objc_msgSend(v5, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_map:", &__block_literal_global_74_1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("/"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ requires a %@ object"), v7, v10);

  }
  v11 = -[HUServiceDetailsItemManager initWithServiceItem:delegate:]([HUServiceDetailsItemManager alloc], "initWithServiceItem:delegate:", v6, self);
  v90.receiver = self;
  v90.super_class = (Class)HUServiceDetailsViewController;
  v12 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v90, sel_initWithItemManager_tableViewStyle_, v11, 1);
  if (v12)
  {
    v13 = v6;
    v14 = &unk_1EF2AC600;
    if (objc_msgSend(v13, "conformsToProtocol:", v14))
      v15 = v13;
    else
      v15 = 0;
    v16 = v15;

    v17 = objc_msgSend(v16, "isItemGroup");
    v12->_isItemGroup = v17;
    v12->_isMultiServiceAccessory = 0;
    v12->_shouldIncludeRoomNameInHeaderTitle = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v18 = v13;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      objc_msgSend(v20, "accessory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_isMultiServiceAccessory = objc_msgSend(v21, "hf_isMultiServiceAccessory");

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_31:
        objc_storeWeak((id *)&v12->_detailsItemManager, v11);
        v53 = -[HUControlPanelController initWithDelegate:]([HUControlPanelController alloc], "initWithDelegate:", v12);
        controlPanelController = v12->_controlPanelController;
        v12->_controlPanelController = v53;

        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v55 = objc_claimAutoreleasedReturnValue();
        expandedControlPanelItems = v12->_expandedControlPanelItems;
        v12->_expandedControlPanelItems = (NSHashTable *)v55;

        v57 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v12, sel__longPressRecognized_);
        longPressRecognizer = v12->_longPressRecognizer;
        v12->_longPressRecognizer = (UILongPressGestureRecognizer *)v57;

        -[UILongPressGestureRecognizer setDelegate:](v12->_longPressRecognizer, "setDelegate:", v12);
        -[HUServiceDetailsViewController tableView](v12, "tableView");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "addGestureRecognizer:", v12->_longPressRecognizer);

        v60 = objc_alloc_init(HUServiceDetailsTextViewDelegate);
        textViewDelegate = v12->_textViewDelegate;
        v12->_textViewDelegate = v60;

        -[HUServiceDetailsTextViewDelegate setItemManager:](v12->_textViewDelegate, "setItemManager:", v11);
        -[HUServiceDetailsTextViewDelegate setViewController:](v12->_textViewDelegate, "setViewController:", v12);
        objc_msgSend(v13, "namingComponentForHomeKitObject");
        v62 = objc_claimAutoreleasedReturnValue();
        namingComponent = v12->_namingComponent;
        v12->_namingComponent = (HFNamingComponents *)v62;

        objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "addHomeObserver:", v12);

        objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "addAccessoryObserver:", v12);

        objc_msgSend(v13, "latestResults");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUServiceDetailsViewController setTitle:](v12, "setTitle:", v67);

        v68 = objc_alloc_init(HUQuickControlSummaryNavigationBarTitleView);
        -[HUServiceDetailsViewController setNavigationBarTitleView:](v12, "setNavigationBarTitleView:", v68);

        if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) == 0)
        {
          v69 = -[HUBaseIconViewConfiguration initWithItem:appearance:]([HUBaseIconViewConfiguration alloc], "initWithItem:appearance:", v13, 3);
          -[HUServiceDetailsViewController navigationBarTitleView](v12, "navigationBarTitleView");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "summaryView");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "baseIconView");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setConfiguration:", v69);

        }
        if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
        {
          v73 = [HUQuickControlProxHandOffSummaryViewUpdater alloc];
          -[HUServiceDetailsViewController navigationBarTitleView](v12, "navigationBarTitleView");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = -[HUQuickControlProxHandOffSummaryViewUpdater initWithNavigationBarTitleView:](v73, "initWithNavigationBarTitleView:", v74);
          -[HUServiceDetailsViewController setProxHandOffSummaryViewUpdater:](v12, "setProxHandOffSummaryViewUpdater:", v75);

        }
        goto LABEL_35;
      }
      objc_opt_class();
      v22 = v13;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
      v20 = v23;

      if ((objc_msgSend(v20, "isHomePod") & 1) != 0 || objc_msgSend(v20, "isHomePodMediaSystem"))
      {
        v24 = (void *)objc_opt_new();
        -[HUServiceDetailsViewController setRegisteredButtonFutures:](v12, "setRegisteredButtonFutures:", v24);

        objc_initWeak(&location, v12);
        v86[0] = MEMORY[0x1E0C809B0];
        v86[1] = 3221225472;
        v86[2] = __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke_3;
        v86[3] = &unk_1E6F56BD8;
        v88[1] = (id)a2;
        objc_copyWeak(v88, &location);
        v80 = v11;
        v87 = v80;
        +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguagesWithCompletion:](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguagesWithCompletion:", v86);
        objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "home");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "hf_currentUserIsOwner");

        if (v27)
        {
          objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "home");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "uniqueIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "UUIDString");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "mediaAccountForHomeIdentifier:", v31);
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          if (v81)
          {
            HFLogForCategory();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromSelector(a2);
              v79 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "home");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "uniqueIdentifier");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "UUIDString");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v95 = v79;
              v96 = 2112;
              v97 = v81;
              v98 = 2112;
              v99 = v35;
              _os_log_impl(&dword_1B8E1E000, v32, OS_LOG_TYPE_DEFAULT, "%@ Setting media account - [%@]  for home with identifier - [%@]", buf, 0x20u);

            }
            -[HUServiceDetailsItemManager setHomeMediaAccount:](v80, "setHomeMediaAccount:", v81);
            -[HUServiceDetailsViewController detailsItemManager](v12, "detailsItemManager");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (id)objc_msgSend(v36, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

            -[HUServiceDetailsViewController detailsItemManager](v12, "detailsItemManager");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "diffableDataSourceDisabled");

            if (v39)
            {
              -[HUServiceDetailsViewController tableView](v12, "tableView");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "reloadSections:withRowAnimation:", v41, 5);

            }
            else
            {
              -[HUItemTableViewController itemManager](v12, "itemManager");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "itemSectionForSectionIndex:", 0);
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              if (v50)
              {
                -[HUServiceDetailsViewController detailsItemManager](v12, "detailsItemManager");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v93 = v50;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "reloadUIRepresentationForSections:withAnimation:", v52, 0);

              }
            }
          }
          else
          {
            objc_initWeak((id *)buf, v12);
            objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "home");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "executeHomeMediaAccountFetchForHome:", v44);
            v45 = objc_claimAutoreleasedReturnValue();
            accountFuture = v12->_accountFuture;
            v12->_accountFuture = (NAFuture *)v45;

            v47 = v12->_accountFuture;
            v83[0] = MEMORY[0x1E0C809B0];
            v83[1] = 3221225472;
            v83[2] = __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke_141;
            v83[3] = &unk_1E6F56C00;
            v85[1] = (id)a2;
            objc_copyWeak(v85, (id *)buf);
            v84 = v80;
            v48 = (id)-[NAFuture addCompletionBlock:](v47, "addCompletionBlock:", v83);

            objc_destroyWeak(v85);
            objc_destroyWeak((id *)buf);
          }

        }
        objc_destroyWeak(v88);
        objc_destroyWeak(&location);
      }
    }

    goto LABEL_31;
  }
LABEL_35:

  return v12;
}

uint64_t __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

NSString *__58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke_2(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

void __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v16;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v5;
    _os_log_debug_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEBUG, "%@ fetchSupportedVoiceRecognitionLanguagesWithCompletion returned (%@) %@", buf, 0x20u);

  }
  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setSupportedVoiceRecognitionLanguages:", v5);
    -[NSObject detailsItemManager](WeakRetained, "detailsItemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 48));

    -[NSObject detailsItemManager](WeakRetained, "detailsItemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v12, "diffableDataSourceDisabled");

    if ((_DWORD)v10)
    {
      -[NSObject tableView](WeakRetained, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reloadSections:withRowAnimation:", v13, 5);
    }
    else
    {
      -[NSObject itemManager](WeakRetained, "itemManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "itemSectionForSectionIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_11;
      -[NSObject detailsItemManager](WeakRetained, "detailsItemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reloadUIRepresentationForSections:withAnimation:", v15, 0);

    }
    goto LABEL_11;
  }
  HFLogForCategory();
  WeakRetained = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v9;
    v20 = 2112;
    v21 = v6;
    _os_log_error_impl(&dword_1B8E1E000, WeakRetained, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages [%@]", buf, 0x16u);
LABEL_11:

  }
}

void __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke_141(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[2];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "home");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v10;
      v21 = 2112;
      v22 = v14;
      v23 = 2112;
      v24 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "%@ Error fetching media account for home with identifier [%@] - [%@]", buf, 0x20u);

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0D519C0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke_143;
    v15[3] = &unk_1E6F53808;
    objc_copyWeak(v18, (id *)(a1 + 40));
    v18[1] = *(id *)(a1 + 48);
    v16 = v5;
    v17 = *(id *)(a1 + 32);
    v9 = (id)objc_msgSend(v8, "futureWithBlock:", v15);

    objc_destroyWeak(v18);
  }

}

void __58__HUServiceDetailsViewController_initWithServiceLikeItem___block_invoke_143(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v26 = v6;
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@ Setting media account for home with identifier [%@]", buf, 0x16u);

  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setHomeMediaAccount:", v13);
  objc_msgSend(WeakRetained, "detailsItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 56));

  objc_msgSend(WeakRetained, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "numberOfSections");

  if (v17 >= 1)
  {
    objc_msgSend(WeakRetained, "detailsItemManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "diffableDataSourceDisabled");

    if (v19)
    {
      objc_msgSend(WeakRetained, "tableView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "reloadSections:withRowAnimation:", v21, 5);
    }
    else
    {
      objc_msgSend(WeakRetained, "itemManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "itemSectionForSectionIndex:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(WeakRetained, "detailsItemManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "reloadUIRepresentationForSections:withAnimation:", v23, 0);

    }
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(v3, "finishWithNoResult");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HUServiceDetailsViewController accountFuture](self, "accountFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)HUServiceDetailsViewController;
  -[HUServiceDetailsViewController dealloc](&v4, sel_dealloc);
}

- (void)viewWillDismiss
{
  id v2;

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tearDown");

}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  objc_opt_class();
  -[HUServiceDetailsViewController item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (objc_msgSend(v5, "mediaAccessoryItemType") == 4)
  {
    objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "latestResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaProfileContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%p '%@' %@'"), v5, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "appendString:withName:", v11, CFSTR("HFMediaAccessoryItem"));
    objc_msgSend(v6, "build");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HUServiceDetailsViewController;
    -[HUItemTableViewController description](&v14, sel_description);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)HUServiceDetailsViewController;
  -[HUItemTableViewController viewWillAppear:](&v35, sel_viewWillAppear_, a3);
  -[HUServiceDetailsViewController item](self, "item");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_14;
  v5 = (void *)v4;
  -[HUServiceDetailsViewController item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_14;
  v8 = objc_opt_class();
  -[HUServiceDetailsViewController item](self, "item");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v9;
    if (v10)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

  }
  v11 = 0;
LABEL_10:

  if (v11)
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "shouldShowDeviceOptionsForAccessoryItem:", v11);

    if (v15)
    {
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "registerKVO");

    }
  }

LABEL_14:
  -[HUServiceDetailsViewController checkForAccessoriesNeedingReprovisioning](self, "checkForAccessoriesNeedingReprovisioning");
  -[HUServiceDetailsViewController navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "viewControllers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsViewController setCloseButton:](self, "setCloseButton:", v20);

    -[HUServiceDetailsViewController closeButton](self, "closeButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAccessibilityIdentifier:", CFSTR("AccessoryDetails.Close"));

    -[HUServiceDetailsViewController closeButton](self, "closeButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel__closeButtonPressed_, 64);

    v23 = objc_alloc(MEMORY[0x1E0CEA380]);
    -[HUServiceDetailsViewController closeButton](self, "closeButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithCustomView:", v24);
    -[HUServiceDetailsViewController navigationItem](self, "navigationItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setRightBarButtonItem:", v25);

    -[HUServiceDetailsViewController parentViewController](self, "parentViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "navigationItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "titleView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HUServiceDetailsViewController setNavigationBarTitleView:](self, "setNavigationBarTitleView:", v29);
    -[HUServiceDetailsViewController navigationBarTitleView](self, "navigationBarTitleView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsViewController navigationItem](self, "navigationItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTitleView:", v30);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsViewController navigationBarTitleView](self, "navigationBarTitleView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setBackgroundColor:", v32);

    -[HUServiceDetailsViewController navigationController](self, "navigationController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDelegate:", self);

  }
  -[HUServiceDetailsViewController _updateControlStatusText](self, "_updateControlStatusText");
  -[HUServiceDetailsViewController _updateIconDescriptorAnimated:](self, "_updateIconDescriptorAnimated:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)HUServiceDetailsViewController;
  -[HUItemTableViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[HUServiceDetailsViewController setShouldTrackProgrammableSwitchActivations:](self, "setShouldTrackProgrammableSwitchActivations:", 1);
  v4 = (void *)MEMORY[0x1E0D31170];
  v8 = *MEMORY[0x1E0D301D0];
  -[HUServiceDetailsViewController item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:withData:", 33, v6);

  -[HUServiceDetailsViewController _executeSilentSoftwareUpdateCheck](self, "_executeSilentSoftwareUpdateCheck");
  -[HUServiceDetailsViewController _fetchAccessoryDiagnosticInfo](self, "_fetchAccessoryDiagnosticInfo");
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUServiceDetailsViewController;
  -[HUItemTableViewController viewWillDisappear:](&v21, sel_viewWillDisappear_, a3);
  -[HUServiceDetailsViewController item](self, "item");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_14;
  v5 = (void *)v4;
  -[HUServiceDetailsViewController item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_14;
  v8 = objc_opt_class();
  -[HUServiceDetailsViewController item](self, "item");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v9;
    if (v10)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

  }
  v11 = 0;
LABEL_10:

  if (v11)
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "shouldShowDeviceOptionsForAccessoryItem:", v11);

    if (v15)
    {
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "unregisterKVO");

    }
  }

LABEL_14:
  if (-[HUServiceDetailsViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[HUServiceDetailsViewController navigationController](self, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "viewControllers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19 >= 2)
      v20 = -[HUServiceDetailsViewController _commitBuilder](self, "_commitBuilder");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUServiceDetailsViewController;
  -[HUItemTableViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[HUServiceDetailsViewController setShouldTrackProgrammableSwitchActivations:](self, "setShouldTrackProgrammableSwitchActivations:", 0);
  -[HUServiceDetailsViewController nameItemModuleController](self, "nameItemModuleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelNameEdit");

}

- (void)setShouldIncludeRoomNameInHeaderTitle:(BOOL)a3
{
  if (self->_shouldIncludeRoomNameInHeaderTitle != a3)
  {
    self->_shouldIncludeRoomNameInHeaderTitle = a3;
    -[HUServiceDetailsViewController _updateControlStatusText](self, "_updateControlStatusText");
  }
}

- (void)commitChanges
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameModule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nameAndIconItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController textFieldForVisibleItem:](self, "textFieldForVisibleItem:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "isEditing")
    || (objc_msgSend(v9, "endEditing:", 1), objc_msgSend(MEMORY[0x1E0D319D0], "isAMac")))
  {
    v6 = -[HUServiceDetailsViewController _commitBuilder](self, "_commitBuilder");
    -[HUServiceDetailsViewController presentationDelegate](self, "presentationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "finishPresentation:animated:", self, 1);

  }
}

- (id)_commitBuilderFor:(id)a3 with:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
    NSLog(CFSTR("Builder for item '%@' is nil! Aborting commit..."), v6);
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "User committing builder for %@, builder: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend(v7, "commitItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57__HUServiceDetailsViewController__commitBuilderFor_with___block_invoke;
  v21[3] = &unk_1E6F527B0;
  objc_copyWeak(&v23, (id *)buf);
  v11 = v7;
  v22 = v11;
  objc_msgSend(v9, "recover:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __57__HUServiceDetailsViewController__commitBuilderFor_with___block_invoke_2;
  v19[3] = &unk_1E6F4ED68;
  objc_copyWeak(&v20, (id *)buf);
  v13 = (id)objc_msgSend(v12, "addFailureBlock:", v19);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __57__HUServiceDetailsViewController__commitBuilderFor_with___block_invoke_3;
  v17[3] = &unk_1E6F502A0;
  v14 = v6;
  v18 = v14;
  v15 = (id)objc_msgSend(v12, "addSuccessBlock:", v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

  return v12;
}

id __57__HUServiceDetailsViewController__commitBuilderFor_with___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_recoverItemBuilder:fromError:", *(_QWORD *)(a1 + 32), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __57__HUServiceDetailsViewController__commitBuilderFor_with___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  int v4;
  void *v5;
  int v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t *v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(v15, "hf_isHomeKitNamingError");
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = objc_msgSend(WeakRetained, "isItemGroup");
    v7 = (uint64_t *)MEMORY[0x1E0D309E0];
    if (!v6)
      v7 = (uint64_t *)MEMORY[0x1E0D309E8];
    v8 = *v7;
    objc_msgSend(v15, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D305C8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleError:operationType:options:retryBlock:cancelBlock:", v15, v8, v10, 0, 0);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = objc_msgSend(WeakRetained, "isItemGroup");
    v13 = (uint64_t *)MEMORY[0x1E0D309E0];
    if (!v12)
      v13 = (uint64_t *)MEMORY[0x1E0D309E8];
    v14 = *v13;
    objc_msgSend(MEMORY[0x1E0D313A0], "descriptionLocalizationKeyForError:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("HFErrorHandler: [Ignore] Operation: %@ encountered error: %@"), v14, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logError:operationDescription:", v15, v10);
  }

}

void __57__HUServiceDetailsViewController__commitBuilderFor_with___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x1E0D30910];
  v5[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v1, "updateWithOptions:", v2);

}

- (id)_commitBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id location;

  -[HUServiceDetailsViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceLikeBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HUServiceDetailsViewController nameItemModuleController](self, "nameItemModuleController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prepareForCommit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __48__HUServiceDetailsViewController__commitBuilder__block_invoke;
  v21[3] = &unk_1E6F4C610;
  v21[4] = self;
  v12 = (id)objc_msgSend(v10, "addCompletionBlock:", v21);
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __48__HUServiceDetailsViewController__commitBuilder__block_invoke_2;
  v17[3] = &unk_1E6F56C28;
  objc_copyWeak(&v20, &location);
  v13 = v6;
  v18 = v13;
  v14 = v8;
  v19 = v14;
  objc_msgSend(v10, "flatMap:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v15;
}

void __48__HUServiceDetailsViewController__commitBuilder__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightBarButtonItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEnabled:", 1);

}

id __48__HUServiceDetailsViewController__commitBuilder__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_commitBuilderFor:with:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_removeFromGroup
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (id)_removeItem
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id location;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceLikeBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceItem");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (objc_msgSend(v9, "isHomePodMediaSystem"))
    {
      -[HUServiceDetailsViewController setRequiresPresentingViewControllerDismissal:](self, "setRequiresPresentingViewControllerDismissal:", 1);
      -[HUServiceDetailsViewController presentationDelegate](self, "presentationDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "finishPresentation:animated:", self, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HUServiceDetailsViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rightBarButtonItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", 0);

    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sourceItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v18;
      v39 = 2112;
      v40 = v5;
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "Preparing to remove item '%@' using builder '%@'", buf, 0x16u);

    }
    v19 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __45__HUServiceDetailsViewController__removeItem__block_invoke;
    v33[3] = &unk_1E6F56C50;
    v20 = v5;
    v34 = v20;
    objc_copyWeak(&v35, &location);
    v21 = (id)objc_msgSend(v11, "flatMap:", v33);
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsViewController.m"), 596, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("removalFuture"));

    }
    v31[0] = v19;
    v31[1] = 3221225472;
    v31[2] = __45__HUServiceDetailsViewController__removeItem__block_invoke_3;
    v31[3] = &unk_1E6F4E380;
    objc_copyWeak(&v32, &location);
    v22 = (id)objc_msgSend(v11, "addCompletionBlock:", v31);
    v28[0] = v19;
    v28[1] = 3221225472;
    v28[2] = __45__HUServiceDetailsViewController__removeItem__block_invoke_4;
    v28[3] = &unk_1E6F4EBA0;
    objc_copyWeak(&v30, &location);
    v29 = v20;
    v23 = (id)objc_msgSend(v11, "addFailureBlock:", v28);
    if (objc_msgSend(v9, "supportsDirectObliteration"))
    {
      v27[0] = v19;
      v27[1] = 3221225472;
      v27[2] = __45__HUServiceDetailsViewController__removeItem__block_invoke_2_200;
      v27[3] = &unk_1E6F502A0;
      v27[4] = self;
      v24 = (id)objc_msgSend(v11, "addSuccessBlock:", v27);
    }

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v35);

  }
  else
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sourceItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Builder for item '%@' is nil! Aborting remove..."), v13);

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_destroyWeak(&location);
  return v11;
}

id __45__HUServiceDetailsViewController__removeItem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeItemFromHome");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HUServiceDetailsViewController__removeItem__block_invoke_2;
  v7[3] = &unk_1E6F527B0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "recover:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  return v5;
}

id __45__HUServiceDetailsViewController__removeItem__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_recoverItemBuilder:fromError:", *(_QWORD *)(a1 + 32), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __45__HUServiceDetailsViewController__removeItem__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "rightBarButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

}

void __45__HUServiceDetailsViewController__removeItem__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "detailsItemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sourceItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Failed to remove item '%@' using builder '%@': %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__HUServiceDetailsViewController__removeItem__block_invoke_199;
  v10[3] = &unk_1E6F4DD08;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  objc_msgSend(v5, "handleError:retryBlock:cancelBlock:", v3, v10, 0);

  objc_destroyWeak(&v11);
}

void __45__HUServiceDetailsViewController__removeItem__block_invoke_199(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "_removeItem");

}

void __45__HUServiceDetailsViewController__removeItem__block_invoke_2_200(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "detailsItemManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resetAccessory");

}

- (void)_restartHomePod
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  HUServiceDetailsViewController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped restart HomePod", (uint8_t *)&v7, 0x16u);

  }
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "restartAccessory");

}

- (void)_updateCheckedStateForAssociatedServiceTypeCell:(id)a3 item:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "showAssociatedServiceTypeList") & 1) != 0)
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedAssociatedServiceTypeItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setChecked:", objc_msgSend(v9, "isEqual:", v6));

  }
  else
  {
    objc_msgSend(v10, "setChecked:", 0);
  }

}

- (void)addRoomButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HUEditRoomViewController *v7;
  void *v8;
  id v9;

  v4 = objc_alloc(MEMORY[0x1E0D31700]);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "initWithExistingObject:inHome:", 0, v6);

  v7 = -[HUEditRoomViewController initWithRoomBuilder:presentationDelegate:addRoomDelegate:]([HUEditRoomViewController alloc], "initWithRoomBuilder:presentationDelegate:addRoomDelegate:", v9, self, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v7);
  objc_msgSend(v8, "setModalPresentationStyle:", 2);
  -[HUServiceDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

- (HFServiceLikeItem)item
{
  void *v2;
  void *v3;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFServiceLikeItem *)v3;
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return 0;
}

- (void)_updateControlStatusText
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
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
  int v18;
  void *v19;
  id v20;

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerItem");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HUServiceDetailsViewController item](self, "item");
    v5 = objc_claimAutoreleasedReturnValue();

    v20 = (id)v5;
  }
  -[HUServiceDetailsViewController navigationBarTitleView](self, "navigationBarTitleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "summaryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config") & 1) == 0)
  {
    objc_msgSend(v20, "latestResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsViewController _primaryStatusTextForLatestResults:showingSecondaryStatus:](self, "_primaryStatusTextForLatestResults:showingSecondaryStatus:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPrimaryText:", v9);

    objc_msgSend(v20, "latestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsViewController _secondaryStatusTextForLatestResults:](self, "_secondaryStatusTextForLatestResults:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v7;
      v13 = v11;
LABEL_6:
      objc_msgSend(v12, "setSecondaryText:", v13);
LABEL_11:

      goto LABEL_12;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sourceItemAccessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_siriEndpointProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else
    {
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "sourceItemIsHomePod");

      if (!v18)
      {
        v12 = v7;
        v13 = 0;
        goto LABEL_6;
      }
    }
    -[HUServiceDetailsViewController _microphoneStatus](self, "_microphoneStatus");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMicrophoneStatusText:", v19);

    goto LABEL_11;
  }
LABEL_12:

}

- (void)_updateIconDescriptorAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HUBaseIconViewConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  -[HUServiceDetailsViewController item](self, "item");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
  {
    objc_msgSend(v17, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E80]);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (HUBaseIconViewConfiguration *)v8;

    }
    else
    {
      objc_msgSend(v17, "latestResults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
      v9 = (HUBaseIconViewConfiguration *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_7;
    }
    if (-[HUBaseIconViewConfiguration integerValue](v9, "integerValue") != 2)
    {
      if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials") & 1) != 0)
        v14 = 2;
      else
        v14 = 3;
      goto LABEL_11;
    }
LABEL_7:
    v14 = 1;
LABEL_11:
    -[HUServiceDetailsViewController navigationBarTitleView](self, "navigationBarTitleView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "summaryView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "iconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "updateWithIconDescriptor:displayStyle:animated:", v6, v14, v3);
    goto LABEL_12;
  }
  v9 = -[HUBaseIconViewConfiguration initWithItem:appearance:]([HUBaseIconViewConfiguration alloc], "initWithItem:appearance:", v17, 3);
  -[HUServiceDetailsViewController navigationBarTitleView](self, "navigationBarTitleView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "summaryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "baseIconView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConfiguration:", v9);

LABEL_12:
}

- (id)_primaryStatusTextForLatestResults:(id)a3 showingSecondaryStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v17 = 136315650;
    v18 = "-[HUServiceDetailsViewController _primaryStatusTextForLatestResults:showingSecondaryStatus:]";
    v19 = 2112;
    v20 = v6;
    v21 = 1024;
    v22 = v4;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_INFO, "%s %@ %d", (uint8_t *)&v17, 0x1Cu);
  }

  if (v4
    || (objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C18]),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    && (objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C40]),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = *MEMORY[0x1E0D30CD8];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CD8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (!v11)
    {
      -[HUServiceDetailsViewController item](self, "item");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "latestResults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v8);
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v14;
    }
    if (-[HUServiceDetailsViewController shouldIncludeRoomNameInHeaderTitle](self, "shouldIncludeRoomNameInHeaderTitle"))
    {
      objc_msgSend(v9, "composedString");
    }
    else
    {
      objc_msgSend(v9, "serviceName");
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BC0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v15;
}

- (id)_secondaryStatusTextForLatestResults:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C10]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BC0]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v4;
}

- (id)_microphoneStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;

  v3 = (void *)objc_opt_new();
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceItemAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_mediaAccessoryCommonSettingsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceItemAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_siriEndpointProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "manuallyDisabled");

  objc_msgSend(v7, "settingValueForKeyPath:", *MEMORY[0x1E0D301B8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  -[HUServiceDetailsViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "effectiveUserInterfaceLayoutDirection");

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "sourceItemIsHomePod");

  if (v17)
  {
    objc_opt_class();
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sourceItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    v22 = objc_msgSend(v21, "isSiriDisabled");
    v13 = v22 ^ 1;
  }
  if ((v11 | v13 ^ 1) == 1)
  {
    if ((v11 & 1) != 0)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUSiriEndpoint_MicrophoneOff"), CFSTR("HUSiriEndpoint_MicrophoneOff"), 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "home");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedSiriTriggerPhrase(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUSiriEndpoint_HeySiriTurnedOff"), CFSTR("%@"), v27, v28, v29, v30, v31, v32, (uint64_t)v26);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v23);
    v34 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%1s"), ");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v34, "initWithString:", v35);

    v37 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "hu_mutedMicrophoneImageWithTintColor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)objc_opt_new();
    objc_msgSend(v40, "setImage:", v39);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v40);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v41;
    if (v15 == 1)
      v43 = v33;
    else
      v43 = (void *)v41;
    if (v15 == 1)
      v44 = (void *)v41;
    else
      v44 = v33;
    objc_msgSend(v3, "appendAttributedString:", v43);
    objc_msgSend(v3, "appendAttributedString:", v36);
    objc_msgSend(v3, "appendAttributedString:", v44);

  }
  return v3;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  HUNameItemModuleController *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  HUAssociatedSceneAndTriggerModuleController *v25;
  void *v26;
  HUAvailableRelatedTriggerItemModuleController *v27;
  void *v28;
  void *v29;
  HUMatterConnectedServicesItemModuleController *v30;

  v5 = a3;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nameModule");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    v18 = -[HUNameItemModuleController initWithModule:host:]([HUNameItemModuleController alloc], "initWithModule:host:", v5, self);
    -[HUServiceDetailsViewController setNameItemModuleController:](self, "setNameItemModuleController:", v18);

    -[HUServiceDetailsViewController nameItemModuleController](self, "nameItemModuleController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNameFieldHasClearButton:", 1);

    if (_os_feature_enabled_impl())
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "home");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "hf_currentUserIsRestrictedGuest") ^ 1;
      -[HUServiceDetailsViewController nameItemModuleController](self, "nameItemModuleController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setNameFieldHasClearButton:", v22);

    }
    -[HUServiceDetailsViewController nameItemModuleController](self, "nameItemModuleController");
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryRepresentableItemModule");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v5)
  {
    -[HUServiceDetailsViewController createAccessoryDetailInfoListModuleControllerWith:](self, "createAccessoryDetailInfoListModuleControllerWith:", v5);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v17 = (void *)v24;
    goto LABEL_15;
  }
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sceneAndTriggerModule");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v5)
  {
    v25 = -[HUItemModuleController initWithModule:]([HUAssociatedSceneAndTriggerModuleController alloc], "initWithModule:", v5);
    -[HUServiceDetailsViewController setSceneAndTriggerModuleController:](self, "setSceneAndTriggerModuleController:", v25);

    -[HUServiceDetailsViewController sceneAndTriggerModuleController](self, "sceneAndTriggerModuleController");
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "relatedTriggerItemModule");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v5)
  {
    -[HUServiceDetailsViewController associatedTriggerModuleController](self, "associatedTriggerModuleController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[HUAvailableRelatedTriggerItemModuleController initWithModule:]([HUAvailableRelatedTriggerItemModuleController alloc], "initWithModule:", v5);
    -[HUServiceDetailsViewController setAssociatedTriggerModuleController:](self, "setAssociatedTriggerModuleController:", v27);

    -[HUServiceDetailsViewController associatedTriggerModuleController](self, "associatedTriggerModuleController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHost:", self);

    -[HUServiceDetailsViewController associatedTriggerModuleController](self, "associatedTriggerModuleController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "updatePresentedViewControllerForNewModuleController:", v29);

    -[HUServiceDetailsViewController associatedTriggerModuleController](self, "associatedTriggerModuleController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "connectedServicesItemModule");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v5)
  {
    v30 = -[HUItemModuleController initWithModule:]([HUMatterConnectedServicesItemModuleController alloc], "initWithModule:", v5);
    -[HUServiceDetailsViewController setConnectedServicesItemModuleController:](self, "setConnectedServicesItemModuleController:", v30);

    -[HUServiceDetailsViewController connectedServicesItemModuleController](self, "connectedServicesItemModuleController");
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsViewController.m"), 846, CFSTR("Unexpected module %@"), v5);

  v17 = 0;
LABEL_15:

  return v17;
}

- (id)itemModuleControllers
{
  HUHomeKitAccessorySettingsItemModuleController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HUAvailableRelatedTriggerItemModuleController *v8;
  void *v9;
  void *v10;
  HUAvailableRelatedTriggerItemModuleController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HUAccessorySettingsItemModuleController *v16;
  void *v17;
  HUAccessorySettingsItemModuleController *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  HUHomeKitAccessorySettingsItemModuleController *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  HUSoftwareUpdateItemModuleController *v49;
  void *v50;
  HUSoftwareUpdateItemModuleController *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  HUChildServiceItemModuleController *v56;
  void *v57;
  void *v58;
  void *v59;
  HUChildServiceItemModuleController *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  HUTelevisionSettingsItemModuleController *v65;
  void *v66;
  HUTelevisionSettingsItemModuleController *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  char v75;
  HUChildServiceItemModuleController *v76;
  void *v77;
  void *v79;
  HUHomeKitAccessorySettingsItemModuleController *v80;
  HUHomeKitAccessorySettingsItemModuleController *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  objc_super v86;
  uint8_t buf[4];
  HUHomeKitAccessorySettingsItemModuleController *v88;
  __int16 v89;
  id v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v3 = (HUHomeKitAccessorySettingsItemModuleController *)objc_opt_new();
  v86.receiver = self;
  v86.super_class = (Class)HUServiceDetailsViewController;
  -[HUItemTableViewController itemModuleControllers](&v86, sel_itemModuleControllers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeKitAccessorySettingsItemModuleController unionSet:](v3, "unionSet:", v4);

  -[HUServiceDetailsViewController associatedTriggerModuleController](self, "associatedTriggerModuleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relatedTriggerItemModule");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_5;
    v8 = [HUAvailableRelatedTriggerItemModuleController alloc];
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "relatedTriggerItemModule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HUAvailableRelatedTriggerItemModuleController initWithModule:](v8, "initWithModule:", v10);
    -[HUServiceDetailsViewController setAssociatedTriggerModuleController:](self, "setAssociatedTriggerModuleController:", v11);

    -[HUServiceDetailsViewController associatedTriggerModuleController](self, "associatedTriggerModuleController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHost:", self);
  }

LABEL_5:
  -[HUServiceDetailsViewController associatedTriggerModuleController](self, "associatedTriggerModuleController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeKitAccessorySettingsItemModuleController na_safeAddObject:](v3, "na_safeAddObject:", v12);

  -[HUServiceDetailsViewController accessorySettingsItemModuleController](self, "accessorySettingsItemModuleController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accessorySettingsItemModule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_9;
    v16 = [HUAccessorySettingsItemModuleController alloc];
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessorySettingsItemModule");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HUAccessorySettingsItemModuleController initWithModule:delegate:](v16, "initWithModule:delegate:", v17, self);
    -[HUServiceDetailsViewController setAccessorySettingsItemModuleController:](self, "setAccessorySettingsItemModuleController:", v18);

  }
LABEL_9:
  -[HUServiceDetailsViewController accessorySettingsItemModuleController](self, "accessorySettingsItemModuleController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeKitAccessorySettingsItemModuleController na_safeAddObject:](v3, "na_safeAddObject:", v19);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "homeKitAccessorySettingsModules");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v81 = v3;
    HFLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "homeKitAccessorySettingsModules");
      v80 = (HUHomeKitAccessorySettingsItemModuleController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v88 = v80;
      _os_log_debug_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEBUG, "Creating Item Module Controllers from  homeKitAccessorySettingsModules = [%@]", buf, 0xCu);

    }
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "homeKitAccessorySettingsModules");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v83;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v83 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v28);
          objc_opt_class();
          v30 = v29;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v31 = v30;
          else
            v31 = 0;
          v32 = v31;

          if (v32)
          {
            -[HUServiceDetailsViewController moduleToModuleControllerMap](self, "moduleToModuleControllerMap");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectForKey:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v34)
            {
              v35 = -[HUHomeKitAccessorySettingsItemModuleController initWithModule:delegate:]([HUHomeKitAccessorySettingsItemModuleController alloc], "initWithModule:delegate:", v32, self);
              -[HUServiceDetailsViewController moduleToModuleControllerMap](self, "moduleToModuleControllerMap");
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v36)
              {
                objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[HUServiceDetailsViewController setModuleToModuleControllerMap:](self, "setModuleToModuleControllerMap:", v37);

              }
              HFLogForCategory();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v88 = v35;
                v89 = 2112;
                v90 = v32;
                _os_log_debug_impl(&dword_1B8E1E000, v38, OS_LOG_TYPE_DEBUG, "Setting moduleController = [%@] for Module = [%@] in moduleToModuleControllerMap", buf, 0x16u);
              }

              -[HUServiceDetailsViewController moduleToModuleControllerMap](self, "moduleToModuleControllerMap");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setObject:forKey:", v35, v32);

            }
          }

          ++v28;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
      }
      while (v26);
    }

    -[HUServiceDetailsViewController moduleToModuleControllerMap](self, "moduleToModuleControllerMap");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectEnumerator");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "nextObject");
    v42 = objc_claimAutoreleasedReturnValue();
    v3 = v81;
    if (v42)
    {
      v43 = (void *)v42;
      do
      {
        -[HUHomeKitAccessorySettingsItemModuleController na_safeAddObject:](v81, "na_safeAddObject:", v43);
        objc_msgSend(v41, "nextObject");
        v44 = objc_claimAutoreleasedReturnValue();

        v43 = (void *)v44;
      }
      while (v44);
    }

  }
  HFLogForCategory();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v88 = v3;
    _os_log_debug_impl(&dword_1B8E1E000, v45, OS_LOG_TYPE_DEBUG, "itemModuleControllers = [%@]", buf, 0xCu);
  }

  -[HUServiceDetailsViewController softwareUpdateItemModuleController](self, "softwareUpdateItemModuleController");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
    goto LABEL_38;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "softwareUpdateItemModule");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    v49 = [HUSoftwareUpdateItemModuleController alloc];
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "softwareUpdateItemModule");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[HUSoftwareUpdateItemModuleController initWithModule:delegate:expandableTextViewCellDelegate:](v49, "initWithModule:delegate:expandableTextViewCellDelegate:", v50, self, self);
    -[HUServiceDetailsViewController setSoftwareUpdateItemModuleController:](self, "setSoftwareUpdateItemModuleController:", v51);

LABEL_38:
  }
  -[HUServiceDetailsViewController softwareUpdateItemModuleController](self, "softwareUpdateItemModuleController");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeKitAccessorySettingsItemModuleController na_safeAddObject:](v3, "na_safeAddObject:", v52);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "valveEditorItemModule");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[HUServiceDetailsViewController valveEditorItemModuleController](self, "valveEditorItemModuleController");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v55)
    {
      v56 = -[HUChildServiceItemModuleController initWithModule:delegate:]([HUChildServiceItemModuleController alloc], "initWithModule:delegate:", v54, self);
      -[HUServiceDetailsViewController setValveEditorItemModuleController:](self, "setValveEditorItemModuleController:", v56);

    }
  }
  -[HUServiceDetailsViewController valveEditorItemModuleController](self, "valveEditorItemModuleController");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeKitAccessorySettingsItemModuleController na_safeAddObject:](v3, "na_safeAddObject:", v57);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "accessoryServicesEditorItemModule");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    -[HUServiceDetailsViewController accessoryServicesEditorItemModuleController](self, "accessoryServicesEditorItemModuleController");
    v60 = (HUChildServiceItemModuleController *)objc_claimAutoreleasedReturnValue();
    if (!v60)
    {
      if (!-[HUServiceDetailsViewController isMultiServiceAccessory](self, "isMultiServiceAccessory"))
        goto LABEL_47;
      v60 = -[HUChildServiceItemModuleController initWithModule:delegate:]([HUChildServiceItemModuleController alloc], "initWithModule:delegate:", v59, self);
      -[HUServiceDetailsViewController setAccessoryServicesEditorItemModuleController:](self, "setAccessoryServicesEditorItemModuleController:", v60);
    }

  }
LABEL_47:
  -[HUServiceDetailsViewController accessoryServicesEditorItemModuleController](self, "accessoryServicesEditorItemModuleController");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeKitAccessorySettingsItemModuleController na_safeAddObject:](v3, "na_safeAddObject:", v61);

  -[HUServiceDetailsViewController televisionSettingsItemModuleController](self, "televisionSettingsItemModuleController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
  {
LABEL_50:

    goto LABEL_51;
  }
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "televisionSettingsItemModule");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    v65 = [HUTelevisionSettingsItemModuleController alloc];
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "televisionSettingsItemModule");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = -[HUItemModuleController initWithModule:](v65, "initWithModule:", v66);
    -[HUServiceDetailsViewController setTelevisionSettingsItemModuleController:](self, "setTelevisionSettingsItemModuleController:", v67);

    goto LABEL_50;
  }
LABEL_51:
  -[HUServiceDetailsViewController televisionSettingsItemModuleController](self, "televisionSettingsItemModuleController");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeKitAccessorySettingsItemModuleController na_safeAddObject:](v3, "na_safeAddObject:", v68);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "inputSourceItemModule");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    -[HUServiceDetailsViewController inputSourceItemModuleController](self, "inputSourceItemModuleController");
    v71 = objc_claimAutoreleasedReturnValue();
    if (!v71)
      goto LABEL_54;
    v72 = (void *)v71;
    -[HUServiceDetailsViewController inputSourceItemModuleController](self, "inputSourceItemModuleController");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "module");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "isEqual:", v70);

    if ((v75 & 1) == 0)
    {
LABEL_54:
      v76 = -[HUChildServiceItemModuleController initWithModule:delegate:]([HUChildServiceItemModuleController alloc], "initWithModule:delegate:", v70, self);
      -[HUServiceDetailsViewController setInputSourceItemModuleController:](self, "setInputSourceItemModuleController:", v76);

    }
  }
  -[HUServiceDetailsViewController inputSourceItemModuleController](self, "inputSourceItemModuleController");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeKitAccessorySettingsItemModuleController na_safeAddObject:](v3, "na_safeAddObject:", v77);

  return v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
    goto LABEL_8;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "splitMediaAccountTitleItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "isEqual:", v10);

  if (v11)
    goto LABEL_8;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "splitMediaAccountUseDefaultAccountItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v13))
    goto LABEL_6;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "splitMediaAccountSignoutAccountItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v5, "isEqual:", v15);

  if (v16)
    goto LABEL_8;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "favoriteItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v13))
    goto LABEL_6;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "showInHomeDashboardItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v5, "isEqual:", v20);

  if (!v21)
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pairingModeItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v5, "isEqual:", v23);

    if (!v24)
    {
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "exportDiagnosticsItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v5, "isEqual:", v26);

      if (!v27)
      {
        -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "removeFromGroupItem");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v5, "isEqual:", v29);

        if (!v30)
        {
          -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "removeItem");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v5, "isEqual:", v32);

          if (!v33)
          {
            -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "resetItem");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v5, "isEqual:", v35);

            if (!v36)
            {
              -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "restartItem");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v5, "isEqual:", v38);

              if (!v39)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[HUServiceDetailsViewController controlPanelController](self, "controlPanelController");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "cellClassForItem:", v5);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_9;
                }
                -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v41, "isCharacteristicStateItem:", v5);

                if (!v42)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
                        v12 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v12, "addGroupItem");
                        v13 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((objc_msgSend(v5, "isEqual:", v13) & 1) != 0)
                        {
LABEL_6:

                          goto LABEL_8;
                        }
                        -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v43, "createNewRoomItem");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((objc_msgSend(v5, "isEqual:", v44) & 1) == 0)
                        {
                          -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v45, "separateTileItem");
                          v46 = (void *)objc_claimAutoreleasedReturnValue();
                          if ((objc_msgSend(v5, "isEqual:", v46) & 1) == 0)
                          {
                            -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
                            v64 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v64, "collectDiagnosticsItem");
                            v47 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((objc_msgSend(v5, "isEqual:", v47) & 1) == 0)
                            {
                              -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
                              v62 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v62, "identifyHomePodItem");
                              v48 = (void *)objc_claimAutoreleasedReturnValue();
                              v63 = objc_msgSend(v5, "isEqual:", v48);

                              if ((v63 & 1) != 0)
                                goto LABEL_8;
                              -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
                              v49 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v49, "roomItem");
                              v50 = (void *)objc_claimAutoreleasedReturnValue();
                              v51 = objc_msgSend(v5, "isEqual:", v50);

                              if (v51)
                              {
                                objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom");
                                goto LABEL_8;
                              }
                              -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
                              v52 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v52, "roomListItem");
                              v53 = (void *)objc_claimAutoreleasedReturnValue();
                              v54 = objc_msgSend(v5, "isEqual:", v53);

                              if (v54)
                                goto LABEL_8;
                              -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
                              v12 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v12, "cameraStatusLightItem");
                              v13 = (void *)objc_claimAutoreleasedReturnValue();
                              if ((objc_msgSend(v5, "isEqual:", v13) & 1) != 0)
                                goto LABEL_6;
                              -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
                              v43 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v43, "cameraNightModeItem");
                              v44 = (void *)objc_claimAutoreleasedReturnValue();
                              if ((objc_msgSend(v5, "isEqual:", v44) & 1) == 0)
                              {
                                -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
                                v55 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v55, "cameraDoorbellChimeMuteItem");
                                v56 = (void *)objc_claimAutoreleasedReturnValue();
                                v57 = objc_msgSend(v5, "isEqual:", v56);

                                if ((v57 & 1) == 0)
                                {
                                  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
                                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v58, "lockAddHomeKeyToWalletItem");
                                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                                  v60 = objc_msgSend(v5, "isEqual:", v59);

                                  if (!v60)
                                  {
                                    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
                                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v61, "supportsWiFiStrengthDisplay:", v5);

                                  }
                                }
                                goto LABEL_8;
                              }
                              goto LABEL_39;
                            }

                          }
                        }
LABEL_39:

                        goto LABEL_6;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_8:
  objc_opt_class();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return (Class)v17;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  char isKindOfClass;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
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
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  char v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  void *v78;
  char v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;

  v83 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HUServiceDetailsViewController _setupProgrammableSwitchCell:forItem:](self, "_setupProgrammableSwitchCell:forItem:", v83, v7);
  }
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "splitMediaAccountTitleItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 != v7)
  {

LABEL_11:
    goto LABEL_12;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    v11 = v83;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v8 = v12;

    objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB568], 32770);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitleFont:", v13);

    objc_msgSend(v8, "setMaxNumberOfTitleLines:", 0);
    objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB558], 0x8000);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDescriptionFont:", v14);

    objc_msgSend(v8, "setMaxNumberOfDescriptionLines:", 0);
    objc_msgSend(v8, "setHideIcon:", 1);
    objc_msgSend(v8, "setSelectionStyle:", 0);
    goto LABEL_11;
  }
LABEL_12:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "roomItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v7, "isEqual:", v16);

    if (v17)
    {
      objc_opt_class();
      v18 = v83;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      objc_msgSend(v20, "setItem:", v7);
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "serviceLikeBuilder");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "room");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "room");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "uniqueIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        v27 = v25;
      }
      else
      {
        -[HUServiceDetailsViewController item](self, "item");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "accessories");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "anyObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "room");
        v82 = v20;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "uniqueIdentifier");
        v27 = (id)objc_claimAutoreleasedReturnValue();

        v20 = v82;
      }

      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "orderedRoomSectionItems");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __62__HUServiceDetailsViewController_setupCell_forItem_indexPath___block_invoke;
      v84[3] = &unk_1E6F4DAD8;
      v85 = v27;
      v32 = v27;
      objc_msgSend(v31, "na_firstObjectPassingTest:", v84);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "orderedRoomSectionItems");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v35, "copy");
      -[HUServiceDetailsViewController _createMenuWithValues:cell:currentItem:](self, "_createMenuWithValues:cell:currentItem:", v36, v20, v33);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "button");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setMenu:", v37);

    }
  }
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "roomListItem");
  v40 = (id)objc_claimAutoreleasedReturnValue();

  if (v40 == v7)
  {
    objc_opt_class();
    v70 = v83;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v71 = v70;
    else
      v71 = 0;
    v50 = v71;

    objc_msgSend(v50, "setDelegate:", self);
    goto LABEL_61;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v41 = v83;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = v41;
    else
      v42 = 0;
    v43 = v42;

    -[HUServiceDetailsViewController traitCollection](self, "traitCollection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    _UITableViewDefaultSectionCornerRadiusForTraitCollection();
    objc_msgSend(v43, "_setCornerRadius:");

    -[HUServiceDetailsViewController textViewDelegate](self, "textViewDelegate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "messageTextView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setDelegate:", v45);

    objc_msgSend(v43, "actionButton");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "removeTarget:action:forControlEvents:", self, sel_didSelectHeaderWarningAction_, 64);

    objc_msgSend(v43, "actionButton");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "addTarget:action:forControlEvents:", self, sel_didSelectHeaderWarningAction_, 64);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HUServiceDetailsViewController controlPanelController](self, "controlPanelController");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setupCell:forItem:", v83, v7);

      objc_opt_class();
      v50 = v83;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v51 = v50;
      else
        v51 = 0;
      v52 = v51;

      if (v52)
      {
        -[HUServiceDetailsViewController expandedControlPanelItems](self, "expandedControlPanelItems");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setWheelViewVisible:", objc_msgSend(v53, "containsObject:", v7));

      }
      else
      {
        v50 = 0;
      }
LABEL_61:

      goto LABEL_62;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v54 = v83;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v55 = v54;
      else
        v55 = 0;
      v56 = v55;

      objc_msgSend(v56, "setValueColorFollowsTintColor:", -[HUServiceDetailsViewController _shouldFollowTitleValueTintColorforItem:](self, "_shouldFollowTitleValueTintColorforItem:", v7));
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "accessoryInfoItemProvider");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "items");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setAllowCopyValueToPasteboard:", objc_msgSend(v59, "containsObject:", v7));

    }
    v50 = v83;
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "pairingModeItem");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v7, "isEqual:", v61);

    if (v62)
      objc_msgSend(v50, "setDestructive:", 0);
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "removeItem");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v7, "isEqual:", v64);

    if (v65)
      objc_msgSend(v50, "setDestructive:", 1);
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "resetItem");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v67) & 1) != 0)
    {
      -[HUServiceDetailsViewController item](self, "item");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v69 = objc_opt_isKindOfClass();

      if ((v69 & 1) != 0)
        objc_msgSend(v50, "setDestructive:", 0);
    }
    else
    {

    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "restartItem");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v73) & 1) != 0)
    {
      -[HUServiceDetailsViewController item](self, "item");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v75 = objc_opt_isKindOfClass();

      if ((v75 & 1) != 0)
        objc_msgSend(v50, "setDestructive:", 0);
    }
    else
    {

    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "exportDiagnosticsItem");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v77) & 1) != 0)
    {
      -[HUServiceDetailsViewController item](self, "item");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v79 = objc_opt_isKindOfClass();

      if ((v79 & 1) != 0)
        objc_msgSend(v50, "setDestructive:", 0);
    }
    else
    {

    }
    objc_msgSend(v50, "setAccessoryType:", -[HUServiceDetailsViewController _shouldShowDetailDisclosureForItem:](self, "_shouldShowDetailDisclosureForItem:", v7));
    objc_msgSend(v50, "setHideIcon:", 1);
    goto LABEL_61;
  }
LABEL_62:

}

uint64_t __62__HUServiceDetailsViewController_setupCell_forItem_indexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (BOOL)_shouldFollowTitleValueTintColorforItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  BOOL v15;

  v4 = a3;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryInfoItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v4);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isCharacteristicStateItem:", v4);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homeTheaterAudioOutputItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "managedConfigurationProfilesItem");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  if ((v8 & 1) == 0 && (v10 & 1) == 0)
    v15 = v12 != v4 && v14 != v4;

  return v15;
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
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
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
  void *v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  int v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  char v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id v94;
  objc_super v95;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v95.receiver = self;
  v95.super_class = (Class)HUServiceDetailsViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v95, sel_updateCell_forItem_indexPath_animated_, v10, v11, v12, v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HUServiceDetailsViewController _setupProgrammableSwitchCell:forItem:](self, "_setupProgrammableSwitchCell:forItem:", v10, v11);
      goto LABEL_20;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HUServiceDetailsViewController controlPanelController](self, "controlPanelController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "updateCell:forItem:animated:", v10, v11, v6);

      goto LABEL_20;
    }
  }
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "favoriteItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", v15) & 1) != 0)
    goto LABEL_14;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "showInHomeDashboardItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", v17) & 1) != 0)
  {
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  v90 = v12;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cameraStatusLightItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", v19) & 1) != 0)
  {
LABEL_12:

    v12 = v90;
    goto LABEL_13;
  }
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "cameraNightModeItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", v20) & 1) != 0)
  {

    goto LABEL_12;
  }
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "cameraDoorbellChimeMuteItem");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v11, "isEqual:", v82);

  v12 = v90;
  if ((v86 & 1) == 0)
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isCharacteristicStateItem:", v11);

    if (v25)
    {
      objc_msgSend(v11, "latestResults");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
      v27 = (id)objc_claimAutoreleasedReturnValue();

      -[HUItemTableViewController itemManager](self, "itemManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "displayedItemsInSection:", objc_msgSend(v90, "section"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

      if (v30 >= 2)
      {
        objc_msgSend(v11, "latestResults");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C58]);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        if (v32)
          v34 = (void *)v32;
        else
          v34 = v27;
        v35 = v34;

        v27 = v35;
      }
      v36 = v10;
      objc_msgSend(v36, "setTitleText:", v27);
      objc_msgSend(v11, "latestResults");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithAttributes:", MEMORY[0x1E0C9AA70]);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "string");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setValueText:", v40);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          NSLog(CFSTR("Wrong cell class"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_20;
        v27 = v10;
        objc_msgSend(v11, "latestResults");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "textLabel");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setText:", v42);

        objc_msgSend(v11, "latestResults");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setAccessibilityIdentifier:", v45);

        -[HUServiceDetailsViewController _updateCheckedStateForAssociatedServiceTypeCell:item:](self, "_updateCheckedStateForAssociatedServiceTypeCell:item:", v27, v11);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v89 = v10;
          -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "serviceLikeBuilder");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "room");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "room");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "uniqueIdentifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if (v50)
          {
            v52 = v50;
          }
          else
          {
            -[HUServiceDetailsViewController item](self, "item");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "accessories");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "anyObject");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "room");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "uniqueIdentifier");
            v83 = objc_claimAutoreleasedReturnValue();

            v12 = v90;
            v52 = (id)v83;

          }
          -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "orderedRoomSectionItems");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v93[0] = MEMORY[0x1E0C809B0];
          v93[1] = 3221225472;
          v93[2] = __72__HUServiceDetailsViewController_updateCell_forItem_indexPath_animated___block_invoke;
          v93[3] = &unk_1E6F56C78;
          v67 = v52;
          v94 = v67;
          v68 = objc_msgSend(v66, "indexOfObjectPassingTest:", v93);

          if ((v68 & 0x8000000000000000) == 0
            && v68 < -[HUServiceDetailsViewController numberOfValuesForPickerViewCell:](self, "numberOfValuesForPickerViewCell:", v89))
          {
            objc_msgSend(v89, "setSelectedIndex:animated:", v68, 0);
          }

          goto LABEL_20;
        }
        -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "canToggleAccessoryInfoItem:", v11);

        if (v54)
        {
          objc_msgSend(v10, "setSelectionStyle:", 0);
          goto LABEL_20;
        }
        -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "lockAddHomeKeyToWalletItem");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v11, "isEqual:", v56);

        if (v57)
        {
          objc_msgSend(MEMORY[0x1E0CEA718], "valueCellConfiguration");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "latestResults");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setText:", v59);

          objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "textProperties");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setColor:", v60);

          objc_msgSend(MEMORY[0x1E0CEA638], "hu_walletAppIconImage");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setImage:", v62);

          objc_msgSend(v10, "setContentConfiguration:", v22);
          goto LABEL_19;
        }
        -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "exportDiagnosticsItem");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v11, "isEqual:", v70);

        if (!v71)
          goto LABEL_20;
        objc_opt_class();
        v72 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v73 = v72;
        else
          v73 = 0;
        v27 = v73;

        objc_msgSend(v11, "latestResults");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B10]);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (v75)
          v76 = objc_msgSend(v75, "isFinished") ^ 1;
        else
          v76 = 0;
        objc_opt_class();
        objc_msgSend(v27, "accessoryView");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v78 = v77;
        else
          v78 = 0;
        v79 = v78;

        if (v76)
        {
          if (v79)
          {
            v80 = v77;

            objc_msgSend(v27, "setDisabled:", 1);
            objc_msgSend(v80, "startAnimating");
            -[HUServiceDetailsViewController _registerButtonActionHandler:item:](self, "_registerButtonActionHandler:item:", v75, v11);
            v79 = v80;
          }
          else
          {
            v91[0] = MEMORY[0x1E0C809B0];
            v91[1] = 3221225472;
            v91[2] = __72__HUServiceDetailsViewController_updateCell_forItem_indexPath_animated___block_invoke_2;
            v91[3] = &unk_1E6F56CA0;
            v81 = v27;
            v92 = v81;
            __72__HUServiceDetailsViewController_updateCell_forItem_indexPath_animated___block_invoke_2((uint64_t)v91);
            v79 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "setDisabled:", 1);
            objc_msgSend(v79, "startAnimating");
            -[HUServiceDetailsViewController _registerButtonActionHandler:item:](self, "_registerButtonActionHandler:item:", v75, v11);

          }
        }
        else
        {
          objc_msgSend(v27, "setDisabled:", 0);
          objc_msgSend(v79, "stopAnimating");
        }

      }
    }

    goto LABEL_20;
  }
LABEL_15:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Wrong cell class"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v10;
    objc_msgSend(v21, "setDelegate:", self);
    objc_msgSend(v11, "latestResults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAccessibilityIdentifier:", v23);

LABEL_19:
  }
LABEL_20:

}

uint64_t __72__HUServiceDetailsViewController_updateCell_forItem_indexPath_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

id __72__HUServiceDetailsViewController_updateCell_forItem_indexPath_animated___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryView:", v2);
  return v2;
}

- (void)_registerButtonActionHandler:(id)a3 item:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void (**v13)(_QWORD);
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id from;
  _QWORD aBlock[4];
  id v25;
  id v26[2];
  id location;

  v7 = a3;
  v8 = a4;
  -[HUServiceDetailsViewController registeredButtonFutures](self, "registeredButtonFutures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if ((v10 & 1) == 0)
  {
    objc_initWeak(&location, self);
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__HUServiceDetailsViewController__registerButtonActionHandler_item___block_invoke;
    aBlock[3] = &unk_1E6F56CC8;
    objc_copyWeak(v26, &location);
    v25 = v8;
    v26[1] = (id)a2;
    v12 = _Block_copy(aBlock);
    objc_initWeak(&from, v7);
    v16 = v11;
    v17 = 3221225472;
    v18 = __68__HUServiceDetailsViewController__registerButtonActionHandler_item___block_invoke_2;
    v19 = &unk_1E6F56CF0;
    objc_copyWeak(&v21, &location);
    v13 = v12;
    v20 = v13;
    objc_copyWeak(&v22, &from);
    v14 = (id)objc_msgSend(v7, "addCompletionBlock:", &v16);
    -[HUServiceDetailsViewController registeredButtonFutures](self, "registeredButtonFutures", v16, v17, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_safeAddObject:", v7);

    v13[2](v13);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }

}

void __68__HUServiceDetailsViewController__registerButtonActionHandler_item___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "detailsItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestToUpdateItems:senderSelector:", v5, *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "performItemUpdateRequest:", v6);

  objc_msgSend(WeakRetained, "detailsItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadUIRepresentationForItems:withAnimation:", v9, 0);

}

void __68__HUServiceDetailsViewController__registerButtonActionHandler_item___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleError:", v8);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "registeredButtonFutures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v6, "removeObject:", v7);

}

- (id)_createMenuWithValues:(id)a3 cell:(id)a4 currentItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __73__HUServiceDetailsViewController__createMenuWithValues_cell_currentItem___block_invoke;
  v21 = &unk_1E6F56D40;
  objc_copyWeak(&v26, &location);
  v12 = v8;
  v22 = v12;
  v13 = v9;
  v23 = v13;
  v14 = v10;
  v24 = v14;
  v15 = v11;
  v25 = v15;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v18);
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E6F60E80, v15, v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v16;
}

void __73__HUServiceDetailsViewController__createMenuWithValues_cell_currentItem___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v5 = (id *)(a1 + 64);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(v6, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CEA2A8];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __73__HUServiceDetailsViewController__createMenuWithValues_cell_currentItem___block_invoke_2;
  v16 = &unk_1E6F56D18;
  v11 = *(id *)(a1 + 32);
  v20 = a3;
  v17 = v11;
  v18 = WeakRetained;
  v19 = *(id *)(a1 + 40);
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v9, 0, 0, &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setState:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", *(_QWORD *)(a1 + 48), v13, v14, v15, v16) == a3);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);

}

void __73__HUServiceDetailsViewController__createMenuWithValues_cell_currentItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 56));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_didSelectRoomItem:", v4);
  objc_msgSend(*(id *)(a1 + 40), "_createMenuWithValues:cell:currentItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMenu:", v2);

}

- (void)_updateName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HUServiceDetailsItemManager **p_detailsItemManager;
  id WeakRetained;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v21 = a3;
  if (v21)
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceLikeBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v21, "isEqualToString:", v6);

    if ((v7 & 1) == 0)
    {
      -[HUServiceDetailsViewController setTitle:](self, "setTitle:", v21);
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serviceLikeBuilder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setName:", v21);

      v10 = objc_alloc_init(MEMORY[0x1E0D31A20]);
      objc_msgSend(MEMORY[0x1E0D31858], "policyWithDecision:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setReadPolicy:", v11);

      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0C99E60];
      p_detailsItemManager = &self->_detailsItemManager;
      WeakRetained = objc_loadWeakRetained((id *)p_detailsItemManager);
      objc_msgSend(WeakRetained, "headerItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_loadWeakRetained((id *)p_detailsItemManager);
      objc_msgSend(v17, "sourceItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWithObjects:", v16, v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)objc_msgSend(v12, "_updateResultsForItems:context:", v19, v10);

    }
  }

}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  id v13;

  v13 = a3;
  v7 = a5;
  objc_opt_class();
  v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10
    || (objc_msgSend(v10, "service"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "hf_isChildService"),
        v11,
        (v12 & 1) == 0))
  {
    -[HUServiceDetailsViewController _updateName:](self, "_updateName:", v13);
  }

}

- (void)textFieldDidEndEditing:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HUServiceDetailsViewController _commitBuilder](self, "_commitBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__HUServiceDetailsViewController_textFieldDidEndEditing_item___block_invoke;
  v10[3] = &unk_1E6F4E380;
  objc_copyWeak(&v11, &location);
  v9 = (id)objc_msgSend(v8, "addCompletionBlock:", v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __62__HUServiceDetailsViewController_textFieldDidEndEditing_item___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id WeakRetained;

  if ((objc_msgSend(a3, "hf_isHomeKitNamingError") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = objc_alloc_init(MEMORY[0x1E0D31A20]);
    objc_msgSend(MEMORY[0x1E0D31858], "policyWithDecision:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReadPolicy:", v5);

    objc_msgSend(WeakRetained, "detailsItemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(WeakRetained, "detailsItemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "headerItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "detailsItemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sourceItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "detailsItemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nameModule");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nameAndIconItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithObjects:", v9, v11, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v6, "_updateResultsForItems:context:", v15, v4);

  }
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  unsigned int v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUServiceDetailsViewController;
  v5 = -[HUItemTableViewController shouldHideHeaderAboveSection:](&v14, sel_shouldHideHeaderAboveSection_);
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedSectionIdentifierForSectionIndex:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v5 | objc_msgSend((id)v7, "isEqualToString:", CFSTR("HUServiceDetailsHeaderSectionIdentifier"));

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedSectionIdentifierForSectionIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "isEqualToString:", CFSTR("HUServiceDetailsFirmwareUpdateSectionPromptIdentifier"));

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayedSectionIdentifierForSectionIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = v8 | v7 | objc_msgSend(v12, "isEqualToString:", CFSTR("HUServiceDetailsFirmwareUpdateAppStoreSectionIdentifier"));

  return (char)v9;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  unsigned int v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUServiceDetailsViewController;
  v5 = -[HUItemTableViewController shouldHideHeaderAboveSection:](&v14, sel_shouldHideHeaderAboveSection_);
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedSectionIdentifierForSectionIndex:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v5 | objc_msgSend((id)v7, "isEqualToString:", CFSTR("HUServiceDetailsHeaderSectionIdentifier"));

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedSectionIdentifierForSectionIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "isEqualToString:", CFSTR("HUServiceDetailsFirmwareUpdateSectionPromptIdentifier"));

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayedSectionIdentifierForSectionIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = v8 | v7 | objc_msgSend(v12, "isEqualToString:", CFSTR("HUServiceDetailsFirmwareUpdateAppStoreSectionIdentifier"));

  return (char)v9;
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v5;
  char isKindOfClass;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUServiceDetailsViewController;
  v5 = a3;
  LOBYTE(a4) = -[HUItemTableViewController shouldHideSeparatorsForCell:indexPath:](&v8, sel_shouldHideSeparatorsForCell_indexPath_, v5, a4);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (a4 | isKindOfClass) & 1;
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUServiceDetailsViewController;
  v4 = a3;
  v5 = -[HUItemTableViewController automaticDisablingReasonsForItem:](&v12, sel_automaticDisablingReasonsForItem_, v4);
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager", v12.receiver, v12.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showContainedItems");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statusAndNotificationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4 || v9 == v4)
    return 1;
  else
    return (unint64_t)v5;
}

- (void)_updateAssociatedServiceTypeCells
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HUServiceDetailsViewController tableView](self, "tableView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        -[HUItemTableViewController itemManager](self, "itemManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "displayedItemAtIndexPath:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          -[HUServiceDetailsViewController tableView](self, "tableView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "cellForRowAtIndexPath:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
          v15 = v14;

          -[HUServiceDetailsViewController _updateCheckedStateForAssociatedServiceTypeCell:item:](self, "_updateCheckedStateForAssociatedServiceTypeCell:item:", v15, v11);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id WeakRetained;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUServiceDetailsViewController;
  -[HUItemTableViewController itemManager:didUpdateResultsForItem:atIndexPath:](&v13, sel_itemManager_didUpdateResultsForItem_atIndexPath_, a3, v8, a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_detailsItemManager);
  objc_msgSend(WeakRetained, "headerItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v8)
  {
    objc_msgSend(v8, "latestResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsViewController setTitle:](self, "setTitle:", v12);

  }
  -[HUServiceDetailsViewController _updateControlStatusText](self, "_updateControlStatusText");
  -[HUServiceDetailsViewController _updateIconDescriptorAnimated:](self, "_updateIconDescriptorAnimated:", 1);

}

- (void)dismissPrivacyController
{
  -[HUServiceDetailsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)_isCameraItem
{
  void *v2;
  char isKindOfClass;

  -[HUServiceDetailsViewController item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  HUServiceDetailsViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v7 = (HUServiceDetailsViewController *)a4;
  if (v7 == self || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[HUServiceDetailsViewController navigationBarTitleView](self, "navigationBarTitleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
  }
  else
  {
    -[HUServiceDetailsViewController navigationBarTitleView](self, "navigationBarTitleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 1;
  }
  objc_msgSend(v8, "setHidden:", v10);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (-[HUServiceDetailsViewController _allowRowSelectionForItem:](self, "_allowRowSelectionForItem:", v9))
    {
      LOBYTE(v13) = 1;
      goto LABEL_20;
    }
LABEL_17:
    LOBYTE(v13) = 0;
    goto LABEL_20;
  }
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_17;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v10, "allControlViews", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v16, "canBeHighlighted")
          && !objc_msgSend(v16, "isDisabled"))
        {
          LOBYTE(v13) = 1;
          goto LABEL_19;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_19:

LABEL_20:
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  HUAccessoryDebugViewController *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HUMediaAccessoryAudioSettingsViewController *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  HUTemperatureUnitPickerViewController *v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  int v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  void *v98;
  int v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  void *v104;
  _BOOL4 v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  HUStatusAndNotificationsViewController *v110;
  void *v111;
  void *v112;
  void *v113;
  HUStatusAndNotificationsViewController *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  char v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  HUUsersAndGuestsPinCodeViewController *v130;
  void *v131;
  HUUsersAndGuestsPinCodeViewController *v132;
  void *v133;
  id v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  HUSceneActionEditorViewController *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  int v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  id v149;
  void *v150;
  void *v151;
  int v152;
  void *v153;
  void *v154;
  int v155;
  NSObject *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  int v161;
  void *v162;
  void *v163;
  int v164;
  void *v165;
  void *v166;
  int v167;
  void *v168;
  void *v169;
  int v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  int v175;
  id v176;
  void *v177;
  char v178;
  char v179;
  id v180;
  void *v181;
  void *v182;
  uint64_t v183;
  void *v184;
  void *v185;
  int v186;
  id v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  id v192;
  id v193;
  void *v194;
  void *v195;
  HUServiceDetailsViewController *v196;
  void *v197;
  id v198;
  void *v199;
  int v200;
  void *v201;
  void *v202;
  void *v203;
  _BOOL4 v204;
  void *v205;
  void *v206;
  _BOOL4 v207;
  void *v208;
  void *v209;
  _BOOL4 v210;
  void *v211;
  void *v212;
  _BOOL4 v213;
  void *v214;
  void *v215;
  int v216;
  void *v217;
  HUCameraRecordingOptionsTableViewController *v218;
  void *v219;
  void *v220;
  HUCameraRecordingOptionsTableViewController *v221;
  id v222;
  void *v223;
  void *v224;
  HUHomeTheaterAudioViewController *v225;
  void *v226;
  id v227;
  void *v228;
  void *v229;
  void *v230;
  HUCameraActivityZoneEditorViewController *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  int v236;
  HUFaceRecognitionLibraryListViewController *v237;
  void *v238;
  void *v239;
  HUFaceRecognitionLibraryListViewController *v240;
  void *v241;
  id v242;
  void *v243;
  void *v244;
  _BOOL4 v245;
  void *v246;
  void *v247;
  int v248;
  void *v249;
  void *v250;
  void *v251;
  int v252;
  void *v253;
  void *v254;
  void *v255;
  NSObject *v256;
  void *v257;
  void *v258;
  id v259;
  void *v260;
  id v261;
  void *v262;
  id v263;
  id v264;
  HUAccessoryDiagnosticsViewController *v265;
  void *v266;
  HUAccessoryDiagnosticsViewController *v267;
  void *v268;
  id v269;
  void *v270;
  int v271;
  void *v272;
  void *v273;
  id v274;
  HUManagedConfigurationProfilesViewController *v275;
  void *v276;
  char v277;
  _QWORD v278[4];
  id v279;
  _QWORD v280[4];
  id v281;
  _QWORD v282[4];
  id v283;
  id v284;
  id location;
  objc_super v286;
  _BYTE from[12];
  __int16 v288;
  const char *v289;
  __int16 v290;
  void *v291;
  __int16 v292;
  void *v293;
  __int16 v294;
  void *v295;
  id v296;
  _QWORD v297[4];

  v297[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v286.receiver = self;
  v286.super_class = (Class)HUServiceDetailsViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v286, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "internalDebuggingItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9 == v11;

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "sourceItemHomeKitObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUServiceDetailsViewController navigationController](self, "navigationController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[HUAccessoryDebugViewController initWithHomeKitObject:]([HUAccessoryDebugViewController alloc], "initWithHomeKitObject:", v26);
    v29 = (id)objc_msgSend(v27, "hu_pushPreloadableViewController:animated:", v28, 1);

    goto LABEL_65;
  }
  objc_msgSend(v13, "audioSettingsItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9 == v15;

  if (v16)
  {
    -[HUServiceDetailsViewController item](self, "item");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "latestResults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0D30970]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "conformsToProtocol:", &unk_1EF347468))
      v33 = v32;
    else
      v33 = 0;
    v34 = v33;

    if (!objc_msgSend(v34, "hf_showsAudioSettings"))
      goto LABEL_163;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_163;
    v35 = objc_alloc(MEMORY[0x1E0D31550]);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "home");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v35, "initWithExistingObject:inHome:", v34, v37);

    v39 = objc_opt_class();
    -[HUServiceDetailsViewController item](self, "item");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v41 = v40;
      else
        v41 = 0;
      v42 = v40;
      if (v41)
        goto LABEL_25;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v39, objc_opt_class());

    }
    v42 = 0;
LABEL_25:

    v45 = -[HUMediaAccessoryAudioSettingsViewController initWithMediaSystemBuilder:mediaAccessoryItem:]([HUMediaAccessoryAudioSettingsViewController alloc], "initWithMediaSystemBuilder:mediaAccessoryItem:", v38, v42);
    -[HUMediaAccessoryAudioSettingsViewController setPresentationDelegate:](v45, "setPresentationDelegate:", self);
    -[HUServiceDetailsViewController navigationController](self, "navigationController");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (id)objc_msgSend(v46, "hu_pushPreloadableViewController:animated:", v45, 1);

    goto LABEL_163;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = objc_opt_class();
    v18 = v9;
    if (v18)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v18;
      if (v19)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v17, objc_opt_class());

    }
    v20 = 0;
LABEL_11:

    +[HUAccessorySettingsDetailsViewControllerFactory viewControllerForGroup:](HUAccessorySettingsDetailsViewControllerFactory, "viewControllerForGroup:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsViewController navigationController](self, "navigationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v24, "hu_pushPreloadableViewController:animated:", v23, 1);

    goto LABEL_65;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v48 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v49 = v48;
    else
      v49 = 0;
    v50 = v49;

    v51 = objc_opt_new();
    -[NSObject addObject:](v51, "addObject:", *MEMORY[0x1E0D30730]);
    -[NSObject addObject:](v51, "addObject:", *MEMORY[0x1E0D30650]);
    -[NSObject addObject:](v51, "addObject:", *MEMORY[0x1E0D30658]);
    if (_os_feature_enabled_impl())
      -[NSObject addObject:](v51, "addObject:", *MEMORY[0x1E0D30648]);
    objc_msgSend(v50, "settingKeyPath");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[NSObject na_safeContainsObject:](v51, "na_safeContainsObject:", v52);

    if (v53)
    {
      +[HUAccessorySettingsDetailsViewControllerFactory viewControllerForSettingItem:](HUAccessorySettingsDetailsViewControllerFactory, "viewControllerForSettingItem:", v50);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUServiceDetailsViewController navigationController](self, "navigationController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (id)objc_msgSend(v55, "hu_pushPreloadableViewController:animated:", v54, 1);

    }
    goto LABEL_64;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = objc_opt_class();
    v58 = v9;
    if (v58)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v59 = v58;
      else
        v59 = 0;
      v50 = v58;
      if (v59)
      {
LABEL_45:

        objc_msgSend(v50, "controlItems");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "anyObject");
        v51 = objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[HUServiceDetailsViewController expandedControlPanelItems](self, "expandedControlPanelItems");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "containsObject:", v50);

          -[HUServiceDetailsViewController expandedControlPanelItems](self, "expandedControlPanelItems");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v65;
          if ((v64 & 1) != 0)
            objc_msgSend(v65, "removeObject:", v50);
          else
            objc_msgSend(v65, "addObject:", v50);

          -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(v89, "diffableDataSourceDisabled");

          if (v90)
          {
            -[HUServiceDetailsViewController tableView](self, "tableView");
            v85 = (HUTemperatureUnitPickerViewController *)objc_claimAutoreleasedReturnValue();
            v297[0] = v7;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v297, 1);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUTemperatureUnitPickerViewController reloadRowsAtIndexPaths:withRowAnimation:](v85, "reloadRowsAtIndexPaths:withRowAnimation:", v86, 0);
          }
          else
          {
            -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
            v85 = (HUTemperatureUnitPickerViewController *)objc_claimAutoreleasedReturnValue();
            v296 = v50;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v296, 1);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUTemperatureUnitPickerViewController reloadUIRepresentationForItems:withAnimation:](v85, "reloadUIRepresentationForItems:withAnimation:", v86, 1);
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_64:

            goto LABEL_65;
          }
          v84 = v51;
          v85 = -[HUTemperatureUnitPickerViewController initWithUnitItem:]([HUTemperatureUnitPickerViewController alloc], "initWithUnitItem:", v84);

          -[HUServiceDetailsViewController navigationController](self, "navigationController");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "pushViewController:animated:", v85, 1);
        }

        goto LABEL_64;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v57, objc_opt_class());

    }
    v50 = 0;
    goto LABEL_45;
  }
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "roomItem");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v9, "isEqual:", v68);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v70;
  if (!v69)
  {
    objc_msgSend(v70, "associatedServiceTypeItem");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v9, "isEqual:", v79);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v81;
    if (v80)
    {
      objc_msgSend(v81, "setShowAssociatedServiceTypeList:", 1);

      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setShowRoomsList:", 0);

      goto LABEL_65;
    }
    objc_msgSend(v81, "createNewRoomItem");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v9, "isEqual:", v87);

    if (v88)
    {
      -[HUServiceDetailsViewController addRoomButtonPressed:](self, "addRoomButtonPressed:", v6);
      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addGroupItem");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v9, "isEqual:", v92);

    if (v93)
    {
      -[HUServiceDetailsViewController _presentGroupPicker](self, "_presentGroupPicker");
      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "identifyHomePodItem");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v9, "isEqual:", v95);

    if (v96)
    {
      -[HUServiceDetailsViewController _identifyHomePod](self, "_identifyHomePod");
      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "separateTileItem");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v9, "isEqual:", v98);

    if (v99)
    {
      -[HUServiceDetailsViewController _separateOrUnifyTile](self, "_separateOrUnifyTile");
      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "showContainedItems");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v9, "isEqual:", v101);

    if (v102)
    {
      -[HUServiceDetailsViewController _presentContainedItems](self, "_presentContainedItems");
      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "lockPinCodesItem");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v9 == v104;

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v106;
    if (v105)
    {
      objc_msgSend(v106, "lockPinCodesItem");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "latestResults");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = objc_msgSend(v119, "BOOLValue");

      if ((v120 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUItemTableViewController itemManager](self, "itemManager");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "home");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "pinCodeManagerForHome:", v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();

        v125 = (id)objc_msgSend(v124, "fetchFromAccessoryCache");
        -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "sourceItemAccessory");
        v127 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUItemTableViewController itemManager](self, "itemManager");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "home");
        v129 = (void *)objc_claimAutoreleasedReturnValue();

        v130 = [HUUsersAndGuestsPinCodeViewController alloc];
        -[HUServiceDetailsViewController item](self, "item");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = -[HUUsersAndGuestsPinCodeViewController initWithSourceItem:pinCodeManager:home:forAccessory:](v130, "initWithSourceItem:pinCodeManager:home:forAccessory:", v131, v124, v129, v127);

        -[HUServiceDetailsViewController navigationController](self, "navigationController");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = (id)objc_msgSend(v133, "hu_pushPreloadableViewController:animated:", v132, 1);

      }
      goto LABEL_65;
    }
    objc_msgSend(v106, "statusAndNotificationItem");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v9, "isEqual:", v108);

    if (v109)
    {
      v110 = [HUStatusAndNotificationsViewController alloc];
      -[HUServiceDetailsViewController item](self, "item");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemTableViewController itemManager](self, "itemManager");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "home");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = -[HUStatusAndNotificationsViewController initWithServiceItem:inHome:displayingDetails:](v110, "initWithServiceItem:inHome:displayingDetails:", v111, v113, 1);

      -[HUServiceDetailsViewController navigationController](self, "navigationController");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = (id)objc_msgSend(v115, "hu_pushPreloadableViewController:animated:", v114, 1);

      goto LABEL_65;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v135 = objc_alloc(MEMORY[0x1E0D31140]);
      objc_msgSend(v9, "actionSet");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUServiceDetailsViewController home](self, "home");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = (void *)objc_msgSend(v135, "initWithExistingObject:inHome:", v136, v137);

      v139 = -[HUSceneActionEditorViewController initWithActionSetBuilder:mode:]([HUSceneActionEditorViewController alloc], "initWithActionSetBuilder:mode:", v138, 0);
      -[HUSceneActionEditorViewController setShowCancelButton:](v139, "setShowCancelButton:", 0);
      -[HUSceneActionEditorViewController setPresentationDelegate:](v139, "setPresentationDelegate:", self);
      -[HUServiceDetailsViewController navigationController](self, "navigationController");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = (id)objc_msgSend(v140, "hu_pushPreloadableViewController:animated:", v139, 1);

      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "pairingModeItem");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = objc_msgSend(v9, "isEqual:", v143);

    if (v144)
    {
      -[HUServiceDetailsViewController item](self, "item");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "accessories");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "anyObject");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v147);

      v148 = objc_loadWeakRetained(&location);
      LODWORD(v145) = v148 == 0;

      if ((_DWORD)v145)
      {
        HFLogForCategory();
        v156 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
        {
          -[HUServiceDetailsViewController item](self, "item");
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)from = 138412290;
          *(_QWORD *)&from[4] = v184;
          _os_log_error_impl(&dword_1B8E1E000, v156, OS_LOG_TYPE_ERROR, "Attempted to activate pairing mode for chip accessory but found nil accessory %@", from, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 38);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "handleError:", v157);

      }
      else
      {
        objc_initWeak((id *)from, self);
        v149 = objc_loadWeakRetained(&location);
        v282[0] = MEMORY[0x1E0C809B0];
        v282[1] = 3221225472;
        v282[2] = __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
        v282[3] = &unk_1E6F56D88;
        objc_copyWeak(&v283, &location);
        objc_copyWeak(&v284, (id *)from);
        objc_msgSend(v149, "activateCHIPPairingModeAndCreateSetupPayloadStringWithCompletion:", v282);

        objc_destroyWeak(&v284);
        objc_destroyWeak(&v283);
        objc_destroyWeak((id *)from);
      }
      objc_destroyWeak(&location);
      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "exportDiagnosticsItem");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = objc_msgSend(v9, "isEqual:", v151);

    if (v152)
    {
      -[HUServiceDetailsViewController _exportDiagnosticsForItem:](self, "_exportDiagnosticsForItem:", v9);
      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "removeItem");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = objc_msgSend(v9, "isEqual:", v154);

    if (v155)
    {
      -[HUServiceDetailsViewController _presentRemoveConfirmation:](self, "_presentRemoveConfirmation:", v7);
      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "removeFromGroupItem");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = objc_msgSend(v9, "isEqual:", v160);

    if (v161)
    {
      -[HUServiceDetailsViewController _presentRemoveFromGroupConfirmation:](self, "_presentRemoveFromGroupConfirmation:", v7);
      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "resetItem");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v164 = objc_msgSend(v9, "isEqual:", v163);

    if (v164)
    {
      -[HUServiceDetailsViewController _presentResetHomePodConfirmation:](self, "_presentResetHomePodConfirmation:", v7);
      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "restartItem");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = objc_msgSend(v9, "isEqual:", v166);

    if (v167)
    {
      -[HUServiceDetailsViewController _restartGroupedHomePodAccessory](self, "_restartGroupedHomePodAccessory");
      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "accessoryItem");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = objc_msgSend(v9, "isEqual:", v169);

    if (v170)
    {
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "sourceItemAccessory");
      v172 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v172, "hf_owningBridgeAccessory");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v172, "hf_isBridge"))
      {
        if ((objc_msgSend(v172, "hf_isPureBridge") & 1) == 0)
        {
          -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          v175 = objc_msgSend(v174, "sourceItemIsService");

          if (v175)
          {
            v176 = v172;

            v173 = v176;
          }
        }
      }
      objc_msgSend(v173, "hf_primaryService");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = objc_msgSend(v173, "hf_isVisibleAsBridge");
      if (v177)
        v179 = v178;
      else
        v179 = 1;
      if ((v179 & 1) != 0
        || (objc_msgSend(v173, "hf_showAsIndividualServices") & 1) == 0
        && (objc_msgSend(v173, "hf_isMultiServiceAccessory") & 1) != 0)
      {
        v180 = objc_alloc(MEMORY[0x1E0D310A8]);
        -[HUServiceDetailsViewController item](self, "item");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "valueSource");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        v183 = objc_msgSend(v180, "initWithAccessory:valueSource:", v173, v182);
      }
      else
      {
        v194 = (void *)MEMORY[0x1E0D317D0];
        -[HUServiceDetailsViewController item](self, "item");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "valueSource");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v194, "serviceItemForService:valueSource:", v177, v182);
        v183 = objc_claimAutoreleasedReturnValue();
      }
      v195 = (void *)v183;

      v196 = -[HUServiceDetailsViewController initWithServiceLikeItem:]([HUServiceDetailsViewController alloc], "initWithServiceLikeItem:", v195);
      -[HUServiceDetailsViewController setPresentationDelegate:](v196, "setPresentationDelegate:", self);
      -[HUServiceDetailsViewController navigationController](self, "navigationController");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      v198 = (id)objc_msgSend(v197, "hu_pushPreloadableViewController:animated:", v196, 1);

      goto LABEL_65;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      v186 = objc_msgSend(v185, "showAssociatedServiceTypeList");

      if (v186)
      {
        v187 = v9;
        objc_msgSend(v187, "latestResults");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v188, "objectForKeyedSubscript:", *MEMORY[0x1E0D30488]);
        v189 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v189)
          NSLog(CFSTR("Associated service type item didn't have a service type: %@"), v187);
        -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v190, "selectAssociatedServiceType:", v189);
        v191 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak((id *)from, self);
        v280[0] = MEMORY[0x1E0C809B0];
        v280[1] = 3221225472;
        v280[2] = __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_525;
        v280[3] = &unk_1E6F4F4D0;
        objc_copyWeak(&v281, (id *)from);
        v192 = (id)objc_msgSend(v191, "addSuccessBlock:", v280);
        v193 = (id)objc_msgSend(v191, "addFailureBlock:", &__block_literal_global_526);
        objc_destroyWeak(&v281);
        objc_destroyWeak((id *)from);

      }
      else
      {
        -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
        v187 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v187, "setShowAssociatedServiceTypeList:", 1);
      }

      -[HUServiceDetailsViewController _updateAssociatedServiceTypeCells](self, "_updateAssociatedServiceTypeCells");
      goto LABEL_65;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HUServiceDetailsViewController _presentTriggerEditorForProgrammableSwitchEventOptionItem:](self, "_presentTriggerEditorForProgrammableSwitchEventOptionItem:", v9);
      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = objc_msgSend(v199, "canToggleAccessoryInfoItem:", v9);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = v201;
    if (v200)
    {
      objc_msgSend(v201, "toggleAccessoryInfoItem:", v9);

      goto LABEL_65;
    }
    objc_msgSend(v201, "splitMediaAccountUseDefaultAccountItem");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v204 = v9 == v203;

    if (v204)
    {
      -[HUServiceDetailsViewController didSelectHomeAssistantDeviceSplitAccountAction:](self, "didSelectHomeAssistantDeviceSplitAccountAction:", 1);
      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "splitMediaAccountSignoutAccountItem");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v207 = v9 == v206;

    if (v207)
    {
      -[HUServiceDetailsViewController didSelectHomeAssistantDeviceSplitAccountAction:](self, "didSelectHomeAssistantDeviceSplitAccountAction:", 2);
      goto LABEL_65;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "homeTheaterAudioOutputItem");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    v210 = v9 == v209;

    if (v210)
    {
      objc_opt_class();
      -[HUServiceDetailsViewController item](self, "item");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v224 = v223;
      else
        v224 = 0;
      v34 = v224;

      if (v34)
      {
        v225 = -[HUHomeTheaterAudioViewController initWithMediaAccessoryItem:]([HUHomeTheaterAudioViewController alloc], "initWithMediaAccessoryItem:", v34);
        -[HUServiceDetailsViewController navigationController](self, "navigationController");
        v226 = (void *)objc_claimAutoreleasedReturnValue();
        v227 = (id)objc_msgSend(v226, "hu_pushPreloadableViewController:animated:", v225, 1);

      }
    }
    else
    {
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v211, "cameraActivityZonesItem");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      v213 = v9 == v212;

      if (v213)
      {
        objc_opt_class();
        -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
        v228 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v228, "sourceItem");
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v230 = v229;
        else
          v230 = 0;
        v50 = v230;

        if (v50)
        {
          v231 = [HUCameraActivityZoneEditorViewController alloc];
          objc_msgSend(v50, "profile");
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = -[HUCameraActivityZoneEditorViewController initWithCameraProfile:](v231, "initWithCameraProfile:", v232);

          v233 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v51);
          objc_msgSend(v233, "setToolbarHidden:", 0);
          objc_msgSend(v233, "setModalPresentationStyle:", 2);
          -[HUServiceDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v233, 1, 0);

        }
        else
        {
          HFLogForCategory();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)from = 138412290;
            *(_QWORD *)&from[4] = v9;
            _os_log_error_impl(&dword_1B8E1E000, v51, OS_LOG_TYPE_ERROR, "Unable to launch editor for invalid item:%@", from, 0xCu);
          }
        }
        goto LABEL_64;
      }
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "cameraRecordingOptionsItem");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      v216 = objc_msgSend(v9, "isEqual:", v215);

      if (v216)
      {
        -[HUServiceDetailsViewController navigationController](self, "navigationController");
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        v218 = [HUCameraRecordingOptionsTableViewController alloc];
        -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v219, "sourceItem");
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        v221 = -[HUCameraRecordingOptionsTableViewController initWithServiceLikeItem:](v218, "initWithServiceLikeItem:", v220);
        v222 = (id)objc_msgSend(v217, "hu_pushPreloadableViewController:animated:", v221, 1);

        goto LABEL_65;
      }
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v234, "cameraFaceRecognitionItem");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      v236 = objc_msgSend(v9, "isEqual:", v235);

      if (v236)
      {
        v237 = [HUFaceRecognitionLibraryListViewController alloc];
        -[HUItemTableViewController itemManager](self, "itemManager");
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v238, "home");
        v239 = (void *)objc_claimAutoreleasedReturnValue();
        v240 = -[HUFaceRecognitionLibraryListViewController initWithHome:](v237, "initWithHome:", v239);

        -[HUServiceDetailsViewController navigationController](self, "navigationController");
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        v242 = (id)objc_msgSend(v241, "hu_pushPreloadableViewController:animated:", v240, 1);

        goto LABEL_65;
      }
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "collectDiagnosticsItem");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      v245 = v9 == v244;

      if (v245)
      {
        v265 = [HUAccessoryDiagnosticsViewController alloc];
        -[HUServiceDetailsViewController item](self, "item");
        v266 = (void *)objc_claimAutoreleasedReturnValue();
        v267 = -[HUAccessoryDiagnosticsViewController initWithSourceItem:](v265, "initWithSourceItem:", v266);

        -[HUServiceDetailsViewController navigationController](self, "navigationController");
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        v269 = (id)objc_msgSend(v268, "hu_pushPreloadableViewController:animated:", v267, 1);

        goto LABEL_65;
      }
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v246, "lockAddHomeKeyToWalletItem");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      v248 = objc_msgSend(v9, "isEqual:", v247);

      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      v250 = v249;
      if (v248)
      {
        objc_msgSend(v249, "sourceItem");
        v251 = (void *)objc_claimAutoreleasedReturnValue();
        v252 = objc_msgSend(v251, "conformsToProtocol:", &unk_1EF2AC470);

        if (v252)
        {
          -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v253, "sourceItem");
          v254 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v254, "home");
          v255 = (void *)objc_claimAutoreleasedReturnValue();
          HFLogForCategory();
          v256 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v257 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)from = 138413314;
            *(_QWORD *)&from[4] = v257;
            v288 = 2080;
            v289 = "-[HUServiceDetailsViewController tableView:didSelectRowAtIndexPath:]";
            v290 = 2112;
            v291 = v9;
            v292 = 2112;
            v293 = v254;
            v294 = 2112;
            v295 = v255;
            _os_log_impl(&dword_1B8E1E000, v256, OS_LOG_TYPE_DEFAULT, "(%@:%s) user tapped %@ of %@ in home %@", from, 0x34u);

          }
          objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
          v258 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v259 = v258;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v260 = v259;
          else
            v260 = 0;
          v261 = v260;

          objc_msgSend(v261, "setShowSpinner:", 1);
          objc_msgSend(MEMORY[0x1E0D319E8], "handleAddOrShowHomeKeyButtonTapForHome:", v255);
          v262 = (void *)objc_claimAutoreleasedReturnValue();
          v278[0] = MEMORY[0x1E0C809B0];
          v278[1] = 3221225472;
          v278[2] = __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_556;
          v278[3] = &unk_1E6F4C610;
          v279 = v261;
          v263 = v261;
          v264 = (id)objc_msgSend(v262, "addCompletionBlock:", v278);

        }
        goto LABEL_65;
      }
      objc_msgSend(v249, "managedConfigurationProfilesItem");
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      v271 = objc_msgSend(v9, "isEqual:", v270);

      if (!v271)
        goto LABEL_65;
      objc_opt_class();
      -[HUItemTableViewController itemManager](self, "itemManager");
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v273 = v272;
      else
        v273 = 0;
      v274 = v273;

      objc_msgSend(v274, "sourceItemAccessory");
      v34 = (id)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        v275 = -[HUManagedConfigurationProfilesViewController initWithAccessory:]([HUManagedConfigurationProfilesViewController alloc], "initWithAccessory:", v34);
        -[HUServiceDetailsViewController navigationController](self, "navigationController");
        v276 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v276, "pushViewController:animated:", v275, 1);

      }
    }
LABEL_163:

    goto LABEL_65;
  }
  objc_msgSend(v70, "home");
  v51 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject hf_currentUserIsAdministrator](v51, "hf_currentUserIsAdministrator") & 1) == 0)
    goto LABEL_64;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "sourceItem");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "latestResults");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "objectForKeyedSubscript:", *MEMORY[0x1E0D30F00]);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v277 = objc_msgSend(v74, "BOOLValue");

  if ((v277 & 1) == 0)
  {
    -[HUServiceDetailsViewController setIsPresentingRoomsList:](self, "setIsPresentingRoomsList:", 1);
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "showRoomsList");
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setShowRoomsList:", v76 ^ 1u);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setShowAssociatedServiceTypeList:", 0);

  }
LABEL_65:

}

void __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v38;
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE buf[24];
  void *v47;
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v38 = v5;
  if (v4)
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v6 = (void *)qword_1EF226AD8;
    v45 = qword_1EF226AD8;
    if (!qword_1EF226AD8)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getMTRSetupPayloadClass_block_invoke;
      v47 = &unk_1E6F4C868;
      v48[0] = &v42;
      __getMTRSetupPayloadClass_block_invoke((uint64_t)buf);
      v6 = (void *)v43[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v42, 8);
    objc_msgSend(v7, "setupPayloadWithOnboardingPayload:error:", v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "manualEntryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = WeakRetained;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2112;
      v47 = v8;
      LOWORD(v48[0]) = 2112;
      *(_QWORD *)((char *)v48 + 2) = v9;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Successfully activated pairing mode for CHIP accessory: %@, setupPayloadString: %@, payload: %@, manual pairing code: %@", buf, 0x2Au);

    }
    +[HUStringDisplayFormatter stringByApplyingCodeFormatToString:](HUStringDisplayFormatter, "stringByApplyingCodeFormatToString:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryTitle"), CFSTR("HUAccessoryTitle"), 1);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v16;

    _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsPairingModeItem_Alert_Title"), CFSTR("HUServiceDetailsPairingModeItem_Alert_Title"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUServiceDetailsPairingModeItem_Alert_Body"), CFSTR("%@%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v19, v26, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUAlertDismiss"), CFSTR("HUAlertDismiss"), 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 0, &__block_literal_global_516);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAction:", v30);

    v31 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsPairingModeItem_Alert_Copy_Button_Title"), CFSTR("HUServiceDetailsPairingModeItem_Alert_Copy_Button_Title"), 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_519;
    v40[3] = &unk_1E6F4C6E0;
    v41 = v9;
    v33 = v9;
    objc_msgSend(v31, "actionWithTitle:style:handler:", v32, 0, v40);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAction:", v34);

    v35 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v35, "presentViewController:animated:completion:", v27, 1, 0);

  }
  else
  {
    if (v5)
    {
      v17 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfUnspecifiedError");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v17;
    HFLogForCategory();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = objc_loadWeakRetained((id *)(a1 + 32));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_error_impl(&dword_1B8E1E000, v36, OS_LOG_TYPE_ERROR, "Encountered error activating pairing mode for CHIP accessory: %@ error: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleError:", v8);
  }

}

void __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_514()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[HUServiceDetailsViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'Dismiss' from alert", (uint8_t *)&v1, 0xCu);
  }

}

void __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_519(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[HUServiceDetailsViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from alert", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setString:", *(_QWORD *)(a1 + 32));

}

void __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_525(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "detailsItemManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setShowAssociatedServiceTypeList:", 0);

  objc_msgSend(WeakRetained, "_updateAssociatedServiceTypeCells");
}

void __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logError:operationDescription:", v3, CFSTR("HUServiceDetailsViewController.updateAssociatedServiceType"));

}

uint64_t __68__HUServiceDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke_556(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowSpinner:", 0);
}

- (void)diffableDataItemManager:(id)a3 willUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6 isInitialLoad:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[5];
  objc_super v17;

  v7 = a7;
  v17.receiver = self;
  v17.super_class = (Class)HUServiceDetailsViewController;
  v12 = a6;
  v13 = a5;
  -[HUItemTableViewController diffableDataItemManager:willUpdateItems:addItems:removeItems:isInitialLoad:](&v17, sel_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad_, a3, a4, v13, v12, v7);
  v14 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __109__HUServiceDetailsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke;
  v16[3] = &unk_1E6F51390;
  v16[4] = self;
  objc_msgSend(v12, "na_each:", v16);

  v15[0] = v14;
  v15[1] = 3221225472;
  v15[2] = __109__HUServiceDetailsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke_2;
  v15[3] = &unk_1E6F51390;
  v15[4] = self;
  objc_msgSend(v13, "na_each:", v15);

}

void __109__HUServiceDetailsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_opt_class();
  v7 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v7;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "controlPanelController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeItem:", v5);

  }
}

void __109__HUServiceDetailsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_opt_class();
  v10 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v10;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "controlPanelController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v5);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "controlPanelController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addItem:", v5);

    }
  }

}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10;
  void *v11;
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUServiceDetailsViewController;
  v10 = a4;
  -[HUItemTableViewController diffableDataItemManager:didUpdateItems:addItems:removeItems:](&v13, sel_diffableDataItemManager_didUpdateItems_addItems_removeItems_, a3, v10, a5, a6);
  -[HUServiceDetailsViewController inputSourceItemModuleController](self, "inputSourceItemModuleController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateAllConfigurationDisabled");

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__HUServiceDetailsViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke;
  v12[3] = &unk_1E6F51390;
  v12[4] = self;
  objc_msgSend(v10, "na_each:", v12);

}

void __94__HUServiceDetailsViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1248));
  objc_msgSend(WeakRetained, "headerItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
  {
    objc_msgSend(v7, "latestResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTitle:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateControlStatusText");
  objc_msgSend(*(id *)(a1 + 32), "_updateIconDescriptorAnimated:", 1);

}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v6 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v6, "changes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        objc_opt_class();
        objc_msgSend(v13, "item");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        if (v16)
        {
          if (objc_msgSend(v13, "type") == 1)
          {
            -[HUServiceDetailsViewController controlPanelController](self, "controlPanelController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addItem:", v16);
          }
          else
          {
            if (objc_msgSend(v13, "type") != 2)
              goto LABEL_15;
            -[HUServiceDetailsViewController controlPanelController](self, "controlPanelController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "removeItem:", v16);
          }

        }
LABEL_15:

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v19.receiver = self;
  v19.super_class = (Class)HUServiceDetailsViewController;
  -[HUItemTableViewController itemManager:performUpdateRequest:](&v19, sel_itemManager_performUpdateRequest_, v18, v6);

}

- (BOOL)itemManager:(id)a3 shouldShowControlPanelItem:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[HUServiceDetailsViewController controlPanelController](self, "controlPanelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldDisplayItem:", v5);

  return v7;
}

- (BOOL)itemManager:(id)a3 shouldShowSectionTitleForControlPanelItem:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[HUServiceDetailsViewController controlPanelController](self, "controlPanelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldShowSectionTitleForItem:", v5);

  return v7;
}

- (id)itemManager:(id)a3 sectionTitleForControlPanelItem:(id)a4 forServiceItem:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  -[HUServiceDetailsViewController controlPanelController](self, "controlPanelController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionTitleForItem:forSourceItem:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)itemManager:(id)a3 sectionFooterForControlPanelItem:(id)a4 forServiceItem:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  -[HUServiceDetailsViewController controlPanelController](self, "controlPanelController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionFooterForItem:forSourceItem:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
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
  char v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[HUServiceDetailsViewController _roomForItem:](self, "_roomForItem:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceLikeBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "room");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    HFLogForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "serviceLikeBuilder");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136315394;
      v25 = "-[HUServiceDetailsViewController itemManager:didUpdateResultsForSourceItem:]";
      v26 = 2112;
      v27 = v23;
      _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "%s The source item has been changed, but we can't confirm that the room has changed because the self.detailsItemManager.serviceLikeBuilder (%@) has a nil room - which seems wrong.", (uint8_t *)&v24, 0x16u);

    }
    goto LABEL_9;
  }
  objc_msgSend(v5, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serviceLikeBuilder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "room");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "room");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) == 0)
    {
      HFLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 136315394;
        v25 = "-[HUServiceDetailsViewController itemManager:didUpdateResultsForSourceItem:]";
        v26 = 2112;
        v27 = v20;
        _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%s The room has changed to (%@), thus the items in this view are stale. Resetting.", (uint8_t *)&v24, 0x16u);

      }
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v21 = objc_claimAutoreleasedReturnValue();
      -[NSObject resetServiceLikeItemBuilder](v21, "resetServiceLikeItemBuilder");
LABEL_9:

    }
  }

}

- (int64_t)numberOfValuesForPickerViewCell:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedRoomSectionItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)pickerViewCell:(id)a3 didSelectValueAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  if (-[HUServiceDetailsViewController isPresentingRoomsList](self, "isPresentingRoomsList", a3))
  {
    -[HUServiceDetailsViewController setIsPresentingRoomsList:](self, "setIsPresentingRoomsList:", 0);
  }
  else
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "orderedRoomSectionItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 > a4)
    {
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "orderedRoomSectionItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      -[HUServiceDetailsViewController _didSelectRoomItem:](self, "_didSelectRoomItem:", v11);
    }
  }
}

- (id)pickerViewCell:(id)a3 titleForValueAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedRoomSectionItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a4)
  {
    v13 = 0;
  }
  else
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "orderedRoomSectionItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "latestResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)_characteristicsAffectedByControlItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "characteristicOptions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E70411E8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(v3, "valueSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allCharacteristicsForCharacteristicType:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v4;
}

- (void)controlPanelController:(id)a3 willBeginPossibleWritesForControlItem:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsViewController _characteristicsAffectedByControlItem:](self, "_characteristicsAffectedByControlItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "beginSuppressingUpdatesForCharacteristics:withReason:", v6, CFSTR("serviceDetailsControlInteraction"));
}

- (void)controlPanelController:(id)a3 didEndPossibleWritesForControlItem:(id)a4
{
  id v4;

  -[HUItemTableViewController itemManager](self, "itemManager", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endSuppressingUpdatesForCharacteristicsWithReason:updateAffectedItems:", CFSTR("serviceDetailsControlInteraction"), 1);

}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  id v14;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF2578B8))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  if (objc_msgSend(v8, "requiresPresentingViewControllerDismissal"))
  {
    -[HUServiceDetailsViewController setRequiresPresentingViewControllerDismissal:](self, "setRequiresPresentingViewControllerDismissal:", 1);
    -[HUServiceDetailsViewController presentationDelegate](self, "presentationDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishPresentation:animated:", self, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[UIViewController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", v4);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUServiceDetailsViewController navigationController](self, "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v13, "popViewControllerAnimated:", v4);

      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v11;
  }

  return v10;
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
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  id v41;

  v4 = a4;
  v6 = a3;
  -[HUServiceDetailsViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v41 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v41);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "favoriteItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "serviceLikeBuilder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setIsFavorite:", v4);
LABEL_5:
    v20 = (id)objc_msgSend(v15, "commitItem");
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(v13, "showInHomeDashboardItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v9, "isEqual:", v16);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    objc_msgSend(v18, "serviceLikeBuilder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setShowInHomeDashboard:", v4);
    goto LABEL_5;
  }
  objc_msgSend(v18, "cameraStatusLightItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v9, "isEqual:", v33);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v35;
  if (v34)
  {
    objc_msgSend(v35, "updateCameraStatusLight:", v4);
    goto LABEL_6;
  }
  objc_msgSend(v35, "cameraNightModeItem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v9, "isEqual:", v36);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v38;
  if (v37)
  {
    objc_msgSend(v38, "updateCameraNightMode:", v4);
    goto LABEL_6;
  }
  objc_msgSend(v38, "cameraDoorbellChimeMuteItem");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v9, "isEqual:", v39);

  if (v40)
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateDoorbellChimeMuteMode:", v4);
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(v9, "latestResults");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0D30D20];
  objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0D30D20]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v9, "latestResults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }
  v26 = v9;
  if (objc_msgSend(v26, "conformsToProtocol:", &unk_1EF299828))
    v27 = v26;
  else
    v27 = 0;
  v28 = v27;

  if (!objc_msgSend(v25, "length") && v28)
  {
    objc_msgSend(v28, "itemTitleLocalizationKey");
    v29 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v29;
  }
  v30 = (void *)MEMORY[0x1E0D31170];
  -[HUItemTableViewController itemManager](self, "itemManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sourceItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sendSwitchCellToggleEventForItem:isOn:title:fromSourceViewController:", v32, v4, v25, self);

}

- (void)mediaSystemEditor:(id)a3 didCreate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  HUMediaAccessoryAudioSettingsViewController *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsViewController.m"), 2045, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaSystem"));

  }
  v8 = objc_alloc(MEMORY[0x1E0D31508]);
  -[HUServiceDetailsViewController item](self, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithValueSource:mediaProfileContainer:", v10, v7);

  v12 = objc_alloc(MEMORY[0x1E0D31550]);
  objc_msgSend(v7, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithExistingObject:inHome:", v7, v13);

  v15 = -[HUMediaAccessoryAudioSettingsViewController initWithMediaSystemBuilder:mediaAccessoryItem:]([HUMediaAccessoryAudioSettingsViewController alloc], "initWithMediaSystemBuilder:mediaAccessoryItem:", v14, v11);
  -[HUMediaAccessoryAudioSettingsViewController setPresentationDelegate:](v15, "setPresentationDelegate:", self);
  -[HUServiceDetailsViewController _magicallyUpdateNavigationStackForNewRootItem:topViewController:](self, "_magicallyUpdateNavigationStackForNewRootItem:topViewController:", v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPresentationDelegate:", v16);

}

- (void)mediaSystemEditor:(id)a3 didAbortDueTo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "mediaProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsViewController.m"), 2059, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessoryNeedingUpdate.mediaProfile"));

  }
  v10 = (id)objc_msgSend(v7, "hf_fetchAvailableSoftwareUpdateWithOptions:", 0);
  v11 = objc_alloc(MEMORY[0x1E0D31508]);
  -[HUServiceDetailsViewController item](self, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (id)objc_msgSend(v11, "initWithValueSource:mediaProfileContainer:", v13, v14);
  -[HUServiceDetailsViewController _magicallyUpdateNavigationStackForNewRootItem:topViewController:](self, "_magicallyUpdateNavigationStackForNewRootItem:topViewController:", v17, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPresentationDelegate:", v15);

}

- (void)serviceGroupEditor:(id)a3 didCreateServiceGroup:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsViewController.m"), 2072, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceGroup"));

  }
  v8 = objc_alloc(MEMORY[0x1E0D317B8]);
  -[HUServiceDetailsViewController item](self, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithValueSource:serviceGroup:", v10, v7);

  -[HUServiceDetailsViewController _magicallyUpdateNavigationStackForNewRootItem:topViewController:](self, "_magicallyUpdateNavigationStackForNewRootItem:topViewController:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPresentationDelegate:", v12);

}

- (id)_magicallyUpdateNavigationStackForNewRootItem:(id)a3 topViewController:(id)a4
{
  id v7;
  id v8;
  HUServiceDetailsViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsViewController.m"), 2088, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  v9 = -[HUServiceDetailsViewController initWithServiceLikeItem:]([HUServiceDetailsViewController alloc], "initWithServiceLikeItem:", v7);
  -[HUServiceDetailsViewController presentationDelegate](self, "presentationDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsViewController setPresentationDelegate:](v9, "setPresentationDelegate:", v10);

  -[HUServiceDetailsViewController setRequiresPresentingViewControllerDismissal:](v9, "setRequiresPresentingViewControllerDismissal:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_safeAddObject:", v8);
  -[HUServiceDetailsViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsViewController presentingViewController](self, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    -[HUServiceDetailsViewController presentingViewController](self, "presentingViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(v17, "viewControllers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "na_firstObjectPassingTest:", &__block_literal_global_601);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "quickControlViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "presentationDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsViewController setPresentationDelegate:](v9, "setPresentationDelegate:", v21);

    v12 = v17;
  }
  objc_msgSend(v12, "setViewControllers:animated:", v11, 0);

  return v9;
}

uint64_t __98__HUServiceDetailsViewController__magicallyUpdateNavigationStackForNewRootItem_topViewController___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)detailsViewControllerFor:(id)a3 item:(id)a4
{
  id v5;
  id v6;
  HUServiceDetailsViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;

  v5 = a3;
  v6 = a4;
  v7 = -[HUServiceDetailsViewController initWithServiceLikeItem:]([HUServiceDetailsViewController alloc], "initWithServiceLikeItem:", v6);

  objc_msgSend(v5, "serviceContainingItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if ((v6 & 1) != 0)
  {
    -[HUServiceDetailsViewController detailsItemManager](v7, "detailsItemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldHideAccessoryItem:", 1);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v5, "serviceContainingItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HUServiceDetailsViewController detailsItemManager](v7, "detailsItemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldHideSeparateTileItem:", 1);
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

- (BOOL)hasDetailsActionFor:(id)a3 item:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EF2AC470) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)detailsViewControllerForContainedMediaAccessoryGridViewController:(id)a3 item:(id)a4
{
  id v4;
  HUServiceDetailsViewController *v5;

  v4 = a4;
  v5 = -[HUServiceDetailsViewController initWithServiceLikeItem:]([HUServiceDetailsViewController alloc], "initWithServiceLikeItem:", v4);

  return v5;
}

- (BOOL)hasDetailsActionForContainedServiceGridViewController:(id)a3 item:(id)a4
{
  return objc_msgSend(a4, "conformsToProtocol:", &unk_1EF2AC470);
}

- (id)detailsViewControllerForContainedServiceGridViewController:(id)a3 item:(id)a4
{
  id v5;
  id v6;
  HUServiceDetailsViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;

  v5 = a3;
  v6 = a4;
  v7 = -[HUServiceDetailsViewController initWithServiceLikeItem:]([HUServiceDetailsViewController alloc], "initWithServiceLikeItem:", v6);

  objc_msgSend(v5, "serviceContainerItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if ((v6 & 1) != 0)
  {
    -[HUServiceDetailsViewController detailsItemManager](v7, "detailsItemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldHideAccessoryItem:", 1);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v5, "serviceContainerItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HUServiceDetailsViewController detailsItemManager](v7, "detailsItemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldHideSeparateTileItem:", 1);
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

- (void)editRoomViewControllerDidFinish:(id)a3 withNewRoom:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D31700]);
    objc_msgSend(v7, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithExistingObject:inHome:", v7, v9);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectRoom:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__HUServiceDetailsViewController_editRoomViewControllerDidFinish_withNewRoom___block_invoke;
    v18[3] = &unk_1E6F4F4D0;
    objc_copyWeak(&v19, &location);
    v14 = (id)objc_msgSend(v12, "addSuccessBlock:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

    -[HUServiceDetailsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    if (v12)
    {
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __78__HUServiceDetailsViewController_editRoomViewControllerDidFinish_withNewRoom___block_invoke_2;
      v16[3] = &unk_1E6F4D188;
      v16[4] = self;
      v17 = v7;
      v15 = (id)objc_msgSend(v12, "addSuccessBlock:", v16);

    }
  }
  else
  {
    -[HUServiceDetailsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

void __78__HUServiceDetailsViewController_editRoomViewControllerDidFinish_withNewRoom___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "detailsItemManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setShowRoomsList:", 0);

}

void __78__HUServiceDetailsViewController_editRoomViewControllerDidFinish_withNewRoom___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_notifyOfHomeTheaterReconfigurationIfNecessary:", v2);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v4 = a3;
  -[HUServiceDetailsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[HUServiceDetailsViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForRowAtPoint:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayedItemAtIndexPath:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accessoryInfoItemProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v13);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_longPressRecognized:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (objc_msgSend(v17, "state") == 1)
  {
    -[HUServiceDetailsViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

    -[HUServiceDetailsViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathForRowAtPoint:", v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    -[HUServiceDetailsViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForRowAtIndexPath:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14 && objc_msgSend(v14, "allowCopyValueToPasteboard"))
    {
      objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "becomeFirstResponder");
      -[HUServiceDetailsViewController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      objc_msgSend(v15, "showMenuFromView:rect:", v16);

    }
  }

}

- (BOOL)_allowRowSelectionForItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  char v76;
  void *v77;
  void *v78;
  void *v79;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (-[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "canToggleAccessoryInfoItem:", v4),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGroupItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v11);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifyHomePodItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v13);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "separateTileItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v15);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "showContainedItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v17);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "createNewRoomItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v19);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pairingModeItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v21);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "exportDiagnosticsItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v4, "isEqual:", v23);

    if (v24)
    {
      objc_msgSend(v4, "latestResults");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B10]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26 || objc_msgSend(v26, "isFinished"))
      {
        -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "exportDiagnosticsItem");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "na_safeAddObject:", v28);

      }
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v30);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "removeFromGroupItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v32);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "resetItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v34);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "restartItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v36);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "accessoryItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v38);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "alarmItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v40);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "lockPinCodesItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v42);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "statusAndNotificationItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v44);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "homeTheaterAudioOutputItem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v46);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "managedConfigurationProfilesItem");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v48);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "roomItem");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v50);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "associatedServiceTypeItem");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v52);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "audioSettingsItem");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v54);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "internalDebuggingItem");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v56);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "splitMediaAccountUseDefaultAccountItem");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v58);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "splitMediaAccountSignoutAccountItem");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v60);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "cameraActivityZonesItem");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v62);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "cameraRecordingOptionsItem");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v64);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "cameraFaceRecognitionItem");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v66);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "collectDiagnosticsItem");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v68);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "lockAddHomeKeyToWalletItem");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v70);

    if ((objc_msgSend(v9, "containsObject:", v4) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v4);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v71;
      if (v71 && (objc_msgSend(v71, "canSelectItem:", v4) & 1) != 0)
        goto LABEL_17;
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "existingRoomItemProvider");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "items");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "containsObject:", v4);

      if ((v76 & 1) != 0)
      {
LABEL_17:
        v7 = 1;
      }
      else
      {
        -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "suggestedRoomItemProvider");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "items");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v79, "containsObject:", v4);

      }
    }

  }
  return v7;
}

- (BOOL)_allowRowHighlightForItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;

  v4 = a3;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canToggleAccessoryInfoItem:", v4);

  v7 = (v6 & 1) == 0
    && -[HUServiceDetailsViewController _allowRowSelectionForItem:](self, "_allowRowSelectionForItem:", v4);

  return v7;
}

- (BOOL)_shouldShowDetailDisclosureForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char isKindOfClass;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showContainedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v7);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v9);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alarmItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v11);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lockPinCodesItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v13);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "statusAndNotificationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v15);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "homeTheaterAudioOutputItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v17);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "audioSettingsItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v19);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "internalDebuggingItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v21);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "cameraRecordingOptionsItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v23);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "cameraFaceRecognitionItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v25);

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "cameraActivityZonesItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v27);

  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = !-[HUServiceDetailsViewController _shouldShowAddButtonForOptionItem:](self, "_shouldShowAddButtonForOptionItem:", v4);
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
  }

  return isKindOfClass & 1;
}

- (BOOL)_shouldShowAddButtonForOptionItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  v3 = a3;
  objc_msgSend(v3, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "triggerValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("itemIsEditable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v7)
    v11 = 0;
  else
    v11 = v10;

  return v11;
}

- (void)checkForAccessoriesNeedingReprovisioning
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "sourceItemAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "accessoryReprovisionState"))
  {
    if (!objc_msgSend(v6, "hf_needsReprovisioningCheck"))
      goto LABEL_10;
    objc_msgSend(v7, "startSearchForAccessoriesNeedingReprovisioning");
  }
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2048;
    v12 = objc_msgSend(v6, "accessoryReprovisionState");
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "checkForAccessoriesNeedingReprovisioning accessory %@ state %lu", (uint8_t *)&v9, 0x16u);
  }

LABEL_10:
}

- (void)_restartGroupedHomePodAccessory
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HUServiceDetailsViewController _restartGroupedHomePodAccessory]";
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restartAccessory");

}

- (void)_presentResetHomePodConfirmation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];

  v4 = a3;
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRestartHomePodAlertButtonTitle"), CFSTR("HUServiceDetailsRestartHomePodAlertButtonTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRemoveDeviceName"), CFSTR("HUServiceDetailsRemoveDeviceName"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", 0, 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__HUServiceDetailsViewController__presentResetHomePodConfirmation___block_invoke;
  v18[3] = &unk_1E6F4C6E0;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v5, 0, v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v9);

  v10 = (void *)MEMORY[0x1E0CEA2E0];
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __67__HUServiceDetailsViewController__presentResetHomePodConfirmation___block_invoke_607;
  v16[3] = &unk_1E6F526C8;
  v16[4] = self;
  v17 = v4;
  v11 = v4;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v6, 2, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v12);

  v13 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRemoveDeviceAlertCancelButton"), CFSTR("HUServiceDetailsRemoveDeviceAlertCancelButton"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, &__block_literal_global_611);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v15);

  -[HUServiceDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

void __67__HUServiceDetailsViewController__presentResetHomePodConfirmation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[HUServiceDetailsViewController _presentResetHomePodConfirmation:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped restart homepod button '%@' from alert", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_restartHomePod");

}

void __67__HUServiceDetailsViewController__presentResetHomePodConfirmation___block_invoke_607(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[HUServiceDetailsViewController _presentResetHomePodConfirmation:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped remove accessory '%@' from alert", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_presentRemoveConfirmation:", *(_QWORD *)(a1 + 40));

}

void __67__HUServiceDetailsViewController__presentResetHomePodConfirmation___block_invoke_610(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315394;
    v6 = "-[HUServiceDetailsViewController _presentResetHomePodConfirmation:]_block_invoke";
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped remove device '%@' from alert", (uint8_t *)&v5, 0x16u);

  }
}

- (void)_exportDiagnosticsForItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  HUServiceDetailsViewController *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[HUServiceDetailsViewController _exportDiagnosticsForItem:]";
    v25 = 2112;
    v26 = self;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%s(%@)initiating 'Export Diagnostics'", buf, 0x16u);
  }

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceItemAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hf_settingsAdapterManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "adapterForIdentifier:", *MEMORY[0x1E0D30128]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = &unk_1EF348030;
  if (objc_msgSend(v10, "conformsToProtocol:", v11))
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;

  if (!v13)
    NSLog(CFSTR("Adapter doesn't exist."));
  objc_msgSend(v13, "handleButtonPressForEntity:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Sysdiagnose request sent", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__HUServiceDetailsViewController__exportDiagnosticsForItem___block_invoke;
  v19[3] = &unk_1E6F56C28;
  objc_copyWeak(&v22, (id *)buf);
  v16 = v4;
  v20 = v16;
  v17 = v13;
  v21 = v17;
  v18 = (id)objc_msgSend(v14, "flatMap:", v19);
  -[HUServiceDetailsViewController _registerButtonActionHandler:item:](self, "_registerButtonActionHandler:item:", v14, v16);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

}

id __60__HUServiceDetailsViewController__exportDiagnosticsForItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(id *);
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Sysdiagnose request completed with results: %@", buf, 0xCu);
  }

  v9 = objc_alloc(MEMORY[0x1E0CEA2D8]);
  HFLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithActivityItems:applicationActivities:", v11, 0);

  objc_msgSend(WeakRetained, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "itemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "indexPathForItem:", *(_QWORD *)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cellForRowAtIndexPath:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "popoverPresentationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSourceView:", v16);

  objc_msgSend(v16, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v12, "popoverPresentationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSourceRect:", v19, v21, v23, v25);

  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __60__HUServiceDetailsViewController__exportDiagnosticsForItem___block_invoke_625;
  v34 = &unk_1E6F4E020;
  v35 = v12;
  v36 = *(id *)(a1 + 40);
  v37 = v7;
  v27 = v7;
  v28 = v12;
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v28, 0, &v31);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", v31, v32, v33, v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

void __60__HUServiceDetailsViewController__exportDiagnosticsForItem___block_invoke_625(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__HUServiceDetailsViewController__exportDiagnosticsForItem___block_invoke_2;
  v3[3] = &unk_1E6F4C638;
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, v3);

}

void __60__HUServiceDetailsViewController__exportDiagnosticsForItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D319D0], "deviceAirDropIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v2;
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Share Sheet has generated AirPlayId (%@) making 'airdrop sysdiagnose' request...", (uint8_t *)&v8, 0xCu);
    }

    objc_opt_class();
    v4 = *(id *)(a1 + 32);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    v7 = (id)-[NSObject airDropSysdiagnose:](v6, "airDropSysdiagnose:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    NSLog(CFSTR("AirDrop Identifier is nil after presentation dance!"));
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "Share Sheet failed to generate AirPlayID", (uint8_t *)&v8, 2u);
    }
  }

}

- (void)_presentRemoveFromGroupConfirmation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v4 = a3;
  -[HUServiceDetailsViewController namingComponent](self, "namingComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HURemoveFromGroupMessage"), CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", 0, v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HURemoveTitle"), CFSTR("HURemoveTitle"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __70__HUServiceDetailsViewController__presentRemoveFromGroupConfirmation___block_invoke;
  v21[3] = &unk_1E6F4C6E0;
  v21[4] = self;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 2, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v17);

  v18 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, &__block_literal_global_636);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v20);

  -[HUServiceDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

void __70__HUServiceDetailsViewController__presentRemoveFromGroupConfirmation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[HUServiceDetailsViewController _presentRemoveFromGroupConfirmation:]_block_invoke";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped remove button '%@' from alert", (uint8_t *)&v7, 0x16u);

  }
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "_removeFromGroup");

}

void __70__HUServiceDetailsViewController__presentRemoveFromGroupConfirmation___block_invoke_635(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315394;
    v6 = "-[HUServiceDetailsViewController _presentRemoveFromGroupConfirmation:]_block_invoke";
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button '%@' from alert", (uint8_t *)&v5, 0x16u);

  }
}

- (void)_presentRemoveConfirmation:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceItemAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsCHIP");

  if (v6)
    -[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:](self, "_presentEcosystemAccessoryRemoveConfirmation:", v7);
  else
    -[HUServiceDetailsViewController _presentHomeAccessoryRemoveConfirmation:](self, "_presentHomeAccessoryRemoveConfirmation:", v7);

}

- (void)_presentEcosystemAccessoryRemoveConfirmation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_opt_class();
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectedServicesItemModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectedServicesItemProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "connectedEcosystemsFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke;
  v13[3] = &unk_1E6F56EB8;
  objc_copyWeak(&v15, &location);
  v11 = v4;
  v14 = v11;
  v12 = (id)objc_msgSend(v10, "addCompletionBlock:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  HUMatterAccessoryRemovalHelper *v8;
  void *v9;
  void *v10;
  HUMatterAccessoryRemovalHelper *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HUMatterAccessoryRemovalHelper *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  HUMatterAccessoryRemovalHelper *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  HUMatterAccessoryRemovalHelper *v32;
  id v33;
  id v34;
  id location[2];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = [HUMatterAccessoryRemovalHelper alloc];
  objc_msgSend(WeakRetained, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUMatterAccessoryRemovalHelper initWithItem:connectedEcosystems:](v8, "initWithItem:connectedEcosystems:", v9, v10);

  if (-[HUMatterAccessoryRemovalHelper shouldUseEcosystemRemovalConfirmation](v11, "shouldUseEcosystemRemovalConfirmation"))
  {
    v26 = v6;
    objc_msgSend(WeakRetained, "namingComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMatterAccessoryRemovalHelper matterAccessoryGenerateRemovalConfirmationForAccessoryName:](v11, "matterAccessoryGenerateRemovalConfirmationForAccessoryName:", v13);

    -[HUMatterAccessoryRemovalHelper title](v11, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "hu_actionSheetWithTitle:message:indexPath:", 0, v14, *(_QWORD *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(location, WeakRetained);
    v16 = (void *)MEMORY[0x1E0CEA2E0];
    -[HUMatterAccessoryRemovalHelper removalActionTitle](v11, "removalActionTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_2;
    v31[3] = &unk_1E6F51FB8;
    objc_copyWeak(&v34, location);
    v18 = v11;
    v32 = v18;
    v33 = *(id *)(a1 + 32);
    objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 2, v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v19);

    v20 = (void *)MEMORY[0x1E0CEA2E0];
    -[HUMatterAccessoryRemovalHelper resetAllActionTitle](v18, "resetAllActionTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_642;
    v27[3] = &unk_1E6F51FB8;
    objc_copyWeak(&v30, location);
    v28 = v18;
    v29 = *(id *)(a1 + 32);
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 2, v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v22);

    v23 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRemoveDeviceAlertCancelButton"), CFSTR("HUServiceDetailsRemoveDeviceAlertCancelButton"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 1, &__block_literal_global_648);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v25);

    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v15, 1, 0);
    objc_destroyWeak(&v30);

    objc_destroyWeak(&v34);
    objc_destroyWeak(location);

    v6 = v26;
  }
  else
  {
    objc_msgSend(WeakRetained, "_presentHomeAccessoryRemoveConfirmation:", *(_QWORD *)(a1 + 32));
  }

}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:]_block_invoke_2";
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from alert", buf, 0x16u);
  }

  v6 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "removalActionConfirmationTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "hu_actionSheetWithTitle:message:indexPath:", 0, v7, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, WeakRetained);
  v9 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(*v6, "removalActionConfirmationButtonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_639;
  v15[3] = &unk_1E6F56E30;
  objc_copyWeak(&v16, (id *)buf);
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 2, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v11);

  v12 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRemoveDeviceAlertCancelButton"), CFSTR("HUServiceDetailsRemoveDeviceAlertCancelButton"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, &__block_literal_global_641);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v14);

  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, 0);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_639(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:]_block_invoke";
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User tapped removal '%{public}@' from alert", (uint8_t *)&v7, 0x16u);
  }

  v6 = (id)objc_msgSend(WeakRetained, "_removeItem");
}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_640(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:]_block_invoke";
    v6 = 2114;
    v7 = v2;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped remove device '%{public}@' from alert", (uint8_t *)&v4, 0x16u);
  }

}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_642(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v19 = "-[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:]_block_invoke";
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User tapped reset all action '%@' from alert", buf, 0x16u);

  }
  v7 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "resetAllActionConfirmationTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "hu_actionSheetWithTitle:message:indexPath:", 0, v8, *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, WeakRetained);
  v10 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(*v7, "resetAllActionConfirmationButtonTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_643;
  v16[3] = &unk_1E6F56E30;
  objc_copyWeak(&v17, (id *)buf);
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 2, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v12);

  v13 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRemoveDeviceAlertCancelButton"), CFSTR("HUServiceDetailsRemoveDeviceAlertCancelButton"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, &__block_literal_global_646);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v15);

  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_643(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v14 = "-[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:]_block_invoke";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User tapped reset all action confirmation button '%@' from alert", buf, 0x16u);

  }
  objc_msgSend(WeakRetained, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_644;
  v12[3] = &unk_1E6F4E2D8;
  v12[4] = WeakRetained;
  objc_msgSend(v8, "resetAndRemoveAllCHIPPairingsFromAccessory:completion:", v11, v12);

}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_644(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setRequiresPresentingViewControllerDismissal:", 1);
  objc_msgSend(*(id *)(a1 + 32), "presentationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "finishPresentation:animated:", *(_QWORD *)(a1 + 32), 1);

  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "failed to remove accessory from all connected ecosystems, error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Removed accessory from all connected ecosystems", (uint8_t *)&v8, 2u);
  }

}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_645(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from alert", (uint8_t *)&v4, 0x16u);
  }

}

void __79__HUServiceDetailsViewController__presentEcosystemAccessoryRemoveConfirmation___block_invoke_647(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[HUServiceDetailsViewController _presentEcosystemAccessoryRemoveConfirmation:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from alert", (uint8_t *)&v4, 0x16u);
  }

}

- (void)_presentHomeAccessoryRemoveConfirmation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  _QWORD v115[5];

  v4 = a3;
  -[HUServiceDetailsViewController item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF2AC600))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRemoveGroupAlertTitle"), CFSTR("HUServiceDetailsRemoveGroupAlertTitle"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRemoveGroupAlertButton"), CFSTR("HUServiceDetailsRemoveGroupAlertButton"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[HUServiceDetailsViewController item](self, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = objc_msgSend(v7, "isItemGroup");
  if ((v13 & 1) == 0)
  {
    -[HUServiceDetailsViewController namingComponent](self, "namingComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUServiceDetailsRemoveDeviceAlertTitle"), CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    _HULocalizedStringWithDefaultValue(CFSTR("HURemoveTitle"), CFSTR("HURemoveTitle"), 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    -[HUServiceDetailsViewController item](self, "item");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    v26 = v25;

    objc_msgSend(v26, "profile");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v26) = objc_msgSend(v27, "hf_supportsRecordingEvents");
    if ((_DWORD)v26)
    {
      -[HUServiceDetailsViewController namingComponent](self, "namingComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUServiceDetailsRemoveCameraWithClipsAlertTitle"), CFSTR("%@"), v30, v31, v32, v33, v34, v35, (uint64_t)v29);
      v36 = objc_claimAutoreleasedReturnValue();

      _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRemoveDeviceAlertRemoveCameraButton"), CFSTR("HUServiceDetailsRemoveDeviceAlertRemoveCameraButton"), 1);
      v37 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v37;
      v22 = (void *)v36;
    }
    objc_opt_class();
    -[HUServiceDetailsViewController item](self, "item");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = v38;
    else
      v39 = 0;

    v114 = v4;
    if (v39)
    {
      v40 = (void *)MEMORY[0x1E0CB3940];
      HULocalizedWiFiString(CFSTR("HUServiceDetailsRemoveRouterAlertTitle"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUServiceDetailsViewController namingComponent](self, "namingComponent");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "name");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithValidatedFormat:validFormatSpecifiers:error:", v41, CFSTR("%@"), 0, v43);
      v44 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v44;
    }
    objc_msgSend(v12, "accessories");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "na_any:", &__block_literal_global_663);

    objc_msgSend(v12, "accessories");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "na_firstObjectPassingTest:", &__block_literal_global_664);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "hf_displayName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      HULocalizedStringWithFormat(CFSTR("HUServiceDetailsRemoveHomePodAlertTitle"), CFSTR("%@"), v50, v51, v52, v53, v54, v55, (uint64_t)v49);
      v56 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v56;
    }
    objc_opt_class();
    -[HUServiceDetailsViewController item](self, "item");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v58 = v57;
    else
      v58 = 0;
    v59 = v58;

    v113 = v23;
    if (v59)
    {
      objc_msgSend(v59, "service");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "accessory");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "hf_isHomePod");

      if (v62)
      {
        objc_msgSend(v59, "service");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "accessory");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "hf_displayName");
        v65 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v59, "service");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "name");
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        HULocalizedStringWithFormat(CFSTR("HUServiceDetailsRemoveAccessoryWithServiceAlertTitle"), CFSTR("%@%@"), v68, v69, v70, v71, v72, v73, (uint64_t)v67);
        v74 = objc_claimAutoreleasedReturnValue();

        v49 = (void *)v65;
        v22 = (void *)v74;
      }
    }
    objc_msgSend(v12, "accessories");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "allObjects");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "firstObject");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "home");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "hf_enabledResidentDevices");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v79, "count") == 1)
    {
      v111 = v49;
      v112 = v22;
      objc_msgSend(v12, "home");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "hf_enabledResidentDevices");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "hf_linkedResidentDevice");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v81, "containsObject:", v82);

      if (!v83 || (objc_msgSend(v77, "hf_isHomePod") & 1) == 0 && !objc_msgSend(v77, "hf_isAppleTV"))
      {
        v9 = v113;
        v4 = v114;
        v49 = v111;
        v22 = v112;
        goto LABEL_33;
      }
      objc_msgSend(v77, "hf_displayName");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUServiceDetailsRemoveLastResidentAlertTitle"), CFSTR("%@"), v84, v85, v86, v87, v88, v89, (uint64_t)v78);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v111;
      v79 = v112;
    }

    v9 = v113;
    v4 = v114;
LABEL_33:

    v8 = v22;
  }
  -[HUServiceDetailsViewController item](self, "item");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "accessories");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "na_any:", &__block_literal_global_671);

  if (v92)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRemoveDeviceAlertTitleManualNetworkReconfiguration"), CFSTR("HUServiceDetailsRemoveDeviceAlertTitleManualNetworkReconfiguration"), 1);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUServiceDetailsRemoveDeviceAlertTitleManualNetworkReconfiguration_Format"), CFSTR("%@%@"), v93, v94, v95, v96, v97, v98, (uint64_t)v8);
    v99 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v99;
  }
  if (objc_msgSend(v12, "mediaAccessoryItemType") == 4)
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "home");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaProfileContainer");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "hf_relatedHomeTheaterMediaProfileContainerFor:", v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    if (v103)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUBreakHomeTheaterAlert_Body"), CFSTR("HUBreakHomeTheaterAlert_Body"), 1);
      v104 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v104;
    }
  }
  -[UITableViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", 0, v8, v4);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = MEMORY[0x1E0C809B0];
  v115[1] = 3221225472;
  v115[2] = __74__HUServiceDetailsViewController__presentHomeAccessoryRemoveConfirmation___block_invoke_5;
  v115[3] = &unk_1E6F4C6E0;
  v115[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v9, 2, v115);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "addAction:", v106);

  v107 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRemoveDeviceAlertCancelButton"), CFSTR("HUServiceDetailsRemoveDeviceAlertCancelButton"), 1);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "actionWithTitle:style:handler:", v108, 1, &__block_literal_global_681);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "addAction:", v109);

  -[HUServiceDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v105, 1, 0);
}

uint64_t __74__HUServiceDetailsViewController__presentHomeAccessoryRemoveConfirmation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7A58]);

  return v4;
}

uint64_t __74__HUServiceDetailsViewController__presentHomeAccessoryRemoveConfirmation___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isHomePod");
}

uint64_t __74__HUServiceDetailsViewController__presentHomeAccessoryRemoveConfirmation___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "hf_networkConfigurationProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_673);

  return v3;
}

uint64_t __74__HUServiceDetailsViewController__presentHomeAccessoryRemoveConfirmation___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_requiresWiFiReconfiguration");
}

void __74__HUServiceDetailsViewController__presentHomeAccessoryRemoveConfirmation___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[HUServiceDetailsViewController _presentHomeAccessoryRemoveConfirmation:]_block_invoke_5";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from alert", (uint8_t *)&v8, 0x16u);
  }

  v5 = objc_msgSend(*(id *)(a1 + 32), "_shouldPresentRemoveRouterConfirmation");
  v6 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v6, "_presentRemoveRouterConfirmation");
  else
    v7 = (id)objc_msgSend(v6, "_removeItem");

}

void __74__HUServiceDetailsViewController__presentHomeAccessoryRemoveConfirmation___block_invoke_680(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[HUServiceDetailsViewController _presentHomeAccessoryRemoveConfirmation:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from alert", (uint8_t *)&v4, 0x16u);
  }

}

- (BOOL)_shouldPresentRemoveRouterConfirmation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  objc_opt_class();
  -[HUServiceDetailsViewController item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_accessoriesRequiringManualWiFiReconfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_presentRemoveRouterConfirmation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD aBlock[4];
  id v27;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__HUServiceDetailsViewController__presentRemoveRouterConfirmation__block_invoke;
  aBlock[3] = &unk_1E6F56E30;
  objc_copyWeak(&v27, &location);
  v4 = _Block_copy(aBlock);
  v24[0] = v3;
  v24[1] = 3221225472;
  v24[2] = __66__HUServiceDetailsViewController__presentRemoveRouterConfirmation__block_invoke_2;
  v24[3] = &unk_1E6F56E30;
  objc_copyWeak(&v25, &location);
  v5 = _Block_copy(v24);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_accessoriesRequiringManualWiFiReconfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  HULocalizedWiFiString(CFSTR("HUNetworkRouterRemoveAlertTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  HULocalizedWiFiString(CFSTR("HUNetworkRouterRemoveAlertDescriptionFormat"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%ld"), 0, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v10, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUNetworkRouterRemoveAlertButtonRemove"), CFSTR("HUNetworkRouterRemoveAlertButtonRemove"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 2, v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v17);

  v18 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUNetworkRouterRemoveAlertButtonMoreInformation"), CFSTR("HUNetworkRouterRemoveAlertButtonMoreInformation"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v20);

  v21 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUNetworkRouterRemoveAlertButtonCancel"), CFSTR("HUNetworkRouterRemoveAlertButtonCancel"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 1, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v23);

  -[HUServiceDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __66__HUServiceDetailsViewController__presentRemoveRouterConfirmation__block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "_removeItem");

}

void __66__HUServiceDetailsViewController__presentRemoveRouterConfirmation__block_invoke_2(uint64_t a1)
{
  HURemoveNetworkRouterMoreInformationViewController *v1;
  void *v2;
  void *v3;
  HURemoveNetworkRouterMoreInformationViewController *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [HURemoveNetworkRouterMoreInformationViewController alloc];
  objc_msgSend(WeakRetained, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HURemoveNetworkRouterMoreInformationViewController initWithHome:](v1, "initWithHome:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v4);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v5, 1, 0);

}

- (id)_roomForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC470))
    v4 = v3;
  else
    v4 = 0;
  objc_msgSend(v4, "homeKitObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF2D9368))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "hf_parentRoom");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_presentTriggerEditorForProgrammableSwitchEventOptionItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  HUTriggerBuilderContext *v14;
  void *v15;
  void *v16;
  HUTriggerBuilderContext *v17;
  void *v18;
  HUTriggerSummaryViewController *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;

  v35 = a3;
  objc_msgSend(v35, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "characteristics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_696);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v6, "hf_currentUserIsAdministrator"))
    {
      objc_msgSend(v35, "latestResults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("itemIsEditable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      if (v11)
      {
        objc_msgSend(v35, "triggerValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = [HUTriggerBuilderContext alloc];
        objc_msgSend(v35, "latestResults");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", CFSTR("triggerBuilderContext"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[HUTriggerBuilderContext initWithTriggerBuilderContext:](v14, "initWithTriggerBuilderContext:", v16);

        if (v13)
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D313C0]), "initWithExistingObject:inHome:context:", v13, v6, v17);
          v19 = -[HUTriggerSummaryViewController initWithTriggerBuilder:mode:isPresentedModally:delegate:]([HUTriggerSummaryViewController alloc], "initWithTriggerBuilder:mode:isPresentedModally:delegate:", v18, 1, 1, self);
        }
        else
        {
          -[HUServiceDetailsViewController home](self, "home");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "hf_currentUserIsAdministrator");

          if (v21)
          {
            NSLog(CFSTR("User is not an administrator and as such, cannot create a new programmable switch action!"));
            v19 = 0;
            v18 = 0;
          }
          else
          {
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D313C0]), "initWithHome:context:", v6, v17);
            objc_msgSend(v18, "characteristicInterface");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "triggerValue");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setCharacteristic:triggerValue:", v8, v23);

            v19 = -[HUTriggerActionPickerViewController initWithTriggerBuilder:mode:delegate:]([HUTriggerActionPickerViewController alloc], "initWithTriggerBuilder:mode:delegate:", v18, 0, self);
            v24 = objc_alloc(MEMORY[0x1E0CEA380]);
            _HULocalizedStringWithDefaultValue(CFSTR("HUProgrammableSwitchTriggerSetupCancelTitle"), CFSTR("HUProgrammableSwitchTriggerSetupCancelTitle"), 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (void *)objc_msgSend(v24, "initWithTitle:style:target:action:", v25, 2, self, sel_dismissTriggerActionEditorViewController_);

            v26 = (void *)MEMORY[0x1E0C99DE8];
            -[HUTriggerSummaryViewController navigationItem](v19, "navigationItem");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "leftBarButtonItems");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "arrayWithArray:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v29, "addObject:", v34);
            -[HUTriggerSummaryViewController navigationItem](v19, "navigationItem");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setLeftBarButtonItems:", v29);

          }
        }
        objc_msgSend(v18, "setShouldMarkTriggerAsHomeAppCreated:", 1, v34);
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v19);
        objc_msgSend(v31, "setModalPresentationStyle:", 2);
        -[HUServiceDetailsViewController navigationController](self, "navigationController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (id)objc_msgSend(v32, "hu_presentPreloadableViewController:animated:", v31, 1);

      }
    }
  }
  else
  {
    NSLog(CFSTR("Unable to find HUCharacteristicEventOptionItem; failing to present trigger editor!"));
    objc_msgSend(v6, "hf_currentUserIsAdministrator");
  }

}

uint64_t __92__HUServiceDetailsViewController__presentTriggerEditorForProgrammableSwitchEventOptionItem___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_msgSend(v2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8908]))
  {
    objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_programmableSwitchServiceTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)triggerEditor:(id)a3 shouldCommitTriggerBuilder:(id)a4
{
  return 1;
}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  id v17;

  v17 = a3;
  -[HUServiceDetailsViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v17);

  if (!v8)
  {
    -[HUServiceDetailsViewController presentedViewController](self, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    v14 = v12;
    if (v13 == v14)
    {

    }
    else
    {
      v15 = v14;
      if (!v13)
      {

LABEL_10:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsViewController.m"), 2809, CFSTR("triggerEditor:didFinishWithTriggerBuilder: shouldn't get here.  Ever."));
        goto LABEL_11;
      }
      v16 = objc_msgSend(v13, "isEqual:", v14);

      if ((v16 & 1) == 0)
        goto LABEL_10;
    }
    -[HUServiceDetailsViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);
    goto LABEL_11;
  }
  -[HUServiceDetailsViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "popToRootViewControllerAnimated:", 1);
LABEL_11:

}

- (void)dismissTriggerActionEditorViewController:(id)a3
{
  id v3;

  -[HUServiceDetailsViewController navigationController](self, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_setupProgrammableSwitchCell:(id)a3 forItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v5 = a4;
  objc_msgSend(v5, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "triggerValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("itemIsEditable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v5, "latestResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E88]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v19, "setHideIcon:", 1);
  objc_msgSend(v19, "setDisabled:", v12 ^ 1);
  objc_msgSend(v19, "setHideDescriptionIcon:", v11 ^ 1);
  if (objc_msgSend(v19, "isDisabled"))
    v15 = 0;
  else
    v15 = 3;
  objc_msgSend(v19, "setSelectionStyle:", v15);
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_exclamationMarkImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDescriptionIcon:", v16);

  objc_msgSend(v19, "setIconForegroundColorFollowsTintColor:", 1);
  objc_msgSend(v19, "setAccessoryView:", 0);
  objc_msgSend(v19, "setAccessoryType:", v12);
  if (!v9 && v12)
  {
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "_setTextColorFollowsTintColor:", 1);
    _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsProgrammableSwitchAdd"), CFSTR("HUServiceDetailsProgrammableSwitchAdd"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v18);

    objc_msgSend(v17, "sizeToFit");
    objc_msgSend(v19, "setAccessoryView:", v17);

  }
}

- (void)setShouldTrackProgrammableSwitchActivations:(BOOL)a3
{
  if (self->_shouldTrackProgrammableSwitchActivations != a3)
    self->_shouldTrackProgrammableSwitchActivations = a3;
}

- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v18 = a4;
  v7 = a5;
  if (-[HUServiceDetailsViewController shouldTrackProgrammableSwitchActivations](self, "shouldTrackProgrammableSwitchActivations"))
  {
    objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_programmableSwitchServiceTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "serviceType");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "containsObject:", v9))
      goto LABEL_7;
    objc_msgSend(v7, "characteristicType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB8908]);

    if (v11)
    {
      +[HOActivationManager sharedInstance](HOActivationManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastEnteredForegroundDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "valueUpdatedTime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "compare:", v8);

      if (v14 == -1)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v7, "value");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[HUItemTableViewController itemManager](self, "itemManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allDisplayedItems");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __84__HUServiceDetailsViewController_accessory_service_didUpdateValueForCharacteristic___block_invoke;
        v19[3] = &unk_1E6F4EEA8;
        v20 = v7;
        v9 = v9;
        v21 = v9;
        objc_msgSend(v16, "na_firstObjectPassingTest:", v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUItemTableViewController highlightItemAnimated:](self, "highlightItemAnimated:", v17);
      }
LABEL_7:

      goto LABEL_8;
    }
  }
LABEL_9:

}

BOOL __84__HUServiceDetailsViewController_accessory_service_didUpdateValueForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  _BOOL8 v10;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6
    && (objc_msgSend(v6, "characteristics"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 32)),
        v7,
        v8))
  {
    objc_msgSend(v6, "triggerValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "compare:", *(_QWORD *)(a1 + 40)) == 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)softwareUpdateModuleController:(id)a3 presentViewController:(id)a4
{
  return -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", a4, 1);
}

- (id)softwareUpdateModuleController:(id)a3 dismissViewController:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__HUServiceDetailsViewController_softwareUpdateModuleController_dismissViewController___block_invoke;
  v8[3] = &unk_1E6F4D988;
  v6 = v5;
  v9 = v6;
  -[HUServiceDetailsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);

  return v6;
}

uint64_t __87__HUServiceDetailsViewController_softwareUpdateModuleController_dismissViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

- (id)softwareUpdateModuleController:(id)a3 navigateToViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HUServiceDetailsViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hu_pushPreloadableViewController:animated:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)didRemoveCHIPPairingforAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Receive CHIPPairing removal for: %@", (uint8_t *)&v23, 0xCu);
  }

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2544A8))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "homeKitObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqual:", v4) & 1) != 0)
    goto LABEL_7;
  v14 = objc_msgSend(v10, "isEqual:", v4);
  if (v4)
  {
    if ((v14 & 1) == 0)
    {
      objc_msgSend(v4, "cameraProfiles");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsObject:", v10);

      if ((v16 & 1) != 0)
        goto LABEL_7;
      objc_msgSend(v4, "mediaProfile");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqual:", v10);

      if ((v18 & 1) != 0)
        goto LABEL_7;
      objc_msgSend(v4, "profiles");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "containsObject:", v10);

      if ((v20 & 1) != 0
        || (objc_msgSend(v4, "services"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v21, "containsObject:", v10),
            v21,
            v22))
      {
LABEL_7:
        HFLogForCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 138412290;
          v24 = v10;
          _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "Dismissing card after CHIPPairing removal of currently displayed homekitObject: %@", (uint8_t *)&v23, 0xCu);
        }

        -[HUServiceDetailsViewController setRequiresPresentingViewControllerDismissal:](self, "setRequiresPresentingViewControllerDismissal:", 1);
        -[HUServiceDetailsViewController presentationDelegate](self, "presentationDelegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (id)objc_msgSend(v12, "finishPresentation:animated:", self, 1);

      }
    }
  }

}

- (id)childServiceEditorModuleController:(id)a3 didSelectItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  HUServiceDetailsViewController *v8;
  HUValveEditorViewController *v9;
  void *v10;
  void *v11;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    v9 = -[HUValveEditorViewController initWithSourceItem:editorMode:]([HUValveEditorViewController alloc], "initWithSourceItem:editorMode:", v8, 0);
    -[HUServiceDetailsViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hu_pushPreloadableViewController:animated:", v9, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = -[HUServiceDetailsViewController initWithServiceLikeItem:]([HUServiceDetailsViewController alloc], "initWithServiceLikeItem:", v5);
    -[HUServiceDetailsViewController navigationController](self, "navigationController");
    v9 = (HUValveEditorViewController *)objc_claimAutoreleasedReturnValue();
    -[HUValveEditorViewController hu_pushPreloadableViewController:animated:](v9, "hu_pushPreloadableViewController:animated:", v8, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  char v15;
  int v17;
  HUServiceDetailsViewController *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  length = a5.length;
  location = a5.location;
  v21 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a3;
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = self;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v17, 0x16u);
  }

  -[HUServiceDetailsViewController textViewDelegate](self, "textViewDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "textView:shouldInteractWithURL:inRange:interaction:", v12, v11, location, length, a6);

  return v15;
}

- (void)moduleController:(id)a3 expandModule:(id)a4
{
  id v5;
  HUHomeKitAccessorySettingsDetailsViewController *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = -[HUHomeKitAccessorySettingsDetailsViewController initWithCollapsedAccessorySettingItemModule:]([HUHomeKitAccessorySettingsDetailsViewController alloc], "initWithCollapsedAccessorySettingItemModule:", v5);
  -[HUServiceDetailsViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "hu_pushPreloadableViewController:animated:", v6, 1);

  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Now expanding module [%@] to show settings", (uint8_t *)&v11, 0xCu);
  }

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "User tapped to expand module %@", (uint8_t *)&v11, 0xCu);
  }

}

- (void)moduleController:(id)a3 presentSettingDetailsViewController:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    -[HUServiceDetailsViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "hu_pushPreloadableViewController:animated:", v5, 1);

    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Now presenting settings details view controller [%@]", (uint8_t *)&v10, 0xCu);
    }

    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "User tapped to present settings details view controller [%@]", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)_presentContainedItems
{
  void *v2;
  BOOL v5;
  const char *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  HUContainedAccessoryElementsGridViewController *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  unint64_t v26;

  v5 = -[HUServiceDetailsViewController isItemGroup](self, "isItemGroup");
  if (v5)
  {
    v6 = a2;
    v7 = 0;
    v8 = 0;
  }
  else
  {
    -[HUServiceDetailsViewController item](self, "item");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "conformsToProtocol:", &unk_1EF3166A8) & 1) != 0)
    {
      v6 = a2;
      v7 = 0;
      v8 = 0;
    }
    else
    {
      -[HUServiceDetailsViewController item](self, "item");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v9;
      if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EF316598) & 1) != 0)
      {
        v6 = a2;
        v7 = 0;
        v8 = 1;
      }
      else
      {
        -[HUServiceDetailsViewController item](self, "item");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EF2AC600) & 1) == 0)
        {

LABEL_17:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUServiceDetailsViewController item](self, "item");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsViewController.m"), 3002, CFSTR("Selected 'showContainedServices' row, but the displayed item doesn't conform to the right protocols: %@"), v14);

          goto LABEL_18;
        }
        v24 = v10;
        v6 = a2;
        v7 = 1;
        v8 = 1;
      }
    }
  }
  -[HUServiceDetailsViewController item](self, "item");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EF254560);

  if (!v7)
  {
    if (!v8)
      goto LABEL_14;
    goto LABEL_13;
  }

  if ((v8 & 1) != 0)
LABEL_13:

LABEL_14:
  if (!v5)

  a2 = v6;
  if ((v12 & 1) == 0)
    goto LABEL_17;
LABEL_18:
  objc_opt_class();
  -[HUServiceDetailsViewController item](self, "item");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v26 = v16;

  -[HUServiceDetailsViewController item](self, "item");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "conformsToProtocol:", &unk_1EF3166A8))
  {

LABEL_24:
    -[HUServiceDetailsViewController item](self, "item");
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  -[HUServiceDetailsViewController item](self, "item");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "conformsToProtocol:", &unk_1EF316598);

  if (v19)
    goto LABEL_24;
  v20 = 0;
LABEL_26:
  if (v26 | v20)
  {
    v21 = -[HUContainedAccessoryElementsGridViewController initWithServiceContainingItem:mediaItem:isPresentedModally:shouldGroupByRoom:valueSource:]([HUContainedAccessoryElementsGridViewController alloc], "initWithServiceContainingItem:mediaItem:isPresentedModally:shouldGroupByRoom:valueSource:", v20, v26, 0, 1, 0);
    -[HUContainedAccessoryElementsGridViewController setServiceGridDelegate:](v21, "setServiceGridDelegate:", self);
    -[HUContainedAccessoryElementsGridViewController setPresentationDelegate:](v21, "setPresentationDelegate:", self);
    -[HUServiceDetailsViewController navigationController](self, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v22, "hu_pushPreloadableViewController:animated:", v21, 1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsViewController.m"), 3054, CFSTR("Unable to present grouped accessory view controller; please file a radar on \"Home App | New Bugs\"));
  }

}

- (void)_presentGroupPicker
{
  NSObject *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  HUMediaSystemEditorViewController *v9;
  void *v10;
  void *v11;
  HUMediaSystemEditorViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  const char *v25;
  __int16 v26;
  HUServiceDetailsViewController *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HUServiceDetailsViewController item](self, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 136315650;
    v25 = "-[HUServiceDetailsViewController _presentGroupPicker]";
    v26 = 2112;
    v27 = self;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "User selected %s(%@) for %@", (uint8_t *)&v24, 0x20u);

  }
  if ((_os_feature_enabled_impl() & 1) != 0
    || (-[HUServiceDetailsViewController item](self, "item"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) == 0))
  {
    -[HUServiceDetailsViewController item](self, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "services");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    -[HUServiceDetailsViewController item](self, "item");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v12 = v16;

    if (v12)
    {
      -[HUMediaSystemEditorViewController accessory](v12, "accessory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hf_groupableServices");
      v18 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v18;
    }
    objc_msgSend(v8, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController itemManager](self, "itemManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "home");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUServiceGroupEditorViewController forCreatingNewServiceGroupWithServices:inHome:](HUServiceGroupEditorViewController, "forCreatingNewServiceGroupWithServices:inHome:", v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setPresentationDelegate:", self);
    objc_msgSend(v22, "setServiceGroupEditorDelegate:", self);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v22);

  }
  else
  {
    -[HUServiceDetailsViewController item](self, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [HUMediaSystemEditorViewController alloc];
    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HUMediaSystemEditorViewController initWithAccessories:home:](v9, "initWithAccessories:home:", v8, v11);

    -[HUMediaSystemEditorViewController setPresentationDelegate:](v12, "setPresentationDelegate:", self);
    -[HUMediaSystemEditorViewController setDelegate:](v12, "setDelegate:", self);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v12);
  }

  objc_msgSend(v13, "setModalPresentationStyle:", 2);
  v23 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v13, 1);

}

- (void)_identifyHomePod
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  HUServiceDetailsViewController *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HUServiceDetailsViewController homePodIdentifyFuture](self, "homePodIdentifyFuture");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[HUServiceDetailsViewController homePodIdentifyFuture](self, "homePodIdentifyFuture"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isFinished"),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUServiceDetailsViewController homePodIdentifyFuture](self, "homePodIdentifyFuture");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUServiceDetailsViewController homePodIdentifyFuture](self, "homePodIdentifyFuture");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v16 = self;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 1024;
      v22 = objc_msgSend(v13, "isFinished");
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Ignoring because previous Identify future not completed: %@ isFinished = %{BOOL}d", buf, 0x26u);

    }
  }
  else
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sourceItemAccessory");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "hf_identifyHomePod");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsViewController setHomePodIdentifyFuture:](self, "setHomePodIdentifyFuture:", v9);

  }
}

- (void)_separateOrUnifyTile
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  HUServiceDetailsViewController *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HUServiceDetailsViewController item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_opt_class();
  -[HUServiceDetailsViewController item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  -[HUServiceDetailsViewController item](self, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v5)
  {
    objc_msgSend(v5, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_23;
  }
  else
  {
    if (v8)
    {
      objc_msgSend(v8, "service");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v11)
        goto LABEL_23;
      objc_msgSend(v11, "profile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    objc_msgSend(v13, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_23;
  }
  v15 = objc_msgSend(v12, "hf_showAsIndividualServices");
  objc_msgSend(v12, "hf_setShowAsIndividualServices:", v15 ^ 1u);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = CFSTR("YES");
    if (v15)
      v18 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v29 = v12;
    v30 = 2112;
    v31 = v18;
    _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "Service Details Updating accessory %@ to show individual services %@", buf, 0x16u);
  }

  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __54__HUServiceDetailsViewController__separateOrUnifyTile__block_invoke;
  v25 = &unk_1E6F4D188;
  v26 = v12;
  v27 = self;
  v19 = v12;
  v20 = (id)objc_msgSend(v16, "addSuccessBlock:", &v22);
  v21 = (id)objc_msgSend(v16, "addFailureBlock:", &__block_literal_global_749, v22, v23, v24, v25);

LABEL_23:
}

void __54__HUServiceDetailsViewController__separateOrUnifyTile__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__HUServiceDetailsViewController__separateOrUnifyTile__block_invoke_2;
  v15[3] = &unk_1E6F56FC0;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v2, "dispatchAccessoryObserverMessage:sender:", v15, 0);

  objc_msgSend(*(id *)(a1 + 40), "presentationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "finishPresentation:animated:", *(_QWORD *)(a1 + 40), 1);

  if ((objc_msgSend(*(id *)(a1 + 40), "shouldDisableAdditionalDismissalForTogglingSeparatingTiles") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      do
      {
        objc_msgSend(v5, "childViewControllers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_748);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_opt_class();
          v9 = v8;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v10 = v9;
          else
            v10 = 0;
          v11 = v10;

          v12 = (id)objc_msgSend(v11, "requestDismissal");
        }
        else
        {
          objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
        }
        objc_msgSend(v5, "presentingViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "presentingViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v13;
      }
      while (v14);
    }
    else
    {
      v13 = v5;
    }

  }
}

void __54__HUServiceDetailsViewController__separateOrUnifyTile__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessoryDidUpdateApplicationData:", *(_QWORD *)(a1 + 32));

}

uint64_t __54__HUServiceDetailsViewController__separateOrUnifyTile__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __54__HUServiceDetailsViewController__separateOrUnifyTile__block_invoke_4(uint64_t a1, void *a2)
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

- (void)_didSelectRoomItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  HUServiceDetailsViewController *v27;
  id v28;

  v4 = a3;
  if (v4)
  {
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceLikeBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "room");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "latestResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E40]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "room");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "room");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isEqual:", v13);

    if ((v14 & 1) == 0)
    {
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "selectRoom:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __53__HUServiceDetailsViewController__didSelectRoomItem___block_invoke;
      v26 = &unk_1E6F4D188;
      v27 = self;
      v28 = v9;
      v17 = (id)objc_msgSend(v16, "addSuccessBlock:", &v23);
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager", v23, v24, v25, v26, v27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "suggestedRoomItemProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "items");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "containsObject:", v4);

      if (v21)
        v22 = (id)objc_msgSend(v16, "addFailureBlock:", &__block_literal_global_750);

    }
  }

}

void __53__HUServiceDetailsViewController__didSelectRoomItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_notifyOfHomePodPairingIfNecessary:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "_notifyOfHomeTheaterReconfigurationIfNecessary:", v5);

  if ((v4 & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "room");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_offerToCreateHomeTheaterIfPossible:", v7);

  }
}

void __53__HUServiceDetailsViewController__didSelectRoomItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:operationType:options:retryBlock:cancelBlock:", v3, *MEMORY[0x1E0D30988], 0, 0, 0);

}

- (void)_notifyOfHomePodPairingIfNecessary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  _BYTE location[12];
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[HUServiceDetailsViewController item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    objc_msgSend(v10, "mediaProfileContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 <= 1 && objc_msgSend(v11, "hf_supportsStereoPairing"))
    {
      objc_msgSend(v11, "hf_backingAccessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "supportedStereoPairVersions");

      if (v15)
      {
        v16 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v5, "availableHomePodsSupportingStereoPairingVersions:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWithArray:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "accessories");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject na_setByRemovingObjectsFromSet:](v18, "na_setByRemovingObjectsFromSet:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v20, "na_any:", &__block_literal_global_751);
        if (objc_msgSend(v20, "count") && (v21 & 1) == 0)
        {
          v22 = (void *)MEMORY[0x1E0CEA2E8];
          _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsViewControllerHomePodRoomChangePromptTitle"), CFSTR("HUServiceDetailsViewControllerHomePodRoomChangePromptTitle"), 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsViewControllerHomePodRoomChangePromptMessage"), CFSTR("HUServiceDetailsViewControllerHomePodRoomChangePromptMessage"), 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "alertControllerWithTitle:message:preferredStyle:", v23, v24, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_initWeak((id *)location, self);
          v26 = (void *)MEMORY[0x1E0CEA2E0];
          _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsViewControllerHomePodRoomChangePromptActionUseAsPair"), CFSTR("HUServiceDetailsViewControllerHomePodRoomChangePromptActionUseAsPair"), 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33[1] = 3221225472;
          v33[2] = __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_2;
          v33[3] = &unk_1E6F52A00;
          v33[0] = MEMORY[0x1E0C809B0];
          objc_copyWeak(&v37, (id *)location);
          v34 = v20;
          v35 = v10;
          v36 = v7;
          objc_msgSend(v26, "actionWithTitle:style:handler:", v27, 0, v33);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addAction:", v28);

          v29 = (void *)MEMORY[0x1E0CEA2E0];
          _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsViewControllerHomePodRoomChangePromptActionNotNow"), CFSTR("HUServiceDetailsViewControllerHomePodRoomChangePromptActionNotNow"), 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "actionWithTitle:style:handler:", v30, 0, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addAction:", v31);

          -[HUServiceDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v25, 1, 0);
          objc_destroyWeak(&v37);
          objc_destroyWeak((id *)location);

        }
      }
      else
      {
        HFLogForCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138412802;
          *(_QWORD *)&location[4] = self;
          v39 = 2112;
          v40 = v32;
          v41 = 2112;
          v42 = v11;
          _os_log_error_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_ERROR, "%@:%@ HomePod has no stereo pairing versions: %@", location, 0x20u);

        }
      }

    }
  }

}

uint64_t __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_needsSoftwareUpdateToSupportBeingAddedToMediaSystem");
}

void __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "_commitBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_3;
  v5[3] = &unk_1E6F57090;
  v6 = a1[4];
  v7 = a1[5];
  v8 = WeakRetained;
  v9 = a1[6];
  v4 = (id)objc_msgSend(v3, "addSuccessBlock:", v5);

}

void __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  HUMediaSystemEditorViewController *v8;
  void *v9;
  HUMediaSystemEditorViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  HUMediaSystemEditorViewController *v14;
  id v15;
  id v16;
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
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  HUMediaSystemEditorViewController *v32;
  _QWORD v33[5];
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count") != 1)
    goto LABEL_3;
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[HUMediaSystemEditorUtilities wouldPairingAccessoriesNecessitateConfiguration:](HUMediaSystemEditorUtilities, "wouldPairingAccessoriesNecessitateConfiguration:", v6);

  if (!v7)
  {
    v16 = objc_alloc(MEMORY[0x1E0D31550]);
    objc_msgSend(*(id *)(a1 + 32), "anyObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v16, "initWithHome:", v18);

    objc_msgSend(*(id *)(a1 + 32), "anyObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAccessory:", v19);

    objc_msgSend(*(id *)(a1 + 40), "accessories");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "anyObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAccessory:", v21);

    v22 = objc_alloc(MEMORY[0x1E0D31700]);
    objc_msgSend(*(id *)(a1 + 32), "anyObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "room");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "anyObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "home");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v22, "initWithExistingObject:inHome:", v24, v26);
    objc_msgSend(v11, "setRoom:", v27);

    objc_msgSend(v11, "commitItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_4;
    v33[3] = &unk_1E6F57068;
    v33[4] = *(_QWORD *)(a1 + 48);
    v29 = (id)objc_msgSend(v28, "addCompletionBlock:", v33);

  }
  else
  {
LABEL_3:
    v8 = [HUMediaSystemEditorViewController alloc];
    objc_msgSend(*(id *)(a1 + 40), "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HUMediaSystemEditorViewController initWithAccessories:home:](v8, "initWithAccessories:home:", v9, *(_QWORD *)(a1 + 56));

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v10);
    -[HUMediaSystemEditorViewController setPresentationDelegate:](v10, "setPresentationDelegate:", *(_QWORD *)(a1 + 48));
    v34[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setViewControllers:", v12);

    objc_msgSend(v11, "setModalPresentationStyle:", 2);
    objc_msgSend(*(id *)(a1 + 48), "hu_presentPreloadableViewController:animated:", v11, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_5;
    v30[3] = &unk_1E6F4D188;
    v31 = *(id *)(a1 + 32);
    v32 = v10;
    v14 = v10;
    v15 = (id)objc_msgSend(v13, "addSuccessBlock:", v30);

  }
}

void __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleError:", v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaSystemEditor:didCreate:", 0, a2);
  }

}

void __69__HUServiceDetailsViewController__notifyOfHomePodPairingIfNecessary___block_invoke_5(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "count") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "anyObject");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "createMediaSystemWithAccessory:", v2);

  }
}

- (BOOL)_notifyOfHomeTheaterReconfigurationIfNecessary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  _BOOL4 v19;
  HUServiceDetailsViewController *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  SEL v27;
  uint64_t v28;
  __CFString *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  NSObject *v48;
  void *v49;
  BOOL v50;
  int v51;
  void *v52;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  SEL v57;
  _QWORD v58[5];
  id v59;
  id v60;
  SEL v61;
  char v62;
  uint8_t buf[4];
  HUServiceDetailsViewController *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[HUServiceDetailsViewController _shouldShowHomeTheaterPrompt](self, "_shouldShowHomeTheaterPrompt"))
  {
    v6 = (void *)MEMORY[0x1E0D31530];
    -[HUServiceDetailsViewController item](self, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaProfileContainerForItem:forTopLevel:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(MEMORY[0x1E0D31530], "isAppleTV:", v8);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_relatedHomeTheaterMediaProfileContainerFor:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v64 = self;
      v65 = 2112;
      v66 = v14;
      v67 = 2112;
      v68 = v8;
      v69 = 2112;
      v70 = v12;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_INFO, "%@:%@ Looking for Odeon config. mediaProfileContainer: %@ relatedHomeTheaterMediaProfileContainer: %@", buf, 0x2Au);

    }
    objc_opt_class();
    -[HUServiceDetailsViewController item](self, "item");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    v17 = v12 != 0;
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      v51 = v9;
      if (v19)
      {
        NSStringFromSelector(a2);
        v20 = (HUServiceDetailsViewController *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v64 = v20;
        v65 = 2112;
        v66 = v8;
        v67 = 2112;
        v68 = v12;
        _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@: Moving A, which is in a home theater group with B:\n\tA: %@\n\tB: %@", buf, 0x20u);

        v9 = v51;
      }

      v50 = v12 != 0;
      v49 = v5;
      v27 = a2;
      if (v9)
      {
        HULocalizedStringWithFormat(CFSTR("HUMoveHomeTheaterAlert_AppleTV_Body"), CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v5);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("HUMoveHomeTheaterAlert_AppleTV_Button");
      }
      else
      {
        if (v16)
          HULocalizedStringWithFormat(CFSTR("HUMoveHomeTheaterAlert_HomePod_Sensor_Body"), CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v5);
        else
          HULocalizedStringWithFormat(CFSTR("HUMoveHomeTheaterAlert_HomePod_Body"), CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v5);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("HUMoveHomeTheaterAlert_HomePod_Button");
      }
      _HULocalizedStringWithDefaultValue(v29, v29, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v28;
      v32 = (void *)MEMORY[0x1E0CEA2E8];
      _HULocalizedStringWithDefaultValue(CFSTR("HUMoveHomeTheaterAlert_Title"), CFSTR("HUMoveHomeTheaterAlert_Title"), 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "alertControllerWithTitle:message:preferredStyle:", v33, v28, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = (void *)MEMORY[0x1E0CEA2E0];
      v36 = MEMORY[0x1E0C809B0];
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke;
      v58[3] = &unk_1E6F570E0;
      v58[4] = self;
      v61 = v27;
      v37 = v8;
      v59 = v37;
      v62 = v51;
      v38 = v12;
      v39 = v12;
      v40 = v8;
      v41 = v38;
      v60 = v38;
      objc_msgSend(v35, "actionWithTitle:style:handler:", v52, 0, v58);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addAction:", v42);

      v43 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUMoveHomeTheaterAlert_All_Button"), CFSTR("HUMoveHomeTheaterAlert_All_Button"), 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v36;
      v53[1] = 3221225472;
      v53[2] = __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_777;
      v53[3] = &unk_1E6F57180;
      v53[4] = self;
      v57 = v27;
      v5 = v49;
      v54 = v49;
      v55 = v37;
      v45 = v41;
      v8 = v40;
      v12 = v39;
      v18 = v48;
      v56 = v45;
      objc_msgSend(v43, "actionWithTitle:style:handler:", v44, 0, v53);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addAction:", v46);

      -[HUServiceDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v34, 1, 0);
      v17 = v50;
    }
    else if (v19)
    {
      NSStringFromSelector(a2);
      v30 = v5;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v64 = self;
      v65 = 2112;
      v66 = v31;
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ Did not find any related Home Theaters, skipping move prompt.", buf, 0x16u);

      v5 = v30;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v16 = v3;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@:%@ Moving home theater accessory %@ out of group.", buf, 0x20u);

  }
  v6 = 40;
  if (!*(_BYTE *)(a1 + 64))
    v6 = 48;
  objc_msgSend(*(id *)(a1 + v6), "hf_backingAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioDestinationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_774;
  v12[3] = &unk_1E6F570B8;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 56);
  v13 = v8;
  v14 = v10;
  v12[4] = v9;
  v11 = v8;
  objc_msgSend(v11, "updateDestination:completionHandler:", 0, v12);

}

void __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_774(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138413058;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ AppleTV destination controller %@ destination cleared, with error: %@", (uint8_t *)&v8, 0x2Au);

  }
}

void __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_777(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v16 = v3;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@:%@ Moving all home theater accessories in this group to room: %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_roomUpdateBuilderFor:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_778;
  v10[3] = &unk_1E6F57158;
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v10[1] = 3221225472;
  v11 = v8;
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 48);
  v9 = (id)objc_msgSend(v6, "addSuccessBlock:", v10);

}

void __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_778(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _BYTE *v23;
  uint64_t v24;
  _QWORD v25[5];
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "accessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v27 = v7;
    LOWORD(v28) = 2048;
    *(_QWORD *)((char *)&v28 + 2) = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_INFO, "%@:%@ Moved accessory to room. accessory: %@ room: %lu", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 48), "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") == 0;

  if (!v10)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v27 = __Block_byref_object_copy__18;
    *(_QWORD *)&v28 = __Block_byref_object_dispose__18;
    *((_QWORD *)&v28 + 1) = 0;
    objc_msgSend(*(id *)(a1 + 56), "accessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_779;
    v25[3] = &unk_1E6F57108;
    v25[4] = buf;
    objc_msgSend(v11, "na_any:", v25);

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v13 = objc_alloc(MEMORY[0x1E0D31700]);
      v14 = *(void **)(*(_QWORD *)&buf[8] + 40);
      objc_msgSend(v14, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v13, "initWithExistingObject:inHome:", v14, v15);

      objc_msgSend(*(id *)(a1 + 48), "accessories");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v12;
      v21[1] = 3221225472;
      v21[2] = __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_2;
      v21[3] = &unk_1E6F57130;
      v18 = *(_QWORD *)(a1 + 64);
      v21[4] = *(_QWORD *)(a1 + 32);
      v23 = buf;
      v24 = v18;
      v19 = v16;
      v22 = v19;
      objc_msgSend(v17, "na_each:", v21);

      v20 = (id)objc_msgSend(v19, "commitItem");
      _Block_object_dispose(buf, 8);

    }
    else
    {
      _Block_object_dispose(buf, 8);

    }
  }

}

BOOL __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_779(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "room");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

void __81__HUServiceDetailsViewController__notifyOfHomeTheaterReconfigurationIfNecessary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138413058;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_INFO, "%@:%@ Moving %@ to room %@", (uint8_t *)&v8, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "addAccessory:", v3);

}

- (void)_offerToCreateHomeTheaterIfPossible:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38[2];
  char v39;
  uint8_t buf[4];
  HUServiceDetailsViewController *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 && -[HUServiceDetailsViewController _shouldShowHomeTheaterPrompt](self, "_shouldShowHomeTheaterPrompt"))
  {
    objc_opt_class();
    -[HUServiceDetailsViewController item](self, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;
    v8 = v7;

    if (!v8)
    {
      v9 = (void *)MEMORY[0x1E0D31530];
      -[HUServiceDetailsViewController item](self, "item");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mediaProfileContainerForItem:forTopLevel:", v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(MEMORY[0x1E0D31530], "isAppleTV:", v11);
      objc_msgSend(v5, "availableHomeTheaterMediaPartnerFor:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "hf_supportsHomeTheater"))
      {
        HFLogForCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            NSStringFromSelector(a2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v41 = self;
            v42 = 2112;
            v43 = v16;
            v44 = 2112;
            v45 = v11;
            v46 = 2112;
            v47 = v13;
            _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Moving A into room with B:\n\tA: %@\n\tB: %@", buf, 0x2Au);

          }
          if (v12)
            _HULocalizedStringWithDefaultValue(CFSTR("HUCreateHomeTheaterAlert_AppleTV_Title"), CFSTR("HUCreateHomeTheaterAlert_AppleTV_Title"), 1);
          else
            _HULocalizedStringWithDefaultValue(CFSTR("HUCreateHomeTheaterAlert_HomePod_Title"), CFSTR("HUCreateHomeTheaterAlert_HomePod_Title"), 1);
          v14 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x1E0CEA2E8];
          _HULocalizedStringWithDefaultValue(CFSTR("HUCreateHomeTheaterAlert_Body"), CFSTR("HUCreateHomeTheaterAlert_Body"), 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "alertControllerWithTitle:message:preferredStyle:", v14, v19, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_initWeak((id *)buf, self);
          v20 = (void *)MEMORY[0x1E0CEA2E0];
          _HULocalizedStringWithDefaultValue(CFSTR("HUCreateHomeTheaterAlert_Use_Button"), CFSTR("HUCreateHomeTheaterAlert_Use_Button"), 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __70__HUServiceDetailsViewController__offerToCreateHomeTheaterIfPossible___block_invoke;
          v35[3] = &unk_1E6F571D0;
          objc_copyWeak(v38, (id *)buf);
          v36 = v11;
          v39 = v12;
          v37 = v13;
          v38[1] = (id)a2;
          objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v35);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addAction:", v22);

          v23 = (void *)MEMORY[0x1E0CEA2E0];
          _HULocalizedStringWithDefaultValue(CFSTR("HUCreateHomeTheaterAlert_DontUse_Button"), CFSTR("HUCreateHomeTheaterAlert_DontUse_Button"), 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 0, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addAction:", v25);

          -[HUServiceDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v34, 1, 0);
          v26 = objc_alloc(MEMORY[0x1E0D31988]);
          -[HUItemTableViewController itemManager](self, "itemManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "home");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUItemTableViewController itemManager](self, "itemManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "home");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "currentUser");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v26, "initWithHome:user:nameStyle:", v28, v31, 0);

          v33 = (id)objc_msgSend(v32, "setDismissHomeTheaterOnboarding:", 1);
          objc_destroyWeak(v38);
          objc_destroyWeak((id *)buf);

        }
        else if (v15)
        {
          NSStringFromSelector(a2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v41 = self;
          v42 = 2112;
          v43 = v17;
          _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Did not find any Home Theater candidates, skipping creation prompt.", buf, 0x16u);

        }
      }

    }
  }

}

void __70__HUServiceDetailsViewController__offerToCreateHomeTheaterIfPossible___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  char v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_roomUpdateBuilderFor:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__HUServiceDetailsViewController__offerToCreateHomeTheaterIfPossible___block_invoke_2;
  v5[3] = &unk_1E6F571A8;
  v10 = *(_BYTE *)(a1 + 64);
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = WeakRetained;
  v9 = *(_QWORD *)(a1 + 56);
  v4 = (id)objc_msgSend(v3, "addSuccessBlock:", v5);

}

void __70__HUServiceDetailsViewController__offerToCreateHomeTheaterIfPossible___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  __CFString *v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_backingAccessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioDestinationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (id *)(a1 + 40);
    v7 = CFSTR("AppleTV to room with available HomePod or HomePod Stereo Pair");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "hf_backingAccessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "audioDestinationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (id *)(a1 + 32);
    v7 = CFSTR("HomePod or HomePod Stereo Pair to room with available AppleTV");
  }
  objc_msgSend(*v6, "hf_destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 48);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Moving %@: audioDestinationController = %@ new destination = %@", buf, 0x34u);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__HUServiceDetailsViewController__offerToCreateHomeTheaterIfPossible___block_invoke_793;
  v15[3] = &unk_1E6F570B8;
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  v16 = (__CFString *)v7;
  v17 = v14;
  v15[4] = v13;
  objc_msgSend(v5, "updateDestination:options:completionHandler:", v9, 1, v15);

}

void __70__HUServiceDetailsViewController__offerToCreateHomeTheaterIfPossible___block_invoke_793(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138413058;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ Moved %@ with error: %@", (uint8_t *)&v8, 0x2Au);

  }
}

- (id)_roomUpdateBuilderFor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  int v25;
  HUServiceDetailsViewController *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(MEMORY[0x1E0D31530], "isHomePodMediaSystem:", v5))
    goto LABEL_3;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceLikeBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  LOBYTE(v8) = objc_msgSend((id)v8, "isEqual:", objc_opt_class());

  if ((v8 & 1) == 0)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "serviceLikeBuilder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412802;
      v26 = self;
      v27 = 2112;
      v28 = v11;
      v29 = 2112;
      v30 = objc_opt_class();
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Using HFMediaSystemBuilder instead of %@ to commit changes.", (uint8_t *)&v25, 0x20u);

    }
    v14 = objc_alloc(MEMORY[0x1E0D31550]);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithExistingObject:inHome:", v5, v16);

    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "serviceLikeBuilder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "room");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRoom:", v20);

    objc_opt_class();
    -[HUServiceDetailsViewController item](self, "item");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;
    -[HUServiceDetailsViewController _commitBuilderFor:with:](self, "_commitBuilderFor:with:", v23, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_3:
    -[HUServiceDetailsViewController _commitBuilder](self, "_commitBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)_shouldShowHomeTheaterPrompt
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1E0D31530];
  -[HUServiceDetailsViewController item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProfileContainerForItem:forTopLevel:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "hf_supportsHomeTheater");
  else
    v5 = 0;

  return v5;
}

- (void)_executeSilentSoftwareUpdateCheck
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  -[HUServiceDetailsViewController item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF2AC688))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "accessoriesSupportingSoftwareUpdate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v11, "count");
  v6 = v11;
  if (v5)
  {
    objc_msgSend(v11, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__HUServiceDetailsViewController__executeSilentSoftwareUpdateCheck__block_invoke;
    v12[3] = &unk_1E6F4E5D8;
    v13 = v8;
    v9 = v8;
    if ((objc_msgSend(v11, "na_all:", v12) & 1) == 0)
      NSLog(CFSTR("Accessories should contain the same home!"));

    +[HUSoftwareUpdateUIManager sharedManager](HUSoftwareUpdateUIManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startSilentBackgroundCheckForHome:", v9);

    v6 = v11;
  }

}

BOOL __67__HUServiceDetailsViewController__executeSilentSoftwareUpdateCheck__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)_fetchAccessoryDiagnosticInfo
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HUServiceDetailsViewController item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_currentUserIsOwner");

  if (v8)
    v9 = v5 == 0;
  else
    v9 = 1;
  if (v9)
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "home");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithBool:", objc_msgSend(v12, "hf_currentUserIsOwner"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "Not fetching diagnostic info: [isOwner:%@], [mediaAccessoryItem:%@]", (uint8_t *)&v15, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v5, "accessories");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject na_each:](v14, "na_each:", &__block_literal_global_804);
  }

}

void __63__HUServiceDetailsViewController__fetchAccessoryDiagnosticInfo__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "hf_linkedResidentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diagnosticInfoManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "fetchDiagnosticInfoForAccessory:", v6);

  }
}

- (void)didSelectHeaderWarningAction:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  HUServiceDetailsViewController *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HUServiceDetailsViewController *v21;
  HUServiceDetailsViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
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
  id v48;
  HUServiceDetailsViewController *v49;
  void *v50;
  id v51;
  HUServiceDetailsViewController *v52;
  id obj;
  _QWORD v54[4];
  HUServiceDetailsViewController *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  HUServiceDetailsViewController *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v61 = self;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: User tapped header warning/symptom", buf, 0xCu);
  }

  objc_opt_class();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "sourceItemAccessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hf_needsReprovisioningCheck");

  if (v11)
  {
    objc_msgSend(v9, "sourceItemAccessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v13 = (HUServiceDetailsViewController *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sourceItemAccessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceDetailsViewController hf_startReprovisioningAccessory:](v13, "hf_startReprovisioningAccessory:", v14);

    v15 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v9, "sourceItem");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v9, "updateResultsForItems:senderSelector:", v17, a2);
LABEL_37:

    goto LABEL_38;
  }
  objc_opt_class();
  objc_msgSend(v9, "headerItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "latestResults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E78]);
  v21 = (HUServiceDetailsViewController *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v13 = v22;

  v52 = self;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sourceItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "latestResults");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0D30970]);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(v9, "sourceItem");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "accessories");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "anyObject");
    v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  if (-[HUServiceDetailsViewController type](v13, "type") == 1
    || -[HUServiceDetailsViewController type](v13, "type") == 2
    || -[HUServiceDetailsViewController type](v13, "type") == 20)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v16, "accessories");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    if (v26)
    {
      v27 = v26;
      v49 = v21;
      v50 = v16;
      v51 = v5;
      v28 = *(_QWORD *)v57;
      while (2)
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v57 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v30, "symptomsHandler");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "symptoms");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __63__HUServiceDetailsViewController_didSelectHeaderWarningAction___block_invoke;
          v54[3] = &unk_1E6F57238;
          v55 = v13;
          objc_msgSend(v32, "na_firstObjectPassingTest:", v54);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            v16 = v30;

            v34 = v55;
            v5 = v51;
            v21 = v49;
            goto LABEL_26;
          }

        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        if (v27)
          continue;
        break;
      }
      v5 = v51;
      v21 = v49;
    }
    goto LABEL_27;
  }
LABEL_28:
  HFLogForCategory();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = -[HUServiceDetailsViewController type](v13, "type");
    *(_DWORD *)buf = 138412802;
    v61 = v13;
    v62 = 2048;
    v63 = v36;
    v64 = 2112;
    v65 = v16;
    _os_log_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_DEFAULT, "Trying to fix symptom %@ (type %lu) for object %@", buf, 0x20u);
  }

  if (v16)
  {
    if (-[HUServiceDetailsViewController type](v13, "type") == 7)
    {
      HFLocalizedString();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA2E8], "hu_actionSheetWithTitle:message:anchorView:", v37, 0, v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x1E0CEA2E0];
      HFLocalizedString();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "actionWithTitle:style:handler:", v39, 0, &__block_literal_global_812);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAction:", v40);

      v41 = (void *)MEMORY[0x1E0CEA2E0];
      HFLocalizedString();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "actionWithTitle:style:handler:", v42, 0, &__block_literal_global_819);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAction:", v43);

      v44 = (void *)MEMORY[0x1E0CEA2E0];
      HFLocalizedString();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "actionWithTitle:style:handler:", v45, 1, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAction:", v46);

      -[HUServiceDetailsViewController presentViewController:animated:completion:](v52, "presentViewController:animated:completion:", v17, 0, 0);
      goto LABEL_37;
    }
    if (-[HUServiceDetailsViewController type](v13, "type") == 14)
    {
      objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "hf_wifiSettingsURL");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (id)objc_msgSend(v17, "openURL:", v47);

      goto LABEL_37;
    }
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D31888], "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fixSymptom:forFixableObject:presentingViewController:", v13, v16, v52);
      v13 = v21;
      goto LABEL_37;
    }
  }
LABEL_38:

}

BOOL __63__HUServiceDetailsViewController_didSelectHeaderWarningAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "type");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "type");
}

void __63__HUServiceDetailsViewController_didSelectHeaderWarningAction___block_invoke_811()
{
  void *v0;
  id v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "openURL:", v2);

}

void __63__HUServiceDetailsViewController_didSelectHeaderWarningAction___block_invoke_2()
{
  void *v0;
  id v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("tel://800-692-7753"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "openURL:", v2);

}

- (id)_recoverItemBuilder:(id)a3 fromError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a4;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2544A8))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "homeKitObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v10, "hf_isValidObject") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v5);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  return v12;
}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
  -[HUServiceDetailsViewController _didRemoveHomeKitObject:](self, "_didRemoveHomeKitObject:", a4);
}

- (void)home:(id)a3 didRemoveServiceGroup:(id)a4
{
  -[HUServiceDetailsViewController _didRemoveHomeKitObject:](self, "_didRemoveHomeKitObject:", a4);
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  -[HUServiceDetailsViewController _didRemoveHomeKitObject:](self, "_didRemoveHomeKitObject:", a4);
}

- (void)accessoryDidUpdateControllable:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v21 = a3;
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF2544A8))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  objc_msgSend(v8, "homeKitObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EF2AC0A8))
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;
  objc_msgSend(v13, "accessoryRepresentableObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14
    || ((v14 = v9, !objc_msgSend(v14, "conformsToProtocol:", &unk_1EF347348))
      ? (v15 = 0)
      : (v15 = v14),
        v16 = v15,
        v14,
        v16))
  {
    objc_msgSend(v14, "hf_associatedAccessories");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __65__HUServiceDetailsViewController_accessoryDidUpdateControllable___block_invoke;
    v22[3] = &unk_1E6F4E5D8;
    v23 = v21;
    v18 = objc_msgSend(v17, "na_any:", v22);

    if (v18)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)objc_msgSend(v19, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

    }
  }

}

uint64_t __65__HUServiceDetailsViewController_accessoryDidUpdateControllable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqual:", v6);

  }
  return v4;
}

- (void)accessoryDidUpdateServices:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF2544A8))
    v6 = v5;
  else
    v6 = 0;
  v11 = v6;

  v7 = v11;
  if (v11)
  {
    objc_opt_class();
    objc_msgSend(v11, "homeKitObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10 && (objc_msgSend(v10, "hf_isValidObject") & 1) == 0)
      -[HUServiceDetailsViewController _didRemoveHomeKitObject:](self, "_didRemoveHomeKitObject:", v10);

    v7 = v11;
  }

}

- (void)_didRemoveHomeKitObject:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsViewController.m"), 3771, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeKitObject"));

  }
  -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2544A8))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "homeKitObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v5)
    goto LABEL_15;
  objc_opt_class();
  v11 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    objc_msgSend(v13, "cameraProfiles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v10);

    if ((v15 & 1) != 0)
      goto LABEL_14;
    objc_msgSend(v13, "mediaProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", v10);

    if ((v17 & 1) != 0
      || (objc_msgSend(v13, "profiles"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "containsObject:", v10),
          v18,
          v19))
    {
LABEL_14:

LABEL_15:
      if (objc_msgSend(v5, "hf_isValidObject"))
        NSLog(CFSTR("This object is valid yet HomeKit is acting like it was removed!"));
      HFLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v5;
        _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "HomeKit Object '%@' was removed; dismissing presented serviceDetailsViewController",
          buf,
          0xCu);
      }

      -[HUServiceDetailsViewController setRequiresPresentingViewControllerDismissal:](self, "setRequiresPresentingViewControllerDismissal:", 1);
      -[HUServiceDetailsViewController presentationDelegate](self, "presentationDelegate");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (id)-[NSObject finishPresentation:animated:](v21, "finishPresentation:animated:", self, 1);
      goto LABEL_20;
    }
    objc_msgSend(v13, "services");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "containsObject:", v10);

    if ((v24 & 1) != 0)
      goto LABEL_15;
  }
  HFLogForCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v11;
    _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "HomeKit Object '%@' was not removed; Unable to validate backing source item.",
      buf,
      0xCu);
  }
LABEL_20:

}

- (void)didSelectHomeAssistantDeviceSplitAccountAction:(unint64_t)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t v15[16];
  _QWORD v16[4];
  id v17;
  HUServiceDetailsViewController *v18;

  if (a3 != 1)
  {
    if (a3 != 2)
    {
      HFLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "Invalid split, media account action", v15, 2u);
      }
      goto LABEL_10;
    }
    -[HUServiceDetailsViewController detailsItemManager](self, "detailsItemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "sourceItemIsHomePod");

    if (v5)
    {
      objc_opt_class();
      -[HUServiceDetailsViewController item](self, "item");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
      v8 = v7;

      v9 = (void *)MEMORY[0x1E0D31188];
      objc_msgSend(v8, "mediaProfileContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accessories");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logoutAccessories:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __81__HUServiceDetailsViewController_didSelectHomeAssistantDeviceSplitAccountAction___block_invoke;
      v16[3] = &unk_1E6F4C820;
      v17 = v8;
      v18 = self;
      v13 = v8;
      v14 = (id)objc_msgSend(v12, "addCompletionBlock:", v16);

LABEL_10:
    }
  }
  -[HUServiceDetailsViewController _setDismissedHomePodHasNonMemberMediaAccountWarning:](self, "_setDismissedHomePodHasNonMemberMediaAccountWarning:", 1);
}

void __81__HUServiceDetailsViewController_didSelectHomeAssistantDeviceSplitAccountAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "mediaProfileContainer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Error logging out media account for [%@]:[%@]", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_setDismissedHomePodHasNonMemberMediaAccountWarning:", 0);
  }

}

- (void)_setDismissedHomePodHasNonMemberMediaAccountWarning:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];

  v3 = a3;
  objc_opt_class();
  -[HUServiceDetailsViewController item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "mediaProfileContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "hf_settingsValueManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E0D30678]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__HUServiceDetailsViewController__setDismissedHomePodHasNonMemberMediaAccountWarning___block_invoke;
  v14[3] = &unk_1E6F4E568;
  v14[4] = self;
  v14[5] = a2;
  objc_msgSend(v12, "updateValue:completionHandler:", v13, v14);

}

void __86__HUServiceDetailsViewController__setDismissedHomePodHasNonMemberMediaAccountWarning___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8[2];
  id location[2];

  v3 = a2;
  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Error setting HFHMSettingKeyPath_DismissedHomePodHasNonMemberMediaAccountWarning to YES", (uint8_t *)location, 2u);
    }

  }
  else
  {
    objc_initWeak(location, *(id *)(a1 + 32));
    v5 = (void *)MEMORY[0x1E0D519C0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __86__HUServiceDetailsViewController__setDismissedHomePodHasNonMemberMediaAccountWarning___block_invoke_2;
    v7[3] = &unk_1E6F572A0;
    objc_copyWeak(v8, location);
    v8[1] = *(id *)(a1 + 40);
    v6 = (id)objc_msgSend(v5, "futureWithBlock:", v7);
    objc_destroyWeak(v8);
    objc_destroyWeak(location);
  }

}

void __86__HUServiceDetailsViewController__setDismissedHomePodHasNonMemberMediaAccountWarning___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "detailsItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 40));

  objc_msgSend(WeakRetained, "detailsItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "diffableDataSourceDisabled");

  if ((_DWORD)v3)
  {
    objc_msgSend(WeakRetained, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadSections:withRowAnimation:", v7, 5);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemSectionForSectionIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "detailsItemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadUIRepresentationForSections:withAnimation:", v9, 0);

    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)showConnectedEcosystems
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__HUServiceDetailsViewController_showConnectedEcosystems__block_invoke;
  v8[3] = &unk_1E6F4C660;
  v8[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __57__HUServiceDetailsViewController_showConnectedEcosystems__block_invoke_2;
  v7[3] = &unk_1E6F572C8;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __57__HUServiceDetailsViewController_showConnectedEcosystems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HUMatterConnectedServicesViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  HUMatterConnectedServicesViewController *v8;

  v3 = a2;
  v4 = [HUMatterConnectedServicesViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "detailsItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectedServicesItemModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectedServicesItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HUMatterConnectedServicesViewController initWithConnectedServicesItemProvider:](v4, "initWithConnectedServicesItemProvider:", v7);

  -[HUMatterConnectedServicesViewController setDelegate:](v8, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "finishWithResult:", v8);

}

id __57__HUServiceDetailsViewController_showConnectedEcosystems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hu_pushPreloadableViewController:animated:", v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (BOOL)shouldIncludeRoomNameInHeaderTitle
{
  return self->_shouldIncludeRoomNameInHeaderTitle;
}

- (BOOL)shouldDisableAdditionalDismissalForTogglingSeparatingTiles
{
  return self->_shouldDisableAdditionalDismissalForTogglingSeparatingTiles;
}

- (void)setShouldDisableAdditionalDismissalForTogglingSeparatingTiles:(BOOL)a3
{
  self->_shouldDisableAdditionalDismissalForTogglingSeparatingTiles = a3;
}

- (HUNameItemModuleController)nameItemModuleController
{
  return self->_nameItemModuleController;
}

- (void)setNameItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_nameItemModuleController, a3);
}

- (HUAccessorySettingsItemModuleController)accessorySettingsItemModuleController
{
  return self->_accessorySettingsItemModuleController;
}

- (void)setAccessorySettingsItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySettingsItemModuleController, a3);
}

- (NSMapTable)moduleToModuleControllerMap
{
  return self->_moduleToModuleControllerMap;
}

- (void)setModuleToModuleControllerMap:(id)a3
{
  objc_storeStrong((id *)&self->_moduleToModuleControllerMap, a3);
}

- (HUSoftwareUpdateItemModuleController)softwareUpdateItemModuleController
{
  return self->_softwareUpdateItemModuleController;
}

- (void)setSoftwareUpdateItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateItemModuleController, a3);
}

- (HUAvailableRelatedTriggerItemModuleController)associatedTriggerModuleController
{
  return self->_associatedTriggerModuleController;
}

- (void)setAssociatedTriggerModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_associatedTriggerModuleController, a3);
}

- (HUChildServiceItemModuleController)valveEditorItemModuleController
{
  return self->_valveEditorItemModuleController;
}

- (void)setValveEditorItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_valveEditorItemModuleController, a3);
}

- (HUChildServiceItemModuleController)accessoryServicesEditorItemModuleController
{
  return self->_accessoryServicesEditorItemModuleController;
}

- (void)setAccessoryServicesEditorItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryServicesEditorItemModuleController, a3);
}

- (HUAssociatedSceneAndTriggerModuleController)sceneAndTriggerModuleController
{
  return self->_sceneAndTriggerModuleController;
}

- (void)setSceneAndTriggerModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_sceneAndTriggerModuleController, a3);
}

- (HUTelevisionSettingsItemModuleController)televisionSettingsItemModuleController
{
  return self->_televisionSettingsItemModuleController;
}

- (void)setTelevisionSettingsItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_televisionSettingsItemModuleController, a3);
}

- (HUChildServiceItemModuleController)inputSourceItemModuleController
{
  return self->_inputSourceItemModuleController;
}

- (void)setInputSourceItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_inputSourceItemModuleController, a3);
}

- (HUMatterConnectedServicesItemModuleController)connectedServicesItemModuleController
{
  return self->_connectedServicesItemModuleController;
}

- (void)setConnectedServicesItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_connectedServicesItemModuleController, a3);
}

- (HUServiceDetailsItemManager)detailsItemManager
{
  return (HUServiceDetailsItemManager *)objc_loadWeakRetained((id *)&self->_detailsItemManager);
}

- (void)setDetailsItemManager:(id)a3
{
  objc_storeWeak((id *)&self->_detailsItemManager, a3);
}

- (HUControlPanelController)controlPanelController
{
  return self->_controlPanelController;
}

- (NSHashTable)expandedControlPanelItems
{
  return self->_expandedControlPanelItems;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (BOOL)isMultiServiceAccessory
{
  return self->_isMultiServiceAccessory;
}

- (BOOL)isItemGroup
{
  return self->_isItemGroup;
}

- (BOOL)supportsCustomIconEditing
{
  return self->_supportsCustomIconEditing;
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressRecognizer, a3);
}

- (HUServiceDetailsTextViewDelegate)textViewDelegate
{
  return self->_textViewDelegate;
}

- (void)setTextViewDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_textViewDelegate, a3);
}

- (HFNamingComponents)namingComponent
{
  return self->_namingComponent;
}

- (void)setNamingComponent:(id)a3
{
  objc_storeStrong((id *)&self->_namingComponent, a3);
}

- (HUQuickControlSummaryNavigationBarTitleView)navigationBarTitleView
{
  return self->_navigationBarTitleView;
}

- (void)setNavigationBarTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarTitleView, a3);
}

- (HUQuickControlProxHandOffSummaryViewUpdater)proxHandOffSummaryViewUpdater
{
  return self->_proxHandOffSummaryViewUpdater;
}

- (void)setProxHandOffSummaryViewUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_proxHandOffSummaryViewUpdater, a3);
}

- (BOOL)shouldTrackProgrammableSwitchActivations
{
  return self->_shouldTrackProgrammableSwitchActivations;
}

- (BOOL)isPresentingRoomsList
{
  return self->_isPresentingRoomsList;
}

- (void)setIsPresentingRoomsList:(BOOL)a3
{
  self->_isPresentingRoomsList = a3;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (int64_t)inProgressExportDiagnosticsIndex
{
  return self->_inProgressExportDiagnosticsIndex;
}

- (void)setInProgressExportDiagnosticsIndex:(int64_t)a3
{
  self->_inProgressExportDiagnosticsIndex = a3;
}

- (NSMutableSet)registeredButtonFutures
{
  return self->_registeredButtonFutures;
}

- (void)setRegisteredButtonFutures:(id)a3
{
  objc_storeStrong((id *)&self->_registeredButtonFutures, a3);
}

- (NAFuture)accountFuture
{
  return self->_accountFuture;
}

- (void)setAccountFuture:(id)a3
{
  objc_storeStrong((id *)&self->_accountFuture, a3);
}

- (NAFuture)homePodIdentifyFuture
{
  return self->_homePodIdentifyFuture;
}

- (void)setHomePodIdentifyFuture:(id)a3
{
  objc_storeStrong((id *)&self->_homePodIdentifyFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homePodIdentifyFuture, 0);
  objc_storeStrong((id *)&self->_accountFuture, 0);
  objc_storeStrong((id *)&self->_registeredButtonFutures, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_proxHandOffSummaryViewUpdater, 0);
  objc_storeStrong((id *)&self->_navigationBarTitleView, 0);
  objc_storeStrong((id *)&self->_namingComponent, 0);
  objc_storeStrong((id *)&self->_textViewDelegate, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_expandedControlPanelItems, 0);
  objc_storeStrong((id *)&self->_controlPanelController, 0);
  objc_destroyWeak((id *)&self->_detailsItemManager);
  objc_storeStrong((id *)&self->_connectedServicesItemModuleController, 0);
  objc_storeStrong((id *)&self->_inputSourceItemModuleController, 0);
  objc_storeStrong((id *)&self->_televisionSettingsItemModuleController, 0);
  objc_storeStrong((id *)&self->_sceneAndTriggerModuleController, 0);
  objc_storeStrong((id *)&self->_accessoryServicesEditorItemModuleController, 0);
  objc_storeStrong((id *)&self->_valveEditorItemModuleController, 0);
  objc_storeStrong((id *)&self->_associatedTriggerModuleController, 0);
  objc_storeStrong((id *)&self->_softwareUpdateItemModuleController, 0);
  objc_storeStrong((id *)&self->_moduleToModuleControllerMap, 0);
  objc_storeStrong((id *)&self->_accessorySettingsItemModuleController, 0);
  objc_storeStrong((id *)&self->_nameItemModuleController, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
