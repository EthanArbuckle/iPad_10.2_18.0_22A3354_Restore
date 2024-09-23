@implementation MKMapItem

- (id)_bestWalletHeroImageForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _MKBestWalletHeroPhotoForGEOMapItem(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_5;
  objc_msgSend(v8, "bestPhotoForSize:allowSmaller:", v4, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {

LABEL_5:
    objc_msgSend(v7, "_bestHeroBrandIconURLForSize:allowSmaller:", v4, width, height);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v10, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v12;
}

- (id)_walletHeroImageProviderName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _MKBestWalletHeroPhotoForGEOMapItem(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "attribution");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "providerName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_mapItemsFromPunchInHintsURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
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
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id location;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v32 = a1;
    objc_msgSend(v6, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("x-maps-punchinhint"));

    if ((v9 & 1) != 0)
    {
      v10 = (void *)MEMORY[0x1E0CB3998];
      objc_msgSend(v6, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsWithString:", v11);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "queryItems");
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v40;
LABEL_5:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v40 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v15);
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("pm"));

          if ((v18 & 1) != 0)
            break;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
            if (v13)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        objc_msgSend(v16, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19 && objc_msgSend(v19, "length"))
        {
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27578]), "initWithEncodedString:", v19);
          +[MKMapService sharedService](MKMapService, "sharedService");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "defaultTraits");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "spotlightEncodedString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setSpotlightSearchPunchinEncodedString:", v23);

          +[MKMapService sharedService](MKMapService, "sharedService");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "completedSearchQuery");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "ticketForSearchQuery:completionItem:maxResults:traits:", v25, 0, 0, v31);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = (void *)objc_opt_new();
          objc_msgSend(v32, "_launchOptionsFromResourceOptionsDictionary:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v28, "mutableCopy");

          objc_initWeak(&location, v26);
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __77__MKMapItem_PunchInHintsSPI___mapItemsFromPunchInHintsURL_completionHandler___block_invoke;
          v34[3] = &unk_1E20D8F00;
          v36 = v7;
          objc_copyWeak(&v37, &location);
          v30 = v29;
          v35 = v30;
          objc_msgSend(v26, "submitWithHandler:networkActivity:", v34, 0);

          objc_destroyWeak(&v37);
          objc_destroyWeak(&location);

          goto LABEL_17;
        }
      }
      else
      {
LABEL_11:

        v19 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v21);
LABEL_17:

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v20);

    }
  }

}

void __77__MKMapItem_PunchInHintsSPI___mapItemsFromPunchInHintsURL_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "mapItemIdentifierForSpotlight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v16, "count"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v10, "mapItemIdentifierForSpotlight");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "isEqual:", v11);

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, CFSTR("MKLaunchOptionsSelectedIndex"));

        }
        ++v7;
      }
      while (v7 < objc_msgSend(v16, "count"));
    }
    v14 = *(_QWORD *)(a1 + 40);
    v15 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    (*(void (**)(uint64_t, id, void *, _QWORD))(v14 + 16))(v14, v16, v15, 0);

  }
}

- (BOOL)_browseCategory_canDisplayBrowseCategoriesForVenue
{
  void *v3;
  unint64_t v4;
  BOOL v5;
  void *v7;

  -[MKMapItem _identifier](self, "_identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && -[MKMapItem _hasVenueFeatureType](self, "_hasVenueFeatureType")
    && ((v4 = -[MKMapItem _venueFeatureType](self, "_venueFeatureType"), v4 > 4) || ((1 << v4) & 0x19) == 0))
  {
    -[MKMapItem _browseCategories](self, "_browseCategories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_browseCategory_canDisplayBrowseCategoriesForPlace
{
  void *v2;
  BOOL v3;

  -[MKMapItem _browseCategories](self, "_browseCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_browseCategory_isVenueItem
{
  void *v3;
  BOOL v4;

  -[MKMapItem _identifier](self, "_identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[MKMapItem _hasVenueFeatureType](self, "_hasVenueFeatureType");
  else
    v4 = 0;

  return v4;
}

- (int)_browseCategory_placeCardType
{
  int64_t v3;
  int v4;

  if (-[MKMapItem _browseCategory_isVenueItem](self, "_browseCategory_isVenueItem"))
  {
    v3 = -[MKMapItem _venueFeatureType](self, "_venueFeatureType");
    if (v3 == 2)
      v4 = 13;
    else
      v4 = 0;
    if (v3 == 1)
      return 12;
    else
      return v4;
  }
  else if (-[MKMapItem _hasMUID](self, "_hasMUID"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (void)_launchActivityForBrandItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("MKPlaceBrandUserActivity"));
  v4 = (void *)MEMORY[0x1E0CB36F8];
  v17[0] = CFSTR("MKPlaceBrandUserActivityName");
  -[MKMapItem name](self, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E20DFC00;
  v17[1] = CFSTR("MKPlaceBrandUserActivityID");
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MKMapItem _muid](self, "_muid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v15 = CFSTR("MKPlaceBrandUserActivityData");
    v16 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKMapItem _sharedSessionUserInfoForPunchoutUserInfo:](MKMapItem, "_sharedSessionUserInfoForPunchoutUserInfo:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserInfo:", v12);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.Maps"), 0, 0);
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "openUserActivity:withApplicationRecord:requireOptionKeyPromptUnlockDevice:completionHandler:", v3, v13, 1, 0);

  }
}

- (MKMapItem)init
{
  MKMapItem *v2;
  uint64_t v3;
  geo_isolater *isolation;
  MKMapItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKMapItem;
  v2 = -[MKMapItem init](&v7, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolation = v2->_isolation;
    v2->_isolation = (geo_isolater *)v3;

    v5 = v2;
  }

  return v2;
}

- (MKMapItem)initWithGeoMapItemAsCurrentLocation:(id)a3
{
  MKMapItem *v3;

  v3 = -[MKMapItem initWithGeoMapItem:isPlaceHolderPlace:](self, "initWithGeoMapItem:isPlaceHolderPlace:", a3, 0);
  -[MKMapItem setIsCurrentLocation:](v3, "setIsCurrentLocation:", 1);
  return v3;
}

- (MKMapItem)initWithGeoMapItem:(id)a3 isPlaceHolderPlace:(BOOL)a4
{
  id v7;
  MKMapItem *v8;
  MKMapItem *v9;
  id *p_geoMapItem;
  uint64_t v11;
  GEOMapItemStorageUserValues *userValues;
  void *place;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *didResolveAttributionToken;
  CLLocationDegrees v21;
  CLLocationDegrees v22;
  MKMapItem *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id location;

  v7 = a3;
  v8 = -[MKMapItem init](self, "init");
  v9 = v8;
  if (v8)
  {
    p_geoMapItem = (id *)&v8->_geoMapItem;
    objc_storeStrong((id *)&v8->_geoMapItem, a3);
    v9->_isPlaceHolder = a4;
    if (!v9->_geoMapItem)
    {
LABEL_9:
      v23 = v9;
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[GEOMapItem userValues](v9->_geoMapItem, "userValues");
      v11 = objc_claimAutoreleasedReturnValue();
      userValues = v9->_userValues;
      v9->_userValues = (GEOMapItemStorageUserValues *)v11;

    }
    objc_msgSend(*p_geoMapItem, "_placeData");
    place = (void *)objc_claimAutoreleasedReturnValue();
    if (!place)
    {
      objc_msgSend(*p_geoMapItem, "_placeResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        goto LABEL_8;
      -[GEOMapItem _place](v9->_geoMapItem, "_place");
      v25 = objc_claimAutoreleasedReturnValue();
      place = v9->_place;
      v9->_place = (GEOPlace *)v25;
    }

LABEL_8:
    objc_initWeak(&location, v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *p_geoMapItem;
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0D26648];
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __51__MKMapItem_initWithGeoMapItem_isPlaceHolderPlace___block_invoke;
    v29 = &unk_1E20DB378;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v15, "addObserverForName:object:queue:usingBlock:", v18, v16, v17, &v26);
    v19 = objc_claimAutoreleasedReturnValue();
    didResolveAttributionToken = v9->_didResolveAttributionToken;
    v9->_didResolveAttributionToken = v19;

    objc_msgSend(v7, "coordinate", v26, v27, v28, v29);
    v9->_presentCoordinate.latitude = v21;
    v9->_presentCoordinate.longitude = v22;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
LABEL_10:

  return v9;
}

void __51__MKMapItem_initWithGeoMapItem_isPlaceHolderPlace___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v6 = WeakRetained;
    v9 = v6;
    geo_isolate_sync();
    if (*((_BYTE *)v11 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v8, 3221225472, __51__MKMapItem_initWithGeoMapItem_isPlaceHolderPlace___block_invoke_2, &unk_1E20D7F20, v6, &v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:", CFSTR("MKMapItemDidResolveAttribution"), v6);

    }
    _Block_object_dispose(&v10, 8);
  }

}

_BYTE *__51__MKMapItem_initWithGeoMapItem_isPlaceHolderPlace___block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[144])
  {
    result = (_BYTE *)objc_msgSend(result, "_refreshAttribution");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (MKMapItem)initWithPlace:(id)a3
{
  return -[MKMapItem initWithPlace:isPlaceHolderPlace:](self, "initWithPlace:isPlaceHolderPlace:", a3, 0);
}

- (MKMapItem)initWithPlace:(id)a3 isPlaceHolderPlace:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  MKMapItem *v7;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0D271E8], "mapItemStorageForPlace:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MKMapItem initWithGeoMapItem:isPlaceHolderPlace:](self, "initWithGeoMapItem:isPlaceHolderPlace:", v6, v4);

  return v7;
}

- (MKMapItem)initWithAddressDictionary:(id)a3
{
  id v4;
  MKPlacemark *v5;
  MKPlacemark *v6;
  MKMapItem *v7;

  v4 = a3;
  v5 = [MKPlacemark alloc];
  v6 = -[MKPlacemark initWithCoordinate:addressDictionary:](v5, "initWithCoordinate:addressDictionary:", v4, *MEMORY[0x1E0C9E500], *(double *)(MEMORY[0x1E0C9E500] + 8));

  v7 = -[MKMapItem initWithPlacemark:](self, "initWithPlacemark:", v6);
  return v7;
}

- (MKMapItem)initWithCLLocation:(id)a3 placeType:(int)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  MKMapItem *v14;

  v4 = *(_QWORD *)&a4;
  v6 = (objc_class *)MEMORY[0x1E0D27330];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "coordinate");
  v10 = v9;
  objc_msgSend(v7, "coordinate");
  v12 = v11;

  v13 = (void *)objc_msgSend(v8, "initWithLatitude:longitude:placeType:", v4, v10, v12);
  v14 = -[MKMapItem initWithPlace:](self, "initWithPlace:", v13);

  return v14;
}

- (MKMapItem)initWithCLLocation:(id)a3
{
  return -[MKMapItem initWithCLLocation:placeType:](self, "initWithCLLocation:placeType:", a3, 0);
}

- (MKMapItem)initWithPlacemark:(MKPlacemark *)placemark
{
  MKPlacemark *v4;
  void *v5;
  MKMapItem *v6;
  void *v7;
  void *v8;
  MKMapItem *v9;

  v4 = placemark;
  -[MKPlacemark _geoMapItem](v4, "_geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[MKMapItem initWithGeoMapItem:isPlaceHolderPlace:](self, "initWithGeoMapItem:isPlaceHolderPlace:", v5, 1);
  }
  else
  {
    -[MKPlacemark mkPostalAddressDictionary](v4, "mkPostalAddressDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27330]), "initWithPlacemark:", v4);
    if (v7)
      v9 = -[MKMapItem initWithPlace:isPlaceHolderPlace:](self, "initWithPlace:isPlaceHolderPlace:", v8, 1);
    else
      v9 = -[MKMapItem initWithPlace:](self, "initWithPlace:", v8);
    v6 = v9;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_didResolveAttributionToken)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_didResolveAttributionToken);

  }
  v4.receiver = self;
  v4.super_class = (Class)MKMapItem;
  -[MKMapItem dealloc](&v4, sel_dealloc);
}

+ (MKMapItem)mapItemForCurrentLocation
{
  if (qword_1ECE2DBE8 != -1)
    dispatch_once(&qword_1ECE2DBE8, &__block_literal_global_62);
  return (MKMapItem *)(id)_MergedGlobals_154;
}

uint64_t __38__MKMapItem_mapItemForCurrentLocation__block_invoke()
{
  MKMapItem *v0;
  void *v1;

  v0 = -[MKMapItem initWithGeoMapItem:isPlaceHolderPlace:]([MKMapItem alloc], "initWithGeoMapItem:isPlaceHolderPlace:", 0, 0);
  v1 = (void *)_MergedGlobals_154;
  _MergedGlobals_154 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_154, "setIsCurrentLocation:", 1);
}

- (id)_isolatedPlace
{
  void *v3;
  GEOPlace *v4;
  GEOPlace *place;
  void *v6;
  void *v7;

  geo_assert_isolated();
  if (!self->_place)
  {
    -[MKMapItem _geoMapItem](self, "_geoMapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_place");
    v4 = (GEOPlace *)objc_claimAutoreleasedReturnValue();
    place = self->_place;
    self->_place = v4;

    -[GEOMapItemStorageUserValues name](self->_userValues, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[GEOMapItemStorageUserValues name](self->_userValues, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPlace setName:](self->_place, "setName:", v7);

    }
  }
  return self->_place;
}

- (GEOPlace)place
{
  void *v3;
  geo_isolater *v5;

  v5 = self->_isolation;
  _geo_isolate_lock();
  -[MKMapItem _isolatedPlace](self, "_isolatedPlace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _geo_isolate_unlock();

  return (GEOPlace *)v3;
}

- (MKMapItemMetadata)metadata
{
  MKMapItemMetadata *metadata;
  void *v4;
  void *v5;
  MKMapItemMetadata *v6;
  MKMapItemMetadata *v7;
  MKMapItemMetadata *v8;
  geo_isolater *v10;

  v10 = self->_isolation;
  _geo_isolate_lock();
  metadata = self->_metadata;
  if (!metadata)
  {
    -[MKMapItem _isolatedPlace](self, "_isolatedPlace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstBusiness");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = -[MKMapItemMetadata initWithBusiness:]([MKMapItemMetadata alloc], "initWithBusiness:", v5);
      v7 = self->_metadata;
      self->_metadata = v6;

    }
    metadata = self->_metadata;
  }
  v8 = metadata;
  _geo_isolate_unlock();

  return v8;
}

- (MKPlacemark)placemark
{
  MKPlacemark *v2;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  MKPlacemark *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MKPlacemark *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  uint64_t v25;
  MKPlacemark *v26;

  if (self->_isCurrentLocation)
  {
    v2 = 0;
  }
  else
  {
    if (self->_geoMapItem)
    {
      -[MKMapItem _coordinate](self, "_coordinate");
      v5 = v4;
      v7 = v6;
      -[GEOMapItem geoFenceMapRegion](self->_geoMapItem, "geoFenceMapRegion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0C9E368], "circularRegionFromMapRegion:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[GEOMapItem referenceFrame](self->_geoMapItem, "referenceFrame");
        if (v10 == 1)
          v11 = 1;
        else
          v11 = 2 * (v10 == 2);
        objc_msgSend(v9, "setGeoReferenceFrame:", v11);
      }
      else
      {
        v9 = 0;
      }
      v22 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[GEOMapItem referenceFrame](self->_geoMapItem, "referenceFrame");
      if (v24 == 1)
        v25 = 1;
      else
        v25 = 2 * (v24 == 2);
      v13 = (void *)objc_msgSend(v22, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v23, v25, v5, v7, 0.0, 0.0, -1.0);

      v26 = [MKPlacemark alloc];
      -[GEOMapItem addressDictionary](self->_geoMapItem, "addressDictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOMapItem geoAddress](self->_geoMapItem, "geoAddress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "structuredAddress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "areaOfInterests");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v26;
      v19 = v13;
      v20 = v14;
      v21 = v9;
    }
    else
    {
      -[MKMapItem place](self, "place");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = [MKPlacemark alloc];
      objc_msgSend(v8, "clLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addressDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "clRegion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "address");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "structuredAddress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "areaOfInterests");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v12;
      v19 = v9;
      v20 = v13;
      v21 = v14;
    }
    v2 = -[MKPlacemark initWithLocation:addressDictionary:region:areasOfInterest:](v18, "initWithLocation:addressDictionary:region:areasOfInterest:", v19, v20, v21, v17);

  }
  return v2;
}

- (_MKMapItemPlaceAttribution)_attribution
{
  _MKMapItemPlaceAttribution *v3;
  geo_isolater *v5;

  v5 = self->_isolation;
  _geo_isolate_lock();
  if (!self->_hasLoadedAttribution)
    -[MKMapItem _refreshAttribution](self, "_refreshAttribution");
  v3 = self->_attribution;
  _geo_isolate_unlock();

  return v3;
}

- (_MKMapItemPhotosAttribution)_photosAttribution
{
  _MKMapItemPhotosAttribution *v3;
  geo_isolater *v5;

  v5 = self->_isolation;
  _geo_isolate_lock();
  if (!self->_hasLoadedAttribution)
    -[MKMapItem _refreshAttribution](self, "_refreshAttribution");
  v3 = self->_photosAttribution;
  _geo_isolate_unlock();

  return v3;
}

- (NSArray)_allPhotoAttributions
{
  NSArray *v3;
  geo_isolater *v5;

  v5 = self->_isolation;
  _geo_isolate_lock();
  if (!self->_hasLoadedAttribution)
    -[MKMapItem _refreshAttribution](self, "_refreshAttribution");
  v3 = self->_allPhotoAttributions;
  _geo_isolate_unlock();

  return v3;
}

- (_MKMapItemReviewsAttribution)_reviewsAttribution
{
  _MKMapItemReviewsAttribution *v3;
  geo_isolater *v5;

  v5 = self->_isolation;
  _geo_isolate_lock();
  if (!self->_hasLoadedAttribution)
    -[MKMapItem _refreshAttribution](self, "_refreshAttribution");
  v3 = self->_reviewsAttribution;
  _geo_isolate_unlock();

  return v3;
}

- (_MKMapItemAttribution)_encyclopedicInfoAttribution
{
  _MKMapItemAttribution *v3;
  geo_isolater *v5;

  v5 = self->_isolation;
  _geo_isolate_lock();
  if (!self->_hasLoadedAttribution)
    -[MKMapItem _refreshAttribution](self, "_refreshAttribution");
  v3 = self->_encyclopedicInfoAttribution;
  _geo_isolate_unlock();

  return v3;
}

- (void)_refreshAttribution
{
  _MKMapItemPlaceAttribution *v3;
  void *v4;
  _MKMapItemPlaceAttribution *v5;
  _MKMapItemPlaceAttribution *attribution;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _MKMapItemPhotosAttribution *v13;
  _MKMapItemPhotosAttribution *v14;
  _MKMapItemPhotosAttribution *photosAttribution;
  NSArray *v16;
  NSArray *allPhotoAttributions;
  _MKMapItemReviewsAttribution *v18;
  void *v19;
  _MKMapItemReviewsAttribution *v20;
  _MKMapItemReviewsAttribution *reviewsAttribution;
  _MKMapItemAttribution *v22;
  void *v23;
  void *v24;
  _MKMapItemAttribution *v25;
  _MKMapItemAttribution *encyclopedicInfoAttribution;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  geo_assert_isolated();
  v3 = [_MKMapItemPlaceAttribution alloc];
  -[GEOMapItem _attribution](self->_geoMapItem, "_attribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_MKMapItemPlaceAttribution initWithGEOMapItemAttribution:](v3, "initWithGEOMapItemAttribution:", v4);
  attribution = self->_attribution;
  self->_attribution = v5;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[GEOMapItem _allPhotoAttributions](self->_geoMapItem, "_allPhotoAttributions", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = -[_MKMapItemPhotosAttribution initWithGEOMapItemAttribution:]([_MKMapItemPhotosAttribution alloc], "initWithGEOMapItemAttribution:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12));
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "firstObject");
  v14 = (_MKMapItemPhotosAttribution *)objc_claimAutoreleasedReturnValue();
  photosAttribution = self->_photosAttribution;
  self->_photosAttribution = v14;

  v16 = (NSArray *)objc_msgSend(v7, "copy");
  allPhotoAttributions = self->_allPhotoAttributions;
  self->_allPhotoAttributions = v16;

  v18 = [_MKMapItemReviewsAttribution alloc];
  -[GEOMapItem _reviewsAttribution](self->_geoMapItem, "_reviewsAttribution");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[_MKMapItemReviewsAttribution initWithGEOMapItemAttribution:](v18, "initWithGEOMapItemAttribution:", v19);
  reviewsAttribution = self->_reviewsAttribution;
  self->_reviewsAttribution = v20;

  v22 = [_MKMapItemAttribution alloc];
  -[GEOMapItem _encyclopedicInfo](self->_geoMapItem, "_encyclopedicInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encyclopedicAttribution");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[_MKMapItemAttribution initWithGEOMapItemAttribution:](v22, "initWithGEOMapItemAttribution:", v24);
  encyclopedicInfoAttribution = self->_encyclopedicInfoAttribution;
  self->_encyclopedicInfoAttribution = v25;

  self->_hasLoadedAttribution = 1;
}

- (NSString)description
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
  void *v12;
  objc_super v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItem name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MKMapItem isCurrentLocation](self, "isCurrentLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isCurrentLocation"));

  -[MKMapItem phoneNumber](self, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("phoneNumber"));
  -[MKMapItem timeZone](self, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("timeZone"));
  -[MKMapItem url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("url"));
  -[MKMapItem placemark](self, "placemark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("placemark"));
  v10 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)MKMapItem;
  -[MKMapItem description](&v14, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ %@"), v11, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unint64_t)hash
{
  GEOMapItem *geoMapItem;
  void *v5;
  unint64_t v6;

  if (-[MKMapItem isCurrentLocation](self, "isCurrentLocation"))
    return 0;
  geoMapItem = self->_geoMapItem;
  if (geoMapItem)
    return -[GEOMapItem hash](geoMapItem, "hash");
  -[MKMapItem place](self, "place");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  _QWORD *v6;
  char v7;
  GEOMapItemStorageUserValues *userValues;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    if (objc_msgSend(v6, "isCurrentLocation"))
    {
      v7 = -[MKMapItem isCurrentLocation](self, "isCurrentLocation");
LABEL_15:

      goto LABEL_16;
    }
    if (-[GEOMapItem isEqualToMapItem:](self->_geoMapItem, "isEqualToMapItem:", v6[2]))
    {
      userValues = self->_userValues;
      if (userValues == (GEOMapItemStorageUserValues *)v6[13]
        || -[GEOMapItemStorageUserValues isEqual:](userValues, "isEqual:"))
      {
        objc_msgSend(v6, "pointOfInterestCategory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          -[MKMapItem pointOfInterestCategory](self, "pointOfInterestCategory");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
            goto LABEL_12;
        }
        objc_msgSend(v6, "pointOfInterestCategory");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKMapItem pointOfInterestCategory](self, "pointOfInterestCategory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (v9)
        {

          if (v12)
          {
LABEL_12:
            -[MKMapItem place](self, "place");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "place");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_msgSend(v13, "isEqual:", v14);

            goto LABEL_15;
          }
        }
        else
        {

          if ((v12 & 1) != 0)
            goto LABEL_12;
        }
      }
    }
    v7 = 0;
    goto LABEL_15;
  }
  v7 = 0;
LABEL_16:

  return v7;
}

