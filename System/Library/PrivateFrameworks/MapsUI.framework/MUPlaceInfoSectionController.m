@implementation MUPlaceInfoSectionController

- (MUPlaceInfoSectionController)initWithPlaceItem:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MUPlaceInfoSectionController *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  objc_super v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceInfoSectionController;
  v10 = -[MUPlaceSectionController initWithMapItem:](&v15, sel_initWithMapItem_, v9);

  if (v10)
  {
    MUGetPlaceCardLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceInfoSectionControllerInit", ", v14, 2u);
    }

    objc_storeStrong((id *)&v10->_configuration, a4);
    objc_storeStrong((id *)&v10->_placeItem, a3);
    -[MUPlaceInfoSectionController _buildSections](v10, "_buildSections");
    MUGetPlaceCardLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceInfoSectionControllerInit", ", v14, 2u);
    }

  }
  return v10;
}

- (MUPlaceHoursSectionViewConfiguration)hoursConfig
{
  return -[MUPlaceInfoSectionControllerConfiguration hoursConfiguration](self->_configuration, "hoursConfiguration");
}

- (void)setPlaceNumberOfReportsInReview:(unint64_t)a3
{
  if (self->_placeNumberOfReportsInReview != a3)
  {
    self->_placeNumberOfReportsInReview = a3;
    self->_needsUpdate = 1;
  }
}

