@implementation CNAutocompleteSearchController

- (BOOL)shouldUseScreenRelativeFooterViewPositioning
{
  if (shouldUseScreenRelativeFooterViewPositioning_cn_once_token_1 != -1)
    dispatch_once(&shouldUseScreenRelativeFooterViewPositioning_cn_once_token_1, &__block_literal_global_8);
  return objc_msgSend((id)shouldUseScreenRelativeFooterViewPositioning_cn_once_object_1, "BOOLValue");
}

void __78__CNAutocompleteSearchController_shouldUseScreenRelativeFooterViewPositioning__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberWithBool:", objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.InCallService.RemotePeoplePicker")));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)shouldUseScreenRelativeFooterViewPositioning_cn_once_object_1;
  shouldUseScreenRelativeFooterViewPositioning_cn_once_object_1 = v2;

}

- (CNAutocompleteSearchController)initWithSearchType:(unint64_t)a3
{
  return -[CNAutocompleteSearchController initWithSearchType:options:](self, "initWithSearchType:options:", a3, 0);
}

- (CNAutocompleteSearchController)initWithSearchType:(unint64_t)a3 options:(id)a4
{
  id v6;
  CNAutocompleteSearchControllerOptions *v7;
  CNAutocompleteSearchControllerOptions *options;
  CNAutocompleteSearchManager *v9;
  CNComposeRecipientTextView *v10;
  CNAutocompleteResultsTableViewController *v11;
  CNAutocompleteSearchController *v12;

  v6 = a4;
  v7 = (CNAutocompleteSearchControllerOptions *)objc_msgSend(v6, "copy");
  options = self->_options;
  self->_options = v7;

  v9 = -[CNAutocompleteSearchManager initWithAutocompleteSearchType:]([CNAutocompleteSearchManager alloc], "initWithAutocompleteSearchType:", a3);
  v10 = -[CNComposeRecipientTextView initWithOptions:]([CNComposeRecipientTextView alloc], "initWithOptions:", v6);
  v11 = -[CNAutocompleteResultsTableViewController initWithOptions:]([CNAutocompleteResultsTableViewController alloc], "initWithOptions:", v6);

  v12 = -[CNAutocompleteSearchController initWithSearchManager:textView:resultsController:](self, "initWithSearchManager:textView:resultsController:", v9, v10, v11);
  return v12;
}

- (CNAutocompleteSearchController)initWithSearchManager:(id)a3 textView:(id)a4 resultsController:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNAutocompleteSearchController *v12;
  CNAutocompleteSearchController *v13;
  CNAutocompleteSuggestionsViewController *v14;
  CNAutocompleteSuggestionsViewController *suggestionsController;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CNAutocompleteSearchController *v23;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CNAutocompleteSearchController;
  v12 = -[CNAutocompleteSearchController initWithNibName:bundle:](&v25, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_searchManager, a3);
    -[CNAutocompleteSearchManager setFetchDelegate:](v13->_searchManager, "setFetchDelegate:", v13);
    objc_storeStrong((id *)&v13->_composeField, a4);
    -[CNComposeHeaderView setDelegate:](v13->_composeField, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_resultsController, a5);
    -[CNAutocompleteResultsTableViewController setDelegate:](v13->_resultsController, "setDelegate:", v13);
    v14 = -[CNAutocompleteSuggestionsViewController initWithSearchType:]([CNAutocompleteSuggestionsViewController alloc], "initWithSearchType:", objc_msgSend(v9, "autocompleteSearchType"));
    suggestionsController = v13->_suggestionsController;
    v13->_suggestionsController = v14;

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsViewController view](v13->_suggestionsController, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v16);

    -[CNAutocompleteSuggestionsViewController setDelegate:](v13->_suggestionsController, "setDelegate:", v13);
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_isiPhone = objc_msgSend(v18, "userInterfaceIdiom") == 0;

    -[CNAutocompleteSearchController setSuggestionsHeaderTitleOverride:](v13, "setSuggestionsHeaderTitleOverride:", 0);
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "featureFlags");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_shouldHideSuggestionsAfterFirstRecipient = objc_msgSend(v20, "isFeatureEnabled:", 17) ^ 1;

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v13->_hasSmallScreen = v22 <= 667.0;

    v23 = v13;
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController keyboardWillShowNotificationObserver](self, "keyboardWillShowNotificationObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  -[CNAutocompleteSearchController keyboardWillHideNotificationObserver](self, "keyboardWillHideNotificationObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v5);

  -[CNAutocompleteSearchController uiContentSizeCategoryDidChangeNotificationObserver](self, "uiContentSizeCategoryDidChangeNotificationObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v6);

  v7.receiver = self;
  v7.super_class = (Class)CNAutocompleteSearchController;
  -[CNAutocompleteSearchController dealloc](&v7, sel_dealloc);
}

- (void)setRecipients:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecipients:", v4);

}

- (NSArray)recipients
{
  void *v2;
  void *v3;

  -[CNAutocompleteSearchController composeField](self, "composeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setDelegate:(id)a3
{
  CNAutocompleteSearchControllerSafeDelegateWrapper *v4;
  id v5;

  if (a3)
  {
    v4 = -[CNAutocompleteSearchControllerSafeDelegateWrapper initWithDelegate:]([CNAutocompleteSearchControllerSafeDelegateWrapper alloc], "initWithDelegate:", a3);
    -[CNAutocompleteSearchController setDelegateWrapper:](self, "setDelegateWrapper:", v4);

  }
  else
  {
    v5 = 0;
    -[CNAutocompleteSearchController setDelegateWrapper:](self, "setDelegateWrapper:", 0);
  }
  objc_storeWeak((id *)&self->_delegate, a3);

}

- (void)setOtherRecipientAddresses:(id)a3
{
  void *v4;
  NSArray *v5;
  void *v6;
  NSArray *expandedOtherRecipientAddresses;
  id v8;

  v8 = a3;
  if ((-[NSArray isEqual:](self->_otherRecipientAddresses, "isEqual:") & 1) == 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97320]), "initWithHandles:", v8);
    objc_msgSend(v4, "expandedHandles");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOtherRecipientAddresses:", v5);

    expandedOtherRecipientAddresses = self->_expandedOtherRecipientAddresses;
    self->_expandedOtherRecipientAddresses = v5;

  }
}

- (void)setPresentationOptions:(unint64_t)a3 forRecipient:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAtomPresentationOptions:forRecipient:", a3, v6);

}

- (void)setTintColor:(id)a3 forRecipient:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:forRecipient:", v7, v6);

}

- (void)setPreferredRecipient:(id)a3 forRecipient:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredRecipient:forRecipient:", v7, v6);

}

- (void)setComposeFieldInfoText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setComposeFieldInfoText:", v4);

}

