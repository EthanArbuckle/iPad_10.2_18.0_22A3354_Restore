@implementation CNContactContentDisplayViewController

- (CNContactContentDisplayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  CNContactContentDisplayViewController *v6;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactContentDisplayViewController initWithEnvironment:](self, "initWithEnvironment:", v5);

  return v6;
}

- (CNContactContentDisplayViewController)initWithEnvironment:(id)a3
{
  id v5;
  CNContactContentDisplayViewController *v6;
  CNContactViewCache *v7;
  CNContactViewCache *contactViewCache;
  CNUIGeminiDataSource *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CNUIGeminiDataSource *geminiDataSource;
  uint64_t v14;
  CNContactFormatter *contactFormatter;
  uint64_t v16;
  NSArray *displayedProperties;
  id v18;
  void *v19;
  uint64_t v20;
  CNUIUserActionListDataSource *actionsDataSource;
  uint64_t v22;
  CNContactInlineActionsViewController *actionsViewController;
  CNContactActionsContainerView *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  CNContactActionsContainerView *actionsWrapperView;
  double v29;
  void *v30;
  uint64_t v31;
  UIView *headerDropShadowView;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  CNUIUserActivityManager *activityManager;
  uint64_t v38;
  NSArray *customActions;
  CNUIContactStoreLinkedContactSaveExecutor *v40;
  CNUIContactSaveExecutor *saveLinkedContactsExecutor;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  objc_super v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v53.receiver = self;
  v53.super_class = (Class)CNContactContentDisplayViewController;
  v6 = -[CNContactContentDisplayViewController initWithNibName:bundle:](&v53, sel_initWithNibName_bundle_, 0, 0);
  objc_storeStrong((id *)&v6->_environment, a3);
  v7 = objc_alloc_init(CNContactViewCache);
  contactViewCache = v6->_contactViewCache;
  v6->_contactViewCache = v7;

  if (objc_msgSend(MEMORY[0x1E0C97310], "deviceSupportsGemini"))
  {
    v9 = [CNUIGeminiDataSource alloc];
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "geminiManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CNUIGeminiDataSource initWithGeminiManager:](v9, "initWithGeminiManager:", v11);
    geminiDataSource = v6->_geminiDataSource;
    v6->_geminiDataSource = (CNUIGeminiDataSource *)v12;

    -[CNUIGeminiDataSource setDelegate:](v6->_geminiDataSource, "setDelegate:", v6);
  }
  objc_storeWeak((id *)&v6->_presentingDelegate, v6);
  objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatter");
  v14 = objc_claimAutoreleasedReturnValue();
  contactFormatter = v6->_contactFormatter;
  v6->_contactFormatter = (CNContactFormatter *)v14;

  +[CNContactView allCardProperties](CNContactView, "allCardProperties");
  v16 = objc_claimAutoreleasedReturnValue();
  displayedProperties = v6->_displayedProperties;
  v6->_displayedProperties = (NSArray *)v16;

  v18 = objc_alloc(MEMORY[0x1E0D13D88]);
  objc_msgSend(v5, "actionDiscoveringEnvironment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "initWithDiscoveringEnvironment:", v19);
  actionsDataSource = v6->_actionsDataSource;
  v6->_actionsDataSource = (CNUIUserActionListDataSource *)v20;

  -[CNContactContentDisplayViewController createActionsController](v6, "createActionsController");
  v22 = objc_claimAutoreleasedReturnValue();
  actionsViewController = v6->_actionsViewController;
  v6->_actionsViewController = (CNContactInlineActionsViewController *)v22;

  -[CNContactInlineActionsViewController setObjectViewControllerDelegate:](v6->_actionsViewController, "setObjectViewControllerDelegate:", v6);
  -[CNContactInlineActionsViewController setDelegate:](v6->_actionsViewController, "setDelegate:", v6);
  -[CNContactContentDisplayViewController addChildViewController:](v6, "addChildViewController:", v6->_actionsViewController);
  -[CNContactInlineActionsViewController didMoveToParentViewController:](v6->_actionsViewController, "didMoveToParentViewController:", v6);
  v24 = [CNContactActionsContainerView alloc];
  -[CNContactInlineActionsViewController view](v6->_actionsViewController, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[CNContactActionsContainerView initWithArrangedSubviews:](v24, "initWithArrangedSubviews:", v26);
  actionsWrapperView = v6->_actionsWrapperView;
  v6->_actionsWrapperView = (CNContactActionsContainerView *)v27;

  -[CNContactActionsContainerView setTranslatesAutoresizingMaskIntoConstraints:](v6->_actionsWrapperView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v29 = *MEMORY[0x1E0CFAA78];
  -[CNContactInlineActionsViewController view](v6->_actionsViewController, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setMinimumLayoutSize:", v29, 35.0);

  v31 = objc_opt_new();
  headerDropShadowView = v6->_headerDropShadowView;
  v6->_headerDropShadowView = (UIView *)v31;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_headerDropShadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNContactContentDisplayViewController environment](v6, "environment");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v33, "runningInContactsAppOniPad") & 1) != 0)
  {
    -[UIView backgroundColor](v6->_headerDropShadowView, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6->_headerDropShadowView, "setBackgroundColor:", v34);
  }
  else
  {
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "contactHeaderDropShadowColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6->_headerDropShadowView, "setBackgroundColor:", v35);

  }
  objc_msgSend(v5, "inProcessActivityManager");
  v36 = objc_claimAutoreleasedReturnValue();
  activityManager = v6->_activityManager;
  v6->_activityManager = (CNUIUserActivityManager *)v36;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v38 = objc_claimAutoreleasedReturnValue();
  customActions = v6->_customActions;
  v6->_customActions = (NSArray *)v38;

  v40 = objc_alloc_init(CNUIContactStoreLinkedContactSaveExecutor);
  saveLinkedContactsExecutor = v6->_saveLinkedContactsExecutor;
  v6->_saveLinkedContactsExecutor = (CNUIContactSaveExecutor *)v40;

  -[CNContactContentDisplayViewController setNeedsReloadLazy](v6, "setNeedsReloadLazy");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObserver:selector:name:object:", v6, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObserver:selector:name:object:", v6, sel_localeDidChange_, *MEMORY[0x1E0C99720], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObserver:selector:name:object:", v6, sel_contactStoreDidChangeWithNotification_, *MEMORY[0x1E0C96870], 0);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObserver:selector:name:object:suspensionBehavior:", v6, sel_contactStoreDidChangeWithNotification_, *MEMORY[0x1E0D136D0], 0, 4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObserver:selector:name:object:", v6, sel_keyboardDidShowNotification_, *MEMORY[0x1E0DC4E70], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObserver:selector:name:object:", v6, sel_keyboardWillHideNotification_, *MEMORY[0x1E0DC4FE0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObserver:selector:name:object:", v6, sel_favoritesDidChangeWithNotification_, *MEMORY[0x1E0C968E0], 0);

  -[CNContactContentDisplayViewController setRestorationIdentifier:](v6, "setRestorationIdentifier:", CFSTR("ContactCard"));
  -[CNContactContentDisplayViewController setRestorationClass:](v6, "setRestorationClass:", objc_opt_class());
  -[CNContactContentDisplayViewController navigationItem](v6, "navigationItem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "_setBackgroundHidden:", 1);

  -[CNContactContentDisplayViewController navigationItem](v6, "navigationItem");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setLargeTitleDisplayMode:", 2);

  v51 = -[CNContactContentDisplayViewController applyContactStyle](v6, "applyContactStyle");
  return v6;
}

- (CNContactContentDisplayViewController)initWithContact:(id)a3 contactViewConfiguration:(id)a4
{
  id v6;
  id v7;
  CNContactContentDisplayViewController *v8;
  CNContactContentDisplayViewController *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[CNContactContentDisplayViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    -[CNContactContentDisplayViewController setContact:](v8, "setContact:", v6);
    -[CNContactContentDisplayViewController setContactViewConfiguration:](v9, "setContactViewConfiguration:", v7);
    -[CNContactContentDisplayViewController contactViewConfigurationDidUpdate](v9, "contactViewConfigurationDidUpdate");
  }

  return v9;
}

- (void)setContactStore:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_contactStore, a3);
  v5 = a3;
  -[CNContactContentDisplayViewController actionsDataSource](self, "actionsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContactStore:", v5);

  -[CNContactContentDisplayViewController contactViewCache](self, "contactViewCache");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContactStore:", v5);

}

- (void)setTitle:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  char v7;
  objc_super v8;

  v5 = a3;
  if (v5
    || (-[CNContactContentDisplayViewController title](self, "title"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CNContactContentDisplayViewController title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (!v5)
    {

      if ((v7 & 1) != 0)
        goto LABEL_6;
      goto LABEL_5;
    }
    if ((v7 & 1) == 0)
    {
LABEL_5:
      v8.receiver = self;
      v8.super_class = (Class)CNContactContentDisplayViewController;
      -[CNContactContentDisplayViewController setTitle:](&v8, sel_setTitle_, v5);
      -[CNContactContentDisplayViewController didChangeToShowTitle:](self, "didChangeToShowTitle:", v5 != 0);
    }
  }
LABEL_6:

}

- (void)setForcesTransparentBackground:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (self->_forcesTransparentBackground != a3)
  {
    self->_forcesTransparentBackground = a3;
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "schedulerProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mainThreadScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__CNContactContentDisplayViewController_setForcesTransparentBackground___block_invoke;
    v7[3] = &unk_1E204F648;
    v7[4] = self;
    objc_msgSend(v6, "performBlock:", v7);

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CNUIUserActionListDataSource *actionsDataSource;
  CNContactActionProvider *actionProvider;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[CNContactView setDelegate:](self->_contactView, "setDelegate:", 0);
  -[CNContactView setDataSource:](self->_contactView, "setDataSource:", 0);
  -[CNContactHeaderView setDelegate:](self->_contactHeaderView, "setDelegate:", 0);
  -[CNContactHeaderDisplayView didFinishUsing](self->_contactHeaderView, "didFinishUsing");
  -[CNContactContentDisplayViewController headerHeightConstraint](self, "headerHeightConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactContentDisplayViewController headerHeightConstraint](self, "headerHeightConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v6);

  }
  actionsDataSource = self->_actionsDataSource;
  self->_actionsDataSource = 0;

  actionProvider = self->_actionProvider;
  self->_actionProvider = 0;

  -[CNContactContentDisplayViewController iMessageIDSLookupToken](self, "iMessageIDSLookupToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancel");

  -[CNContactContentDisplayViewController faceTimeIDSLookupToken](self, "faceTimeIDSLookupToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancel");

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:", self);

  v12.receiver = self;
  v12.super_class = (Class)CNContactContentDisplayViewController;
  -[CNContactContentDisplayViewController dealloc](&v12, sel_dealloc);
}

- (void)contactViewConfigurationDidUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  id v14;
  uint8_t v15[16];

  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentDisplayViewController actionsDataSource](self, "actionsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContactStore:", v4);

  -[CNContactContentDisplayViewController contactViewCache](self, "contactViewCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContactStore:", v4);

  CNUILogContactCard();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v15 = 0;
    _os_log_debug_impl(&dword_18AC56000, v7, OS_LOG_TYPE_DEBUG, "display contactViewConfigurationDidUpdate", v15, 2u);
  }

  -[CNContactContentDisplayViewController reloadDataIfNeeded](self, "reloadDataIfNeeded");
  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateForShowingNavBar:", objc_msgSend(v9, "layoutPositionallyAfterNavBar"));

  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController mutableContact](self, "mutableContact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateWithNewContact:", v11);

  v12 = -[CNContactContentDisplayViewController shouldShowGemini](self, "shouldShowGemini");
  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShouldShowGemini:", v12);

  -[CNContactContentDisplayViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 0);
  v14 = -[CNContactContentDisplayViewController applyContactStyle](self, "applyContactStyle");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CNContactHeaderDisplayView)contactHeaderView
{
  CNContactHeaderDisplayView *contactHeaderView;
  _BOOL8 v4;
  void *v5;
  void *v6;
  CNContactHeaderDisplayView *v7;
  CNContactHeaderDisplayView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  contactHeaderView = self->_contactHeaderView;
  if (!contactHeaderView)
  {
    v4 = -[CNContactContentDisplayViewController isHeaderViewPhotoProhibited](self, "isHeaderViewPhotoProhibited");
    -[CNContactContentDisplayViewController mutableContact](self, "mutableContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactHeaderDisplayView contactHeaderViewWithContact:showingNavBar:monogramOnly:delegate:](CNContactHeaderDisplayView, "contactHeaderViewWithContact:showingNavBar:monogramOnly:delegate:", v5, objc_msgSend(v6, "layoutPositionallyAfterNavBar"), v4, self);
    v7 = (CNContactHeaderDisplayView *)objc_claimAutoreleasedReturnValue();
    v8 = self->_contactHeaderView;
    self->_contactHeaderView = v7;

    -[CNContactHeaderView setAlwaysShowsMonogram:](self->_contactHeaderView, "setAlwaysShowsMonogram:", 1);
    -[CNContactContentDisplayViewController contactFormatter](self, "contactFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView setContactFormatter:](self->_contactHeaderView, "setContactFormatter:", v9);

    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alternateName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView setAlternateName:](self->_contactHeaderView, "setAlternateName:", v11);

    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "message");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView setMessage:](self->_contactHeaderView, "setMessage:", v13);

    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "importantMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView setImportantMessage:](self->_contactHeaderView, "setImportantMessage:", v15);

    -[CNContactContentDisplayViewController presentingDelegate](self, "presentingDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView setPresenterDelegate:](self->_contactHeaderView, "setPresenterDelegate:", v16);

    -[CNContactHeaderDisplayView setTranslatesAutoresizingMaskIntoConstraints:](self->_contactHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView setAllowsPickerActions:](self->_contactHeaderView, "setAllowsPickerActions:", objc_msgSend(v17, "allowsDisplayModePickerActions"));

    v18 = -[CNContactContentDisplayViewController applyContactStyle](self, "applyContactStyle");
    contactHeaderView = self->_contactHeaderView;
  }
  return contactHeaderView;
}

- (CNContactView)contactView
{
  CNContactView *contactView;
  CNContactView *v4;
  uint64_t v5;
  void *v6;
  CNContactView *v7;
  CNContactView *v8;

  contactView = self->_contactView;
  if (!contactView)
  {
    v4 = [CNContactView alloc];
    v5 = objc_msgSend((id)objc_opt_class(), "tableViewStyle");
    -[CNContactContentDisplayViewController contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CNContactView initWithFrame:style:contact:](v4, "initWithFrame:style:contact:", v5, v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v8 = self->_contactView;
    self->_contactView = v7;

    -[CNContactView setTranslatesAutoresizingMaskIntoConstraints:](self->_contactView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactView setDataSource:](self->_contactView, "setDataSource:", self);
    -[CNContactView setDelegate:](self->_contactView, "setDelegate:", self);
    -[CNContactView _setHeaderAndFooterViewsFloat:](self->_contactView, "_setHeaderAndFooterViewsFloat:", 0);
    contactView = self->_contactView;
  }
  return contactView;
}

- (BOOL)isHeaderViewPhotoProhibited
{
  void *v3;
  char v4;
  void *v5;

  -[CNContactContentDisplayViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0C96708]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[CNContactContentDisplayViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0C96890]);

  }
  return v4;
}

- (id)createActionsController
{
  CNContactInlineActionsViewController *v3;
  CNUIUserActionListDataSource *actionsDataSource;
  void *v5;
  CNContactInlineActionsViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  v3 = [CNContactInlineActionsViewController alloc];
  actionsDataSource = self->_actionsDataSource;
  -[CNContactContentDisplayViewController environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactInlineActionsViewController initWithActionListDataSource:environment:](v3, "initWithActionListDataSource:environment:", actionsDataSource, v5);

  -[CNContactInlineActionsViewController setDisplaysTitles:](v6, "setDisplaysTitles:", 1);
  -[CNContactInlineActionsViewController setDisplaysUnavailableActionTypes:](v6, "setDisplaysUnavailableActionTypes:", 1);
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(actionsDataSource) = objc_msgSend(v7, "showsInlineActions");

  if ((_DWORD)actionsDataSource)
  {
    objc_msgSend(MEMORY[0x1E0D13D88], "allSupportedActionTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController setSupportedActionTypes:](v6, "setSupportedActionTypes:", v8);

  }
  else
  {
    -[CNContactInlineActionsViewController setSupportedActionTypes:](v6, "setSupportedActionTypes:", MEMORY[0x1E0C9AA60]);
  }
  -[CNContactInlineActionsViewController view](v6, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1148846080;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 0, v10);

  return v6;
}

- (BOOL)isOutOfProcess
{
  void *v2;
  char v3;

  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOutOfProcess");

  return v3;
}

- (NSArray)cardActions
{
  void *v2;
  void *v3;

  -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNContactInlineActionsViewController *v7;
  CNContactInlineActionsViewController *actionsViewController;
  CNContactActionsContainerView *actionsWrapperView;
  void *v10;
  id v11;

  -[CNContactContentDisplayViewController contactView](self, "contactView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateFontSizes");

  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateFontSizes");

  -[CNContactView setTableHeaderView:](self->_contactView, "setTableHeaderView:", 0);
  -[CNContactInlineActionsViewController willMoveToParentViewController:](self->_actionsViewController, "willMoveToParentViewController:", 0);
  -[CNContactInlineActionsViewController removeFromParentViewController](self->_actionsViewController, "removeFromParentViewController");
  -[CNContactInlineActionsViewController view](self->_actionsViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[CNContactContentDisplayViewController createActionsController](self, "createActionsController");
  v7 = (CNContactInlineActionsViewController *)objc_claimAutoreleasedReturnValue();
  actionsViewController = self->_actionsViewController;
  self->_actionsViewController = v7;

  -[CNContactInlineActionsViewController setObjectViewControllerDelegate:](self->_actionsViewController, "setObjectViewControllerDelegate:", self);
  -[CNContactInlineActionsViewController setDelegate:](self->_actionsViewController, "setDelegate:", self);
  -[CNContactContentDisplayViewController addChildViewController:](self, "addChildViewController:", self->_actionsViewController);
  -[CNContactInlineActionsViewController didMoveToParentViewController:](self->_actionsViewController, "didMoveToParentViewController:", self);
  actionsWrapperView = self->_actionsWrapperView;
  -[CNContactInlineActionsViewController view](self->_actionsViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactActionsContainerView addArrangedSubview:](actionsWrapperView, "addArrangedSubview:", v10);

  -[CNContactContentDisplayViewController viewDidLayoutSubviews](self, "viewDidLayoutSubviews");
  -[CNContactContentDisplayViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
  -[CNContactContentDisplayViewController setupConstraints](self, "setupConstraints");
  v11 = -[CNContactContentDisplayViewController applyContactStyle](self, "applyContactStyle");
}

- (void)localeDidChange:(id)a3
{
  -[CNContactContentDisplayViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
}

- (void)prepareCell:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v41 = a3;
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyCellAppearance:", v41);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_29;
  objc_opt_class();
  v5 = v41;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (objc_msgSend(v7, "displaysCellSelectionState"))
    v8 = 3;
  else
    v8 = 0;
  objc_msgSend(v7, "setSelectionStyle:", v8);
  objc_msgSend(v4, "labelTextAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueTextAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "actionTextAttributes");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_15:

    v9 = (void *)v12;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v13 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    -[CNContactContentDisplayViewController actionsDataSource](self, "actionsDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActionsDataSource:", v16);

    -[CNContactContentDisplayViewController contact](self, "contact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContact:", v17);

    objc_msgSend(v4, "valueTextAttributes");
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = v15;
    goto LABEL_15;
  }
LABEL_16:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[CNContactContentDisplayViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tintColorOverride");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v5;
    if (objc_msgSend(v26, "supportsValueColorUsesLabelColor"))
    {
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "textColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }
    -[CNContactContentDisplayViewController highlightedProperties](self, "highlightedProperties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count"))
    {
      -[CNContactContentDisplayViewController highlightedProperties](self, "highlightedProperties");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "propertyItem");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v28;
      objc_msgSend(v39, "contactProperty");
      v30 = v26;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setHighlightedProperty:", objc_msgSend(v29, "containsObject:", v31));

      v26 = v30;
      v28 = v40;

    }
    else
    {
      objc_msgSend(v26, "setHighlightedProperty:", 0);
    }

    if (objc_msgSend(v26, "isSuggested"))
    {
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "suggestedLabelTextColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "suggestedValueTextColor");
      v34 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(v26, "isHighlightedProperty")
        && -[CNContactContentDisplayViewController highlightedPropertyImportant](self, "highlightedPropertyImportant"))
      {
        objc_msgSend(v26, "setImportant:", -[CNContactContentDisplayViewController highlightedPropertyImportant](self, "highlightedPropertyImportant"));
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v34 = objc_claimAutoreleasedReturnValue();
        v20 = 0;
LABEL_47:

        v19 = (void *)v34;
        goto LABEL_48;
      }
      if (!objc_msgSend(v26, "supportsTintColorValue"))
      {
        v20 = 0;
LABEL_48:
        if (objc_msgSend(v26, "isHighlightedProperty"))
        {
          if ((objc_msgSend(v26, "isImportant") & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              v35 = v26;
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v36 = v35;
              else
                v36 = 0;
              v37 = v36;

              objc_msgSend(v37, "setShouldShowBadge:", 1);
            }
          }
        }

        if (!v20)
        {
LABEL_21:
          if (v19)
          {
            v21 = (void *)objc_msgSend(v10, "mutableCopy");
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0DC1140]);

            v10 = v21;
          }
          if ((isKindOfClass & 1) != 0)
            goto LABEL_25;
          goto LABEL_24;
        }
        v38 = (void *)objc_msgSend(v9, "mutableCopy");
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0DC1140]);
        v18 = v9;
        v9 = v38;
LABEL_20:

        goto LABEL_21;
      }
      -[CNContactContentDisplayViewController view](self, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "tintColorOverride");
      v34 = objc_claimAutoreleasedReturnValue();

      v20 = 0;
    }
    v19 = v33;
    goto LABEL_47;
  }
  v20 = 0;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_25;
LABEL_24:
  objc_msgSend(v7, "labelTextAttributes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqual:", v9);

  if ((v23 & 1) == 0)
LABEL_25:
    objc_msgSend(v7, "setLabelTextAttributes:", v9);
  objc_msgSend(v7, "valueTextAttributes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqual:", v10);

  if ((v25 & 1) == 0)
    objc_msgSend(v7, "setValueTextAttributes:", v10);

LABEL_29:
}

- (void)setContact:(id)a3
{
  CNContact *v4;
  void *v5;
  CNContact **p_contact;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
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
  char isKindOfClass;
  void *v54;
  CNMutableContact **p_mutableContact;
  NSObject *v56;
  void *v57;
  CNMutableContact *v58;
  void *v59;
  void *v60;
  CNCardGroup *v61;
  CNCardGroup *cardTopGroup;
  CNCardGroup *v63;
  CNCardGroup *cardBottomGroup;
  CNCardGroup *v65;
  CNCardGroup *cardActionsGroup;
  CNCardNamePickingGroup *v67;
  CNCardNamePickingGroup *namePickingGroup;
  CNCardGroup *v69;
  CNCardGroup *cardShareLocationGroup;
  CNCardGroup *v71;
  CNCardGroup *cardBlockContactGroup;
  CNCardGroup *v73;
  CNCardGroup *cardFooterGroup;
  NSDictionary *propertyGroups;
  void *v76;
  int v77;
  CNSiriContactContextProvider *v78;
  void *v79;
  CNSiriContactContextProvider *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  _QWORD v98[5];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  id v103;
  _QWORD v104[4];
  id v105;
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  CNMutableContact *v109;
  _BYTE v110[128];
  void *v111;
  void *v112;
  uint64_t v113;
  _QWORD v114[4];

  v114[1] = *MEMORY[0x1E0C80C00];
  v4 = (CNContact *)a3;
  v5 = v4;
  self->_needsRefetch = 0;
  p_contact = &self->_contact;
  if (self->_contact == v4)
    goto LABEL_40;
  -[CNContact identifier](v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact identifier](*p_contact, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
    -[CNContactContentDisplayViewController setDidSetNewContact:](self, "setDidSetNewContact:", 1);
  -[CNContactContentDisplayViewController environment](self, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultSchedulerProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "suspendBackgroundScheduler");
  objc_msgSend(v11, "afterCACommitScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v104[0] = MEMORY[0x1E0C809B0];
  v104[1] = 3221225472;
  v104[2] = __52__CNContactContentDisplayViewController_setContact___block_invoke;
  v104[3] = &unk_1E204F648;
  v14 = v11;
  v105 = v14;
  objc_msgSend(v12, "performBlock:", v104);

  -[CNContactContentDisplayViewController contactViewCache](self, "contactViewCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resetCache");

  LODWORD(v12) = -[CNContactContentDisplayViewController isOutOfProcess](self, "isOutOfProcess");
  objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if ((_DWORD)v12)
  {
    v114[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController _updateContact:withMissingKeysFromRequiredKeys:](self, "_updateContact:withMissingKeysFromRequiredKeys:", v5, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v19;
  }
  else
  {
    v113 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertKeysAreAvailable:", v18);
  }

  -[CNContactContentDisplayViewController editAuthorizationManager](self, "editAuthorizationManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "updateWithContact:", v5);

  -[CNContactContentDisplayViewController contactViewCache](self, "contactViewCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "policyForContact:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "isReadonly"))
  {
    v97 = v14;
    -[CNContactContentDisplayViewController contactStore](self, "contactStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysForContact:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0;
    objc_msgSend(v23, "unifiedContactWithIdentifier:keysToFetch:error:", v24, v26, &v103);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v103;

    if (v27)
    {
      v28 = v27;

      -[CNContactContentDisplayViewController contactViewCache](self, "contactViewCache");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "policyForContact:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = v30;
      if (objc_msgSend(v30, "isReadonly"))
      {
        v94 = v30;
        v95 = v27;
        v31 = objc_alloc_init(MEMORY[0x1E0C97360]);
        objc_msgSend(v28, "availableKeyDescriptor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v31, "copyWithPropertyKeys:", v33);
        v35 = (void *)objc_msgSend(v34, "mutableCopy");
        -[CNContactContentDisplayViewController setShadowCopyOfReadonlyContact:](self, "setShadowCopyOfReadonlyContact:", v35);

        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        +[CNContactView nameProperties](CNContactView, "nameProperties");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v100;
          do
          {
            for (i = 0; i != v38; ++i)
            {
              if (*(_QWORD *)v100 != v39)
                objc_enumerationMutation(v36);
              v41 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i);
              if (objc_msgSend(v28, "isKeyAvailable:", v41))
              {
                -[CNContactContentDisplayViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "valueForKey:", v41);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "setValue:forKey:", v43, v41);

              }
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
          }
          while (v38);
        }

        v44 = (void *)MEMORY[0x1E0C99DE8];
        -[CNContactContentDisplayViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "arrayWithObject:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = v96;
        if (objc_msgSend(v28, "isUnified"))
        {
          objc_msgSend(v28, "linkedContacts");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObjectsFromArray:", v48);

        }
        else
        {
          objc_msgSend(v46, "addObject:", v28);
        }
        v13 = MEMORY[0x1E0C809B0];
        objc_msgSend(MEMORY[0x1E0C97200], "unifyContacts:", v46);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNContactContentDisplayViewController contactViewCache](self, "contactViewCache");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "policyForDefaultContainer");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentDisplayViewController setPolicy:](self, "setPolicy:", v50);

        -[CNContactContentDisplayViewController policy](self, "policy");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v51 || v96)
        {
          objc_msgSend(MEMORY[0x1E0C97390], "sharedPermissivePolicy");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentDisplayViewController setPolicy:](self, "setPolicy:", v52);

        }
        v14 = v97;
        v22 = v94;
        v27 = v95;
        goto LABEL_28;
      }
      v5 = v28;
    }
    v47 = v96;
    v14 = v97;
    v13 = MEMORY[0x1E0C809B0];
LABEL_28:

  }
  objc_storeStrong((id *)&self->_contact, v5);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v54 = v5;
  if ((isKindOfClass & 1) == 0)
    v54 = (void *)objc_msgSend(v5, "mutableCopy");
  p_mutableContact = &self->_mutableContact;
  objc_storeStrong((id *)&self->_mutableContact, v54);
  if ((isKindOfClass & 1) == 0)

  CNUILogContactCard();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = *p_mutableContact;
    *(_DWORD *)buf = 138543618;
    v107 = v57;
    v108 = 2050;
    v109 = v58;
    _os_log_impl(&dword_18AC56000, v56, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] setting contact with identifier %{public}@, mutable contact %{public}p", buf, 0x16u);

  }
  -[CNContactContentDisplayViewController customActions](self, "customActions");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v13;
  v98[1] = 3221225472;
  v98[2] = __52__CNContactContentDisplayViewController_setContact___block_invoke_234;
  v98[3] = &unk_1E204F6B8;
  v98[4] = self;
  objc_msgSend(v59, "_cn_filter:", v98);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController setCustomActions:](self, "setCustomActions:", v60);

  v61 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardTopGroup = self->_cardTopGroup;
  self->_cardTopGroup = v61;

  v63 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardBottomGroup = self->_cardBottomGroup;
  self->_cardBottomGroup = v63;

  -[CNCardGroup setAddSpacerFromPreviousGroup:](self->_cardBottomGroup, "setAddSpacerFromPreviousGroup:", 1);
  v65 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardActionsGroup = self->_cardActionsGroup;
  self->_cardActionsGroup = v65;

  v67 = -[CNCardGroup initWithContact:]([CNCardNamePickingGroup alloc], "initWithContact:", *p_contact);
  namePickingGroup = self->_namePickingGroup;
  self->_namePickingGroup = v67;

  v69 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardShareLocationGroup = self->_cardShareLocationGroup;
  self->_cardShareLocationGroup = v69;

  v71 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardBlockContactGroup = self->_cardBlockContactGroup;
  self->_cardBlockContactGroup = v71;

  -[CNCardGroup setAddSpacerFromPreviousGroup:](self->_cardBlockContactGroup, "setAddSpacerFromPreviousGroup:", 1);
  v73 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardFooterGroup = self->_cardFooterGroup;
  self->_cardFooterGroup = v73;

  -[CNCardGroup setAddSpacerFromPreviousGroup:](self->_cardFooterGroup, "setAddSpacerFromPreviousGroup:", 1);
  propertyGroups = self->_propertyGroups;
  self->_propertyGroups = 0;

  -[CNContactContentDisplayViewController siriContextProvider](self, "siriContextProvider");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "isEnabled");

  v78 = [CNSiriContactContextProvider alloc];
  -[CNContactContentDisplayViewController contactStore](self, "contactStore");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = -[CNSiriContactContextProvider initWithContact:store:](v78, "initWithContact:store:", v5, v79);
  -[CNContactContentDisplayViewController setSiriContextProvider:](self, "setSiriContextProvider:", v80);

  if (v77)
  {
    -[CNContactContentDisplayViewController siriContextProvider](self, "siriContextProvider");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setEnabled:", 1);

  }
  -[CNContactContentDisplayViewController setActionProvider:](self, "setActionProvider:", 0);
  -[CNContactContentDisplayViewController setCardFaceTimeGroup:](self, "setCardFaceTimeGroup:", 0);
  -[CNContactContentDisplayViewController setBlockAction:](self, "setBlockAction:", 0);
  -[CNContactContentDisplayViewController setIgnoreContactAction:](self, "setIgnoreContactAction:", 0);
  -[CNContactContentDisplayViewController setCardMedicalIDGroup:](self, "setCardMedicalIDGroup:", 0);
  -[CNContactContentDisplayViewController setMedicalIDAction:](self, "setMedicalIDAction:", 0);
  -[CNContactContentDisplayViewController setEmergencyContactAction:](self, "setEmergencyContactAction:", 0);
  -[CNContactContentDisplayViewController geminiDataSource](self, "geminiDataSource");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setContact:", v5);

  -[CNContactContentDisplayViewController isOutOfProcess](self, "isOutOfProcess");
  -[CNContactContentDisplayViewController editAuthorizationManager](self, "editAuthorizationManager");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v83, "shouldPromptForPasscodeAuthorization");
  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setIsRestrictedContact:", v84);

  v86 = objc_msgSend(MEMORY[0x1E0C972D8], "isWhitelistedContact:", *p_mutableContact);
  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setIsDowntimeContact:", v86);

  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "updateWithNewContact:", *p_mutableContact);

  -[CNContactContentDisplayViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 0);
  -[CNContactContentDisplayViewController setContactSupportsTTYCalls:](self, "setContactSupportsTTYCalls:", 0);
  -[CNContactContentDisplayViewController shareLocationController](self, "shareLocationController");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setContact:", v5);

  -[CNContactContentDisplayViewController actionsViewController](self, "actionsViewController");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setContact:", v5);

  -[CNContactContentDisplayViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
  if (-[CNContactContentDisplayViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController scrollScrollViewAllTheWayUp:](self, "scrollScrollViewAllTheWayUp:", v91);

  }
  +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contact](self, "contact");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "logContactShown:", v93);

  -[CNContactContentDisplayViewController prepareContactDidAppearForPPT](self, "prepareContactDidAppearForPPT");