- (GEOMapItemPrivate)_geoMapItem
{
  return self->_geoMapItem;
}

- (GEOMapItemStorage)_geoMapItemStorageForPersistence
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D271E8], "mapItemStorageForGEOMapItem:forUseType:", self->_geoMapItem, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserValues:", self->_userValues);
  return (GEOMapItemStorage *)v3;
}

- (GEOMapItemStorage)_geoMapItemStorageForDragAndDrop
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D271E8], "mapItemStorageForGEOMapItem:forUseType:", self->_geoMapItem, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserValues:", self->_userValues);
  return (GEOMapItemStorage *)v3;
}

- (GEOMapItemStorageUserValues)userValues
{
  GEOMapItemStorageUserValues *userValues;
  GEOMapItemStorageUserValues *v4;
  GEOMapItemStorageUserValues *v5;

  userValues = self->_userValues;
  if (!userValues)
  {
    v4 = (GEOMapItemStorageUserValues *)objc_alloc_init(MEMORY[0x1E0D271F0]);
    v5 = self->_userValues;
    self->_userValues = v4;

    userValues = self->_userValues;
  }
  return userValues;
}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v14;
  double v15;

  -[GEOMapItemStorageUserValues name](self->_userValues, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (-[MKMapItem _hasTransitDisplayName](self, "_hasTransitDisplayName"))
    {
      -[MKMapItem _transitDisplayName](self, "_transitDisplayName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "length"))
      {
        v6 = v5;
        v4 = v6;
LABEL_17:

        return (NSString *)v4;
      }
    }
    else
    {
      v5 = 0;
    }
    -[MKMapItem place](self, "place");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "length"))
      {
        v10 = v9;
LABEL_15:
        v6 = v10;
LABEL_16:
        v4 = v10;

        goto LABEL_17;
      }
      objc_msgSend(v8, "firstBusiness");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "length"))
      {
LABEL_14:
        v10 = v6;
        goto LABEL_15;
      }
      -[GEOMapItem addressObject](self->_geoMapItem, "addressObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "length"))
      {
        v10 = v5;
        goto LABEL_15;
      }
    }
    -[GEOMapItem name](self->_geoMapItem, "name");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v6, "length"))
    {
      if (-[GEOMapItem isDisputed](self->_geoMapItem, "isDisputed")
        && ((-[GEOMapItem centerCoordinate](self->_geoMapItem, "centerCoordinate"), fabs(v15 + 180.0) >= 0.00000001)
         || fabs(v14 + 180.0) >= 0.00000001))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "_mapkit_formattedStringForCoordinate:");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        MKLocalizedStringForUnknownLocation();
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  -[GEOMapItemStorageUserValues name](self->_userValues, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v4;
}

- (void)setName:(NSString *)name
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)-[NSString copy](name, "copy");
  -[MKMapItem userValues](self, "userValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v4);

  -[GEOMapItemStorageUserValues name](self->_userValues, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOPlace setName:](self->_place, "setName:", v6);

}

- (NSString)_secondaryName
{
  return (NSString *)-[GEOMapItem secondaryName](self->_geoMapItem, "secondaryName");
}

- (NSString)_secondarySpokenName
{
  return (NSString *)-[GEOMapItem secondarySpokenName](self->_geoMapItem, "secondarySpokenName");
}