- (void)refreshContents
{
  id v3;

  if (self->_needsUpdate)
  {
    self->_needsUpdate = 0;
    -[MUPlaceInfoSectionController _buildSections](self, "_buildSections");
    -[MUPlaceSectionController delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeSectionControllerDidUpdateContent:", self);

  }
}

- (GEOInlineRapEnablement)inlineRapEnablement
{
  void *v2;
  void *v3;
  void *v4;

  -[MUPlaceSectionController mapItem](self, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_inlineRapEnablement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOInlineRapEnablement *)v4;
}

- (void)_buildSections
{
  NSArray *v3;
  NSArray *sectionViews;
  NSMutableArray *v5;
  NSMutableArray *sectionStackViews;
  MUContactsViewModelGenerator *v7;
  MUContactsViewModelGenerator *contactsViewModelGenerator;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *v19;
  NSArray *v20;
  NSArray *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;
  NSArray *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[4];
  id v32;
  MUPlaceInfoSectionController *v33;
  id v34;
  id v35;

  v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  sectionViews = self->_sectionViews;
  self->_sectionViews = v3;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  sectionStackViews = self->_sectionStackViews;
  self->_sectionStackViews = v5;

  -[_MKPlaceItem contact](self->_placeItem, "contact");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (v28
    && MapsFeature_IsEnabled_MapsWally()
    && -[_MKPlaceItem representsPerson](self->_placeItem, "representsPerson"))
  {
    v7 = -[MUContactsViewModelGenerator initWithContact:]([MUContactsViewModelGenerator alloc], "initWithContact:", v28);
    contactsViewModelGenerator = self->_contactsViewModelGenerator;
    self->_contactsViewModelGenerator = v7;

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v28, "postalAddresses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __46__MUPlaceInfoSectionController__buildSections__block_invoke;
    v31[3] = &unk_1E2E03418;
    v32 = v9;
    v33 = self;
    v12 = v28;
    v34 = v12;
    v35 = v11;
    v13 = v11;
    v14 = v9;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v31);
    -[MUPlaceInfoSectionController _loadViewWithContactMetadata:](self, "_loadViewWithContactMetadata:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_mapsui_addObjectIfNotNil:", v15);

    _MULocalizedStringFromThisBundle(CFSTR("Details [Placecard]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v16);

    -[MUContactsViewModelGenerator sectionViewsFromContentViews:headerLabels:](self->_contactsViewModelGenerator, "sectionViewsFromContentViews:headerLabels:", v14, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (NSMutableArray *)objc_msgSend(v14, "copy");
    v19 = self->_sectionStackViews;
    self->_sectionStackViews = v18;

    v20 = (NSArray *)objc_msgSend(v17, "copy");
    v21 = self->_sectionViews;
    self->_sectionViews = v20;

  }
  else
  {
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[MUPlaceInfoSectionController _loadRAPStatusViewIfNeeded](self, "_loadRAPStatusViewIfNeeded");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_mapsui_addObjectIfNotNil:", v23);

    -[MUPlaceInfoSectionController _loadHoursContentViewIfNeeded](self, "_loadHoursContentViewIfNeeded");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_mapsui_addObjectIfNotNil:", v24);

    -[MUPlaceInfoSectionController _loadPlaceInfoContentIfNeeded](self, "_loadPlaceInfoContentIfNeeded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray _mapsui_addObjectIfNotNil:](self->_sectionStackViews, "_mapsui_addObjectIfNotNil:", v10);
    objc_msgSend(v22, "_mapsui_addObjectIfNotNil:", v10);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __46__MUPlaceInfoSectionController__buildSections__block_invoke_2;
    v29[3] = &unk_1E2E03F28;
    v29[4] = self;
    v30 = v22;
    v14 = v22;
    MUMap(v14, v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (NSArray *)objc_msgSend(v25, "copy");
    v27 = self->_sectionViews;
    self->_sectionViews = v26;

  }
}

void __46__MUPlaceInfoSectionController__buildSections__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
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

  if ((v5 & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_loadPlaceInfoAddress:contact:", v10, *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_mapsui_addObjectIfNotNil:", v7);

    v8 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "headerLabelFromAddress:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

id __46__MUPlaceInfoSectionController__buildSections__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  id v5;
  id v6;
  _QWORD *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v14;
  void *v15;

  v3 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "isDeveloperPlaceCard") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v5 == v3;

  }
  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD **)(a1 + 32);
  v8 = (id)v7[14];
  if (v4)
  {
    objc_msgSend(v7, "sectionHeaderViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (v6 != v3)
  {
    +[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:sectionFooterViewModel:alwaysInsetContentView:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:sectionFooterViewModel:alwaysInsetContentView:", v3, v9, 0, v8 == v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_10;
    goto LABEL_9;
  }
  v14 = v8 == v3;
  objc_msgSend(*(id *)(a1 + 32), "sectionFooterViewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:sectionFooterViewModel:alwaysInsetContentView:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:sectionFooterViewModel:alwaysInsetContentView:", v3, v9, v15, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
LABEL_9:

LABEL_10:
  objc_msgSend(v3, "accessibilityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingString:", CFSTR("Section"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessibilityIdentifier:", v12);
  if (v4)
    objc_msgSend(v10, "setHeaderAXIdentifierWithBaseString:", CFSTR("PlaceDetailsSection"));

  return v10;
}

- (id)_loadHoursContentViewIfNeeded
{
  UIView *hoursContentView;
  void *v5;
  MUPlaceHoursSectionView *v6;
  void *v7;
  UIView *v8;
  void *v9;
  void *v10;
  UIView *v11;
  UIView *v12;
  UIView *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  MUAddMissingDataLabeledValue *v18;
  MUPlaceInfoSectionView *v19;
  void *v20;
  _QWORD v21[4];
  id v22[2];
  id location;

  hoursContentView = self->_hoursContentView;
  if (hoursContentView)
    return hoursContentView;
  -[MUPlaceInfoSectionControllerConfiguration hoursConfiguration](self->_configuration, "hoursConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[MUPlaceInfoSectionControllerConfiguration availability](self->_configuration, "availability");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "supportsInlineReportAnIssue") & 1) != 0)
    {
      -[MUPlaceInfoSectionControllerConfiguration availability](self->_configuration, "availability");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "supportsHours"))
      {
        -[MUPlaceInfoSectionController inlineRapEnablement](self, "inlineRapEnablement");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          -[MUPlaceInfoSectionController inlineRapEnablement](self, "inlineRapEnablement");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isHoursEditable");

          if (!v17)
            goto LABEL_9;
        }
        else
        {

        }
        v18 = -[MUAddMissingDataLabeledValue initWithType:]([MUAddMissingDataLabeledValue alloc], "initWithType:", 4);
        -[MUAddMissingDataLabeledValue setActionVariant:](v18, "setActionVariant:", 1);
        objc_initWeak(&location, self);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __61__MUPlaceInfoSectionController__loadHoursContentViewIfNeeded__block_invoke;
        v21[3] = &unk_1E2E03F50;
        objc_copyWeak(v22, &location);
        v22[1] = (id)4;
        -[MUAddMissingDataLabeledValue setActionBlock:](v18, "setActionBlock:", v21);
        v19 = [MUPlaceInfoSectionView alloc];
        v8 = -[MUPlaceInfoSectionView initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setViewModels:](v8, "setViewModels:", v20);

        -[UIView setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("PlaceDetailsAddHours"));
        objc_destroyWeak(v22);
        objc_destroyWeak(&location);

        goto LABEL_10;
      }

    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v6 = [MUPlaceHoursSectionView alloc];
  -[MUPlaceInfoSectionControllerConfiguration hoursConfiguration](self->_configuration, "hoursConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MUPlaceHoursSectionView initWithSectionViewConfiguration:](v6, "initWithSectionViewConfiguration:", v7);

  -[UIView setExpandDelegate:](v8, "setExpandDelegate:", self);
  -[UIView setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("PlaceDetailsHours"));
LABEL_10:
  v11 = self->_hoursContentView;
  self->_hoursContentView = v8;
  v12 = v8;

  v13 = self->_hoursContentView;
  return v13;
}

void __61__MUPlaceInfoSectionController__loadHoursContentViewIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "placeInfoDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeInfoSectionController:didSelectAddMissingDataOfType:", v4, *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

- (id)_loadPlaceInfoContentIfNeeded
{
  MUPlaceInfoSectionView *placeInfoSectionView;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MULabeledValueActionViewModel *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  BOOL v34;
  const __CFString *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  MUCoordinateViewModel *v42;
  void *v43;
  MUCoordinateViewModel *v44;
  MULabeledValueActionViewModel *v45;
  void *v46;
  void *v47;
  MUPlaceInfoSectionView *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id obj;
  void (**v54)(void *, void *, _QWORD *);
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  void *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  _QWORD aBlock[4];
  id v68;
  _BYTE v69[128];
  id location[4];

  location[2] = *(id *)MEMORY[0x1E0C80C00];
  placeInfoSectionView = self->_placeInfoSectionView;
  if (placeInfoSectionView)
    return placeInfoSectionView;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke;
  aBlock[3] = &unk_1E2E03440;
  v52 = v5;
  v68 = v52;
  v54 = (void (**)(void *, void *, _QWORD *))_Block_copy(aBlock);
  -[_MKPlaceItem contact](self->_placeItem, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_placeCardContact");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  v51 = v6;
  objc_msgSend(v6, "emailAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceInfoSectionController labeledValuesForContactValues:type:](self, "labeledValuesForContactValues:type:", v9, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObjectsFromArray:", v10);

  objc_msgSend(v51, "phoneNumbers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceInfoSectionController labeledValuesForContactValues:type:](self, "labeledValuesForContactValues:type:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObjectsFromArray:", v12);

  objc_msgSend(v51, "urlAddresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceInfoSectionController labeledValuesForContactValues:type:](self, "labeledValuesForContactValues:type:", v13, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObjectsFromArray:", v14);

  if (!-[MUPlaceInfoSectionControllerConfiguration isDeveloperPlaceCard](self->_configuration, "isDeveloperPlaceCard"))
  {
    -[MUPlaceInfoSectionControllerConfiguration availability](self->_configuration, "availability");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "supportsMessagesForBusiness");

    if (v16)
    {
      -[MUPlaceSectionController mapItem](self, "mapItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[MULabeledValueActionViewModel messageItemWithMapItem:](MULabeledValueActionViewModel, "messageItemWithMapItem:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(location, self);
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke_2;
      v65[3] = &unk_1E2E027C8;
      objc_copyWeak(&v66, location);
      v54[2](v54, v18, v65);
      objc_destroyWeak(&v66);
      objc_destroyWeak(location);

    }
  }
  if (-[MUPlaceInfoSectionControllerConfiguration isDeveloperPlaceCard](self->_configuration, "isDeveloperPlaceCard"))
  {
    v19 = 0;
  }
  else
  {
    -[MUPlaceInfoSectionControllerConfiguration moduleConfiguration](self->_configuration, "moduleConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "factoidReferences");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v19;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v62 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_geoMapItem");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "_encyclopedicInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "factoidAtIndex:", objc_msgSend(v24, "indexInFactoidComponent"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = objc_alloc_init(MULabeledValueActionViewModel);
          objc_msgSend(v28, "title");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[MULabeledValueActionViewModel setTitleString:](v29, "setTitleString:", v30);

          objc_msgSend(v28, "unstructuredValue");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[MULabeledValueActionViewModel setValueString:](v29, "setValueString:", v31);

          v32 = objc_msgSend(v24, "linkStyle");
          switch(v32)
          {
            case 2:
              -[MULabeledValueActionViewModel setActionVariant:](v29, "setActionVariant:", 1);
              break;
            case 1:
              -[MULabeledValueActionViewModel setActionVariant:](v29, "setActionVariant:", 0);
              if (MapKitIdiomIsMacCatalyst())
                v35 = CFSTR("arrow.triangle.turn.up.right.circle");
              else
                v35 = CFSTR("arrow.triangle.turn.up.right.circle.fill");
LABEL_24:
              -[MULabeledValueActionViewModel setSymbolName:](v29, "setSymbolName:", v35);
              break;
            case 0:
              objc_msgSend(v28, "placeIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v33 == 0;

              if (!v34)
              {
                -[MULabeledValueActionViewModel setActionVariant:](v29, "setActionVariant:", 0);
                if (MapKitIdiomIsMacCatalyst())
                  v35 = CFSTR("arrow.triangle.turn.up.right.circle");
                else
                  v35 = CFSTR("arrow.triangle.turn.up.right.circle.fill");
                goto LABEL_24;
              }
              break;
          }
          if (objc_msgSend(v28, "shouldUseStructuredData"))
          {
            +[MUFactoidViewModel viewModelForFactoid:](MUFactoidViewModel, "viewModelForFactoid:", v28);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "valueString");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[MULabeledValueActionViewModel setAlternativeTitleString:](v29, "setAlternativeTitleString:", v38);

            -[MULabeledValueActionViewModel setEmphasizeValueString:](v29, "setEmphasizeValueString:", 1);
          }
          objc_initWeak(location, self);
          v57[0] = MEMORY[0x1E0C809B0];
          v57[1] = 3221225472;
          v57[2] = __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke_70;
          v57[3] = &unk_1E2E03468;
          objc_copyWeak(&v60, location);
          v58 = v28;
          v59 = v24;
          v54[2](v54, v29, v57);

          objc_destroyWeak(&v60);
          objc_destroyWeak(location);
          goto LABEL_34;
        }
        MUGetPlaceCardLog();
        v29 = (MULabeledValueActionViewModel *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v29->super, OS_LOG_TYPE_FAULT))
        {
          v36 = objc_msgSend(v24, "indexInFactoidComponent");
          LODWORD(location[0]) = 67109120;
          HIDWORD(location[0]) = v36;
          _os_log_impl(&dword_191DB8000, &v29->super, OS_LOG_TYPE_FAULT, "Could not get factoid at index %d", (uint8_t *)location, 8u);
        }
LABEL_34:

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v21);
  }

  objc_initWeak(location, self);
  -[MUPlaceInfoSectionController _createAddressItem](self, "_createAddressItem");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke_2_71;
  v55[3] = &unk_1E2E027C8;
  objc_copyWeak(&v56, location);
  v54[2](v54, v39, v55);

  -[MUPlaceInfoSectionControllerConfiguration availability](self->_configuration, "availability");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "supportsShowingCoordinates");

  if (v41)
  {
    v42 = [MUCoordinateViewModel alloc];
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[MUCoordinateViewModel initWithMapItem:isUserLocation:](v42, "initWithMapItem:isUserLocation:", v43, -[_MKPlaceItem options](self->_placeItem, "options") & 1);

    v45 = objc_alloc_init(MULabeledValueActionViewModel);
    -[MUCoordinateViewModel titleString](v44, "titleString");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabeledValueActionViewModel setTitleString:](v45, "setTitleString:", v46);

    -[MUCoordinateViewModel valueString](v44, "valueString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabeledValueActionViewModel setValueString:](v45, "setValueString:", v47);

    v54[2](v54, v45, 0);
  }
  if (objc_msgSend(v52, "count"))
  {
    if (-[MUPlaceInfoSectionControllerConfiguration isDeveloperPlaceCard](self->_configuration, "isDeveloperPlaceCard"))
      +[MUPlaceVerticalCardConfiguration developerPlaceCardConfiguration](MUPlaceVerticalCardConfiguration, "developerPlaceCardConfiguration");
    else
      +[MUInfoCardStyle preferredVerticalCardConfiguration](MUInfoCardStyle, "preferredVerticalCardConfiguration");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[MUPlaceVerticalCardContainerView initWithConfiguration:]([MUPlaceInfoSectionView alloc], "initWithConfiguration:", v49);
    -[MUPlaceInfoSectionView setAccessibilityIdentifier:](v48, "setAccessibilityIdentifier:", CFSTR("PlaceDetailsInfo"));
    v50 = (void *)objc_msgSend(v52, "copy");
    -[MUPlaceInfoSectionView setViewModels:](v48, "setViewModels:", v50);

  }
  else
  {
    v48 = 0;
  }
  objc_destroyWeak(&v56);
  objc_destroyWeak(location);

  return v48;
}

void __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
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

void __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_tappedMessageType");
    WeakRetained = v2;
  }

}

void __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke_70(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleFactoidTap:withReference:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __61__MUPlaceInfoSectionController__loadPlaceInfoContentIfNeeded__block_invoke_2_71(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_tappedAddressItem");
    WeakRetained = v2;
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
  MUPlaceInfoSectionView *v17;
  void *v18;
  MUPlaceInfoSectionView *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD aBlock[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MUGetPlaceCardLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v9;
    v33 = 2112;
    v34 = v7;
    _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_DEBUG, "Building section view for address: %@, contact: %@", buf, 0x16u);

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__MUPlaceInfoSectionController__loadPlaceInfoAddress_contact___block_invoke;
  aBlock[3] = &unk_1E2E03440;
  v12 = v10;
  v30 = v12;
  v13 = (void (**)(void *, void *, _QWORD *))_Block_copy(aBlock);
  -[MUContactsViewModelGenerator viewModelForAddress:](self->_contactsViewModelGenerator, "viewModelForAddress:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v22 = v11;
  v23 = 3221225472;
  v24 = __62__MUPlaceInfoSectionController__loadPlaceInfoAddress_contact___block_invoke_2;
  v25 = &unk_1E2E03468;
  objc_copyWeak(&v28, (id *)buf);
  v15 = v6;
  v26 = v15;
  v16 = v7;
  v27 = v16;
  v13[2](v13, v14, &v22);
  v17 = [MUPlaceInfoSectionView alloc];
  +[MUInfoCardStyle preferredVerticalCardConfiguration](MUInfoCardStyle, "preferredVerticalCardConfiguration", v22, v23, v24, v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MUPlaceVerticalCardContainerView initWithConfiguration:](v17, "initWithConfiguration:", v18);

  -[MUPlaceInfoSectionView setAccessibilityIdentifier:](v19, "setAccessibilityIdentifier:", CFSTR("PlaceDetailsInfo"));
  v20 = (void *)objc_msgSend(v12, "copy");
  -[MUPlaceInfoSectionView setViewModels:](v19, "setViewModels:", v20);

  -[NSMutableArray addObject:](self->_sectionStackViews, "addObject:", v19);
  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

  return v19;
}

void __62__MUPlaceInfoSectionController__loadPlaceInfoAddress_contact___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __62__MUPlaceInfoSectionController__loadPlaceInfoAddress_contact___block_invoke_2(uint64_t a1)
{
  MUPresentationOptions *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MUPresentationOptions);
    objc_msgSend(WeakRetained, "placeInfoDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeInfoSectionController:selectedDirectionsWithAddress:forContact:options:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v2);

  }
}

- (id)_loadViewWithContactMetadata:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MUPlaceInfoSectionView *v13;
  void *v14;
  MUPlaceInfoSectionView *v15;
  void *v16;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "emailAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceInfoSectionController labeledValuesForContactValues:type:](self, "labeledValuesForContactValues:type:", v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  objc_msgSend(v5, "phoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceInfoSectionController labeledValuesForContactValues:type:](self, "labeledValuesForContactValues:type:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v10);

  objc_msgSend(v5, "urlAddresses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUPlaceInfoSectionController labeledValuesForContactValues:type:](self, "labeledValuesForContactValues:type:", v11, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v12);

  v13 = [MUPlaceInfoSectionView alloc];
  +[MUInfoCardStyle preferredVerticalCardConfiguration](MUInfoCardStyle, "preferredVerticalCardConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MUPlaceVerticalCardContainerView initWithConfiguration:](v13, "initWithConfiguration:", v14);

  -[MUPlaceInfoSectionView setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", CFSTR("PlaceDetailsInfo"));
  v16 = (void *)objc_msgSend(v6, "copy");
  -[MUPlaceInfoSectionView setViewModels:](v15, "setViewModels:", v16);

  return v15;
}

- (id)_loadRAPStatusViewIfNeeded
{
  MUDisclosureActionRowView *v3;
  MUDisclosureActionViewModel *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MUDisclosureActionRowView *rapStatusContentView;
  MUDisclosureActionRowView *v15;
  MUDisclosureActionRowView *v16;
  _QWORD v18[4];
  id v19;
  id location;

  v3 = -[MUPlaceInfoSectionController placeNumberOfReportsInReview](self, "placeNumberOfReportsInReview");
  if (v3)
  {
    -[MUPlaceInfoSectionControllerConfiguration availability](self->_configuration, "availability");
    v4 = (MUDisclosureActionViewModel *)objc_claimAutoreleasedReturnValue();
    if (-[MUDisclosureActionViewModel supportsReportsInReview](v4, "supportsReportsInReview"))
    {
      v5 = -[MUPlaceInfoSectionController placeNumberOfReportsInReview](self, "placeNumberOfReportsInReview");

      if (!v5)
      {
LABEL_11:
        v3 = self->_rapStatusContentView;
        return v3;
      }
      v4 = objc_alloc_init(MUDisclosureActionViewModel);
      objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "countryCode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("CN"));

      if (v8)
        v9 = CFSTR("Number of reports [Placecard]");
      else
        v9 = CFSTR("Number of reports in review [Placecard]");
      _MULocalizedStringFromThisBundle(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%lu"), 0, -[MUPlaceInfoSectionController placeNumberOfReportsInReview](self, "placeNumberOfReportsInReview"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUDisclosureActionViewModel setTitleString:](v4, "setTitleString:", v11);
      -[MUPlaceInfoSectionController userInfoProvider](self, "userInfoProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "userIcon");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUDisclosureActionViewModel setImage:](v4, "setImage:", v13);

      objc_initWeak(&location, self);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __58__MUPlaceInfoSectionController__loadRAPStatusViewIfNeeded__block_invoke;
      v18[3] = &unk_1E2E027C8;
      objc_copyWeak(&v19, &location);
      -[MUDisclosureActionViewModel setActionBlock:](v4, "setActionBlock:", v18);
      rapStatusContentView = self->_rapStatusContentView;
      if (!rapStatusContentView)
      {
        v15 = objc_alloc_init(MUDisclosureActionRowView);
        -[MKViewWithHairline setBottomHairlineHidden:](v15, "setBottomHairlineHidden:", 1);
        -[MUDisclosureActionRowView setViewModel:](v15, "setViewModel:", v4);
        -[MUDisclosureActionRowView setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", CFSTR("PlaceDetailsReportInReview"));
        v16 = self->_rapStatusContentView;
        self->_rapStatusContentView = v15;

        rapStatusContentView = self->_rapStatusContentView;
      }
      -[MUDisclosureActionRowView setViewModel:](rapStatusContentView, "setViewModel:", v4);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);

    }
    goto LABEL_11;
  }
  return v3;
}

void __58__MUPlaceInfoSectionController__loadRAPStatusViewIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_tappedViewRAPReport");
    WeakRetained = v2;
  }

}

- (NSArray)sectionViews
{
  return (NSArray *)(id)-[NSArray copy](self->_sectionViews, "copy");
}

- (id)_createAddressItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  MULabeledValueActionViewModel *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  int v18;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_addressFormattedAsLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "length");
  v6 = v5 != 0;
  if (v5)
  {
    MUGetPlaceCardLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v21 = 138412290;
      v22 = (uint64_t)v4;
      _os_log_impl(&dword_191DB8000, v7, OS_LOG_TYPE_DEBUG, "We have a location formatted string %@", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_addressFormattedAsMultilineAddress");
    v9 = objc_claimAutoreleasedReturnValue();

    MUGetPlaceCardLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v21 = 138412290;
      v22 = v9;
      _os_log_impl(&dword_191DB8000, v7, OS_LOG_TYPE_DEBUG, "We have a multiline address string %@", (uint8_t *)&v21, 0xCu);
    }
    v4 = (void *)v9;
  }

  -[MUPlaceInfoSectionControllerConfiguration moduleConfiguration](self->_configuration, "moduleConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MUPlaceInfoSectionControllerConfiguration moduleConfiguration](self->_configuration, "moduleConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "locationStyle");

    if (v12 == 2)
    {
      MUGetPlaceCardLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_DEBUG, "Asking to suppress address with GEOLocationInfoStyleSuppress", (uint8_t *)&v21, 2u);
      }

      goto LABEL_19;
    }
    v6 = v12 == 1;
  }
  if (!objc_msgSend(v4, "length"))
  {
LABEL_19:
    v14 = 0;
    goto LABEL_20;
  }
  v14 = objc_alloc_init(MULabeledValueActionViewModel);
  if (v6)
    v15 = CFSTR("Location [Placecard]");
  else
    v15 = CFSTR("Address [Placecard]");
  _MULocalizedStringFromThisBundle(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabeledValueActionViewModel setTitleString:](v14, "setTitleString:", v16);

  -[MULabeledValueActionViewModel setValueString:](v14, "setValueString:", v4);
  -[MULabeledValueActionViewModel setAnalyticsTarget:](v14, "setAnalyticsTarget:", 1502);
  -[MUPlaceInfoSectionControllerConfiguration availability](self->_configuration, "availability");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "showEditAddressForHome");

  if (v18)
  {
    -[MULabeledValueActionViewModel setSymbolName:](v14, "setSymbolName:", CFSTR("pencil"));
  }
  else if (!v6
         && !-[MUPlaceInfoSectionControllerConfiguration isDeveloperPlaceCard](self->_configuration, "isDeveloperPlaceCard"))
  {
    +[MUContactsViewModelGenerator symbolImageForAddressItem](MUContactsViewModelGenerator, "symbolImageForAddressItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabeledValueActionViewModel setSymbolName:](v14, "setSymbolName:", v20);

  }
LABEL_20:

  return v14;
}

- (void)_handleFactoidTap:(id)a3 withReference:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  MUPresentationOptions *v11;
  MUPresentationOptions *v12;
  _QWORD v13[4];
  id v14;
  MUPresentationOptions *v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0CC1830]);
  objc_msgSend(v6, "placeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithGEOMapItemIdentifier:", v9);

  if (v10)
  {
    v11 = objc_alloc_init(MUPresentationOptions);
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__MUPlaceInfoSectionController__handleFactoidTap_withReference___block_invoke;
    v13[3] = &unk_1E2E03F78;
    objc_copyWeak(&v16, &location);
    v14 = v7;
    v12 = v11;
    v15 = v12;
    -[MUPlaceInfoSectionController _refineMapItemForIdentifier:completion:](self, "_refineMapItemForIdentifier:completion:", v10, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

void __64__MUPlaceInfoSectionController__handleFactoidTap_withReference___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  int v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "linkStyle");
    if (v4 == 2)
    {
      objc_msgSend(WeakRetained, "placeInfoDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "placeInfoSectionController:selectedViewPlaceWithMapItem:options:", WeakRetained, v6, *(_QWORD *)(a1 + 40));
      goto LABEL_6;
    }
    if (v4 == 1)
    {
      objc_msgSend(WeakRetained, "placeInfoDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "placeInfoSectionController:selectedDirectionsWithMapItem:options:", WeakRetained, v6, *(_QWORD *)(a1 + 40));
LABEL_6:

    }
  }

}

- (void)_refineMapItemForIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CC1848];
  v7 = a3;
  objc_msgSend(v6, "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ticketForIdentifiers:traits:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__MUPlaceInfoSectionController__refineMapItemForIdentifier_completion___block_invoke;
  v12[3] = &unk_1E2E016A8;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v10, "submitWithHandler:networkActivity:", v12, 0);

}

