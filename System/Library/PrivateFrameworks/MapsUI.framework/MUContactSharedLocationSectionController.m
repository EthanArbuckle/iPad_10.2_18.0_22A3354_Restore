@implementation MUContactSharedLocationSectionController

- (MUContactSharedLocationSectionController)initWithPlaceItem:(id)a3 availability:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MUContactSharedLocationSectionController *v10;
  NSObject *v11;
  void *v12;
  MUContactsViewModelGenerator *v13;
  void *v14;
  uint64_t v15;
  MUContactsViewModelGenerator *contactViewModelGenerator;
  NSObject *v17;
  uint8_t v19[16];
  objc_super v20;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)MUContactSharedLocationSectionController;
  v10 = -[MUPlaceSectionController initWithMapItem:](&v20, sel_initWithMapItem_, v9);

  if (v10)
  {
    MUGetPlaceCardLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUContactSharedLocationSectionController", ", v19, 2u);
    }

    objc_storeStrong((id *)&v10->_placeItem, a3);
    objc_storeStrong((id *)&v10->_availability, a4);
    -[_MKPlaceItem contact](v10->_placeItem, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [MUContactsViewModelGenerator alloc];
      -[_MKPlaceItem contact](v10->_placeItem, "contact");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MUContactsViewModelGenerator initWithContact:](v13, "initWithContact:", v14);
      contactViewModelGenerator = v10->_contactViewModelGenerator;
      v10->_contactViewModelGenerator = (MUContactsViewModelGenerator *)v15;

    }
    -[MUContactSharedLocationSectionController _buildSections](v10, "_buildSections");
    MUGetPlaceCardLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUContactSharedLocationSectionController", ", v19, 2u);
    }

  }
  return v10;
}

- (NSArray)sectionViews
{
  return (NSArray *)(id)-[NSArray copy](self->_sectionViews, "copy");
}

- (BOOL)hasContent
{
  return -[NSArray count](self->_sectionViews, "count") != 0;
}

- (id)draggableContent
{
  void *v3;
  uint64_t v4;
  id v6;
  NSMutableArray *sectionStackViews;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  -[NSArray firstObject](self->_sectionViews, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MUIdiomInTraitEnvironment(v3);

  if (v4 == 5)
    return 0;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  sectionStackViews = self->_sectionStackViews;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__MUContactSharedLocationSectionController_draggableContent__block_invoke;
  v10[3] = &unk_1E2E033F0;
  v11 = v6;
  v8 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](sectionStackViews, "enumerateObjectsUsingBlock:", v10);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

void __60__MUContactSharedLocationSectionController_draggableContent__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "draggableContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);
    v3 = v4;
  }

}

- (BOOL)isImpressionable
{
  return 0;
}

- (int)analyticsModuleType
{
  return 0;
}

- (void)_buildSections
{
  NSArray *v3;
  NSArray *sectionViews;
  NSMutableArray *v5;
  NSMutableArray *sectionStackViews;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  NSArray *v15;
  NSArray *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  MUContactSharedLocationSectionController *v20;
  id v21;
  id v22;

  v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  sectionViews = self->_sectionViews;
  self->_sectionViews = v3;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  sectionStackViews = self->_sectionStackViews;
  self->_sectionStackViews = v5;

  -[_MKPlaceItem contact](self->_placeItem, "contact");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17
    && MapsFeature_IsEnabled_MapsWally()
    && -[_MKPlaceItem representsPerson](self->_placeItem, "representsPerson"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v17, "postalAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __58__MUContactSharedLocationSectionController__buildSections__block_invoke;
    v18[3] = &unk_1E2E03418;
    v19 = v7;
    v20 = self;
    v21 = v17;
    v22 = v9;
    v10 = v9;
    v11 = v7;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v18);
    -[MUContactsViewModelGenerator sectionViewsFromContentViews:headerLabels:](self->_contactViewModelGenerator, "sectionViewsFromContentViews:headerLabels:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (NSMutableArray *)objc_msgSend(v11, "copy");
    v14 = self->_sectionStackViews;
    self->_sectionStackViews = v13;

    v15 = (NSArray *)objc_msgSend(v12, "copy");
    v16 = self->_sectionViews;
    self->_sectionViews = v15;

  }
}

void __58__MUContactSharedLocationSectionController__buildSections__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "_mapkit_sharedLocationContactIdentifer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_loadPlaceInfoAddress:contact:", v10, *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_mapsui_addObjectIfNotNil:", v7);

    v8 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "headerLabelFromAddress:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

