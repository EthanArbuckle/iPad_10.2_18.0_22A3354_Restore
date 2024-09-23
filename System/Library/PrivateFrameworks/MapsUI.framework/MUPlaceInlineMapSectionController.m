@implementation MUPlaceInlineMapSectionController

- (MUPlaceInlineMapSectionController)initWithMapItem:(id)a3 configuration:(id)a4
{
  id v7;
  MUPlaceInlineMapSectionController *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MUPlaceInlineMapSectionController;
  v8 = -[MUPlaceSectionController initWithMapItem:](&v13, sel_initWithMapItem_, a3);
  if (v8)
  {
    MUGetPlaceCardLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceInlineMapSectionControllerInit", ", v12, 2u);
    }

    objc_storeStrong((id *)&v8->_configuration, a4);
    -[MUPlaceInlineMapSectionController _setupInlineMap](v8, "_setupInlineMap");
    MUGetPlaceCardLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceInlineMapSectionControllerInit", ", v12, 2u);
    }

  }
  return v8;
}

- (void)_setupInlineMap
{
  void *v3;
  void *v4;
  MKPlaceInlineMapViewController *v5;
  MKPlaceInlineMapViewController *inlineMapViewController;
  void *v7;
  void *v8;
  MKPlacePoisInlineMapViewController *v9;
  MKPlacePoisInlineMapViewController *poiInlineMapViewController;

  v3 = (void *)MEMORY[0x1E0CC18E8];
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inlineMapWithMapItem:configuration:", v4, self->_configuration);
  v5 = (MKPlaceInlineMapViewController *)objc_claimAutoreleasedReturnValue();
  inlineMapViewController = self->_inlineMapViewController;
  self->_inlineMapViewController = v5;

  -[MKPlaceInlineMapViewController setBottomHairlineHidden:](self->_inlineMapViewController, "setBottomHairlineHidden:", 1);
  -[MKPlaceInlineMapViewController setDelegate:](self->_inlineMapViewController, "setDelegate:", self);
  v7 = (void *)MEMORY[0x1E0CC18F8];
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inlineMapWithMapItem:configuration:", v8, self->_configuration);
  v9 = (MKPlacePoisInlineMapViewController *)objc_claimAutoreleasedReturnValue();
  poiInlineMapViewController = self->_poiInlineMapViewController;
  self->_poiInlineMapViewController = v9;

  -[MKPlacePoisInlineMapViewController setBottomHairlineHidden:](self->_poiInlineMapViewController, "setBottomHairlineHidden:", 1);
}

- (void)setLocation:(id)a3
{
  -[MKPlacePoisInlineMapViewController setLocation:](self->_poiInlineMapViewController, "setLocation:", a3);
}

- (CLLocation)location
{
  return (CLLocation *)-[MKPlacePoisInlineMapViewController location](self->_poiInlineMapViewController, "location");
}

- (void)updateWithMapItem:(id)a3
{
  -[MKPlacePoisInlineMapViewController setMapItem:](self->_poiInlineMapViewController, "setMapItem:", a3);
}

- (UIView)sectionView
{
  MUPlaceSectionView *sectionView;
  MUPlaceSectionView *v3;
  MKPlaceInlineMapViewController *inlineMapViewController;
  void *v6;
  MUPlaceSectionView *v7;
  void *v8;
  MUPlaceSectionView *v9;
  MUPlaceSectionView *v10;

  sectionView = self->_sectionView;
  if (sectionView)
  {
    v3 = sectionView;
  }
  else
  {
    inlineMapViewController = self->_inlineMapViewController;
    if (!inlineMapViewController)
      inlineMapViewController = self->_poiInlineMapViewController;
    -[MKPlaceInlineMapViewController view](inlineMapViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPreservesSuperviewLayoutMargins:", 0);
    v7 = [MUPlaceSectionView alloc];
    -[MUPlaceInlineMapSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:](v7, "initWithStyle:sectionHeaderViewModel:", 1, v8);
    v10 = self->_sectionView;
    self->_sectionView = v9;

    -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
    -[MUPlaceSectionView attachViewToContentView:](self->_sectionView, "attachViewToContentView:", v6);
    v3 = self->_sectionView;

  }
  return (UIView *)v3;
}

- (UIViewController)sectionViewController
{
  MKPlaceInlineMapViewController *inlineMapViewController;

  inlineMapViewController = self->_inlineMapViewController;
  if (!inlineMapViewController)
    inlineMapViewController = self->_poiInlineMapViewController;
  return (UIViewController *)inlineMapViewController;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  MUPlaceSectionHeaderViewModel *v2;
  MUPlaceSectionHeaderViewModel *v3;
  void *v4;

  if ((-[MKPlaceInlineMapViewControllerConfiguration suppressSectionHeader](self->_configuration, "suppressSectionHeader") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v3 = [MUPlaceSectionHeaderViewModel alloc];
    _MULocalizedStringFromThisBundle(CFSTR("Maps [Inline Map Title]"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[MUPlaceSectionHeaderViewModel initWithTitleString:](v3, "initWithTitleString:", v4);

  }
  return v2;
}

- (BOOL)hasContent
{
  return self->_inlineMapViewController || self->_poiInlineMapViewController != 0;
}

- (int)analyticsModuleType
{
  return 3;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (BOOL)inlineMapViewControllerDidSelectMap:(id)a3
{
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", 6007, 0, 0, 0);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_poiInlineMapViewController, 0);
  objc_storeStrong((id *)&self->_inlineMapViewController, 0);
}

@end
