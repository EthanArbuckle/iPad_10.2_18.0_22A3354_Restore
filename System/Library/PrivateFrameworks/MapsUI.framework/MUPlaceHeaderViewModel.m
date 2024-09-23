@implementation MUPlaceHeaderViewModel

- (MUPlaceHeaderViewModel)initWithMapItem:(id)a3 imageManager:(id)a4 isDeveloperPlaceCard:(BOOL)a5 developerPlaceCardAuditToken:(id)a6
{
  id v11;
  id v12;
  id v13;
  MUPlaceHeaderViewModel *v14;
  MUPlaceHeaderViewModel *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MUPlaceHeaderViewModel;
  v14 = -[MUPlaceHeaderViewModel init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_mapItem, a3);
    objc_storeStrong((id *)&v15->_imageManager, a4);
    v15->_isDeveloperPlaceCard = a5;
    objc_storeStrong((id *)&v15->_developerPlaceCardAuditToken, a6);
    -[MUPlaceHeaderViewModel _buildEnclosingPlace](v15, "_buildEnclosingPlace");
  }

  return v15;
}

- (MUPlaceHeaderViewModel)initWithMapItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  MUPlaceHeaderViewModel *v7;

  v4 = (void *)MEMORY[0x1E0CC1750];
  v5 = a3;
  objc_msgSend(v4, "sharedImageManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MUPlaceHeaderViewModel initWithMapItem:imageManager:](self, "initWithMapItem:imageManager:", v5, v6);

  return v7;
}

- (MUPlaceHeaderViewModel)initWithMapItem:(id)a3 imageManager:(id)a4
{
  return -[MUPlaceHeaderViewModel initWithMapItem:imageManager:isDeveloperPlaceCard:developerPlaceCardAuditToken:](self, "initWithMapItem:imageManager:isDeveloperPlaceCard:developerPlaceCardAuditToken:", a3, a4, 0, 0);
}

- (MUPlaceHeaderViewModel)initWithMapItem:(id)a3 isDeveloperPlaceCard:(BOOL)a4 developerPlaceCardAuditToken:(id)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  MUPlaceHeaderViewModel *v12;

  v5 = a4;
  v8 = (void *)MEMORY[0x1E0CC1750];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "sharedImageManagerWithAuditToken:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MUPlaceHeaderViewModel initWithMapItem:imageManager:isDeveloperPlaceCard:developerPlaceCardAuditToken:](self, "initWithMapItem:imageManager:isDeveloperPlaceCard:developerPlaceCardAuditToken:", v10, v11, v5, v9);

  return v12;
}

- (void)_buildEnclosingPlace
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  NSString *labelString;
  id v16;

  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_enclosingPlace");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v16;
  if (v16)
  {
    objc_msgSend(v16, "containmentTextTemplate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26FD8]), "initWithGeoFormattedString:", v5);
    objc_msgSend(v6, "stringResultWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "styleReplacementResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_enclosingPlaceString, v11);
    if (v10)
    {
      v12 = objc_msgSend(v10, "range");
      objc_msgSend(v8, "stringByReplacingCharactersInRange:withString:", v12, v13, &stru_1E2E05448);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v8;
    }
    labelString = self->_labelString;
    self->_labelString = v14;

    v4 = v16;
  }

}

- (void)refineEnclosingMapItemWithCompletion:(id)a3
{
  void (**v4)(id, MKMapItem *, _QWORD);
  void *v5;
  MKMapItem *enclosingMapItem;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(id, MKMapItem *, _QWORD);
  id v12;
  id location;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, MKMapItem *, _QWORD))a3;
  -[MUPlaceHeaderViewModel enclosingMapItemIdentifier](self, "enclosingMapItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    enclosingMapItem = self->_enclosingMapItem;
    if (enclosingMapItem)
    {
      v4[2](v4, enclosingMapItem, 0);
    }
    else
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ticketForIdentifiers:traits:", v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __63__MUPlaceHeaderViewModel_refineEnclosingMapItemWithCompletion___block_invoke;
      v10[3] = &unk_1E2E01FD0;
      objc_copyWeak(&v12, &location);
      v11 = v4;
      objc_msgSend(v9, "submitWithHandler:networkActivity:", v10, 0);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v4[2](v4, 0, 0);
  }

}