- (id)_loadPlaceInfoAddress:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(void *, void *, _QWORD *);
  void *v14;
  id v15;
  id v16;
  void *v17;
  MUPlaceInfoSectionView *v18;
  void *v19;
  MUPlaceInfoSectionView *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MUGetPlaceCardLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v9;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_DEBUG, "Building section view for address: %@, contact: %@", buf, 0x16u);

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__MUContactSharedLocationSectionController__loadPlaceInfoAddress_contact___block_invoke;
  aBlock[3] = &unk_1E2E03440;
  v12 = v10;
  v31 = v12;
  v13 = (void (**)(void *, void *, _QWORD *))_Block_copy(aBlock);
  -[MUContactsViewModelGenerator viewModelForAddress:](self->_contactViewModelGenerator, "viewModelForAddress:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v23 = v11;
  v24 = 3221225472;
  v25 = __74__MUContactSharedLocationSectionController__loadPlaceInfoAddress_contact___block_invoke_2;
  v26 = &unk_1E2E03468;
  objc_copyWeak(&v29, (id *)buf);
  v15 = v6;
  v27 = v15;
  v16 = v7;
  v28 = v16;
  v13[2](v13, v14, &v23);
  -[MUContactSharedLocationSectionController mapItemCoordinateViewModel](self, "mapItemCoordinateViewModel", v23, v24, v25, v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13, v17, 0);

  v18 = [MUPlaceInfoSectionView alloc];
  +[MUInfoCardStyle preferredVerticalCardConfiguration](MUInfoCardStyle, "preferredVerticalCardConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MUPlaceVerticalCardContainerView initWithConfiguration:](v18, "initWithConfiguration:", v19);

  -[MUPlaceInfoSectionView setAccessibilityIdentifier:](v20, "setAccessibilityIdentifier:", CFSTR("PlaceDetailsInfo"));
  v21 = (void *)objc_msgSend(v12, "copy");
  -[MUPlaceInfoSectionView setViewModels:](v20, "setViewModels:", v21);

  -[NSMutableArray addObject:](self->_sectionStackViews, "addObject:", v20);
  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);

  return v20;
}

void __74__MUContactSharedLocationSectionController__loadPlaceInfoAddress_contact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  if (a2)
  {
    v6 = a2;
    v5 = (void *)objc_msgSend(a3, "copy");
    objc_msgSend(v6, "setActionBlock:", v5);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }
}

void __74__MUContactSharedLocationSectionController__loadPlaceInfoAddress_contact___block_invoke_2(uint64_t a1)
{
  MUPresentationOptions *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MUPresentationOptions);
    objc_msgSend(WeakRetained, "contactSharedLocationSectionDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contactSharedLocationSectionController:selectedDirectionsWithAddress:forContact:options:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v2);

  }
}

- (id)mapItemCoordinateViewModel
{
  MUCoordinateViewModel *v3;
  void *v4;
  MUCoordinateViewModel *v5;
  MULabeledValueActionViewModel *v6;
  void *v7;
  void *v8;

  if (-[MUPlaceDataAvailability supportsShowingCoordinates](self->_availability, "supportsShowingCoordinates"))
  {
    v3 = [MUCoordinateViewModel alloc];
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MUCoordinateViewModel initWithMapItem:isUserLocation:](v3, "initWithMapItem:isUserLocation:", v4, -[_MKPlaceItem options](self->_placeItem, "options") & 1);

    v6 = objc_alloc_init(MULabeledValueActionViewModel);
    -[MUCoordinateViewModel titleString](v5, "titleString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabeledValueActionViewModel setTitleString:](v6, "setTitleString:", v7);

    -[MUCoordinateViewModel valueString](v5, "valueString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabeledValueActionViewModel setValueString:](v6, "setValueString:", v8);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MUContactSharedLocationSectionControllerDelegate)contactSharedLocationSectionDelegate
{
  return (MUContactSharedLocationSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_contactSharedLocationSectionDelegate);
}

- (void)setContactSharedLocationSectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contactSharedLocationSectionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contactSharedLocationSectionDelegate);
  objc_storeStrong((id *)&self->_contactViewModelGenerator, 0);
  objc_storeStrong((id *)&self->_sectionViews, 0);
  objc_storeStrong((id *)&self->_sectionStackViews, 0);
  objc_storeStrong((id *)&self->_availability, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
}

@end
