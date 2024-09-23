@implementation MKPlacePoisInlineMapViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)inlineMapWithMapItem:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  MKPlacePoisInlineMapViewController *v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "_isMapItemTypeBrand") && (objc_msgSend(v5, "_isStandAloneBrand") & 1) == 0)
    v7 = -[MKPlaceInlineMapViewController initWithMKMapItem:configuration:]([MKPlacePoisInlineMapViewController alloc], "initWithMKMapItem:configuration:", v5, v6);
  else
    v7 = 0;

  return v7;
}

- (void)loadView
{
  _MKPlacePoisInlineMapContentView *v3;
  _MKPlacePoisInlineMapContentView *v4;

  v3 = [_MKPlacePoisInlineMapContentView alloc];
  v4 = -[_MKPlacePoisInlineMapContentView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKPlacePoisInlineMapViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  _MKPlacePoisInlineMapContentView *v3;
  _MKPlacePoisInlineMapContentView *mapContentView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKPlacePoisInlineMapViewController;
  -[MKPlaceInlineMapViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[MKPlacePoisInlineMapViewController view](self, "view");
  v3 = (_MKPlacePoisInlineMapContentView *)objc_claimAutoreleasedReturnValue();
  mapContentView = self->_mapContentView;
  self->_mapContentView = v3;

}

- (id)visibleMapItems
{
  NSArray *fetchedMapItems;

  fetchedMapItems = self->_fetchedMapItems;
  if (fetchedMapItems)
    return fetchedMapItems;
  else
    return MEMORY[0x1E0C9AA60];
}

- (void)_updateMap
{
  void *v3;
  int v4;

  -[MKPlaceInlineMapViewController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isMapItemTypeBrand");

  if (v4)
    -[MKPlacePoisInlineMapViewController fetchPoisForBrand](self, "fetchPoisForBrand");
}

- (void)setLocation:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5 && !self->_location)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_location, a3);
    -[MKPlacePoisInlineMapViewController fetchPoisForBrand](self, "fetchPoisForBrand");
    v5 = v6;
  }

}

- (void)fetchPoisForBrand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  +[MKMapService sharedService](MKMapService, "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "hasDeviceLocation") & 1) != 0)
    goto LABEL_4;
  if (self->_location)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", self->_location);
    objc_msgSend(v4, "setDeviceLocation:", v5);

LABEL_4:
    -[MKPlaceInlineMapViewController mapItem](self, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_muid");

    +[MKMapService sharedService](MKMapService, "sharedService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ticketForSearchPoisForBrandMUID:traits:", v7, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__MKPlacePoisInlineMapViewController_fetchPoisForBrand__block_invoke;
    v10[3] = &unk_1E20D8D68;
    v10[4] = self;
    objc_msgSend(v9, "submitWithHandler:networkActivity:", v10, &__block_literal_global_178);

  }
}

void __55__MKPlacePoisInlineMapViewController_fetchPoisForBrand__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a2;
  v7 = v6;
  if (!a3)
  {
    v13 = v6;
    v8 = objc_msgSend(v6, "count");
    v7 = v13;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("MKPlaceActionManagerBrandStoresEnableNotification"), 0);

      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1048), a2);
      objc_msgSend(*(id *)(a1 + 32), "updateInlineMapWithRefinedMapItems");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setLocationsNumber:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "count"));
      objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", 0);
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "visible") & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setVisible:", 1);
        objc_msgSend(*(id *)(a1 + 32), "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "invalidateIntrinsicContentSize");

        objc_msgSend(*(id *)(a1 + 32), "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_mapkit_setNeedsLayout");

        objc_msgSend(*(id *)(a1 + 32), "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_mapkit_layoutIfNeeded");

      }
      objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", 1);
      v7 = v13;
    }
  }

}

- (id)geoCamera
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0D27648]);
  -[MKPlaceInlineMapViewController mapCamera](self, "mapCamera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerCoordinate");
  objc_msgSend(v3, "setLatitude:");

  -[MKPlaceInlineMapViewController mapCamera](self, "mapCamera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerCoordinate");
  objc_msgSend(v3, "setLongitude:", v6);

  -[MKPlaceInlineMapViewController mapCamera](self, "mapCamera");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "heading");
  objc_msgSend(v3, "setHeading:");

  -[MKPlaceInlineMapViewController mapCamera](self, "mapCamera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pitch");
  objc_msgSend(v3, "setPitch:");

  -[MKPlaceInlineMapViewController mapCamera](self, "mapCamera");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "altitude");
  objc_msgSend(v3, "setAltitude:");

  objc_msgSend(v3, "latitude");
  objc_msgSend(v3, "longitude");
  objc_msgSend(v3, "heading");
  objc_msgSend(v3, "pitch");
  objc_msgSend(v3, "altitude");
  return v3;
}

- (void)_handleTapOnMap
{
  id v3;

  if (-[_MKPlacePoisInlineMapContentView visible](self->_mapContentView, "visible"))
  {
    -[MKPlaceInlineMapViewController mapItem](self, "mapItem");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_launchActivityForBrandItem");

  }
}

- (int64_t)preferredUserInterfaceStyle
{
  return 0;
}

- (BOOL)resizableViewsDisabled
{
  return self->_resizableViewsDisabled;
}

- (void)setResizableViewsDisabled:(BOOL)a3
{
  self->_resizableViewsDisabled = a3;
}

- (CLLocation)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_mapContentView, 0);
  objc_storeStrong((id *)&self->_fetchedMapItems, 0);
}

@end