- (NSString)phoneNumber
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFLocale *v7;
  const __CFLocale *v8;
  CFTypeRef Value;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  uint64_t String;
  const void *v14;
  uint64_t v15;

  -[GEOMapItemStorageUserValues phoneNumber](self->_userValues, "phoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[GEOMapItemStorageUserValues phoneNumber](self->_userValues, "phoneNumber");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_6;
  }
  if (-[GEOMapItem _hasTelephone](self->_geoMapItem, "_hasTelephone"))
  {
    -[GEOMapItem _telephone](self->_geoMapItem, "_telephone");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v6 = 0;
LABEL_6:
  v7 = CFLocaleCopyCurrent();
  if (v7)
  {
    v8 = v7;
    Value = CFLocaleGetValue(v7, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
    if (Value)
    {
      v10 = mk_CFPhoneNumberCreate(0, (uint64_t)v6, (uint64_t)Value);
      if (v10)
      {
        v11 = (const void *)v10;
        if (objc_msgSend(v6, "length"))
        {
          if (objc_msgSend(v6, "characterAtIndex:", 0) == 43)
            v12 = 7;
          else
            v12 = 5;
        }
        else
        {
          v12 = 5;
        }
        String = mk_CFPhoneNumberCreateString(0, (uint64_t)v11, v12);
        if (String)
        {
          v14 = (const void *)String;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", String);
          v15 = objc_claimAutoreleasedReturnValue();

          CFRelease(v14);
          v6 = (void *)v15;
        }
        CFRelease(v11);
      }
    }
    CFRelease(v8);
  }
  return (NSString *)v6;
}

- (void)setPhoneNumber:(NSString *)phoneNumber
{
  void *v4;
  id v5;

  v5 = (id)-[NSString copy](phoneNumber, "copy");
  -[MKMapItem userValues](self, "userValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhoneNumber:", v5);

}

- (BOOL)_phoneNumberOptsOutOfAds
{
  void *v3;
  uint64_t v4;

  -[GEOMapItemStorageUserValues phoneNumber](self->_userValues, "phoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    return 0;
  else
    return -[GEOMapItem _optsOutOfTelephoneAds](self->_geoMapItem, "_optsOutOfTelephoneAds");
}

- (void)setPointOfInterestCategory:(MKPointOfInterestCategory)pointOfInterestCategory
{
  uint64_t v4;
  NSString *v5;
  NSString *customPOICategory;
  MKPointOfInterestCategory v7;

  v7 = pointOfInterestCategory;
  -[MKMapItem pointOfInterestCategory](self, "pointOfInterestCategory");
  v4 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v4 && (-[NSString isEqual:](self->_customPOICategory, "isEqual:", v7) & 1) == 0)
  {
    self->_useCustomPOICategory = 1;
    -[MKMapItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("pointOfInterestCategory"));
    v5 = (NSString *)-[NSString copy](v7, "copy");
    customPOICategory = self->_customPOICategory;
    self->_customPOICategory = v5;

    -[MKMapItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("pointOfInterestCategory"));
  }

}

- (MKPointOfInterestCategory)pointOfInterestCategory
{
  NSString *v2;
  void *v3;
  void *v4;

  if (self->_useCustomPOICategory)
  {
    v2 = self->_customPOICategory;
  }
  else
  {
    -[MKMapItem _geoMapItem](self, "_geoMapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_poiCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      MKPointOfInterestCategoryForGEOPOICategory(v4);
      v2 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (NSTimeZone)timeZone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[GEOMapItemStorageUserValues timeZoneName](self->_userValues, "timeZoneName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E80];
    -[GEOMapItemStorageUserValues timeZoneName](self->_userValues, "timeZoneName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOMapItemStorageUserValues timeZoneData](self->_userValues, "timeZoneData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeZoneWithName:data:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[GEOMapItem timezone](self->_geoMapItem, "timezone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSTimeZone *)v7;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  NSTimeZone *v4;
  NSTimeZone *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GEOMapItemStorageUserValues *userValues;
  NSTimeZone *v11;

  v4 = timeZone;
  v5 = v4;
  if (v4)
  {
    v11 = v4;
    -[NSTimeZone name](v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem userValues](self, "userValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeZoneName:", v6);

    -[NSTimeZone data](v11, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem userValues](self, "userValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeZoneData:", v8);

LABEL_5:
    v5 = v11;
    goto LABEL_6;
  }
  userValues = self->_userValues;
  if (userValues)
  {
    v11 = 0;
    -[GEOMapItemStorageUserValues setTimeZoneName:](userValues, "setTimeZoneName:", 0);
    -[GEOMapItemStorageUserValues setTimeZoneData:](self->_userValues, "setTimeZoneData:", 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)_getBusiness
{
  void *v3;
  id v4;
  void *v5;

  -[MKMapItem place](self, "place");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstBusiness");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D26F28]);
    -[MKMapItem place](self, "place");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addBusiness:", v4);

  }
  return v4;
}

- (NSURL)url
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
  void *v13;
  void *v14;
  uint64_t v15;

  -[GEOMapItemStorageUserValues url](self->_userValues, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (v4 = (void *)MEMORY[0x1E0C99E98],
        -[GEOMapItemStorageUserValues url](self->_userValues, "url"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "URLWithString:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    -[MKMapItem place](self, "place");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[MKMapItem place](self, "place");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstBusiness");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "uRL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[GEOMapItem _businessURL](self->_geoMapItem, "_businessURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scheme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (!v12)
      {
        v13 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("http://%@"), v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URLWithString:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v15;
      }
    }
    else
    {
      v6 = 0;
    }

  }
  return (NSURL *)v6;
}

- (void)setUrl:(NSURL *)url
{
  void *v4;
  id v5;

  -[NSURL absoluteString](url, "absoluteString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapItem userValues](self, "userValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUrl:", v5);

}

- (NSString)yelpID
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MKMapItem place](self, "place");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstBusiness");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "sources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "sourceName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("yelp"));

        if (!v11)
        {
          objc_msgSend(v9, "sourceId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return (NSString *)v12;
}

- (CLLocationCoordinate2D)_coordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  -[GEOMapItem coordinate](self->_geoMapItem, "coordinate");
  if (((fabs(v3 + 180.0) < 0.00000001) & (fabs(v2 + 180.0) < 0.00000001)) != 0)
  {
    v2 = *MEMORY[0x1E0C9E500];
    v3 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (CLLocationCoordinate2D)_labelCoordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  -[GEOMapItem labelCoordinate](self->_geoMapItem, "labelCoordinate");
  if (((fabs(v3 + 180.0) < 0.00000001) & (fabs(v2 + 180.0) < 0.00000001)) != 0)
  {
    v2 = *MEMORY[0x1E0C9E500];
    v3 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (GEOMapRegion)_displayMapRegion
{
  return (GEOMapRegion *)-[GEOMapItem displayMapRegion](self->_geoMapItem, "displayMapRegion");
}

- (BOOL)_hasDisplayMinZoom
{
  return -[GEOMapItem hasDisplayMinZoom](self->_geoMapItem, "hasDisplayMinZoom");
}

- (float)_displayMinZoom
{
  float result;

  -[GEOMapItem displayMinZoom](self->_geoMapItem, "displayMinZoom");
  return result;
}

- (BOOL)_hasDisplayMaxZoom
{
  return -[GEOMapItem hasDisplayMaxZoom](self->_geoMapItem, "hasDisplayMaxZoom");
}

- (float)_displayMaxZoom
{
  float result;

  -[GEOMapItem displayMaxZoom](self->_geoMapItem, "displayMaxZoom");
  return result;
}

- (GEOMapRegion)_geoFenceMapRegion
{
  return (GEOMapRegion *)-[GEOMapItem geoFenceMapRegion](self->_geoMapItem, "geoFenceMapRegion");
}

- (BOOL)_isMapItemTypeTransit
{
  BOOL v3;
  void *v4;

  if (-[MKMapItem _hasTransit](self, "_hasTransit") || self->_isMapItemTypeTransit)
    return 1;
  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "_placeDisplayType") == 4;

  return v3;
}

- (BOOL)_isPartiallyClientized
{
  return -[GEOMapItem _isPartiallyClientized](self->_geoMapItem, "_isPartiallyClientized");
}

- (BOOL)_hasTransit
{
  return -[GEOMapItem _hasTransit](self->_geoMapItem, "_hasTransit");
}

- (BOOL)_hasTransitDisplayName
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MKMapItem _transitInfo](self, "_transitInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (NSString)_transitDisplayName
{
  void *v2;
  void *v3;

  -[MKMapItem _transitInfo](self, "_transitInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)_hasTransitLabels
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MKMapItem _transitInfo](self, "_transitInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labelItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (GEOTransitAttribution)_transitAttribution
{
  GEOTransitAttribution *updatedTransitAttribution;

  updatedTransitAttribution = self->_updatedTransitAttribution;
  if (updatedTransitAttribution)
    return updatedTransitAttribution;
  -[GEOMapItem _transitAttribution](self->_geoMapItem, "_transitAttribution");
  return (GEOTransitAttribution *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_formatterForAdamId
{
  NSNumberFormatter *numberFormatterForAdamId;
  NSNumberFormatter *v4;
  NSNumberFormatter *v5;

  numberFormatterForAdamId = self->_numberFormatterForAdamId;
  if (!numberFormatterForAdamId)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v5 = self->_numberFormatterForAdamId;
    self->_numberFormatterForAdamId = v4;

    -[NSNumberFormatter setNumberStyle:](self->_numberFormatterForAdamId, "setNumberStyle:", 1);
    numberFormatterForAdamId = self->_numberFormatterForAdamId;
  }
  return numberFormatterForAdamId;
}

- (GEOMapItemTransitInfo)_transitInfo
{
  GEOMapItemTransitInfo *v3;
  GEOMapItemTransitInfo *defaultTransitInfo;
  uint64_t v5;

  if (!self->_defaultTransitInfo
    && !self->_isTransitInfoUpdated
    && -[GEOMapItem _hasTransit](self->_geoMapItem, "_hasTransit"))
  {
    -[GEOMapItem _transitInfo](self->_geoMapItem, "_transitInfo");
    v3 = (GEOMapItemTransitInfo *)objc_claimAutoreleasedReturnValue();
    defaultTransitInfo = self->_defaultTransitInfo;
    self->_defaultTransitInfo = v3;

  }
  v5 = 56;
  if (!self->_isTransitInfoUpdated)
    v5 = 64;
  return (GEOMapItemTransitInfo *)*(id *)((char *)&self->super.isa + v5);
}

- (void)preloadTransitInfoWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  MKTransitInfoPreloader *v8;
  void *v9;
  void *v10;
  MKTransitInfoPreloader *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  id v14;
  id location;

  v4 = (void (**)(_QWORD))a3;
  if (v4)
  {
    -[MKMapItem _transitInfo](self, "_transitInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "labelItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_initWeak(&location, self);
      v8 = [MKTransitInfoPreloader alloc];
      -[MKMapItem _transitInfo](self, "_transitInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "labelItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[MKTransitInfoPreloader initWithTransitLabels:](v8, "initWithTransitLabels:", v10);

      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __46__MKMapItem_preloadTransitInfoWithCompletion___block_invoke;
      v12[3] = &unk_1E20DBA48;
      objc_copyWeak(&v14, &location);
      v13 = v4;
      -[MKTransitInfoPreloader preloadWithCompletion:](v11, "preloadWithCompletion:", v12);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      v4[2](v4);
    }
  }

}

void __46__MKMapItem_preloadTransitInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 31, a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)_hasFlyover
{
  return -[GEOMapItem _hasFlyover](self->_geoMapItem, "_hasFlyover");
}

- (GEOPDFlyover)_flyover
{
  return (GEOPDFlyover *)-[GEOMapItem _flyover](self->_geoMapItem, "_flyover");
}

- (NSString)_flyoverAnnouncementMessage
{
  return (NSString *)-[GEOMapItem _flyoverAnnouncementMessage](self->_geoMapItem, "_flyoverAnnouncementMessage");
}

- (BOOL)_hasVenueFeatureType
{
  return -[GEOMapItem _hasVenueFeatureType](self->_geoMapItem, "_hasVenueFeatureType");
}

- (int64_t)_venueFeatureType
{
  uint64_t v3;

  if (-[MKMapItem _hasVenueFeatureType](self, "_hasVenueFeatureType")
    && (v3 = -[GEOMapItem _venueFeatureType](self->_geoMapItem, "_venueFeatureType") - 1,
        v3 <= 3))
  {
    return v3 + 1;
  }
  else
  {
    return 0;
  }
}

- (GEOMapItemVenueInfo)_venueInfo
{
  return (GEOMapItemVenueInfo *)-[GEOMapItem _venueInfo](self->_geoMapItem, "_venueInfo");
}

- (NSArray)_browseCategories
{
  return (NSArray *)-[GEOMapItem _browseCategories](self->_geoMapItem, "_browseCategories");
}

- (GEOMiniBrowseCategories)_miniBrowseCategories
{
  return (GEOMiniBrowseCategories *)-[GEOMapItem _miniBrowseCategories](self->_geoMapItem, "_miniBrowseCategories");
}

- (int)_placeDisplayStyle
{
  return -[GEOMapItem _placeDisplayStyle](self->_geoMapItem, "_placeDisplayStyle");
}

- (GEOAnnotatedItemList)_annotatedItemList
{
  return (GEOAnnotatedItemList *)-[GEOMapItem _annotatedItemList](self->_geoMapItem, "_annotatedItemList");
}

- (BOOL)_hasMuninViewState
{
  void *v2;
  BOOL v3;

  -[GEOMapItem _muninViewState](self->_geoMapItem, "_muninViewState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (GEOMuninViewState)_muninViewState
{
  return (GEOMuninViewState *)-[GEOMapItem _muninViewState](self->_geoMapItem, "_muninViewState");
}

- (MKMapItemIdentifier)identifier
{
  void *v2;
  void *v3;
  void *v4;
  MKMapItemIdentifier *v5;

  -[MKMapItem _identifier](self, "_identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geoMapItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasMapsIdentifierString"))
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSSet)alternateIdentifiers
{
  NSSet *alternateIdentifiers;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSSet *v10;
  NSSet *v11;
  NSSet *v12;
  NSSet *v13;
  _QWORD v15[4];
  id v16;

  alternateIdentifiers = self->_alternateIdentifiers;
  if (!alternateIdentifiers)
  {
    -[GEOMapItem _alternateIdentifiers](self->_geoMapItem, "_alternateIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0C99E20]);
      -[GEOMapItem _alternateIdentifiers](self->_geoMapItem, "_alternateIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      -[GEOMapItem _alternateIdentifiers](self->_geoMapItem, "_alternateIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __33__MKMapItem_alternateIdentifiers__block_invoke;
      v15[3] = &unk_1E20DBA70;
      v16 = v8;
      v10 = v8;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);

      v11 = (NSSet *)-[NSSet copy](v10, "copy");
      v12 = self->_alternateIdentifiers;
      self->_alternateIdentifiers = v11;

    }
    else
    {
      v13 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
      v10 = self->_alternateIdentifiers;
      self->_alternateIdentifiers = v13;
    }

    alternateIdentifiers = self->_alternateIdentifiers;
  }
  return alternateIdentifiers;
}

void __33__MKMapItem_alternateIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  MKMapItemIdentifier *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "hasMapsIdentifierString"))
  {
    v3 = -[MKMapItemIdentifier initWithGEOMapItemIdentifier:]([MKMapItemIdentifier alloc], "initWithGEOMapItemIdentifier:", v4);
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

- (id)_identifier
{
  MKMapItemIdentifier *v3;
  void *v4;
  MKMapItemIdentifier *v5;
  MKMapItemIdentifier *identifier;

  if (!self->_identifier && -[GEOMapItem _hasMUID](self->_geoMapItem, "_hasMUID"))
  {
    v3 = [MKMapItemIdentifier alloc];
    -[GEOMapItem _identifier](self->_geoMapItem, "_identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MKMapItemIdentifier initWithGEOMapItemIdentifier:](v3, "initWithGEOMapItemIdentifier:", v4);
    identifier = self->_identifier;
    self->_identifier = v5;

  }
  return self->_identifier;
}

- (BOOL)_hasMUID
{
  return -[GEOMapItem _hasMUID](self->_geoMapItem, "_hasMUID");
}

- (unint64_t)_muid
{
  return -[GEOMapItem _muid](self->_geoMapItem, "_muid");
}

- (BOOL)_hasResultProviderID
{
  return -[GEOMapItem _hasResultProviderID](self->_geoMapItem, "_hasResultProviderID");
}

- (int)_resultProviderID
{
  return -[GEOMapItem _resultProviderID](self->_geoMapItem, "_resultProviderID");
}

- (BOOL)_hasUserRatingScore
{
  return -[GEOMapItem _hasUserRatingScore](self->_geoMapItem, "_hasUserRatingScore");
}

- (unsigned)_sampleSizeForUserRatingScore
{
  return -[GEOMapItem _sampleSizeForUserRatingScore](self->_geoMapItem, "_sampleSizeForUserRatingScore");
}

- (NSString)_localizedSampleSizeForUserRatingScoreString
{
  NSString *localizedSampleSizeForUserRatingScoreString;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  localizedSampleSizeForUserRatingScoreString = self->_localizedSampleSizeForUserRatingScoreString;
  if (!localizedSampleSizeForUserRatingScoreString)
  {
    v4 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MKMapItem _sampleSizeForUserRatingScore](self, "_sampleSizeForUserRatingScore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringFromNumber:numberStyle:", v5, 0);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_localizedSampleSizeForUserRatingScoreString;
    self->_localizedSampleSizeForUserRatingScoreString = v6;

    localizedSampleSizeForUserRatingScoreString = self->_localizedSampleSizeForUserRatingScoreString;
  }
  return localizedSampleSizeForUserRatingScoreString;
}

- (BOOL)_hasPriceDescription
{
  void *v2;
  char v3;

  -[GEOMapItem _priceDescription](self->_geoMapItem, "_priceDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPriceDescription");

  return v3;
}

- (NSString)_priceDescription
{
  void *v2;
  void *v3;

  -[GEOMapItem _priceDescription](self->_geoMapItem, "_priceDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "priceDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (float)_normalizedUserRatingScore
{
  float result;

  -[GEOMapItem _normalizedUserRatingScore](self->_geoMapItem, "_normalizedUserRatingScore");
  return result;
}

- (BOOL)_hasPriceRange
{
  return -[GEOMapItem _hasPriceRange](self->_geoMapItem, "_hasPriceRange");
}

- (NSString)_priceRangeString
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  __CFString *v7;
  __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MKCurrencySymbolForLocale(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[GEOMapItem _priceRange](self->_geoMapItem, "_priceRange");
  if (v5)
  {
    v6 = v5;
    v7 = &stru_1E20DFC00;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v7, v4);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v7 = v8;
      --v6;
    }
    while (v6);
  }
  else
  {
    v8 = &stru_1E20DFC00;
  }

  return (NSString *)v8;
}

- (GEOAddress)_geoAddress
{
  return (GEOAddress *)-[GEOMapItem geoAddress](self->_geoMapItem, "geoAddress");
}

- (id)_localizedCategoryNamesForType:(unsigned int)a3
{
  return (id)-[GEOMapItem _localizedCategoryNamesForType:](self->_geoMapItem, "_localizedCategoryNamesForType:", *(_QWORD *)&a3);
}

- (BOOL)_hasLocalizedCategoryNamesForType:(unsigned int)a3
{
  return -[GEOMapItem _hasLocalizedCategoryNamesForType:](self->_geoMapItem, "_hasLocalizedCategoryNamesForType:", *(_QWORD *)&a3);
}

- (NSString)_firstLocalizedCategoryName
{
  NSString *firstLocalizedCategoryName;
  void *v4;
  NSString *v5;
  NSString *v6;

  firstLocalizedCategoryName = self->_firstLocalizedCategoryName;
  if (!firstLocalizedCategoryName)
  {
    -[MKMapItem _localizedCategoryNamesForType:](self, "_localizedCategoryNamesForType:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_firstLocalizedCategoryName;
    self->_firstLocalizedCategoryName = v5;

    firstLocalizedCategoryName = self->_firstLocalizedCategoryName;
  }
  return firstLocalizedCategoryName;
}

- (BOOL)_hasAnyAmenities
{
  return -[GEOMapItem _hasAnyAmenities](self->_geoMapItem, "_hasAnyAmenities");
}

- (NSArray)_amenities
{
  return (NSArray *)-[GEOMapItem _amenities](self->_geoMapItem, "_amenities");
}

- (BOOL)hasAmenityType:(int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[GEOMapItem _amenities](self->_geoMapItem, "_amenities", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "amenityType") == a3)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)valueForAmenityType:(int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[GEOMapItem _amenities](self->_geoMapItem, "_amenities", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "amenityType") == a3)
        {
          v10 = objc_msgSend(v9, "isAmenityPresent");
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_hasAcceptsApplePayAmenity
{
  return -[MKMapItem hasAmenityType:](self, "hasAmenityType:", 21);
}

- (BOOL)_acceptsApplePay
{
  return -[MKMapItem valueForAmenityType:](self, "valueForAmenityType:", 21);
}

- (BOOL)_hasResolvablePartialInformation
{
  uint64_t v3;
  void *v4;
  void *v5;
  GEOMapItem *geoMapItem;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CLLocationCoordinate2D v15;

  -[MKMapItem place](self, "place");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[MKMapItem metadata](self, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      geoMapItem = self->_geoMapItem;

      if (!geoMapItem)
      {
        -[MKMapItem place](self, "place");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstBusiness");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hasUID");

        return v14;
      }
    }
  }
  -[MKMapItem _coordinate](self, "_coordinate");
  if (CLLocationCoordinate2DIsValid(v15))
    return -[GEOMapItem _hasResolvablePartialInformation](self->_geoMapItem, "_hasResolvablePartialInformation");
  -[MKMapItem _geoAddress](self, "_geoAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "structuredAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    -[MKMapItem _geoAddress](self, "_geoAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "formattedAddressLines");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      return -[GEOMapItem _hasResolvablePartialInformation](self->_geoMapItem, "_hasResolvablePartialInformation");
  }
  return 1;
}

- (BOOL)_responseStatusIsIncomplete
{
  return -[GEOMapItem _responseStatusIsIncomplete](self->_geoMapItem, "_responseStatusIsIncomplete");
}

- (BOOL)_hasOperatingHours
{
  return -[GEOMapItem _hasOperatingHours](self->_geoMapItem, "_hasOperatingHours");
}

- (BOOL)_hasLocalizedOperatingHours
{
  return -[GEOMapItem _hasCurrentOperatingHours](self->_geoMapItem, "_hasCurrentOperatingHours");
}

+ (id)_localizedNextOpeningHoursFormatter
{
  void *v2;

  if (qword_1ECE2DBF8 != -1)
    dispatch_once(&qword_1ECE2DBF8, &__block_literal_global_352);
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2DBF0, "setTimeZone:", v2);

  return (id)qword_1ECE2DBF0;
}

uint64_t __48__MKMapItem__localizedNextOpeningHoursFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECE2DBF0;
  qword_1ECE2DBF0 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECE2DBF0, "setDateStyle:", 0);
  return objc_msgSend((id)qword_1ECE2DBF0, "setTimeStyle:", 1);
}

+ (id)_localizedNextOpeningDayOftheWeekFormatter
{
  void *v2;

  if (qword_1ECE2DC08 != -1)
    dispatch_once(&qword_1ECE2DC08, &__block_literal_global_354);
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2DC00, "setTimeZone:", v2);

  return (id)qword_1ECE2DC00;
}

uint64_t __55__MKMapItem__localizedNextOpeningDayOftheWeekFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECE2DC00;
  qword_1ECE2DC00 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECE2DC00, "setDateFormat:", CFSTR("cccc"));
  return objc_msgSend((id)qword_1ECE2DC00, "setFormattingContext:", 1);
}

- (id)hoursBuilderForSearchResultCellForOptions:(unint64_t)a3 conciseStyle:(BOOL)a4
{
  return -[MKMapItem hoursBuilderForSearchResultCellForOptions:conciseStyle:openAt:](self, "hoursBuilderForSearchResultCellForOptions:conciseStyle:openAt:", 128, a4, 0);
}

- (id)searchResultsHoursWithConciseStyle:(BOOL)a3 openAt:(id)a4
{
  return -[MKMapItem hoursBuilderForSearchResultCellForOptions:conciseStyle:openAt:](self, "hoursBuilderForSearchResultCellForOptions:conciseStyle:openAt:", 128, a3, a4);
}

- (id)hoursBuilderForSearchResultCellForOptions:(unint64_t)a3 conciseStyle:(BOOL)a4 openAt:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  NSDictionary *cachedHoursBuilder;
  id v11;
  void *v12;
  _MKLocalizedHoursBuilder *v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *v16;
  _MKLocalizedHoursBuilder *v17;

  v5 = a4;
  v8 = a5;
  v9 = (void *)-[NSDictionary mutableCopy](self->_cachedHoursBuilder, "mutableCopy");
  cachedHoursBuilder = self->_cachedHoursBuilder;
  if (!cachedHoursBuilder)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);

    objc_storeStrong((id *)&self->_cachedHoursBuilder, v11);
    cachedHoursBuilder = self->_cachedHoursBuilder;
    v9 = v11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](cachedHoursBuilder, "objectForKey:", v12);
  v13 = (_MKLocalizedHoursBuilder *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v13 = -[_MKLocalizedHoursBuilder initWithMapItem:localizedHoursStringOptions:conciseStyle:openAt:]([_MKLocalizedHoursBuilder alloc], "initWithMapItem:localizedHoursStringOptions:conciseStyle:openAt:", self, a3, v5, v8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, v14);

    v15 = (NSDictionary *)objc_msgSend(v9, "copy");
    v16 = self->_cachedHoursBuilder;
    self->_cachedHoursBuilder = v15;

  }
  v17 = v13;

  return v17;
}

- (id)_localizedNextOpeningStringShort:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  __CFString *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v70;
  void *v71;
  unint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t j;
  void *v76;
  _BOOL4 v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  _OWORD v83[4];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v77 = a3;
  v100 = *MEMORY[0x1E0C80C00];
  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_messageLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageBusinessHours");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeDailyHours");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_messageLink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeZone");
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "components:fromDate:", 512, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = v13;
  v14 = objc_msgSend(v13, "weekday");
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)v10;
  objc_msgSend(v15, "setTimeZone:", v10);
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v92, v99, 16);
  v81 = (void *)v11;
  v82 = v16;
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v93;
    v70 = *(_QWORD *)v93;
    v72 = v14;
    do
    {
      v20 = 0;
      v74 = v18;
      do
      {
        if (*(_QWORD *)v93 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v20);
        v22 = objc_msgSend(v21, "dayOfWeekRange");
        if (v14 >= v22 && v14 - v22 < v23)
        {
          objc_msgSend(v15, "components:fromDate:", 96, v11);
          v25 = (id)objc_claimAutoreleasedReturnValue();
          v88 = 0u;
          v89 = 0u;
          v90 = 0u;
          v91 = 0u;
          objc_msgSend(v21, "openIntervals");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v89;
            while (2)
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v89 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
                objc_msgSend(v31, "startDate");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "components:fromDate:", 96, v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                v34 = objc_msgSend(v33, "hour");
                if (v34 > objc_msgSend(v25, "hour")
                  || (v35 = objc_msgSend(v33, "hour"), v35 == objc_msgSend(v25, "hour"))
                  && (v36 = objc_msgSend(v33, "minute"), v36 > objc_msgSend(v25, "minute")))
                {
                  +[MKMapItem _localizedNextOpeningHoursFormatter](MKMapItem, "_localizedNextOpeningHoursFormatter");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "startDate");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "stringFromDate:", v53);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v77)
                    v55 = CFSTR("Will open at %@");
                  else
                    v55 = CFSTR("Business is closed and will open at %@");
                  _MKLocalizedStringFromThisBundle(v55);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v56, v54);
                  v49 = (id)objc_claimAutoreleasedReturnValue();

                  v50 = v81;
                  v16 = v82;
                  v37 = v82;
                  v51 = v79;
LABEL_53:

                  goto LABEL_54;
                }

              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
              if (v28)
                continue;
              break;
            }
          }

          v11 = (uint64_t)v81;
          v16 = v82;
          v19 = v70;
          v14 = v72;
          v18 = v74;
        }
        ++v20;
      }
      while (v20 != v18);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v92, v99, 16);
    }
    while (v18);
  }

  objc_msgSend(v15, "components:fromDate:", 528, v11);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = 1; j != 7; ++j)
  {
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v25 = v16;
    v38 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v85;
      while (2)
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v85 != v40)
            objc_enumerationMutation(v25);
          v42 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * k);
          v43 = objc_msgSend(v37, "weekday");
          v44 = ((unint64_t)(j - 1 + v43) * (unsigned __int128)0x2492492492492493uLL) >> 64;
          v45 = j + v43 - 7 * ((v44 + ((unint64_t)(j - 1 + v43 - v44) >> 1)) >> 2);
          v46 = objc_msgSend(v42, "dayOfWeekRange");
          if (v45 >= v46 && v45 - v46 < v47)
          {
            memset(v83, 0, sizeof(v83));
            objc_msgSend(v42, "openIntervals");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v83, v96, 16))
            {
              v57 = (void *)**((_QWORD **)&v83[0] + 1);
              if (j == 1)
              {
                +[MKMapItem _localizedNextOpeningHoursFormatter](MKMapItem, "_localizedNextOpeningHoursFormatter");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "startDate");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "stringFromDate:", v59);
                v60 = (void *)objc_claimAutoreleasedReturnValue();

                if (v77)
                  v61 = CFSTR("Will open at %@");
                else
                  v61 = CFSTR("Business is closed and will open at %@");
                _MKLocalizedStringFromThisBundle(v61);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v62, v60);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                if (v77)
                  v64 = CFSTR("Will open %1$@ at %2$@");
                else
                  v64 = CFSTR("Business is closed and will open %1$@ at %2$@");
                _MKLocalizedStringFromThisBundle(v64);
                v65 = objc_claimAutoreleasedReturnValue();
                v73 = (void *)MEMORY[0x1E0CB3940];
                v76 = (void *)v65;
                +[MKMapItem _localizedNextOpeningDayOftheWeekFormatter](MKMapItem, "_localizedNextOpeningDayOftheWeekFormatter");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "startDate");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "stringFromDate:", v78);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                +[MKMapItem _localizedNextOpeningHoursFormatter](MKMapItem, "_localizedNextOpeningHoursFormatter");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "startDate");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "stringFromDate:", v67);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = v76;
                objc_msgSend(v73, "stringWithFormat:", v76, v71, v68);
                v63 = (void *)objc_claimAutoreleasedReturnValue();

              }
              v50 = v81;
              v16 = v82;
              v51 = v79;

              v49 = v63;
              goto LABEL_53;
            }

          }
        }
        v39 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
        if (v39)
          continue;
        break;
      }
    }

    v16 = v82;
  }
  v49 = 0;
  v50 = v81;
  v51 = v79;