- (NSString)composeFieldInfoText
{
  void *v2;
  void *v3;

  -[CNAutocompleteSearchController composeField](self, "composeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "composeFieldInfoText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setHeaderView:(id)a3
{
  UIView *v5;
  UIView **p_headerView;
  UIView *headerView;
  void *v8;
  void *v9;
  void *v10;
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
  void *v21;
  UIView *v22;

  v5 = (UIView *)a3;
  p_headerView = &self->_headerView;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    v22 = v5;
    -[UIView superview](headerView, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSearchController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[UIView removeFromSuperview](*p_headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    -[CNAutocompleteSearchController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", *p_headerView);

    -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "additionalContentInsets");
    v13 = v12;
    v15 = v14;
    v17 = v16;

    -[UIView frame](v22, "frame");
    v19 = v18;
    -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAdditionalContentInsets:", v19, v13, v15, v17);

    -[CNAutocompleteSearchController latestKeyboardFrame](self, "latestKeyboardFrame");
    -[CNAutocompleteSearchController adjustInsetsForKeyboardFrame:](self, "adjustInsetsForKeyboardFrame:");
    -[CNAutocompleteSearchController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNeedsLayout");

    -[CNAutocompleteSearchController updateHeaderFooterVisibility](self, "updateHeaderFooterVisibility");
    v5 = v22;
  }

}

- (void)setFooterView:(id)a3
{
  UIView *v5;
  UIView **p_footerView;
  UIView *footerView;
  void *v8;
  void *v9;
  void *v10;
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
  void *v21;
  UIView *v22;

  v5 = (UIView *)a3;
  p_footerView = &self->_footerView;
  footerView = self->_footerView;
  if (footerView != v5)
  {
    v22 = v5;
    -[UIView superview](footerView, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSearchController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[UIView removeFromSuperview](*p_footerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_footerView, a3);
    -[CNAutocompleteSearchController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", *p_footerView);

    -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "additionalContentInsets");
    v13 = v12;
    v15 = v14;
    v17 = v16;

    -[UIView frame](v22, "frame");
    v19 = v18;
    -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAdditionalContentInsets:", v13, v15, v19, v17);

    -[CNAutocompleteSearchController latestKeyboardFrame](self, "latestKeyboardFrame");
    -[CNAutocompleteSearchController adjustInsetsForKeyboardFrame:](self, "adjustInsetsForKeyboardFrame:");
    -[CNAutocompleteSearchController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNeedsLayout");

    -[CNAutocompleteSearchController updateHeaderFooterVisibility](self, "updateHeaderFooterVisibility");
    v5 = v22;
  }

}

- (void)setExpandRecipientsInNamedGroups:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExpandRecipientsInNamedGroups:", v3);

}

- (BOOL)expandRecipientsInNamedGroups
{
  void *v2;
  char v3;

  -[CNAutocompleteSearchController composeField](self, "composeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "expandRecipientsInNamedGroups");

  return v3;
}

- (void)setWantsAddButton:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsAddButtonWhenExpanded:", v3);

}

- (BOOL)wantsAddButton
{
  void *v2;
  char v3;

  -[CNAutocompleteSearchController composeField](self, "composeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsAddButtonWhenExpanded");

  return v3;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[CNAutocompleteSearchController composeField](self, "composeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[CNAutocompleteSearchController setRecipients:](self, "setRecipients:", MEMORY[0x1E0C9AA60]);
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearText");

  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[CNAutocompleteSearchController setLatestKeyboardFrame:](self, "setLatestKeyboardFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[CNAutocompleteSearchController hideResultsController](self, "hideResultsController");
  -[CNAutocompleteSearchController setHeaderView:](self, "setHeaderView:", 0);
  -[CNAutocompleteSearchController setFooterView:](self, "setFooterView:", 0);
  -[CNAutocompleteSearchController setLatestKeyboardFrame:](self, "setLatestKeyboardFrame:", v4, v5, v6, v7);
  -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prepareForReuse");

  -[CNAutocompleteSearchController latestKeyboardFrame](self, "latestKeyboardFrame");
  -[CNAutocompleteSearchController adjustInsetsForKeyboardFrame:](self, "adjustInsetsForKeyboardFrame:");
  -[CNAutocompleteSearchController currentTaskID](self, "currentTaskID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CNAutocompleteSearchController searchManager](self, "searchManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSearchController currentTaskID](self, "currentTaskID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancelTaskWithID:", v11);

    -[CNAutocompleteSearchController setCurrentTaskID:](self, "setCurrentTaskID:", 0);
  }
}

- (void)setSuggestionsHeaderTitleOverride:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    -[CNAutocompleteSuggestionsViewController setSuggestionsHeaderTitle:](self->_suggestionsController, "setSuggestionsHeaderTitle:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ZKW_SUGGESTIONS"), &stru_1E62C0368, CFSTR("Localized"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSuggestionsViewController setSuggestionsHeaderTitle:](self->_suggestionsController, "setSuggestionsHeaderTitle:", v4);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  void *v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
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
  double MaxY;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
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
  double v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void (*v101)(uint64_t);
  void *v102;
  id v103;
  _QWORD v104[4];
  id v105;
  _QWORD v106[4];
  id v107;
  id location;
  objc_super v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  v109.receiver = self;
  v109.super_class = (Class)CNAutocompleteSearchController;
  -[CNAutocompleteSearchController viewDidLoad](&v109, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[CNAutocompleteSearchController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;
  -[CNAutocompleteSearchController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  +[CNComposeHeaderView preferredHeight](CNComposeRecipientTextView, "preferredHeight");
  v12 = v11;
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", 0.0, v7, v10, v12);

  v14 = objc_alloc(MEMORY[0x1E0CEA970]);
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v16 = (void *)objc_msgSend(v14, "initWithFrame:");
  -[CNAutocompleteSearchController setComposeFieldScrollView:](self, "setComposeFieldScrollView:", v16);

  -[CNAutocompleteSearchController composeFieldScrollView](self, "composeFieldScrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAutoresizingMask:", 2);

  -[CNAutocompleteSearchController composeFieldScrollView](self, "composeFieldScrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setShowsHorizontalScrollIndicator:", 0);

  -[CNAutocompleteSearchController composeFieldScrollView](self, "composeFieldScrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setScrollsToTop:", 0);

  -[CNAutocompleteSearchController composeFieldScrollView](self, "composeFieldScrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBounces:", 0);

  -[CNAutocompleteSearchController composeFieldScrollView](self, "composeFieldScrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAutoresizesSubviews:", 0);

  -[CNAutocompleteSearchController composeFieldScrollView](self, "composeFieldScrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v23);

  v24 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[CNAutocompleteSearchController setComposeFieldContainerView:](self, "setComposeFieldContainerView:", v24);

  -[CNAutocompleteSearchController composeField](self, "composeField");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[CNAutocompleteSearchController composeFieldContainerView](self, "composeFieldContainerView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

  -[CNAutocompleteSearchController composeFieldContainerView](self, "composeFieldContainerView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAutoresizingMask:", 2);

  -[CNAutocompleteSearchController composeFieldContainerView](self, "composeFieldContainerView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController composeFieldScrollView](self, "composeFieldScrollView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", v37);

  -[CNAutocompleteSearchController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController composeFieldContainerView](self, "composeFieldContainerView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addSubview:", v39);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("TO"), &stru_1E62C0368, CFSTR("Localized"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setLabel:", v41);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setBackgroundColor:", v43);

  -[CNAutocompleteSearchController composeField](self, "composeField");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setAutoresizingMask:", 2);

  -[CNAutocompleteSearchController composeField](self, "composeField");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "frame");
  MaxY = CGRectGetMaxY(v110);
  -[CNAutocompleteSearchController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bounds");
  v50 = v49;
  -[CNAutocompleteSearchController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bounds");
  v53 = v52;
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "frame");
  v55 = v53 - CGRectGetMaxY(v111);
  -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setFrame:", 0.0, MaxY, v50, v55);

  -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "view");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setAutoresizingMask:", 2);

  -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "willMoveToParentViewController:", self);

  -[CNAutocompleteSearchController view](self, "view");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addSubview:", v63);

  -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController addChildViewController:](self, "addChildViewController:", v64);

  -[CNAutocompleteSearchController showSuggestionsController](self, "showSuggestionsController");
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "frame");
  v66 = CGRectGetMaxY(v112);
  -[CNAutocompleteSearchController view](self, "view");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "bounds");
  v69 = v68;
  -[CNAutocompleteSearchController view](self, "view");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bounds");
  v72 = v71;
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "frame");
  v74 = CGRectGetMaxY(v113);
  -[CNAutocompleteSearchController view](self, "view");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "safeAreaInsets");
  v77 = v72 - (v74 + v76);
  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "view");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setFrame:", 0.0, v66, v69, v77);

  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "view");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setAutoresizingMask:", 2);

  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "view");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setHidden:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "view");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setBackgroundColor:", v84);

  -[CNAutocompleteSearchController view](self, "view");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "view");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "addSubview:", v89);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v91 = *MEMORY[0x1E0CEB978];
  v92 = MEMORY[0x1E0C809B0];
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = __45__CNAutocompleteSearchController_viewDidLoad__block_invoke;
  v106[3] = &unk_1E62BF170;
  objc_copyWeak(&v107, &location);
  objc_msgSend(v90, "addObserverForName:object:queue:usingBlock:", v91, 0, 0, v106);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController setKeyboardWillShowNotificationObserver:](self, "setKeyboardWillShowNotificationObserver:", v93);

  v94 = *MEMORY[0x1E0CEB970];
  v104[0] = v92;
  v104[1] = 3221225472;
  v104[2] = __45__CNAutocompleteSearchController_viewDidLoad__block_invoke_2;
  v104[3] = &unk_1E62BF170;
  objc_copyWeak(&v105, &location);
  objc_msgSend(v90, "addObserverForName:object:queue:usingBlock:", v94, 0, 0, v104);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController setKeyboardWillHideNotificationObserver:](self, "setKeyboardWillHideNotificationObserver:", v95);

  v96 = *MEMORY[0x1E0CEB3F0];
  v99 = v92;
  v100 = 3221225472;
  v101 = __45__CNAutocompleteSearchController_viewDidLoad__block_invoke_3;
  v102 = &unk_1E62BF170;
  objc_copyWeak(&v103, &location);
  objc_msgSend(v90, "addObserverForName:object:queue:usingBlock:", v96, 0, 0, &v99);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController setUiContentSizeCategoryDidChangeNotificationObserver:](self, "setUiContentSizeCategoryDidChangeNotificationObserver:", v97, v99, v100, v101, v102);

  -[CNAutocompleteSearchController composeField](self, "composeField");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "becomeFirstResponder");

  objc_destroyWeak(&v103);
  objc_destroyWeak(&v105);
  objc_destroyWeak(&v107);
  objc_destroyWeak(&location);

}

