@implementation MUTransitLineItemSectionController

- (MUTransitLineItemSectionController)initWithTransitLineItem:(id)a3
{
  id v5;
  MUTransitLineItemSectionController *v6;
  MUTransitLineItemSectionController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUTransitLineItemSectionController;
  v6 = -[MUTransitLineItemSectionController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lineItem, a3);

  return v7;
}

- (UIView)sectionView
{
  UIView *sectionView;
  id v4;
  UIView *v5;
  UIView *v6;

  sectionView = self->_sectionView;
  if (!sectionView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_sectionView;
    self->_sectionView = v5;

    sectionView = self->_sectionView;
  }
  return sectionView;
}

- (NSArray)sectionViews
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[MUTransitLineItemSectionController sectionView](self, "sectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (UIViewController)sectionViewController
{
  return 0;
}

- (id)draggableContent
{
  return 0;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  return 0;
}

- (MUPlaceSectionFooterViewModel)sectionFooterViewModel
{
  return 0;
}

- (BOOL)hasContent
{
  return 1;
}

- (id)infoCardChildPossibleActions
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)analyticsModule
{
  return (id)objc_opt_new();
}

- (id)revealedAnalyticsModule
{
  return 0;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
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

- (GEOTransitLineItem)lineItem
{
  return self->_lineItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end