void __63__MUPlaceHeaderViewModel_refineEnclosingMapItemWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v13, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)WeakRetained + 2);
    *((_QWORD *)WeakRetained + 2) = v7;

    objc_msgSend(*((id *)WeakRetained + 2), "name");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)WeakRetained + 4);
    *((_QWORD *)WeakRetained + 4) = v9;

    _MULocalizedStringFromThisBundle(CFSTR("Location [Placecard]"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)WeakRetained + 3);
    *((_QWORD *)WeakRetained + 3) = v11;

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (MULabeledTokenViewModel)enclosingPlaceViewModel
{
  MULabeledTokenViewModel *v2;
  MULabeledTokenViewModel *enclosingPlaceViewModel;
  MULabeledTokenViewModel *v5;
  MULabeledTokenViewModel *v6;

  if (self->_isDeveloperPlaceCard)
  {
    v2 = 0;
  }
  else if (-[NSString length](self->_labelString, "length")
         || (v2 = -[NSString length](self->_enclosingPlaceString, "length")) != 0)
  {
    enclosingPlaceViewModel = self->_enclosingPlaceViewModel;
    if (!enclosingPlaceViewModel)
    {
      v5 = -[MULabeledTokenViewModel initWithLabelValue:tokenValue:]([MULabeledTokenViewModel alloc], "initWithLabelValue:tokenValue:", self->_labelString, self->_enclosingPlaceString);
      v6 = self->_enclosingPlaceViewModel;
      self->_enclosingPlaceViewModel = v5;

      enclosingPlaceViewModel = self->_enclosingPlaceViewModel;
    }
    v2 = enclosingPlaceViewModel;
  }
  return v2;
}

- (MKMapItemIdentifier)enclosingMapItemIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;

  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_enclosingPlace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "parentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CC1830]);
    objc_msgSend(v4, "parentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
LABEL_5:
    v12 = (void *)objc_msgSend(v8, "initWithGEOMapItemIdentifier:", v7);
    goto LABEL_6;
  }
  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_containedPlace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CC1830]);
    goto LABEL_5;
  }
  -[MKMapItem _venueInfo](self->_mapItem, "_venueInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "parent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[MKMapItem _venueInfo](self->_mapItem, "_venueInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "parent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "businessID");

    -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1830]), "initWithMUID:resultProviderID:coordinate:", v18, 0, v19, v20);
    v7 = 0;
  }
  else
  {
    v7 = 0;
    v12 = 0;
  }
LABEL_6:

  return (MKMapItemIdentifier *)v12;
}

- (id)_categoryAndAppleRatingsAttributedStringWithFont:(id)a3 labelColor:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v9 = *MEMORY[0x1E0DC1138];
  v26[0] = *MEMORY[0x1E0DC1140];
  v26[1] = v9;
  v27[0] = v7;
  v27[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItem _firstLocalizedCategoryName](self->_mapItem, "_firstLocalizedCategoryName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v11, v10);
    objc_msgSend(v8, "appendAttributedString:", v12);

  }
  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_hasAppleRatings");

  if (v14)
  {
    if (objc_msgSend(v8, "length"))
    {
      _MULocalizedStringFromThisBundle(CFSTR("Delimiter"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v15, v10);
      objc_msgSend(v8, "appendAttributedString:", v16);

    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    objc_msgSend(MEMORY[0x1E0DC1350], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC1440]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUAppleRatingRowView ratingSymbolStringWithFont:symbolScale:attributes:](MUAppleRatingRowView, "ratingSymbolStringWithFont:symbolScale:attributes:", v18, 1, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v19);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), v10);
    objc_msgSend(v17, "addObject:", v20);

    objc_msgSend(MEMORY[0x1E0CC17B8], "compactUserRecommendedRatingSummaryStringForMapItem:", self->_mapItem);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v21, v10);
    objc_msgSend(v17, "addObject:", v22);

    +[MapsUILayout buildAttributedDisplayStringForComponents:](MapsUILayout, "buildAttributedDisplayStringForComponents:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendAttributedString:", v23);

  }
  v24 = (void *)objc_msgSend(v8, "copy");

  return v24;
}