void __45__CNAutocompleteSearchController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "composeField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsingActiveAppearance:animated:", 1, 0);

  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CEB890]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  objc_msgSend(WeakRetained, "setLatestKeyboardFrame:");

  objc_msgSend(WeakRetained, "latestKeyboardFrame");
  objc_msgSend(WeakRetained, "adjustInsetsForKeyboardFrame:");

}

void __45__CNAutocompleteSearchController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "suggestionsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useAccessibleLayout");

  if (v5)
  {
    objc_msgSend(WeakRetained, "composeField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUsingActiveAppearance:animated:", 0, 0);

  }
  if (objc_msgSend(WeakRetained, "shouldUseScreenRelativeFooterViewPositioning"))
  {
    objc_msgSend(WeakRetained, "setLatestKeyboardFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  else
  {
    objc_msgSend(v9, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CEB890]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CGRectValue");
    objc_msgSend(WeakRetained, "setLatestKeyboardFrame:");

  }
  objc_msgSend(WeakRetained, "latestKeyboardFrame");
  objc_msgSend(WeakRetained, "adjustInsetsForKeyboardFrame:");

}

void __45__CNAutocompleteSearchController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "suggestionsAllowed"))
    objc_msgSend(WeakRetained, "showSuggestionsController");
  else
    objc_msgSend(WeakRetained, "hideSuggestionsController");

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CNAutocompleteSearchController providePeopleSuggesterFeedbackForViewWillAppear](self, "providePeopleSuggesterFeedbackForViewWillAppear");
  v5.receiver = self;
  v5.super_class = (Class)CNAutocompleteSearchController;
  -[CNAutocompleteSearchController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CNAutocompleteSearchController providePeopleSuggesterFeedbackForViewWillDisappear](self, "providePeopleSuggesterFeedbackForViewWillDisappear");
  v5.receiver = self;
  v5.super_class = (Class)CNAutocompleteSearchController;
  -[CNAutocompleteSearchController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewWillLayoutSubviews
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;

  if (-[CNAutocompleteSearchController shouldUseScreenRelativeFooterViewPositioning](self, "shouldUseScreenRelativeFooterViewPositioning"))
  {
    if (!-[CNAutocompleteSearchController finalWindowAttached](self, "finalWindowAttached"))
    {
      -[CNAutocompleteSearchController latestKeyboardFrame](self, "latestKeyboardFrame");
      if (v3 > 0.0)
      {
        if (-[CNAutocompleteSearchController isViewLoaded](self, "isViewLoaded"))
        {
          -[CNAutocompleteSearchController view](self, "view");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "window");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v5 = 0;
        }
        objc_msgSend(v5, "screen");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(v5, "bounds");
          v8 = v7;
          objc_msgSend(v6, "bounds");
          if (v8 != v9)
          {
            v10 = v9;
            -[CNAutocompleteSearchController setFinalWindowAttached:](self, "setFinalWindowAttached:", 1);
            v11 = v10 - v8;
            -[CNAutocompleteSearchController traitCollection](self, "traitCollection");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "horizontalSizeClass");

            if (v13 == 2)
              v14 = v11 * 0.5;
            else
              v14 = v11;
            -[CNAutocompleteSearchController latestKeyboardFrame](self, "latestKeyboardFrame");
            v16 = v15;
            v18 = v17;
            v20 = v19;
            v22 = v21 - v14;
            -[CNAutocompleteSearchController setLatestKeyboardFrame:](self, "setLatestKeyboardFrame:");
            -[CNAutocompleteSearchController updateFooterPositionWithKeyboardFrame:](self, "updateFooterPositionWithKeyboardFrame:", v16, v22, v18, v20);
          }
        }

      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)CNAutocompleteSearchController;
  -[CNAutocompleteSearchController viewWillLayoutSubviews](&v23, sel_viewWillLayoutSubviews);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double MaxY;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  objc_super v86;
  CGRect v87;
  CGRect v88;

  -[CNAutocompleteSearchController composeField](self, "composeField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[CNAutocompleteSearchController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7 + -16.0;
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", 8.0, 0.0, v8, v5);

  -[CNAutocompleteSearchController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeAreaInsets");
  v12 = v11;
  -[CNAutocompleteSearchController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  -[CNAutocompleteSearchController composeFieldScrollView](self, "composeFieldScrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  -[CNAutocompleteSearchController composeFieldContainerView](self, "composeFieldContainerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", 0.0, v12, v15, v18);

  -[CNAutocompleteSearchController composeFieldContainerView](self, "composeFieldContainerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  MaxY = CGRectGetMaxY(v87);
  -[CNAutocompleteSearchController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v24 = v23;
  -[CNAutocompleteSearchController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v27 = v26;
  -[CNAutocompleteSearchController composeFieldContainerView](self, "composeFieldContainerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  v29 = v27 - CGRectGetMaxY(v88);
  -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", 0.0, MaxY, v24, v29);

  -[CNAutocompleteSearchController updateResultsControllerFrame](self, "updateResultsControllerFrame");
  -[CNAutocompleteSearchController headerView](self, "headerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[CNAutocompleteSearchController headerView](self, "headerView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v35 = v34;
    v37 = v36;

    -[CNAutocompleteSearchController view](self, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bounds");
    v40 = v39;

    -[CNAutocompleteSearchController headerView](self, "headerView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFrame:", 0.0, v35, v40, v37);

    -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "useAccessibleLayout");

    if (v43)
    {
      -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "view");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "frame");
      v47 = v46;
      v49 = v48;
      v51 = v50;
      v53 = v52;

      -[CNAutocompleteSearchController headerView](self, "headerView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "bounds");
      v56 = v49 + v55;

      -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "view");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setFrame:", v47, v56, v51, v53);

    }
  }
  -[CNAutocompleteSearchController footerView](self, "footerView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    -[CNAutocompleteSearchController footerView](self, "footerView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "frame");
    v62 = v61;
    v64 = v63;

    -[CNAutocompleteSearchController view](self, "view");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "bounds");
    v67 = v66;

    -[CNAutocompleteSearchController footerView](self, "footerView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setFrame:", 0.0, v62, v67, v64);

    -[CNAutocompleteSearchController latestKeyboardFrame](self, "latestKeyboardFrame");
    -[CNAutocompleteSearchController updateFooterPositionWithKeyboardFrame:](self, "updateFooterPositionWithKeyboardFrame:");
    -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "useAccessibleLayout");

    if (v70)
    {
      -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "view");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "frame");
      v74 = v73;
      v76 = v75;
      v78 = v77;
      v80 = v79;

      -[CNAutocompleteSearchController footerView](self, "footerView");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "bounds");
      v83 = v80 - v82;

      -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "view");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setFrame:", v74, v76, v78, v83);

    }
  }
  v86.receiver = self;
  v86.super_class = (Class)CNAutocompleteSearchController;
  -[CNAutocompleteSearchController viewDidLayoutSubviews](&v86, sel_viewDidLayoutSubviews);
}

