@implementation MUNearestStationSectionController

- (MUNearestStationSectionController)initWithTransitLineItem:(id)a3 etaProvider:(id)a4
{
  id v7;
  MUNearestStationSectionController *v8;
  MUNearestStationSectionController *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MUNearestStationSectionController;
  v8 = -[MUTransitLineItemSectionController initWithTransitLineItem:](&v11, sel_initWithTransitLineItem_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_etaProvider, a4);
    -[MKETAProvider addObserver:](v9->_etaProvider, "addObserver:", v9);
    -[MUNearestStationSectionController _createNearestStationSection](v9, "_createNearestStationSection");
  }

  return v9;
}

- (void)_createNearestStationSection
{
  MUNearestStationRowView *v3;
  MUNearestStationRowView *v4;
  MUNearestStationRowView *nearestStationRowView;
  void *v6;
  MUPlaceVerticalCardContainerView *v7;
  MUPlaceVerticalCardContainerView *containerView;
  MUPlaceVerticalCardContainerView *v9;
  void *v10;
  void *v11;
  MUPlaceFooterAtributionViewModel *v12;
  MUPlaceFooterAtributionViewModel *footerViewModel;
  MUPlaceFooterAtributionViewModel *v14;
  MUPlaceVerticalCardContainerView *v15;
  void *v16;
  void *v17;
  MUPlaceSectionView *v18;
  MUPlaceSectionView *sectionView;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = [MUNearestStationRowView alloc];
  v4 = -[MUNearestStationRowView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  nearestStationRowView = self->_nearestStationRowView;
  self->_nearestStationRowView = v4;

  +[MUPlaceVerticalCardConfiguration plainConfiguration](MUPlaceVerticalCardConfiguration, "plainConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MUPlaceVerticalCardContainerView initWithConfiguration:]([MUPlaceVerticalCardContainerView alloc], "initWithConfiguration:", v6);
  containerView = self->_containerView;
  self->_containerView = v7;

  -[MUPlaceVerticalCardContainerView setDelegate:](self->_containerView, "setDelegate:", self);
  v9 = self->_containerView;
  v26[0] = self->_nearestStationRowView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceVerticalCardContainerView setRowViews:](v9, "setRowViews:", v10);

  -[MUTransitLineItemSectionController lineItem](self, "lineItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUPlaceFooterAtributionViewModel viewModelForMapItem:transitLine:](MUPlaceFooterAtributionViewModel, "viewModelForMapItem:transitLine:", 0, v11);
  v12 = (MUPlaceFooterAtributionViewModel *)objc_claimAutoreleasedReturnValue();
  footerViewModel = self->_footerViewModel;
  self->_footerViewModel = v12;

  objc_initWeak(&location, self);
  v14 = self->_footerViewModel;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __65__MUNearestStationSectionController__createNearestStationSection__block_invoke;
  v23 = &unk_1E2E01DA8;
  objc_copyWeak(&v24, &location);
  -[MUPlaceSectionFooterViewModel setActionBlock:](v14, "setActionBlock:", &v20);
  v15 = self->_containerView;
  -[MUNearestStationSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel", v20, v21, v22, v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUNearestStationSectionController sectionFooterViewModel](self, "sectionFooterViewModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:sectionFooterViewModel:alwaysInsetContentView:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:sectionFooterViewModel:alwaysInsetContentView:", v15, v16, v17, 1);
  v18 = (MUPlaceSectionView *)objc_claimAutoreleasedReturnValue();
  sectionView = self->_sectionView;
  self->_sectionView = v18;

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __65__MUNearestStationSectionController__createNearestStationSection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleAttributionTap");
    WeakRetained = v2;
  }

}

- (void)updateWithMapItem:(id)a3 isLoading:(BOOL)a4
{
  id v6;
  id v7;

  objc_storeStrong((id *)&self->_nearestStation, a3);
  v6 = a3;
  -[MUNearestStationRowView configureWithNearestStation:](self->_nearestStationRowView, "configureWithNearestStation:", v6);
  -[MKETAProvider rawDistanceString](self->_etaProvider, "rawDistanceString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MUNearestStationRowView setDistanceString:](self->_nearestStationRowView, "setDistanceString:", v7);

}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MUPlaceSectionHeaderViewModel *v10;

  -[MUTransitLineItemSectionController lineItem](self, "lineItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(v2, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "system");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v5, "length"))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      _MULocalizedStringFromThisBundle(CFSTR("Nearest %@ Station"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v8, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _MULocalizedStringFromThisBundle(CFSTR("Nearest Station"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = -[MUPlaceSectionHeaderViewModel initWithTitleString:]([MUPlaceSectionHeaderViewModel alloc], "initWithTitleString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MUPlaceSectionFooterViewModel)sectionFooterViewModel
{
  return (MUPlaceSectionFooterViewModel *)self->_footerViewModel;
}

- (void)_handleAttributionTap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTileGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MUNearestStationSectionController nearestStationDelegate](self, "nearestStationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nearestStationSectionController:didSelectStationAttributionURL:", self, v8);

  }
}

- (void)ETAProviderUpdated:(id)a3
{
  id v4;

  objc_msgSend(a3, "rawDistanceString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MUNearestStationRowView setDistanceString:](self->_nearestStationRowView, "setDistanceString:", v4);

}

- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5
{
  id v6;

  if (self->_nearestStationRowView == a4)
  {
    -[MUNearestStationSectionController nearestStationDelegate](self, "nearestStationDelegate", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nearestStationSectionController:didTapStationItem:", self, self->_nearestStation);

  }
}

- (MUNearestStationSectionControllerDelegate)nearestStationDelegate
{
  return (MUNearestStationSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_nearestStationDelegate);
}

- (void)setNearestStationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_nearestStationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nearestStationDelegate);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_footerViewModel, 0);
  objc_storeStrong((id *)&self->_nearestStationRowView, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_nearestStation, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
}

@end
