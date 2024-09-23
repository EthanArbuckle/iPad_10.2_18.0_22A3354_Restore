@implementation MUBrowseCategorySectionController

- (MUBrowseCategorySectionController)initWithMapItem:(id)a3
{
  MUBrowseCategorySectionController *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MUBrowseCategorySectionController;
  v3 = -[MUPlaceSectionController initWithMapItem:](&v8, sel_initWithMapItem_, a3);
  if (v3)
  {
    MUGetPlaceCardLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUBrowseCategorySectionControllerInit", ", v7, 2u);
    }

    -[MUBrowseCategorySectionController _setupSectionView](v3, "_setupSectionView");
    MUGetPlaceCardLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUBrowseCategorySectionControllerInit", ", v7, 2u);
    }

  }
  return v3;
}

- (void)_setupSectionView
{
  MUBrowseCategoryViewController *v3;
  void *v4;
  MUBrowseCategoryViewController *v5;
  MUBrowseCategoryViewController *browseCategoryVC;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  MUPlaceSectionView *v13;
  MUPlaceSectionView *sectionView;
  MUPlaceSectionView *v15;
  id v16;

  v3 = [MUBrowseCategoryViewController alloc];
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MUBrowseCategoryViewController initWithMapItem:](v3, "initWithMapItem:", v4);
  browseCategoryVC = self->_browseCategoryVC;
  self->_browseCategoryVC = v5;

  -[MUBrowseCategoryViewController setDisableBottomPadding:](self->_browseCategoryVC, "setDisableBottomPadding:", 1);
  -[MUBrowseCategoryViewController view](self->_browseCategoryVC, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreservesSuperviewLayoutMargins:", 0);

  v8 = *MEMORY[0x1E0DC49E8];
  v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v10 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v11 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[MUBrowseCategoryViewController view](self->_browseCategoryVC, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLayoutMargins:", v8, v9, v10, v11);

  -[MUBrowseCategoryViewController setDelegate:](self->_browseCategoryVC, "setDelegate:", self);
  v13 = -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:]([MUPlaceSectionView alloc], "initWithStyle:sectionHeaderViewModel:", 0, 0);
  sectionView = self->_sectionView;
  self->_sectionView = v13;

  -[MUPlaceSectionView setAccessibilityIdentifier:](self->_sectionView, "setAccessibilityIdentifier:", CFSTR("VenuesBrowseCategorySection"));
  v15 = self->_sectionView;
  -[MUBrowseCategoryViewController view](self->_browseCategoryVC, "view");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionView attachViewToContentView:](v15, "attachViewToContentView:", v16);

}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (UIViewController)sectionViewController
{
  return (UIViewController *)self->_browseCategoryVC;
}

- (void)categoryBrowseViewController:(id)a3 didTapOnSearchCategory:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MUBrowseCategorySectionController browseCategoryDelegate](self, "browseCategoryDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "browseCategorySectionController:didTapOnSearchCategory:", self, v5);

}

- (int)analyticsModuleType
{
  return 30;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (MUBrowseCategorySectionControllerDelegate)browseCategoryDelegate
{
  return (MUBrowseCategorySectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_browseCategoryDelegate);
}

- (void)setBrowseCategoryDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_browseCategoryDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browseCategoryDelegate);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_browseCategoryVC, 0);
}

@end