void __71__MUPlaceInfoSectionController__refineMapItemForIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = objc_msgSend(v8, "count");
  if (!a3 && v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  _BOOL8 v3;
  MUPlaceSectionHeaderViewModel *v4;
  void *v5;
  MUPlaceSectionHeaderViewModel *v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;

  v3 = -[MUPlaceInfoSectionController _shouldShowRapEditButton](self, "_shouldShowRapEditButton");
  v4 = [MUPlaceSectionHeaderViewModel alloc];
  _MULocalizedStringFromThisBundle(CFSTR("Details [Placecard]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MUPlaceSectionHeaderViewModel initWithTitleString:showSeeMore:](v4, "initWithTitleString:showSeeMore:", v5, v3);

  -[MUPlaceInfoSectionControllerConfiguration availability](self->_configuration, "availability");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsInlineReportAnIssue");

  if (v8)
    v9 = !v3;
  else
    v9 = 1;
  if (!v9)
  {
    _MULocalizedStringFromThisBundle(CFSTR("Edit [Placecard RAP]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionHeaderViewModel setSeeMoreButtonText:](v6, "setSeeMoreButtonText:", v10);

    -[MUPlaceInfoSectionController _rapEditPlaceDetailsMenu](self, "_rapEditPlaceDetailsMenu");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionHeaderViewModel setSeeMoreButtonMenu:](v6, "setSeeMoreButtonMenu:", v11);

    -[MUPlaceSectionHeaderViewModel setTarget:selector:](v6, "setTarget:selector:", self, sel__rapEditPlaceDetailsButtonTapped);
  }
  return v6;
}

- (MUPlaceSectionFooterViewModel)sectionFooterViewModel
{
  MUPlaceSectionFooterViewModel *sectionFooterViewModel;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  MUPlaceSectionFooterViewModel *v11;
  MUPlaceSectionFooterViewModel *v12;
  void *v13;
  void *v14;
  void *v15;
  MUPlaceFooterAtributionViewModel *v16;
  void *v17;
  MUPlaceSectionFooterViewModel *v18;
  MUPlaceSectionFooterViewModel *v19;
  MUPlaceSectionFooterViewModel *v20;
  MUPlaceSectionFooterViewModel *v21;
  _QWORD v22[4];
  id v23;
  id location;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  sectionFooterViewModel = self->_sectionFooterViewModel;
  if (sectionFooterViewModel)
    return sectionFooterViewModel;
  v5 = -[MUPlaceInfoSectionController _attributionStyle](self, "_attributionStyle");
  if (v5 == 1)
  {
    _MULocalizedStringFromThisBundle(CFSTR("Developed in partnership with %@"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = [MUPlaceFooterAtributionViewModel alloc];
    v25[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MUPlaceFooterAtributionViewModel initWithFormatString:providerNames:isInteractable:](v16, "initWithFormatString:providerNames:isInteractable:", v13, v17, 0);
    v19 = self->_sectionFooterViewModel;
    self->_sectionFooterViewModel = v18;

  }
  else if (!v5)
  {
    if (!-[MUPlaceInfoSectionControllerConfiguration isDeveloperPlaceCard](self->_configuration, "isDeveloperPlaceCard")|| (-[MUPlaceSectionController mapItem](self, "mapItem"), v6 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v6, "_attribution"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "requiresAttributionInDeveloperPlaceCard"), v7, v6, v8))
    {
      -[MUPlaceSectionController mapItem](self, "mapItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_attribution");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[MUPlaceFooterAtributionViewModel viewModelForMapItemAttribution:](MUPlaceFooterAtributionViewModel, "viewModelForMapItemAttribution:", v10);
      v11 = (MUPlaceSectionFooterViewModel *)objc_claimAutoreleasedReturnValue();
      v12 = self->_sectionFooterViewModel;
      self->_sectionFooterViewModel = v11;

    }
  }
  objc_initWeak(&location, self);
  v20 = self->_sectionFooterViewModel;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __54__MUPlaceInfoSectionController_sectionFooterViewModel__block_invoke;
  v22[3] = &unk_1E2E01DA8;
  objc_copyWeak(&v23, &location);
  -[MUPlaceSectionFooterViewModel setActionBlock:](v20, "setActionBlock:", v22);
  v21 = self->_sectionFooterViewModel;
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  return v21;
}

void __54__MUPlaceInfoSectionController_sectionFooterViewModel__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "placeInfoDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_attribution");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "placeInfoSectionController:didTapAttribution:", v5, v4);

    WeakRetained = v5;
  }

}