LABEL_40:

}

- (void)keyboardDidShowNotification:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CNContactContentDisplayViewController view](self, "view");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:fromWindow:", 0, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(v31, "convertRect:fromView:", 0, v16, v18, v20, v22);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(v31, "bounds");
  v34.origin.x = v24;
  v34.origin.y = v26;
  v34.size.width = v28;
  v34.size.height = v30;
  v33 = CGRectIntersection(v32, v34);
  -[CNContactContentDisplayViewController adjustInsetsForKeyboardOverlap:](self, "adjustInsetsForKeyboardOverlap:", CGRectGetHeight(v33));

}

- (void)keyboardWillHideNotification:(id)a3
{
  -[CNContactContentDisplayViewController adjustInsetsForKeyboardOverlap:](self, "adjustInsetsForKeyboardOverlap:", a3, 0.0);
}

- (void)adjustInsetsForKeyboardOverlap:(double)a3
{
  -[CNContactContentDisplayViewController setKeyboardVerticalOverlap:](self, "setKeyboardVerticalOverlap:", a3);
  -[CNContactContentDisplayViewController updateInsetsIfNeeded](self, "updateInsetsIfNeeded");
}

- (void)contactStoreDidChangeWithNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[CNUIContactsEnvironment defaultSchedulerProvider](self->_environment, "defaultSchedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__CNContactContentDisplayViewController_contactStoreDidChangeWithNotification___block_invoke;
  v8[3] = &unk_1E2050400;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)favoritesDidChangeWithNotification:(id)a3
{
  -[CNContactContentDisplayViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
}

- (void)_refetchContact
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  -[CNContactContentDisplayViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D13D40], "unifiedMeContactMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isMeContact:", v5);

    CNUILogContactCard();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        objc_msgSend(v3, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v9;
        _os_log_impl(&dword_18AC56000, v7, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it the me card, identifier %{public}@", buf, 0xCu);

      }
      -[CNContactContentDisplayViewController contactStore](self, "contactStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysForContact:", v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v10, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v12, &v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
    }
    else
    {
      if (v8)
      {
        objc_msgSend(v3, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v15;
        _os_log_impl(&dword_18AC56000, v7, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it not the me card, identifier %{public}@", buf, 0xCu);

      }
      -[CNContactContentDisplayViewController contactStore](self, "contactStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysForContact:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v10, "unifiedContactWithIdentifier:keysToFetch:error:", v11, v16, &v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v20;

    }
    if (v14 || !v13)
    {
      CNUILogContactCard();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentDisplayViewController contactStore](self, "contactStore");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v23 = v18;
        v24 = 2112;
        v25 = v14;
        v26 = 2112;
        v27 = v19;
        v28 = 2112;
        v29 = v3;
        _os_log_error_impl(&dword_18AC56000, v17, OS_LOG_TYPE_ERROR, "Error refetching contact with identifier %@, %@, store %@, full contact %@", buf, 0x2Au);

      }
    }
    else if ((objc_msgSend(v13, "isEqual:", v3) & 1) == 0)
    {
      -[CNContactContentDisplayViewController setContact:](self, "setContact:", v13);
    }

  }
}

- (NSArray)originalContacts
{
  NSArray *originalContacts;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  originalContacts = self->_originalContacts;
  if (originalContacts)
    return originalContacts;
  if (self->_contact)
  {
    v5[0] = self->_contact;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v4;
}

- (void)setPersonHeaderViewController:(id)a3
{
  unint64_t v5;
  UIViewController *personHeaderViewController;
  char v7;
  int v8;
  void *v9;
  unint64_t v10;

  v5 = (unint64_t)a3;
  personHeaderViewController = self->_personHeaderViewController;
  if (v5 | (unint64_t)personHeaderViewController)
  {
    v10 = v5;
    v7 = -[UIViewController isEqual:](personHeaderViewController, "isEqual:", v5);
    v5 = v10;
    if ((v7 & 1) == 0)
    {
      if (self->_personHeaderViewController)
        -[CNContactContentDisplayViewController removeFirstSectionHeaderViewControllerFromHierarchy](self, "removeFirstSectionHeaderViewControllerFromHierarchy");
      objc_storeStrong((id *)&self->_personHeaderViewController, a3);
      v8 = -[CNContactContentDisplayViewController isViewLoaded](self, "isViewLoaded");
      v5 = v10;
      if (v8)
      {
        -[CNContactContentDisplayViewController contactView](self, "contactView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "reloadData");

        v5 = v10;
      }
    }
  }

}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSDictionary *v39;
  NSDictionary *propertyGroups;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[8];
  _BYTE v50[128];
  uint64_t v51;

  v3 = a3;
  v51 = *MEMORY[0x1E0C80C00];
  if (!-[CNContactContentDisplayViewController isViewLoaded](self, "isViewLoaded"))
    return;
  -[CNContactContentDisplayViewController isOutOfProcess](self, "isOutOfProcess");
  self->_needsReload = 0;
  -[CNContactContentDisplayViewController contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contactStore");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CNContactContentDisplayViewController originalContacts](self, "originalContacts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_cn_filter:", &__block_literal_global_55748);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "count"))
        v12 = 7;
      else
        v12 = 1;
      -[CNContactContentDisplayViewController managedConfiguration](self, "managedConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = objc_alloc(MEMORY[0x1E0C97298]);
        -[CNContactContentDisplayViewController environment](self, "environment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cnEnvironment");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentDisplayViewController managedConfiguration](self, "managedConfiguration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v14, "initWithEnvironment:options:managedConfiguration:", v15, v12, v16);
        -[CNContactContentDisplayViewController setContactStore:](self, "setContactStore:", v17);

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", v12);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    -[CNContactContentDisplayViewController setContactStore:](self, "setContactStore:", v9);
LABEL_11:

  }
  if (!-[CNContactContentDisplayViewController mode](self, "mode"))
  {
    -[CNContactContentDisplayViewController parentViewController](self, "parentViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getClass("ABNewPersonViewController");
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      -[CNContactContentDisplayViewController setMode:](self, "setMode:", 3);
  }
  if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) != 3)
  {
    CNUILogContactCard();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v20, OS_LOG_TYPE_ERROR, "CNContactContentViewController does not have authorization to access contacts.", buf, 2u);
    }

  }
  -[CNContactContentDisplayViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    -[CNContactContentDisplayViewController contact](self, "contact");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController _policyForContact:mode:](self, "_policyForContact:mode:", v22, -[CNContactContentDisplayViewController mode](self, "mode"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController setPolicy:](self, "setPolicy:", v23);

  }
  -[CNContactContentDisplayViewController contact](self, "contact");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isUnified");

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[CNContactContentDisplayViewController contact](self, "contact");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "linkedContacts");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v46 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          -[CNContactContentDisplayViewController _policyForContact:mode:](self, "_policyForContact:mode:", v33, -[CNContactContentDisplayViewController mode](self, "mode"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            objc_msgSend(v33, "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKey:", v34, v35);

          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v30);
    }

    v36 = (void *)objc_msgSend(v26, "copy");
    -[CNContactContentDisplayViewController setLinkedPoliciesByContactIdentifier:](self, "setLinkedPoliciesByContactIdentifier:", v36);

  }
  -[CNContactContentDisplayViewController iMessageIDSLookupToken](self, "iMessageIDSLookupToken");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "cancel");

  -[CNContactContentDisplayViewController faceTimeIDSLookupToken](self, "faceTimeIDSLookupToken");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "cancel");

  if (!self->_propertyGroups)
  {
    -[CNContactContentDisplayViewController _loadPropertyGroups](self, "_loadPropertyGroups");
    v39 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    propertyGroups = self->_propertyGroups;
    self->_propertyGroups = v39;

  }
  if ((objc_msgSend(MEMORY[0x1E0C97200], "quickActionsEnabled") & 1) == 0)
    -[CNContactContentDisplayViewController _reloadFaceTimeGroup](self, "_reloadFaceTimeGroup");
  -[CNContactContentDisplayViewController _reloadGeminiGroupPreservingChanges:](self, "_reloadGeminiGroupPreservingChanges:", v3);
  -[CNContactContentDisplayViewController _reloadPropertyGroupsPreservingChanges:](self, "_reloadPropertyGroupsPreservingChanges:", v3);
  -[CNContactContentDisplayViewController _reloadMedicalIDGroup](self, "_reloadMedicalIDGroup");
  -[CNContactContentDisplayViewController _reloadAlertGroups](self, "_reloadAlertGroups");
  -[CNContactContentDisplayViewController setupActionsPreservingChanges:](self, "setupActionsPreservingChanges:", v3);
  -[CNContactContentDisplayViewController _reloadLinkedCardsGroup](self, "_reloadLinkedCardsGroup");
  -[CNContactContentDisplayViewController _loadDisplayGroups](self, "_loadDisplayGroups");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController setDisplayGroups:](self, "setDisplayGroups:", v41);

  -[CNContactContentDisplayViewController _setNeedsUpdateCachedLabelWidths](self, "_setNeedsUpdateCachedLabelWidths");
  -[CNContactContentDisplayViewController _updateAvailableTransports](self, "_updateAvailableTransports");
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "reloadData");

  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "reloadDataPreservingChanges:", v3);

  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __69__CNContactContentDisplayViewController_reloadDataPreservingChanges___block_invoke_246;
  v44[3] = &unk_1E204F648;
  v44[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v44);
  -[CNContactContentDisplayViewController _updateUserActivity](self, "_updateUserActivity");
  -[CNContactContentDisplayViewController adjustPreferredContentSize](self, "adjustPreferredContentSize");
}

- (id)cardGroupForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNContactContentDisplayViewController propertyGroups](self, "propertyGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)sectionOfGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;

  v4 = a3;
  -[CNContactContentDisplayViewController _currentGroups](self, "_currentGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5)
  {
    v8 = objc_msgSend(v5, "indexOfObject:", v4);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      v7 = -[CNContactContentDisplayViewController tableViewSectionIndexFromGroupIndex:](self, "tableViewSectionIndexFromGroupIndex:", v8);
  }

  return v7;
}

- (void)addActionWithTitle:(id)a3 menuProvider:(id)a4 inGroup:(id)a5 destructive:(BOOL)a6
{
  -[CNContactContentDisplayViewController addActionWithTitle:target:selector:menuProvider:inGroup:destructive:](self, "addActionWithTitle:target:selector:menuProvider:inGroup:destructive:", a3, 0, 0, a4, a5, a6);
}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 menuProvider:(id)a6 inGroup:(id)a7 destructive:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  CNContactTargetActionWrapper *v18;
  int64_t v19;
  int64_t v20;
  CNCustomCardAction *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  int v29;
  id v30;
  uint64_t v31;

  v8 = a8;
  v31 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a4;
  v18 = -[CNContactTargetActionWrapper initWithTarget:action:]([CNContactTargetActionWrapper alloc], "initWithTarget:action:", v17, a5);

  v19 = +[CNCustomCardAction placementForGroup:inContactContentViewController:](CNCustomCardAction, "placementForGroup:inContactContentViewController:", v16, self);
  if (v19)
  {
    v20 = v19;
    v21 = [CNCustomCardAction alloc];
    -[CNContactContentDisplayViewController contact](self, "contact");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[CNCustomCardAction initWithTitle:targetActionWrapper:contactIdentifier:placement:isDestructive:menuProvider:](v21, "initWithTitle:targetActionWrapper:contactIdentifier:placement:isDestructive:menuProvider:", v14, v18, v23, v20, v8, v15);

    -[CNContactContentDisplayViewController customActions](self, "customActions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "arrayByAddingObject:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController setCustomActions:](self, "setCustomActions:", v26);

  }
  else
  {
    CNUILogContactCard();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v29 = 138412290;
      v30 = v14;
      _os_log_impl(&dword_18AC56000, v24, OS_LOG_TYPE_INFO, "Found undefined placement for action with title %@", (uint8_t *)&v29, 0xCu);
    }
  }

  if (v15)
    v27 = (id)objc_msgSend(v16, "addActionWithTitle:menuProvider:destructive:", v14, v15, v8);
  else
    v28 = (id)objc_msgSend(v16, "addActionWithTitle:target:selector:destructive:", v14, v18, sel_performActionWithSender_, v8);
  -[CNContactContentDisplayViewController setNeedsReload](self, "setNeedsReload");

}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6 destructive:(BOOL)a7
{
  -[CNContactContentDisplayViewController addActionWithTitle:target:selector:menuProvider:inGroup:destructive:](self, "addActionWithTitle:target:selector:menuProvider:inGroup:destructive:", a3, a4, a5, 0, a6, a7);
}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6
{
  -[CNContactContentDisplayViewController addActionWithTitle:target:selector:inGroup:destructive:](self, "addActionWithTitle:target:selector:inGroup:destructive:", a3, a4, a5, a6, 0);
}

- (void)removeActionWithTarget:(id)a3 selector:(SEL)a4 inGroup:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  CNContactContentDisplayViewController *v17;
  SEL v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "removeActionWithTarget:selector:", v8, a4);
  -[CNContactContentDisplayViewController customActions](self, "customActions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__CNContactContentDisplayViewController_removeActionWithTarget_selector_inGroup___block_invoke;
  v14[3] = &unk_1E204F720;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = a4;
  v11 = v9;
  v13 = v8;
  objc_msgSend(v10, "_cn_filter:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController setCustomActions:](self, "setCustomActions:", v12);

  -[CNContactContentDisplayViewController setNeedsReload](self, "setNeedsReload");
}

- (void)reloadCardGroup:(id)a3
{
  void *v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentDisplayViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (!-[CNContactContentDisplayViewController needsReload](self, "needsReload"))
    {
      v5 = -[CNContactContentDisplayViewController sectionOfGroup:](self, "sectionOfGroup:", v8);
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v6 = v5;
        objc_msgSend(v4, "beginUpdates");
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "reloadSections:withRowAnimation:", v7, 0);

        objc_msgSend(v4, "endUpdates");
        -[CNContactContentDisplayViewController updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:](self, "updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:", v4, 2, 0);
        -[CNContactContentDisplayViewController adjustPreferredContentSize](self, "adjustPreferredContentSize");
      }
    }
  }

}

- (void)adjustPreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  char v11;
  id v12;

  -[CNContactContentDisplayViewController requiredSizeForVisibleTableView](self, "requiredSizeForVisibleTableView");
  v4 = v3;
  v6 = v5;
  -[CNContactContentDisplayViewController preferredContentSize](self, "preferredContentSize");
  if (v4 != v8 || v6 != v7)
  {
    -[CNContactContentDisplayViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6);
    -[CNContactContentDisplayViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[CNContactContentDisplayViewController delegate](self, "delegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController preferredContentSize](self, "preferredContentSize");
      objc_msgSend(v12, "contactDisplayViewController:didChangePreferredContentSize:", self);

    }
  }
}

- (id)indexPathOfPropertyItem:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactContentDisplayViewController sectionOfGroup:](self, "sectionOfGroup:", v5);
  objc_msgSend(v5, "displayItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v4);

  v9 = 0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_policyForContact:(id)a3 mode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;

  v6 = a3;
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "allowsAddingToAddressBook"))
  {
    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "allowsEditing") & 1) != 0)
    {
      v12 = objc_msgSend(v6, "hasBeenPersisted");

      if (v12)
        goto LABEL_3;
    }
    else
    {

    }
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C97390], "sharedPermissivePolicy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

LABEL_3:
  if ((unint64_t)a4 <= 5 && ((1 << a4) & 0x32) != 0)
  {
    -[CNContactContentDisplayViewController contactViewCache](self, "contactViewCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v6;
  }
  else
  {
    -[CNContactContentDisplayViewController contactViewCache](self, "contactViewCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
  }
  objc_msgSend(v8, "policyForContact:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_12;
LABEL_13:

  return v13;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 4)
    return 0;
  -[CNContactContentDisplayViewController contactView](self, "contactView", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UINavigationItem)effectiveNavigationItem
{
  void *v2;
  void *v3;

  -[CNContactContentDisplayViewController navigationItemController](self, "navigationItemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UINavigationItem *)v3;
}

- (void)updateEditNavigationItemsAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v23;

  -[CNContactContentDisplayViewController isOutOfProcess](self, "isOutOfProcess");
  -[CNContactContentDisplayViewController currentNavigationController](self, "currentNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  -[CNContactContentDisplayViewController contactNavigationItemUpdater](self, "contactNavigationItemUpdater");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController navigationItemController](self, "navigationItemController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNContactContentDisplayViewController mode](self, "mode");
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "allowsEditing");
  -[CNContactContentDisplayViewController editAuthorizationManager](self, "editAuthorizationManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "shouldPromptForPasscodeAuthorization");
  v15 = -[UIViewController ab_isInSheet](self, "ab_isInSheet");
  LOBYTE(v21) = a3;
  BYTE2(v20) = 0;
  BYTE1(v20) = v7;
  LOBYTE(v20) = -[CNContactContentDisplayViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar");
  objc_msgSend(v8, "updateDisplayNavigationItemsForController:mode:actionTarget:allowsEditing:editRequiresAuthorization:isInSheet:isShowingNavBar:shouldShowBackButton:shouldUsePlatterStyle:platterBackBarButtonItem:animated:", v9, v10, self, v12, v14, v15, v20, 0, v21);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactContentDisplayViewController setEditKeyboardShortcutEnabled:](self, "setEditKeyboardShortcutEnabled:", objc_msgSend(v23, "enableEditShortcut"));
  -[CNContactContentDisplayViewController setCancelKeyboardShortcutEnabled:](self, "setCancelKeyboardShortcutEnabled:", objc_msgSend(v23, "enableCancelShortcut"));
  -[CNContactContentDisplayViewController navigationItemDelegate](self, "navigationItemDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController navigationItemController](self, "navigationItemController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController doneButtonItem](self, "doneButtonItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contactNavigationItemProvider:didUpdateNavigationItem:doneButtonItem:", self, v18, v19);

}

- (id)currentNavigationController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CNContactContentDisplayViewController navigationItemController](self, "navigationItemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v3, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "navigationController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v6 = v3;
LABEL_6:
  v10 = v6;

  return v10;
}

- (void)updateWindowTitleForAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    -[CNContactContentDisplayViewController title](self, "title");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[CNContactContentDisplayViewController navigationController](self, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "title");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        -[CNContactContentDisplayViewController contactFormatter](self, "contactFormatter");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentDisplayViewController contact](self, "contact");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringFromContact:", v6);
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    -[CNContactContentDisplayViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v10);

  }
  else
  {
    -[CNContactContentDisplayViewController view](self, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", 0);
  }

}

- (void)cancelAsyncLookups
{
  void *v3;
  void *v4;
  void *v5;

  -[CNContactContentDisplayViewController faceTimeIDSLookupToken](self, "faceTimeIDSLookupToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNContactContentDisplayViewController setFaceTimeIDSLookupToken:](self, "setFaceTimeIDSLookupToken:", 0);
  -[CNContactContentDisplayViewController iMessageIDSLookupToken](self, "iMessageIDSLookupToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[CNContactContentDisplayViewController setIMessageIDSLookupToken:](self, "setIMessageIDSLookupToken:", 0);
  -[CNContactContentDisplayViewController medicalIDLookupToken](self, "medicalIDLookupToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[CNContactContentDisplayViewController setMedicalIDLookupToken:](self, "setMedicalIDLookupToken:", 0);
}

- (BOOL)saveWasAuthorized
{
  void *v2;
  char v3;

  -[CNContactContentDisplayViewController editAuthorizationManager](self, "editAuthorizationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "saveWasAuthorized");

  return v3;
}

- (void)toggleEditing:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNContactContentDisplayViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactContentDisplayViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactDisplayViewController:didChangeToEditMode:", self, 1);

  }
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[CNContactContentDisplayViewController setView:](self, "setView:", v3);

  -[CNContactContentDisplayViewController loadContactViewControllerViews](self, "loadContactViewControllerViews");
}

- (void)loadContactViewControllerViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  objc_msgSend(v5, "cellIdentifierForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController setNoteCell:](self, "setNoteCell:", v7);

  -[CNContactContentDisplayViewController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

}

- (void)setupViewHierarchyIncludingAvatarHeader:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
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
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void *v39;
  id v40;
  uint64_t v41;
  _QWORD v42[2];

  v3 = a3;
  v42[1] = *MEMORY[0x1E0C80C00];
  if (-[CNContactContentDisplayViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNContactContentDisplayViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v3)
    {
      v42[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v7;
    }
    else
    {
      v41 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v6;
    }
    objc_msgSend(v11, "addObjectsFromArray:", v10);

    if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
    {
      -[CNContactContentDisplayViewController actionsWrapperView](self, "actionsWrapperView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);

      -[CNContactContentDisplayViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_cnui_contactStyle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "usesOpaqueBackground");

      if (v15)
      {
        -[CNContactContentDisplayViewController actionsWrapperView](self, "actionsWrapperView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentDisplayViewController headerDropShadowView](self, "headerDropShadowView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSubview:", v17);

      }
    }
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v18);

    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "allowsActionsModel");

    if ((v20 & 1) == 0)
    {
      -[CNContactContentDisplayViewController actionsViewController](self, "actionsViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeFromSuperview");

    }
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "panGestureRecognizer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25 != v26)
    {
      -[CNContactContentDisplayViewController contactView](self, "contactView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "panGestureRecognizer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController contactView](self, "contactView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "panGestureRecognizer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "removeGestureRecognizer:", v31);

      -[CNContactContentDisplayViewController view](self, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController contactView](self, "contactView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "panGestureRecognizer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addGestureRecognizer:", v34);

    }
    v36 = MEMORY[0x1E0C809B0];
    v37 = 3221225472;
    v38 = __81__CNContactContentDisplayViewController_setupViewHierarchyIncludingAvatarHeader___block_invoke;
    v39 = &unk_1E204F838;
    v40 = v5;
    v35 = v5;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v36);
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_260, v36, v37, v38, v39);

  }
}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CNContactContentNavigationItemUpdater *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNContactContentDisplayViewController;
  -[CNContactContentDisplayViewController viewDidLoad](&v10, sel_viewDidLoad);
  v3 = *MEMORY[0x1E0D13848];
  -[CNContactContentDisplayViewController initialPrompt](self, "initialPrompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((v3 & 1) == 0)
  {
    -[CNContactContentDisplayViewController initialPrompt](self, "initialPrompt");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrompt:", v5);

  }
  if (-[CNContactContentDisplayViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar"))
  {
    -[CNContactContentDisplayViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setBackgroundHidden:", 0);

  }
  -[CNContactContentDisplayViewController reloadDataIfNeeded](self, "reloadDataIfNeeded");
  v8 = objc_alloc_init(CNContactContentNavigationItemUpdater);
  -[CNContactContentDisplayViewController setContactNavigationItemUpdater:](self, "setContactNavigationItemUpdater:", v8);

  -[CNContactContentDisplayViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsUpdateConstraints");

}

- (BOOL)shouldDisplayAvatarHeaderView
{
  void *v2;
  BOOL v3;

  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setupConstraints
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
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
  double v40;
  double v41;
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
  double v64;
  void *v65;
  double v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;

  v3 = -[CNContactContentDisplayViewController shouldDisplayAvatarHeaderView](self, "shouldDisplayAvatarHeaderView");
  -[CNContactContentDisplayViewController setupViewHierarchyIncludingAvatarHeader:](self, "setupViewHierarchyIncludingAvatarHeader:", v3);
  -[CNContactContentDisplayViewController setupTableHeaderView](self, "setupTableHeaderView");
  -[CNContactContentDisplayViewController setupTableFooterView](self, "setupTableFooterView");
  v4 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactContentDisplayViewController activatedConstraints](self, "activatedConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v101 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maxHeight");
    objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 8, 0, 0, 0, 1.0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController setHeaderHeightConstraint:](self, "setHeaderHeightConstraint:", v10);

    -[CNContactContentDisplayViewController headerHeightConstraint](self, "headerHeightConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "addObject:", v11);

    -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "addObject:", v16);

    -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leftAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leftAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "addObject:", v21);

    -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "rightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "addObject:", v26);

    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "addObject:", v31);

    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "addObject:", v36);

    -[CNContactContentDisplayViewController headerDropShadowView](self, "headerDropShadowView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "superview");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "scale");
      v41 = v40;

      -[CNContactContentDisplayViewController headerDropShadowView](self, "headerDropShadowView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "heightAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToConstant:", 1.0 / v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "addObject:", v44);

      -[CNContactContentDisplayViewController headerDropShadowView](self, "headerDropShadowView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "bottomAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController headerDropShadowView](self, "headerDropShadowView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "superview");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "bottomAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "addObject:", v50);

      -[CNContactContentDisplayViewController headerDropShadowView](self, "headerDropShadowView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "leftAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController headerDropShadowView](self, "headerDropShadowView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "superview");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "leftAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "addObject:", v56);

      -[CNContactContentDisplayViewController headerDropShadowView](self, "headerDropShadowView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "rightAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController headerDropShadowView](self, "headerDropShadowView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "superview");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "rightAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToAnchor:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "addObject:", v62);

    }
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v63, "usesInsetPlatterStyle"))
      v64 = 20.0;
    else
      v64 = 10.0;

    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v65, "usesInsetPlatterStyle"))
      v66 = 16.0;
    else
      v66 = 15.0;

    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "allowsActionsModel");

    if (v68)
    {
      -[CNContactContentDisplayViewController view](self, "view");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "leadingAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController actionsWrapperView](self, "actionsWrapperView");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "leadingAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "addObject:", v73);

      -[CNContactContentDisplayViewController view](self, "view");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "trailingAnchor");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController actionsWrapperView](self, "actionsWrapperView");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "trailingAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "constraintEqualToAnchor:", v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "addObject:", v78);

      if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
      {
        -[CNContactContentDisplayViewController actionsWrapperView](self, "actionsWrapperView");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "topAnchor");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "bottomAnchor");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "constraintEqualToAnchor:", v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "addObject:", v83);

      }
      -[CNContactContentDisplayViewController actionsWrapperView](self, "actionsWrapperView");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setLayoutMargins:", v64, 8.0, v66, 8.0);

      -[CNContactContentDisplayViewController view](self, "view");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "_cnui_contactStyle");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "sectionMaximumPlatterWidth");
      v88 = v87;
      v89 = *MEMORY[0x1E0CFAA78];
      -[CNContactInlineActionsViewController view](self->_actionsViewController, "view");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "setMinimumLayoutSize:", v88, v89);

    }
  }
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "leftAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController view](self, "view");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "leftAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "addObject:", v95);

  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "rightAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController view](self, "view");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "rightAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "addObject:", v100);

  -[CNContactContentDisplayViewController setActivatedConstraints:](self, "setActivatedConstraints:", v101);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v101);

}