- (void)updateResultsControllerFrame
{
  double MaxY;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  CGRect v21;
  CGRect v22;

  -[CNAutocompleteSearchController composeFieldContainerView](self, "composeFieldContainerView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  MaxY = CGRectGetMaxY(v21);
  -[CNAutocompleteSearchController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  -[CNAutocompleteSearchController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  -[CNAutocompleteSearchController composeFieldContainerView](self, "composeFieldContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v11 = CGRectGetMaxY(v22);
  -[CNAutocompleteSearchController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaInsets");
  v14 = v11 + v13;
  -[CNAutocompleteSearchController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeAreaInsets");
  v17 = v9 - (v14 + v16);
  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", 0.0, MaxY, v6, v17);

}

- (BOOL)hasSpaceToDisplaySuggestions
{
  void *v3;
  char v4;

  if (!-[CNAutocompleteSearchController hasSmallScreen](self, "hasSmallScreen"))
    return 1;
  -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useAccessibleLayout");

  return v4 ^ 1;
}

- (void)addRecipient:(id)a3
{
  id v4;

  v4 = a3;
  -[CNAutocompleteSearchController setDidAddRecipientFromTypedQuery:](self, "setDidAddRecipientFromTypedQuery:", 1);
  -[CNAutocompleteSearchController _addRecipient:](self, "_addRecipient:", v4);
  -[CNAutocompleteSearchController providePeopleSuggesterFeedbackForTypedRecipient:](self, "providePeopleSuggesterFeedbackForTypedRecipient:", v4);

}

- (void)_addRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[CNAutocompleteSearchController recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__CNAutocompleteSearchController__addRecipient___block_invoke;
  v8[3] = &unk_1E62BEE78;
  v7 = v4;
  v9 = v7;
  LOBYTE(v4) = objc_msgSend(v5, "_cn_any:", v8);

  if ((v4 & 1) == 0)
  {
    -[CNAutocompleteSearchController composeField](self, "composeField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addRecipient:", v7);

    -[CNAutocompleteSearchController scrollToBottomOfRecipientView](self, "scrollToBottomOfRecipientView");
  }

}

uint64_t __48__CNAutocompleteSearchController__addRecipient___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", v4);

  return v5;
}

- (void)disambiguateRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateRecipients:disambiguatingRecipient:", v6, v4);

  -[CNAutocompleteSearchController unhideResultsController](self, "unhideResultsController");
}

- (void)unhideResultsController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CNAutocompleteSearchController setShouldRestoreFirstResponderToComposeField:](self, "setShouldRestoreFirstResponderToComposeField:", 0);
  -[CNAutocompleteSearchController updateHeaderFooterVisibility](self, "updateHeaderFooterVisibility");
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchController:willShowResultsView:", self, v5);

  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

  -[CNAutocompleteSearchController hideSuggestionsController](self, "hideSuggestionsController");
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchController:didShowResultsView:", self, v9);

}

- (void)hideResultsController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CNAutocompleteSearchController updateHeaderFooterVisibility](self, "updateHeaderFooterVisibility");
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchController:willHideResultsView:", self, v5);

  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchController:didHideResultsView:", self, v9);

}

- (void)showSuggestionsController
{
  uint64_t v3;
  void *v4;
  id v5;

  -[CNAutocompleteSearchController setSuggestionsAllowed:](self, "setSuggestionsAllowed:", 1);
  v3 = -[CNAutocompleteSearchController hasSpaceToDisplaySuggestions](self, "hasSpaceToDisplaySuggestions") ^ 1;
  -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)hideSuggestionsController
{
  void *v3;
  id v4;

  -[CNAutocompleteSearchController setSuggestionsAllowed:](self, "setSuggestionsAllowed:", 0);
  -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

}

- (void)invalidateRecipientTintColors
{
  void *v3;
  id v4;

  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateAddressTintColors");

  -[CNAutocompleteSearchController composeField](self, "composeField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateAtomPresentationOptions");

}

- (void)invalidatePreferredRecipients
{
  id v2;

  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidatePreferredRecipients");

}

- (void)adjustInsetsForKeyboardFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  id v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableView");
  v45 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = height;
  objc_msgSend(v9, "convertRect:fromWindow:", 0, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(v45, "convertRect:fromView:", 0, v11, v13, v15, v17);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v45, "frame");
  v48.origin.x = v19;
  v48.origin.y = v21;
  v48.size.width = v23;
  v48.size.height = v25;
  v47 = CGRectIntersection(v46, v48);
  v26 = CGRectGetHeight(v47);
  -[CNAutocompleteSearchController footerView](self, "footerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[CNAutocompleteSearchController footerView](self, "footerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    v30 = v29;

  }
  else
  {
    v30 = 0.0;
  }

  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "tableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "contentInset");
  v34 = v33;
  v36 = v35;
  v38 = v37;

  v39 = v26 + v30;
  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "tableView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setContentInset:", v34, v36, v39, v38);

  -[CNAutocompleteSearchController resultsController](self, "resultsController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "tableView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setScrollIndicatorInsets:", v34, v36, v39, v38);

  -[CNAutocompleteSearchController updateFooterPositionWithKeyboardFrame:](self, "updateFooterPositionWithKeyboardFrame:", x, y, width, v44);
}

- (void)updateFooterPositionWithKeyboardFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[CNAutocompleteSearchController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNAutocompleteSearchController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CNAutocompleteSearchController view](self, "view");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "convertRect:fromWindow:", 0, x, y, width, height);
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

      objc_msgSend(v27, "convertRect:fromView:", 0, v12, v14, v16, v18);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend(v27, "frame");
      v30.origin.x = v20;
      v30.origin.y = v22;
      v30.size.width = v24;
      v30.size.height = v26;
      v29 = CGRectIntersection(v28, v30);
      -[CNAutocompleteSearchController updateHeaderFooterPositionWithKeyboardIntersectionRect:](self, "updateHeaderFooterPositionWithKeyboardIntersectionRect:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);

    }
  }
}

- (void)updateHeaderFooterPositionWithKeyboardIntersectionRect:(CGRect)a3
{
  double height;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  id v34;
  CGRect v35;
  CGRect v36;

  height = a3.size.height;
  -[CNAutocompleteSearchController view](self, "view", a3.origin.x, a3.origin.y, a3.size.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v7;
  v10 = v9;

  -[CNAutocompleteSearchController headerView](self, "headerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CNAutocompleteSearchController headerView](self, "headerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;

    -[CNAutocompleteSearchController composeFieldContainerView](self, "composeFieldContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v20 = v8 + CGRectGetMaxY(v35);

    -[CNAutocompleteSearchController headerView](self, "headerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", v14, v20, v16, v18);

  }
  -[CNAutocompleteSearchController footerView](self, "footerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[CNAutocompleteSearchController footerView](self, "footerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v25 = v24;
    v27 = v26;
    v29 = v28;

    -[CNAutocompleteSearchController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v31 = CGRectGetMaxY(v36) - (height + v29);

    v32 = 0.0;
    if (height == 0.0)
      v32 = v10;
    v33 = v31 - v32;
    -[CNAutocompleteSearchController footerView](self, "footerView");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFrame:", v25, v33, v27, v29);

  }
}

- (void)updateHeaderFooterVisibility
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[CNAutocompleteSearchController composeField](self, "composeField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (-[CNAutocompleteSearchController composeField](self, "composeField"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "text"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "length")))
  {
    v7 = 1;
  }
  else
  {
    -[CNAutocompleteSearchController resultsController](self, "resultsController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "inDisambiguationMode");

    if (!v6)
      goto LABEL_6;
  }

LABEL_6:
  -[CNAutocompleteSearchController headerView](self, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CNAutocompleteSearchController headerView](self, "headerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", v7);

  }
  -[CNAutocompleteSearchController footerView](self, "footerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CNAutocompleteSearchController footerView](self, "footerView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", v7);

  }
}

- (void)prewarmSuggestedRecipientsWithCompletionBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchSuggestedRecipientsWithCompletionBlock:", v4);

}

- (void)consumeResults:(id)a3 taskID:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[CNAutocompleteSearchController currentTaskID](self, "currentTaskID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToNumber:", v7);

  if (v8)
  {
    -[CNAutocompleteSearchController autocompleteResults](self, "autocompleteResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CNAutocompleteSearchController autocompleteResults](self, "autocompleteResults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAutocompleteSearchController setAutocompleteResults:](self, "setAutocompleteResults:", v11);

    }
    else
    {
      -[CNAutocompleteSearchController setAutocompleteResults:](self, "setAutocompleteResults:", v14);
    }
    -[CNAutocompleteSearchController autocompleteResults](self, "autocompleteResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSearchController resultsController](self, "resultsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRecipients:", v12);

    -[CNAutocompleteSearchController unhideResultsController](self, "unhideResultsController");
  }

}

- (void)finishedTaskWithID:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNAutocompleteSearchController currentTaskID](self, "currentTaskID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "isEqualToNumber:", v4);

  if (v5)
  {
    -[CNAutocompleteSearchController autocompleteResults](self, "autocompleteResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      -[CNAutocompleteSearchController consumeResults:taskID:](self, "consumeResults:taskID:", MEMORY[0x1E0C9AA60], v7);
    -[CNAutocompleteSearchController setCurrentTaskID:](self, "setCurrentTaskID:", 0);
  }

}

- (BOOL)getSupplementalGroupsForSearchQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__CNAutocompleteSearchController_getSupplementalGroupsForSearchQuery_completionHandler___block_invoke;
  v11[3] = &unk_1E62BF9D0;
  v12 = v6;
  v9 = v6;
  LOBYTE(self) = objc_msgSend(v8, "searchController:supplementalGroupsForSearchQuery:completionHandler:", self, v7, v11);

  return (char)self;
}

void __88__CNAutocompleteSearchController_getSupplementalGroupsForSearchQuery_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v7, "_cn_map:", &__block_literal_global_41);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

CNAutocompleteSupplementalGroup *__88__CNAutocompleteSearchController_getSupplementalGroupsForSearchQuery_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  CNAutocompleteSupplementalGroup *v5;
  void *v6;
  void *v7;
  CNAutocompleteSupplementalGroup *v8;

  v2 = a2;
  objc_msgSend(v2, "members");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_map:", &__block_literal_global_43);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [CNAutocompleteSupplementalGroup alloc];
  objc_msgSend(v2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNAutocompleteSupplementalGroup initWithIdentifier:title:members:](v5, "initWithIdentifier:title:members:", v6, v7, v4);
  return v8;
}

CNAutocompleteSupplementalGroupMember *__88__CNAutocompleteSearchController_getSupplementalGroupsForSearchQuery_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  CNAutocompleteSupplementalGroupMember *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  CNAutocompleteSupplementalGroupMember *v7;

  v2 = a2;
  v3 = [CNAutocompleteSupplementalGroupMember alloc];
  objc_msgSend(v2, "nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "addressType");

  v7 = -[CNAutocompleteSupplementalGroupMember initWithNameComponents:address:addressType:](v3, "initWithNameComponents:address:addressType:", v4, v5, v6);
  return v7;
}