- (int)_attributionStyle
{
  void *v3;
  void *v4;
  int v5;

  -[MUPlaceInfoSectionControllerConfiguration moduleConfiguration](self->_configuration, "moduleConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[MUPlaceInfoSectionControllerConfiguration moduleConfiguration](self->_configuration, "moduleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "attributionStyle");

  return v5;
}

- (id)labeledValuesForContactValues:(id)a3 type:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  MUAddMissingDataLabeledValue *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  MUContactLabeledValue *v17;
  void *v18;
  char v20;
  id v21;
  id obj;
  _QWORD v23[5];
  id v24[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30[2];
  id location;
  _BYTE v32[128];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v21 = a3;
  -[MUPlaceInfoSectionControllerConfiguration availability](self->_configuration, "availability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "supportsInlineReportAnIssue"))
  {

    goto LABEL_12;
  }
  v7 = objc_msgSend(v21, "count");

  if (v7)
  {
LABEL_12:
    v12 = (MUAddMissingDataLabeledValue *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v21;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v17 = -[MUContactLabeledValue initWithContactLabeledValue:type:]([MUContactLabeledValue alloc], "initWithContactLabeledValue:type:", v16, a4);
          -[MUContactLabeledValue setActionVariant:](v17, "setActionVariant:", 1);
          objc_initWeak(&location, self);
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __67__MUPlaceInfoSectionController_labeledValuesForContactValues_type___block_invoke_2;
          v23[3] = &unk_1E2E03FA0;
          objc_copyWeak(v24, &location);
          v24[1] = (id)a4;
          v23[4] = v16;
          -[MUContactLabeledValue setActionBlock:](v17, "setActionBlock:", v23);
          -[MUAddMissingDataLabeledValue addObject:](v12, "addObject:", v17);
          objc_destroyWeak(v24);
          objc_destroyWeak(&location);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
      }
      while (v13);
    }

    v18 = (void *)-[MUAddMissingDataLabeledValue copy](v12, "copy");
    goto LABEL_20;
  }
  if (a4 == 3)
    v8 = 3;
  else
    v8 = 2 * (a4 == 1);
  -[MUPlaceInfoSectionController inlineRapEnablement](self, "inlineRapEnablement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (v8)
      goto LABEL_26;
    goto LABEL_12;
  }
  switch(v8)
  {
    case 0:
      goto LABEL_12;
    case 3:
      -[MUPlaceInfoSectionController inlineRapEnablement](self, "inlineRapEnablement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isWebsiteEditable");
LABEL_25:
      v20 = v11;

      if ((v20 & 1) == 0)
      {
        v18 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_21;
      }
      break;
    case 2:
      -[MUPlaceInfoSectionController inlineRapEnablement](self, "inlineRapEnablement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isPhoneEditable");
      goto LABEL_25;
  }
LABEL_26:
  v12 = -[MUAddMissingDataLabeledValue initWithType:]([MUAddMissingDataLabeledValue alloc], "initWithType:", v8);
  -[MUAddMissingDataLabeledValue setActionVariant:](v12, "setActionVariant:", 1);
  objc_initWeak(&location, self);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __67__MUPlaceInfoSectionController_labeledValuesForContactValues_type___block_invoke;
  v29[3] = &unk_1E2E03F50;
  objc_copyWeak(v30, &location);
  v30[1] = (id)v8;
  -[MUAddMissingDataLabeledValue setActionBlock:](v12, "setActionBlock:", v29);
  v33[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
LABEL_20:

LABEL_21:
  return v18;
}

void __67__MUPlaceInfoSectionController_labeledValuesForContactValues_type___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "placeInfoDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeInfoSectionController:didSelectAddMissingDataOfType:", v4, *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

void __67__MUPlaceInfoSectionController_labeledValuesForContactValues_type___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_tappedContactOfType:withLabeledValue:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_tappedContactOfType:(int64_t)a3 withLabeledValue:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((unint64_t)(a3 - 1) > 2)
    v7 = 0;
  else
    v7 = qword_191F06850[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CC18C8], "actionItemWithType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = *MEMORY[0x1E0CC1690];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[MUPlaceInfoSectionController _performActionItem:withOptions:](self, "_performActionItem:withOptions:", v8, v9);

}