- (id)enclosingPlaceAttributedStringWithFont:(id)a3 labelColor:(id)a4 tokenColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSUInteger v14;
  _QWORD *v15;
  uint64_t *v16;
  id v17;
  NSString *labelString;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSString *enclosingPlaceString;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  id (*v30)(_QWORD *, id);
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_isDeveloperPlaceCard)
  {
    -[MUPlaceHeaderViewModel _categoryAndAppleRatingsAttributedStringWithFont:labelColor:](self, "_categoryAndAppleRatingsAttributedStringWithFont:labelColor:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_composedString)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0D26FE0]);
      v28 = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v30 = __87__MUPlaceHeaderViewModel_enclosingPlaceAttributedStringWithFont_labelColor_tokenColor___block_invoke;
      v31 = &unk_1E2E01FF8;
      v32 = v10;
      v33 = v8;
      v34 = v9;
      objc_msgSend(v12, "setFormatStyleHandler:", &v28);
      -[GEOComposedString stringResultWithOptions:](self->_composedString, "stringResultWithOptions:", v12, v28, v29, v30, v31);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "attributedString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = objc_alloc_init(MEMORY[0x1E0CB3778]);
      v14 = -[NSString length](self->_labelString, "length");
      v15 = (_QWORD *)MEMORY[0x1E0DC1140];
      v16 = (uint64_t *)MEMORY[0x1E0DC1138];
      if (v14)
      {
        v17 = objc_alloc(MEMORY[0x1E0CB3498]);
        labelString = self->_labelString;
        v19 = *v16;
        v37[0] = *v15;
        v37[1] = v19;
        v38[0] = v9;
        v38[1] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v17, "initWithString:attributes:", labelString, v20);

        v15 = (_QWORD *)MEMORY[0x1E0DC1140];
        objc_msgSend(v12, "appendAttributedString:", v21);

      }
      if (-[NSString length](self->_enclosingPlaceString, "length"))
      {
        v22 = objc_alloc(MEMORY[0x1E0CB3498]);
        enclosingPlaceString = self->_enclosingPlaceString;
        v24 = *v16;
        v35[0] = *v15;
        v35[1] = v24;
        v36[0] = v10;
        v36[1] = v8;
        v35[2] = *MEMORY[0x1E0DC1160];
        v36[2] = &stru_1E2E05448;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v22, "initWithString:attributes:", enclosingPlaceString, v25);

        objc_msgSend(v12, "appendAttributedString:", v26);
      }
      v11 = (void *)objc_msgSend(v12, "copy");
    }

  }
  return v11;
}

id __87__MUPlaceHeaderViewModel_enclosingPlaceAttributedStringWithFont_labelColor_tokenColor___block_invoke(_QWORD *a1, id a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  if (a2 < 3)
  {
    v2 = *MEMORY[0x1E0DC1138];
    v11[0] = *MEMORY[0x1E0DC1140];
    v11[1] = v2;
    v3 = a1[5];
    v12[0] = a1[6];
    v12[1] = v3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = v12;
    v6 = v11;
    v7 = 2;
LABEL_5:
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v5, v6, v7);
    a2 = (id)objc_claimAutoreleasedReturnValue();
    return a2;
  }
  if ((_DWORD)a2 == 3)
  {
    v8 = *MEMORY[0x1E0DC1138];
    v13[0] = *MEMORY[0x1E0DC1140];
    v13[1] = v8;
    v9 = a1[5];
    v14[0] = a1[4];
    v14[1] = v9;
    v13[2] = *MEMORY[0x1E0DC1160];
    v14[2] = &stru_1E2E05448;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = v14;
    v6 = v13;
    v7 = 3;
    goto LABEL_5;
  }
  return a2;
}

- (BOOL)hasInitialData
{
  void *v2;
  void *v3;
  void *v4;

  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_enclosingPlace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "containmentTextTemplate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (NSString)placeName
{
  return -[MKMapItem name](self->_mapItem, "name");
}

- (NSString)placeSecondaryName
{
  return (NSString *)-[MKMapItem _secondaryName](self->_mapItem, "_secondaryName");
}

- (NSAttributedString)addressDescriptionForContact
{
  return 0;
}

- (BOOL)hasEnclosingPlace
{
  void *v2;
  BOOL v3;

  -[MUPlaceHeaderViewModel enclosingMapItemIdentifier](self, "enclosingMapItemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSArray)transitLabelItems
{
  void *v2;
  void *v3;

  if (self->_isDeveloperPlaceCard)
  {
    v2 = 0;
  }
  else
  {
    -[MKMapItem _transitInfo](self->_mapItem, "_transitInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "labelItems");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v2;
}

- (BOOL)hasHeroImage
{
  return -[MKMapItem _isMapItemTypeBrand](self->_mapItem, "_isMapItemTypeBrand");
}

- (void)loadHeroImageWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  double v14;
  double v15;
  double v16;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  if (v9)
  {
    -[MKMapItem _bestBrandIconURLForSize:allowSmaller:](self->_mapItem, "_bestBrandIconURLForSize:allowSmaller:", 1, width * a4, height * a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[MUPlaceHeaderViewModel imageManager](self, "imageManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __77__MUPlaceHeaderViewModel_loadHeroImageWithFrameSize_displayScale_completion___block_invoke;
      v12[3] = &unk_1E2E02048;
      v13 = v9;
      v14 = width;
      v15 = height;
      v16 = a4;
      objc_msgSend(v11, "loadAppImageAtURL:completionHandler:", v10, v12);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
    }

  }
}

void __77__MUPlaceHeaderViewModel_loadHeroImageWithFrameSize_displayScale_completion___block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5)
{
  id v8;
  double v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;

  v8 = a2;
  if (a5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(double *)(a1 + 56);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__MUPlaceHeaderViewModel_loadHeroImageWithFrameSize_displayScale_completion___block_invoke_2;
    v10[3] = &unk_1E2E02020;
    v13 = *(id *)(a1 + 32);
    v11 = v8;
    v12 = 0;
    v14 = a3;
    +[MapsUIUtilities resizeImageIfNeeded:toFrameSize:displayScale:completion:](MapsUIUtilities, "resizeImageIfNeeded:toFrameSize:displayScale:completion:", v11, v10, *(double *)(a1 + 40), *(double *)(a1 + 48), v9);

  }
}

uint64_t __77__MUPlaceHeaderViewModel_loadHeroImageWithFrameSize_displayScale_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 48);
  if (!a2)
    a2 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

- (BOOL)isVerified
{
  int v3;

  if (!GEOConfigGetBOOL()
    || (v3 = -[MKMapItem _isMapItemTypeBrand](self->_mapItem, "_isMapItemTypeBrand")) != 0)
  {
    LOBYTE(v3) = -[MKMapItem _isMessageIDVerified](self->_mapItem, "_isMessageIDVerified");
  }
  return v3;
}

- (BOOL)isClaimed
{
  return -[MKMapItem _isClaimed](self->_mapItem, "_isClaimed");
}

- (BOOL)supportsEnhancedBusinessHeader
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MKMapItem _businessAssets](self->_mapItem, "_businessAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverPhoto");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)loadVerifiedLogoImageWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  double v15;
  double v16;
  double v17;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  if (v9)
  {
    -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_bestAvatarBrandIconURLForSize:allowSmaller:", 1, width * a4, height * a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[MUPlaceHeaderViewModel imageManager](self, "imageManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __85__MUPlaceHeaderViewModel_loadVerifiedLogoImageWithFrameSize_displayScale_completion___block_invoke;
      v13[3] = &unk_1E2E02048;
      v14 = v9;
      v15 = width;
      v16 = height;
      v17 = a4;
      objc_msgSend(v12, "loadAppImageAtURL:completionHandler:", v11, v13);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
    }

  }
}