- (BOOL)autocompleteResultsController:(id)a3 willOverrideImageDataForRecipient:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "searchController:imageDataForRecipient:imageUpdateBlock:", self, v8, v7);

  return (char)self;
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  id v34;

  height = a4.height;
  width = a4.width;
  -[CNAutocompleteSearchController composeField](self, "composeField", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "searchController:textViewWillChangeSize:", self, width, height);

  -[CNAutocompleteSearchController composeField](self, "composeField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v9, v11, v13, height);

  -[CNAutocompleteSearchController composeFieldScrollView](self, "composeFieldScrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentSize");
  v18 = v17;
  v20 = v19;

  if (v13 != v18 || height != v20)
  {
    -[CNAutocompleteSearchController composeFieldScrollView](self, "composeFieldScrollView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setContentSize:", v13, height);

    -[CNAutocompleteSearchController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    -[CNAutocompleteSearchController latestKeyboardFrame](self, "latestKeyboardFrame");
    -[CNAutocompleteSearchController footerView](self, "footerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");

    +[CNComposeHeaderView preferredHeight](CNComposeRecipientTextView, "preferredHeight");
    if (height <= 150.0)
      v24 = height;
    else
      v24 = 150.0;
    -[CNAutocompleteSearchController composeFieldContainerView](self, "composeFieldContainerView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v9, v11, v13, v24);

    -[CNAutocompleteSearchController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safeAreaInsets");
    v28 = v27;
    -[CNAutocompleteSearchController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v31 = v30;

    -[CNAutocompleteSearchController composeFieldScrollView](self, "composeFieldScrollView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFrame:", 0.0, v28, v31, v24);

  }
  -[CNAutocompleteSearchController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setNeedsLayout");

  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "searchController:textViewDidChangeSize:", self, width, height);

}

- (void)scrollToBottomOfRecipientView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CNAutocompleteSearchController_scrollToBottomOfRecipientView__block_invoke;
  v7[3] = &unk_1E62BF258;
  v7[4] = self;
  v6 = (id)objc_msgSend(v5, "afterDelay:performBlock:", v7, 0.0);

}

void __63__CNAutocompleteSearchController_scrollToBottomOfRecipientView__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "composeFieldScrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "composeFieldScrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "composeFieldScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  objc_msgSend(v7, "scrollRectToVisible:animated:", 1, v4, v6 + -1.0, 1.0, 1.0);

}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CNAutocompleteSearchController cancelAutocompleteSearch](self, "cancelAutocompleteSearch");
  v8 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))();
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchController:textViewTextDidChange:", self, v7);

  objc_msgSend(v6, "recipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    if (!v8)
      goto LABEL_8;
LABEL_6:
    -[CNAutocompleteSearchController resultsController](self, "resultsController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRecipients:", 0);

    -[CNAutocompleteSearchController hideResultsController](self, "hideResultsController");
    goto LABEL_18;
  }
  -[CNAutocompleteSearchController setDidAddRecipientFromTypedQuery:](self, "setDidAddRecipientFromTypedQuery:", 0);
  if (v8)
  {
    -[CNAutocompleteSearchController showSuggestionsController](self, "showSuggestionsController");
    goto LABEL_6;
  }
  -[CNAutocompleteSearchController hideSuggestionsController](self, "hideSuggestionsController");
LABEL_8:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[CNAutocompleteSearchController expandedOtherRecipientAddresses](self, "expandedOtherRecipientAddresses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v13, "addObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v16);
  }

  v30 = v6;
  objc_msgSend(v6, "uncommentedAddresses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v19);

  v20 = objc_alloc_init(MEMORY[0x1E0D135B0]);
  v21 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v20, "setOtherAddressesAlreadyChosen:", v21);

  -[CNAutocompleteSearchController searchManager](self, "searchManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "searchForText:withAutocompleteFetchContext:consumer:", v7, v20, self);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController setCurrentTaskID:](self, "setCurrentTaskID:", v23);

  -[CNAutocompleteSearchController composeField](self, "composeField");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "textView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "selectedRange");
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "recipients");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v26 > v29)
    -[CNAutocompleteSearchController scrollToBottomOfRecipientView](self, "scrollToBottomOfRecipientView");

  v6 = v30;
LABEL_18:

}

- (void)cancelAutocompleteSearch
{
  void *v3;
  void *v4;
  void *v5;

  -[CNAutocompleteSearchController currentTaskID](self, "currentTaskID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNAutocompleteSearchController searchManager](self, "searchManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSearchController currentTaskID](self, "currentTaskID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelTaskWithID:", v5);

    -[CNAutocompleteSearchController setCurrentTaskID:](self, "setCurrentTaskID:", 0);
  }
  -[CNAutocompleteSearchController setAutocompleteResults:](self, "setAutocompleteResults:", 0);
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchController:composeRecipientForAddress:", self, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNAutocompleteSearchController cancelAutocompleteSearch](self, "cancelAutocompleteSearch");
    -[CNAutocompleteSearchController composeField](self, "composeField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearText");

    -[CNAutocompleteSearchController addRecipient:](self, "addRecipient:", v8);
    -[CNAutocompleteSearchController hideResultsController](self, "hideResultsController");
  }

}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchController:didAddRecipient:", self, v6);

  if (-[CNAutocompleteSearchController shouldHideSuggestionsAfterFirstRecipient](self, "shouldHideSuggestionsAfterFirstRecipient")&& (objc_msgSend(v11, "recipients"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "count"), v8, v9)|| -[CNAutocompleteSearchController didAddRecipientFromTypedQuery](self, "didAddRecipientFromTypedQuery"))
  {
    -[CNAutocompleteSearchController hideSuggestionsController](self, "hideSuggestionsController");
  }
  else
  {
    -[CNAutocompleteSearchController showSuggestionsController](self, "showSuggestionsController");
    -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidateSelectedRecipients");

  }
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchController:didRemoveRecipient:", self, v6);

  if (-[CNAutocompleteSearchController shouldHideSuggestionsAfterFirstRecipient](self, "shouldHideSuggestionsAfterFirstRecipient"))
  {
    objc_msgSend(v12, "recipients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRecipients:", 0);

      -[CNAutocompleteSearchController showSuggestionsController](self, "showSuggestionsController");
    }
  }
  -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidateSelectedRecipients");

  -[CNAutocompleteSearchController providePeopleSuggesterFeedbackForRemovedRecipient:](self, "providePeopleSuggesterFeedbackForRemovedRecipient:", v6);
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CNAutocompleteSearchController composeField](self, "composeField", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearText");

  -[CNAutocompleteSearchController autocompleteResults](self, "autocompleteResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNAutocompleteSearchController setAutocompleteResults:](self, "setAutocompleteResults:", 0);
    -[CNAutocompleteSearchController hideResultsController](self, "hideResultsController");
    if (!-[CNAutocompleteSearchController shouldHideSuggestionsAfterFirstRecipient](self, "shouldHideSuggestionsAfterFirstRecipient")|| !-[CNAutocompleteSearchController didAddRecipientFromTypedQuery](self, "didAddRecipientFromTypedQuery"))
    {
      -[CNAutocompleteSearchController showSuggestionsController](self, "showSuggestionsController");
    }
  }
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didTapTextViewAccessoryButtonForSearchController:anchoredToView:", self, v7);

}

- (void)composeRecipientView:(id)a3 showPersonCardForAtom:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearText");

  objc_msgSend(v5, "recipient");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteSearchController disambiguateRecipient:](self, "disambiguateRecipient:", v7);
}

- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearText");

  objc_msgSend(v5, "recipient");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteSearchController disambiguateRecipient:](self, "disambiguateRecipient:", v7);
}

- (void)stopDisambiguatingForComposeRecipientView:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[CNAutocompleteSearchController resultsController](self, "resultsController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if ((v6 & 1) == 0)
    -[CNAutocompleteSearchController hideResultsController](self, "hideResultsController");
}

- (id)composeRecipientView:(id)a3 contextMenuConfigurationForAtom:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "searchController:contextMenuConfigurationForRecipient:", self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)composeRecipientView:(id)a3 showPersonCardForRecipient:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CNAutocompleteSearchController setDidPresentContactCard:](self, "setDidPresentContactCard:", 1);
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchController:didTapTableAccessoryForRecipient:", self, v5);

}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchController:composeRecipientForAddress:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)presentationOptionsForRecipient:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "searchController:presentationOptionsForRecipient:", self, v4);

  return v6;
}

- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5
{
  void (**v7)(id, id);
  id v8;
  void *v9;
  id v10;

  v7 = (void (**)(id, id))a5;
  v8 = a4;
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchController:tintColorForRecipient:", self, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v10);
}