- (void)updateViewConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactContentDisplayViewController;
  -[CNContactContentDisplayViewController updateViewConstraints](&v3, sel_updateViewConstraints);
  -[CNContactContentDisplayViewController setupConstraints](self, "setupConstraints");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  int v7;
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
  objc_super v18;

  v3 = a3;
  if (-[CNContactContentDisplayViewController forcesTransparentBackground](self, "forcesTransparentBackground"))
  {
    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[UIViewController ab_shouldUseTransparentBackgroundInPopovers](self, "ab_shouldUseTransparentBackgroundInPopovers"))
  {
    +[CNUIColorRepository popoverBackgroundColor](CNUIColorRepository, "popoverBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNContactContentDisplayViewController environment](self, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "runningInContactsAppOniPad");

    if (!v7)
      goto LABEL_8;
    +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor](CNUIColorRepository, "contactCardBackgroundiPadOverwriteColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v5;
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

LABEL_8:
  v18.receiver = self;
  v18.super_class = (Class)CNContactContentDisplayViewController;
  -[CNContactContentDisplayViewController viewWillAppear:](&v18, sel_viewWillAppear_, v3);
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

  }
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_cnui_applyContactStyle");

  if (!-[CNContactContentDisplayViewController reloadDataIfNeeded](self, "reloadDataIfNeeded"))
    -[CNContactContentDisplayViewController _setNeedsUpdateCachedLabelWidths](self, "_setNeedsUpdateCachedLabelWidths");
  -[CNContactContentDisplayViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 0);
  -[CNContactContentDisplayViewController siriContextProvider](self, "siriContextProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", 1);

  -[CNContactContentDisplayViewController shareLocationController](self, "shareLocationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startUpdatingFriends");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactContentDisplayViewController;
  -[CNContactContentDisplayViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (self->_needsRefetch)
  {
    -[CNContactContentDisplayViewController _refetchContact](self, "_refetchContact");
    self->_needsRefetch = 0;
  }
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "alwaysEditing");

  if ((v5 & 1) == 0)
    -[CNContactContentDisplayViewController becomeFirstResponder](self, "becomeFirstResponder");
  -[CNContactContentDisplayViewController updateWindowTitleForAppearing:](self, "updateWindowTitleForAppearing:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactContentDisplayViewController;
  -[CNContactContentDisplayViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[CNContactContentDisplayViewController siriContextProvider](self, "siriContextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[CNContactContentDisplayViewController updateWindowTitleForAppearing:](self, "updateWindowTitleForAppearing:", 0);
  -[CNContactContentDisplayViewController shareLocationController](self, "shareLocationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopUpdatingFriends");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactContentDisplayViewController;
  -[CNContactContentDisplayViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calculateLabelSizesIfNeeded");

  -[CNContactContentDisplayViewController updateOutOfProcessFullscreenPresentationIfNeeded](self, "updateOutOfProcessFullscreenPresentationIfNeeded");
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNContactContentDisplayViewController;
  -[CNContactContentDisplayViewController viewDidLayoutSubviews](&v12, sel_viewDidLayoutSubviews);
  -[CNContactContentDisplayViewController _updateCachedLabelWidthsIfNeeded](self, "_updateCachedLabelWidthsIfNeeded");
  -[CNContactContentDisplayViewController setupTableHeaderView](self, "setupTableHeaderView");
  v4 = v3;
  v6 = v5;
  -[CNContactContentDisplayViewController initializeTableViewsForHeaderHeight](self, "initializeTableViewsForHeaderHeight");
  -[CNContactContentDisplayViewController adjustPreferredContentSize](self, "adjustPreferredContentSize");
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "frame");
    if (v4 != v10 || v6 != v9)
    {
      -[CNContactContentDisplayViewController contactView](self, "contactView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTableHeaderView:", v8);

    }
  }
  -[CNContactContentDisplayViewController setupTableFooterView](self, "setupTableFooterView");

}

- (CGSize)setupTableHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  CGSize result;

  if (-[CNContactContentDisplayViewController shouldDisplayAvatarHeaderView](self, "shouldDisplayAvatarHeaderView"))
  {
    if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
    {
      -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "backgroundColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController actionsViewController](self, "actionsViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", v4);

      -[CNContactContentDisplayViewController actionsWrapperView](self, "actionsWrapperView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  else
  {
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "customHeaderView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CNContactContentDisplayViewController contactView](self, "contactView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "customHeaderView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_7:
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tableHeaderView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "needsUpdateConstraints");

  if (v7)
  {
    objc_msgSend(v7, "frame");
    v15 = v14;
    v17 = v16;
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D820];
    v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTableHeaderView:", v7);

  if ((v13 & 1) == 0)
  {
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tableHeaderView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "needsUpdateConstraints");

    if (v21)
    {
      -[CNContactContentDisplayViewController contactView](self, "contactView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "tableHeaderView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "updateConstraints");

    }
  }

  v24 = v15;
  v25 = v17;
  result.height = v25;
  result.width = v24;
  return result;
}

- (void)setupTableFooterView
{
  void *v3;
  void *v4;
  void *v5;
  CNContactViewFooterView *v6;
  CNContactViewFooterView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CNContactViewFooterView *v19;

  if ((-[CNContactContentDisplayViewController isEditing](self, "isEditing") & 1) != 0
    || (-[CNContactContentDisplayViewController contact](self, "contact"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "phonemeData"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v19 = (CNContactViewFooterView *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewFooterView setTableFooterView:](v19, "setTableFooterView:", 0);
  }
  else
  {
    objc_opt_class();
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableFooterView");
    v19 = (CNContactViewFooterView *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v19;
    else
      v6 = 0;
    v7 = v6;

    if (!v7)
    {
      v19 = objc_alloc_init(CNContactViewFooterView);
      -[CNContactContentDisplayViewController contactView](self, "contactView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTableFooterView:", v19);

    }
    -[CNContactContentDisplayViewController contact](self, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewFooterView setContact:](v19, "setContact:", v9);

    -[CNContactViewFooterView label](v19, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    -[CNContactContentDisplayViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutMargins");
    v16 = v13 - v15;
    -[CNContactContentDisplayViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutMargins");
    objc_msgSend(v10, "sizeThatFits:", v16 - v18, 1.79769313e308);

    -[CNContactViewFooterView frame](v19, "frame");
    -[CNContactViewFooterView setFrame:](v19, "setFrame:");
  }

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)updateWithContactViewConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CNUILogContactCard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_debug_impl(&dword_18AC56000, v5, OS_LOG_TYPE_DEBUG, "display updateWithContactViewConfiguration: %@", (uint8_t *)&v13, 0xCu);
  }

  -[CNContactContentDisplayViewController reloadDataIfNeeded](self, "reloadDataIfNeeded");
  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateForShowingNavBar:", objc_msgSend(v7, "layoutPositionallyAfterNavBar"));

  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController mutableContact](self, "mutableContact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithNewContact:", v9);

  v10 = -[CNContactContentDisplayViewController shouldShowGemini](self, "shouldShowGemini");
  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShouldShowGemini:", v10);

  -[CNContactContentDisplayViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 0);
  v12 = -[CNContactContentDisplayViewController applyContactStyle](self, "applyContactStyle");

}

- (void)didChangeToShowTitle:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutPositionallyAfterNavBar:", v3);

  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateForShowingNavBar:", objc_msgSend(v6, "layoutPositionallyAfterNavBar"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[CNContactContentDisplayViewController _currentGroups](self, "_currentGroups", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = v5
     + -[CNContactContentDisplayViewController hasTableViewHeaderFirstSection](self, "hasTableViewHeaderFirstSection");

  return v6;
}

- (BOOL)isStandardGroup:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
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

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v6;
  void *v8;
  void *v9;
  int64_t v10;

  v6 = -[CNContactContentDisplayViewController hasTableViewHeaderFirstSection](self, "hasTableViewHeaderFirstSection", a3);
  if (!a4 && v6)
    return 1;
  -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentDisplayViewController isStandardGroup:](self, "isStandardGroup:", v8))
    objc_msgSend(v8, "displayItems");
  else
    objc_msgSend(v8, "actionItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v13;

  v6 = a4;
  if (-[CNContactContentDisplayViewController isTableViewHeaderFirstSectionIndexPath:](self, "isTableViewHeaderFirstSectionIndexPath:", v6))
  {
    -[CNContactContentDisplayViewController tableViewHeaderFirstSectionCell](self, "tableViewHeaderFirstSectionCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[CNContactContentDisplayViewController _indexPathIsActionItem:](self, "_indexPathIsActionItem:", v6))
    {
      -[CNContactContentDisplayViewController _cellForIndexPath:](self, "_cellForIndexPath:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", objc_msgSend(v6, "section"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CNContactContentDisplayViewController isStandardGroup:](self, "isStandardGroup:", v8))
      {
        -[CNContactContentDisplayViewController _cellForIndexPath:](self, "_cellForIndexPath:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    -[CNContactContentDisplayViewController _updateLabelWidthForCell:](self, "_updateLabelWidthForCell:", v7);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNContactContentDisplayViewController prepareCell:](self, "prepareCell:", v7);
  }
  -[CNContactContentDisplayViewController environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "runningInContactsAppOniPad");

  if (v10)
  {
    +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor](CNUIColorRepository, "contactCardBackgroundiPadOverwriteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v11);

  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactContentDisplayViewController.m"), 1890, CFSTR("We have no cell to return!"));

  }
  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  double v10;
  double v11;

  v6 = a3;
  v7 = objc_msgSend(a4, "section");
  -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNContactContentDisplayViewController sectionOfGroup:](self, "sectionOfGroup:", v8);

  if (v7 == v9)
  {
    v10 = 150.0;
  }
  else
  {
    objc_msgSend(v6, "estimatedRowHeight");
    v10 = v11;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  objc_msgSend(a3, "rowHeight");
  return result;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v7 = a4;
  if (-[CNContactContentDisplayViewController isTableViewHeaderFirstSectionIndexPath:](self, "isTableViewHeaderFirstSectionIndexPath:", a5))
  {
    -[CNContactContentDisplayViewController personHeaderViewController](self, "personHeaderViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didMoveToParentViewController:", self);

  }
  objc_opt_class();
  v12 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v12;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    -[CNContactContentDisplayViewController environment](self, "environment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShowSeparator:", objc_msgSend(v11, "runningInContactsAppOniPad"));

  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  if (-[CNContactContentDisplayViewController isTableViewHeaderFirstSectionIndexPath:](self, "isTableViewHeaderFirstSectionIndexPath:", a5, a4))
  {
    -[CNContactContentDisplayViewController removeFirstSectionHeaderViewControllerFromHierarchy](self, "removeFirstSectionHeaderViewControllerFromHierarchy");
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  BOOL v8;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = !v7 || (objc_msgSend(v7, "forceSuggested") & 1) == 0 && objc_msgSend(v7, "allowsCellSelection");
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
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
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (!-[CNContactContentDisplayViewController isTableViewHeaderFirstSectionIndexPath:](self, "isTableViewHeaderFirstSectionIndexPath:", v6))
  {
    objc_msgSend(v19, "cellForRowAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CNContactContentDisplayViewController _indexPathIsActionItem:](self, "_indexPathIsActionItem:", v6))
    {
      -[CNContactContentDisplayViewController _itemAtIndexPath:](self, "_itemAtIndexPath:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "actions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "performActionWithSender:", v7);
      objc_msgSend(v19, "indexPathForSelectedRow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "deselectRowAtIndexPath:animated:", v11, 1);

    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((objc_msgSend(v7, "shouldPerformDefaultAction") & 1) != 0)
      {
        v12 = 1;
      }
      else
      {
        -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v13, "allowsPropertyActions");

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "isSuggested") & 1) == 0)
      {
        -[CNContactContentDisplayViewController _itemAtIndexPath:](self, "_itemAtIndexPath:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "contact");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "property");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "labeledValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[CNContactContentDisplayViewController contactDisplayViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:](self, "contactDisplayViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", self, v15, v16, v18);

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[CNContactContentDisplayViewController _pickName](self, "_pickName");
      if (v12)
        objc_msgSend(v7, "performDefaultAction");
      objc_msgSend(v19, "deselectRowAtIndexPath:animated:", v6, 1);
    }

  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  int isKindOfClass;
  void *v9;
  int v10;
  double v11;
  BOOL v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  double v17;
  void *v18;

  -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "usesInsetPlatterStyle");

  v11 = 0.0;
  if (v10)
    v12 = (v10 & isKindOfClass) == 0;
  else
    v12 = 0;
  if (!v12)
  {
    if (((v7 != 0) & isKindOfClass) == 1
      && (-[CNContactContentDisplayViewController contact](self, "contact"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "mainStoreLinkedContacts"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "count"),
          v14,
          v13,
          v15 >= 2))
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_scaledValueForValue:", 44.0);
      v11 = v17 + 15.0;

    }
    else
    {
      -[CNContactContentDisplayViewController cardShareLocationGroup](self, "cardShareLocationGroup");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 == v18)
      {
        v11 = 55.0;
      }
      else if (((a4 != 1) & objc_msgSend(v6, "addSpacerFromPreviousGroup")) != 0)
      {
        v11 = 55.0;
      }
      else
      {
        v11 = 0.0;
      }
    }
  }

  return v11;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  double v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[CNContactContentDisplayViewController contact](self, "contact"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "mainStoreLinkedContacts"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8,
        v10 > 1))
  {
    v11 = 44.0;
  }
  else if (objc_msgSend(v6, "numberOfSections") - 1 == a4)
  {
    -[CNContactContentDisplayViewController contact](self, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "phonemeData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v11 = 0.0;
    else
      v11 = 44.0;
  }
  else if (-[CNContactContentDisplayViewController shouldShowVerifiedFooterInSection:](self, "shouldShowVerifiedFooterInSection:", a4))
  {
    v11 = *MEMORY[0x1E0DC53D8];
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

- (BOOL)shouldShowVerifiedFooterInSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;

  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "verifiedInfoMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v8)
    {
      -[CNContactContentDisplayViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v9)
      {
        v10 = 0;
        goto LABEL_9;
      }
      if ((objc_msgSend(v7, "addSpacerFromPreviousGroup") & 1) != 0)
      {
        v10 = 0;
        v9 = v7;
        goto LABEL_9;
      }
    }
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CNContactContentDisplayViewController tableView:shouldHaveFullLengthBottomSeparatorForSection:](self, "tableView:shouldHaveFullLengthBottomSeparatorForSection:", v11, a3);

    v9 = v7;
    if (v7 == v8)
    {
LABEL_10:

      return v10;
    }
LABEL_9:

    goto LABEL_10;
  }
  return 0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  if (-[CNContactContentDisplayViewController shouldShowVerifiedFooterInSection:](self, "shouldShowVerifiedFooterInSection:", a4))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "verifiedInfoMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributedString:", v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v6 = -[CNContactContentDisplayViewController hasTableViewHeaderFirstSection](self, "hasTableViewHeaderFirstSection", a3);
  if (a4 || !v6)
  {
    -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[CNContactContentDisplayViewController contact](self, "contact"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "mainStoreLinkedContacts"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "count"),
          v10,
          v9,
          v11 >= 2))
    {
      objc_msgSend(v8, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (((a4 == 0) & -[CNContactContentDisplayViewController hasTableViewHeaderFirstSection](self, "hasTableViewHeaderFirstSection", a3)) != 0)return 0;
  else
    return &stru_1E20507A8;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int v9;
  void *v10;
  void *v11;

  -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[CNContactContentDisplayViewController contact](self, "contact"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "mainStoreLinkedContacts"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        v8 > 1))
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    -[CNContactContentDisplayViewController cardShareLocationGroup](self, "cardShareLocationGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v10)
    {
      -[CNContactContentDisplayViewController environment](self, "environment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "runningInContactsAppOniPad") ^ 1;

    }
    else
    {
      LOBYTE(v9) = objc_msgSend(v5, "addSpacerFromPreviousGroup");
    }
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  id v18;
  void *v19;
  unint64_t v20;
  void *v21;
  int v22;

  -[CNContactContentDisplayViewController environment](self, "environment", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "runningInContactsAppOniPad");

  if (v7)
  {
    -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_opt_class();
    v12 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    objc_opt_class();
    v15 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_opt_class();
    v18 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (v11)
    {
      objc_msgSend(v11, "property");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0C967B0]) ^ 1;

    }
    else if (v14)
    {
      LOBYTE(v22) = 0;
    }
    else
    {
      LOBYTE(v22) = (v17 | v20) != 0;
    }

  }
  else
  {
    LOBYTE(v22) = 0;
  }
  return v22;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  void *v5;
  void *v6;
  char v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;

  -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "runningInContactsAppOniPad");

  if ((v7 & 1) != 0)
    goto LABEL_2;
  -[CNContactContentDisplayViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentDisplayViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v11)
  {

    goto LABEL_20;
  }
  v12 = (void *)v11;
  -[CNContactContentDisplayViewController cardShareLocationGroup](self, "cardShareLocationGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v14 = v5 == v10;
  else
    v14 = 0;
  v15 = !v14;
  isKindOfClass = 1;
  if (v5 != v13 && v15)
  {
    if (v9 && objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
    {
      -[CNContactContentDisplayViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "actionItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count"))
      {
        -[CNContactContentDisplayViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "addSpacerFromPreviousGroup");

        if (!v19)
        {
LABEL_2:
          isKindOfClass = 0;
          goto LABEL_22;
        }
      }
      else
      {

      }
    }
    if ((objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      goto LABEL_22;
    }
LABEL_20:
    isKindOfClass = 1;
  }
LABEL_22:

  return isKindOfClass & 1;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v16 = a4;
  -[CNContactContentDisplayViewController tableView:willDisplayFooterView:forSection:](self, "tableView:willDisplayFooterView:forSection:", a3, v16, a5);
  objc_msgSend(v16, "_cnui_applyContactStyle");
  -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "backgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "backgroundView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v12);

LABEL_7:
      goto LABEL_8;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentDisplayViewController environment](self, "environment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "runningInContactsAppOniPad");

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFont:", v11);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  objc_msgSend(v15, "updateConstraintsIfNeeded");
  objc_msgSend(v15, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 1;
  }
  else
  {
    -[CNContactContentDisplayViewController environment](self, "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "runningInContactsAppOniPad");

  }
  if (v9 && !v6)
  {
    v11 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v6 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  -[CNContactContentDisplayViewController environment](self, "environment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "runningInContactsAppOniPad") & 1) != 0)
  {
    +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor](CNUIColorRepository, "contactCardBackgroundiPadOverwriteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v13);
  }
  else
  {
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sectionBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v14);

  }
  objc_msgSend(v15, "setBackgroundView:", v6);

}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  id v5;
  char v6;
  void *v7;

  v5 = a4;
  if (-[CNContactContentDisplayViewController isTableViewHeaderFirstSectionIndexPath:](self, "isTableViewHeaderFirstSectionIndexPath:", v5))
  {
    v6 = 0;
  }
  else
  {
    -[CNContactContentDisplayViewController _itemAtIndexPath:](self, "_itemAtIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_opt_class();
      v6 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      v6 = 0;
    }

  }
  return v6 & 1;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v8;
  unsigned int v9;

  v8 = a5;
  if (-[CNContactContentDisplayViewController isTableViewHeaderFirstSectionIndexPath:](self, "isTableViewHeaderFirstSectionIndexPath:", v8))
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v9 = (sel_copy_ == a4) & ~-[CNContactContentDisplayViewController _indexPathIsActionItem:](self, "_indexPathIsActionItem:", v8);
  }

  return v9;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v7;

  if (sel_copy_ == a4)
  {
    objc_msgSend(a3, "cellForRowAtIndexPath:", a5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, a4);

  }
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  const __CFString *v11;

  v5 = a4;
  if (-[CNContactContentDisplayViewController isTableViewHeaderFirstSectionIndexPath:](self, "isTableViewHeaderFirstSectionIndexPath:", v5))
  {
    v6 = 0;
  }
  else
  {
    -[CNContactContentDisplayViewController _itemAtIndexPath:](self, "_itemAtIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    CNContactsUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((isKindOfClass & 1) != 0)
      v11 = CFSTR("UNLINK");
    else
      v11 = CFSTR("DELETE");
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E20507A8, CFSTR("Localized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!-[CNContactContentDisplayViewController isTableViewHeaderFirstSectionIndexPath:](self, "isTableViewHeaderFirstSectionIndexPath:", v6))
  {
    objc_msgSend(v8, "cellForRowAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v7, "shouldPerformAccessoryAction"))
      objc_msgSend(v7, "performAccessoryAction");

  }
}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  CGRect v37;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "setModalPresentationStyle:", -[CNContactContentDisplayViewController _modalPresentationStyleForViewController:](self, "_modalPresentationStyleForViewController:", v7));
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalTransitionStyle:", objc_msgSend(v8, "modalTransitionStyle"));

  objc_opt_class();
  v36 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v36;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v7, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSourceView:", v10);

  objc_msgSend(v10, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController centeredSourceRect:inContactView:](self, "centeredSourceRect:inContactView:", v20, v13, v15, v17, v19);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v7, "popoverPresentationController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSourceRect:", v22, v24, v26, v28);

  objc_msgSend(v7, "popoverPresentationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPermittedArrowDirections:", 15);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v7, "presentationController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDelegate:", self);

  }
  if (!self->_disablingRotation)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "userInterfaceIdiom"))
    {
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_referenceBounds");
    if (CGRectGetHeight(v37) <= 667.0 || objc_msgSend(v7, "modalPresentationStyle"))
    {

      goto LABEL_11;
    }
    v34 = objc_msgSend(v7, "supportedInterfaceOrientations");
    v35 = -[CNContactContentDisplayViewController supportedInterfaceOrientations](self, "supportedInterfaceOrientations");

    if (v34 != v35)
    {
      -[CNContactContentDisplayViewController _beginDisablingInterfaceAutorotation](self, "_beginDisablingInterfaceAutorotation");
      self->_disablingRotation = 1;
    }
  }
LABEL_12:
  -[CNContactContentDisplayViewController setBackgroundColorIfNeededForPresentedViewController:](self, "setBackgroundColorIfNeededForPresentedViewController:", v7);
  -[CNContactContentDisplayViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (CGRect)centeredSourceRect:(CGRect)a3 inContactView:(id)a4
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_msgSend(v8, "layoutMargins");
  v10 = v9;
  objc_msgSend(v8, "layoutMargins");
  v12 = width - (v10 + v11);
  objc_msgSend(v8, "layoutMargins");
  v14 = v13;

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionContentInset");
  v17 = x + v14 - v16;

  v18 = v17;
  v19 = y;
  v20 = v12;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)shouldPresentFullscreen:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[CNContactContentDisplayViewController setIsPresentingFullscreenForOutOfProcess:](self, "setIsPresentingFullscreenForOutOfProcess:");
  -[CNContactContentDisplayViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNContactContentDisplayViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactDisplayViewController:isPresentingFullscreen:", self, v3);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  _QWORD v15[5];
  id v16;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNContactContentDisplayViewController;
  -[CNContactContentDisplayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[CNContactContentDisplayViewController presentedViewController](self, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "popoverPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v12)
    {
      -[CNContactContentDisplayViewController presentedViewController](self, "presentedViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __92__CNContactContentDisplayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
        v15[3] = &unk_1E204ED70;
        v15[4] = self;
        v16 = v10;
        objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v15);

      }
    }
  }

}

- (void)updateOutOfProcessFullscreenPresentationIfNeeded
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;
  void *v7;
  char v8;
  id v9;

  if (-[CNContactContentDisplayViewController isOutOfProcess](self, "isOutOfProcess"))
  {
    if (-[CNContactContentDisplayViewController isPresentingModalViewController](self, "isPresentingModalViewController"))
    {
      -[CNContactContentDisplayViewController presentedViewController](self, "presentedViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        if (-[CNContactContentDisplayViewController isPresentingFullscreenForOutOfProcess](self, "isPresentingFullscreenForOutOfProcess"))
        {
          -[CNContactContentDisplayViewController delegate](self, "delegate");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_opt_respondsToSelector();

          if ((v6 & 1) != 0)
          {
            -[CNContactContentDisplayViewController delegate](self, "delegate");
            v9 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "contactDisplayViewControllerWillPresentFullscreen:", self);
LABEL_10:

            return;
          }
        }
        if (!-[CNContactContentDisplayViewController isPresentingFullscreenForOutOfProcess](self, "isPresentingFullscreenForOutOfProcess"))
        {
          -[CNContactContentDisplayViewController delegate](self, "delegate");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_opt_respondsToSelector();

          if ((v8 & 1) != 0)
          {
            -[CNContactContentDisplayViewController delegate](self, "delegate");
            v9 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "contactDisplayViewControllerWillDismissFullscreen:", self);
            goto LABEL_10;
          }
        }
      }
    }
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && CNUIIsDDActionsService())
    return -1;
  else
    return -2;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  if (a4 != 5)
  {
    if (-[CNContactContentDisplayViewController isOutOfProcess](self, "isOutOfProcess"))
    {
      -[CNContactContentDisplayViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        objc_msgSend(v14, "presentedViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          -[CNContactContentDisplayViewController setIsPresentingFullscreenForOutOfProcess:](self, "setIsPresentingFullscreenForOutOfProcess:", 1);
          -[CNContactContentDisplayViewController delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "contactDisplayViewControllerWillPresentFullscreen:", self);

        }
      }
    }
  }

}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;
  char v5;
  id v6;

  if (-[CNContactContentDisplayViewController isOutOfProcess](self, "isOutOfProcess", a3))
  {
    -[CNContactContentDisplayViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CNContactContentDisplayViewController setIsPresentingFullscreenForOutOfProcess:](self, "setIsPresentingFullscreenForOutOfProcess:", 0);
      -[CNContactContentDisplayViewController delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contactDisplayViewControllerWillDismissFullscreen:", self);

    }
  }
}

- (int64_t)_modalPresentationStyleForViewController:(id)a3
{
  void *v3;
  id v5;
  int64_t v6;
  void *v7;
  char isKindOfClass;
  char v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;

  v5 = a3;
  if (NSClassFromString(CFSTR("QLPreviewController")) && (objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_27;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v5, "modalPresentationStyle"))
    goto LABEL_27;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "modalPresentationStyle");
    goto LABEL_28;
  }
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = 7;
    goto LABEL_28;
  }
  getSLComposeViewControllerClass_55709();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 5;
    goto LABEL_28;
  }
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v5, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

LABEL_17:
      if (-[UIViewController ab_isInPopover](self, "ab_isInPopover"))
      {
        v6 = 2;
        goto LABEL_28;
      }
      if (-[CNContactContentDisplayViewController isOutOfProcess](self, "isOutOfProcess") || CNUIIsDDActionsService())
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "userInterfaceIdiom");

        if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        {
LABEL_27:
          v6 = 0;
          goto LABEL_28;
        }
      }
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "shouldPresentInCurrentContext") & 1) != 0)
      {
        v6 = 3;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "userInterfaceIdiom");

        if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          v6 = 2;
        else
          v6 = -2;
      }
LABEL_38:

      goto LABEL_28;
    }
  }
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();
  if ((v9 & 1) != 0)
  {

  }
  if ((v10 & 1) != 0)
    goto LABEL_17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "viewControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v13 = objc_opt_isKindOfClass();

    if ((v13 & 1) != 0)
    {
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "shouldPresentInCurrentContext"))
        v6 = 6;
      else
        v6 = -2;
      goto LABEL_38;
    }
  }
  if (-[UIViewController ab_isInPopover](self, "ab_isInPopover")
    || -[UIViewController ab_isInSheet](self, "ab_isInSheet"))
  {
LABEL_40:
    v6 = 3;
    goto LABEL_28;
  }
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "shouldPresentInCurrentContext"))
  {

    goto LABEL_40;
  }
  v21 = CNUIIsDDActionsService();

  if (v21)
    goto LABEL_40;
  if (_CFMZEnabled())
    v6 = 3;
  else
    v6 = 7;
LABEL_28:

  return v6;
}

- (void)setBackgroundColorIfNeededForPresentedViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    v10 = v9 ^ 1;
  }
  else
  {
    v10 = 1;
  }

  -[CNContactContentDisplayViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if ((v10 & 1) == 0 && (v15 & 1) == 0)
  {
    -[CNContactContentDisplayViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v18);

  }
}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
  -[CNContactContentDisplayViewController sender:dismissViewController:completionHandler:](self, "sender:dismissViewController:completionHandler:", a3, a4, 0);
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v7 = a4;
  v8 = a5;
  if (-[CNContactContentDisplayViewController isOutOfProcess](self, "isOutOfProcess"))
  {
    -[CNContactContentDisplayViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[CNContactContentDisplayViewController setIsPresentingFullscreenForOutOfProcess:](self, "setIsPresentingFullscreenForOutOfProcess:", 0);
      -[CNContactContentDisplayViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contactDisplayViewControllerWillDismissFullscreen:", self);

    }
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__CNContactContentDisplayViewController_sender_dismissViewController_completionHandler___block_invoke;
  v13[3] = &unk_1E204F9B0;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v13);

}