LABEL_54:

  return v49;
}

- (GEOBusinessHours)_messageBusinessHours
{
  void *v2;
  void *v3;

  -[GEOMapItem _messageLink](self->_geoMapItem, "_messageLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageBusinessHours");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOBusinessHours *)v3;
}

- (NSString)_localizedResponseTime
{
  void *v2;
  unsigned int v3;
  void *v4;

  -[GEOMapItem _messageLink](self->_geoMapItem, "_messageLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "responseTime");
  if (v3 > 5)
  {
    v4 = 0;
  }
  else
  {
    _MKLocalizedStringFromThisBundle(off_1E20DBB90[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v4;
}

- (BOOL)_hasEncyclopedicInfo
{
  return -[GEOMapItem _hasEncyclopedicInfo](self->_geoMapItem, "_hasEncyclopedicInfo");
}

- (GEOEncyclopedicInfo)_encyclopedicInfo
{
  return (GEOEncyclopedicInfo *)-[GEOMapItem _encyclopedicInfo](self->_geoMapItem, "_encyclopedicInfo");
}

- (unint64_t)_openingHoursOptions
{
  return -[GEOMapItem _openingHoursOptions](self->_geoMapItem, "_openingHoursOptions");
}

- (NSData)_placeDataAsData
{
  return (NSData *)-[GEOMapItem _placeDataAsData](self->_geoMapItem, "_placeDataAsData");
}

- (NSString)_poiSurveyURLString
{
  return (NSString *)-[GEOMapItem _poiSurveyURLString](self->_geoMapItem, "_poiSurveyURLString");
}

- (NSString)_poiPinpointURLString
{
  return (NSString *)-[GEOMapItem _poiPinpointURLString](self->_geoMapItem, "_poiPinpointURLString");
}

- (BOOL)_hasChargerNumberString
{
  void *v2;
  BOOL v3;

  -[MKMapItem _chargerNumberString](self, "_chargerNumberString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (NSString)_chargerNumberString
{
  __CFString *v3;
  void *v4;
  void *v5;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[MKMapItem pointOfInterestCategory](self, "pointOfInterestCategory");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[MKMapItem _factoidWithSemantic:](self, "_factoidWithSemantic:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 != CFSTR("MKPOICategoryEVCharger") || v4 == 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "value");
    v8 = (void *)v7;
    _MKLocalizedStringFromThisBundle(CFSTR("Number_of_Chargers"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v8);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return (NSString *)v8;
}

- (id)_factoidWithSemantic:(int)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MKMapItem _encyclopedicInfo](self, "_encyclopedicInfo", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "factoids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "semantic") == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (GEOEVChargerAvailability)_realTimeAvailableEVCharger
{
  GEOEVChargerAvailability *chargerAvailability;
  GEOEVChargerAvailability *v3;
  id v5;
  void *v6;
  GEOEVChargerAvailability *v7;
  GEOEVChargerAvailability *v8;
  GEOEVChargerAvailability *v9;

  chargerAvailability = self->_chargerAvailability;
  if (chargerAvailability)
  {
    v3 = chargerAvailability;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0D27078]);
    -[GEOMapItem _placeData](self->_geoMapItem, "_placeData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (GEOEVChargerAvailability *)objc_msgSend(v5, "initWithPlaceData:", v6);

    v8 = self->_chargerAvailability;
    self->_chargerAvailability = v7;
    v9 = v7;

    v3 = self->_chargerAvailability;
  }
  return v3;
}

- (GEOBusinessAssets)_businessAssets
{
  return (GEOBusinessAssets *)-[GEOMapItem businessAssets](self->_geoMapItem, "businessAssets");
}

- (BOOL)_isClaimed
{
  void *v2;
  char v3;

  -[MKMapItem _poiClaim](self, "_poiClaim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isClaimed");

  return v3;
}

- (BOOL)_canBeClaimed
{
  void *v2;
  char v3;

  -[MKMapItem _poiClaim](self, "_poiClaim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isClaimable");

  return v3;
}

- (void)openInMapsWithLaunchOptions:(NSDictionary *)launchOptions fromScene:(UIScene *)scene completionHandler:(void *)completion
{
  void (**v8)(void *, _QWORD);
  void *v9;
  void *v10;
  UIScene *v11;

  v11 = scene;
  v8 = completion;
  +[MKMapItem urlForMapItem:options:](MKMapItem, "urlForMapItem:options:", self, launchOptions);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openURL:fromScene:completionHandler:", v9, v11, v8);

  }
  else if (v8)
  {
    v8[2](v8, 0);
  }

}

+ (void)openMapsWithItems:(NSArray *)mapItems launchOptions:(NSDictionary *)launchOptions fromScene:(UIScene *)scene completionHandler:(void *)completion
{
  void (**v9)(void *, _QWORD);
  void *v10;
  void *v11;
  UIScene *v12;

  v12 = scene;
  v9 = completion;
  +[MKMapItem urlForMapItems:options:](MKMapItem, "urlForMapItems:options:", mapItems, launchOptions);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openURL:fromScene:completionHandler:", v10, v12, v9);

  }
  else if (v9)
  {
    v9[2](v9, 0);
  }

}

- (BOOL)openInMapsWithLaunchOptions:(NSDictionary *)launchOptions
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  +[MKMapItem urlForMapItem:options:](MKMapItem, "urlForMapItem:options:", self, launchOptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[MKUsageCounter sharedCounter](MKUsageCounter, "sharedCounter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countUsageOfTypeIfNeeded:", 57);

    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "openURL:", v3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)openInMapsWithLaunchOptions:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a4;
  +[MKMapItem urlForMapItem:options:](MKMapItem, "urlForMapItem:options:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openURL:completionHandler:", v6, v8);

  }
  else if (v8)
  {
    v8[2](v8, 0);
  }

}

+ (BOOL)openMapsWithItems:(NSArray *)mapItems launchOptions:(NSDictionary *)launchOptions
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  +[MKMapItem urlForMapItems:options:](MKMapItem, "urlForMapItems:options:", mapItems, launchOptions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[MKUsageCounter sharedCounter](MKUsageCounter, "sharedCounter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countUsageOfTypeIfNeeded:", 56);

    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "openURL:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)openMapsWithItems:(id)a3 launchOptions:(id)a4 completionHandler:(id)a5
{
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a5;
  +[MKMapItem urlForMapItems:options:](MKMapItem, "urlForMapItems:options:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openURL:completionHandler:", v7, v9);

  }
  else if (v9)
  {
    v9[2](v9, 0);
  }

}

+ (id)plistCompatibleDictionaryFromStandardOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("MKLaunchOptionsMapCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("MKLaunchOptionsMapSpan"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("MKLaunchOptionsCameraKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKLaunchOptionsTimePointKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKLaunchOptionsAutomobileOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKLaunchOptionsWalkingOptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKLaunchOptionsTransitOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKLaunchOptionsCyclingOptions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || v5 || v6 || v7 || v8 || v9 || v10 || (v12 = v3, v11))
  {
    v45 = v11;
    v12 = (void *)objc_msgSend(v3, "mutableCopy");
    v13 = 0x1E0C99000;
    v43 = v8;
    v44 = v4;
    if (v4)
    {
      objc_msgSend(v4, "MKCoordinateValue");
      v15 = v14;
      v41 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
      v17 = v10;
      v18 = v7;
      v19 = v9;
      v20 = v6;
      v21 = v5;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "dictionaryWithObjectsAndKeys:", v16, CFSTR("MKLaunchOptionsMapCenterLatitude"), v22, CFSTR("MKLaunchOptionsMapCenterLongitude"), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v21;
      v6 = v20;
      v9 = v19;
      v7 = v18;
      v10 = v17;
      v8 = v43;

      v4 = v44;
      objc_msgSend(v12, "setObject:forKey:", v23, CFSTR("MKLaunchOptionsMapCenter"));

      v13 = 0x1E0C99000uLL;
    }
    if (v5)
    {
      objc_msgSend(v5, "MKCoordinateSpanValue");
      v25 = v24;
      v42 = *(void **)(v13 + 3456);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
      v27 = v10;
      v28 = v7;
      v29 = v9;
      v30 = v6;
      v31 = v5;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "dictionaryWithObjectsAndKeys:", v26, CFSTR("MKLaunchOptionsMapSpanLatitude"), v32, CFSTR("MKLaunchOptionsMapSpanLongitude"), 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v31;
      v6 = v30;
      v9 = v29;
      v7 = v28;
      v10 = v27;
      v8 = v43;

      v4 = v44;
      objc_msgSend(v12, "setObject:forKey:", v33, CFSTR("MKLaunchOptionsMapSpan"));

    }
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v34, CFSTR("MKLaunchOptionsSerializedCameraKey"));
      objc_msgSend(v12, "removeObjectForKey:", CFSTR("MKLaunchOptionsCameraKey"));

    }
    if (v7)
    {
      objc_msgSend(v7, "data");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v35, CFSTR("MKLaunchOptionsSerializedTimePointKey"));

      objc_msgSend(v12, "removeObjectForKey:", CFSTR("MKLaunchOptionsTimePointKey"));
    }
    if (v8)
    {
      objc_msgSend(v8, "data");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v36, CFSTR("MKLaunchOptionsSerializedAutomobileOptions"));

      objc_msgSend(v12, "removeObjectForKey:", CFSTR("MKLaunchOptionsAutomobileOptions"));
    }
    if (v10)
    {
      objc_msgSend(v8, "data");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v37, CFSTR("MKLaunchOptionsSerializedTransitOptions"));

      objc_msgSend(v12, "removeObjectForKey:", CFSTR("MKLaunchOptionsTransitOptions"));
    }
    if (v9)
    {
      objc_msgSend(v8, "data");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v38, CFSTR("MKLaunchOptionsSerializedWalkingOptions"));

      objc_msgSend(v12, "removeObjectForKey:", CFSTR("MKLaunchOptionsWalkingOptions"));
    }
    if (v45)
    {
      objc_msgSend(v8, "data");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v39, CFSTR("MKLaunchOptionsSerializedCyclingOptions"));

      objc_msgSend(v12, "removeObjectForKey:", CFSTR("MKLaunchOptionsCyclingOptions"));
    }

    v11 = v45;
  }

  return v12;
}

+ (id)standardOptionsFromPlistCompatibleDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  CLLocationDegrees v17;
  CLLocationDegrees v18;
  CLLocationCoordinate2D v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  id v48;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("MKLaunchOptionsMapCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("MKLaunchOptionsMapSpan"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("MKLaunchOptionsSerializedCameraKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKLaunchOptionsSerializedTimePointKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKLaunchOptionsSerializedAutomobileOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKLaunchOptionsSerializedTransitOptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKLaunchOptionsSerializedWalkingOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKLaunchOptionsSerializedCyclingOptions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || v5 || v6 || v7 || v8 || v9 || v10 || (v12 = v3, v11))
  {
    v48 = v11;
    v12 = (void *)objc_msgSend(v3, "mutableCopy");
    v47 = v10;
    if (v4)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("MKLaunchOptionsMapCenterLatitude"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("MKLaunchOptionsMapCenterLongitude"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v13 && v14)
      {
        objc_msgSend(v13, "doubleValue");
        v17 = v16;
        objc_msgSend(v15, "doubleValue");
        v19 = CLLocationCoordinate2DMake(v17, v18);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithMKCoordinate:", v19.latitude, v19.longitude);
        v45 = v9;
        v20 = v8;
        v21 = v5;
        v22 = v7;
        v23 = v6;
        v24 = v4;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v25, CFSTR("MKLaunchOptionsMapCenter"));

        v4 = v24;
        v6 = v23;
        v7 = v22;
        v5 = v21;
        v8 = v20;
        v9 = v45;
      }
      else
      {
        objc_msgSend(v12, "removeObjectForKey:", CFSTR("MKLaunchOptionsMapCenter"));
      }

      v10 = v47;
    }
    if (v5)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("MKLaunchOptionsMapSpanLatitude"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("MKLaunchOptionsMapSpanLongitude"));
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (v26 && v27)
      {
        objc_msgSend(v26, "doubleValue");
        v30 = v29;
        objc_msgSend(v28, "doubleValue");
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithMKCoordinateSpan:", v30, v31);
        v46 = v9;
        v32 = v8;
        v33 = v5;
        v34 = v7;
        v35 = v6;
        v36 = v4;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v37, CFSTR("MKLaunchOptionsMapSpan"));

        v4 = v36;
        v6 = v35;
        v7 = v34;
        v5 = v33;
        v8 = v32;
        v9 = v46;
      }
      else
      {
        objc_msgSend(v12, "removeObjectForKey:", CFSTR("MKLaunchOptionsMapSpan"));
      }

      v10 = v47;
    }
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v38, CFSTR("MKLaunchOptionsCameraKey"));
      objc_msgSend(v12, "removeObjectForKey:", CFSTR("MKLaunchOptionsSerializedCameraKey"));

      v10 = v47;
    }
    if (v7)
    {
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27670]), "initWithData:", v7);
      if (v39)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v39, CFSTR("MKLaunchOptionsTimePointKey"));
      objc_msgSend(v12, "removeObjectForKey:", CFSTR("MKLaunchOptionsSerializedTimePointKey"));

    }
    if (v8)
    {
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26F18]), "initWithData:", v8);
      if (v40)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v40, CFSTR("MKLaunchOptionsAutomobileOptions"));
      objc_msgSend(v12, "removeObjectForKey:", CFSTR("MKLaunchOptionsSerializedAutomobileOptions"));

    }
    if (v9)
    {
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27600]), "initWithData:", v9);
      if (v41)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v41, CFSTR("MKLaunchOptionsTransitOptions"));
      objc_msgSend(v12, "removeObjectForKey:", CFSTR("MKLaunchOptionsSerializedTransitOptions"));

    }
    if (v10)
    {
      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D276F0]), "initWithData:", v10);
      if (v42)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v42, CFSTR("MKLaunchOptionsWalkingOptions"));
      objc_msgSend(v12, "removeObjectForKey:", CFSTR("MKLaunchOptionsSerializedWalkingOptions"));

    }
    if (v48)
    {
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27010]), "initWithData:", v48);
      if (v43)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v43, CFSTR("MKLaunchOptionsCyclingOptions"));
      objc_msgSend(v12, "removeObjectForKey:", CFSTR("MKLaunchOptionsSerializedCyclingOptions"));

    }
    v11 = v48;
  }

  return v12;
}

+ (MKMapItem)mapItemWithDictionary:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  MKMapItem *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("MKMapItemIsCurrentLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    +[MKMapItem mapItemForCurrentLocation](MKMapItem, "mapItemForCurrentLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("MKMapItemGEOMapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D271E8]), "initWithData:", v7);
      v9 = -[MKMapItem initWithGeoMapItem:isPlaceHolderPlace:]([MKMapItem alloc], "initWithGeoMapItem:isPlaceHolderPlace:", v8, 0);
    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0D27330]);
      objc_msgSend(v3, "objectForKey:", CFSTR("MKMapItemGEOPlace"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v10, "initWithData:", v11);

      v9 = -[MKMapItem initWithPlace:]([MKMapItem alloc], "initWithPlace:", v8);
    }
    v6 = v9;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKMapItemName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKMapItemName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setName:", v13);

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKMapItemPhoneNumber"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKMapItemPhoneNumber"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPhoneNumber:", v15);

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKMapItemURLString"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKMapItemURLString"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLWithString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUrl:", v19);

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKMapItemTimeZoneName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (void *)MEMORY[0x1E0C99E80];
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MKMapItemTimeZoneName"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeZoneWithName:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTimeZone:", v23);

    }
  }

  return (MKMapItem *)v6;
}

- (NSData)_handle
{
  void *v3;
  void *v4;

  if (self->_geoMapItem)
  {
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleForMapItem:", self->_geoMapItem);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSData *)v4;
}

- (id)dictionaryRepresentation
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isCurrentLocation)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("MKMapItemIsCurrentLocation"));
LABEL_17:

    return v3;
  }
  -[GEOMapItemStorageUserValues name](self->_userValues, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[GEOMapItemStorageUserValues name](self->_userValues, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("MKMapItemName"));

  }
  -[GEOMapItemStorageUserValues phoneNumber](self->_userValues, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[GEOMapItemStorageUserValues phoneNumber](self->_userValues, "phoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("MKMapItemPhoneNumber"));

  }
  -[GEOMapItemStorageUserValues url](self->_userValues, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[GEOMapItemStorageUserValues url](self->_userValues, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("MKMapItemURLString"));

  }
  -[GEOMapItemStorageUserValues timeZoneName](self->_userValues, "timeZoneName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[GEOMapItemStorageUserValues timeZoneName](self->_userValues, "timeZoneName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("MKMapItemTimeZoneName"));

  }
  if (self->_geoMapItem)
  {
    -[MKMapItem _geoMapItemStorageForPersistence](self, "_geoMapItemStorageForPersistence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v4, "data");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("MKMapItemGEOMapItem"));

    }
    goto LABEL_16;
  }
  -[MKMapItem place](self, "place");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[MKMapItem place](self, "place");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("MKMapItemGEOPlace"));
LABEL_16:

    goto LABEL_17;
  }
  return v3;
}

- (id)urlRepresentation
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (-[MKMapItem isCurrentLocation](self, "isCurrentLocation"))
  {
    v6 = CFSTR("currentloc");
    v7[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MKMapItem place](self, "place");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urlRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

- (MKMapItem)initWithUrlRepresentation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  MKMapItem *v7;
  void *v8;
  MKMapItem *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("currentloc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = -[MKMapItem initWithGeoMapItem:isPlaceHolderPlace:](self, "initWithGeoMapItem:isPlaceHolderPlace:", 0, 0);
    -[MKMapItem setIsCurrentLocation:](v7, "setIsCurrentLocation:", 1);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27330]), "initWithUrlRepresentation:", v4);
    if (v8)
      v9 = -[MKMapItem initWithPlace:](self, "initWithPlace:", v8);
    else
      v9 = -[MKMapItem init](self, "init");
    v7 = v9;

  }
  return v7;
}

+ (id)_sharedSessionURLForPunchoutURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(MEMORY[0x1E0D27230], "isValidMapsURLForAppendingSharedSessionID:", v4) & 1) == 0)
    {
      v16 = v4;
LABEL_12:

      goto LABEL_13;
    }
    v5 = v3;
    objc_msgSend(MEMORY[0x1E0D27698], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "shareSessionWithMaps"))
    {
      v7 = objc_msgSend(v5, "containsString:", CFSTR("user_session_entity"));

      if ((v7 & 1) != 0)
      {
LABEL_7:
        if ((objc_msgSend(v5, "containsString:", CFSTR("MKURLSourceAppId")) & 1) == 0)
        {
          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@&%@=%@"), v5, CFSTR("MKURLSourceAppId"), v14);
          v15 = objc_claimAutoreleasedReturnValue();

          v5 = (id)v15;
        }
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0D27698], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mapsUserSessionEntity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "sessionEntityString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@&%@"), v5, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v11;
    }

    goto LABEL_7;
  }
  v16 = 0;
LABEL_13:

  return v16;
}

