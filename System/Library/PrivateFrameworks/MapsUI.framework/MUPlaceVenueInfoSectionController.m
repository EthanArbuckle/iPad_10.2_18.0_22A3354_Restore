@implementation MUPlaceVenueInfoSectionController

- (MUPlaceVenueInfoSectionController)initWithMapItem:(id)a3
{
  MUPlaceVenueInfoSectionController *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MUPlaceVenueInfoSectionController;
  v3 = -[MUPlaceSectionController initWithMapItem:](&v8, sel_initWithMapItem_, a3);
  if (v3)
  {
    MUGetPlaceCardLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceVenueInfoSectionControllerInit", ", v7, 2u);
    }

    -[MUPlaceVenueInfoSectionController _setupSectionView](v3, "_setupSectionView");
    MUGetPlaceCardLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceVenueInfoSectionControllerInit", ", v7, 2u);
    }

  }
  return v3;
}

- (void)_setupSectionView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MUTextPairVerticalCardView *v7;
  MUTextPairVerticalCardView *v8;
  MUTextPairVerticalCardView *contentView;
  MUTextPairVerticalCardView *v10;
  void *v11;
  MUPlaceSectionView *v12;
  MUPlaceSectionView *sectionView;
  id v14;

  -[MUPlaceSectionController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_venueInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contents");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUTextPairViewModel textPairViewModelsFromStrings:](MUTextPairViewModel, "textPairViewModelsFromStrings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [MUTextPairVerticalCardView alloc];
  v8 = -[MUTextPairVerticalCardView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  contentView = self->_contentView;
  self->_contentView = v8;

  -[MUTextPairVerticalCardView setViewModels:](self->_contentView, "setViewModels:", v6);
  v10 = self->_contentView;
  -[MUPlaceVenueInfoSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:", v10, v11);
  v12 = (MUPlaceSectionView *)objc_claimAutoreleasedReturnValue();
  sectionView = self->_sectionView;
  self->_sectionView = v12;

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  MUPlaceSectionHeaderViewModel *sectionHeaderViewModel;
  MUPlaceSectionHeaderViewModel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MUPlaceSectionHeaderViewModel *v9;
  MUPlaceSectionHeaderViewModel *v10;

  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (!sectionHeaderViewModel)
  {
    v4 = [MUPlaceSectionHeaderViewModel alloc];
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_venueInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MUPlaceSectionHeaderViewModel initWithTitleString:](v4, "initWithTitleString:", v8);
    v10 = self->_sectionHeaderViewModel;
    self->_sectionHeaderViewModel = v9;

    sectionHeaderViewModel = self->_sectionHeaderViewModel;
  }
  return sectionHeaderViewModel;
}

- (int)analyticsModuleType
{
  return 17;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