- (BOOL)isPresentingModalViewController
{
  void *v2;
  BOOL v3;

  -[CNContactContentDisplayViewController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)viewController:(id)a3 presentationControllerWillDismiss:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[CNContactContentDisplayViewController presentedViewController](self, "presentedViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
    -[CNContactContentDisplayViewController presentationControllerWillDismiss:](self, "presentationControllerWillDismiss:", v8);

}

- (BOOL)contactInlineActionsViewController:(id)a3 shouldPerformActionOfType:(id)a4 withContactProperty:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a5;
  objc_msgSend(v6, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[CNContactContentDisplayViewController contactDisplayViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:](self, "contactDisplayViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", self, v7, v8, v9);
  return (char)self;
}

- (void)contactInlineActionsViewControllerWillPresentDisambiguationUI:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNContactContentDisplayViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactContentDisplayViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactDisplayViewControllerWillPresentDisambiguationUI:", self);

  }
}

- (void)contactInlineActionsViewControllerDidDismissDisambiguationUI:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNContactContentDisplayViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactContentDisplayViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactDisplayViewControllerDidDismissDisambiguationUI:", self);

  }
}

- (void)action:(id)a3 prepareChildContactViewController:(id)a4 sender:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  -[CNContactContentDisplayViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contactDisplayViewController:prepareChildContactViewController:forAction:", self, v7, v8);

}

- (void)action:(id)a3 presentViewController:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a5;
  v9 = a4;
  -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createNewContactAction");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v23;
  if (v11 != v23)
  {
    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addToExistingContactAction");
    v14 = objc_claimAutoreleasedReturnValue();
    if ((id)v14 != v23)
    {
      v15 = (void *)v14;
      -[CNContactContentDisplayViewController updateExistingContactAction](self, "updateExistingContactAction");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16 != v23)
        goto LABEL_10;
      goto LABEL_7;
    }

    v12 = v11;
  }

LABEL_7:
  -[CNContactContentDisplayViewController delegate](self, "delegate");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[CNContactContentDisplayViewController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[CNContactContentDisplayViewController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contactDisplayViewControllerIsPresentingEditingController:", self);

    }
  }
LABEL_10:
  -[CNContactContentDisplayViewController presentingDelegate](self, "presentingDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sender:presentViewController:", v8, v9);

}

- (void)action:(id)a3 dismissViewController:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a5;
  v9 = a4;
  -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createNewContactAction");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v23;
  if (v11 != v23)
  {
    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addToExistingContactAction");
    v14 = objc_claimAutoreleasedReturnValue();
    if ((id)v14 != v23)
    {
      v15 = (void *)v14;
      -[CNContactContentDisplayViewController updateExistingContactAction](self, "updateExistingContactAction");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16 != v23)
        goto LABEL_10;
      goto LABEL_7;
    }

    v12 = v11;
  }

LABEL_7:
  -[CNContactContentDisplayViewController delegate](self, "delegate");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[CNContactContentDisplayViewController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[CNContactContentDisplayViewController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contactDisplayViewControllerIsDismissingEditingController:", self);

    }
  }
LABEL_10:
  -[CNContactContentDisplayViewController presentingDelegate](self, "presentingDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sender:dismissViewController:", v8, v9);

}

- (void)action:(id)a3 pushViewController:(id)a4 sender:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[CNContactContentDisplayViewController setBackgroundColorIfNeededForPresentedViewController:](self, "setBackgroundColorIfNeededForPresentedViewController:", v6);
  -[CNContactContentDisplayViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prompt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrompt:", v8);

  -[CNContactContentDisplayViewController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewController:animated:", v6, 1);

}

- (void)actionDidUpdate:(id)a3
{
  id v4;
  void *v5;
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
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFavoriteAction");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "target");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addFavoriteAction");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v15)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_10;
        }
      }

      -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addFavoriteAction");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "canPerformAction");

      if ((v26 & 1) != 0)
        goto LABEL_15;
      -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "target");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeActionWithTarget:selector:", v20, objc_msgSend(v4, "selector"));
      goto LABEL_14;
    }
LABEL_10:

    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addFavoriteAction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "canPerformAction");

    if (v18)
    {
      -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addFavoriteAction");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      CNContactsUIBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_ADD_TO_FAVORITES"), &stru_1E20507A8, CFSTR("Localized"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAction:withTitle:", v21, v23);

LABEL_14:
      -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController reloadCardGroup:](self, "reloadCardGroup:", v27);

    }
  }
LABEL_15:

}

- (void)actionDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  CNContactContentDisplayViewController *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  dispatch_time_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t);
  void *v56;
  id v57;
  id v58;

  v4 = a3;
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForSelectedRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v7, 1);

  -[CNContactContentDisplayViewController ignoreContactAction](self, "ignoreContactAction");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    -[CNContactContentDisplayViewController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[CNContactContentDisplayViewController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController contact](self, "contact");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "contactDisplayViewController:didDeleteContact:", self, v21);
LABEL_10:

    }
LABEL_11:
    -[CNContactContentDisplayViewController navigationController](self, "navigationController");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v15, "popViewControllerAnimated:", 1);
LABEL_20:

    goto LABEL_21;
  }
  -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addFavoriteAction");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 == v4)
  {
    objc_msgSend(v11, "addFavoriteAction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "canPerformAction");

    if ((v24 & 1) == 0)
    {
      -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CNContactsUIBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_ADD_TO_FAVORITES"), &stru_1E20507A8, CFSTR("Localized"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeActionWithTitle:", v27);

    }
    v28 = self;
    v29 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v11, "createNewContactAction");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 == v4)
  {
    objc_msgSend(v14, "createNewContactAction");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "createdContact");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController createdNewContact:](self, "createdNewContact:", v31);
    goto LABEL_18;
  }
  objc_msgSend(v14, "addToExistingContactAction");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v4)
  {
    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addToExistingContactAction");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "chosenContact");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController updatedExistingContact:](self, "updatedExistingContact:", v31);
    goto LABEL_18;
  }
  -[CNContactContentDisplayViewController updateExistingContactAction](self, "updateExistingContactAction");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 == v4)
  {
    -[CNContactContentDisplayViewController updateExistingContactAction](self, "updateExistingContactAction");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "existingContact");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController updatedExistingContact:](self, "updatedExistingContact:", v30);
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[CNContactContentDisplayViewController blockAction](self, "blockAction");
    v32 = (id)objc_claimAutoreleasedReturnValue();

    if (v32 == v4)
    {
      -[CNContactContentDisplayViewController setShouldIgnoreBlockListChange:](self, "setShouldIgnoreBlockListChange:", 1);
      -[CNContactContentDisplayViewController _setupContactBlockingActionPreservingChanges:withUpdate:](self, "_setupContactBlockingActionPreservingChanges:withUpdate:", 1, 1);
      goto LABEL_21;
    }
    -[CNContactContentDisplayViewController blockReportAction](self, "blockReportAction");
    v33 = (id)objc_claimAutoreleasedReturnValue();

    if (v33 == v4)
    {
      -[CNContactContentDisplayViewController setShouldIgnoreBlockListChange:](self, "setShouldIgnoreBlockListChange:", 1);
      -[CNContactContentDisplayViewController _setupContactBlockingReportingActionPreservingChanges:withUpdate:](self, "_setupContactBlockingReportingActionPreservingChanges:withUpdate:", 1, 1);
      -[CNContactContentDisplayViewController delegate](self, "delegate");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController contact](self, "contact");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "didTapBlockAndReportForContact:", v30);
      goto LABEL_19;
    }
    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "shareWithFamilyAction");
    v35 = (id)objc_claimAutoreleasedReturnValue();

    if (v35 == v4)
    {
      -[CNContactContentDisplayViewController updateContact:](self, "updateContact:", v4);
      goto LABEL_21;
    }
    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stopSharingWithFamilyAction");
    v37 = (id)objc_claimAutoreleasedReturnValue();

    if (v37 == v4)
    {
      -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stopSharingWithFamilyAction");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "title");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "removeActionWithTitle:", v48);

      -[CNContactContentDisplayViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
      -[CNContactContentDisplayViewController delegate](self, "delegate");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contactDisplayViewControllerDidExecuteDeleteFromDowntimeWhitelistAction:", self);
      goto LABEL_20;
    }
    -[CNContactContentDisplayViewController suggestedContactAction](self, "suggestedContactAction");
    v38 = (id)objc_claimAutoreleasedReturnValue();

    if (v38 != v4)
    {
      -[CNContactContentDisplayViewController clearRecentsDataAction](self, "clearRecentsDataAction");
      v39 = (id)objc_claimAutoreleasedReturnValue();

      if (v39 == v4)
      {
        -[CNContactContentDisplayViewController delegate](self, "delegate");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "contactDisplayViewControllerDidExecuteClearRecentsDataAction:", self);
        goto LABEL_20;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v4;
        objc_msgSend(v15, "propertyItem");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "group");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = objc_msgSend(v15, "selectedChoice");
        if (v41 == 2)
        {
          objc_msgSend(v15, "reject");
          objc_msgSend(v30, "reloadDataPreservingChanges:", 0);
          goto LABEL_19;
        }
        if (v41 != 1)
        {
LABEL_19:

          goto LABEL_20;
        }
        objc_msgSend(v15, "propertyItem");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentDisplayViewController indexPathOfDisplayedPropertyItem:](self, "indexPathOfDisplayedPropertyItem:", v42);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNContactContentDisplayViewController contactView](self, "contactView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "selectRowAtIndexPath:animated:scrollPosition:", v31, 0, 0);

        v44 = dispatch_time(0, 500000000);
        v53 = MEMORY[0x1E0C809B0];
        v54 = 3221225472;
        v55 = __57__CNContactContentDisplayViewController_actionDidFinish___block_invoke;
        v56 = &unk_1E2050400;
        v57 = v15;
        v58 = v30;
        dispatch_after(v44, MEMORY[0x1E0C80D38], &v53);

LABEL_18:
        goto LABEL_19;
      }
      -[CNContactContentDisplayViewController selectContainersAction](self, "selectContainersAction");
      v52 = (id)objc_claimAutoreleasedReturnValue();

      if (v52 != v4)
        goto LABEL_21;
      v28 = self;
      v29 = 1;
LABEL_15:
      -[CNContactContentDisplayViewController reloadDataPreservingChanges:](v28, "reloadDataPreservingChanges:", v29);
      goto LABEL_21;
    }
    -[CNContactContentDisplayViewController delegate](self, "delegate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_opt_respondsToSelector();

    if ((v50 & 1) != 0)
    {
      -[CNContactContentDisplayViewController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController suggestedContactAction](self, "suggestedContactAction");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contact");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "contactDisplayViewController:didDeleteContact:", self, v51);

      goto LABEL_10;
    }
    goto LABEL_11;
  }
  -[CNContactContentDisplayViewController reloadUnifiedContact](self, "reloadUnifiedContact");
LABEL_21:
  -[CNContactContentDisplayViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 1, v53, v54, v55, v56);

}

- (void)actionWasCanceled:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CNContactContentDisplayViewController contactView](self, "contactView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForSelectedRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, 1);

}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewLabel:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  id v15;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "updateLabeledValueWithLabel:", a5);
  objc_msgSend(v9, "updateWithPropertyItem:", v8);

  objc_msgSend(v8, "group");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentDisplayViewController _updateLabelWidthForCellsInGroup:reset:](self, "_updateLabelWidthForCellsInGroup:reset:", v10, 1);
  -[CNContactContentDisplayViewController contactNavigationItemUpdater](self, "contactNavigationItemUpdater");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "allowsEditing");
  v13 = -[CNContactContentDisplayViewController mode](self, "mode");
  -[CNContactContentDisplayViewController editAuthorizationManager](self, "editAuthorizationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateDisplayDoneButtonForController:allowsEditing:viewMode:editRequiresAuthorization:", self, v12, v13, objc_msgSend(v14, "shouldPromptForPasscodeAuthorization"));

}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewValue:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  v8 = a4;
  objc_msgSend(v8, "updateLabeledValueWithValue:", a5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v24, "updateWithPropertyItem:", v8);
  objc_msgSend(v8, "group");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController _updateLabelWidthForCellsInGroup:reset:](self, "_updateLabelWidthForCellsInGroup:reset:", v9, 1);

  objc_msgSend(v8, "property");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0C96680];
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C96680]))
  {

    v12 = *MEMORY[0x1E0C96888];
LABEL_6:
    -[CNContactContentDisplayViewController propertyGroups](self, "propertyGroups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController _validateGroup:](self, "_validateGroup:", v16);

    -[CNContactContentDisplayViewController propertyGroups](self, "propertyGroups");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController _validateGroup:](self, "_validateGroup:", v18);

    goto LABEL_7;
  }
  objc_msgSend(v8, "property");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0C96888];
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C96888]);

  if (v14)
    goto LABEL_6;
LABEL_7:
  -[CNContactContentDisplayViewController contactNavigationItemUpdater](self, "contactNavigationItemUpdater");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "allowsEditing");
  v22 = -[CNContactContentDisplayViewController mode](self, "mode");
  -[CNContactContentDisplayViewController editAuthorizationManager](self, "editAuthorizationManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateDisplayDoneButtonForController:allowsEditing:viewMode:editRequiresAuthorization:", self, v21, v22, objc_msgSend(v23, "shouldPromptForPasscodeAuthorization"));

}

- (void)propertyCell:(id)a3 performActionForItem:(id)a4 withTransportType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CNPropertySuggestionAction *v15;
  void *v16;
  CNPropertySuggestionAction *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  CNContactContentDisplayViewController *v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;

  v8 = a3;
  v9 = a4;
  switch(a5)
  {
    case 1:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
LABEL_6:
      -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "faceTimeAction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setType:", a5);

      -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "faceTimeAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      goto LABEL_6;
    case 2:
      -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sendMessageAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v14 = v11;
      objc_msgSend(v11, "performActionForItem:sender:", v9, v8);
LABEL_10:

      goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "linkedCardsAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addLinkedCardAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "performActionWithSender:", v8);
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "isSuggested"))
  {
    v15 = [CNPropertySuggestionAction alloc];
    -[CNContactContentDisplayViewController contact](self, "contact");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CNPropertyAction initWithContact:propertyItem:](v15, "initWithContact:propertyItem:", v16, v9);

    -[CNContactAction setDelegate:](v17, "setDelegate:", self);
    -[CNPropertySuggestionAction performActionForItem:sender:](v17, "performActionForItem:sender:", v9, v8);
  }
  else
  {
    if (a5 != 7)
    {
      +[CNPropertyAction performDefaultActionForItem:sender:](CNPropertyAction, "performDefaultActionForItem:sender:", v9, v8);
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v17 = (CNPropertySuggestionAction *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_TTY_CALL"), &stru_1E20507A8, CFSTR("Localized"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __93__CNContactContentDisplayViewController_propertyCell_performActionForItem_withTransportType___block_invoke;
    v40[3] = &unk_1E204F9D8;
    v40[4] = self;
    v21 = v9;
    v41 = v21;
    v22 = v8;
    v42 = v22;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, v40);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySuggestionAction addAction:](v17, "addAction:", v23);

    v24 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_TTY_RELAY_CALL"), &stru_1E20507A8, CFSTR("Localized"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __93__CNContactContentDisplayViewController_propertyCell_performActionForItem_withTransportType___block_invoke_2;
    v36 = &unk_1E204F9D8;
    v37 = self;
    v38 = v21;
    v27 = v22;
    v39 = v27;
    objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 0, &v33);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySuggestionAction addAction:](v17, "addAction:", v28, v33, v34, v35, v36, v37);

    v29 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "actionWithTitle:style:handler:", v31, 1, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySuggestionAction addAction:](v17, "addAction:", v32);

    -[CNContactContentDisplayViewController sender:presentViewController:](self, "sender:presentViewController:", v27, v17);
  }

LABEL_11:
}

- (void)propertyCell:(id)a3 didDeleteLabel:(id)a4 forGroup:(id)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  id obj;
  uint64_t v23;
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v25 = a5;
  objc_msgSend(v25, "itemsUsingLabel:", a4);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v26)
  {
    v23 = *(_QWORD *)v32;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v6);
        objc_msgSend(v25, "nextAvailableLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updateLabeledValueWithLabel:", v8);
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        -[CNContactContentDisplayViewController contactView](self, "contactView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "visibleCells");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v28;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v28 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v14);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v15, "propertyItem");
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16 == v7)
                  objc_msgSend(v15, "updateWithPropertyItem:", v7);
              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v12);
        }

        ++v6;
      }
      while (v6 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v26);
  }
  -[CNContactContentDisplayViewController _updateLabelWidthForCellsInGroup:reset:](self, "_updateLabelWidthForCellsInGroup:reset:", v25, 1);
  -[CNContactContentDisplayViewController contactNavigationItemUpdater](self, "contactNavigationItemUpdater");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "allowsEditing");
  v20 = -[CNContactContentDisplayViewController mode](self, "mode");
  -[CNContactContentDisplayViewController editAuthorizationManager](self, "editAuthorizationManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateDisplayDoneButtonForController:allowsEditing:viewMode:editRequiresAuthorization:", self, v19, v20, objc_msgSend(v21, "shouldPromptForPasscodeAuthorization"));

}

- (void)propertyCellDidChangeLayout:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForCell:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v6, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("needsHeightCalculation"));
    objc_msgSend(v4, "_heightForRowAtIndexPath:", v5);
    objc_msgSend(v4, "_setHeight:forRowAtIndexPath:", v5);
  }

}

- (id)_phoneticNameForValue:(id)a3 currentPhoneticName:(id)a4 property:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  const __CFString *v14;
  int v15;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "cnui_stringByTransliteratingToPhoneticCharactersForProperty:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cn_trimmedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_trimmedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v10, "isEqualToString:", v11);
  v13 = objc_msgSend(v7, "length");

  if (v13)
  {
    if ((v12 & 1) != 0)
    {
      v14 = &stru_1E20507A8;
LABEL_9:

      v9 = (void *)v14;
    }
  }
  else
  {
    if (objc_msgSend(v9, "length"))
      v15 = v12;
    else
      v15 = 1;
    if (v15 == 1)
    {
      v14 = 0;
      goto LABEL_9;
    }
  }
  return v9;
}

- (void)headerPhotoDidUpdate
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  id v7;

  -[CNContactContentDisplayViewController contactNavigationItemUpdater](self, "contactNavigationItemUpdater");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsEditing");
  v5 = -[CNContactContentDisplayViewController mode](self, "mode");
  -[CNContactContentDisplayViewController editAuthorizationManager](self, "editAuthorizationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateDisplayDoneButtonForController:allowsEditing:viewMode:editRequiresAuthorization:", self, v4, v5, objc_msgSend(v6, "shouldPromptForPasscodeAuthorization"));

}

- (void)headerViewDidPickPreferredChannel:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[CNContactContentDisplayViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v13);

  if ((v6 & 1) == 0)
  {
    -[CNContactContentDisplayViewController contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setPreferredChannel:", v13);
    v9 = objc_alloc_init(MEMORY[0x1E0C973D0]);
    objc_msgSend(v9, "setIgnoresGuardianRestrictions:", 1);
    objc_msgSend(v9, "setIgnoresContactProviderRestrictions:", 1);
    -[CNContactContentDisplayViewController issuedSaveRequestIdentifiers](self, "issuedSaveRequestIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "saveRequestIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    objc_msgSend(v9, "updateContact:", v8);
    -[CNContactContentDisplayViewController contactStore](self, "contactStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "executeSaveRequest:error:", v9, 0);

    -[CNContactContentDisplayViewController setContact:](self, "setContact:", v8);
    -[CNContactContentDisplayViewController requestFavoritesUpdateWithGemini](self, "requestFavoritesUpdateWithGemini");
    -[CNContactContentDisplayViewController updateInsetsIfNeeded](self, "updateInsetsIfNeeded");

  }
}

- (void)requestFavoritesUpdateWithGemini
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;

  -[CNContactContentDisplayViewController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inProcessFavorites");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entriesForContact:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.contacts.clientDidDisplayFavorites"), 0, 0, 0);
  }
}

- (BOOL)isNicknameProhibited
{
  void *v2;
  char v3;

  -[CNContactContentDisplayViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0C967A0]);

  return v3;
}

- (void)headerViewDidChangeHeight:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CNContactContentDisplayViewController viewDidLayoutSubviews](self, "viewDidLayoutSubviews");
    -[CNContactContentDisplayViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
    -[CNContactContentDisplayViewController setupConstraints](self, "setupConstraints");
  }
}

- (void)headerViewDidTapNameLabel:(id)a3
{
  void *v4;
  int v5;

  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsNamePicking");

  if (v5)
    -[CNContactContentDisplayViewController _pickName](self, "_pickName");
}

- (void)_pickName
{
  -[CNContactContentDisplayViewController contactDisplayViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:](self, "contactDisplayViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", self, self->_contact, *MEMORY[0x1E0C966D0], 0);
}

- (UIEdgeInsets)headerViewSafeAreaInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[CNContactContentDisplayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[CNContactContentDisplayViewController navigationBarHeight](self, "navigationBarHeight");
  v11 = v5 - v10;
  v12 = 0.0;
  v13 = v7;
  v14 = v9;
  result.right = v14;
  result.bottom = v12;
  result.left = v13;
  result.top = v11;
  return result;
}

- (double)navigationBarHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CNContactContentDisplayViewController currentNavigationController](self, "currentNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  return v5;
}

- (BOOL)headerViewShouldCacheContactBackgroundColor:(id)a3
{
  return -[CNContactContentDisplayViewController mode](self, "mode", a3) == 1;
}

- (BOOL)shouldShowActionsForAvatarView:(id)a3
{
  return 1;
}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CNContactContentDisplayViewController contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainStoreLinkedContacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if (v8)
  {
    -[CNContactContentDisplayViewController removeLinkedContact:](self, "removeLinkedContact:", v5);
    -[CNContactContentDisplayViewController saveLinkedContactsExecutor](self, "saveLinkedContactsExecutor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController contact](self, "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "availableKeyDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController saveDescriptionForRemovingLinkedContact:keys:](self, "saveDescriptionForRemovingLinkedContact:keys:", v5, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executeSaveWithConfiguration:saveDelegate:", v13, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentDisplayViewController issuedSaveRequestIdentifiers](self, "issuedSaveRequestIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifiersOfIssuedSaveRequests");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v16);

    objc_msgSend(v14, "contact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v14, "contact");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController setContact:](self, "setContact:", v18);

    }
  }

}

- (BOOL)contactDisplayViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  char v15;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[CNContactContentDisplayViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[CNContactContentDisplayViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "contactDisplayViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", self, v9, v10, v11);

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)isSuggestedContact
{
  void *v2;
  char v3;

  -[CNContactContentDisplayViewController contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuggested");

  return v3;
}

- (void)setNeedsReload
{
  _QWORD block[5];

  self->_needsReload = 1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CNContactContentDisplayViewController_setNeedsReload__block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)setNeedsReloadLazy
{
  self->_needsReload = 1;
}

- (BOOL)reloadDataIfNeeded
{
  if (!self->_needsReload || self->_animating)
    return 0;
  -[CNContactContentDisplayViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
  return 1;
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (id)_currentTopVisibleGroupInContactView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  objc_msgSend(v4, "tableHeaderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  objc_msgSend(v4, "estimatedRowHeight");
  v11 = v9 - v10;

  if (v6 <= v11)
  {
LABEL_14:
    v18 = 0;
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v4, "visibleCells", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v14)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v19 = v17;

      if (!v19)
        goto LABEL_14;
      objc_msgSend(v19, "propertyItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "property");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController cardGroupForProperty:](self, "cardGroupForProperty:", v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v19;
    }
    else
    {
LABEL_10:
      v18 = 0;
    }

  }
  return v18;
}

- (void)_scrollContactView:(id)a3 toVisibleGroup:(id)a4
{
  id v6;
  double v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v16, "_effectiveContentInset");
  objc_msgSend(v16, "setContentOffset:", 0.0, -v7);
  if (!v6)
    goto LABEL_10;
  v8 = -[CNContactContentDisplayViewController sectionOfGroup:](self, "sectionOfGroup:", v6);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_10;
  v9 = v8;
  objc_msgSend(v6, "displayItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (uint64_t)(double)((unint64_t)objc_msgSend(v10, "count") >> 1);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v16, "numberOfSections");
  if (v13 <= objc_msgSend(v12, "section"))
    goto LABEL_9;
  v14 = objc_msgSend(v16, "numberOfRowsInSection:", objc_msgSend(v12, "section"));
  if (v14 > objc_msgSend(v12, "row"))
    goto LABEL_7;
  if (objc_msgSend(v16, "numberOfRowsInSection:", objc_msgSend(v12, "section")) < 1)
  {
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v9);
  v15 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v15;
LABEL_7:
  if (v12)
  {
    objc_msgSend(v16, "scrollToRowAtIndexPath:atScrollPosition:animated:", v12, 2, 0);
    goto LABEL_9;
  }
LABEL_10:

}

- (id)_cellIdentifierForIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v12;

  v5 = a3;
  -[CNContactContentDisplayViewController _itemAtIndexPath:](self, "_itemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "property");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactView cellIdentifierForProperty:](CNContactView, "cellIdentifierForProperty:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[CNContactView cellIdentifierForPropertyPlaceholder](CNContactView, "cellIdentifierForPropertyPlaceholder");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[CNContactView cellIdentifierForFaceTimeGroup](CNContactView, "cellIdentifierForFaceTimeGroup");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[CNContactView cellIdentifierForLinkedCardsGroup](CNContactView, "cellIdentifierForLinkedCardsGroup");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[CNContactView cellIdentifierForLinkedCardsPlaceholderGroup](CNContactView, "cellIdentifierForLinkedCardsPlaceholderGroup");
          v10 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_24;
          +[CNContactView cellIdentifierForCardNamePickingGroup](CNContactView, "cellIdentifierForCardNamePickingGroup");
          v10 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
LABEL_22:
    v9 = (void *)v10;
    if (v10)
      goto LABEL_23;
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactContentDisplayViewController.m"), 3073, CFSTR("Unknown group item: %@"), v6);

    v9 = 0;
    goto LABEL_23;
  }
  -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "useSplitActions"))
  {
    +[CNContactView cellIdentifierForSplitActions](CNContactView, "cellIdentifierForSplitActions");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v7, "displaysDropdownMenu"))
      +[CNContactView cellIdentifierForDropdownMenuActions](CNContactView, "cellIdentifierForDropdownMenuActions");
    else
      +[CNContactView cellIdentifierForActions](CNContactView, "cellIdentifierForActions");
    v8 = objc_claimAutoreleasedReturnValue();
  }
LABEL_3:
  v9 = (void *)v8;

  if (!v9)
    goto LABEL_24;
LABEL_23:

  return v9;
}

- (id)_cellForIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  void *v48;

  v5 = a3;
  -[CNContactContentDisplayViewController _itemAtIndexPath:](self, "_itemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController _cellIdentifierForIndexPath:](self, "_cellIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController noteCell](self, "noteCell");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_4;
  v9 = (void *)v8;
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_class();
  objc_msgSend(v11, "cellIdentifierForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqualToString:", v12);

  if (v13)
  {
    -[CNContactContentDisplayViewController noteCell](self, "noteCell");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController setNoteCell:](self, "setNoteCell:", 0);
  }
  else
  {
LABEL_4:
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dequeueReusableCellWithIdentifier:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactContentDisplayViewController.m"), 3093, CFSTR("We couldn’t create a cell with identifier: %@ indexPath: %@"), v7, v5);

  }
  if (-[CNContactContentDisplayViewController mode](self, "mode") == 5)
  {
    objc_opt_class();
    v16 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    if (v18)
    {
      -[CNContactContentDisplayViewController highlightedProperties](self, "highlightedProperties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count"))
      {
        -[CNContactContentDisplayViewController highlightedProperties](self, "highlightedProperties");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "contactProperty");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "containsObject:", v21);

        if (v22 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "setForceSuggested:", 1);
      }
      else
      {

      }
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "setDelegate:", self);
  objc_msgSend(v14, "setCardGroupItem:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactContentDisplayViewController presentingDelegate](self, "presentingDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPresentingDelegate:", v23);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_opt_class();
    objc_msgSend(v25, "cellIdentifierForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v7, "isEqualToString:", v26);

    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "allowsEditing");
    v30 = v29;
    if (v27)
    {
      if ((v29 & 1) != 0)
      {
        -[CNContactContentDisplayViewController editAuthorizationManager](self, "editAuthorizationManager", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAllowsEditing:", objc_msgSend(v31, "shouldPromptForPasscodeAuthorization") ^ 1);

LABEL_29:
        goto LABEL_30;
      }
      v32 = v14;
      v30 = 0;
    }
    else
    {
      v32 = v14;
    }
    objc_msgSend(v32, "setAllowsEditing:", v30);
    goto LABEL_29;
  }
LABEL_30:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsActions:", objc_msgSend(v33, "allowsActions"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v34 = v14;
    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setVIP:", objc_msgSend(v35, "isMailVIP"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v36 = v14;
    -[CNContactContentDisplayViewController emergencyNumberIdentifier](self, "emergencyNumberIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "propertyItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "contactProperty");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "identifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setEmergencyPhoneNumber:", objc_msgSend(v37, "isEqualToString:", v40));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v41 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = v41;
    else
      v42 = 0;
    v43 = v42;

    objc_opt_class();
    v44 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v45 = v44;
    else
      v45 = 0;
    v46 = v45;

    -[CNContactContentDisplayViewController setMenuProviderForCell:forActionGroupItem:](self, "setMenuProviderForCell:forActionGroupItem:", v46, v43);
  }

  return v14;
}

