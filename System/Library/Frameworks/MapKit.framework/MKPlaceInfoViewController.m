@implementation MKPlaceInfoViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MKPlaceInfoViewController)initWithPlaceItem:(id)a3
{
  id v5;
  MKPlaceInfoViewController *v6;
  MKPlaceInfoViewController *v7;
  uint64_t v8;
  MKMapItem *mapItem;
  void *v10;
  MKPlaceInfoViewController *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MKPlaceInfoViewController;
  v6 = -[MKPlaceInfoViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placeItem, a3);
    objc_msgSend(v5, "mapItem");
    v8 = objc_claimAutoreleasedReturnValue();
    mapItem = v7->_mapItem;
    v7->_mapItem = (MKMapItem *)v8;

    _MKLocalizedStringFromThisBundle(CFSTR("Info"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceInfoViewController setTitle:](v7, "setTitle:", v10);

    v11 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[16];

  MKGetPlaceCardLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlaceInfoViewDidLoad", (const char *)&unk_18B2CC343, buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)MKPlaceInfoViewController;
  -[MKPlaceInfoViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreservesSuperviewLayoutMargins:", 1);

  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsBottomHairline:", 0);

  -[MKPlaceInfoViewController _updateViewsAnimated:](self, "_updateViewsAnimated:", 0);
  MKGetPlaceCardLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlaceInfoViewDidLoad", (const char *)&unk_18B2CC343, buf, 2u);
  }

}

- (BOOL)hasContent
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[MKPlaceInfoViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (id)contact
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_MKPlaceItem contact](self->_placeItem, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_placeCardContact");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)shouldShowDetails
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[_MKPlaceItem isContactPersisted](self->_placeItem, "isContactPersisted"))
    return 1;
  -[MKPlaceInfoViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapsData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (unint64_t)actionTypeFromRowType:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 0;
  else
    return qword_18B2AF0C8[a3 - 1];
}

- (void)sectionView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5
{
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  MKPlaceCardActionItem *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", a5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MKPlaceInfoViewController actionTypeFromRowType:](self, "actionTypeFromRowType:", objc_msgSend(v6, "type"));
  v9 = objc_msgSend(v6, "type");
  if ((unint64_t)(v9 - 1) >= 4)
  {
    v10 = 0;
    if (!v9)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(v7, "labeledValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v14 = CFSTR("CNLabeledValue");
      objc_msgSend(v7, "labeledValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (v8)
  {
    v12 = -[MKPlaceCardActionItem initWithType:displayString:glyph:enabled:]([MKPlaceCardActionItem alloc], "initWithType:displayString:glyph:enabled:", v8, 0, 0, 0);
    -[MKPlaceInfoViewController actionDelegate](self, "actionDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performAction:options:completion:", v12, v10, 0);

  }
LABEL_7:

}

- (void)setBottomHairlineHidden:(BOOL)a3
{
  _BOOL8 v4;
  id v5;

  self->_bottomHairlineHidden = a3;
  if (-[MKPlaceInfoViewController isViewLoaded](self, "isViewLoaded"))
  {
    v4 = !self->_bottomHairlineHidden;
    -[MKPlaceSectionViewController sectionView](self, "sectionView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShowsBottomHairline:", v4);

  }
}

- (void)_updateViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  NSMutableArray *rows;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v3 = a3;
  v29[1] = *MEMORY[0x1E0C80C00];
  if (-[MKPlaceInfoViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    rows = self->_rows;
    self->_rows = v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceInfoViewController mapItem](self, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_addressFormattedAsMultilineAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0C97338];
      _MKLocalizedStringFromThisBundle(CFSTR("PlaceView_Address_Title"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "labeledValueWithLabel:value:", v11, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v29[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceInfoViewController _addContactRow:ofType:toViews:defaultTitle:](self, "_addContactRow:ofType:toViews:defaultTitle:", v13, 3, v7, 0);

    }
    -[MKPlaceInfoViewController contact](self, "contact");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = -[MKPlaceInfoViewController shouldShowDetails](self, "shouldShowDetails");

      if (v16)
      {
        -[MKPlaceInfoViewController contact](self, "contact");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "phoneNumbers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _MKLocalizedStringFromThisBundle(CFSTR("PlaceView_Phone_Title"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceInfoViewController _addContactRow:ofType:toViews:defaultTitle:](self, "_addContactRow:ofType:toViews:defaultTitle:", v18, 1, v7, v19);

        -[MKPlaceInfoViewController contact](self, "contact");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "urlAddresses");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        _MKLocalizedStringFromThisBundle(CFSTR("PlaceView_Website_Title"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceInfoViewController _addContactRow:ofType:toViews:defaultTitle:](self, "_addContactRow:ofType:toViews:defaultTitle:", v21, 2, v7, v22);

        -[MKPlaceInfoViewController contact](self, "contact");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "emailAddresses");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        _MKLocalizedStringFromThisBundle(CFSTR("PlaceView_Email_Title"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceInfoViewController _addContactRow:ofType:toViews:defaultTitle:](self, "_addContactRow:ofType:toViews:defaultTitle:", v24, 4, v7, v25);

      }
    }
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_85);
    objc_msgSend(v7, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTopHairlineHidden:", 1);

    objc_msgSend(v7, "lastObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBottomHairlineHidden:", 1);

    -[MKPlaceSectionViewController sectionView](self, "sectionView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setRowViews:animated:", v7, v3);

  }
}

void __50__MKPlaceInfoViewController__updateViewsAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setTopHairlineHidden:", 1);
  objc_msgSend(v2, "setBottomHairlineHidden:", 0);

}

- (void)_addContactRow:(id)a3 ofType:(unint64_t)a4 toViews:(id)a5 defaultTitle:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  MKPlaceInfoViewController *v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    v26 = v10;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v10);
        v17 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * v16);
        if (v12 && objc_msgSend(v10, "count") == 1)
        {
          v18 = v11;
          v19 = self;
          v20 = a4;
          v21 = objc_alloc(MEMORY[0x1E0C97338]);
          objc_msgSend(v17, "value");
          v22 = v15;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v21, "initWithLabel:value:", v12, v23);

          v15 = v22;
          v17 = (id)v24;
          a4 = v20;
          self = v19;
          v11 = v18;
          v10 = v26;
        }
        v25 = -[MKPlaceInfoViewController _addRowForType:withValue:toViews:](self, "_addRowForType:withValue:toViews:", a4, v17, v11);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

}