- (void)_tappedMessageType
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CC18C8], "actionItemWithType:", 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CC16A0];
  -[MUPlaceSectionController analyticsModule](self, "analyticsModule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUPlaceInfoSectionController _performActionItem:withOptions:](self, "_performActionItem:withOptions:", v3, v5);
}

- (void)_tappedAddressItem
{
  void *v3;
  int v4;
  uint64_t v5;
  id v6;

  -[MUPlaceInfoSectionControllerConfiguration availability](self->_configuration, "availability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showEditAddressForHome");

  if (v4)
    v5 = 25;
  else
    v5 = 30;
  objc_msgSend(MEMORY[0x1E0CC18C8], "actionItemWithType:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceInfoSectionController _performActionItem:withOptions:](self, "_performActionItem:withOptions:", v6, 0);

}

- (void)_tappedViewRAPReport
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CC18C8], "actionItemWithType:", 3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceInfoSectionController _performActionItem:withOptions:](self, "_performActionItem:withOptions:", v3, 0);

}

- (BOOL)_shouldShowRapEditButton
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[MUPlaceInfoSectionController inlineRapEnablement](self, "inlineRapEnablement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MUPlaceInfoSectionController inlineRapEnablement](self, "inlineRapEnablement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isHoursEditable") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[MUPlaceInfoSectionController inlineRapEnablement](self, "inlineRapEnablement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isPhoneEditable") & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        -[MUPlaceInfoSectionController inlineRapEnablement](self, "inlineRapEnablement");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v7, "isWebsiteEditable");

      }
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)_rapEditPlaceDetailsMenu
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  id obj;
  _QWORD v19[4];
  id v20[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id location;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceInfoSectionController inlineRapEnablement](self, "inlineRapEnablement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isHoursEditable", v5))
      objc_msgSend(v4, "addObject:", &unk_1E2E556C8);
    if (objc_msgSend(v6, "isPhoneEditable"))
      objc_msgSend(v4, "addObject:", &unk_1E2E556E0);
    if (objc_msgSend(v6, "isWebsiteEditable"))
      objc_msgSend(v4, "addObject:", &unk_1E2E556F8);
    if (objc_msgSend(v6, "isAddressEditable"))
      objc_msgSend(v4, "addObject:", &unk_1E2E55710);
    objc_msgSend(v4, "addObject:", &unk_1E2E55728);
  }
  else
  {
    objc_msgSend(v4, "addObjectsFromArray:", &unk_1E2E55CA8, 0);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "integerValue");
        v12 = (void *)v11;
        v13 = (void *)MEMORY[0x1E0DC3428];
        if (v11 <= 5)
        {
          _MULocalizedStringFromThisBundle(off_1E2E04048[v11]);
          v2 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __56__MUPlaceInfoSectionController__rapEditPlaceDetailsMenu__block_invoke;
        v19[3] = &unk_1E2E03FC8;
        objc_copyWeak(v20, &location);
        v20[1] = v12;
        objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v2, 0, 0, v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v14);
        objc_destroyWeak(v20);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&location);

  return v15;
}