- (void)setMenuProviderForCell:(id)a3 forActionGroupItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_4;
  -[CNContactContentDisplayViewController cardShareLocationGroup](self, "cardShareLocationGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToArray:", v10);

  if (v11)
  {
    -[CNContactContentDisplayViewController shareLocationController](self, "shareLocationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __83__CNContactContentDisplayViewController_setMenuProviderForCell_forActionGroupItem___block_invoke;
    v23[3] = &unk_1E204FA28;
    v24 = v6;
    objc_msgSend(v12, "actionsMenuProviderWithCompletion:", v23);

  }
  else
  {
LABEL_4:
    objc_msgSend(v7, "actions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v15 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (v17)
    {
      objc_msgSend(v17, "menuProvider");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMenuProvider:", v18);
    }
    else
    {
      objc_msgSend(v15, "target");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "conformsToProtocol:", &unk_1EDFDD040))
        v20 = v19;
      else
        v20 = 0;
      v18 = v20;

      if (v18)
      {
        objc_msgSend(v6, "contextMenuInteraction");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "menuProviderForContextMenuInteraction:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setMenuProvider:", v22);

      }
    }

  }
}

- (void)geminiDataSourceDidUpdate:(id)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "geminiResult");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[CNContactContentDisplayViewController shouldShowGemini](self, "shouldShowGemini");
  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateGeminiResult:", v7);

  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldShowGemini:", v4);

}

- (BOOL)hasTableViewHeaderFirstSection
{
  void *v2;
  BOOL v3;

  -[CNContactContentDisplayViewController personHeaderViewController](self, "personHeaderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)tableViewHeaderFirstSectionCell
{
  void *v3;
  void *v4;
  CNContactContentDisplayViewController *v5;
  void *v6;
  CNContactContentDisplayViewController *v7;
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
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", CFSTR("FirstSectionCellIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("FirstSectionCellIdentifier"));
    objc_msgSend(v4, "setSelectionStyle:", 0);
    objc_msgSend(v4, "setSeparatorStyle:", 0);
    objc_msgSend(v4, "_cnui_applyContactStyle");
  }
  v5 = self;
  -[CNContactContentDisplayViewController personHeaderViewController](v5, "personHeaderViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentViewController");
  v7 = (CNContactContentDisplayViewController *)objc_claimAutoreleasedReturnValue();

  if (v7 != v5)
  {
    -[CNContactContentDisplayViewController removeFirstSectionHeaderViewControllerFromHierarchy](v5, "removeFirstSectionHeaderViewControllerFromHierarchy");
    -[CNContactContentDisplayViewController personHeaderViewController](v5, "personHeaderViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController addChildViewController:](v5, "addChildViewController:", v8);

    -[CNContactContentDisplayViewController personHeaderViewController](v5, "personHeaderViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = CFSTR("personHeaderView");
    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[personHeaderView]|"), 0, 0, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v16);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 5, 0, v13, 5, 1.0, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v17);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[personHeaderView]|"), 0, 0, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v18);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
  }

  return v4;
}

- (BOOL)isTableViewHeaderFirstSectionIndexPath:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[CNContactContentDisplayViewController hasTableViewHeaderFirstSection](self, "hasTableViewHeaderFirstSection"))
    v5 = objc_msgSend(v4, "section") == 0;
  else
    v5 = 0;

  return v5;
}

- (unint64_t)groupIndexFromTableViewSectionIndex:(unint64_t)a3
{
  return a3
       - -[CNContactContentDisplayViewController hasTableViewHeaderFirstSection](self, "hasTableViewHeaderFirstSection");
}

- (unint64_t)tableViewSectionIndexFromGroupIndex:(unint64_t)a3
{
  return a3
       + -[CNContactContentDisplayViewController hasTableViewHeaderFirstSection](self, "hasTableViewHeaderFirstSection");
}

- (void)removeFirstSectionHeaderViewControllerFromHierarchy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  -[CNContactContentDisplayViewController personHeaderViewController](self, "personHeaderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNContactContentDisplayViewController personHeaderViewController](self, "personHeaderViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willMoveToParentViewController:", 0);

    -[CNContactContentDisplayViewController personHeaderViewController](self, "personHeaderViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isViewLoaded");

    if (v7)
    {
      -[CNContactContentDisplayViewController personHeaderViewController](self, "personHeaderViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

    }
    -[CNContactContentDisplayViewController personHeaderViewController](self, "personHeaderViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromParentViewController");

  }
}

- (id)_labelWidthKeyForGroup:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = (__CFString *)a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[__CFString property](v3, "property");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C96888]))
    {

LABEL_5:
      v4 = CFSTR("alerts");
      goto LABEL_6;
    }
    -[__CFString property](v3, "property");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C96680]);

    v4 = v3;
    if (v7)
      goto LABEL_5;
  }
LABEL_6:

  return v4;
}

- (id)_labelWidthKeyForItem:(id)a3
{
  return a3;
}

- (void)_updateCachedLabelWidthsForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double Width;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  int v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  CGRect v38;
  CGRect v39;

  v4 = a3;
  objc_opt_class();
  v37 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v37;
  else
    v5 = 0;
  v6 = v5;

  if (v6 && objc_msgSend(v6, "supportsLabel"))
  {
    v7 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "labelTextAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "_scaledValueForValue:", 44.0);
      v12 = v11;
    }
    else
    {
      v12 = 44.0;
    }
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    Width = CGRectGetWidth(v38);
    if ((v7 & 1) != 0)
    {
      -[CNContactContentDisplayViewController contactView](self, "contactView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_marginWidth");
      v17 = Width - v16;

    }
    else
    {
      v17 = Width / 3.0;
    }

    if (v7)
      v17 = v17 + -53.0;
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v6, "displayLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "labelTextAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v21);

    objc_msgSend(v22, "boundingRectWithSize:options:context:", 3, 0, v17, 10000.0);
    v23 = CGRectGetWidth(v39);
    if (v12 < v23)
      v24 = 1;
    else
      v24 = v7;
    if (!v24)
      v23 = v12;
    if (v23 >= v17)
      v23 = v17;
    v25 = ceil(v23);
    objc_msgSend(v6, "group");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController _labelWidthKeyForGroup:](self, "_labelWidthKeyForGroup:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController _labelWidthKeyForItem:](self, "_labelWidthKeyForItem:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController cachedLabelWidths](self, "cachedLabelWidths");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    v32 = v31;

    if (v25 > 0.0)
    {
      -[CNContactContentDisplayViewController cachedLabelWidths](self, "cachedLabelWidths");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v34, v28);

      if (v25 > v32)
      {
        -[CNContactContentDisplayViewController cachedLabelWidths](self, "cachedLabelWidths");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKey:", v36, v27);

      }
    }

  }
}

- (void)_updateCachedLabelWidthsForGroup:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "displayItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CNContactContentDisplayViewController _updateCachedLabelWidthsForItem:](self, "_updateCachedLabelWidthsForItem:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_updateCachedLabelWidths
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController setCachedLabelWidths:](self, "setCachedLabelWidths:", v3);

  -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactContentDisplayViewController _updateCachedLabelWidthsForGroup:](self, "_updateCachedLabelWidthsForGroup:", v8);
      ++v6;
      -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    while (v6 < v10);
  }
  -[CNContactContentDisplayViewController _updateLabelWidthsForAllVisibleCells](self, "_updateLabelWidthsForAllVisibleCells");
}

- (void)_setNeedsUpdateCachedLabelWidths
{
  id v3;

  -[CNContactContentDisplayViewController setCachedLabelWidths:](self, "setCachedLabelWidths:", 0);
  if (-[CNContactContentDisplayViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNContactContentDisplayViewController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (void)_updateCachedLabelWidthsIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[CNContactContentDisplayViewController cachedLabelWidths](self, "cachedLabelWidths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CNContactContentDisplayViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 3)
      -[CNContactContentDisplayViewController _updateCachedLabelWidths](self, "_updateCachedLabelWidths");
  }
}

- (void)_updateLabelWidthForCell:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  id v15;

  v15 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v15;
    v7 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    objc_msgSend(v6, "propertyItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v7 & 1) != 0)
    {
      -[CNContactContentDisplayViewController _labelWidthKeyForItem:](self, "_labelWidthKeyForItem:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "group");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController _labelWidthKeyForGroup:](self, "_labelWidthKeyForGroup:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[CNContactContentDisplayViewController cachedLabelWidths](self, "cachedLabelWidths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    objc_msgSend(v6, "setLabelWidth:", v14);

    v5 = v15;
  }

}

- (void)_updateLabelWidthForCellsInGroup:(id)a3 reset:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a4;
  v14 = a3;
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CNContactContentDisplayViewController _labelWidthKeyForGroup:](self, "_labelWidthKeyForGroup:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController cachedLabelWidths](self, "cachedLabelWidths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v7);

  }
  -[CNContactContentDisplayViewController _updateCachedLabelWidthsForGroup:](self, "_updateCachedLabelWidthsForGroup:", v14);
  v9 = -[CNContactContentDisplayViewController sectionOfGroup:](self, "sectionOfGroup:", v14);
  objc_msgSend(v14, "displayItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v11, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController _updateLabelWidthForCell:](self, "_updateLabelWidthForCell:", v13);

      ++v11;
    }
    while (v11 < objc_msgSend(v10, "count"));
  }

}

- (void)_updateLabelWidthsForAllVisibleCells
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "visibleCells", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[CNContactContentDisplayViewController _updateLabelWidthForCell:](self, "_updateLabelWidthForCell:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  objc_msgSend(v3, "setContentOffset:", v5, v7);
  -[CNContactContentDisplayViewController adjustPreferredContentSize](self, "adjustPreferredContentSize");

}

- (id)saveDescriptionForRemovingLinkedContact:(id)a3 keys:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CNUIContactSaveConfiguration *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CNUIContactSaveConfiguration *v20;

  v5 = a4;
  -[CNContactContentDisplayViewController contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isUnified");

  if (v7)
  {
    -[CNContactContentDisplayViewController contact](self, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mainStoreLinkedContacts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C99DE8];
    -[CNContactContentDisplayViewController contact](self, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithPropertyKeys:", v5);
    objc_msgSend(v11, "arrayWithObject:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

  v13 = [CNUIContactSaveConfiguration alloc];
  -[CNContactContentDisplayViewController contact](self, "contact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController mutableContact](self, "mutableContact");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactStore](self, "contactStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "ignoresParentalRestrictions");
  -[CNContactContentDisplayViewController editAuthorizationManager](self, "editAuthorizationManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[CNUIContactSaveConfiguration initWithContact:mutableContact:editingLinkedContacts:contactStore:ignoresParentalRestrictions:saveWasAuthorized:](v13, "initWithContact:mutableContact:editingLinkedContacts:contactStore:ignoresParentalRestrictions:saveWasAuthorized:", v14, v15, v12, v16, v18, objc_msgSend(v19, "saveWasAuthorized"));

  return v20;
}

- (id)_updateContact:(id)a3 withMissingKeysFromRequiredKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "areKeysAvailable:useIgnorableKeys:findMissingKeys:", v7, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "first");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    v11 = v6;
  }
  else
  {
    objc_msgSend(v8, "second");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController setMissingRequiredKeys:](self, "setMissingRequiredKeys:", v12);

    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__55626;
    v28 = __Block_byref_object_dispose__55627;
    v29 = 0;
    v13 = objc_alloc(MEMORY[0x1E0C97210]);
    -[CNContactContentDisplayViewController missingRequiredKeys](self, "missingRequiredKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithKeysToFetch:", v14);

    v16 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v6, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateForContactsWithIdentifiers:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPredicate:", v19);

    objc_msgSend(v15, "setUnifyResults:", objc_msgSend(v6, "isUnified"));
    -[CNContactContentDisplayViewController contactStore](self, "contactStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __88__CNContactContentDisplayViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke;
    v23[3] = &unk_1E204FB18;
    v23[4] = &v24;
    objc_msgSend(v20, "enumerateContactsWithFetchRequest:error:usingBlock:", v15, 0, v23);

    v21 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v21, "overwriteStateFromContact:", v25[5]);
    objc_msgSend(v21, "freeze");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v24, 8);
  }

  return v11;
}

- (id)_removeUnauthorizedKeysFromContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNContactContentDisplayViewController missingRequiredKeys](self, "missingRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    -[CNContactContentDisplayViewController missingRequiredKeys](self, "missingRequiredKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeKeys:", v8);

    objc_msgSend(v7, "setFrozenSelfAsSnapshot");
    v4 = v7;
  }
  return v4;
}

- (void)_didCompleteWithContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[CNContactContentDisplayViewController _removeUnauthorizedKeysFromContact:](self, "_removeUnauthorizedKeysFromContact:", v4);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (self->_contact != &self->_mutableContact->super)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = objc_msgSend(v16, "copy");

        v16 = (id)v6;
      }
    }
    -[CNContactContentDisplayViewController suggestedContactAction](self, "suggestedContactAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "confirmSuggestion");

  }
  else
  {
    v16 = 0;
  }
  if (-[CNContactContentDisplayViewController mode](self, "mode") == 3)
  {
    -[CNContactContentDisplayViewController originalContacts](self, "originalContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 == 1)
    {
      if (v16)
      {
        +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentDisplayViewController originalContacts](self, "originalContacts");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logContactCreated:originalContact:", v16, v12);

      }
    }
  }
  -[CNContactContentDisplayViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[CNContactContentDisplayViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contactDisplayViewController:didCompleteWithContact:", self, v16);

  }
}

- (BOOL)saveChanges
{
  return 1;
}

- (void)updateContact:(id)a3
{
  void *v4;

  if (-[CNContactContentDisplayViewController saveChanges](self, "saveChanges", a3))
  {
    -[CNContactContentDisplayViewController mutableContact](self, "mutableContact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", v4);

  }
  else
  {
    -[CNContactContentDisplayViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", 0);
  }
  -[CNContactContentDisplayViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
}

- (void)createdNewContact:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    -[CNContactContentDisplayViewController setContact:](self, "setContact:", v4);
    -[CNContactContentDisplayViewController setMode:](self, "setMode:", 1);
    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsAddingToAddressBook:", 0);

    v4 = v6;
  }
  -[CNContactContentDisplayViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", v4);

}

- (void)updatedExistingContact:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[CNContactContentDisplayViewController contact](self, "contact");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[CNContactContentDisplayViewController setContact:](self, "setContact:", v5);
  -[CNContactContentDisplayViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", v6);

}

- (void)removeLinkedContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    -[CNContactContentDisplayViewController contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mainStoreLinkedContacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v9);

    v4 = v9;
    if (v7)
    {
      -[CNContactContentDisplayViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
      +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logContactActionType:attributes:", CNUIContactActionTypeUnlink, 0);

      v4 = v9;
    }
  }

}

- (void)reloadUnifiedContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CNContactContentDisplayViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();

  -[CNContactContentDisplayViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "linkedContacts");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8)
  {
    objc_msgSend(v4, "unifyContacts:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController setContact:](self, "setContact:", v7);

    v6 = v8;
  }

}

- (double)desiredHeightForWidth:(double)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  -[CNContactContentDisplayViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:");
  -[CNContactContentDisplayViewController reloadDataIfNeeded](self, "reloadDataIfNeeded");
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "visibleCells");

  -[CNContactContentDisplayViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

  -[CNContactContentDisplayViewController requiredSizeForVisibleTableView](self, "requiredSizeForVisibleTableView");
  v10 = v9;
  objc_msgSend(v4, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  objc_msgSend(v4, "setFrame:");

  return v10;
}

- (CGSize)requiredSizeForVisibleTableView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  CGSize result;

  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  objc_msgSend(v3, "contentInset");
  v7 = v6;
  if (-[CNContactContentDisplayViewController hasTableViewHeaderFirstSection](self, "hasTableViewHeaderFirstSection")
    && -[UIViewController ab_isInPopover](self, "ab_isInPopover"))
  {
    *(double *)&v8 = 400.0;
  }
  else
  {
    *(double *)&v8 = 0.0;
  }

  v9 = *(double *)&v8;
  v10 = v5 + v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)updateContactsViewWithBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  ++self->_animating;
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__CNContactContentDisplayViewController_updateContactsViewWithBlock_completion___block_invoke;
  v13[3] = &unk_1E204FB40;
  v14 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__CNContactContentDisplayViewController_updateContactsViewWithBlock_completion___block_invoke_2;
  v11[3] = &unk_1E204FB68;
  v11[4] = self;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBatchUpdates:completion:", v13, v11);

}

- (void)blockListDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__handleCoalescedBlockListDidChange, 0);
  -[CNContactContentDisplayViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__handleCoalescedBlockListDidChange, 0, 0.1);
}

- (void)_handleCoalescedBlockListDidChange
{
  if (-[CNContactContentDisplayViewController shouldIgnoreBlockListChange](self, "shouldIgnoreBlockListChange"))
    -[CNContactContentDisplayViewController setShouldIgnoreBlockListChange:](self, "setShouldIgnoreBlockListChange:", 0);
  else
    -[CNContactContentDisplayViewController _setupContactBlockingActionPreservingChanges:withUpdate:](self, "_setupContactBlockingActionPreservingChanges:withUpdate:", 0, 1);
}

- (void)setupActionsPreservingChanges:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CNContactActionProvider *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CNCardGroup *v16;
  void *v17;
  CNCardGroup *v18;
  CNCardGroup *cardActionsGroup;
  void *v20;
  uint64_t v21;
  CNCardGroup *v22;
  void *v23;
  CNCardGroup *v24;
  CNCardGroup *cardShareLocationGroup;
  void *v26;
  CNContactActionProvider *v27;
  void *v28;
  _BOOL4 v29;

  v29 = a3;
  v27 = [CNContactActionProvider alloc];
  -[CNContactContentDisplayViewController mutableContact](self, "mutableContact");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactViewCache](self, "contactViewCache");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "containerForContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactViewCache](self, "contactViewCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController propertyGroupsDataSource](self, "propertyGroupsDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController actionsDataSource](self, "actionsDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CNContactActionProvider initWithContact:inContainer:contactStore:propertyGroupsDataSource:actionsDataSource:capabilities:environment:](v27, "initWithContact:inContainer:contactStore:propertyGroupsDataSource:actionsDataSource:capabilities:environment:", v26, v5, v7, v8, v9, v10, v11);
  -[CNContactContentDisplayViewController setActionProvider:](self, "setActionProvider:", v12);

  -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActionDelegate:", self);

  -[CNCardGroup actions](self->_cardActionsGroup, "actions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = [CNCardGroup alloc];
    -[CNContactContentDisplayViewController mutableContact](self, "mutableContact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CNCardGroup initWithContact:](v16, "initWithContact:", v17);
    cardActionsGroup = self->_cardActionsGroup;
    self->_cardActionsGroup = v18;

  }
  -[CNCardGroup actions](self->_cardShareLocationGroup, "actions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    v22 = [CNCardGroup alloc];
    -[CNContactContentDisplayViewController mutableContact](self, "mutableContact");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[CNCardGroup initWithContact:](v22, "initWithContact:", v23);
    cardShareLocationGroup = self->_cardShareLocationGroup;
    self->_cardShareLocationGroup = v24;

  }
  -[CNContactContentDisplayViewController _retrieveActionsModelPreservingChanges:](self, "_retrieveActionsModelPreservingChanges:", v29);
  -[CNContactContentDisplayViewController _setupCardActions](self, "_setupCardActions");
  -[CNContactContentDisplayViewController _setupContactBlockingActionPreservingChanges:withUpdate:](self, "_setupContactBlockingActionPreservingChanges:withUpdate:", v29, !v29);
  -[CNContactContentDisplayViewController _setupSuggestionActions](self, "_setupSuggestionActions");
  -[CNContactContentDisplayViewController _setupAddToAddressBookActions](self, "_setupAddToAddressBookActions");
  -[CNContactContentDisplayViewController _setupCustomActions](self, "_setupCustomActions");
}

- (void)_retrieveActionsModelPreservingChanges:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  -[CNContactContentDisplayViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!a3)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0D13D88], "allActionTypes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __80__CNContactContentDisplayViewController__retrieveActionsModelPreservingChanges___block_invoke;
      v7[3] = &unk_1E204FBB8;
      v7[4] = self;
      objc_copyWeak(&v8, &location);
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_setupCardActions
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  BOOL v27;
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
  int v47;
  void *v48;
  int v49;
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
  id v62;

  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsActions");

  if (v4)
  {
    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buildStandardActions");

    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buildCommunicationLimitsActions");

    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buildStaticIdentityActions");

    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "allowsCardActions"))
    {
LABEL_26:

LABEL_27:
      -[CNContactContentDisplayViewController _clearRecentsDataAction](self, "_clearRecentsDataAction");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController setClearRecentsDataAction:](self, "setClearRecentsDataAction:", v56);

      -[CNContactContentDisplayViewController clearRecentsDataAction](self, "clearRecentsDataAction");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        -[CNContactContentDisplayViewController clearRecentsDataAction](self, "clearRecentsDataAction");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setDelegate:", self);

        -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
        v62 = (id)objc_claimAutoreleasedReturnValue();
        -[CNContactContentDisplayViewController clearRecentsDataAction](self, "clearRecentsDataAction");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        CNContactsUIBundle();
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("CLEAR_RECENTS"), &stru_1E20507A8, CFSTR("Localized"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "addAction:withTitle:", v59, v61);

      }
      return;
    }
    -[CNContactContentDisplayViewController contact](self, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSuggested");

    if ((v10 & 1) != 0)
      goto LABEL_27;
    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "allowsSendMessage"))
    {
      -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sendMessageAction");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "primaryProperty");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          goto LABEL_10;
        -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sendMessageAction");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        CNContactsUIBundle();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_TEXT"), &stru_1E20507A8, CFSTR("Localized"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addAction:withTitle:", v17, v19);

      }
    }

LABEL_10:
    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "createReminderAction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "createReminderAction");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      CNContactsUIBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CREATE_REMINDER_ACTION"), &stru_1E20507A8, CFSTR("Localized"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addAction:withTitle:", v24, v26);

    }
    v27 = -[CNContactContentDisplayViewController isHeaderViewPhotoProhibited](self, "isHeaderViewPhotoProhibited");
    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "allowsSharing") && !v27)
    {
      -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "shareContactAction");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
LABEL_17:
        -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addFavoriteAction");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addFavoriteAction");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          CNContactsUIBundle();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_ADD_TO_FAVORITES"), &stru_1E20507A8, CFSTR("Localized"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addAction:withTitle:", v39, v41);

        }
        -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "shareWithFamilyAction");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 && objc_msgSend(v8, "canPerformAction"))
        {
          -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "title");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addAction:withTitle:", v8, v44);

        }
        -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stopSharingWithFamilyAction");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "canPerformAction");

        if (v47)
        {
          -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "ignoresParentalRestrictions");

          if (v49)
          {
            -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "stopSharingWithFamilyAction");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "stopSharingWithFamilyAction");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "title");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addAction:withTitle:", v52, v55);

          }
        }
        -[CNContactContentDisplayViewController setupShareLocationActionReload:](self, "setupShareLocationActionReload:", 0);
        goto LABEL_26;
      }
      -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "shareContactAction");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      CNContactsUIBundle();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("SHARE_CONTACT_ACTION_BUTTON_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addAction:withTitle:", v32, v34);

    }
    goto LABEL_17;
  }
}

- (void)setupShareLocationActionReload:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  id location;

  if (!-[CNContactContentDisplayViewController showingMeContact](self, "showingMeContact") && !CNUIIsMessages())
  {
    -[CNContactContentDisplayViewController cardShareLocationGroup](self, "cardShareLocationGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplaysDropdownMenu:", 1);

    -[CNContactContentDisplayViewController cardShareLocationGroup](self, "cardShareLocationGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController shareLocationController](self, "shareLocationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeActionWithTarget:selector:", v7, sel_perform_);

    objc_initWeak(&location, self);
    -[CNContactContentDisplayViewController shareLocationController](self, "shareLocationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__CNContactContentDisplayViewController_setupShareLocationActionReload___block_invoke;
    v9[3] = &unk_1E204FC70;
    objc_copyWeak(&v10, &location);
    v11 = a3;
    objc_msgSend(v8, "canShareWithCompletion:", v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)_setupContactBlockingActionPreservingChanges:(BOOL)a3 withUpdate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  BOOL v7;
  void *v8;
  void *v9;
  CNContactToggleBlockCallerAction *v10;
  void *v11;
  CNContactToggleBlockCallerAction *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v4 = a4;
  v5 = a3;
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "allowsContactBlocking"))
  {
    v7 = -[CNContactContentDisplayViewController showingMeContact](self, "showingMeContact");

    if (v7)
      return;
    -[CNContactContentDisplayViewController blockAction](self, "blockAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentDisplayViewController blockAction](self, "blockAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = [CNContactToggleBlockCallerAction alloc];
      -[CNContactContentDisplayViewController contact](self, "contact");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[CNContactAction initWithContact:](v10, "initWithContact:", v11);
      -[CNContactContentDisplayViewController setBlockAction:](self, "setBlockAction:", v12);

      -[CNContactContentDisplayViewController blockAction](self, "blockAction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDelegate:", self);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_blockListDidChange_, *MEMORY[0x1E0D13278], 0);

    }
    -[CNContactContentDisplayViewController blockAction](self, "blockAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isContactBlockedPreservingChanges:", v5);

    if (v8)
    {
      CNContactsUIBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16)
        v19 = CFSTR("BLOCK_THIS_CALLER");
      else
        v19 = CFSTR("UNBLOCK_THIS_CALLER");
      objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_1E20507A8, CFSTR("Localized"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeActionWithTitle:", v20);

    }
    CNContactsUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if ((v16 & 1) != 0)
    {
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("UNBLOCK_THIS_CALLER"), &stru_1E20507A8, CFSTR("Localized"));
      v41 = (id)objc_claimAutoreleasedReturnValue();

      -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeActionWithTitle:", v41);

      +[CNUIColorRepository contactsApplicationTintColor](CNUIColorRepository, "contactsApplicationTintColor");
    }
    else
    {
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("BLOCK_THIS_CALLER"), &stru_1E20507A8, CFSTR("Localized"));
      v41 = (id)objc_claimAutoreleasedReturnValue();

      -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeActionWithTitle:", v41);

      +[CNUIColorRepository contactCardDestructiveActionTitleTextColor](CNUIColorRepository, "contactCardDestructiveActionTitleTextColor");
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController blockAction](self, "blockAction");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAction:withTitle:color:transportType:", v28, v41, v26, 0);

    if (v4)
    {
      -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[CNContactContentDisplayViewController sectionOfGroup:](self, "sectionOfGroup:", v29);

      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[CNContactContentDisplayViewController contactView](self, "contactView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "contentOffset");
        v33 = v32;
        v35 = v34;

        -[CNContactContentDisplayViewController contactView](self, "contactView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "beginUpdates");

        -[CNContactContentDisplayViewController contactView](self, "contactView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v30);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "reloadSections:withRowAnimation:", v38, 0);

        -[CNContactContentDisplayViewController contactView](self, "contactView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "endUpdates");

        -[CNContactContentDisplayViewController contactView](self, "contactView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setContentOffset:", v33, v35);

        -[CNContactContentDisplayViewController adjustPreferredContentSize](self, "adjustPreferredContentSize");
      }
    }

  }
}

- (void)_setupContactBlockingReportingActionPreservingChanges:(BOOL)a3 withUpdate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  BOOL v7;
  void *v8;
  void *v9;
  CNContactToggleBlockReportCallerAction *v10;
  void *v11;
  CNContactToggleBlockReportCallerAction *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v4 = a4;
  v5 = a3;
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "allowsContactBlockingAndReporting"))
  {
    v7 = -[CNContactContentDisplayViewController showingMeContact](self, "showingMeContact");

    if (v7)
      return;
    -[CNContactContentDisplayViewController blockReportAction](self, "blockReportAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentDisplayViewController blockReportAction](self, "blockReportAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = [CNContactToggleBlockReportCallerAction alloc];
      -[CNContactContentDisplayViewController contact](self, "contact");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[CNContactAction initWithContact:](v10, "initWithContact:", v11);
      -[CNContactContentDisplayViewController setBlockReportAction:](self, "setBlockReportAction:", v12);

      -[CNContactContentDisplayViewController blockReportAction](self, "blockReportAction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDelegate:", self);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_blockListDidChange_, *MEMORY[0x1E0D13278], 0);

    }
    -[CNContactContentDisplayViewController blockReportAction](self, "blockReportAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isContactBlockedPreservingChanges:", v5);

    if (v8)
    {
      CNContactsUIBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16)
        v19 = CFSTR("BLOCK_CALLER");
      else
        v19 = CFSTR("UNBLOCK_CALLER");
      objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_1E20507A8, CFSTR("Localized"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeActionWithTitle:", v20);

    }
    CNContactsUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if ((v16 & 1) != 0)
    {
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("UNBLOCK_CALLER"), &stru_1E20507A8, CFSTR("Localized"));
      v41 = (id)objc_claimAutoreleasedReturnValue();

      -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeActionWithTitle:", v41);

      +[CNUIColorRepository contactsApplicationTintColor](CNUIColorRepository, "contactsApplicationTintColor");
    }
    else
    {
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("BLOCK_CALLER"), &stru_1E20507A8, CFSTR("Localized"));
      v41 = (id)objc_claimAutoreleasedReturnValue();

      -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeActionWithTitle:", v41);

      +[CNUIColorRepository contactCardDestructiveActionTitleTextColor](CNUIColorRepository, "contactCardDestructiveActionTitleTextColor");
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController blockReportAction](self, "blockReportAction");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAction:withTitle:color:transportType:", v28, v41, v26, 0);

    if (v4)
    {
      -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[CNContactContentDisplayViewController sectionOfGroup:](self, "sectionOfGroup:", v29);

      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[CNContactContentDisplayViewController contactView](self, "contactView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "contentOffset");
        v33 = v32;
        v35 = v34;

        -[CNContactContentDisplayViewController contactView](self, "contactView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "beginUpdates");

        -[CNContactContentDisplayViewController contactView](self, "contactView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v30);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "reloadSections:withRowAnimation:", v38, 0);

        -[CNContactContentDisplayViewController contactView](self, "contactView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "endUpdates");

        -[CNContactContentDisplayViewController contactView](self, "contactView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setContentOffset:", v33, v35);

        -[CNContactContentDisplayViewController adjustPreferredContentSize](self, "adjustPreferredContentSize");
      }
    }

  }
}

- (void)_setupSuggestionActions
{
  void *v3;
  CNContactSuggestionAction *v4;
  void *v5;
  CNContactSuggestionAction *v6;
  void *v7;
  id v8;

  -[CNContactContentDisplayViewController originalContacts](self, "originalContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_filter:", &__block_literal_global_478);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") == 1)
  {
    v4 = [CNContactSuggestionAction alloc];
    objc_msgSend(v8, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNContactAction initWithContact:](v4, "initWithContact:", v5);
    -[CNContactContentDisplayViewController setSuggestedContactAction:](self, "setSuggestedContactAction:", v6);

    -[CNContactContentDisplayViewController suggestedContactAction](self, "suggestedContactAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

  }
  else
  {
    -[CNContactContentDisplayViewController setSuggestedContactAction:](self, "setSuggestedContactAction:", 0);
  }

}

- (void)_setupAddToAddressBookActions
{
  void *v3;
  int v4;
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
  void *v28;
  void *v29;
  id v30;

  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsAddingToAddressBook");

  if (v4)
  {
    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buildAddContactActions");

    -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createNewContactAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_CARD_CREATE_NEW_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:withTitle:", v8, v10);

    -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addToExistingContactAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_CARD_ADD_TO_EXISTING_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:withTitle:", v13, v15);

    -[CNContactContentDisplayViewController _updateExistingContactAction](self, "_updateExistingContactAction");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      -[CNContactContentDisplayViewController setUpdateExistingContactAction:](self, "setUpdateExistingContactAction:", v30);
      v16 = (void *)MEMORY[0x1E0CB3940];
      CNContactsUIBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_CARD_ADD_UPDATE_CONTACT-%@"), &stru_1E20507A8, CFSTR("Localized"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController contactFormatter](self, "contactFormatter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "existingContact");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringFromContact:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", v18, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addAction:withTitle:", v30, v22);

    }
    -[CNContactContentDisplayViewController suggestedContactAction](self, "suggestedContactAction");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController suggestedContactAction](self, "suggestedContactAction");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      CNContactsUIBundle();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_IGNORE_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNUIColorRepository contactCardDestructiveActionTitleTextColor](CNUIColorRepository, "contactCardDestructiveActionTitleTextColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addAction:withTitle:color:transportType:", v26, v28, v29, 0);

    }
  }
}