+ (id)_sharedSessionUserInfoForPunchoutUserInfo:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D27698], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shareSessionWithMaps");

  v6 = v3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D27698], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mapsUserSessionEntity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sessionEntityString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "count"))
    {
      v10 = (void *)objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("MKUserActivitySharedSessionKey"));
      v6 = (void *)objc_msgSend(v10, "copy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v9, CFSTR("MKUserActivitySharedSessionKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v3;
    }

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v13 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("MKUserActivitySourceAppId"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v12, CFSTR("MKUserActivitySourceAppId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)_sourceAppIdFromLaunchURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a3, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("MKURLSourceAppId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("&"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("="));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "count") == 2
        && (objc_msgSend(v8, "objectAtIndexedSubscript:", 0),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "length"),
            v9,
            !v10))
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      v6 = v8;
      v5 = v7;
    }
    else
    {
      v11 = 0;
    }

    v4 = v6;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_sourceAppIdFromLaunchUserInfo:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKey:", CFSTR("MKUserActivitySourceAppId"));
}

+ (void)_mapItemFromHandle:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  if (v5)
  {
    v6 = a3;
    +[MKMapService sharedService](MKMapService, "sharedService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__MKMapItem__mapItemFromHandle_completionHandler___block_invoke;
    v10[3] = &unk_1E20DAD00;
    v11 = v5;
    objc_msgSend(v9, "resolveMapItemFromHandle:withTraits:useCache:completionHandler:", v6, v8, 0, v10);

  }
}

void __50__MKMapItem__mapItemFromHandle_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  MKMapItem *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = -[MKMapItem initWithGeoMapItem:isPlaceHolderPlace:]([MKMapItem alloc], "initWithGeoMapItem:isPlaceHolderPlace:", v6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

+ (void)_mapItemsFromHandleURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  id v36;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("x-maps-mapitemhandles"));

    if ((v9 & 1) != 0)
    {
      v36 = 0;
      objc_msgSend(a1, "_deserializeResourceOptionsFromURL:error:", v6, &v36);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v36;
      if (v10)
      {
        objc_msgSend(a1, "_launchOptionsFromResourceOptionsDictionary:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("MKMapItemLaunchHandles"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v13, "mutableCopy");
          v30 = 0;
          v31 = &v30;
          v32 = 0x3032000000;
          v33 = __Block_byref_object_copy__16;
          v34 = __Block_byref_object_dispose__16;
          v35 = 0;
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __54__MKMapItem__mapItemsFromHandleURL_completionHandler___block_invoke;
          v24[3] = &unk_1E20DBB00;
          v16 = v15;
          v25 = v16;
          v28 = v7;
          v17 = v14;
          v26 = v17;
          v27 = v12;
          v29 = &v30;
          v18 = MEMORY[0x18D778DB8](v24);
          v19 = (void *)v31[5];
          v31[5] = v18;

          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31[5] + 16))(v31[5], v20, v21, v22);
          _Block_object_dispose(&v30, 8);

        }
        else
        {
          (*((void (**)(id, _QWORD, void *, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60], v12, 0);
        }

      }
      else
      {
        (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v11);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v23);

    }
  }

}

void __54__MKMapItem__mapItemsFromHandleURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", 0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__MKMapItem__mapItemsFromHandleURL_completionHandler___block_invoke_2;
    v7[3] = &unk_1E20DBAD8;
    v3 = *(id *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 64);
    v9 = v3;
    v10 = v4;
    v8 = *(id *)(a1 + 40);
    +[MKMapItem _mapItemFromHandle:completionHandler:](MKMapItem, "_mapItemFromHandle:completionHandler:", v2, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

void __54__MKMapItem__mapItemsFromHandleURL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  else
  {
    if (v8)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
  }

}

+ (id)_deserializeResourceOptionsFromURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "resourceSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "length") > 1)
  {
    objc_msgSend(v6, "substringFromIndex:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, 0, 0, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "sanitizeDictionary:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v11 = v7;
      }
      else
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 0, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        MKGetMKDefaultLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          if (a4)
            v13 = *a4;
          else
            v13 = 0;
          v15 = 138412290;
          v16 = v13;
          _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_ERROR, "Failed to deserialize property list: %@", (uint8_t *)&v15, 0xCu);
        }

      }
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 0, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 0, 0);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_launchOptionsFromResourceOptionsDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(a3, "objectForKey:", CFSTR("MKMapItemLaunchAdditionsLaunchOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_launchOptionsWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[MKMapItem standardOptionsFromPlistCompatibleDictionary:](MKMapItem, "standardOptionsFromPlistCompatibleDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", CFSTR("MKLaunchOptionsSessionIDLowKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "longLongValue");
      objc_msgSend(v6, "objectForKey:", CFSTR("MKLaunchOptionsSessionIDHighKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "longLongValue");

      v12 = objc_alloc(MEMORY[0x1E0D276A0]);
      objc_msgSend(v6, "objectForKey:", CFSTR("MKLaunchOptionsSessionCreationTimeKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;
      objc_msgSend(v6, "objectForKey:", CFSTR("MKLaunchOptionsSessionSequenceNumberKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v12, "initWithSessionID:sessionCreationTime:sequenceNumber:", v11, v9, objc_msgSend(v16, "unsignedIntValue"), v15);

      objc_msgSend(MEMORY[0x1E0D27698], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setMapsUserSessionEntity:", v17);

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)launchOptionsFromURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("mapitem"));

  if (v6)
  {
    objc_msgSend(a1, "_deserializeResourceOptionsFromURL:error:", v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(a1, "_launchOptionsFromResourceOptionsDictionary:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)valueIsValid:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  if (qword_1ECE2DC18 != -1)
    dispatch_once(&qword_1ECE2DC18, &__block_literal_global_439);
  v7 = (id)objc_msgSend((id)qword_1ECE2DC10, "objectForKeyedSubscript:", v6)
    && (objc_opt_isKindOfClass() & 1) != 0;

  return v7;
}

void __33__MKMapItem_valueIsValid_forKey___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[64];
  _QWORD v6[65];

  v6[64] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MKMapItemLaunchAdditionsMapItems");
  v6[0] = objc_opt_class();
  objc_msgSend(CFSTR("MKMapItemLaunchAdditionsMapItems"), "stringByAppendingString:", CFSTR("Children"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v0;
  v6[1] = objc_opt_class();
  v5[2] = CFSTR("MKMapItemLaunchHandles");
  v6[2] = objc_opt_class();
  objc_msgSend(CFSTR("MKMapItemLaunchHandles"), "stringByAppendingString:", CFSTR("Children"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[3] = v1;
  v6[3] = objc_opt_class();
  v5[4] = CFSTR("MKMapItemLaunchAdditionsLaunchOptions");
  v6[4] = objc_opt_class();
  v5[5] = CFSTR("MKMapItemIsCurrentLocation");
  v6[5] = objc_opt_class();
  v5[6] = CFSTR("MKMapItemGEOPlace");
  v6[6] = objc_opt_class();
  v5[7] = CFSTR("MKMapItemGEOMapItem");
  v6[7] = objc_opt_class();
  v5[8] = CFSTR("MKMapItemName");
  v6[8] = objc_opt_class();
  v5[9] = CFSTR("MKMapItemPhoneNumber");
  v6[9] = objc_opt_class();
  v5[10] = CFSTR("MKMapItemURLString");
  v6[10] = objc_opt_class();
  v5[11] = CFSTR("MKMapItemTimeZoneName");
  v6[11] = objc_opt_class();
  v5[12] = CFSTR("MKLaunchOptionsCurrentLocationPlacecard");
  v6[12] = objc_opt_class();
  v5[13] = CFSTR("MKLaunchOptionsDirectionsMode");
  v6[13] = objc_opt_class();
  v5[14] = CFSTR("MKLaunchOptionsRouteHandle");
  v6[14] = objc_opt_class();
  v5[15] = CFSTR("MKLaunchOptionsMapType");
  v6[15] = objc_opt_class();
  v5[16] = CFSTR("MKLaunchOptionsMapCenter");
  v6[16] = objc_opt_class();
  v5[17] = CFSTR("MKLaunchOptionsMapSpan");
  v6[17] = objc_opt_class();
  v5[18] = CFSTR("MKLaunchOptionsSerializedCameraKey");
  v6[18] = objc_opt_class();
  v5[19] = CFSTR("MKLaunchOptionsShowsTraffic");
  v6[19] = objc_opt_class();
  v5[20] = CFSTR("MKLaunchOptionsMapRadiusInMeters");
  v6[20] = objc_opt_class();
  v5[21] = CFSTR("MKLaunchOptionsSearchTerms");
  v6[21] = objc_opt_class();
  v5[22] = CFSTR("MKLaunchOptionsLaunchIntoNav");
  v6[22] = objc_opt_class();
  v5[23] = CFSTR("MKLaunchOptionsLaunchIntoRoute");
  v6[23] = objc_opt_class();
  v5[24] = CFSTR("MKLaunchOptionsLaunchIntoKeyboard");
  v6[24] = objc_opt_class();
  v5[25] = CFSTR("MKLaunchOptionsLaunchIntoSearchHomeKey");
  v6[25] = objc_opt_class();
  v5[26] = CFSTR("MKLaunchOptionsLaunchIntoRAP");
  v6[26] = objc_opt_class();
  v5[27] = CFSTR("MKLaunchOptionsLaunchIntoPhotoThumbnailGalleryKey");
  v6[27] = objc_opt_class();
  v5[28] = CFSTR("MKLaunchOptionsPhotoThumbnailGalleryAlbumIndex");
  v6[28] = objc_opt_class();
  v5[29] = CFSTR("MKLaunchOptionsLaunchIntoNavOverview");
  v6[29] = objc_opt_class();
  v5[30] = CFSTR("MKLaunchOptionsLaunchIntoNavDetail");
  v6[30] = objc_opt_class();
  v5[31] = CFSTR("MKLaunchOptionsLaunchIntoNavShareETAKey");
  v6[31] = objc_opt_class();
  v5[32] = CFSTR("MKLaunchOptionsLaunchIntoNavTraceKey");
  v6[32] = objc_opt_class();
  v5[33] = CFSTR("MKLaunchOptionsLaunchIntoNavTraceStartNavKey");
  v6[33] = objc_opt_class();
  v5[34] = CFSTR("MKLaunchOptionsLaunchIntoTableBookingKey");
  v6[34] = objc_opt_class();
  v5[35] = CFSTR("MKLaunchOptionsSelectedIndex");
  v6[35] = objc_opt_class();
  v5[36] = CFSTR("_MKLaunchOptionsMapZoomKey");
  v6[36] = objc_opt_class();
  v5[37] = CFSTR("MKLaunchOptionsCameraAltitudeMultiplier");
  v6[37] = objc_opt_class();
  v5[38] = CFSTR("_MKLaunchOptionsPreserveSearchResultsKey");
  v6[38] = objc_opt_class();
  v5[39] = CFSTR("_MKLaunchOptionsSearchAlongRouteKey");
  v6[39] = objc_opt_class();
  v5[40] = CFSTR("_MKLaunchOptionsRoutingAvoidHighwaysKey");
  v6[40] = objc_opt_class();
  v5[41] = CFSTR("_MKLaunchOptionsRoutingAvoidTollsKey");
  v6[41] = objc_opt_class();
  v5[42] = CFSTR("_MKLaunchOptionsRoutingArrivalDateKey");
  v6[42] = objc_opt_class();
  v5[43] = CFSTR("MKLaunchOptionsMapCenterLatitude");
  v6[43] = objc_opt_class();
  v5[44] = CFSTR("MKLaunchOptionsMapCenterLongitude");
  v6[44] = objc_opt_class();
  v5[45] = CFSTR("MKLaunchOptionsMapSpanLatitude");
  v6[45] = objc_opt_class();
  v5[46] = CFSTR("MKLaunchOptionsMapSpanLongitude");
  v6[46] = objc_opt_class();
  v5[47] = CFSTR("MKLaunchOptionsSerializedTimePointKey");
  v6[47] = objc_opt_class();
  v5[48] = CFSTR("MKLaunchOptionsReferralIdentifierKey");
  v6[48] = objc_opt_class();
  v5[49] = CFSTR("MKLaunchOptionsTimePointKey");
  v6[49] = objc_opt_class();
  v5[50] = CFSTR("MKLaunchOptionsConnectedToCarKey");
  v6[50] = objc_opt_class();
  v5[51] = CFSTR("MKLaunchOptionsAnalyticsActionKey");
  v6[51] = objc_opt_class();
  v5[52] = CFSTR("MKLaunchOptionsAnalyticsTargetKey");
  v6[52] = objc_opt_class();
  v5[53] = CFSTR("MKLaunchOptionsAnalyticsValueKey");
  v6[53] = objc_opt_class();
  v5[54] = CFSTR("_MKLaunchOptionsFindMyHandleIdentifiersKey");
  v6[54] = objc_opt_class();
  objc_msgSend(CFSTR("_MKLaunchOptionsFindMyHandleIdentifiersKey"), "stringByAppendingString:", CFSTR("Children"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[55] = v2;
  v6[55] = objc_opt_class();
  v5[56] = CFSTR("MKLaunchOptionsFromTimeToLeaveNotificationKey");
  v6[56] = objc_opt_class();
  v5[57] = CFSTR("MKLaunchOptionsURLKey");
  v6[57] = objc_opt_class();
  v5[58] = CFSTR("MKLaunchOptionsSessionIDLowKey");
  v6[58] = objc_opt_class();
  v5[59] = CFSTR("MKLaunchOptionsSessionIDHighKey");
  v6[59] = objc_opt_class();
  v5[60] = CFSTR("MKLaunchOptionsSessionCreationTimeKey");
  v6[60] = objc_opt_class();
  v5[61] = CFSTR("MKLaunchOptionsSessionSequenceNumberKey");
  v6[61] = objc_opt_class();
  v5[62] = CFSTR("MKUserActivitySharedSessionKey");
  v6[62] = objc_opt_class();
  v5[63] = CFSTR("MKURLSourceAppId");
  v6[63] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 64);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ECE2DC10;
  qword_1ECE2DC10 = v3;

}

+ (id)sanitizeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "valueIsValid:forKey:", v6, v7))
    v8 = v6;
  else
    v8 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "sanitizeArray:forKey:", v8, v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D26488]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(a1, "sanitizeDictionary:", v8);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v11;
    }
  }

  return v8;
}

+ (id)sanitizeArray:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        objc_msgSend(v7, "stringByAppendingString:", CFSTR("Children"), (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "sanitizeObject:forKey:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {

          v16 = 0;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16 = v8;
LABEL_11:

  return v16;
}

+ (id)sanitizeDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "sanitizeObject:forKey:", v11, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          MKGetMKDefaultLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v10;
            _os_log_impl(&dword_18B0B0000, v14, OS_LOG_TYPE_ERROR, "MapItem deserialize: Invalid value class for key %@", buf, 0xCu);
          }

          v13 = 0;
          goto LABEL_13;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v7)
        continue;
      break;
    }
  }

  v13 = v4;
LABEL_13:

  return v13;
}

+ (id)mapItemsFromURL:(id)a3 options:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v26;
  void *v27;
  id *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  objc_msgSend(v6, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("mapitem"));

  if ((v9 & 1) == 0)
  {
    objc_msgSend(a1, "_mapItemBackedByURL:", v7);
    v24 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v24;
    if (v24)
    {
      v34[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  objc_msgSend(a1, "_deserializeResourceOptionsFromURL:error:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v23 = 0;
    goto LABEL_21;
  }
  v26 = a1;
  v27 = v10;
  v28 = a4;
  objc_msgSend(v10, "objectForKey:", CFSTR("MKMapItemLaunchAdditionsMapItems"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    v17 = *MEMORY[0x1E0D26488];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v19, "objectForKeyedSubscript:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27000]), "initWithDictionary:", v19);
        }
        else
        {
          +[MKMapItem mapItemWithDictionary:](MKMapItem, "mapItemWithDictionary:", v19);
          v21 = objc_claimAutoreleasedReturnValue();
        }
        v22 = (void *)v21;
        objc_msgSend(v12, "addObject:", v21);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }

  v23 = v27;
  if (v28)
  {
    objc_msgSend(v26, "_launchOptionsFromResourceOptionsDictionary:", v27);
    *v28 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_22:
  return v12;
}

+ (id)_mapItemBackedByURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D27640];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:", v5);

  if (v6 && objc_msgSend(v6, "isValid"))
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGeoMapItem:isPlaceHolderPlace:", v6, objc_msgSend(v6, "_hasResolvablePartialInformation"));
  else
    v7 = 0;

  return v7;
}

+ (id)urlForMapItem:(id)a3 options:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  if (a3)
    objc_msgSend(v6, "arrayWithObject:", a3);
  else
    objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "urlForMapItems:options:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)urlForMapItems:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "dictionaryRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("MKMapItemLaunchAdditionsMapItems"));
  objc_msgSend(a1, "_launchOptionsWithOptions:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    +[MKMapItem plistCompatibleDictionaryFromStandardOptions:](MKMapItem, "plistCompatibleDictionaryFromStandardOptions:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setObject:forKey:", v18, CFSTR("MKMapItemLaunchAdditionsLaunchOptions"));
  }
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v9, 200, 0, &v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
    NSLog(CFSTR("Failed to serialize property list representation: %@"), v24);
  objc_msgSend(v19, "base64EncodedStringWithOptions:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mapitem://%@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)_urlForMapItemHandles:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("MKMapItemLaunchHandles"));
    objc_msgSend(a1, "_launchOptionsWithOptions:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      +[MKMapItem plistCompatibleDictionaryFromStandardOptions:](MKMapItem, "plistCompatibleDictionaryFromStandardOptions:", v9);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("MKMapItemLaunchAdditionsLaunchOptions"));
    }
    else
    {
      v7 = 0;
    }
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      NSLog(CFSTR("Failed to serialize property list representation: %@"), v15);
    objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-maps-mapitemhandles://%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_urlForLocation:(id)a3 address:(id)a4 label:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v13, "coordinate");
  v15 = v14;
  v17 = v16;
  if (objc_msgSend(v10, "length"))
  {
    v26 = v10;
    v27 = CFSTR("FormattedAddressLines");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27330]), "initWithLatitude:longitude:addressDictionary:", v19, v15, v17);
  v21 = objc_msgSend(v13, "referenceFrame");

  if (v21 == 1)
    v22 = 1;
  else
    v22 = 2 * (v21 == 2);
  objc_msgSend(v20, "setReferenceFrame:", v22);
  v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlace:", v20);
  objc_msgSend(v23, "setName:", v12);

  objc_msgSend(a1, "urlForMapItem:options:", v23, v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)_launchOptionsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v3);
  objc_msgSend(v3, "objectForKey:", CFSTR("MKLaunchOptionsReferralIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("MKLaunchOptionsReferralIdentifierKey"));

  }
LABEL_5:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_MKLaunchOptionsRoutingArrivalDateKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D27670]);
    objc_msgSend(v10, "setType:", 1);
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    objc_msgSend(v10, "setTime:");
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("MKLaunchOptionsTimePointKey"));

  }
  objc_msgSend(MEMORY[0x1E0D27698], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && objc_msgSend(v11, "shareSessionWithMaps"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39__MKMapItem__launchOptionsWithOptions___block_invoke;
    v15[3] = &unk_1E20DBB48;
    v16 = v4;
    objc_msgSend(v12, "shortSessionValues:", v15);

  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __39__MKMapItem__launchOptionsWithOptions___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v10 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("MKLaunchOptionsSessionIDLowKey"));

  v12 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("MKLaunchOptionsSessionIDHighKey"));

  v14 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("MKLaunchOptionsSessionCreationTimeKey"));

  v16 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a6);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("MKLaunchOptionsSessionSequenceNumberKey"));

}

