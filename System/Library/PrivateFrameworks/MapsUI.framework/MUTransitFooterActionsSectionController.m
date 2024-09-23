@implementation MUTransitFooterActionsSectionController

- (MUTransitFooterActionsSectionController)initWithTransitLineItem:(id)a3 actionManager:(id)a4
{
  id v6;
  MUTransitFooterActionsSectionController *v7;
  MUFooterActionsSectionController *v8;
  MUFooterActionsSectionController *underlyingSectionController;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MUTransitFooterActionsSectionController;
  v7 = -[MUTransitLineItemSectionController initWithTransitLineItem:](&v11, sel_initWithTransitLineItem_, a3);
  if (v7)
  {
    v8 = -[MUFooterActionsSectionController initWithActionManager:]([MUFooterActionsSectionController alloc], "initWithActionManager:", v6);
    underlyingSectionController = v7->_underlyingSectionController;
    v7->_underlyingSectionController = v8;

  }
  return v7;
}

- (UIView)sectionView
{
  return -[MUFooterActionsSectionController sectionView](self->_underlyingSectionController, "sectionView");
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

  -[MUTransitFooterActionsSectionController sectionView](self, "sectionView");
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

- (void)reloadData
{
  -[MUFooterActionsSectionController reloadData](self->_underlyingSectionController, "reloadData");
}

- (void)setAnalyticsDelegate:(id)a3
{
  -[MUFooterActionsSectionController setAnalyticsDelegate:](self->_underlyingSectionController, "setAnalyticsDelegate:", a3);
}

- (MUInfoCardAnalyticsDelegate)analyticsDelegate
{
  return -[MUFooterActionsSectionController analyticsDelegate](self->_underlyingSectionController, "analyticsDelegate");
}

- (id)infoCardChildPossibleActions
{
  return -[MUFooterActionsSectionController infoCardChildPossibleActions](self->_underlyingSectionController, "infoCardChildPossibleActions");
}

- (id)infoCardChildUnactionableUIElements
{
  return -[MUFooterActionsSectionController infoCardChildUnactionableUIElements](self->_underlyingSectionController, "infoCardChildUnactionableUIElements");
}

- (id)analyticsModule
{
  return -[MUFooterActionsSectionController analyticsModule](self->_underlyingSectionController, "analyticsModule");
}

- (id)revealedAnalyticsModule
{
  return -[MUFooterActionsSectionController revealedAnalyticsModule](self->_underlyingSectionController, "revealedAnalyticsModule");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSectionController, 0);
}

@end