- (void)_setupCustomActions
{
  void *v3;
  char v4;
  CNEditInAppAction *v5;
  void *v6;
  void *v7;
  CNEditInAppAction *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[CNContactContentDisplayViewController allowsEditInApp](self, "allowsEditInApp"))
  {
    -[CNContactContentDisplayViewController contact](self, "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSuggested");

    if ((v4 & 1) == 0)
    {
      v5 = [CNEditInAppAction alloc];
      -[CNContactContentDisplayViewController contact](self, "contact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController activityManager](self, "activityManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CNEditInAppAction initWithContact:activityManager:](v5, "initWithContact:activityManager:", v6, v7);

      -[CNContactContentDisplayViewController cardFooterGroup](self, "cardFooterGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNEditInAppAction title](v8, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAction:withTitle:", v8, v10);

    }
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CNContactContentDisplayViewController customActions](self, "customActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        +[CNCustomCardAction groupForActionGivenPlacement:inContactContentViewController:](CNCustomCardAction, "groupForActionGivenPlacement:inContactContentViewController:", objc_msgSend(v16, "placement"), self);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "menuProvider");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v17, "setDisplaysDropdownMenu:", 1);
          objc_msgSend(v16, "title");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "menuProvider");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (id)objc_msgSend(v17, "addActionWithTitle:menuProvider:destructive:", v19, v20, objc_msgSend(v16, "isDestructive"));
        }
        else
        {
          objc_msgSend(v16, "title");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "targetActionWrapper");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (id)objc_msgSend(v17, "addActionWithTitle:target:selector:destructive:", v19, v20, sel_performActionWithSender_, objc_msgSend(v16, "isDestructive"));
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

}

- (id)_addNewFieldAction
{
  CNContactAddNewFieldAction *v3;
  void *v4;
  CNContactAddNewFieldAction *v5;
  void *v6;

  v3 = [CNContactAddNewFieldAction alloc];
  -[CNContactContentDisplayViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactAction initWithContact:](v3, "initWithContact:", v4);

  -[CNContactContentDisplayViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAddNewFieldAction setProhibitedPropertyKeys:](v5, "setProhibitedPropertyKeys:", v6);

  -[CNContactAction setDelegate:](v5, "setDelegate:", self);
  -[CNContactAddNewFieldAction setGroupPickerDelegate:](v5, "setGroupPickerDelegate:", self);
  return v5;
}

- (CNShareLocationController)shareLocationController
{
  CNShareLocationController *shareLocationController;
  CNShareLocationController *v4;
  void *v5;
  void *v6;
  CNShareLocationController *v7;
  CNShareLocationController *v8;

  shareLocationController = self->_shareLocationController;
  if (!shareLocationController)
  {
    v4 = [CNShareLocationController alloc];
    -[CNContactContentDisplayViewController environment](self, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "idsAvailabilityProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CNShareLocationController initWithIDSAvailabilityProvider:](v4, "initWithIDSAvailabilityProvider:", v6);
    v8 = self->_shareLocationController;
    self->_shareLocationController = v7;

    -[CNShareLocationController setShareLocationDelegate:](self->_shareLocationController, "setShareLocationDelegate:", self);
    shareLocationController = self->_shareLocationController;
  }
  return shareLocationController;
}

- (id)_updateExistingContactAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  CNContactUpdateExistingContactAction *v14;
  void *v15;
  CNContactUpdateExistingContactAction *v16;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[CNContactContentDisplayViewController contactFormatter](self, "contactFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0C97210]);
    -[CNContactContentDisplayViewController contactFormatter](self, "contactFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptorForRequiredKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithKeysToFetch:", v10);

    objc_msgSend(v11, "setOnlyMainStore:", 1);
    objc_msgSend(v11, "setUnifyResults:", 1);
    objc_msgSend(v11, "setPredicate:", v6);
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__55626;
    v24 = __Block_byref_object_dispose__55627;
    v25 = 0;
    -[CNContactContentDisplayViewController contactStore](self, "contactStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[4] = &v20;
    v19 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__CNContactContentDisplayViewController__updateExistingContactAction__block_invoke;
    v18[3] = &unk_1E204FB18;
    objc_msgSend(v12, "enumerateContactsWithFetchRequest:error:usingBlock:", v11, &v19, v18);
    v13 = v19;

    if (v21[5])
    {
      v14 = [CNContactUpdateExistingContactAction alloc];
      -[CNContactContentDisplayViewController contact](self, "contact");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CNContactAction initWithContact:](v14, "initWithContact:", v15);

      -[CNContactUpdateExistingContactAction setExistingContact:](v16, "setExistingContact:", v21[5]);
      -[CNContactAction setDelegate:](v16, "setDelegate:", self);
    }
    else
    {
      v16 = 0;
    }
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_clearRecentsDataAction
{
  void *v3;
  CNContactClearRecentsDataAction *v4;
  CNContactClearRecentsDataAction *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CNContactContentDisplayViewController recentsData](self, "recentsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !-[CNContactContentDisplayViewController isSuggestedContact](self, "isSuggestedContact"))
  {
    v5 = [CNContactClearRecentsDataAction alloc];
    -[CNContactContentDisplayViewController recentsData](self, "recentsData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController environment](self, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recentsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[CNContactClearRecentsDataAction initWithRecentsData:coreRecentsManager:](v5, "initWithRecentsData:coreRecentsManager:", v6, v8);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_updateAvailableTransports
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[CNContactContentDisplayViewController propertyGroupsDataSource](self, "propertyGroupsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C966A8];
  v7[0] = *MEMORY[0x1E0C967C0];
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allDisplayPropertyItemsForPropertyKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentDisplayViewController _updateAvailableTransportsForItems:](self, "_updateAvailableTransportsForItems:", v6);
}

- (void)_updateAvailableTransportsForItems:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isMessagesAppAvailable"))
    -[CNContactContentDisplayViewController _updateIMessageTransportButtonsForItems:](self, "_updateIMessageTransportButtonsForItems:", v5);
  if (objc_msgSend(v4, "isPhoneAppAvailable"))
    -[CNContactContentDisplayViewController _updatePhoneTransportButtonsForItems:](self, "_updatePhoneTransportButtonsForItems:", v5);
  if (objc_msgSend(v4, "isMailAppAvailable"))
    -[CNContactContentDisplayViewController _updateEmailTransportButtonsForItems:](self, "_updateEmailTransportButtonsForItems:", v5);
  -[CNContactContentDisplayViewController _updateTTYTransportButtonsForItems:](self, "_updateTTYTransportButtonsForItems:", v5);

}

- (void)_updateIMessageTransportButtonsForItems:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CNContactContentDisplayViewController *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[5];

  v26 = self;
  v38[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C97058];
  v38[0] = *MEMORY[0x1E0C97028];
  v38[1] = v4;
  v38[2] = *MEMORY[0x1E0C97008];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    v9 = *MEMORY[0x1E0C967C0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v11, "property", v26);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isEqualToString:", v9) & 1) != 0)
        {
          objc_msgSend(v11, "labeledValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "label");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v29, "containsObject:", v14);

          if (v15)
          {
            objc_msgSend(v11, "setAllowsIMessage:", 1);
            objc_msgSend(v28, "addObject:", v11);
          }
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v7);
  }

  objc_msgSend(v27, "removeObjectsInArray:", v28);
  if (objc_msgSend(v27, "count"))
  {
    objc_msgSend(v27, "_cn_filter:", &__block_literal_global_2_54958);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_cn_map:", &__block_literal_global_54954);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__CNContactContentDisplayViewController__updateIMessageTransportButtonsForItems___block_invoke;
    aBlock[3] = &unk_1E204FD48;
    v31 = v17;
    v32 = v27;
    v18 = v17;
    v19 = _Block_copy(aBlock);
    v20 = (void *)MEMORY[0x1E0D13D00];
    -[CNContactContentDisplayViewController environment](v26, "environment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "idsAvailabilityProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController environment](v26, "environment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "defaultSchedulerProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "validateHandlesForIMessage:availabilityProvider:schedulerProvider:handler:", v18, v22, v24, v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController setIMessageIDSLookupToken:](v26, "setIMessageIDSLookupToken:", v25);

  }
}

- (void)_updatePhoneTransportButtonsForItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _BOOL8 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = *MEMORY[0x1E0C967C0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "property");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v7);

        if (v11)
        {
          +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (objc_msgSend(v12, "hasCellularTelephonyCapability") & 1) != 0 || _CFMZEnabled() != 0;
          objc_msgSend(v9, "setAllowsPhone:", v13);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (void)_updateEmailTransportButtonsForItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = *MEMORY[0x1E0C966A8];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "property");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v7);

        if (v11)
          objc_msgSend(v9, "setAllowsEmail:", 1);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)_updateTTYTransportButtonsForItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = *MEMORY[0x1E0C967C0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "property");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v8);

        if (v12)
          objc_msgSend(v10, "setAllowsTTY:", -[CNContactContentDisplayViewController contactSupportsTTYCalls](self, "contactSupportsTTYCalls"));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (Class)groupClassForProperty:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96680]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96888]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96800]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966A0]) & 1) == 0)
  {
    objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96668]);
  }
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (BOOL)shouldShowGemini
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CNContactContentDisplayViewController geminiDataSource](self, "geminiDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "geminiResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !-[CNContactContentDisplayViewController showingMeContact](self, "showingMeContact"))
  {
    -[CNContactContentDisplayViewController contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isSuggested") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayedProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0C967C0]))
      {
        -[CNContactContentDisplayViewController contact](self, "contact");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = +[CNContactContentDisplayViewController shouldShowGeminiForResult:contact:](CNContactContentDisplayViewController, "shouldShowGeminiForResult:contact:", v4, v9);

      }
      else
      {
        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_loadPropertyGroups
{
  CNPropertyGroupsDataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CNPropertyGroupsDataSource *v9;
  CNPropertyGroupsDataSource *propertyGroupsDataSource;
  void *v11;
  void *v12;
  void *v13;

  v3 = [CNPropertyGroupsDataSource alloc];
  -[CNContactContentDisplayViewController mutableContact](self, "mutableContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController policy](self, "policy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController linkedPoliciesByContactIdentifier](self, "linkedPoliciesByContactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNPropertyGroupsDataSource initWithMutableContact:contactStore:policy:linkedPolicies:prohibitedKeys:](v3, "initWithMutableContact:contactStore:policy:linkedPolicies:prohibitedKeys:", v4, v5, v6, v7, v8);
  propertyGroupsDataSource = self->_propertyGroupsDataSource;
  self->_propertyGroupsDataSource = v9;

  -[CNContactContentDisplayViewController propertyGroupsDataSource](self, "propertyGroupsDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "buildPropertyGroups");

  -[CNContactContentDisplayViewController propertyGroupsDataSource](self, "propertyGroupsDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "propertyGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_reloadPropertyGroupsPreservingChanges:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNContactContentDisplayViewController propertyGroups](self, "propertyGroups", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "reloadDataPreservingChanges:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_reloadFaceTimeGroup
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD aBlock[4];
  id v24;
  id location;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFaceTimeAppAvailable"))
    v4 = objc_msgSend(v3, "isConferencingAvailable") ^ 1;
  else
    v4 = 1;
  -[CNContactContentDisplayViewController propertyGroupsDataSource](self, "propertyGroupsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C966A8];
  v26[0] = *MEMORY[0x1E0C967C0];
  v26[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allDisplayPropertyItemsForPropertyKeys:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "allowsActions"))
    goto LABEL_12;
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "allowsConferencing") & 1) == 0)
  {

    goto LABEL_12;
  }
  -[CNContactContentDisplayViewController contact](self, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v11, "isSuggested") | v4) & 1) != 0 || !objc_msgSend(v8, "count"))
  {

    goto LABEL_12;
  }
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryProperty");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v14)
  {
    objc_msgSend(v8, "_cn_filter:", &__block_literal_global_2_54958);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_cn_map:", &__block_literal_global_54954);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    aBlock[1] = 3221225472;
    aBlock[2] = __61__CNContactContentDisplayViewController__reloadFaceTimeGroup__block_invoke;
    aBlock[3] = &unk_1E204FD98;
    aBlock[0] = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v24, &location);
    v16 = _Block_copy(aBlock);
    v17 = (void *)MEMORY[0x1E0D13D00];
    -[CNContactContentDisplayViewController environment](self, "environment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "idsAvailabilityProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController environment](self, "environment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "defaultSchedulerProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "validateHandlesForFaceTime:availabilityProvider:schedulerProvider:handler:", v9, v19, v21, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController setFaceTimeIDSLookupToken:](self, "setFaceTimeIDSLookupToken:", v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
LABEL_12:

  }
}

- (id)_propertyGroupsForKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
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
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
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
        -[CNContactContentDisplayViewController propertyGroups](self, "propertyGroups", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_addFaceTimeGroupAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v3 = a3;
  v10[2] = *MEMORY[0x1E0C80C00];
  if ((-[CNContactContentDisplayViewController isEditing](self, "isEditing") & 1) == 0)
  {
    if (-[CNContactContentDisplayViewController shouldAddFaceTimeGroup](self, "shouldAddFaceTimeGroup"))
    {
      v5 = *MEMORY[0x1E0C966A8];
      v10[0] = *MEMORY[0x1E0C967C0];
      v10[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController _propertyGroupsForKeys:](self, "_propertyGroupsForKeys:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController cardFaceTimeGroup](self, "cardFaceTimeGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController _addGroup:afterGroup:animated:](self, "_addGroup:afterGroup:animated:", v9, v8, v3);

    }
  }
}

- (BOOL)shouldAddFaceTimeGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CNContactContentDisplayViewController cardFaceTimeGroup](self, "cardFaceTimeGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController cardFaceTimeGroup](self, "cardFaceTimeGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) != 0)
    return 0;
  -[CNContactContentDisplayViewController cardFaceTimeGroup](self, "cardFaceTimeGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contact");
  v10 = objc_claimAutoreleasedReturnValue();

  -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__CNContactContentDisplayViewController_shouldAddFaceTimeGroup__block_invoke;
  v14[3] = &unk_1E204FDC0;
  v15 = (id)v10;
  v12 = (id)v10;
  LOBYTE(v10) = objc_msgSend(v11, "_cn_any:", v14);

  v8 = v10 ^ 1;
  return v8;
}

- (void)_addShareLocationGroupAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v3 = a3;
  if (-[CNContactContentDisplayViewController shouldAddShareLocationGroup](self, "shouldAddShareLocationGroup"))
  {
    if ((-[CNContactContentDisplayViewController isEditing](self, "isEditing") & 1) == 0)
    {
      -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __72__CNContactContentDisplayViewController__addShareLocationGroupAnimated___block_invoke;
        v12[3] = &unk_1E204FDE8;
        v12[4] = self;
        v7 = objc_msgSend(v6, "_cn_indexOfFirstObjectPassingTest:", v12);

        if (v7 && v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", v7 - 1);
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "lastObject");
          v9 = objc_claimAutoreleasedReturnValue();
        }
        v10 = (void *)v9;

        -[CNContactContentDisplayViewController cardShareLocationGroup](self, "cardShareLocationGroup");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentDisplayViewController _addGroup:afterGroup:animated:](self, "_addGroup:afterGroup:animated:", v11, v10, v3);

      }
    }
  }
}

- (BOOL)shouldAddShareLocationGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if ((-[CNContactContentDisplayViewController isEditing](self, "isEditing") & 1) != 0)
    return 0;
  -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CNContactContentDisplayViewController cardShareLocationGroup](self, "cardShareLocationGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController cardShareLocationGroup](self, "cardShareLocationGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "_cn_containsObject:", v6);

  return v7 ^ 1;
}

- (void)_addGroup:(id)a3 afterGroup:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v5 = a5;
  v16 = a4;
  v8 = a3;
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && (v11 = objc_msgSend(v10, "indexOfObject:", v16), v11 != 0x7FFFFFFFFFFFFFFFLL))
    v12 = v11 + 1;
  else
    v12 = 0;
  objc_msgSend(v9, "beginUpdates");
  objc_msgSend(v10, "insertObject:atIndex:", v8, v12);

  v13 = -[CNContactContentDisplayViewController tableViewSectionIndexFromGroupIndex:](self, "tableViewSectionIndexFromGroupIndex:", v12);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v15 = 6;
  else
    v15 = 5;
  objc_msgSend(v9, "insertSections:withRowAnimation:", v14, v15);

  objc_msgSend(v9, "endUpdates");
  -[CNContactContentDisplayViewController adjustPreferredContentSize](self, "adjustPreferredContentSize");

}

- (void)_addMedicalIDGroupAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];

  v3 = a3;
  -[CNContactContentDisplayViewController displayGroups](self, "displayGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__CNContactContentDisplayViewController__addMedicalIDGroupAnimated___block_invoke;
  aBlock[3] = &unk_1E204FE98;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v6);
  if (v7)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "lastObject");
    else
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[CNContactContentDisplayViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController _addGroup:afterGroup:animated:](self, "_addGroup:afterGroup:animated:", v9, v8, v3);

}

- (void)_reloadMedicalIDGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  -[CNContactContentDisplayViewController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthStoreManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentDisplayViewController medicalIDLookupToken](self, "medicalIDLookupToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[CNContactContentDisplayViewController setMedicalIDLookupToken:](self, "setMedicalIDLookupToken:", 0);
  -[CNContactContentDisplayViewController setMedicalIDRegistrationToken:](self, "setMedicalIDRegistrationToken:", 0);
  -[CNContactContentDisplayViewController setCardMedicalIDGroup:](self, "setCardMedicalIDGroup:", 0);
  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsEmergencyContact:", 0);

  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "allowsActions") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowsCardActions");

  if (!v9)
  {
LABEL_5:
    -[CNContactContentDisplayViewController setCardMedicalIDGroup:](self, "setCardMedicalIDGroup:", 0);
    -[CNContactContentDisplayViewController setMedicalIDAction:](self, "setMedicalIDAction:", 0);
    -[CNContactContentDisplayViewController setEmergencyContactAction:](self, "setEmergencyContactAction:", 0);
    -[CNContactContentDisplayViewController setEmergencyNumberIdentifier:](self, "setEmergencyNumberIdentifier:", 0);
    goto LABEL_6;
  }
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke;
  v23[3] = &unk_1E204FEE8;
  objc_copyWeak(&v25, &location);
  v11 = v4;
  v24 = v11;
  objc_msgSend(v11, "registerMedicalIDDataHandler:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController setMedicalIDRegistrationToken:](self, "setMedicalIDRegistrationToken:", v12);
  v13 = (void *)MEMORY[0x1E0D139B8];
  v16 = v10;
  v17 = 3221225472;
  v18 = __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke_4;
  v19 = &unk_1E204FF10;
  objc_copyWeak(&v22, &location);
  v20 = v11;
  v14 = v12;
  v21 = v14;
  objc_msgSend(v13, "tokenWithCancelationBlock:", &v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController setMedicalIDLookupToken:](self, "setMedicalIDLookupToken:", v15, v16, v17, v18, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
LABEL_6:

}

- (void)_reloadAlertGroups
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CNContactContentDisplayViewController propertyGroups](self, "propertyGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C96680]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsDisplayModePickerActions:", objc_msgSend(v5, "allowsDisplayModePickerActions"));

  -[CNContactContentDisplayViewController propertyGroups](self, "propertyGroups");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C96888]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsDisplayModePickerActions:", objc_msgSend(v7, "allowsDisplayModePickerActions"));

}

- (BOOL)shouldReallyShowLinkedContacts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldShowLinkedContacts"))
  {
    -[CNContactContentDisplayViewController contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainStoreLinkedContacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      -[CNContactContentDisplayViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        -[CNContactContentDisplayViewController contact](self, "contact");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v8, "isSuggestedMe") ^ 1;

      }
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_reloadLinkedCardsGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CNCardLinkedCardsGroup *v8;
  void *v9;
  CNCardLinkedCardsGroup *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[CNContactContentDisplayViewController shouldReallyShowLinkedContacts](self, "shouldReallyShowLinkedContacts"))
  {
    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "linkedCardsAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "buildLinkedContactActions");

    }
    -[CNContactContentDisplayViewController actionProvider](self, "actionProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "linkedCardsAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContactDelegate:", self);

    v8 = [CNCardLinkedCardsGroup alloc];
    -[CNContactContentDisplayViewController mutableContact](self, "mutableContact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CNCardGroup initWithContact:](v8, "initWithContact:", v9);
    -[CNContactContentDisplayViewController setCardLinkedCardsGroup:](self, "setCardLinkedCardsGroup:", v10);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController contact](self, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mainStoreLinkedContacts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentDisplayViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v22;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19++), (_QWORD)v21);
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v17);
      }

    }
    if ((unint64_t)objc_msgSend(v11, "count", (_QWORD)v21) < 2)
    {
      -[CNContactContentDisplayViewController setCardLinkedCardsGroup:](self, "setCardLinkedCardsGroup:", 0);
    }
    else
    {
      -[CNContactContentDisplayViewController cardLinkedCardsGroup](self, "cardLinkedCardsGroup");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLinkedContacts:", v11);

    }
  }
  else
  {
    -[CNContactContentDisplayViewController setCardLinkedCardsGroup:](self, "setCardLinkedCardsGroup:", 0);
  }
}

- (id)_loadDisplayGroups
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  BOOL v54;
  int v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v68;
  char v69;
  void *v70;
  id obj;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController cardTopGroup](self, "cardTopGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[CNContactContentDisplayViewController cardTopGroup](self, "cardTopGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  v70 = v3;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
  if (v10)
  {
    v11 = v10;
    v72 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v78 != v72)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
        -[CNContactContentDisplayViewController propertyGroups](self, "propertyGroups");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "displayItems");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "count"))
        {
          -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "primaryProperty");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "property");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if ((v20 & 1) != 0)
            goto LABEL_20;
          objc_msgSend(v70, "addObject:", v15);
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          objc_msgSend(v15, "displayItems");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v74;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v74 != v23)
                  objc_enumerationMutation(v16);
                v25 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend(v25, "setDelegate:", self);
              }
              v22 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
            }
            while (v22);
          }
        }

LABEL_20:
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    }
    while (v11);
  }

  -[CNContactContentDisplayViewController cardBottomGroup](self, "cardBottomGroup");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "actions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v28)
  {
    -[CNContactContentDisplayViewController cardBottomGroup](self, "cardBottomGroup");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObject:", v29);

  }
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v30, "hideCardActions") & 1) != 0)
    goto LABEL_32;
  -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "actions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33)
  {
    -[CNContactContentDisplayViewController cardBottomGroup](self, "cardBottomGroup");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "actions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v35, "count"))
    {
      -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "primaryProperty");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v37)
      {
        -[CNContactContentDisplayViewController contact](self, "contact");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v68, "isSuggested");

        if ((v69 & 1) == 0)
        {
          -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          v40 = 0;
          goto LABEL_31;
        }
LABEL_30:
        -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        v40 = 1;
LABEL_31:
        objc_msgSend(v38, "setAddSpacerFromPreviousGroup:", v40);

        -[CNContactContentDisplayViewController cardActionsGroup](self, "cardActionsGroup");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addObject:", v30);
LABEL_32:

        goto LABEL_33;
      }

    }
    goto LABEL_30;
  }
LABEL_33:
  -[CNContactContentDisplayViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[CNContactContentDisplayViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "actionItems");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "count");

    if (v45)
    {
      -[CNContactContentDisplayViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "addObject:", v46);

    }
  }
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v47, "hideCardActions") & 1) == 0)
  {
    -[CNContactContentDisplayViewController cardShareLocationGroup](self, "cardShareLocationGroup");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "actionItems");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "count");

    if (!v50)
      goto LABEL_40;
    -[CNContactContentDisplayViewController cardShareLocationGroup](self, "cardShareLocationGroup");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObject:", v47);
  }

LABEL_40:
  -[CNContactContentDisplayViewController cardFooterGroup](self, "cardFooterGroup");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "actions");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v52, "count");

  if (v53)
  {
    -[CNContactContentDisplayViewController cardFooterGroup](self, "cardFooterGroup");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObject:", v51);

  }
  v54 = -[CNContactContentDisplayViewController isSuggestedContact](self, "isSuggestedContact");
  if (v54)
  {
    v55 = 0;
  }
  else
  {
    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v51, "allowsContactBlocking") & 1) != 0)
    {
      v55 = 0;
    }
    else
    {
      -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v53, "allowsContactBlockingAndReporting") & 1) == 0)
      {

LABEL_58:
        goto LABEL_59;
      }
      v55 = 1;
    }
  }
  -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "actions");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "count");

  if (v55)
  {

    if (!v54)
      goto LABEL_48;
LABEL_51:
    if (!v58)
      goto LABEL_59;
    goto LABEL_52;
  }
  if (v54)
    goto LABEL_51;
LABEL_48:

  if (v58)
  {
LABEL_52:
    -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "showContactBlockingFirst");

    -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v61;
    if (v60)
    {
      objc_msgSend(v61, "setAddSpacerFromPreviousGroup:", 0);

      -[CNContactContentDisplayViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "insertObject:atIndex:", v51, 0);
    }
    else
    {
      objc_msgSend(v70, "addObject:", v61);
    }
    goto LABEL_58;
  }
LABEL_59:
  -[CNContactContentDisplayViewController cardLinkedCardsGroup](self, "cardLinkedCardsGroup");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[CNContactContentDisplayViewController cardLinkedCardsGroup](self, "cardLinkedCardsGroup");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObject:", v63);

  }
  -[CNContactContentDisplayViewController contactViewConfiguration](self, "contactViewConfiguration");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "allowsNamePicking");

  if (v65)
  {
    -[CNContactContentDisplayViewController namePickingGroup](self, "namePickingGroup");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObject:", v66);

  }
  return v70;
}

- (void)_reloadGeminiGroupPreservingChanges:(BOOL)a3
{
  void *v4;
  id v5;

  if (!a3)
  {
    -[CNContactContentDisplayViewController geminiDataSource](self, "geminiDataSource");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetDataSource");
    -[CNContactContentDisplayViewController contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContact:", v4);

  }
}

- (void)_validateGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  CNContactContentDisplayViewController *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "propertyItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v18 = self;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "labeledValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "isValidValue:", v13);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v11, "labeledValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "replacementForInvalidValue:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "updateLabeledValueWithValue:", v17);

          v8 = 1;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
    if ((v8 & 1) != 0)
      -[CNContactContentDisplayViewController reloadCardGroup:](v18, "reloadCardGroup:", v4);
  }

}