- (BOOL)_isEquivalentURLRepresentationTo:(id)a3
{
  id v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (-[MKMapItem isCurrentLocation](self, "isCurrentLocation") && (objc_msgSend(v4, "isCurrentLocation") & 1) != 0)
  {
    v5 = 1;
  }
  else if ((!-[MKMapItem isCurrentLocation](self, "isCurrentLocation")
          || objc_msgSend(v4, "isCurrentLocation"))
         && (-[MKMapItem isCurrentLocation](self, "isCurrentLocation")
          || (objc_msgSend(v4, "isCurrentLocation") & 1) == 0))
  {
    -[MKMapItem place](self, "place");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "place");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v5 = 0;
    if (v6 && v7)
      v5 = objc_msgSend(v6, "_isEquivalentURLRepresentationTo:", v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_fullAddressWithMultiline:(BOOL)a3
{
  if (a3)
    -[MKMapItem _addressFormattedAsMultilineAddress](self, "_addressFormattedAsMultilineAddress");
  else
    -[MKMapItem _addressFormattedAsSinglelineAddress](self, "_addressFormattedAsSinglelineAddress");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_activityURL
{
  return -[MKMapItem _activityURLWithMuninViewState:](self, "_activityURLWithMuninViewState:", 0);
}

- (id)_activityURLWithMuninViewState:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;

  v4 = a3;
  -[MKMapItem place](self, "place");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinate");
  v7 = v6;
  objc_msgSend(v5, "coordinate");
  v9 = v8;
  if (-[MKMapItem isCurrentLocation](self, "isCurrentLocation"))
  {
    -[MKMapItem name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem _urlExtraStorage](self, "_urlExtraStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKURLBuilder URLForCoordinate:address:label:extraStorage:useWebPlaceCard:](_MKURLBuilder, "URLForCoordinate:address:label:extraStorage:useWebPlaceCard:", 0, v10, v11, 0, v7, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[GEOMapItem contactIsMe](self->_geoMapItem, "contactIsMe")
      && (-[GEOMapItem contactAddressType](self->_geoMapItem, "contactAddressType") == 1
       || -[GEOMapItem contactAddressType](self->_geoMapItem, "contactAddressType") == 2))
    {
      -[MKMapItem _coordinate](self, "_coordinate");
      v7 = v13;
      v9 = v14;
    }
    -[MKMapItem name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem _addressFormattedAsSinglelineAddress](self, "_addressFormattedAsSinglelineAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MKMapItem _muid](self, "_muid");
    v16 = objc_msgSend(v5, "localSearchProviderID");
    if (!v5)
    {
      -[GEOMapItem coordinate](self->_geoMapItem, "coordinate");
      v7 = v17;
      -[GEOMapItem coordinate](self->_geoMapItem, "coordinate");
      v9 = v18;
    }
    -[MKMapItem _urlExtraStorage](self, "_urlExtraStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && (_DWORD)v16)
    {
      +[_MKURLBuilder URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:muninViewState:](_MKURLBuilder, "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:muninViewState:", v10, v15, v16, v11, v19, 0, v7, v9, v4);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_MKURLBuilder URLForCoordinate:address:label:extraStorage:useWebPlaceCard:muninViewState:](_MKURLBuilder, "URLForCoordinate:address:label:extraStorage:useWebPlaceCard:muninViewState:", v11, v10, v19, 0, v4, v7, v9);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v20;

  }
  return v12;
}

- (id)_urlExtraStorage
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (GEOConfigGetBOOL())
  {
    v3 = (void *)objc_opt_new();
    -[GEOMapItemStorageUserValues phoneNumber](self->_userValues, "phoneNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v4 == 0;
    if (v4)
    {
      -[GEOMapItemStorageUserValues phoneNumber](self->_userValues, "phoneNumber");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "copy");
      objc_msgSend(v3, "setPhoneNumber:", v7);

    }
    -[GEOMapItemStorageUserValues url](self->_userValues, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[GEOMapItemStorageUserValues url](self->_userValues, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setUrl:", v9);

      v5 = 0;
    }
    -[MKMapItem _styleAttributes](self, "_styleAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && objc_msgSend(v10, "hasAttributes"))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D275B0]), "initWithGEOFeatureStyleAttributes:", v11);
      objc_msgSend(v3, "setStyleAttributes:", v12);

      v5 = 0;
    }
    -[MKMapItem _displayMapRegion](self, "_displayMapRegion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[MKMapItem _displayMapRegion](self, "_displayMapRegion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v3, "setMapRegion:", v15);

      v16 = v3;
    }
    else if (v5)
    {
      v16 = 0;
    }
    else
    {
      v16 = v3;
    }
    v17 = v16;

  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (BOOL)_canGetDirections
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[MKMapItem _isMapItemTypeBrand](self, "_isMapItemTypeBrand"))
    return 0;
  -[MKMapItem _geoAddress](self, "_geoAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "structuredAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MKMapItem _isMapItemTypeTransit](self, "_isMapItemTypeTransit") || !objc_msgSend(v7, "length"))
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v8, "countryCode:supportsFeature:", v7, 1);

  }
  return v3;
}

- (id)_bestBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return (id)-[GEOMapItem _bestAvatarBrandIconURLForSize:allowSmaller:](self->_geoMapItem, "_bestAvatarBrandIconURLForSize:allowSmaller:", a4, a3.width, a3.height);
}

- (id)_bestNavbarBrandIconURLForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  return (id)-[GEOMapItem _bestNavbarBrandIconURLForSize:allowSmaller:](self->_geoMapItem, "_bestNavbarBrandIconURLForSize:allowSmaller:", a4, a3.width, a3.height);
}