void __56__MUPlaceInfoSectionController__rapEditPlaceDetailsMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "placeInfoDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeInfoSectionController:didSelectEditPlaceDetailsOfType:", v4, *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

- (void)_rapEditPlaceDetailsButtonTapped
{
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:](self, "captureInfoCardAction:eventValue:feedbackType:", 287, 0, 62);
}

- (void)_performActionItem:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = *MEMORY[0x1E0CC16A0];
  v7 = a3;
  -[MUPlaceSectionController analyticsModule](self, "analyticsModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v6)
    objc_msgSend(v10, "addEntriesFromDictionary:", v6);
  -[MUPlaceInfoSectionControllerConfiguration actionDelegate](self->_configuration, "actionDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v11, "performAction:options:completion:", v7, v12, 0);

}

- (void)hoursSectionView:(id)a3 didExpand:(BOOL)a4 forConfiguration:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;

  v5 = a4;
  v7 = a5;
  if (v5)
  {
    v9 = v7;
    if (objc_msgSend(v7, "isServiceHours"))
    {
      objc_msgSend(v9, "hoursName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:](self, "captureInfoCardAction:eventValue:feedbackType:", 6012, v8, 0);

    v7 = v9;
  }

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
  v10[2] = __48__MUPlaceInfoSectionController_draggableContent__block_invoke;
  v10[3] = &unk_1E2E033F0;
  v11 = v6;
  v8 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](sectionStackViews, "enumerateObjectsUsingBlock:", v10);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

void __48__MUPlaceInfoSectionController_draggableContent__block_invoke(uint64_t a1, void *a2)
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

- (int)analyticsModuleType
{
  return 5;
}

- (void)_populateRevealedAnalyticsModule:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  MUPlaceInfoSectionController *v32;
  id v33;
  NSMutableArray *obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MUPlaceInfoSectionControllerConfiguration availability](self->_configuration, "availability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsInlineReportAnIssue");

  if (v7)
  {
    v33 = v4;
    -[MUPlaceInfoSectionControllerConfiguration availability](self->_configuration, "availability");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "supportsHours");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D27458], "moduleButtonForType:", 53);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_mapsui_addObjectIfNotNil:", v10);

    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v32 = self;
    obj = self->_sectionStackViews;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v44;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v44 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v14);
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          objc_msgSend(v15, "viewModels");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v40;
            do
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v40 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v20);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v21, "analyticsButtonValue");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "_mapsui_addObjectIfNotNil:", v22);

                }
                ++v20;
              }
              while (v18 != v20);
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            }
            while (v18);
          }

          ++v14;
        }
        while (v14 != v12);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v12);
    }

    self = v32;
    v4 = v33;
  }
  if (objc_msgSend(v5, "count"))
  {
    v23 = objc_alloc_init(MEMORY[0x1E0D27460]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v24 = v5;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v36;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v36 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(v23, "addButtons:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v28++));
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v26);
    }

    objc_msgSend(v4, "setInfos:", v23);
  }
  -[_MKPlaceItem contact](self->_placeItem, "contact");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29
    && MapsFeature_IsEnabled_MapsWally()
    && -[_MKPlaceItem representsPerson](self->_placeItem, "representsPerson"))
  {
    objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setPlaceCardIsPersonPlacecard:", 1);

    objc_msgSend(v29, "postalAddresses");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", &__block_literal_global_43);
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", &__block_literal_global_136);

  }
}