- (id)autocompleteResultsController:(id)a3 preferredRecipientForRecipient:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchController:preferredRecipientForRecipient:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)autocompleteResultsController:(id)a3 willOverrideImageDataForRecipient:(id)a4 imageUpdateBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "searchController:imageDataForRecipient:imageUpdateBlock:", self, v8, v7);

  return (char)self;
}

- (void)suggestionsController:(id)a3 didSelectRecipient:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[CNAutocompleteSearchController _addRecipient:](self, "_addRecipient:", v6);
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchController:didAddRecipientBySuggestionsController:", self, v6);

  -[CNAutocompleteSearchController providePeopleSuggesterFeedbackForSuggestedRecipient:](self, "providePeopleSuggesterFeedbackForSuggestedRecipient:", v6);
  LODWORD(v6) = objc_msgSend(v7, "useAccessibleLayout");

  if ((_DWORD)v6)
    -[CNAutocompleteSearchController hideSoftwareKeyboard](self, "hideSoftwareKeyboard");
}

- (void)suggestionsController:(id)a3 didDeselectRecipient:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeRecipient:", v5);

}

- (void)hideSoftwareKeyboard
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "isInHardwareKeyboardMode") & 1) == 0)
  {
    -[CNAutocompleteSearchController suggestionsController](self, "suggestionsController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "useAccessibleLayout");

    if (v4)
    {
      -[CNAutocompleteSearchController composeField](self, "composeField");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setUsingActiveAppearance:animated:", 0, 0);

    }
    -[CNAutocompleteSearchController setIgnoreDidFinishAddress:](self, "setIgnoreDidFinishAddress:", 1);
    -[CNAutocompleteSearchController composeField](self, "composeField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

    -[CNAutocompleteSearchController setIgnoreDidFinishAddress:](self, "setIgnoreDidFinishAddress:", 0);
  }
}

- (id)selectedRecipientsForSuggestionsController:(id)a3
{
  void *v3;
  void *v4;

  -[CNAutocompleteSearchController composeField](self, "composeField", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)suggestionsControllerWillBeginScroll:(id)a3
{
  void *v4;

  -[CNAutocompleteSearchController setIgnoreDidFinishAddress:](self, "setIgnoreDidFinishAddress:", 1);
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  -[CNAutocompleteSearchController setIgnoreDidFinishAddress:](self, "setIgnoreDidFinishAddress:", 0);
}

- (BOOL)suggestionsController:(id)a3 imageDataForRecipient:(id)a4 imageUpdateBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "searchController:imageDataForRecipient:imageUpdateBlock:", self, v8, v7);

  return (char)self;
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CNAutocompleteSearchController cancelAutocompleteSearch](self, "cancelAutocompleteSearch");
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearText");

  -[CNAutocompleteSearchController addRecipient:](self, "addRecipient:", v6);
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchController:didAddRecipientByResultsController:", self, v6);

  -[CNAutocompleteSearchController hideResultsController](self, "hideResultsController");
  -[CNAutocompleteSearchController updateHeaderFooterVisibility](self, "updateHeaderFooterVisibility");
  if (-[CNAutocompleteSearchController shouldRestoreFirstResponderToComposeField](self, "shouldRestoreFirstResponderToComposeField"))
  {
    -[CNAutocompleteSearchController becomeFirstResponder](self, "becomeFirstResponder");
  }
}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[CNAutocompleteSearchController setIgnoreDidFinishAddress:](self, "setIgnoreDidFinishAddress:", 1);
  -[CNAutocompleteSearchController composeField](self, "composeField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resignFirstResponder");

  -[CNAutocompleteSearchController setIgnoreDidFinishAddress:](self, "setIgnoreDidFinishAddress:", 0);
  -[CNAutocompleteSearchController setDidPresentContactCard:](self, "setDidPresentContactCard:", 1);
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchController:didTapTableAccessoryForRecipient:", self, v5);

}

- (void)autocompleteResultsController:(id)a3 didAskToRemoveRecipient:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CNAutocompleteSearchController searchManager](self, "searchManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeRecipientResult:", v5);

}

- (void)autocompleteResultsControllerWillBeginToScroll:(id)a3
{
  char v4;
  void *v5;
  id v6;

  -[CNAutocompleteSearchController composeField](self, "composeField", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isFirstResponder"))
  {
    v4 = objc_msgSend(MEMORY[0x1E0CEA6C8], "isInHardwareKeyboardMode");

    if ((v4 & 1) == 0)
    {
      -[CNAutocompleteSearchController setIgnoreDidFinishAddress:](self, "setIgnoreDidFinishAddress:", 1);
      -[CNAutocompleteSearchController composeField](self, "composeField");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resignFirstResponder");

      -[CNAutocompleteSearchController setShouldRestoreFirstResponderToComposeField:](self, "setShouldRestoreFirstResponderToComposeField:", 1);
      -[CNAutocompleteSearchController setIgnoreDidFinishAddress:](self, "setIgnoreDidFinishAddress:", 0);
    }
  }
  else
  {

  }
}

- (void)selectNextSearchResultForComposeRecipientView:(id)a3
{
  id v3;

  -[CNAutocompleteSearchController resultsController](self, "resultsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectNextSearchResult");

}

- (void)selectPreviousSearchResultForComposeRecipientView:(id)a3
{
  id v3;

  -[CNAutocompleteSearchController resultsController](self, "resultsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectPreviousSearchResult");

}

- (BOOL)chooseSelectedSearchResultForComposeRecipientView:(id)a3
{
  void *v3;
  char v4;

  -[CNAutocompleteSearchController resultsController](self, "resultsController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "confirmSelectedRecipient");

  return v4;
}

- (BOOL)composeRecipientViewShowingSearchResults:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  -[CNAutocompleteSearchController resultsController](self, "resultsController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isHidden") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[CNAutocompleteSearchController autocompleteResults](self, "autocompleteResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "count") != 0;

  }
  return v6;
}

- (BOOL)expandSelectedSearchResultForComposeRecipientView:(id)a3
{
  void *v3;
  char v4;

  -[CNAutocompleteSearchController resultsController](self, "resultsController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "expandSelectedRecipient");

  return v4;
}

- (BOOL)collapseSelectedSearchResultForComposeRecipientView:(id)a3
{
  void *v3;
  char v4;

  -[CNAutocompleteSearchController resultsController](self, "resultsController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "collapseSelectedRecipient");

  return v4;
}

- (void)autocompleteResultsController:(id)a3 willDisplayRowForRecipient:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchController:willDisplayRowForRecipient:", self, v5);

}

- (void)autocompleteResultsController:(id)a3 didEndDisplayingRowForRecipient:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CNAutocompleteSearchController delegateWrapper](self, "delegateWrapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchController:didEndDisplayingRowForRecipient:", self, v5);

}

- (BOOL)didPresentSomeViewController
{
  return -[CNAutocompleteSearchController didPresentContactPicker](self, "didPresentContactPicker")
      || -[CNAutocompleteSearchController didPresentContactCard](self, "didPresentContactCard");
}

- (void)clearPresentedViewControllerState
{
  -[CNAutocompleteSearchController setDidPresentContactPicker:](self, "setDidPresentContactPicker:", 0);
  -[CNAutocompleteSearchController setDidPresentContactCard:](self, "setDidPresentContactCard:", 0);
}

- (void)providePeopleSuggesterFeedbackForViewWillAppear
{
  if (-[CNAutocompleteSearchController didPresentSomeViewController](self, "didPresentSomeViewController"))
  {
    objc_msgSend(MEMORY[0x1E0D135D0], "userEnteredExistingSession");
    -[CNAutocompleteSearchController clearPresentedViewControllerState](self, "clearPresentedViewControllerState");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D135D0], "userEnteredNewSession");
  }
}