- (id)_addressOrNil:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_addressFormattedAsCity
{
  void *v3;
  void *v4;
  void *v5;

  -[GEOMapItem addressObject](self->_geoMapItem, "addressObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cityDisplayNameWithFallback:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItem _addressOrNil:](self, "_addressOrNil:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_addressFormattedAsStreetOnly
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[GEOMapItem geoAddress](self->_geoMapItem, "geoAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "structuredAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thoroughfare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItem _addressOrNil:](self, "_addressOrNil:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_postalAddressFromMeCardUsingAddressIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23[0] = *MEMORY[0x1E0C967F0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C97298]);
  objc_msgSend(v5, "_ios_meContactWithKeysToFetch:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__460;
  v21 = __Block_byref_object_dispose__461;
  v22 = 0;
  objc_msgSend(v6, "postalAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __60__MKMapItem__postalAddressFromMeCardUsingAddressIdentifier___block_invoke;
  v14 = &unk_1E20DBB70;
  v8 = v3;
  v15 = v8;
  v16 = &v17;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v11);

  objc_msgSend((id)v18[5], "value", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __60__MKMapItem__postalAddressFromMeCardUsingAddressIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)_addressFormattedAsMultilineAddress
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;

  -[GEOMapItem _clientAttributes](self->_geoMapItem, "_clientAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasCorrectedLocationAttributes");

  if (v4)
  {
    -[GEOMapItem _clientAttributes](self->_geoMapItem, "_clientAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "correctedLocationAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_formattedPostalAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (!objc_msgSend(v7, "length"))
  {
    -[MKMapItem _geoMapItem](self, "_geoMapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "contactIsMe");

    if (v9)
    {
      -[GEOMapItem _clientAttributes](self->_geoMapItem, "_clientAttributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addressBookAttributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addressIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "length"))
      {
        -[MKMapItem _postalAddressFromMeCardUsingAddressIdentifier:](self, "_postalAddressFromMeCardUsingAddressIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v13, 0);
        v14 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v14;
      }

    }
  }
  if (objc_msgSend(v7, "length"))
  {
    v15 = v7;
  }
  else
  {
    -[GEOMapItem addressObject](self->_geoMapItem, "addressObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fullAddressWithMultiline:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem _addressOrNil:](self, "_addressOrNil:", v17);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)_addressFormattedAsName
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[GEOMapItem _clientAttributes](self->_geoMapItem, "_clientAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasCorrectedLocationAttributes");

  if (!v4)
    goto LABEL_4;
  -[GEOMapItem _clientAttributes](self->_geoMapItem, "_clientAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "correctedLocationAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_addressFormattedAsName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
  {

LABEL_4:
    -[GEOMapItem addressObject](self->_geoMapItem, "addressObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem _addressOrNil:](self, "_addressOrNil:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_addressFormattedAsShortenedAddress
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[MKMapItem _venueFeatureType](self, "_venueFeatureType") == 4)
  {
    -[GEOMapItem addressObject](self->_geoMapItem, "addressObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "venueShortAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "length"))
      return v4;

  }
  -[GEOMapItem _clientAttributes](self->_geoMapItem, "_clientAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCorrectedLocationAttributes");

  if (!v6)
  {
LABEL_7:
    -[GEOMapItem addressObject](self->_geoMapItem, "addressObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem _addressOrNil:](self, "_addressOrNil:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  -[GEOMapItem _clientAttributes](self->_geoMapItem, "_clientAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "correctedLocationAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_addressFormattedAsShortenedAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {

    goto LABEL_7;
  }
  return v4;
}

- (id)_addressFormattedAsSinglelineAddress
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[GEOMapItem _clientAttributes](self->_geoMapItem, "_clientAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasCorrectedLocationAttributes");

  if (!v4)
    goto LABEL_4;
  -[GEOMapItem _clientAttributes](self->_geoMapItem, "_clientAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "correctedLocationAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_addressFormattedAsSinglelineAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
  {

LABEL_4:
    -[GEOMapItem addressObject](self->_geoMapItem, "addressObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fullAddressWithMultiline:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem _addressOrNil:](self, "_addressOrNil:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_addressFormattedAsWeatherDisplayName
{
  void *v3;
  void *v4;
  void *v5;

  -[GEOMapItem addressObject](self->_geoMapItem, "addressObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "weatherDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItem _addressOrNil:](self, "_addressOrNil:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_addressFormattedAsWeatherLocationName
{
  void *v3;
  void *v4;
  void *v5;

  -[GEOMapItem addressObject](self->_geoMapItem, "addressObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "weatherLocationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItem _addressOrNil:](self, "_addressOrNil:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_addressFormattedAsTitlesForMapRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  void *v7;
  void *v8;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  -[GEOMapItem addressObject](self->_geoMapItem, "addressObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titlesForMapRect:", v6, v5, var0, var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_addressFormattedAsLocation
{
  void *v2;
  void *v3;

  -[GEOMapItem addressObject](self->_geoMapItem, "addressObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_cnPostalAddress
{
  void *v2;
  void *v3;

  -[GEOMapItem addressObject](self->_geoMapItem, "addressObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cnPostalAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)venueLabelWithContext:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;

  -[GEOMapItem addressObject](self->_geoMapItem, "addressObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 - 1 >= 3)
    v6 = 0;
  else
    v6 = a3;
  objc_msgSend(v4, "venueLabel:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)_preferedAppAdamID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MKMapItem _formatterForAdamId](self, "_formatterForAdamId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapItem _associatedApp](self->_geoMapItem, "_associatedApp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredAppAdamId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberFromString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v6;
}

- (NSArray)_alternativeAppAdamIds
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[GEOMapItem _associatedApp](self->_geoMapItem, "_associatedApp", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternateAppAdamIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[MKMapItem _formatterForAdamId](self, "_formatterForAdamId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "numberFromString:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (BOOL)_hasBusinessHours
{
  return -[GEOMapItem _hasBusinessHours](self->_geoMapItem, "_hasBusinessHours");
}

- (NSArray)_businessHours
{
  return (NSArray *)-[GEOMapItem _businessHours](self->_geoMapItem, "_businessHours");
}

- (BOOL)_hasLinkedServices
{
  return -[GEOMapItem _hasLinkedServices](self->_geoMapItem, "_hasLinkedServices");
}

- (NSArray)_linkedServices
{
  return (NSArray *)-[GEOMapItem _linkedServices](self->_geoMapItem, "_linkedServices");
}

- (void)_updateRealTimeEVChargerAvailability:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;

  v4 = (objc_class *)MEMORY[0x1E0D27078];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "_geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_placeData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  obj = (id)objc_msgSend(v6, "initWithPlaceData:", v8);

  v9 = obj;
  if (obj)
  {
    objc_storeStrong((id *)&self->_chargerAvailability, obj);
    v9 = obj;
  }

}

- (BOOL)_hasLookAroundStorefront
{
  void *v2;
  BOOL v3;

  -[GEOMapItem _storefrontPresentationInfo](self->_geoMapItem, "_storefrontPresentationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_needsAttribution
{
  return -[GEOMapItem _needsAttribution](self->_geoMapItem, "_needsAttribution");
}

- (NSURL)_webURL
{
  return (NSURL *)-[GEOMapItem _webURL](self->_geoMapItem, "_webURL");
}

- (NSURL)_providerURL
{
  return (NSURL *)-[GEOMapItem _providerURL](self->_geoMapItem, "_providerURL");
}

- (NSString)_vendorID
{
  return (NSString *)-[GEOMapItem _vendorID](self->_geoMapItem, "_vendorID");
}

- (NSString)_reviewsDisplayName
{
  void *v2;
  void *v3;

  -[MKMapItem _reviewsAttribution](self, "_reviewsAttribution");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_attributionWithDisplayName:(id)a3 attributionFormat:(id)a4 logo:(id)a5 isSnippetLogo:(BOOL)a6
{
  return +[MKPlaceViewStyleProvider attributionStringWithTitle:displayName:logo:isSnippetLogo:](MKPlaceViewStyleProvider, "attributionStringWithTitle:displayName:logo:isSnippetLogo:", a4, a3, a5, a6);
}

- (id)_attributionFor:(id)a3 sourceStringFormat:(id)a4 moreSourceStringFormat:(id)a5 imageTintColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "providerName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributionURLs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
    v16 = v12;
  else
    v16 = v11;
  v17 = v16;

  if (!v17)
  {
    if (v11)
      v18 = v11;
    else
      v18 = v12;
    v17 = v18;
  }
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "screenScale");
  if (v13)
  {
    objc_msgSend(v10, "providerSnippetLogoImageForScale:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v10, "providerLogoImageForScale:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v13 = 0;
      goto LABEL_14;
    }
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "screenScale");
    objc_msgSend(v10, "providerSnippetLogoImageForScale:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v20, "_mapkit_templateImageWithTintColor:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  -[MKMapItem _attributionWithDisplayName:attributionFormat:logo:isSnippetLogo:](self, "_attributionWithDisplayName:attributionFormat:logo:isSnippetLogo:", v14, v17, v21, v13 != 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (GEOFeatureStyleAttributes)_styleAttributes
{
  return (GEOFeatureStyleAttributes *)-[GEOMapItem _styleAttributes](self->_geoMapItem, "_styleAttributes");
}

- (unint64_t)_customIconID
{
  return -[GEOMapItem _customIconID](self->_geoMapItem, "_customIconID");
}

- (BOOL)_hasAreaHighlightId
{
  return -[GEOMapItem _hasAreaHighlightId](self->_geoMapItem, "_hasAreaHighlightId");
}

- (unint64_t)_areaHighlightId
{
  return -[GEOMapItem _areaHighlightId](self->_geoMapItem, "_areaHighlightId");
}

- (BOOL)_isMapItemTypeUnknown
{
  void *v2;
  BOOL v3;

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_placeDisplayType") == 0;

  return v3;
}

- (BOOL)_isMapItemTypeBusiness
{
  void *v2;
  BOOL v3;

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_placeDisplayType") == 1;

  return v3;
}

- (BOOL)_isMapItemTypeSettlement
{
  void *v2;
  BOOL v3;

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_placeDisplayType") == 2;

  return v3;
}

- (BOOL)_isMapItemTypeAddress
{
  void *v2;
  BOOL v3;

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_placeDisplayType") == 3;

  return v3;
}

- (BOOL)_isMapItemTypeBrand
{
  void *v2;
  BOOL v3;

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_placeDisplayType") == 5;

  return v3;
}

- (int)_parsecSectionType
{
  return -[GEOMapItem _parsecSectionType](self->_geoMapItem, "_parsecSectionType");
}

- (BOOL)_isStandAloneBrand
{
  return -[GEOMapItem _isStandaloneBrand](self->_geoMapItem, "_isStandaloneBrand");
}

- (BOOL)_hasBrandMUID
{
  return -[GEOMapItem _hasBrandMUID](self->_geoMapItem, "_hasBrandMUID");
}

- (unint64_t)_brandMUID
{
  return -[GEOMapItem _brandMUID](self->_geoMapItem, "_brandMUID");
}

- (NSString)_messageID
{
  void *v2;
  void *v3;

  -[GEOMapItem _messageLink](self->_geoMapItem, "_messageLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_messageURLString
{
  void *v2;
  void *v3;

  -[GEOMapItem _messageLink](self->_geoMapItem, "_messageLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)_isMessageIDVerified
{
  void *v2;
  char v3;

  -[GEOMapItem _messageLink](self->_geoMapItem, "_messageLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVerified");

  return v3;
}

- (GEOModuleLayoutEntry)_placecardLayout
{
  void *v2;
  void *v3;

  -[GEOMapItem _placecardLayoutData](self->_geoMapItem, "_placecardLayoutData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentModuleLayoutEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOModuleLayoutEntry *)v3;
}

- (UIColor)_navBackgroundbrandColor
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOMapItem _messageLink](self->_geoMapItem, "_messageLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navBackgroundColorString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "_maps_colorFromHexString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (UIColor *)v4;
}

- (UIColor)_navTintBrandColor
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOMapItem _messageLink](self->_geoMapItem, "_messageLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navTintColorString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "_maps_colorFromHexString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (UIColor *)v4;
}

- (NSArray)_quickLinks
{
  return (NSArray *)-[GEOMapItem _quickLinks](self->_geoMapItem, "_quickLinks");
}

- (NSArray)_secondaryQuickLinks
{
  return (NSArray *)-[GEOMapItem _secondaryQuickLinks](self->_geoMapItem, "_secondaryQuickLinks");
}

- (NSArray)_placeCollections
{
  return (NSArray *)-[GEOMapItem _placeCollections](self->_geoMapItem, "_placeCollections");
}

- (NSArray)_searchResultPhotoCarousel
{
  return (NSArray *)-[GEOMapItem _searchResultPhotoCarousel](self->_geoMapItem, "_searchResultPhotoCarousel");
}

- (GEOExploreGuides)_exploreGuides
{
  return (GEOExploreGuides *)-[GEOMapItem _exploreGuides](self->_geoMapItem, "_exploreGuides");
}

- (NSArray)_placeCollectionIds
{
  return (NSArray *)-[GEOMapItem _placeCollectionsIds](self->_geoMapItem, "_placeCollectionsIds");
}

- (NSArray)_relatedPlaceLists
{
  return (NSArray *)-[GEOMapItem _relatedPlaceLists](self->_geoMapItem, "_relatedPlaceLists");
}

- (id)_relatedPlaceListForComponentIdentifier:(int)a3
{
  return (id)-[GEOMapItem _relatedPlaceListForComponentIdentifier:](self->_geoMapItem, "_relatedPlaceListForComponentIdentifier:", *(_QWORD *)&a3);
}

- (id)_firstRelatedPlaceListForType:(int)a3
{
  return (id)-[GEOMapItem _firstRelatedPlaceListForType:](self->_geoMapItem, "_firstRelatedPlaceListForType:", *(_QWORD *)&a3);
}

- (NSArray)_reviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _MKMapItemUserRatingSnippetReview *v12;
  _MKMapItemUserRatingSnippetReview *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[GEOMapItem _reviews](self->_geoMapItem, "_reviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
          v12 = [_MKMapItemUserRatingSnippetReview alloc];
          v13 = -[_MKMapItemUserRatingSnippetReview initWithMapItem:review:](v12, "initWithMapItem:review:", self, v11, (_QWORD)v15);
          objc_msgSend(v5, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSArray)_tips
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _MKMapItemUserRatingSnippetTip *v11;
  _MKMapItemUserRatingSnippetTip *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[GEOMapItem _tips](self->_geoMapItem, "_tips");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          v11 = [_MKMapItemUserRatingSnippetTip alloc];
          v12 = -[_MKMapItemUserRatingSnippetTip initWithMapItem:review:](v11, "initWithMapItem:review:", self, v10, (_QWORD)v14);
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSString)reviewsProviderDisplayName
{
  void *v2;
  void *v3;

  -[MKMapItem _reviewsAttribution](self, "_reviewsAttribution");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "requiresAttributionInCallout"))
  {
    objc_msgSend(v2, "providerName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)_hasPOIClaim
{
  return -[GEOMapItem _hasPOIClaim](self->_geoMapItem, "_hasPOIClaim");
}

- (GEOPOIClaim)_poiClaim
{
  return (GEOPOIClaim *)-[GEOMapItem _poiClaim](self->_geoMapItem, "_poiClaim");
}

- (GEOMapItemDetourInfo)_detourInfo
{
  return (GEOMapItemDetourInfo *)-[GEOMapItem detourInfo](self->_geoMapItem, "detourInfo");
}

- (NSData)_externalTransitStationCode
{
  return (NSData *)-[GEOMapItem externalTransitStationCode](self->_geoMapItem, "externalTransitStationCode");
}

- (BOOL)_hasCorrectedHomeWorkCoordinate
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_clientAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "contactIsMe");

  if (!v6)
    return 0;
  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_clientAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "correctedLocationAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasCorrectedCoordinate");

  return v10;
}

- (BOOL)_hasCorrectedHomeWorkAddress
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_clientAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "contactIsMe");

  if (!v6)
    return 0;
  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_clientAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "correctedLocationAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasCorrectedAddress");

  return v10;
}

- (GEOEnhancedPlacement)_enhancedPlacement
{
  return (GEOEnhancedPlacement *)-[GEOMapItem _enhancedPlacement](self->_geoMapItem, "_enhancedPlacement");
}

- (GEOLabelGeometry)_labelGeometry
{
  return (GEOLabelGeometry *)-[GEOMapItem _labelGeometry](self->_geoMapItem, "_labelGeometry");
}

- (GEOViewportFrame)_viewportFrame
{
  return (GEOViewportFrame *)-[GEOMapItem _viewportFrame](self->_geoMapItem, "_viewportFrame");
}

- (GEOEnrichmentInfo)_enrichmentInfo
{
  return (GEOEnrichmentInfo *)-[GEOMapItem _enrichmentInfo](self->_geoMapItem, "_enrichmentInfo");
}

- (GEOEnrichmentData)_enrichmentData
{
  return (GEOEnrichmentData *)-[GEOMapItem _enrichmentData](self->_geoMapItem, "_enrichmentData");
}

- (NSArray)_externalActionLinks
{
  return (NSArray *)-[GEOMapItem _externalActionLinks](self->_geoMapItem, "_externalActionLinks");
}

- (GEOTrailHead)_trailHead
{
  return (GEOTrailHead *)-[GEOMapItem _trailHead](self->_geoMapItem, "_trailHead");
}

- (BOOL)_hasHikeInfo
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[GEOMapItem _hikeSummary](self->_geoMapItem, "_hikeSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GEOMapItem _hikeAssociatedInfo](self->_geoMapItem, "_hikeAssociatedInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[GEOMapItem _hikeGeometry](self->_geoMapItem, "_hikeGeometry");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOHikeSummary)_hikeSummary
{
  return (GEOHikeSummary *)-[GEOMapItem _hikeSummary](self->_geoMapItem, "_hikeSummary");
}

- (GEOPDHikeAssociatedInfo)_hikeAssociatedInfo
{
  return (GEOPDHikeAssociatedInfo *)-[GEOMapItem _hikeAssociatedInfo](self->_geoMapItem, "_hikeAssociatedInfo");
}

- (GEOPDHikeGeometry)_hikeGeometry
{
  return (GEOPDHikeGeometry *)-[GEOMapItem _hikeGeometry](self->_geoMapItem, "_hikeGeometry");
}

- (GEOFactoid)_hikingTrailDifficultyFactoid
{
  return (GEOFactoid *)-[MKMapItem _factoidWithSemantic:](self, "_factoidWithSemantic:", 2);
}

- (GEOFactoid)_hikingTrailPointToPointFactoid
{
  return (GEOFactoid *)-[MKMapItem _factoidWithSemantic:](self, "_factoidWithSemantic:", 3);
}

- (GEOFactoid)_hikingTrailLengthFactoid
{
  return (GEOFactoid *)-[MKMapItem _factoidWithSemantic:](self, "_factoidWithSemantic:", 4);
}

- (int)_placeCategoryType
{
  return -[GEOMapItem _placeCategoryType](self->_geoMapItem, "_placeCategoryType");
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (void)setIsCurrentLocation:(BOOL)a3
{
  self->_isCurrentLocation = a3;
}

- (BOOL)isPlaceHolder
{
  return self->_isPlaceHolder;
}

- (void)setIsMapItemTypeTransit:(BOOL)a3
{
  self->_isMapItemTypeTransit = a3;
}

- (_MKPlaceReservationInfo)reservationInfo
{
  return self->_reservationInfo;
}

- (void)setReservationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_reservationInfo, a3);
}

- (CLLocationCoordinate2D)_presentCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_presentCoordinate.latitude;
  longitude = self->_presentCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setPresentCoordinate:(CLLocationCoordinate2D)a3
{
  self->_presentCoordinate = a3;
}

- (MKTransitInfoPreload)_preloadedTransitInfo
{
  return self->_preloadedTransitInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadedTransitInfo, 0);
  objc_storeStrong((id *)&self->_reservationInfo, 0);
  objc_storeStrong((id *)&self->_encyclopedicInfoAttribution, 0);
  objc_storeStrong((id *)&self->_photosAttribution, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_cachedHoursBuilder, 0);
  objc_storeStrong((id *)&self->_localizedSampleSizeForUserRatingScoreString, 0);
  objc_storeStrong((id *)&self->_numberFormatterForAdamId, 0);
  objc_storeStrong((id *)&self->_firstLocalizedCategoryName, 0);
  objc_storeStrong((id *)&self->_shortAddress, 0);
  objc_storeStrong((id *)&self->_didResolveAttributionToken, 0);
  objc_storeStrong((id *)&self->_chargerAvailability, 0);
  objc_storeStrong((id *)&self->_customPOICategory, 0);
  objc_storeStrong((id *)&self->_userValues, 0);
  objc_storeStrong((id *)&self->_reviewsAttribution, 0);
  objc_storeStrong((id *)&self->_allPhotoAttributions, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_updatedTransitAttribution, 0);
  objc_storeStrong((id *)&self->_defaultTransitInfo, 0);
  objc_storeStrong((id *)&self->_updatedTransitInfo, 0);
  objc_storeStrong((id *)&self->_transitInfoUpdatedDate, 0);
  objc_storeStrong((id *)&self->_alternateIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_geoMapItem, 0);
}

+ (id)_itemWithGeoMapItem:(id)a3
{
  id v3;
  MKMapItem *v4;

  v3 = a3;
  v4 = -[MKMapItem initWithGeoMapItem:isPlaceHolderPlace:]([MKMapItem alloc], "initWithGeoMapItem:isPlaceHolderPlace:", v3, 0);

  return v4;
}

+ (id)_itemWithContact:(id)a3 geoMapItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a1, "_itemWithGeoMapItem:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v7, "setName:", v8);
    objc_msgSend(v6, "phoneNumbers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "stringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPhoneNumber:", v12);

    }
  }

  return v7;
}

+ (MKMapItem)mapItemWithSerializedPlaceData:(id)a3
{
  return (MKMapItem *)objc_msgSend(a1, "mapItemWithSerializedPlaceData:serializedDetourInfo:currentLocation:", a3, 0, 0);
}

+ (MKMapItem)mapItemWithSerializedPlaceData:(id)a3 serializedDetourInfo:(id)a4 currentLocation:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  MKMapItem *v12;
  MKMapItem *v13;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (v7 && objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D271E8], "mapItemStorageForSerializedPlaceData:serializedDetourInfo:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "conformsToProtocol:", &unk_1EE014C58))
    {
      v11 = v10;
      if (objc_msgSend(v11, "isValid"))
      {
        if (v5)
        {
          v12 = -[MKMapItem initWithGeoMapItemAsCurrentLocation:]([MKMapItem alloc], "initWithGeoMapItemAsCurrentLocation:", v11);
        }
        else
        {
          +[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v11);
          v12 = (MKMapItem *)objc_claimAutoreleasedReturnValue();
        }
        v13 = v12;
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (void)_mapItemsWithSerializedPlaceDataResponse:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[MKMapService sharedService](MKMapService, "sharedService");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_mapItemsForResponseData:handler:", v6, v5);

}

- (NSString)formattedNumberOfReviews
{
  return (NSString *)-[MKMapItem formattedNumberOfReviewsIncludingProvider:formatter:](self, "formattedNumberOfReviewsIncludingProvider:formatter:", 0, 0);
}

- (NSString)formattedNumberOfReviewsIncludingProvider
{
  return (NSString *)-[MKMapItem formattedNumberOfReviewsIncludingProvider:formatter:](self, "formattedNumberOfReviewsIncludingProvider:formatter:", 1, 0);
}

- (id)formattedNumberOfReviewsIncludingProvider:(BOOL)a3 formatter:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v26;

  v4 = a3;
  v6 = a4;
  if (-[MKMapItem _hasUserRatingScore](self, "_hasUserRatingScore"))
  {
    -[MKMapItem reviewsProviderDisplayName](self, "reviewsProviderDisplayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MKMapItem _sampleSizeForUserRatingScore](self, "_sampleSizeForUserRatingScore");
    -[MKMapItem _reviews](self, "_reviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    -[MKMapItem _tips](self, "_tips");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if ((_DWORD)v8 != 1)
    {
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringFromNumber:", v14);
      }
      else
      {
        v18 = (void *)MEMORY[0x1E0CB37F0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringFromNumber:numberStyle:", v14, 0);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 && objc_msgSend(v7, "length"))
      {
        if (v10)
        {
          v19 = CFSTR("MapItemReviewProvider_Plural");
        }
        else
        {
          if (!v12)
            goto LABEL_39;
          v19 = CFSTR("MapItemTipProvider_Plural");
        }
        _MKLocalizedStringFromThisBundle(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0CB3940];
        v26 = v7;
      }
      else
      {
        if (v10)
        {
          v20 = CFSTR("MapItemReview_Plural");
        }
        else
        {
          if (!v12)
            goto LABEL_39;
          v20 = CFSTR("MapItemTip_Plural");
        }
        _MKLocalizedStringFromThisBundle(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0CB3940];
      }
      objc_msgSend(v23, "stringWithFormat:", v21, v15, v26);
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    if (v6)
      objc_msgSend(v6, "stringFromNumber:", &unk_1E2158CB0);
    else
      objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", &unk_1E2158CB0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && objc_msgSend(v7, "length"))
    {
      if (v10)
      {
        v16 = CFSTR("MapItemReviewProvider_Singular");
LABEL_30:
        _MKLocalizedStringFromThisBundle(v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0CB3940];
        v26 = v7;
        goto LABEL_31;
      }
      if (v12)
      {
        v16 = CFSTR("MapItemTipProvider_Singular");
        goto LABEL_30;
      }
LABEL_39:
      v13 = 0;
      goto LABEL_37;
    }
    if (v10)
    {
      v17 = CFSTR("MapItemReview_Singular");
    }
    else
    {
      if (!v12)
        goto LABEL_39;
      v17 = CFSTR("MapItemTip_Singular");
    }
    _MKLocalizedStringFromThisBundle(v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3940];
LABEL_31:
    objc_msgSend(v22, "localizedStringWithFormat:", v21, v15, v26);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_36:
    v13 = (void *)v24;

LABEL_37:
    goto LABEL_38;
  }
  v13 = 0;
LABEL_38:

  return v13;
}

+ (id)_mapItemWithWithLocation:(id)a3 addressDictionary:(id)a4 name:(id)a5 businessURL:(id)a6 phoneNumber:(id)a7 sessionID:(id)a8 muid:(unint64_t)a9 attributionID:(id)a10 sampleSizeForUserRatingScore:(unsigned int)a11 normalizedUserRatingScore:(float)a12
{
  objc_class *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v33;

  v19 = (objc_class *)MEMORY[0x1E0D271A0];
  v20 = a10;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  v27 = [v19 alloc];
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", v26);

  LODWORD(v33) = a11;
  *(float *)&v29 = a12;
  v30 = (void *)objc_msgSend(v27, "initWithWithLocation:addressDictionary:name:businessURL:phoneNumber:sessionID:muid:attributionID:sampleSizeForUserRatingScore:normalizedUserRatingScore:", v28, v25, v24, v23, v22, v21, v29, a9, v20, v33);

  if (v30)
  {
    +[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)_reviewForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[MKMapItem _reviews](self, "_reviews", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "_geoReview");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          if ((v12 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDate)_transitInfoUpdatedDate
{
  return self->_transitInfoUpdatedDate;
}

- (void)_markTransitInfoUpdated
{
  NSDate *v3;
  NSDate *transitInfoUpdatedDate;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  transitInfoUpdatedDate = self->_transitInfoUpdatedDate;
  self->_transitInfoUpdatedDate = v3;

}

- (void)_updateTransitInfoWithMapItem:(id)a3
{
  id v4;
  void *v5;
  GEOMapItemTransitInfo *v6;
  GEOTransitAttribution *v7;
  GEOTransitAttribution *updatedTransitAttribution;
  void *v9;
  void *v10;
  NSDate *v11;
  NSDate *transitInfoUpdatedDate;
  void *v13;
  id v14;

  v4 = a3;
  self->_isTransitInfoUpdated = 1;
  v14 = v4;
  objc_msgSend(v4, "_geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_transitInfo");
  v6 = (GEOMapItemTransitInfo *)objc_claimAutoreleasedReturnValue();
  if (self->_updatedTransitInfo != v6)
  {
    objc_storeStrong((id *)&self->_updatedTransitInfo, v6);
    objc_msgSend(v5, "_transitAttribution");
    v7 = (GEOTransitAttribution *)objc_claimAutoreleasedReturnValue();
    updatedTransitAttribution = self->_updatedTransitAttribution;
    self->_updatedTransitAttribution = v7;

    objc_msgSend(v14, "_transitInfoUpdatedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    transitInfoUpdatedDate = self->_transitInfoUpdatedDate;
    self->_transitInfoUpdatedDate = v11;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("kMapItemTransitInfoDidUpdateNotification"), self);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMapItem)initWithCoder:(id)a3
{
  id v4;
  MKMapItem *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  MKMapItem *v10;
  int v11;
  uint64_t v12;
  NSString *customPOICategory;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCurrentLocation")))
  {
    objc_msgSend((id)objc_opt_class(), "mapItemForCurrentLocation");
    v5 = (MKMapItem *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6
      && objc_msgSend(v6, "length")
      && !((unint64_t)objc_msgSend(v7, "length") >> 20)
      && (objc_msgSend(MEMORY[0x1E0D271E8], "mapItemStorageForSerializedMapItemStorage:", v7),
          (v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = (void *)v8;
      v10 = -[MKMapItem initWithGeoMapItem:isPlaceHolderPlace:](self, "initWithGeoMapItem:isPlaceHolderPlace:", v8, 1);
      v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usePOICategory"));
      v10->_useCustomPOICategory = v11;
      if (v11)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("poiCategory"));
        v12 = objc_claimAutoreleasedReturnValue();
        customPOICategory = v10->_customPOICategory;
        v10->_customPOICategory = (NSString *)v12;

      }
    }
    else
    {

      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = MKErrorDomain;
      v20 = *MEMORY[0x1E0CB2D50];
      _MKLocalizedStringFromThisBundle(CFSTR("Data deserialization failed"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v18);

      v10 = 0;
    }
    self = v10;

    v5 = self;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MKMapItem isCurrentLocation](self, "isCurrentLocation"))
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("isCurrentLocation"));
  }
  else
  {
    -[MKMapItem _geoMapItemStorageForDragAndDrop](self, "_geoMapItemStorageForDragAndDrop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    if (v7 && objc_msgSend(v7, "length"))
    {
      objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("data"));
      if (self->_useCustomPOICategory)
      {
        objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("usePOICategory"));
        objc_msgSend(v4, "encodeObject:forKey:", self->_customPOICategory, CFSTR("poiCategory"));
      }
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = MKErrorDomain;
      v13 = *MEMORY[0x1E0CB2D50];
      _MKLocalizedStringFromThisBundle(CFSTR("Data serialization failed"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 1, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v12);

    }
  }

}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC638], "identifier", CFSTR("com.apple.mapkit.map-item"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v2;
  objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "writableTypeIdentifiersForItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  __CFString *v35;
  __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  int v42;
  __CFString *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  NSString *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mapkit.map-item")))
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC638], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isEqualToString:", v10);

    if (v11)
    {
      -[MKMapItem _placeCardContact](self, "_placeCardContact");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMapItem _activityURL](self, "_activityURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "absoluteString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14 && objc_msgSend(v14, "length"))
      {
        v16 = (void *)objc_msgSend(v12, "mutableCopy");
        objc_msgSend(v16, "urlAddresses");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0C97338];
        _MKLocalizedStringFromThisBundle(CFSTR("map url"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "labeledValueWithLabel:value:", v19, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "arrayByAddingObject:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "setUrlAddresses:", v21);
        v22 = objc_msgSend(v16, "copy");

        v12 = (void *)v22;
      }
      v23 = (void *)MEMORY[0x1E0C972A8];
      v54[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      objc_msgSend(v23, "dataWithContacts:error:", v24, &v51);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v6, "isEqualToString:", v26);

      if (v27)
      {
        -[MKMapItem _activityURL](self, "_activityURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKMapItem name](self, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_setTitle:", v28);

        v29 = (id)objc_msgSend(v12, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v6, v7);
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB3498], "writableTypeIdentifiersForItemProvider");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "containsObject:", v6);

      if (v32)
      {
        -[MKMapItem name](self, "name");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v33;
        v35 = &stru_1E20DFC00;
        if (v33)
          v35 = (__CFString *)v33;
        v36 = v35;

        -[MKMapItem _activityURL](self, "_activityURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v36);
        v37 = *MEMORY[0x1E0CEA0C0];
        v38 = -[__CFString length](v36, "length");

        objc_msgSend(v9, "addAttribute:value:range:", v37, v8, 0, v38);
        v39 = (void *)objc_msgSend(v9, "copy");
        v40 = (id)objc_msgSend(v39, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v6, v7);

        goto LABEL_3;
      }
      objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v6, "isEqualToString:", v41);

      if (!v42)
      {
        v47 = (void *)MEMORY[0x1E0CB35C8];
        v48 = MKErrorDomain;
        v52 = *MEMORY[0x1E0CB2D50];
        _MKLocalizedStringFromThisBundle(CFSTR("Unsupported type identifier"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v49;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "errorWithDomain:code:userInfo:", v48, 1, v50);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v7[2](v7, 0, v8);
        goto LABEL_4;
      }
      -[MKMapItem name](self, "name");
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (!v43)
        v43 = &stru_1E20DFC00;
      -[__CFString _navigation_sanitizedStringForDisplayInHTML](v43, "_navigation_sanitizedStringForDisplayInHTML");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[MKMapItem _activityURL](self, "_activityURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "absoluteString");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringWithFormat:", CFSTR("<a href=\"%@\">%@</a>"), v46, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "dataUsingEncoding:", 4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    ((void (**)(id, void *, void *))v7)[2](v7, v25, 0);

LABEL_13:
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  ((void (**)(id, void *, void *))v7)[2](v7, v9, 0);
LABEL_3:

LABEL_4:
LABEL_14:

  return 0;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC638], "identifier", CFSTR("com.apple.mapkit.map-item"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  NSString *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mapkit.map-item")))
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC638], "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "isEqualToString:", v15);

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C972A8], "contactsWithData:error:", v7, a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = v17;
        objc_msgSend(v17, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = v19;
          objc_msgSend(v19, "urlAddresses");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          objc_msgSend(v21, "reverseObjectEnumerator");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          if (v23)
          {
            v24 = v23;
            v42 = v21;
            v43 = v20;
            v44 = v18;
            v45 = v8;
            v25 = *(_QWORD *)v47;
            while (2)
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v47 != v25)
                  objc_enumerationMutation(v22);
                v27 = (void *)MEMORY[0x1E0C99E98];
                objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "value");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "URLWithString:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                if (v29)
                {
                  objc_msgSend((id)objc_opt_class(), "_mapItemBackedByURL:", v29);
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (v30)
                  {
                    v9 = v30;

                    goto LABEL_27;
                  }
                }

              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
              if (v24)
                continue;
              break;
            }
            v9 = 0;
LABEL_27:
            v8 = v45;
            v20 = v43;
            v18 = v44;
            v21 = v42;
          }
          else
          {
            v9 = 0;
          }

          goto LABEL_31;
        }

      }
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v8, "isEqualToString:", v31);

      if (v32)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "objectWithItemProviderData:typeIdentifier:error:", v7, v8, a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend((id)objc_opt_class(), "_mapItemBackedByURL:", v18);
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
LABEL_31:

        goto LABEL_32;
      }
      if (a5)
      {
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v34 = MKErrorDomain;
        v53 = *MEMORY[0x1E0CB2D50];
        _MKLocalizedStringFromThisBundle(CFSTR("Unsupported type identifier"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 1, v36);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v9 = 0;
        goto LABEL_32;
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v50 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v50);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (uint64_t)v50;
  if (!(v9 | v10))
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = MKErrorDomain;
    v56 = *MEMORY[0x1E0CB2D50];
    _MKLocalizedStringFromThisBundle(CFSTR("Data deserialization failed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 1, v14);
    v10 = objc_claimAutoreleasedReturnValue();

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v10);

LABEL_32:
  if (a5 && !v9)
  {
    if (!*a5)
    {
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v38 = MKErrorDomain;
      v51 = *MEMORY[0x1E0CB2D50];
      _MKLocalizedStringFromThisBundle(CFSTR("Unrecognized data"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, 1, v40);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_36;
  }
LABEL_37:

  return (id)v9;
}

- (void)_getFirstAvailableAppClipLinkWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MKMapItem _quickLinks](self, "_quickLinks");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapItem _getFirstAvailableAppClipLinkFromQuickLinks:completion:](self, "_getFirstAvailableAppClipLinkFromQuickLinks:completion:", v5, v4);

}

- (void)_getFirstAvailableSecondaryAppClipLinkWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MKMapItem _secondaryQuickLinks](self, "_secondaryQuickLinks");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapItem _getFirstAvailableAppClipLinkFromQuickLinks:completion:](self, "_getFirstAvailableAppClipLinkFromQuickLinks:completion:", v5, v4);

}

- (void)_getFirstAvailableAppClipLinkFromQuickLinks:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  NSObject *v29;
  id v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v22 = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.MapKit.MKMapItem+GEOQuickLinkHelper.%p.queue"), v5);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v9, v10);

    v12 = dispatch_group_create();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = v5;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v18);
          if (v19 && objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v18), "type") == 2)
          {
            dispatch_group_enter(v12);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke;
            block[3] = &unk_1E20D9B98;
            block[4] = v19;
            v20 = v11;
            v29 = v20;
            v30 = v13;
            v31 = v12;
            dispatch_async(v20, block);

          }
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v16);
    }

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_4;
    v24[3] = &unk_1E20D9040;
    v25 = v14;
    v26 = v13;
    v7 = v22;
    v27 = v22;
    v21 = v13;
    dispatch_group_notify(v12, v11, v24);

    v5 = v23;
  }

}

void __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  +[MKClipServices sharedInstance](MKClipServices, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_2;
  v6[3] = &unk_1E20DBC18;
  v3 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "appClipWithQuickLink:completion:", v3, v6);

}

void __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_3;
  v9[3] = &unk_1E20D9B98;
  v10 = v3;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v3;
  dispatch_async(v4, v9);

}

void __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "URLString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_4(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(v6, "URLString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_5;
  v12[3] = &unk_1E20D7F70;
  v10 = *(id *)(a1 + 48);
  v13 = v3;
  v14 = v10;
  v11 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

uint64_t __88__MKMapItem_GEOQuickLinkHelper___getFirstAvailableAppClipLinkFromQuickLinks_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_getHasAvailableAppClipWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__MKMapItem_GEOQuickLinkHelper___getHasAvailableAppClipWithCompletion___block_invoke;
  v6[3] = &unk_1E20DBC40;
  v7 = v4;
  v5 = v4;
  -[MKMapItem _getFirstAvailableAppClipLinkWithCompletion:](self, "_getFirstAvailableAppClipLinkWithCompletion:", v6);

}

uint64_t __71__MKMapItem_GEOQuickLinkHelper___getHasAvailableAppClipWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (void)_getHasAvailableSecondaryAppClipWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__MKMapItem_GEOQuickLinkHelper___getHasAvailableSecondaryAppClipWithCompletion___block_invoke;
  v6[3] = &unk_1E20DBC40;
  v7 = v4;
  v5 = v4;
  -[MKMapItem _getFirstAvailableSecondaryAppClipLinkWithCompletion:](self, "_getFirstAvailableSecondaryAppClipLinkWithCompletion:", v6);

}

uint64_t __80__MKMapItem_GEOQuickLinkHelper___getHasAvailableSecondaryAppClipWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (BOOL)_mapkit_supportsFullScreenExperience
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MKMapItem _mapkit_resolvedFlatPhotoList](self, "_mapkit_resolvedFlatPhotoList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "displayFullScreenPhotoGallery", (_QWORD)v11))
          {
            v9 = 0;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
    v9 = 1;
LABEL_12:

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)_mapkit_hasFlatListOfPhotos
{
  void *v2;
  BOOL v3;

  -[MKMapItem _mapkit_resolvedFlatPhotoList](self, "_mapkit_resolvedFlatPhotoList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_mapkit_hasSinglePhotoVendor
{
  void *v2;
  BOOL v3;

  -[MKMapItem _allPhotoAttributions](self, "_allPhotoAttributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 1;

  return v3;
}

- (BOOL)_mapkit_hasMultiplePhotoVendors
{
  void *v2;
  BOOL v3;

  -[MKMapItem _allPhotoAttributions](self, "_allPhotoAttributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (id)_mapkit_preferredFirstPhotoVendor
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  -[MKMapItem _allPhotoAttributions](self, "_allPhotoAttributions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 <= 1)
  {
    -[MKMapItem _allPhotoAttributions](self, "_allPhotoAttributions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_mapkit_resolvedFlatPhotoList
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_captionedPhotoAlbums");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 > 1)
    goto LABEL_9;
  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "_hasCaptionedPhotoAlbum") & 1) == 0)
  {

LABEL_6:
    -[MKMapItem _geoMapItem](self, "_geoMapItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_photos");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {
      -[MKMapItem _geoMapItem](self, "_geoMapItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_photos");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "copy");
      goto LABEL_8;
    }
LABEL_9:
    v14 = 0;
    return v14;
  }
  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_captionedPhotoAlbums");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 != 1)
    goto LABEL_6;
  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_captionedPhotoAlbums");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

LABEL_8:
  return v14;
}

- (unint64_t)_mapkit_numberOfPhotosAvailableForFlatList
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_captionedPhotoAlbums");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 > 1)
    return 0;
  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "_hasCaptionedPhotoAlbum") & 1) == 0)
  {

LABEL_6:
    -[MKMapItem _geoMapItem](self, "_geoMapItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_photos");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      -[MKMapItem _geoMapItem](self, "_geoMapItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "_totalPhotoCount");
      goto LABEL_8;
    }
    return 0;
  }
  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_captionedPhotoAlbums");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 != 1)
    goto LABEL_6;
  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_captionedPhotoAlbums");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "totalNumberOfPhotosAvailable");

LABEL_8:
  return v13;
}

- (BOOL)_mapkit_canAtLeastOneAttributionShowPhotosLocally
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[MKMapItem _allPhotoAttributions](self, "_allPhotoAttributions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "shouldHandlePhotosLocally") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_mapkit_canAtLeastOneAttributionShowAddPhotosLocally
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[MKMapItem _allPhotoAttributions](self, "_allPhotoAttributions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "shouldAddPhotosLocally") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_hasRestaurantExtensionInfo
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_featureLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasFeatures"))
  {
    -[MKMapItem _restaurantLink_firstProviderIdentifier](self, "_restaurantLink_firstProviderIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_restaurantLink_hasFeatureType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_featureLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  return v8;
}

- (unint64_t)_restaurantExtensionModeForFirstProvider
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_featureLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItem _restaurantLink_firstVendorID](self, "_restaurantLink_firstVendorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "extensionModeForVendorID:", v5);

  return v6;
}

- (id)_restaurantLink_firstProviderIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("RestaurantReservationAppBundleIDs")))
  {
    -[MKMapItem _restaurantLink_overridenBundleIDsForVendorIDs](self, "_restaurantLink_overridenBundleIDsForVendorIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem _restaurantLink_firstVendorID](self, "_restaurantLink_firstVendorID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MKMapItem _geoMapItem](self, "_geoMapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_featureLink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem _restaurantLink_firstVendorID](self, "_restaurantLink_firstVendorID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationsForVendorID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "appBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_restaurantLink_firstVendorID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MKMapItem _geoMapItem](self, "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_featureLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_restaurantLink_firstProviderPlaceIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MKMapItem _restaurantLink_firstVendorID](self, "_restaurantLink_firstVendorID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MKMapItem _geoMapItem](self, "_geoMapItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_featureLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "featureProviders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_restaurantLink_firstProviderDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MKMapItem _restaurantLink_firstVendorID](self, "_restaurantLink_firstVendorID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MKMapItem _geoMapItem](self, "_geoMapItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_featureLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayNameForVendorID:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_restaurantLink_overridenBundleIDsForVendorIDs
{
  return &unk_1E2159CE0;
}

- (MKMapItem)initWithContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  MKMapItem *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "postalAddresses", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
LABEL_3:
    v10 = 0;
    v11 = v8;
    while (1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "count"))
        break;
      ++v10;
      v11 = v8;
      if (v7 == v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  v13 = -[MKMapItem initWithAddressDictionary:](self, "initWithAddressDictionary:", v8);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem setName:](v13, "setName:", v14);

  }
  return v13;
}

- (BOOL)_isEmptyContactMapItem
{
  double v2;
  double v3;
  BOOL v4;

  -[MKMapItem _coordinate](self, "_coordinate");
  v4 = v3 < -180.0;
  if (v3 > 180.0)
    v4 = 1;
  if (v2 < -90.0)
    v4 = 1;
  return v2 > 90.0 || v4;
}

- (id)_placeCardContact
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C97360]);
  if (-[MKMapItem _isMapItemTypeBusiness](self, "_isMapItemTypeBusiness"))
  {
    objc_msgSend(v3, "setContactType:", 1);
    -[MKMapItem place](self, "place");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOrganizationName:", v5);

    v6 = (id *)MEMORY[0x1E0C97070];
  }
  else
  {
    objc_msgSend(v3, "setContactType:", 0);
    if (-[MKMapItem _isMapItemTypeAddress](self, "_isMapItemTypeAddress"))
    {
      v6 = (id *)MEMORY[0x1E0C96FF8];
      goto LABEL_7;
    }
    -[MKMapItem name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setGivenName:", v4);
    v6 = (id *)MEMORY[0x1E0C96FF8];
  }

LABEL_7:
  v7 = *v6;
  -[MKMapItem _cnPostalAddress](self, "_cnPostalAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MKMapItem _cnPostalAddress](self, "_cnPostalAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v7, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      v25[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setPostalAddresses:", v12);

    }
  }
  -[MKMapItem phoneNumber](self, "phoneNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPhoneNumbers:", v16);

  }
  -[MKMapItem url](self, "url");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", *MEMORY[0x1E0C97068], v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUrlAddresses:", v20);

  }
  -[MKMapItem _mapsDataString](self, "_mapsDataString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "length"))
    objc_msgSend(v3, "setMapsData:", v21);

  return v3;
}

+ (id)contactsAddressDictionaryFromGeoAddressDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[MKMapItem contactsAddressKeysForGeoAddressKeys](MKMapItem, "contactsAddressKeysForGeoAddressKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          v14 = (void *)v12;
        else
          v14 = v11;
        v15 = v14;

        objc_msgSend(v3, "objectForKeyedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)contactsAddressKeysForGeoAddressKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C970C8];
  v8[0] = CFSTR("Street");
  v8[1] = CFSTR("City");
  v3 = *MEMORY[0x1E0C97098];
  v9[0] = v2;
  v9[1] = v3;
  v4 = *MEMORY[0x1E0C970C0];
  v8[2] = CFSTR("State");
  v8[3] = CFSTR("ZIP");
  v5 = *MEMORY[0x1E0C970B0];
  v9[2] = v4;
  v9[3] = v5;
  v8[4] = CFSTR("Country");
  v8[5] = CFSTR("CountryCode");
  v6 = *MEMORY[0x1E0C970A8];
  v9[4] = *MEMORY[0x1E0C970A0];
  v9[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_initWithLabelMarker:(id)a3
{
  id v4;
  void *v5;
  MKMapItem *v6;
  double v7;
  double v8;
  MKMapItem *v9;

  v4 = a3;
  +[_MKLabelMarkerItem labelMarkerItemWithLabelMarker:](_MKLabelMarkerItem, "labelMarkerItemWithLabelMarker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MKMapItem initWithGeoMapItem:isPlaceHolderPlace:](self, "initWithGeoMapItem:isPlaceHolderPlace:", v5, 0);

  if (v6)
  {
    if (objc_msgSend(v4, "featureType") == 5)
      -[MKMapItem setIsMapItemTypeTransit:](v6, "setIsMapItemTypeTransit:", 1);
    objc_msgSend(v4, "coordinate");
    v8 = v7;
    objc_msgSend(v4, "coordinate");
    -[MKMapItem setPresentCoordinate:](v6, "setPresentCoordinate:", v8);
    v9 = v6;
  }

  return v6;
}

+ (void)_fillOutRequest:(id)a3 withMapsDataString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(a4, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("MKMapItemPlaceCardVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    if (v9 == 1)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("MKMapItemPlaceCardID"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", objc_msgSend(v11, "unsignedLongLongValue"));

          v11 = (void *)v12;
        }
        v16[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_setMuids:", v13);

        objc_msgSend(v7, "objectForKey:", CFSTR("MKMapItemPlaceCardResultProvider"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
          objc_msgSend(v5, "_setResultProviderID:", objc_msgSend(v14, "intValue"));

      }
    }

  }
}

+ (id)ticketForMapsDataString:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  MKMapItemIdentifier *v15;
  void *v16;

  v5 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("MKMapItemPlaceCardVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  v10 = 0;
  if (v9 == 1)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("MKMapItemPlaceCardID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("MKMapItemPlaceCardResultProvider"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
        v14 = objc_msgSend(v12, "intValue");
      else
        v14 = 0;
      v15 = -[MKMapItemIdentifier initWithMUID:]([MKMapItemIdentifier alloc], "initWithMUID:", objc_msgSend(v11, "unsignedLongLongValue"));
      +[MKMapService sharedService](MKMapService, "sharedService");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ticketForURLQuery:identifier:resultProviderId:contentProvider:maxResults:traits:", v5, v15, v14, 0, 1, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (id)_mapsDataString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[MKMapItem _hasMUID](self, "_hasMUID"))
  {
    v3 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MKMapItem _muid](self, "_muid"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", &unk_1E2159490, CFSTR("MKMapItemPlaceCardVersion"), v4, CFSTR("MKMapItemPlaceCardID"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKMapItem _geoMapItem](self, "_geoMapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "_hasResultProviderID"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "_resultProviderID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("MKMapItemPlaceCardResultProvider"));

    }
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_htmlRepresentation
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[6];
  _QWORD v8[3];
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__24;
  v14 = __Block_byref_object_dispose__24;
  v15 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__MKMapItem_MKMapItemExtras___htmlRepresentation__block_invoke;
  v7[3] = &unk_1E20DF340;
  v7[4] = &v10;
  v7[5] = v8;
  v4 = -[MKMapItem loadDataWithTypeIdentifier:forItemProviderCompletionHandler:](self, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v3, v7);

  v5 = (id)v11[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __49__MKMapItem_MKMapItemExtras___htmlRepresentation__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 4);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (id)_vCardRepresentation
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[6];
  _QWORD v8[3];
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__24;
  v14 = __Block_byref_object_dispose__24;
  v15 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  objc_msgSend((id)*MEMORY[0x1E0CEC638], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__MKMapItem_MKMapItemVCardHelpers___vCardRepresentation__block_invoke;
  v7[3] = &unk_1E20DF340;
  v7[4] = &v10;
  v7[5] = v8;
  v4 = -[MKMapItem loadDataWithTypeIdentifier:forItemProviderCompletionHandler:](self, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v3, v7);

  v5 = (id)v11[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __56__MKMapItem_MKMapItemVCardHelpers___vCardRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

- (id)_vCardFilename
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[MKMapItem name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.loc.vcf"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_mapItemFromVCardRepresentation:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)*MEMORY[0x1E0CEC638];
  v6 = a3;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKMapItem objectWithItemProviderData:typeIdentifier:error:](MKMapItem, "objectWithItemProviderData:typeIdentifier:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