void __65__MUPlaceInfoSectionController__populateRevealedAnalyticsModule___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;

  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "_mapkit_sharedLocationContactIdentifer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlaceCardIsPersonLocationShared:", 1);

    *a4 = 1;
  }
}

void __65__MUPlaceInfoSectionController__populateRevealedAnalyticsModule___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  void *v6;
  char v7;
  void *v8;

  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "_mapkit_sharedLocationContactIdentifer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlaceCardIsPersonAddressAvailable:", 1);

    *a4 = 1;
  }
}

- (BOOL)isImpressionable
{
  return 1;
}

- (MUPlaceInfoSectionControllerDelegate)placeInfoDelegate
{
  return (MUPlaceInfoSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_placeInfoDelegate);
}

- (void)setPlaceInfoDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeInfoDelegate, a3);
}

- (MUUserInformationProvider)userInfoProvider
{
  return (MUUserInformationProvider *)objc_loadWeakRetained((id *)&self->_userInfoProvider);
}

- (void)setUserInfoProvider:(id)a3
{
  objc_storeWeak((id *)&self->_userInfoProvider, a3);
}

- (unint64_t)placeNumberOfReportsInReview
{
  return self->_placeNumberOfReportsInReview;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userInfoProvider);
  objc_destroyWeak((id *)&self->_placeInfoDelegate);
  objc_storeStrong((id *)&self->_sectionFooterViewModel, 0);
  objc_storeStrong((id *)&self->_placeInfoSectionView, 0);
  objc_storeStrong((id *)&self->_rapStatusContentView, 0);
  objc_storeStrong((id *)&self->_hoursContentView, 0);
  objc_storeStrong((id *)&self->_sectionViews, 0);
  objc_storeStrong((id *)&self->_sectionStackViews, 0);
  objc_storeStrong((id *)&self->_contactsViewModelGenerator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
}

@end
