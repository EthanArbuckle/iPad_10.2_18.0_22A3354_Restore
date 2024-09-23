@implementation MUHeaderButtonsSectionController

- (MUHeaderButtonsSectionController)initWithETAProvider:(id)a3 headerButtonsConfiguration:(id)a4
{
  id v6;
  id v7;
  MUHeaderButtonsSectionController *v8;
  MUHeaderButtonsSectionController *v9;
  MKPlaceHeaderButtonsViewController *v10;
  MKPlaceHeaderButtonsViewController *catalystHeaderViewController;
  _QWORD *p_catalystHeaderViewController;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  MUHeaderButtonsView *v21;
  MUHeaderButtonsView *v22;
  MUHeaderButtonsView *headerButtonsView;
  UIView *contentView;
  id WeakRetained;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MUHeaderButtonsSectionController;
  v8 = -[MUHeaderButtonsSectionController init](&v27, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_etaProvider, v6);
    objc_storeStrong((id *)&v9->_headerConfiguration, a4);
    if (MapKitIdiomIsMacCatalyst())
    {
      v10 = (MKPlaceHeaderButtonsViewController *)objc_alloc_init(MEMORY[0x1E0CC18E0]);
      p_catalystHeaderViewController = &v9->_catalystHeaderViewController;
      catalystHeaderViewController = v9->_catalystHeaderViewController;
      v9->_catalystHeaderViewController = v10;

      -[MKPlaceHeaderButtonsViewController view](v9->_catalystHeaderViewController, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPreservesSuperviewLayoutMargins:", 0);

      -[MKPlaceHeaderButtonsViewController view](v9->_catalystHeaderViewController, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setInsetsLayoutMarginsFromSafeArea:", 0);

      -[MKPlaceHeaderButtonsViewController contentView](v9->_catalystHeaderViewController, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPreservesSuperviewLayoutMargins:", 0);

      v16 = *MEMORY[0x1E0DC49E8];
      v17 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v18 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v19 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      -[MKPlaceHeaderButtonsViewController contentView](v9->_catalystHeaderViewController, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLayoutMargins:", v16, v17, v18, v19);

      -[MKPlaceHeaderButtonsViewController setDelegate:](v9->_catalystHeaderViewController, "setDelegate:", v9);
      -[MKPlaceHeaderButtonsViewController view](v9->_catalystHeaderViewController, "view");
      v21 = (MUHeaderButtonsView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = -[MUHeaderButtonsView initWithConfiguration:]([MUHeaderButtonsView alloc], "initWithConfiguration:", v7);
      p_catalystHeaderViewController = &v9->_headerButtonsView;
      headerButtonsView = v9->_headerButtonsView;
      v9->_headerButtonsView = v22;

      -[MUHeaderButtonsView setDelegate:](v9->_headerButtonsView, "setDelegate:", v9);
      -[MUHeaderButtonsView setAccessibilityIdentifier:](v9->_headerButtonsView, "setAccessibilityIdentifier:", CFSTR("PlaceHeaderButtonsView"));
      v21 = v9->_headerButtonsView;
    }
    contentView = v9->_contentView;
    v9->_contentView = &v21->super;

    WeakRetained = objc_loadWeakRetained((id *)&v9->_etaProvider);
    objc_msgSend(WeakRetained, "addObserver:", *p_catalystHeaderViewController);

    -[MUHeaderButtonsSectionController _setupSectionView](v9, "_setupSectionView");
  }

  return v9;
}

- (void)_setupSectionView
{
  MUPlaceSectionView *v3;
  MUPlaceSectionView *sectionView;

  v3 = -[MUPlaceSectionView initWithStyle:alwaysHideSeparators:]([MUPlaceSectionView alloc], "initWithStyle:alwaysHideSeparators:", 1, 1);
  sectionView = self->_sectionView;
  self->_sectionView = v3;

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
  -[MUPlaceSectionView attachViewToContentView:](self->_sectionView, "attachViewToContentView:", self->_contentView);
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (NSArray)sectionViews
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_sectionView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)impressionsFrame
{
  void *v2;
  double v3;
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
  CGRect result;

  -[MUHeaderButtonsSectionController sectionView](self, "sectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (_MKPlaceActionButtonController)secondaryButtonController
{
  int IsMacCatalyst;
  uint64_t v4;

  IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v4 = 24;
  if (IsMacCatalyst)
    v4 = 40;
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "secondaryButtonController");
  return (_MKPlaceActionButtonController *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSecondaryButtonController:(id)a3
{
  id v4;
  _BOOL8 v5;
  int IsMacCatalyst;
  uint64_t v7;

  v4 = a3;
  v5 = -[MUHeaderButtonsSectionController hasContent](self, "hasContent");
  IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v7 = 24;
  if (IsMacCatalyst)
    v7 = 40;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "setSecondaryButtonController:", v4);

  -[MUHeaderButtonsSectionController _updateWithPreviousState:](self, "_updateWithPreviousState:", v5);
}

- (void)setAlternatePrimaryButtonController:(id)a3
{
  id v4;
  _BOOL8 v5;
  int IsMacCatalyst;
  uint64_t v7;

  v4 = a3;
  v5 = -[MUHeaderButtonsSectionController hasContent](self, "hasContent");
  IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v7 = 24;
  if (IsMacCatalyst)
    v7 = 40;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "setAlternatePrimaryButtonController:", v4);

  -[MUHeaderButtonsSectionController _updateWithPreviousState:](self, "_updateWithPreviousState:", v5);
}

- (_MKPlaceActionButtonController)alternatePrimaryButtonController
{
  int IsMacCatalyst;
  uint64_t v4;

  IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v4 = 24;
  if (IsMacCatalyst)
    v4 = 40;
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "alternatePrimaryButtonController");
  return (_MKPlaceActionButtonController *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setPrimaryButtonType:(unint64_t)a3
{
  _BOOL8 v5;
  int IsMacCatalyst;
  uint64_t v7;

  v5 = -[MUHeaderButtonsSectionController hasContent](self, "hasContent");
  IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v7 = 24;
  if (IsMacCatalyst)
    v7 = 40;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "setPrimaryButtonType:", a3);
  -[MUHeaderButtonsSectionController _updateWithPreviousState:](self, "_updateWithPreviousState:", v5);
}

- (unint64_t)primaryButtonType
{
  int IsMacCatalyst;
  uint64_t v4;

  IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v4 = 24;
  if (IsMacCatalyst)
    v4 = 40;
  return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "primaryButtonType");
}

- (BOOL)hasContent
{
  BOOL v3;
  void *v4;

  if (-[MUHeaderButtonsSectionController primaryButtonType](self, "primaryButtonType"))
    return 1;
  -[MUHeaderButtonsSectionController secondaryButtonController](self, "secondaryButtonController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (void)_updateWithPreviousState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  if (-[MUHeaderButtonsSectionController hasContent](self, "hasContent") != a3)
  {
    MUGetPlaceCardLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109376;
      v7[1] = v3;
      v8 = 1024;
      v9 = -[MUHeaderButtonsSectionController hasContent](self, "hasContent");
      _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_INFO, "MUPlaceHeaderButtonsSectionController: hasContent changed from %d to %d, will tell parent to update.", (uint8_t *)v7, 0xEu);
    }

    -[MUHeaderButtonsSectionController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "headerButtonsSectionControllerDidUpdateContent:", self);

  }
}

- (void)headerButtonsView:(id)a3 didSelectPrimaryType:(unint64_t)a4 withPresentationOptions:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[MUHeaderButtonsSectionController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "headerButtonsSectionController:didSelectPrimaryType:withPresentationOptions:", self, a4, v7);

}

- (void)headerButtonsViewWillPresentMenu:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUHeaderButtonsSectionController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUHeaderButtonsSectionController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "headerButtonsSectionControllerWillPresentMenu:", self);

  }
}