- (void)_saveChangesForGroups:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v9 = (void *)objc_opt_class();
        if (objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()))
          objc_msgSend(v8, "saveChanges");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)_cardGroupAtTableViewSectionIndex:(int64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;

  v4 = -[CNContactContentDisplayViewController groupIndexFromTableViewSectionIndex:](self, "groupIndexFromTableViewSectionIndex:", a3);
  -[CNContactContentDisplayViewController _currentGroups](self, "_currentGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= v4)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentDisplayViewController isStandardGroup:](self, "isStandardGroup:", v5))
  {
    objc_msgSend(v5, "displayItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[CNContactContentDisplayViewController _indexPathIsActionItem:](self, "_indexPathIsActionItem:", v4))
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "actionItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

- (BOOL)_indexPathIsActionItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;

  v4 = a3;
  -[CNContactContentDisplayViewController _cardGroupAtTableViewSectionIndex:](self, "_cardGroupAtTableViewSectionIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[CNContactContentDisplayViewController _itemAtIndexPath:](self, "_itemAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      isKindOfClass = 0;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass() ^ 1;
    }
  }

  return isKindOfClass & 1;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNContactContentDisplayViewController;
  -[CNContactContentDisplayViewController encodeRestorableStateWithCoder:](&v18, sel_encodeRestorableStateWithCoder_, v4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[CNContactContentDisplayViewController BOOLStateRestorationProperties](CNContactContentDisplayViewController, "BOOLStateRestorationProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[CNContactContentDisplayViewController valueForKey:](self, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "encodeObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }

  -[CNContactContentDisplayViewController contact](self, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("Identifier"));

}

- (void)_updateUserActivity
{
  NSObject *v3;
  void *v4;
  CNContactContentDisplayViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  CNContactContentDisplayViewController *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (CNUIIsContacts() || CNUIIsMobilePhone())
  {
    CNUILogContactCard();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v5 = (CNContactContentDisplayViewController *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v5;
      _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_INFO, "Activity continuity - running in %@", (uint8_t *)&v17, 0xCu);

    }
    -[CNContactContentDisplayViewController activityManager](self, "activityManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "makeActivityAdvertisingViewingOfContact:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentDisplayViewController userActivity](self, "userActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {

      if (!v10)
      {
        -[CNContactContentDisplayViewController setUserActivity:](self, "setUserActivity:", v8);
        -[CNContactContentDisplayViewController userActivity](self, "userActivity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "becomeCurrent");

        CNUILogContactCard();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          -[CNContactContentDisplayViewController userActivity](self, "userActivity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412546;
          v18 = self;
          v19 = 2112;
          v20 = v13;
          _os_log_impl(&dword_18AC56000, v12, OS_LOG_TYPE_INFO, "Activity continuity -  %@ created %@", (uint8_t *)&v17, 0x16u);

        }
      }
      -[CNContactContentDisplayViewController userActivity](self, "userActivity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNeedsSave:", 1);

    }
    else
    {
      objc_msgSend(v9, "resignCurrent");

      CNUILogContactCard();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[CNContactContentDisplayViewController userActivity](self, "userActivity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412546;
        v18 = self;
        v19 = 2112;
        v20 = v16;
        _os_log_impl(&dword_18AC56000, v15, OS_LOG_TYPE_INFO, "Activity continuity -  %@ removed %@", (uint8_t *)&v17, 0x16u);

      }
      -[CNContactContentDisplayViewController setUserActivity:](self, "setUserActivity:", 0);
    }

  }
}

- (void)updateUserActivityState:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNContactContentDisplayViewController activityManager](self, "activityManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateUserActivityState:withContentsOfContact:", v4, v5);

}

- (void)setCancelKeyboardShortcutEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[CNContactContentDisplayViewController cancelCommand](self, "cancelCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel_editCancel_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController setCancelCommand:](self, "setCancelCommand:", v6);

      -[CNContactContentDisplayViewController cancelCommand](self, "cancelCommand");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController addKeyCommand:](self, "addKeyCommand:", v8);

    }
  }
  else if (v5)
  {
    -[CNContactContentDisplayViewController cancelCommand](self, "cancelCommand");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController removeKeyCommand:](self, "removeKeyCommand:", v7);

    -[CNContactContentDisplayViewController setCancelCommand:](self, "setCancelCommand:", 0);
  }
}

- (void)setEditKeyboardShortcutEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[CNContactContentDisplayViewController editCommand](self, "editCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("l"), 0x100000, sel_toggleEditing_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController setEditCommand:](self, "setEditCommand:", v6);

      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EDIT_CONTACT_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController editCommand](self, "editCommand");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDiscoverabilityTitle:", v8);

      -[CNContactContentDisplayViewController editCommand](self, "editCommand");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentDisplayViewController addKeyCommand:](self, "addKeyCommand:", v11);

    }
  }
  else if (v5)
  {
    -[CNContactContentDisplayViewController editCommand](self, "editCommand");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController removeKeyCommand:](self, "removeKeyCommand:", v10);

    -[CNContactContentDisplayViewController setEditCommand:](self, "setEditCommand:", 0);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  if (-[CNContactContentDisplayViewController isScrollViewControllingHeaderResizeAnimation:](self, "isScrollViewControllingHeaderResizeAnimation:"))
  {
    objc_msgSend(v5, "_verticalVelocity");
    -[CNContactContentDisplayViewController updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:](self, "updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:", v5, v4 >= 0.0, 1);
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;

  y = a4.y;
  v25 = a3;
  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minHeight");
  v10 = v9;

  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "maxHeight");
  v13 = v12;

  if (-[CNContactContentDisplayViewController isScrollViewControllingHeaderResizeAnimation:](self, "isScrollViewControllingHeaderResizeAnimation:", v25))
  {
    v14 = v13 - a5->y;
    objc_msgSend(v25, "contentInset");
    v16 = v14 - v15;
    objc_msgSend(v25, "_systemContentInset");
    v18 = v16 - v17;
    if (y <= 0.0)
    {
      v19 = v25;
      if (y >= 0.0)
      {
        if (v18 > v10 && v18 < v13)
        {
          if (v18 - v10 >= (v13 - v10) * 0.5)
            v18 = v13;
          else
            v18 = v10;
        }
      }
      else if (v18 < v13)
      {
        v18 = v13;
      }
    }
    else
    {
      v19 = v25;
      if (v18 > v10)
        v18 = v10;
    }
    v21 = v13 - v18;
    objc_msgSend(v19, "contentInset");
    v23 = v21 - v22;
    objc_msgSend(v25, "_systemContentInset");
    a5->y = v23 - v24;
  }

}

- (void)presentViewController:(id)a3 sourceView:(id)a4
{
  -[CNContactContentDisplayViewController sender:presentViewController:](self, "sender:presentViewController:", a4, a3);
}

- (void)sharingStatusDidChange
{
  -[CNContactContentDisplayViewController setupShareLocationActionReload:](self, "setupShareLocationActionReload:", 1);
}

- (double)globalHeaderHeightForContentOffset:(double)a3 contentInset:(UIEdgeInsets)a4
{
  double top;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;

  top = a4.top;
  v7 = 0.0;
  if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory", a3, a4.top, a4.left, a4.bottom, a4.right) & 1) == 0)
  {
    -[CNContactContentDisplayViewController actionsWrapperView](self, "actionsWrapperView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v7 = v9;

  }
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_systemContentInset");
  v12 = top + v11;

  if (-v12 <= a3)
    v13 = -a3;
  else
    v13 = v12;
  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minHeight");
  v16 = v7 + v15;

  if (v13 >= v16)
    return v13;
  else
    return v16;
}

- (double)contentOffsetYForGlobalHeaderHeight:(double)a3 contentInset:(UIEdgeInsets)a4
{
  return -a3;
}

- (void)updateHeaderHeightToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  id v19;

  v5 = a5;
  v8 = a3;
  objc_msgSend(v8, "contentOffset");
  v10 = v9;
  objc_msgSend(v8, "contentInset");
  -[CNContactContentDisplayViewController globalHeaderHeightForContentOffset:contentInset:](self, "globalHeaderHeightForContentOffset:contentInset:", v10, v11, v12, v13, v14);
  -[CNContactContentDisplayViewController updateHeaderConstraintForGlobalHeaderHeight:direction:animated:](self, "updateHeaderConstraintForGlobalHeaderHeight:direction:animated:", a4, v5);
  v16 = v15;
  objc_opt_class();
  v19 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v19;
  else
    v17 = 0;
  v18 = v17;

  objc_msgSend(v18, "setMaskingInset:", v16);
}

- (double)updateHeaderConstraintForGlobalHeaderHeight:(double)a3 direction:(int64_t)a4 animated:(BOOL)a5
{
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v8 = 0.0;
  if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory", a4, a5) & 1) == 0)
  {
    -[CNContactContentDisplayViewController actionsWrapperView](self, "actionsWrapperView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v8 = v10;

  }
  -[CNContactContentDisplayViewController headerHeightConstraint](self, "headerHeightConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constant");
  v13 = v12;

  if (a3 - v8 == v13 || !a4 && a3 - v8 <= v13)
    return v8 + v13;
  -[CNContactContentDisplayViewController headerHeightConstraint](self, "headerHeightConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", a3 - v8);

  return a3;
}

- (BOOL)isScrollViewControllingHeaderResizeAnimation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)scrollScrollViewAllTheWayUp:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "contentOffset");
  v4 = v3;
  objc_msgSend(v8, "contentInset");
  v6 = v5;
  objc_msgSend(v8, "_systemContentInset");
  objc_msgSend(v8, "setContentOffset:", v4, -(v6 + v7));

}

- (void)updateInsetsIfNeeded
{
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  _BOOL8 v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  id v45;

  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
  if (v3 <= 0.0
    || (-[CNContactContentDisplayViewController view](self, "view"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "bounds"),
        v6 = v5,
        v4,
        v6 <= 0.0))
  {
    -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "maxHeight");
    v17 = v13;
    v16 = 0;
  }
  else
  {
    -[CNContactContentDisplayViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    -[CNContactContentDisplayViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
    v11 = v9 - v10 + -64.0;

    v12 = fmax(v11, 0.0);
    -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "maxHeight");
    v16 = v12 <= v15;
    v17 = v13;
    v18 = v12;
  }
  objc_msgSend(v17, "setConstrainedMaxHeight:enabled:", v16, v18);

  objc_msgSend(v45, "contentInset");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[CNContactContentDisplayViewController insetsForContactTableView:](self, "insetsForContactTableView:", v45);
  v30 = v27;
  v32 = v31;
  v33 = v28;
  v34 = v29;
  if (v31 != v22 || v27 != v20 || v29 != v26 || v28 != v24)
  {
    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController scrollIndicatorInsetsForContactTableView:withContentInsets:](self, "scrollIndicatorInsetsForContactTableView:withContentInsets:", v35, v30, v32, v33, v34);
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;

    -[CNContactContentDisplayViewController contactView](self, "contactView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentDisplayViewController updateTableView:contentInsetsTo:withScrollIndicatorInsets:](self, "updateTableView:contentInsetsTo:withScrollIndicatorInsets:", v44, v30, v32, v33, v34, v37, v39, v41, v43);

  }
}

- (void)initializeTableViewsForHeaderHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");
  -[CNContactContentDisplayViewController actionsWrapperView](self, "actionsWrapperView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  -[CNContactContentDisplayViewController actionsWrapperView](self, "actionsWrapperView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calculateLabelSizesIfNeeded");

  -[CNContactContentDisplayViewController headerDropShadowView](self, "headerDropShadowView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

  -[CNContactContentDisplayViewController updateInsetsIfNeeded](self, "updateInsetsIfNeeded");
  -[CNContactContentDisplayViewController updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:](self, "updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:", v7, 2, 0);

}

- (UIEdgeInsets)insetsForContactTableView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  UIEdgeInsets result;

  v4 = a3;
  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minHeight");
  v7 = v6;

  -[CNContactContentDisplayViewController contactHeaderView](self, "contactHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maxHeight");
  v10 = v9;

  if (v10 == 0.0)
  {
    v15 = *MEMORY[0x1E0DC49E8];
    v27 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v45 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v29 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    goto LABEL_21;
  }
  v11 = 0.0;
  if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
  {
    -[CNContactContentDisplayViewController actionsWrapperView](self, "actionsWrapperView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v11 = v13;

  }
  objc_msgSend(v4, "_systemContentInset");
  v15 = v10 + v11 - v14;
  objc_msgSend(v4, "bounds");
  v17 = v10 - v7 + v16;
  objc_msgSend(v4, "_systemContentInset");
  v19 = v17 - v18 - v15;
  objc_msgSend(v4, "_systemContentInset");
  v21 = v20;
  -[CNContactContentDisplayViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
  if (v21 >= v22)
    v22 = v21;
  v23 = v19 - v22;
  objc_msgSend(v4, "contentSize");
  if (v23 - v24 >= 0.0)
    v25 = v23 - v24;
  else
    v25 = 0.0;
  objc_msgSend(v4, "contentInset");
  v27 = v26;
  v29 = v28;
  -[CNContactContentDisplayViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
  if (v30 <= 0.0)
  {
    objc_msgSend(v4, "_systemContentInset");
    v47 = -v46;
    goto LABEL_18;
  }
  -[CNContactContentDisplayViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "window");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    v40 = 0.0;
    goto LABEL_16;
  }
  v33 = (void *)v32;
  -[CNContactContentDisplayViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "window");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bounds");
  v37 = v36;
  objc_msgSend(v4, "bounds");
  v39 = v38;

  v40 = 0.0;
  if (v37 > v39)
  {
    -[CNContactContentDisplayViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "window");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bounds");
    v43 = v42;
    objc_msgSend(v4, "bounds");
    v40 = v43 - v44;

LABEL_16:
  }
  -[CNContactContentDisplayViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
  v49 = v48;
  objc_msgSend(v4, "_systemContentInset");
  v47 = v40 + v49 - v50;
LABEL_18:
  if (v25 >= v47)
    v45 = v25;
  else
    v45 = v47;
LABEL_21:

  v51 = v15;
  v52 = v27;
  v53 = v45;
  v54 = v29;
  result.right = v54;
  result.bottom = v53;
  result.left = v52;
  result.top = v51;
  return result;
}

- (UIEdgeInsets)scrollIndicatorInsetsForContactTableView:(id)a3 withContentInsets:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat left;
  double top;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  right = a4.right;
  left = a4.left;
  top = a4.top;
  v8 = a3;
  objc_msgSend(v8, "_systemContentInset");
  v10 = top + v9;
  -[CNContactContentDisplayViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
  v12 = v11;
  objc_msgSend(v8, "_systemContentInset");
  v14 = v13;

  v15 = fmax(v12 - v14, 0.0);
  v16 = v10;
  v17 = left;
  v18 = right;
  result.right = v18;
  result.bottom = v15;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)updateTableView:(id)a3 contentInsetsTo:(UIEdgeInsets)a4 withScrollIndicatorInsets:(UIEdgeInsets)a5
{
  double left;
  double top;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double bottom;
  double right;
  id v19;

  bottom = a5.bottom;
  right = a5.right;
  left = a5.left;
  top = a5.top;
  v7 = a4.right;
  v8 = a4.bottom;
  v9 = a4.left;
  v10 = a4.top;
  v19 = a3;
  objc_msgSend(v19, "contentInset");
  v12 = v10 - v11;
  objc_msgSend(v19, "contentOffset");
  v14 = v13;
  v16 = v15 - v12;
  objc_msgSend(v19, "setContentInset:", v10, v9, v8, v7);
  objc_msgSend(v19, "setScrollIndicatorInsets:", top, left, bottom, right);
  objc_msgSend(v19, "setContentOffset:", v14, v16);

}

- (id)applyContactStyle
{
  void *v3;
  uint64_t v4;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  CNContactHeaderDisplayView *contactHeaderView;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentDisplayViewController forcesTransparentBackground](self, "forcesTransparentBackground"))
  {
    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_6;
    objc_msgSend(v3, "backgroundColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

LABEL_6:
  objc_msgSend(v3, "sectionBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSectionBackgroundColor:", v8);

  objc_msgSend(v3, "separatorColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSeparatorColor:", v10);

  objc_msgSend(v3, "selectedCellBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSelectedCellBackgroundColor:", v12);

  v14 = (void *)MEMORY[0x1E0C99E08];
  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueTextAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *MEMORY[0x1E0DC1140];
  v46[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(v3, "textColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = CFSTR("ABNotesTextColorAttributeName");
  v47[0] = v19;
  objc_msgSend(v3, "notesTextColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntriesFromDictionary:", v21);

  -[CNContactContentDisplayViewController contactView](self, "contactView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setValueTextAttributes:", v17);

  if (-[CNContactContentDisplayViewController forcesTransparentBackground](self, "forcesTransparentBackground"))
  {
    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView setBackgroundColor:](self->_contactHeaderView, "setBackgroundColor:", v23);

    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNContactContentDisplayViewController environment](self, "environment");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "runningInContactsAppOniPad");

    if (v26)
    {
      +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor](CNUIColorRepository, "contactCardBackgroundiPadOverwriteColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderDisplayView setBackgroundColor:](self->_contactHeaderView, "setBackgroundColor:", v27);

      +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor](CNUIColorRepository, "contactCardBackgroundiPadOverwriteColor");
    }
    else
    {
      objc_msgSend(v3, "contactHeaderBackgroundColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderDisplayView setBackgroundColor:](self->_contactHeaderView, "setBackgroundColor:", v28);

      objc_msgSend(v3, "contactHeaderBackgroundColor");
    }
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v24;
  -[CNContactActionsContainerView setBackgroundColor:](self->_actionsWrapperView, "setBackgroundColor:", v24);

  contactHeaderView = self->_contactHeaderView;
  v44 = v18;
  objc_msgSend(v3, "taglineTextColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](contactHeaderView, "cn_updateDictionaryForKey:withChanges:", CFSTR("taglineTextAttributes"), v32);

  -[CNContactContentDisplayViewController actionsViewController](self, "actionsViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setViewStyle:", objc_msgSend(v3, "topActionsViewStyle"));

  v34 = objc_msgSend(v3, "usesOpaqueBackground");
  -[CNContactContentDisplayViewController actionsViewController](self, "actionsViewController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v37;
  if (v34)
  {
    objc_msgSend(v37, "setShadowRadius:", 8.0);

    -[CNContactContentDisplayViewController actionsViewController](self, "actionsViewController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setShadowOffset:", 0.0, 2.0);

    -[CNContactContentDisplayViewController actionsViewController](self, "actionsViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v37;
    LODWORD(v38) = 1025758986;
  }
  else
  {
    LODWORD(v38) = 0;
  }
  objc_msgSend(v37, "setShadowOpacity:", v38);

  return v3;
}

- (CNContactContentDisplayViewControllerDelegate)delegate
{
  return (CNContactContentDisplayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactContentNavigationItemDelegate)navigationItemDelegate
{
  return (CNContactContentNavigationItemDelegate *)objc_loadWeakRetained((id *)&self->_navigationItemDelegate);
}

- (void)setNavigationItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationItemDelegate, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContactView:(id)a3
{
  objc_storeStrong((id *)&self->_contactView, a3);
}

- (void)setContactHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_contactHeaderView, a3);
}

- (CNContactContentViewControllerConfiguration)contactViewConfiguration
{
  return self->_contactViewConfiguration;
}

- (void)setContactViewConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewConfiguration, a3);
}

- (CNContactEditAuthorizationManager)editAuthorizationManager
{
  return self->_editAuthorizationManager;
}

- (void)setEditAuthorizationManager:(id)a3
{
  objc_storeStrong((id *)&self->_editAuthorizationManager, a3);
}

- (UIViewController)personHeaderViewController
{
  return self->_personHeaderViewController;
}

- (CNCardGroup)cardTopGroup
{
  return self->_cardTopGroup;
}

- (void)setCardTopGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardTopGroup, a3);
}

- (CNCardGroup)cardBottomGroup
{
  return self->_cardBottomGroup;
}

- (void)setCardBottomGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardBottomGroup, a3);
}

- (CNCardGroup)cardFooterGroup
{
  return self->_cardFooterGroup;
}

- (CNPresenterDelegate)presentingDelegate
{
  return (CNPresenterDelegate *)objc_loadWeakRetained((id *)&self->_presentingDelegate);
}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentingDelegate, a3);
}

- (CNMutableContact)mutableContact
{
  return self->_mutableContact;
}

- (void)setMutableContact:(id)a3
{
  objc_storeStrong((id *)&self->_mutableContact, a3);
}

- (NSMutableArray)issuedSaveRequestIdentifiers
{
  return self->_issuedSaveRequestIdentifiers;
}

- (void)setIssuedSaveRequestIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_issuedSaveRequestIdentifiers, a3);
}

- (CNMutableContact)shadowCopyOfReadonlyContact
{
  return self->_shadowCopyOfReadonlyContact;
}

- (void)setShadowCopyOfReadonlyContact:(id)a3
{
  objc_storeStrong((id *)&self->_shadowCopyOfReadonlyContact, a3);
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (CNContactContainerPickerViewController)containerPicker
{
  return self->_containerPicker;
}

- (void)setContainerPicker:(id)a3
{
  objc_storeStrong((id *)&self->_containerPicker, a3);
}

- (NSMapTable)cachedLabelWidths
{
  return self->_cachedLabelWidths;
}

- (void)setCachedLabelWidths:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLabelWidths, a3);
}

- (NSArray)extraRightBarButtonItems
{
  return self->_extraRightBarButtonItems;
}

- (void)setExtraRightBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_extraRightBarButtonItems, a3);
}

- (NSArray)extraLeftBarButtonItems
{
  return self->_extraLeftBarButtonItems;
}

- (void)setExtraLeftBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_extraLeftBarButtonItems, a3);
}

- (CNPropertyGroupsDataSource)propertyGroupsDataSource
{
  return self->_propertyGroupsDataSource;
}

- (void)setPropertyGroupsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_propertyGroupsDataSource, a3);
}

- (CNCardGroup)cardActionsGroup
{
  return self->_cardActionsGroup;
}

- (void)setCardActionsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardActionsGroup, a3);
}

- (CNCardGroup)cardShareLocationGroup
{
  return self->_cardShareLocationGroup;
}

- (void)setCardShareLocationGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardShareLocationGroup, a3);
}

- (CNCardGroup)cardMedicalIDGroup
{
  return self->_cardMedicalIDGroup;
}

- (void)setCardMedicalIDGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardMedicalIDGroup, a3);
}

- (CNCardGroup)cardBlockContactGroup
{
  return self->_cardBlockContactGroup;
}

- (void)setCardBlockContactGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardBlockContactGroup, a3);
}

- (CNCardNamePickingGroup)namePickingGroup
{
  return self->_namePickingGroup;
}

- (void)setNamePickingGroup:(id)a3
{
  objc_storeStrong((id *)&self->_namePickingGroup, a3);
}

- (CNCardLinkedCardsGroup)cardLinkedCardsGroup
{
  return self->_cardLinkedCardsGroup;
}

- (void)setCardLinkedCardsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardLinkedCardsGroup, a3);
}

- (NSArray)customActions
{
  return self->_customActions;
}

- (void)setCustomActions:(id)a3
{
  objc_storeStrong((id *)&self->_customActions, a3);
}

- (CNPropertyNoteCell)noteCell
{
  return self->_noteCell;
}

- (void)setNoteCell:(id)a3
{
  objc_storeStrong((id *)&self->_noteCell, a3);
}

- (CNContactToggleBlockCallerAction)blockAction
{
  return self->_blockAction;
}

- (void)setBlockAction:(id)a3
{
  objc_storeStrong((id *)&self->_blockAction, a3);
}

- (CNContactToggleBlockReportCallerAction)blockReportAction
{
  return self->_blockReportAction;
}

- (void)setBlockReportAction:(id)a3
{
  objc_storeStrong((id *)&self->_blockReportAction, a3);
}

- (CNContactAddNewFieldAction)addNewFieldAction
{
  return self->_addNewFieldAction;
}

- (void)setAddNewFieldAction:(id)a3
{
  objc_storeStrong((id *)&self->_addNewFieldAction, a3);
}

- (CNContactUpdateExistingContactAction)updateExistingContactAction
{
  return self->_updateExistingContactAction;
}

- (void)setUpdateExistingContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_updateExistingContactAction, a3);
}

- (CNContactSuggestionAction)suggestedContactAction
{
  return self->_suggestedContactAction;
}

- (void)setSuggestedContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedContactAction, a3);
}

- (CNContactClearRecentsDataAction)clearRecentsDataAction
{
  return self->_clearRecentsDataAction;
}

- (void)setClearRecentsDataAction:(id)a3
{
  objc_storeStrong((id *)&self->_clearRecentsDataAction, a3);
}

- (CNContactSelectContainersAction)selectContainersAction
{
  return self->_selectContainersAction;
}

- (void)setSelectContainersAction:(id)a3
{
  objc_storeStrong((id *)&self->_selectContainersAction, a3);
}

- (CNContactActionProvider)actionProvider
{
  return self->_actionProvider;
}

- (void)setActionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_actionProvider, a3);
}

- (NSArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setActivatedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activatedConstraints, a3);
}

- (NSLayoutConstraint)headerHeightConstraint
{
  return self->_headerHeightConstraint;
}

- (void)setHeaderHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_headerHeightConstraint, a3);
}

- (void)setShareLocationController:(id)a3
{
  objc_storeStrong((id *)&self->_shareLocationController, a3);
}

- (CNContactInlineActionsViewController)actionsViewController
{
  return self->_actionsViewController;
}

- (void)setActionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_actionsViewController, a3);
}

- (CNContactActionsContainerView)actionsWrapperView
{
  return self->_actionsWrapperView;
}

- (void)setActionsWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_actionsWrapperView, a3);
}

- (UIView)headerDropShadowView
{
  return self->_headerDropShadowView;
}

- (void)setHeaderDropShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_headerDropShadowView, a3);
}

- (CNMedicalIDAction)medicalIDAction
{
  return self->_medicalIDAction;
}

- (void)setMedicalIDAction:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDAction, a3);
}

- (CNEmergencyContactAction)emergencyContactAction
{
  return self->_emergencyContactAction;
}

- (void)setEmergencyContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyContactAction, a3);
}

- (CNHealthStoreManagerToken)medicalIDRegistrationToken
{
  return self->_medicalIDRegistrationToken;
}

- (void)setMedicalIDRegistrationToken:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDRegistrationToken, a3);
}

- (CNCancelable)medicalIDLookupToken
{
  return self->_medicalIDLookupToken;
}

- (void)setMedicalIDLookupToken:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDLookupToken, a3);
}

- (NSString)emergencyNumberIdentifier
{
  return self->_emergencyNumberIdentifier;
}

- (void)setEmergencyNumberIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyNumberIdentifier, a3);
}

- (CNContactAction)ignoreContactAction
{
  return self->_ignoreContactAction;
}

- (void)setIgnoreContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_ignoreContactAction, a3);
}

- (CNSiriContactContextProvider)siriContextProvider
{
  return self->_siriContextProvider;
}

- (void)setSiriContextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_siriContextProvider, a3);
}

- (CNCancelable)iMessageIDSLookupToken
{
  return self->_iMessageIDSLookupToken;
}

- (void)setIMessageIDSLookupToken:(id)a3
{
  objc_storeStrong((id *)&self->_iMessageIDSLookupToken, a3);
}

- (CNCancelable)faceTimeIDSLookupToken
{
  return self->_faceTimeIDSLookupToken;
}

- (void)setFaceTimeIDSLookupToken:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeIDSLookupToken, a3);
}

- (NSDictionary)userActivityUserInfo
{
  return self->_userActivityUserInfo;
}

- (void)setUserActivityUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityUserInfo, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (BOOL)outOfProcessSetupComplete
{
  return self->_outOfProcessSetupComplete;
}

- (void)setOutOfProcessSetupComplete:(BOOL)a3
{
  self->_outOfProcessSetupComplete = a3;
}

- (BOOL)isPresentingFullscreenForOutOfProcess
{
  return self->_isPresentingFullscreenForOutOfProcess;
}

- (void)setIsPresentingFullscreenForOutOfProcess:(BOOL)a3
{
  self->_isPresentingFullscreenForOutOfProcess = a3;
}

- (BOOL)didSetFirstResponder
{
  return self->_didSetFirstResponder;
}

- (void)setDidSetFirstResponder:(BOOL)a3
{
  self->_didSetFirstResponder = a3;
}

- (NSArray)highlightedProperties
{
  return self->_highlightedProperties;
}

- (void)setHighlightedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedProperties, a3);
}

- (BOOL)highlightedPropertyImportant
{
  return self->_highlightedPropertyImportant;
}

- (void)setHighlightedPropertyImportant:(BOOL)a3
{
  self->_highlightedPropertyImportant = a3;
}

- (CNUIUserActionListDataSource)actionsDataSource
{
  return self->_actionsDataSource;
}

- (void)setActionsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_actionsDataSource, a3);
}

- (BOOL)contactSupportsTTYCalls
{
  return self->_contactSupportsTTYCalls;
}

- (void)setContactSupportsTTYCalls:(BOOL)a3
{
  self->_contactSupportsTTYCalls = a3;
}

- (UIKeyCommand)editCommand
{
  return self->_editCommand;
}

- (void)setEditCommand:(id)a3
{
  objc_storeStrong((id *)&self->_editCommand, a3);
}

- (UIKeyCommand)cancelCommand
{
  return self->_cancelCommand;
}

- (void)setCancelCommand:(id)a3
{
  objc_storeStrong((id *)&self->_cancelCommand, a3);
}

- (double)keyboardVerticalOverlap
{
  return self->_keyboardVerticalOverlap;
}

- (void)setKeyboardVerticalOverlap:(double)a3
{
  self->_keyboardVerticalOverlap = a3;
}

- (NSArray)preEditLeftBarButtonItems
{
  return self->_preEditLeftBarButtonItems;
}

- (void)setPreEditLeftBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, a3);
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (CNUIUserActivityManager)activityManager
{
  return self->_activityManager;
}

- (CNUIGeminiDataSource)geminiDataSource
{
  return self->_geminiDataSource;
}

- (BOOL)runningPPT
{
  return self->_runningPPT;
}

- (void)setRunningPPT:(BOOL)a3
{
  self->_runningPPT = a3;
}

- (BOOL)shouldIgnoreBlockListChange
{
  return self->_shouldIgnoreBlockListChange;
}

- (void)setShouldIgnoreBlockListChange:(BOOL)a3
{
  self->_shouldIgnoreBlockListChange = a3;
}