- (void)providePeopleSuggesterFeedbackForViewWillDisappear
{
  if (-[CNAutocompleteSearchController didPresentSomeViewController](self, "didPresentSomeViewController"))
    objc_msgSend(MEMORY[0x1E0D135D0], "userNavigatedAwayFromSession");
  else
    objc_msgSend(MEMORY[0x1E0D135D0], "userTerminatedSession");
}

- (void)providePeopleSuggesterFeedbackForSuggestedRecipient:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "autocompleteResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "psSuggestion");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D135D0], "userSelectedSuggestion:", v5);
    v4 = v5;
  }

}

- (void)providePeopleSuggesterFeedbackForTypedRecipient:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = -[CNAutocompleteSearchController didPresentContactPicker](self, "didPresentContactPicker");
  v6 = (void *)MEMORY[0x1E0D135D0];
  objc_msgSend(v4, "contact");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v6, "userSelectedFromContactPicker:", v7);
  else
    objc_msgSend(v6, "userEnteredContact:", v7);

}

- (void)providePeopleSuggesterFeedbackForRemovedRecipient:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x1E0D135D0];
  objc_msgSend(a3, "contact");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userRemovedContact:", v4);

}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (NSArray)otherRecipientAddresses
{
  return self->_otherRecipientAddresses;
}

- (CNAutocompleteSearchControllerDelegate)delegate
{
  return (CNAutocompleteSearchControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CNAutocompleteSearchControllerSafeDelegateWrapper)delegateWrapper
{
  return self->_delegateWrapper;
}

- (void)setDelegateWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_delegateWrapper, a3);
}

- (CNAutocompleteSearchManager)searchManager
{
  return self->_searchManager;
}

- (void)setSearchManager:(id)a3
{
  objc_storeStrong((id *)&self->_searchManager, a3);
}

- (CNComposeRecipientTextView)composeField
{
  return self->_composeField;
}

- (CNAutocompleteResultsTableViewController)resultsController
{
  return self->_resultsController;
}

- (CNAutocompleteSuggestionsViewController)suggestionsController
{
  return self->_suggestionsController;
}

- (UIScrollView)composeFieldScrollView
{
  return self->_composeFieldScrollView;
}

- (void)setComposeFieldScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_composeFieldScrollView, a3);
}

- (UIView)composeFieldContainerView
{
  return self->_composeFieldContainerView;
}

- (void)setComposeFieldContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_composeFieldContainerView, a3);
}

- (NSObject)keyboardWillShowNotificationObserver
{
  return self->_keyboardWillShowNotificationObserver;
}

- (void)setKeyboardWillShowNotificationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardWillShowNotificationObserver, a3);
}

- (NSObject)keyboardWillHideNotificationObserver
{
  return self->_keyboardWillHideNotificationObserver;
}

- (void)setKeyboardWillHideNotificationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardWillHideNotificationObserver, a3);
}

- (NSObject)uiContentSizeCategoryDidChangeNotificationObserver
{
  return self->_uiContentSizeCategoryDidChangeNotificationObserver;
}

- (void)setUiContentSizeCategoryDidChangeNotificationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_uiContentSizeCategoryDidChangeNotificationObserver, a3);
}

- (CGRect)latestKeyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_latestKeyboardFrame.origin.x;
  y = self->_latestKeyboardFrame.origin.y;
  width = self->_latestKeyboardFrame.size.width;
  height = self->_latestKeyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLatestKeyboardFrame:(CGRect)a3
{
  self->_latestKeyboardFrame = a3;
}

- (NSNumber)currentTaskID
{
  return self->_currentTaskID;
}

- (void)setCurrentTaskID:(id)a3
{
  objc_storeStrong((id *)&self->_currentTaskID, a3);
}

- (NSArray)autocompleteResults
{
  return self->_autocompleteResults;
}

- (void)setAutocompleteResults:(id)a3
{
  objc_storeStrong((id *)&self->_autocompleteResults, a3);
}

- (NSArray)expandedOtherRecipientAddresses
{
  return self->_expandedOtherRecipientAddresses;
}

- (void)setExpandedOtherRecipientAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_expandedOtherRecipientAddresses, a3);
}

- (BOOL)ignoreDidFinishAddress
{
  return self->_ignoreDidFinishAddress;
}

- (void)setIgnoreDidFinishAddress:(BOOL)a3
{
  self->_ignoreDidFinishAddress = a3;
}

- (BOOL)didPresentContactPicker
{
  return self->_didPresentContactPicker;
}

- (void)setDidPresentContactPicker:(BOOL)a3
{
  self->_didPresentContactPicker = a3;
}

- (BOOL)didPresentContactCard
{
  return self->_didPresentContactCard;
}

- (void)setDidPresentContactCard:(BOOL)a3
{
  self->_didPresentContactCard = a3;
}

- (BOOL)shouldRestoreFirstResponderToComposeField
{
  return self->_shouldRestoreFirstResponderToComposeField;
}

- (void)setShouldRestoreFirstResponderToComposeField:(BOOL)a3
{
  self->_shouldRestoreFirstResponderToComposeField = a3;
}

- (BOOL)didAddRecipientFromTypedQuery
{
  return self->_didAddRecipientFromTypedQuery;
}

- (void)setDidAddRecipientFromTypedQuery:(BOOL)a3
{
  self->_didAddRecipientFromTypedQuery = a3;
}

- (BOOL)suggestionsAllowed
{
  return self->_suggestionsAllowed;
}

- (void)setSuggestionsAllowed:(BOOL)a3
{
  self->_suggestionsAllowed = a3;
}

- (BOOL)hasSmallScreen
{
  return self->_hasSmallScreen;
}

- (void)setHasSmallScreen:(BOOL)a3
{
  self->_hasSmallScreen = a3;
}

- (BOOL)finalWindowAttached
{
  return self->_finalWindowAttached;
}

- (void)setFinalWindowAttached:(BOOL)a3
{
  self->_finalWindowAttached = a3;
}

- (BOOL)shouldHideSuggestionsAfterFirstRecipient
{
  return self->_shouldHideSuggestionsAfterFirstRecipient;
}

- (void)setShouldHideSuggestionsAfterFirstRecipient:(BOOL)a3
{
  self->_shouldHideSuggestionsAfterFirstRecipient = a3;
}

- (BOOL)isiPhone
{
  return self->_isiPhone;
}

- (void)setIsiPhone:(BOOL)a3
{
  self->_isiPhone = a3;
}

- (CNAutocompleteSearchControllerOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_expandedOtherRecipientAddresses, 0);
  objc_storeStrong((id *)&self->_autocompleteResults, 0);
  objc_storeStrong((id *)&self->_currentTaskID, 0);
  objc_storeStrong((id *)&self->_uiContentSizeCategoryDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_keyboardWillHideNotificationObserver, 0);
  objc_storeStrong((id *)&self->_keyboardWillShowNotificationObserver, 0);
  objc_storeStrong((id *)&self->_composeFieldContainerView, 0);
  objc_storeStrong((id *)&self->_composeFieldScrollView, 0);
  objc_storeStrong((id *)&self->_suggestionsController, 0);
  objc_storeStrong((id *)&self->_resultsController, 0);
  objc_storeStrong((id *)&self->_composeField, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_delegateWrapper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_otherRecipientAddresses, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
