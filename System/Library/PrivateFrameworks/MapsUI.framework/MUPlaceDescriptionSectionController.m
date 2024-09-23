@implementation MUPlaceDescriptionSectionController

- (MUPlaceDescriptionSectionController)initWithMapItem:(id)a3 configuration:(id)a4
{
  id v7;
  MUPlaceDescriptionSectionController *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MUPlaceDescriptionSectionController;
  v8 = -[MUPlaceSectionController initWithMapItem:](&v13, sel_initWithMapItem_, a3);
  if (v8)
  {
    MUGetPlaceCardLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceDescriptionSectionControllerInit", ", v12, 2u);
    }

    objc_storeStrong((id *)&v8->_configuration, a4);
    -[MUPlaceDescriptionSectionController _setupTextBlurb](v8, "_setupTextBlurb");
    MUGetPlaceCardLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceDescriptionSectionControllerInit", ", v12, 2u);
    }

  }
  return v8;
}

- (void)_setupTextBlurb
{
  MUExpandableBlurbView *v3;
  MUExpandableBlurbView *v4;
  MUExpandableBlurbView *blurbView;
  void *v6;
  MUExpandableBlurbView *v7;
  MUExpandableBlurbView *v8;
  void *v9;
  void *v10;
  MUPlaceSectionView *v11;
  MUPlaceSectionView *sectionView;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v3 = [MUExpandableBlurbView alloc];
  v4 = -[MUExpandableBlurbView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  blurbView = self->_blurbView;
  self->_blurbView = v4;

  -[MUPlaceDescriptionConfiguration textBlockText](self->_configuration, "textBlockText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUExpandableBlurbView setText:](self->_blurbView, "setText:", v6);

  objc_initWeak(&location, self);
  v7 = self->_blurbView;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __54__MUPlaceDescriptionSectionController__setupTextBlurb__block_invoke;
  v16 = &unk_1E2E01DA8;
  objc_copyWeak(&v17, &location);
  -[MUExpandableBlurbView setResizeBlock:](v7, "setResizeBlock:", &v13);
  v8 = self->_blurbView;
  -[MUPlaceDescriptionSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel", v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceDescriptionSectionController sectionFooterViewModel](self, "sectionFooterViewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:sectionFooterViewModel:alwaysInsetContentView:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:sectionFooterViewModel:alwaysInsetContentView:", v8, v9, v10, 0);
  v11 = (MUPlaceSectionView *)objc_claimAutoreleasedReturnValue();
  sectionView = self->_sectionView;
  self->_sectionView = v11;

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __54__MUPlaceDescriptionSectionController__setupTextBlurb__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeSectionControllerRequestsRootView:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x1E0DC3F10];
    v7[4] = v2;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__MUPlaceDescriptionSectionController__setupTextBlurb__block_invoke_2;
    v8[3] = &unk_1E2E01970;
    v9 = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__MUPlaceDescriptionSectionController__setupTextBlurb__block_invoke_3;
    v7[3] = &unk_1E2E01B00;
    v6 = v4;
    objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 4, v8, v7, 0.3, 0.0);

  }
}

uint64_t __54__MUPlaceDescriptionSectionController__setupTextBlurb__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mapsui_layoutIfNeeded");
}

void __54__MUPlaceDescriptionSectionController__setupTextBlurb__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeSectionControllerRequestsLayoutChange:", *(_QWORD *)(a1 + 32));

}

- (id)sectionView
{
  return self->_sectionView;
}

- (id)sectionHeaderViewModel
{
  MUPlaceSectionHeaderViewModel *v2;
  void *v3;
  MUPlaceSectionHeaderViewModel *v4;

  if (-[MUPlaceDescriptionConfiguration showSectionTitle](self->_configuration, "showSectionTitle"))
  {
    v2 = [MUPlaceSectionHeaderViewModel alloc];
    _MULocalizedStringFromThisBundle(CFSTR("About [Placecard]"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[MUPlaceSectionHeaderViewModel initWithTitleString:](v2, "initWithTitleString:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)sectionFooterViewModel
{
  void *v3;
  MUPlaceFooterAtributionViewModel *footerViewModel;
  void *v5;
  MUPlaceFooterAtributionViewModel *v6;
  MUPlaceFooterAtributionViewModel *v7;
  MUPlaceFooterAtributionViewModel *v8;
  _QWORD v10[4];
  id v11;
  id location;

  -[MUPlaceDescriptionConfiguration attribution](self->_configuration, "attribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  footerViewModel = self->_footerViewModel;
  if (!footerViewModel)
  {
    -[MUPlaceDescriptionConfiguration attribution](self->_configuration, "attribution");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPlaceFooterAtributionViewModel viewModelForGeoMapItemAttribution:](MUPlaceFooterAtributionViewModel, "viewModelForGeoMapItemAttribution:", v5);
    v6 = (MUPlaceFooterAtributionViewModel *)objc_claimAutoreleasedReturnValue();
    v7 = self->_footerViewModel;
    self->_footerViewModel = v6;

    objc_initWeak(&location, self);
    v8 = self->_footerViewModel;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__MUPlaceDescriptionSectionController_sectionFooterViewModel__block_invoke;
    v10[3] = &unk_1E2E01DA8;
    objc_copyWeak(&v11, &location);
    -[MUPlaceSectionFooterViewModel setActionBlock:](v8, "setActionBlock:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    footerViewModel = self->_footerViewModel;
  }
  return footerViewModel;
}

void __61__MUPlaceDescriptionSectionController_sectionFooterViewModel__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_attributionTapped");
    WeakRetained = v2;
  }

}

- (void)_attributionTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MUPlaceDescriptionConfiguration attribution](self->_configuration, "attribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "providerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_reviewsAttribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "providerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", 6020, v4, 0, v7);

  -[MUPlaceDescriptionSectionController actionDelegate](self, "actionDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placeDescriptionSectionControllerDidTapAttribution:", self);

}

- (id)infoCardChildPossibleActions
{
  void *v2;

  -[MUPlaceDescriptionConfiguration attribution](self->_configuration, "attribution");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return &unk_1E2E55C90;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (int)analyticsModuleType
{
  return 8;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (MUPlaceDescriptionSectionControllerDelegate)actionDelegate
{
  return (MUPlaceDescriptionSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_footerViewModel, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_blurbView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
