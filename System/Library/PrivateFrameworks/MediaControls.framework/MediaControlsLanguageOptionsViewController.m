@implementation MediaControlsLanguageOptionsViewController

- (MediaControlsLanguageOptionsViewController)initWithRouteUID:(id)a3
{
  id v4;
  MediaControlsLanguageOptionsViewController *v5;
  MediaControlsLanguageOptionsViewController *v6;
  MediaControlsLanguageOptionsViewController *v8;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MediaControlsLanguageOptionsViewController;
  v5 = -[MediaControlsLanguageOptionsViewController init](&v9, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    MRAVReconnaissanceSessionCreateWithEndpointFeatures();
    v8 = v6;
    MRAVReconnaissanceSessionBeginSearch();

  }
  return v6;
}

void __63__MediaControlsLanguageOptionsViewController_initWithRouteUID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ExternalDevice;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD block[4];
  id v15;

  if (a3)
  {
    ExternalDevice = MRAVEndpointGetExternalDevice();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC22E0]), "initWithEndpoint:", a3);
    if (ExternalDevice)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2310]), "initWithExternalDevice:", ExternalDevice);
      objc_msgSend(v6, "setConnection:", v7);

    }
    v8 = objc_alloc_init(MEMORY[0x1E0D4B380]);
    objc_msgSend(MEMORY[0x1E0CC24C0], "emptyPropertySet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlayingItemProperties:", v9);

    objc_msgSend(MEMORY[0x1E0D4B370], "pathWithRoute:bundleID:playerID:", v6, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlayerPath:", v10);

    v11 = objc_alloc_init(MEMORY[0x1E0CC24E0]);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 984);
    *(_QWORD *)(v12 + 984) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setRequest:", v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setNeedsReloadForSignificantRequestChange");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "beginAutomaticResponseLoading");

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__MediaControlsLanguageOptionsViewController_initWithRouteUID___block_invoke_2;
    block[3] = &unk_1E5818C88;
    v15 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __63__MediaControlsLanguageOptionsViewController_initWithRouteUID___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissLanguageOptionsViewController:", *(_QWORD *)(a1 + 32));

}

