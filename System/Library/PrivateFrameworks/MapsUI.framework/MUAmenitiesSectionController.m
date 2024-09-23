@implementation MUAmenitiesSectionController

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  MUPlaceSectionHeaderViewModel *sectionHeaderViewModel;
  MUPlaceSectionHeaderViewModel *v4;
  void *v5;
  MUPlaceSectionHeaderViewModel *v6;
  MUPlaceSectionHeaderViewModel *v7;

  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (!sectionHeaderViewModel)
  {
    v4 = [MUPlaceSectionHeaderViewModel alloc];
    _MULocalizedStringFromThisBundle(CFSTR("Good to Know [Placecard]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MUPlaceSectionHeaderViewModel initWithTitleString:](v4, "initWithTitleString:", v5);
    v7 = self->_sectionHeaderViewModel;
    self->_sectionHeaderViewModel = v6;

    sectionHeaderViewModel = self->_sectionHeaderViewModel;
  }
  return sectionHeaderViewModel;
}

- (MUAmenitiesSectionController)initWithMapItem:(id)a3 moduleConiguration:(id)a4
{
  id v7;
  MUAmenitiesSectionController *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MUAmenitiesSectionController;
  v8 = -[MUPlaceSectionController initWithMapItem:](&v13, sel_initWithMapItem_, a3);
  if (v8)
  {
    MUGetPlaceCardLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUAmenitiesSectionControllerInit", ", v12, 2u);
    }

    objc_storeStrong((id *)&v8->_moduleConfig, a4);
    -[MUAmenitiesSectionController _setupAmenitiyRows](v8, "_setupAmenitiyRows");
    MUGetPlaceCardLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUAmenitiesSectionControllerInit", ", v12, 2u);
    }

  }
  return v8;
}

- (void)_setupAmenitiyRows
{
  MUAmenityListSectionConfiguration *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  MUAmenityListSectionView *v25;
  int64_t v26;
  double v27;
  void *v28;
  MUPlaceSectionView *v29;
  MUPlaceSectionView *sectionView;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MUAmenityListSectionConfiguration);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[GEOBusinessInfoModuleConfiguration factoidItemIndexes](self->_moduleConfig, "factoidItemIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        -[MUPlaceSectionController mapItem](self, "mapItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_encyclopedicInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "factoidAtIndex:", objc_msgSend(v10, "intValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v4, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v7);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[MUPlaceSectionController mapItem](self, "mapItem", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_amenities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        if (objc_msgSend(v21, "isApplePayAmenity"))
        {
          v22 = v21;

          v18 = v22;
        }
        else
        {
          objc_msgSend(v4, "addObject:", v21);
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  -[MUAmenityListSectionConfiguration setNumberInlineAmenities:](v3, "setNumberInlineAmenities:", GEOConfigGetUInteger());
  v23 = (void *)objc_msgSend(v4, "copy");
  -[MUAmenityListSectionConfiguration setViewModels:](v3, "setViewModels:", v23);

  if (v18)
  {
    +[MUAmenityApplePayConfiguration configurationFromAmenityItem:](MUAmenityApplePayConfiguration, "configurationFromAmenityItem:", v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUAmenityListSectionConfiguration setApplePayConfiguration:](v3, "setApplePayConfiguration:", v24);

  }
  v25 = -[MUAmenityListSectionView initWithAmenityListConfiguration:]([MUAmenityListSectionView alloc], "initWithAmenityListConfiguration:", v3);
  -[MUStackView setSpacing:](v25, "setSpacing:", 8.0);
  v26 = +[MUInfoCardStyle containerStyle](MUInfoCardStyle, "containerStyle");
  v27 = 16.0;
  if (v26 == 1)
    v27 = 0.0;
  -[MUStackView setContentEdgeInsets:](v25, "setContentEdgeInsets:", v27, 16.0, v27, 16.0);
  -[MUAmenitiesSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:", v25, v28);
  v29 = (MUPlaceSectionView *)objc_claimAutoreleasedReturnValue();
  sectionView = self->_sectionView;
  self->_sectionView = v29;

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (id)infoCardChildUnactionableUIElements
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", &unk_1E2E55488);
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasAmenityType:", 21) & 1) != 0)
  {
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "valueForAmenityType:", 21);

    if (v6)
      objc_msgSend(v3, "addObject:", &unk_1E2E554A0);
  }
  else
  {

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (int)analyticsModuleType
{
  return 10;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_amenitySectionView, 0);
  objc_storeStrong((id *)&self->_moduleConfig, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end