- (id)_addRowForType:(unint64_t)a3 withValue:(id)a4 toViews:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a5;
  objc_msgSend(0, "rowView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    || (-[MKPlaceInfoViewController _createViewForInfoRow:](self, "_createViewForInfoRow:", a3),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        +[MKPlaceInfoRow infoRow:ofType:](MKPlaceInfoRow, "infoRow:ofType:", v10, a3),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[MKPlaceInfoRow infoRow:ofType:](MKPlaceInfoRow, "infoRow:ofType:", v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MKPlaceInfoViewController _configureRow:ofType:withValue:](self, "_configureRow:ofType:withValue:", v10, a3, v8);
  objc_msgSend(v9, "addObject:", v10);

  -[NSMutableArray addObject:](self->_rows, "addObject:", v11);
  return v10;
}

- (id)_createViewForInfoRow:(unint64_t)a3
{
  id v4;
  __objc2_class **v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = 0;
  v5 = off_1E20D4F80;
  switch(a3)
  {
    case 0uLL:
      return v4;
    case 1uLL:
      goto LABEL_5;
    case 2uLL:
      v5 = off_1E20D4F90;
      goto LABEL_5;
    case 3uLL:
      v5 = off_1E20D4F88;
      goto LABEL_5;
    case 4uLL:
      v5 = off_1E20D4F78;
LABEL_5:
      v6 = objc_alloc(*v5);
      v4 = (id)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      break;
    default:
      break;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v4;
    -[MKPlaceInfoViewController mapItem](self, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "_isMapItemTypeBrand") & 1) != 0)
    {
      -[UIViewController mk_theme](self, "mk_theme");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLabelColor:", v10);

    }
    else
    {
      objc_msgSend(v7, "setLabelColor:", 0);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v4;
    -[UIViewController mk_theme](self, "mk_theme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLabelColor:", v12);

  }
  return v4;
}

- (void)_configureRow:(id)a3 ofType:(unint64_t)a4 withValue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v8 = a3;
  v9 = a5;
  switch(a4)
  {
    case 1uLL:
      objc_msgSend(v8, "setLabeledValue:", v9);
      -[MKPlaceInfoViewController mapItem](self, "mapItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setOptsOutOfAds:", objc_msgSend(v10, "_phoneNumberOptsOutOfAds"));

      goto LABEL_3;
    case 2uLL:
    case 4uLL:
LABEL_3:
      objc_msgSend(v8, "setLabeledValue:", v9);
      break;
    case 3uLL:
      v11 = v8;
      objc_msgSend(v11, "setLabeledValue:", v9);
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __60__MKPlaceInfoViewController__configureRow_ofType_withValue___block_invoke;
      v12[3] = &unk_1E20DCD60;
      objc_copyWeak(&v14, &location);
      v13 = v9;
      objc_msgSend(v11, "setIconSelectedBlock:", v12);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);

      break;
    default:
      break;
  }

}

void __60__MKPlaceInfoViewController__configureRow_ofType_withValue___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(*(id *)(a1 + 32), "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_shareAddress:fromView:", v5, v4);

}

- (void)_shareAddress:(id)a3 fromView:(id)a4
{
  id v5;
  MKPlaceCardActionItem *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = -[MKPlaceCardActionItem initWithType:displayString:glyph:enabled:]([MKPlaceCardActionItem alloc], "initWithType:displayString:glyph:enabled:", 16, 0, 0, 1);
  if (v5)
  {
    v9 = CFSTR("view");
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[MKPlaceInfoViewController actionDelegate](self, "actionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performAction:options:completion:", v6, v7, 0);

}

- (void)_launchMapsDirectionsWithSource:(id)a3 destination:(id)a4 directionsMode:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v15[0] = a3;
  v15[1] = a4;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("MKLaunchOptionsDirectionsMode");
  v14 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKMapItem openMapsWithItems:launchOptions:completionHandler:](MKMapItem, "openMapsWithItems:launchOptions:completionHandler:", v11, v12, &__block_literal_global_83);

}

- (id)infoCardChildPossibleActions
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_rows;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "type", (_QWORD)v15);
        v10 = 6009;
        switch(v9)
        {
          case 0:

            v13 = 0;
            goto LABEL_14;
          case 1:
            goto LABEL_9;
          case 2:
            v10 = 6010;
            goto LABEL_9;
          case 3:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 6008);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v11);

            v10 = 6013;
LABEL_9:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v12);

            break;
          default:
            break;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
LABEL_14:

  return v13;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)bottomHairlineHidden
{
  return self->_bottomHairlineHidden;
}

- (unint64_t)placecardOptions
{
  return self->_placecardOptions;
}

- (void)setPlacecardOptions:(unint64_t)a3
{
  self->_placecardOptions = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (MKPlaceActionManagerProtocol)actionDelegate
{
  return (MKPlaceActionManagerProtocol *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (void)setPlaceItem:(id)a3
{
  objc_storeStrong((id *)&self->_placeItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_selectedRow);
  objc_storeStrong((id *)&self->_rows, 0);
}

@end
