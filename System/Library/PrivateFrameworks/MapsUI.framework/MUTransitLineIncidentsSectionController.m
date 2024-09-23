@implementation MUTransitLineIncidentsSectionController

- (MUTransitLineIncidentsSectionController)initWithTransitLineItem:(id)a3
{
  MUTransitLineIncidentsSectionController *v3;
  MUTransitLineIncidentsSectionController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUTransitLineIncidentsSectionController;
  v3 = -[MUTransitLineItemSectionController initWithTransitLineItem:](&v6, sel_initWithTransitLineItem_, a3);
  v4 = v3;
  if (v3)
    -[MUTransitLineIncidentsSectionController _setupSection](v3, "_setupSection");
  return v4;
}

- (void)_setupSection
{
  MUTransitLineIncidentsViewController *v3;
  void *v4;
  MUFixedHeightAwareViewController *v5;
  MUFixedHeightAwareViewController *fixedHeightAwareVC;
  void *v7;
  MUPlaceSectionView *v8;
  void *v9;
  MUPlaceSectionView *v10;
  MUPlaceSectionView *sectionView;
  MUPlaceSectionView *v12;
  void *v13;
  MUTransitLineIncidentsViewController *v14;

  v3 = [MUTransitLineIncidentsViewController alloc];
  -[MUTransitLineItemSectionController lineItem](self, "lineItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MUTransitLineIncidentsViewController initWithLineItem:](v3, "initWithLineItem:", v4);

  -[MUTransitLineIncidentsViewController setIncidentsDelegate:](v14, "setIncidentsDelegate:", self);
  v5 = -[MUFixedHeightAwareViewController initWithViewController:]([MUFixedHeightAwareViewController alloc], "initWithViewController:", v14);
  fixedHeightAwareVC = self->_fixedHeightAwareVC;
  self->_fixedHeightAwareVC = v5;

  -[MUFixedHeightAwareViewController view](self->_fixedHeightAwareVC, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_mapsui_setCardCorner");

  v8 = [MUPlaceSectionView alloc];
  -[MUTransitLineItemSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:](v8, "initWithStyle:sectionHeaderViewModel:", 1, v9);
  sectionView = self->_sectionView;
  self->_sectionView = v10;

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
  v12 = self->_sectionView;
  -[MUFixedHeightAwareViewController view](self->_fixedHeightAwareVC, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionView attachViewToContentView:](v12, "attachViewToContentView:", v13);

}

- (UIViewController)sectionViewController
{
  return (UIViewController *)self->_fixedHeightAwareVC;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (BOOL)hasContent
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MUTransitLineItemSectionController lineItem](self, "lineItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incidents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)transitLineIncidentsViewController:(id)a3 didSelectDetailsForIncidents:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MUTransitLineIncidentsSectionController incidentsDelegate](self, "incidentsDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "incidentsSectionController:didSelectDetailsForIncidents:", self, v5);

}

- (MUTransitLineIncidentsSectionControllerDelegate)incidentsDelegate
{
  return (MUTransitLineIncidentsSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_incidentsDelegate);
}

- (void)setIncidentsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_incidentsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_incidentsDelegate);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_fixedHeightAwareVC, 0);
}

@end