- (BOOL)didSetNewContact
{
  return self->_didSetNewContact;
}

- (void)setDidSetNewContact:(BOOL)a3
{
  self->_didSetNewContact = a3;
}

- (BOOL)forcesTransparentBackground
{
  return self->_forcesTransparentBackground;
}

- (CNPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (NSDictionary)linkedPoliciesByContactIdentifier
{
  return self->_linkedPoliciesByContactIdentifier;
}

- (void)setLinkedPoliciesByContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (NSArray)missingRequiredKeys
{
  return self->_missingRequiredKeys;
}

- (void)setMissingRequiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_missingRequiredKeys, a3);
}

- (void)setOriginalContacts:(id)a3
{
  objc_storeStrong((id *)&self->_originalContacts, a3);
}

- (BOOL)allowsEditInApp
{
  return self->_allowsEditInApp;
}

- (void)setAllowsEditInApp:(BOOL)a3
{
  self->_allowsEditInApp = a3;
}

- (BOOL)shouldDrawNavigationBar
{
  return self->_shouldDrawNavigationBar;
}

- (void)setShouldDrawNavigationBar:(BOOL)a3
{
  self->_shouldDrawNavigationBar = a3;
}

- (NSString)initialPrompt
{
  return self->_initialPrompt;
}

- (void)setInitialPrompt:(id)a3
{
  objc_storeStrong((id *)&self->_initialPrompt, a3);
}

- (BOOL)shouldIgnoreContactStoreDidChangeNotification
{
  return self->_shouldIgnoreContactStoreDidChangeNotification;
}

- (void)setShouldIgnoreContactStoreDidChangeNotification:(BOOL)a3
{
  self->_shouldIgnoreContactStoreDidChangeNotification = a3;
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, a3);
}

- (CNContactContentNavigationItemUpdater)contactNavigationItemUpdater
{
  return self->_contactNavigationItemUpdater;
}

- (void)setContactNavigationItemUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_contactNavigationItemUpdater, a3);
}

- (CNUIContactSaveExecutor)saveLinkedContactsExecutor
{
  return self->_saveLinkedContactsExecutor;
}

- (void)setSaveLinkedContactsExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_saveLinkedContactsExecutor, a3);
}

- (CNContactRecentsReference)recentsData
{
  return self->_recentsData;
}

- (void)setRecentsData:(id)a3
{
  objc_storeStrong((id *)&self->_recentsData, a3);
}

- (BOOL)showingMeContact
{
  return self->_showingMeContact;
}

- (void)setShowingMeContact:(BOOL)a3
{
  self->_showingMeContact = a3;
}

- (NSDictionary)propertyGroups
{
  return self->_propertyGroups;
}

- (CNCardFaceTimeGroup)cardFaceTimeGroup
{
  return self->_cardFaceTimeGroup;
}

- (void)setCardFaceTimeGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardFaceTimeGroup, a3);
}

- (NSMutableArray)displayGroups
{
  return self->_displayGroups;
}

- (void)setDisplayGroups:(id)a3
{
  objc_storeStrong((id *)&self->_displayGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayGroups, 0);
  objc_storeStrong((id *)&self->_cardFaceTimeGroup, 0);
  objc_storeStrong((id *)&self->_propertyGroups, 0);
  objc_storeStrong((id *)&self->_recentsData, 0);
  objc_storeStrong((id *)&self->_saveLinkedContactsExecutor, 0);
  objc_storeStrong((id *)&self->_contactNavigationItemUpdater, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_initialPrompt, 0);
  objc_storeStrong((id *)&self->_originalContacts, 0);
  objc_storeStrong((id *)&self->_missingRequiredKeys, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_geminiDataSource, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_cancelCommand, 0);
  objc_storeStrong((id *)&self->_editCommand, 0);
  objc_storeStrong((id *)&self->_actionsDataSource, 0);
  objc_storeStrong((id *)&self->_highlightedProperties, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_userActivityUserInfo, 0);
  objc_storeStrong((id *)&self->_faceTimeIDSLookupToken, 0);
  objc_storeStrong((id *)&self->_iMessageIDSLookupToken, 0);
  objc_storeStrong((id *)&self->_siriContextProvider, 0);
  objc_storeStrong((id *)&self->_ignoreContactAction, 0);
  objc_storeStrong((id *)&self->_emergencyNumberIdentifier, 0);
  objc_storeStrong((id *)&self->_medicalIDLookupToken, 0);
  objc_storeStrong((id *)&self->_medicalIDRegistrationToken, 0);
  objc_storeStrong((id *)&self->_emergencyContactAction, 0);
  objc_storeStrong((id *)&self->_medicalIDAction, 0);
  objc_storeStrong((id *)&self->_headerDropShadowView, 0);
  objc_storeStrong((id *)&self->_actionsWrapperView, 0);
  objc_storeStrong((id *)&self->_actionsViewController, 0);
  objc_storeStrong((id *)&self->_shareLocationController, 0);
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
  objc_storeStrong((id *)&self->_selectContainersAction, 0);
  objc_storeStrong((id *)&self->_clearRecentsDataAction, 0);
  objc_storeStrong((id *)&self->_suggestedContactAction, 0);
  objc_storeStrong((id *)&self->_updateExistingContactAction, 0);
  objc_storeStrong((id *)&self->_addNewFieldAction, 0);
  objc_storeStrong((id *)&self->_blockReportAction, 0);
  objc_storeStrong((id *)&self->_blockAction, 0);
  objc_storeStrong((id *)&self->_noteCell, 0);
  objc_storeStrong((id *)&self->_customActions, 0);
  objc_storeStrong((id *)&self->_cardLinkedCardsGroup, 0);
  objc_storeStrong((id *)&self->_namePickingGroup, 0);
  objc_storeStrong((id *)&self->_cardBlockContactGroup, 0);
  objc_storeStrong((id *)&self->_cardMedicalIDGroup, 0);
  objc_storeStrong((id *)&self->_cardShareLocationGroup, 0);
  objc_storeStrong((id *)&self->_cardActionsGroup, 0);
  objc_storeStrong((id *)&self->_propertyGroupsDataSource, 0);
  objc_storeStrong((id *)&self->_extraLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_extraRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_cachedLabelWidths, 0);
  objc_storeStrong((id *)&self->_containerPicker, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_shadowCopyOfReadonlyContact, 0);
  objc_storeStrong((id *)&self->_issuedSaveRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutableContact, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_storeStrong((id *)&self->_cardFooterGroup, 0);
  objc_storeStrong((id *)&self->_cardBottomGroup, 0);
  objc_storeStrong((id *)&self->_cardTopGroup, 0);
  objc_storeStrong((id *)&self->_personHeaderViewController, 0);
  objc_storeStrong((id *)&self->_editAuthorizationManager, 0);
  objc_storeStrong((id *)&self->_contactViewConfiguration, 0);
  objc_storeStrong((id *)&self->_contactHeaderView, 0);
  objc_storeStrong((id *)&self->_contactView, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_navigationItemDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayedProperties, 0);
}

void __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultSchedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke_2;
  v13[3] = &unk_1E204FEC0;
  v14 = v6;
  v15 = WeakRetained;
  v16 = *(id *)(a1 + 32);
  v17 = v5;
  v11 = v5;
  v12 = v6;
  objc_msgSend(v10, "performBlock:", v13);

}

void __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setMedicalIDRegistrationToken:", 0);
  objc_msgSend(*(id *)(a1 + 32), "unregisterHandlerForToken:", *(_QWORD *)(a1 + 40));

}

void __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CNCardGroup *v9;
  CNCardGroup *v10;
  void *v11;
  void *v12;
  CNMedicalIDAction *v13;
  void *v14;
  CNMedicalIDAction *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const __CFString *v27;
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
  CNEmergencyContactAction *v38;
  void *v39;
  CNEmergencyContactAction *v40;
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
  id v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(uint64_t);
  void *v71;
  id v72;
  uint64_t v73;
  _QWORD v74[2];

  v74[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "medicalIDRegistrationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneNumbers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "count");

    if ((objc_msgSend(*(id *)(a1 + 40), "showingMeContact") & 1) != 0 || v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeAllActions");
      }
      else
      {
        v9 = [CNCardGroup alloc];
        objc_msgSend(*(id *)(a1 + 40), "mutableContact");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[CNCardGroup initWithContact:](v9, "initWithContact:", v8);
        objc_msgSend(*(id *)(a1 + 40), "setCardMedicalIDGroup:", v10);

      }
      objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAddSpacerFromPreviousGroup:", 0);

      if (objc_msgSend(*(id *)(a1 + 40), "showingMeContact"))
      {
        objc_msgSend(*(id *)(a1 + 40), "medicalIDAction");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v13 = [CNMedicalIDAction alloc];
          objc_msgSend(*(id *)(a1 + 40), "contact");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[CNPropertyAction initWithContact:](v13, "initWithContact:", v14);
          objc_msgSend(*(id *)(a1 + 40), "setMedicalIDAction:", v15);

          v16 = *(_QWORD *)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 40), "medicalIDAction");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setHealthStoreManager:", v16);

          v18 = *(void **)(a1 + 40);
          objc_msgSend(v18, "medicalIDAction");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setDelegate:", v18);

          objc_msgSend(*(id *)(a1 + 40), "medicalIDAction");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setShowBackgroundPlatter:", 0);

        }
        objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 1;
        objc_msgSend(v21, "setAddSpacerFromPreviousGroup:", 1);

        objc_msgSend(*(id *)(a1 + 40), "contactHeaderView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setIsEmergencyContact:", 0);

        v24 = *(_QWORD *)(a1 + 56);
        CNContactsUIBundle();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v24)
          v27 = CFSTR("CARD_ACTION_SHOW_MEDICAL_ID");
        else
          v27 = CFSTR("CARD_ACTION_CREATE_MEDICAL_ID");
        if (v24)
          v22 = 2;
        objc_msgSend(v25, "localizedStringForKey:value:table:", v27, &stru_1E20507A8, CFSTR("Localized"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "medicalIDAction");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setMedicalIDActionType:", v22);

        objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "medicalIDAction");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNUIColorRepository contactListEmergencyContactAddTextColor](CNUIColorRepository, "contactListEmergencyContactAddTextColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNUIColorRepository contactListEmergencyContactGlyphColor](CNUIColorRepository, "contactListEmergencyContactGlyphColor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addAction:withTitle:color:glyphColor:transportType:", v31, v28, v32, v33, 6);

        v6 = 0;
      }
      else if (v6)
      {
        objc_msgSend(*(id *)(a1 + 40), "emergencyContactAction");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
        {
          objc_msgSend(*(id *)(a1 + 40), "propertyGroupsDataSource");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v74[0] = *MEMORY[0x1E0C967C0];
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "allDisplayPropertyItemsForPropertyKeys:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = [CNEmergencyContactAction alloc];
          objc_msgSend(*(id *)(a1 + 40), "contact");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[CNEmergencyContactAction initWithContact:healthStoreManager:propertyItems:](v38, "initWithContact:healthStoreManager:propertyItems:", v39, *(_QWORD *)(a1 + 48), v37);
          objc_msgSend(*(id *)(a1 + 40), "setEmergencyContactAction:", v40);

          v41 = *(void **)(a1 + 40);
          objc_msgSend(v41, "emergencyContactAction");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setDelegate:", v41);

        }
        objc_msgSend(*(id *)(a1 + 56), "emergencyContacts");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "contact");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNHealthStoreManager emergencyContactMatchingContact:](CNHealthStoreManager, "emergencyContactMatchingContact:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "_cn_firstObjectPassingTest:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        CNContactsUIBundle();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47;
        if (v46)
        {
          objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_EMERGENCY_REMOVE"), &stru_1E20507A8, CFSTR("Localized"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v46, "phoneNumberContactIdentifier");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_EMERGENCY_ADD"), &stru_1E20507A8, CFSTR("Localized"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = 0;
        }
        objc_msgSend(*(id *)(a1 + 40), "emergencyContactAction");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setAddingToEmergency:", v46 == 0);

        objc_msgSend(*(id *)(a1 + 40), "contactHeaderView");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setIsEmergencyContact:", v46 != 0);

        objc_msgSend(*(id *)(a1 + 40), "contactStore");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "emergencyContactAction");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setContactStore:", v52);

        if (v46)
          +[CNUIColorRepository contactListEmergencyContactGlyphColor](CNUIColorRepository, "contactListEmergencyContactGlyphColor");
        else
          +[CNUIColorRepository contactListEmergencyContactAddTextColor](CNUIColorRepository, "contactListEmergencyContactAddTextColor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "emergencyContactAction");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addAction:withTitle:color:transportType:wrapTitle:", v56, v49, v54, 0, 1);

      }
      objc_msgSend(*(id *)(a1 + 40), "displayGroups");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)MEMORY[0x1E0DC3F10];
      v68 = MEMORY[0x1E0C809B0];
      v69 = 3221225472;
      v70 = __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke_3;
      v71 = &unk_1E2050400;
      v59 = v57;
      v60 = *(_QWORD *)(a1 + 40);
      v72 = v59;
      v73 = v60;
      objc_msgSend(v58, "performWithoutAnimation:", &v68);
      objc_msgSend(*(id *)(a1 + 40), "emergencyNumberIdentifier", v68, v69, v70, v71);
      v61 = objc_claimAutoreleasedReturnValue();
      v62 = v6;
      if (v6 != (void *)v61)
      {
        v63 = (void *)v61;
        objc_msgSend(*(id *)(a1 + 40), "emergencyNumberIdentifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v6, "isEqualToString:", v64);

        if ((v65 & 1) != 0)
        {
LABEL_30:

          return;
        }
        objc_msgSend(*(id *)(a1 + 40), "setEmergencyNumberIdentifier:", v6);
        v66 = *(void **)(a1 + 40);
        objc_msgSend(v66, "propertyGroups");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E0C967C0]);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "reloadCardGroup:", v67);

      }
      goto LABEL_30;
    }
  }
}

void __62__CNContactContentDisplayViewController__reloadMedicalIDGroup__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "containsObject:", v3);

  v4 = *(void **)(a1 + 40);
  if ((_DWORD)v2)
  {
    objc_msgSend(v4, "cardMedicalIDGroup");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadCardGroup:", v5);

  }
  else
  {
    objc_msgSend(v4, "_addMedicalIDGroupAnimated:", 0);
  }
}

BOOL __68__CNContactContentDisplayViewController__addMedicalIDGroupAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cardShareLocationGroup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cardFooterGroup");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v3)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "cardBlockContactGroup");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v3)
      {
        v8 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "cardLinkedCardsGroup");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v8 = v7 == v3;

      }
    }

  }
  return v8;
}

BOOL __72__CNContactContentDisplayViewController__addShareLocationGroupAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cardFooterGroup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cardBlockContactGroup");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v3)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "cardLinkedCardsGroup");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
  }

  return v7;
}

uint64_t __63__CNContactContentDisplayViewController_shouldAddFaceTimeGroup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualIgnoringIdentifiers:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __61__CNContactContentDisplayViewController__reloadFaceTimeGroup__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  CNCardFaceTimeGroup *v5;
  void *v6;
  CNCardFaceTimeGroup *v7;
  id WeakRetained;

  if (objc_msgSend(a2, "isAvailable"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "faceTimeIDSLookupToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

    objc_msgSend(WeakRetained, "setFaceTimeIDSLookupToken:", 0);
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "cardFaceTimeGroup");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        v5 = [CNCardFaceTimeGroup alloc];
        objc_msgSend(WeakRetained, "mutableContact");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[CNCardGroup initWithContact:](v5, "initWithContact:", v6);
        objc_msgSend(WeakRetained, "setCardFaceTimeGroup:", v7);

        if ((objc_msgSend(WeakRetained, "needsReload") & 1) == 0)
          objc_msgSend(WeakRetained, "_addFaceTimeGroupAnimated:", 1);
      }
    }

  }
}

void __81__CNContactContentDisplayViewController__updateIMessageTransportButtonsForItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v12 = a2;
  objc_opt_class();
  objc_msgSend(v12, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__CNContactContentDisplayViewController__updateIMessageTransportButtonsForItems___block_invoke_2;
    v15[3] = &unk_1E204FCF8;
    v16 = v5;
    objc_msgSend(v6, "_cn_firstObjectPassingTest:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __81__CNContactContentDisplayViewController__updateIMessageTransportButtonsForItems___block_invoke_3;
    v13[3] = &unk_1E204FD20;
    v14 = v8;
    v10 = v8;
    objc_msgSend(v9, "_cn_firstObjectPassingTest:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsIMessage:", objc_msgSend(v12, "isAvailable"));

  }
}

uint64_t __81__CNContactContentDisplayViewController__updateIMessageTransportButtonsForItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2);
}

uint64_t __81__CNContactContentDisplayViewController__updateIMessageTransportButtonsForItems___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "contactProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contactProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __69__CNContactContentDisplayViewController__updateExistingContactAction__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v6 + 40);
  v7 = (id *)(v6 + 40);
  v8 = v9;
  if (v9)
  {
    *v7 = 0;

    *a3 = 1;
  }
  else
  {
    objc_storeStrong(v7, a2);
  }

}

uint64_t __64__CNContactContentDisplayViewController__setupSuggestionActions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuggested");
}

void __72__CNContactContentDisplayViewController_setupShareLocationActionReload___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  char v11;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (a2)
  {
    objc_msgSend(WeakRetained, "actionProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shareLocationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buildSharingLocationActionsWithShareLocationController:", v7);

    objc_initWeak(&location, v5);
    objc_msgSend(v5, "shareLocationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__CNContactContentDisplayViewController_setupShareLocationActionReload___block_invoke_2;
    v9[3] = &unk_1E204FC70;
    objc_copyWeak(&v10, &location);
    v11 = *(_BYTE *)(a1 + 40);
    objc_msgSend(v8, "isSharingWithCompletion:", v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __72__CNContactContentDisplayViewController_setupShareLocationActionReload___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained;
  _QWORD v5[5];
  char v6;
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__CNContactContentDisplayViewController_setupShareLocationActionReload___block_invoke_3;
  v5[3] = &unk_1E204ED98;
  v5[4] = WeakRetained;
  v6 = a2;
  v7 = *(_BYTE *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __72__CNContactContentDisplayViewController_setupShareLocationActionReload___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "actionProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appropriateLocationSharingActionWhenSharing:", *(unsigned __int8 *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "cardShareLocationGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:withTitle:", v7, v4);

  if (objc_msgSend(*(id *)(a1 + 32), "shouldAddShareLocationGroup"))
    objc_msgSend(*(id *)(a1 + 32), "_addShareLocationGroupAnimated:", 1);
  if (*(_BYTE *)(a1 + 41))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "cardShareLocationGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadCardGroup:", v6);

  }
}

void __80__CNContactContentDisplayViewController__retrieveActionsModelPreservingChanges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__CNContactContentDisplayViewController__retrieveActionsModelPreservingChanges___block_invoke_2;
  v8[3] = &unk_1E204FB90;
  v6 = v3;
  v9 = v6;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v7 = (id)objc_msgSend(v4, "consumer:actionModelsForContact:actionType:handler:", 0, v5, v6, v8);

  objc_destroyWeak(&v10);
}

void __80__CNContactContentDisplayViewController__retrieveActionsModelPreservingChanges___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *MEMORY[0x1E0C965F8]))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __80__CNContactContentDisplayViewController__retrieveActionsModelPreservingChanges___block_invoke_3;
    v4[3] = &unk_1E204F910;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

    objc_destroyWeak(&v6);
  }

}

void __80__CNContactContentDisplayViewController__retrieveActionsModelPreservingChanges___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setContactSupportsTTYCalls:", objc_msgSend((id)objc_opt_class(), "actionModelIncludesTTY:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(WeakRetained, "_updateAvailableTransports");

}

uint64_t __80__CNContactContentDisplayViewController_updateContactsViewWithBlock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__CNContactContentDisplayViewController_updateContactsViewWithBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 980);
  return objc_msgSend(*(id *)(a1 + 32), "reloadDataIfNeeded");
}

void __88__CNContactContentDisplayViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __83__CNContactContentDisplayViewController_setMenuProviderForCell_forActionGroupItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__CNContactContentDisplayViewController_setMenuProviderForCell_forActionGroupItem___block_invoke_2;
  v5[3] = &unk_1E204F9B0;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __83__CNContactContentDisplayViewController_setMenuProviderForCell_forActionGroupItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMenuProvider:", *(_QWORD *)(a1 + 40));
}

uint64_t __55__CNContactContentDisplayViewController_setNeedsReload__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadDataIfNeeded");
}

void __93__CNContactContentDisplayViewController_propertyCell_performActionForItem_withTransportType___block_invoke(uint64_t a1)
{
  CNPropertyTTYAction *v2;
  void *v3;
  CNPropertyTTYAction *v4;

  v2 = [CNPropertyTTYAction alloc];
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNPropertyAction initWithContact:propertyItem:](v2, "initWithContact:propertyItem:", v3, *(_QWORD *)(a1 + 40));

  -[CNContactAction setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[CNPropertyTTYAction performActionForItem:sender:](v4, "performActionForItem:sender:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __93__CNContactContentDisplayViewController_propertyCell_performActionForItem_withTransportType___block_invoke_2(uint64_t a1)
{
  CNPropertyTTYRelayAction *v2;
  void *v3;
  CNPropertyTTYRelayAction *v4;

  v2 = [CNPropertyTTYRelayAction alloc];
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNPropertyAction initWithContact:propertyItem:](v2, "initWithContact:propertyItem:", v3, *(_QWORD *)(a1 + 40));

  -[CNContactAction setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[CNPropertyTTYRelayAction performActionForItem:sender:](v4, "performActionForItem:sender:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __57__CNContactContentDisplayViewController_actionDidFinish___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "confirm");
  return objc_msgSend(*(id *)(a1 + 40), "reloadDataPreservingChanges:", 0);
}

uint64_t __88__CNContactContentDisplayViewController_sender_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t result;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[978])
  {
    objc_msgSend(v2, "_endDisablingInterfaceAutorotation");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 978) = 0;
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __92__CNContactContentDisplayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "contactView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(v2, "scrollRectToVisible:animated:", 0);

}

uint64_t __81__CNContactContentDisplayViewController_setupViewHierarchyIncludingAvatarHeader___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertSubview:atIndex:", a2, 0);
}

uint64_t __81__CNContactContentDisplayViewController_setupViewHierarchyIncludingAvatarHeader___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

uint64_t __81__CNContactContentDisplayViewController_removeActionWithTarget_selector_inGroup___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "matchesTarget:selector:group:inContactContentViewController:", a1[4], a1[7], a1[5], a1[6]) ^ 1;
}

uint64_t __69__CNContactContentDisplayViewController_reloadDataPreservingChanges___block_invoke_246(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addFaceTimeGroupAnimated:", 0);
}

uint64_t __69__CNContactContentDisplayViewController_reloadDataPreservingChanges___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuggested");
}

void __79__CNContactContentDisplayViewController_contactStoreDidChangeWithNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BYTE *v11;
  void *v12;
  id v13;

  if ((objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreContactStoreDidChangeNotification") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C97088]);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C97090]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 32), "issuedSaveRequestIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && (objc_msgSend(v13, "BOOLValue") & 1) != 0
      || !objc_msgSend(v8, "count")
      || !objc_msgSend(v5, "count")
      || (objc_msgSend(v5, "isSubsetOfSet:", v8) & 1) == 0)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded")
        && (objc_msgSend(*(id *)(a1 + 32), "view"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v9, "window"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v10,
            v9,
            !v10))
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 977) = 1;
      }
      else
      {
        v11 = *(_BYTE **)(a1 + 32);
        if (!v11[979])
        {
          objc_msgSend(v11, "contactViewCache");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "resetCache");

          objc_msgSend(*(id *)(a1 + 32), "_refetchContact");
        }
      }
    }

  }
}

uint64_t __52__CNContactContentDisplayViewController_setContact___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumeBackgroundScheduler");
}

uint64_t __52__CNContactContentDisplayViewController_setContact___block_invoke_234(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValidForContact:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024));
}

id __72__CNContactContentDisplayViewController_setForcesTransparentBackground___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "applyContactStyle");
}

+ (id)descriptorForRequiredKeysForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableKeyDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v5;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactContentDisplayViewController descriptorForRequiredKeysForContact:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptorWithKeyDescriptors:description:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)descriptorForRequiredKeys
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactContentDisplayViewController descriptorForRequiredKeys]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptorForRequiredKeysWithDescription:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)tableViewStyle
{
  return 1;
}

+ (id)descriptorForRequiredKeysWithDescription:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__CNContactContentDisplayViewController_descriptorForRequiredKeysWithDescription___block_invoke;
  block[3] = &unk_1E204F648;
  v11 = v3;
  v4 = descriptorForRequiredKeysWithDescription__cn_once_token_7_55797;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&descriptorForRequiredKeysWithDescription__cn_once_token_7_55797, block);
    v7 = v11;
  }
  v8 = (id)descriptorForRequiredKeysWithDescription__cn_once_object_7_55798;

  return v8;
}

+ (BOOL)actionModelIncludesTTY:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "allActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_cn_any:", &__block_literal_global_494);

  return v4;
}

+ (BOOL)shouldShowGeminiForResult:(id)a3 contact:(id)a4
{
  void *v4;
  void *v5;
  id v7;
  void *v8;
  BOOL v9;
  int v10;
  void *v11;

  v7 = a3;
  if (v7)
  {
    objc_msgSend(a4, "phoneNumbers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") && objc_msgSend(MEMORY[0x1E0C97310], "deviceSupportsGemini"))
    {
      objc_msgSend(v7, "availableChannels");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v4, "count") > 1)
      {
        v9 = 1;
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      objc_msgSend(v7, "channel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 1;
      v9 = 1;
      if (!objc_msgSend(v5, "isAvailable"))
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v7, "channel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_msgSend(v11, "isAvailable") & 1) == 0 && objc_msgSend(v7, "usage") == 1;

    if (!v10)
      goto LABEL_16;
    goto LABEL_14;
  }
  v9 = 0;
LABEL_17:

  return v9;
}

+ (id)BOOLStateRestorationProperties
{
  return &unk_1E20D3928;
}

+ (CNContactContentDisplayViewController)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CNContactContentViewController *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v7 = (void *)MEMORY[0x1E0C97200];
  +[CNContactContentViewController descriptorForRequiredKeys](CNContactContentViewController, "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactWithStateRestorationCoder:store:keys:", v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v20 = v6;
    v11 = -[CNContactContentViewController initWithContact:]([CNContactContentViewController alloc], "initWithContact:", v10);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(a1, "BOOLStateRestorationProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
          objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            -[CNContactContentViewController setValue:forKey:](v11, "setValue:forKey:", v18, v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    v6 = v20;
  }
  else
  {
    v11 = 0;
  }

  return (CNContactContentDisplayViewController *)v11;
}

uint64_t __64__CNContactContentDisplayViewController_actionModelIncludesTTY___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0C96638]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0C96648]);

  }
  return v4;
}

void __82__CNContactContentDisplayViewController_descriptorForRequiredKeysWithDescription___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[52];

  v13[51] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97310], "descriptorForRequiredKeys", *MEMORY[0x1E0C966E8], *MEMORY[0x1E0C96768], *MEMORY[0x1E0C96790], *MEMORY[0x1E0C966D0], *MEMORY[0x1E0C96780], *MEMORY[0x1E0C966C0], *MEMORY[0x1E0C96820], *MEMORY[0x1E0C96798], *MEMORY[0x1E0C967A0], *MEMORY[0x1E0C967D8], *MEMORY[0x1E0C967E0], *MEMORY[0x1E0C967D0], *MEMORY[0x1E0C967B8], *MEMORY[0x1E0C967E8], *MEMORY[0x1E0C96698], *MEMORY[0x1E0C96758], *MEMORY[0x1E0C96668],
    *MEMORY[0x1E0C96670],
    *MEMORY[0x1E0C967A8],
    *MEMORY[0x1E0C967B0],
    *MEMORY[0x1E0C96708],
    *MEMORY[0x1E0C96890],
    *MEMORY[0x1E0C96700],
    *MEMORY[0x1E0C96898],
    *MEMORY[0x1E0C967C0],
    *MEMORY[0x1E0C966A8],
    *MEMORY[0x1E0C967F0],
    *MEMORY[0x1E0C96690],
    *MEMORY[0x1E0C968A0],
    *MEMORY[0x1E0C96840],
    *MEMORY[0x1E0C96868],
    *MEMORY[0x1E0C96740],
    *MEMORY[0x1E0C966E0],
    *MEMORY[0x1E0C96768],
    *MEMORY[0x1E0C96680],
    *MEMORY[0x1E0C96888],
    *MEMORY[0x1E0C96688],
    *MEMORY[0x1E0C96770],
    *MEMORY[0x1E0C96678],
    *MEMORY[0x1E0C96728],
    *MEMORY[0x1E0C96710],
    *MEMORY[0x1E0D13C50],
    *MEMORY[0x1E0C96778],
    *MEMORY[0x1E0C967C8],
    *MEMORY[0x1E0C966C8],
    *MEMORY[0x1E0C96830],
    *MEMORY[0x1E0C96828]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C966A0];
  v13[47] = v2;
  v13[48] = v3;
  objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[49] = v5;
  objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactHeaderDisplayView descriptorForRequiredKeysForContactFormatter:](CNContactHeaderDisplayView, "descriptorForRequiredKeysForContactFormatter:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[50] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 51);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNSiriContactContextProvider descriptorForRequiredKeys](CNSiriContactContextProvider, "descriptorForRequiredKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "arrayByAddingObject:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0C97200], "descriptorWithKeyDescriptors:description:", v8, *(_QWORD *)(a1 + 32));
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)descriptorForRequiredKeysWithDescription__cn_once_object_7_55798;
  descriptorForRequiredKeysWithDescription__cn_once_object_7_55798 = v11;

}

@end