- (void)viewDidLoad
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MediaControlsLanguageOptionsViewController;
  -[MediaControlsLanguageOptionsViewController viewDidLoad](&v23, sel_viewDidLoad);
  CCUIExpandedModuleContinuousCornerRadius();
  v4 = v3;
  -[MediaControlsLanguageOptionsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsLanguageOptionsViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[MediaControlsLanguageOptionsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setContinuousCornerRadius:", v4);

  objc_msgSend(MEMORY[0x1E0D14790], "controlCenterDarkMaterial");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setContinuousCornerRadius:", v4);
  -[MediaControlsLanguageOptionsViewController setMaterialView:](self, "setMaterialView:", v9);
  -[MediaControlsLanguageOptionsViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);

  objc_msgSend(v9, "visualStylingProviderForCategory:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsLanguageOptionsViewController setVisualStylingProvider:](self, "setVisualStylingProvider:", v11);

  v12 = objc_alloc(MEMORY[0x1E0CC22D8]);
  v13 = *MEMORY[0x1E0C9D648];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v17 = (void *)objc_msgSend(v12, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], v14, v15, v16);
  objc_msgSend(v17, "setSeparatorInset:", 0.0, 20.0, 0.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v18);

  objc_msgSend(v17, "headerBackgroundView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", 1);

  objc_msgSend(v17, "footerBackgroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", 1);

  objc_msgSend(v17, "setContentInset:", 0.0, 0.0, 24.0, 0.0);
  objc_msgSend(v17, "setDataSource:", self);
  objc_msgSend(v17, "setDelegate:", self);
  objc_msgSend(v17, "setSectionHeaderHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v17, "setAllowsMultipleSelection:", 1);
  objc_msgSend(v17, "_setDrawsSeparatorAtTopOfSections:", 1);
  objc_msgSend(v17, "setScrollIndicatorInsets:", v4, 0.0, v4, 0.0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v13, v14, v15, v16);
  objc_msgSend(v17, "setTableFooterView:", v21);

  objc_msgSend(v17, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("_LanguageOptionsCellIdentifier"));
  objc_msgSend(v17, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("_LanguageOptionsHeaderIdentifier"));
  -[MediaControlsLanguageOptionsViewController setTableView:](self, "setTableView:", v17);
  -[MediaControlsLanguageOptionsViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v17);

}

- (void)setLanguageOptionGroups:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_languageOptionGroups, a3);
  if (-[MediaControlsLanguageOptionsViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[MediaControlsLanguageOptionsViewController tableView](self, "tableView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MediaControlsLanguageOptionsViewController;
  -[MediaControlsLanguageOptionsViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[MediaControlsLanguageOptionsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UIView setFrame:](self->_materialView, "setFrame:");

  -[MediaControlsLanguageOptionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[MPAVClippingTableView setFrame:](self->_tableView, "setFrame:");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  CCUIDefaultExpandedContentModuleWidth();
  v4 = v3;
  -[MPAVClippingTableView sizeThatFits:](self->_tableView, "sizeThatFits:");
  if (v5 < v4)
    v5 = v4;
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("_LanguageOptionsCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_languageOptionGroups, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedTitleForOptionAtIndex:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  v11 = objc_msgSend(v8, "indexOfSelectedOption");
  v12 = objc_msgSend(v6, "row");

  if (v11 == v12)
    v13 = 3;
  else
    v13 = 0;
  objc_msgSend(v7, "setAccessoryType:", v13);
  -[MTVisualStylingProvider _visualStylingForStyle:](self->_visualStylingProvider, "_visualStylingForStyle:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mt_replaceVisualStyling:", v14);

  objc_msgSend(v14, "color");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v16);

  -[MTVisualStylingProvider _visualStylingForStyle:](self->_visualStylingProvider, "_visualStylingForStyle:", 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topSeparatorView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mt_replaceVisualStyling:", v17);

  objc_msgSend(v7, "bottomSeparatorView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mt_replaceVisualStyling:", v17);

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_languageOptionGroups, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSArray objectAtIndexedSubscript:](self->_languageOptionGroups, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfOptions");

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(v14, "deselectRowAtIndexPath:animated:", v6, 0);
  objc_msgSend(v14, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessoryType:", 3);

  -[NSArray objectAtIndexedSubscript:](self->_languageOptionGroups, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfSelectedOption");
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v9, objc_msgSend(v6, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cellForRowAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessoryType:", 0);

  }
  v12 = (void *)MEMORY[0x1E0D4B358];
  objc_msgSend(v8, "changeRequestForOptionAtIndex:", objc_msgSend(v6, "row"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "performRequest:completion:", v13, 0);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  NSArray *languageOptionGroups;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  languageOptionGroups = self->_languageOptionGroups;
  v5 = a4;
  -[NSArray objectAtIndexedSubscript:](languageOptionGroups, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfSelectedOption");
  v8 = objc_msgSend(v5, "row");

  return v7 != v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("_LanguageOptionsHeaderIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_languageOptionGroups, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[MTVisualStylingProvider _visualStylingForStyle:](self->_visualStylingProvider, "_visualStylingForStyle:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mt_replaceVisualStyling:", v10);

  return v6;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  MediaControlsLanguageOptionsViewController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__MediaControlsLanguageOptionsViewController_controller_defersResponseReplacement___block_invoke;
  block[3] = &unk_1E581AA60;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __83__MediaControlsLanguageOptionsViewController_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tracklist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageOptionGroups");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setLanguageOptionGroups:", v6);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didLoadOptionsForLanguageOptionsViewController:", *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__MediaControlsLanguageOptionsViewController_controller_shouldRetryFailedRequestWithError___block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  return 0;
}

void __91__MediaControlsLanguageOptionsViewController_controller_shouldRetryFailedRequestWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissLanguageOptionsViewController:", *(_QWORD *)(a1 + 32));

}

- (NSArray)languageOptionGroups
{
  return self->_languageOptionGroups;
}

- (MediaControlsLanguageOptionsViewControllerDelegate)delegate
{
  return (MediaControlsLanguageOptionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MPRequestResponseController)requestResponseController
{
  return self->_requestResponseController;
}

- (void)setRequestResponseController:(id)a3
{
  objc_storeStrong((id *)&self->_requestResponseController, a3);
}

- (UIView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_materialView, a3);
}

- (MPAVClippingTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (void)setVisualStylingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_visualStylingProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_requestResponseController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_languageOptionGroups, 0);
}

@end