void __85__MUPlaceHeaderViewModel_loadVerifiedLogoImageWithFrameSize_displayScale_completion___block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5)
{
  id v8;
  double v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;

  v8 = a2;
  if (a5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(double *)(a1 + 56);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __85__MUPlaceHeaderViewModel_loadVerifiedLogoImageWithFrameSize_displayScale_completion___block_invoke_2;
    v10[3] = &unk_1E2E02020;
    v13 = *(id *)(a1 + 32);
    v11 = v8;
    v12 = 0;
    v14 = a3;
    +[MapsUIUtilities resizeImageIfNeeded:toFrameSize:displayScale:completion:](MapsUIUtilities, "resizeImageIfNeeded:toFrameSize:displayScale:completion:", v11, v10, *(double *)(a1 + 40), *(double *)(a1 + 48), v9);

  }
}

uint64_t __85__MUPlaceHeaderViewModel_loadVerifiedLogoImageWithFrameSize_displayScale_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 48);
  if (!a2)
    a2 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

- (void)loadCoverPhotoWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  if (v9)
  {
    -[MKMapItem _businessAssets](self->_mapItem, "_businessAssets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coverPhoto");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1EE23BB70 != -1)
      dispatch_once(&qword_1EE23BB70, &__block_literal_global_8);
    objc_msgSend(v11, "bestPhotoForFrameSize:displayScale:options:", _MergedGlobals_1, width, height, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[MUPlaceHeaderViewModel imageManager](self, "imageManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "url");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __78__MUPlaceHeaderViewModel_loadCoverPhotoWithFrameSize_displayScale_completion___block_invoke;
      v15[3] = &unk_1E2E02070;
      v16 = v9;
      objc_msgSend(v13, "loadAppImageAtURL:completionHandler:", v14, v15);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
    }

  }
}

uint64_t __78__MUPlaceHeaderViewModel_loadCoverPhotoWithFrameSize_displayScale_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)supportsLogo
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bestAvatarBrandIconURLForSize:allowSmaller:", 1, 1.79769313e308, 1.79769313e308);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (UIColor)coverPhotoBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MKMapItem _businessAssets](self->_mapItem, "_businessAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverPhoto");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundJoeColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_maps_colorFromHexString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (UIColor *)v5;
}

- (UIColor)logoBackgroundColor
{
  return 0;
}

- (BOOL)supportsContactAddressDescription
{
  return 0;
}

- (MKAppImageManager)imageManager
{
  return self->_imageManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_storeStrong((id *)&self->_enclosingPlaceViewModel, 0);
  objc_storeStrong((id *)&self->_composedString, 0);
  objc_storeStrong((id *)&self->_developerPlaceCardAuditToken, 0);
  objc_storeStrong((id *)&self->_enclosingPlaceString, 0);
  objc_storeStrong((id *)&self->_labelString, 0);
  objc_storeStrong((id *)&self->_enclosingMapItem, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
