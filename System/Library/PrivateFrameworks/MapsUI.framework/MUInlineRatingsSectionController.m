@implementation MUInlineRatingsSectionController

- (MUInlineRatingsSectionController)initWithMapItem:(id)a3 inlineRatingsViewProvider:(id)a4
{
  id v6;
  MUInlineRatingsSectionController *v7;
  MUInlineRatingsSectionController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MUInlineRatingsSectionController;
  v7 = -[MUPlaceSectionController initWithMapItem:](&v10, sel_initWithMapItem_, a3);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_viewProvider, v6);
    -[MUInlineRatingsSectionController _setupSectionView](v8, "_setupSectionView");
  }

  return v8;
}

- (BOOL)hasContent
{
  return self->_inlineRatingsViewController != 0;
}

- (UIViewController)sectionViewController
{
  return self->_inlineRatingsViewController;
}

- (UIView)sectionView
{
  MUPlaceSectionView *sectionView;

  sectionView = self->_sectionView;
  if (!sectionView)
  {
    -[MUInlineRatingsSectionController _setupSectionView](self, "_setupSectionView");
    sectionView = self->_sectionView;
  }
  return (UIView *)sectionView;
}

- (void)_setupSectionView
{
  id WeakRetained;
  UIViewController *v4;
  UIViewController *inlineRatingsViewController;
  void *v6;
  MUPlaceSectionView *v7;
  void *v8;
  MUPlaceSectionView *v9;
  MUPlaceSectionView *sectionView;
  MUPlaceSectionView *v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
  objc_msgSend(WeakRetained, "inlineRatingsSectionControllerRequestsContentViewController:", self);
  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  inlineRatingsViewController = self->_inlineRatingsViewController;
  self->_inlineRatingsViewController = v4;

  -[UIViewController setViewRespectsSystemMinimumLayoutMargins:](self->_inlineRatingsViewController, "setViewRespectsSystemMinimumLayoutMargins:", 0);
  -[UIViewController view](self->_inlineRatingsViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);

  if (self->_inlineRatingsViewController)
  {
    v7 = [MUPlaceSectionView alloc];
    -[MUInlineRatingsSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:](v7, "initWithStyle:sectionHeaderViewModel:", 0, v8);
    sectionView = self->_sectionView;
    self->_sectionView = v9;

    v11 = self->_sectionView;
    -[UIViewController view](self->_inlineRatingsViewController, "view");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionView attachViewToContentView:](v11, "attachViewToContentView:", v12);

  }
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  MUPlaceSectionHeaderViewModel *v2;
  void *v3;
  MUPlaceSectionHeaderViewModel *v4;

  v2 = [MUPlaceSectionHeaderViewModel alloc];
  _MULocalizedStringFromThisBundle(CFSTR("Rate This Place [Section Header]"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MUPlaceSectionHeaderViewModel initWithTitleString:](v2, "initWithTitleString:", v3);

  return v4;
}

- (int)analyticsModuleType
{
  return 36;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_storeStrong((id *)&self->_inlineRatingsViewController, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end