- (void)placeHeaderButtonsViewController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withView:(id)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  MUPresentationOptions *v17;

  v7 = a5;
  v17 = objc_alloc_init(MUPresentationOptions);
  -[MUPresentationOptions setSourceView:](v17, "setSourceView:", v7);
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[MUPresentationOptions setSourceRect:](v17, "setSourceRect:", v9, v11, v13, v15);
  -[MUHeaderButtonsSectionController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "headerButtonsSectionController:didSelectPrimaryType:withPresentationOptions:", self, a4, v17);

}

- (id)draggableContent
{
  return 0;
}

- (MUPlaceSectionFooterViewModel)sectionFooterViewModel
{
  return 0;
}

- (id)infoCardChildPossibleActions
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MUHeaderButtonsSectionController primaryButtonType](self, "primaryButtonType") - 1;
  if (v4 <= 3)
    objc_msgSend(v3, "addObject:", qword_1E2E05288[v4]);
  -[MUHeaderButtonsViewConfiguration possibleAnalyticActions](self->_headerConfiguration, "possibleAnalyticActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[MUHeaderButtonsViewConfiguration possibleAnalyticActions](self->_headerConfiguration, "possibleAnalyticActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  -[MUHeaderButtonsSectionController secondaryButtonController](self, "secondaryButtonController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EE252410);

  if (v9)
  {
    -[MUHeaderButtonsSectionController secondaryButtonController](self, "secondaryButtonController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "infoCardChildPossibleActions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
        objc_msgSend(v3, "addObjectsFromArray:", v11);

    }
  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)analyticsModule
{
  return (id)objc_msgSend(MEMORY[0x1E0D26EB0], "moduleFromModuleType:", -[MUHeaderButtonsSectionController analyticsModuleType](self, "analyticsModuleType"));
}

- (int)analyticsModuleType
{
  return 2;
}

- (id)revealedAnalyticsModule
{
  return (id)objc_msgSend(MEMORY[0x1E0D27450], "moduleWithType:", -[MUHeaderButtonsSectionController analyticsModuleType](self, "analyticsModuleType"));
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  return self->_sectionHeaderViewModel;
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (void)setSubmissionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_submissionStatus, a3);
}

- (MUInfoCardAnalyticsDelegate)analyticsDelegate
{
  return (MUInfoCardAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (MUHeaderButtonsSectionControllerDelegate)delegate
{
  return (MUHeaderButtonsSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_catalystHeaderViewController, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_headerButtonsView, 0);
  objc_storeStrong((id *)&self->_headerConfiguration, 0);
  objc_destroyWeak((id *)&self->_etaProvider);
}

@end
