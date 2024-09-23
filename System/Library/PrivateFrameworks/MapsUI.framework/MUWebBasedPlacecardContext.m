@implementation MUWebBasedPlacecardContext

- (MUWebBasedPlacecardContext)initWithMapItemString:(id)a3 formattedAddressLines:(id)a4 locationAddress:(id)a5 traitCollection:(id)a6 guides:(id)a7 placeInShortcuts:(BOOL)a8 numberOfReportsInReview:(unint64_t)a9 userIcon:(id)a10 options:(id)a11 contact:(id)a12 userCanEdit:(BOOL)a13 canShowOpenFindMyAction:(BOOL)a14 canShowRequestLocation:(BOOL)a15 showMoreButton:(BOOL)a16 canShowDownloadOffline:(BOOL)a17
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  MUWebBasedPlacecardContext *v29;
  MUWebBasedPlacecardContext *v30;
  id obj;
  id v33;
  id v34;
  id v36;
  id v37;
  objc_super v38;

  v36 = a3;
  v23 = a4;
  obj = a5;
  v24 = a5;
  v33 = a6;
  v25 = a6;
  v34 = a7;
  v37 = a7;
  v26 = a10;
  v27 = a11;
  v28 = a12;
  v38.receiver = self;
  v38.super_class = (Class)MUWebBasedPlacecardContext;
  v29 = -[MUWebBasedPlacecardContext init](&v38, sel_init);
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_mapItemString, a3);
    objc_storeStrong((id *)&v30->_formattedAddressLines, a4);
    objc_storeStrong((id *)&v30->_locationAddress, obj);
    objc_storeStrong((id *)&v30->_traitCollection, v33);
    objc_storeStrong((id *)&v30->_guides, v34);
    v30->_placeInShortcuts = a8;
    v30->_numberOfReportsInReview = a9;
    objc_storeStrong((id *)&v30->_userIcon, a10);
    objc_storeStrong((id *)&v30->_options, a11);
    objc_storeStrong((id *)&v30->_contact, a12);
    v30->_userCanEdit = a13;
    v30->_canShowOpenFindMyAction = a14;
    v30->_canShowRequestLocation = a15;
    v30->_showMoreButton = a16;
    v30->_canShowDownloadOffline = a17;
  }

  return v30;
}

- (NSDictionary)context
{
  id v3;
  void *v4;
  NSString *locale;
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
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  locale = self->_locale;
  if (locale)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", locale, CFSTR("locale"));
  -[MUWebBasedPlacecardContext _userLocation](self, "_userLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("userLocation"));

  -[MUWebBasedPlacecardContext _userData](self, "_userData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("userData"));

  -[MUWebBasedPlacecardContext _userInterfaceIdiom](self, "_userInterfaceIdiom");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("uiIdiom"));

  -[MUWebBasedPlacecardContext _osVersion](self, "_osVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("osVersion"));

  -[MUWebBasedPlacecardContext _environment](self, "_environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("environment"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_mapItemString, CFSTR("place"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_formattedAddressLines, CFSTR("formattedAddressLines"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_locationAddress, CFSTR("locationAddress"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_options, CFSTR("placeItemOption"));
  -[MUWebBasedPlacecardContext _formattedPhoneNumber](self, "_formattedPhoneNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("formattedPhoneNumber"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userCanEdit);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("userCanEdit"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canShowOpenFindMyAction);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("canShowOpenFindMyAction"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canShowRequestLocation);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("canShowRequestLocation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_showMoreButton);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("showMoreButton"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canShowDownloadOffline);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("canShowDownloadOffline"));

  v17 = (void *)objc_msgSend(v4, "copy");
  return (NSDictionary *)v17;
}

- (id)_userLocation
{
  id v2;
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

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CC1810], "sharedLocationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latLng");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lat");
  objc_msgSend(v3, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("latitude"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CC1810], "sharedLocationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "latLng");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lng");
  objc_msgSend(v8, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("longitude"));

  v13 = (void *)objc_msgSend(v2, "copy");
  return v13;
}

- (id)_userData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_placeInShortcuts);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("favorites"));

  -[MUWebBasedPlacecardContext _userGuides](self, "_userGuides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("guides"));

  -[MUWebBasedPlacecardContext _userRapsInReview](self, "_userRapsInReview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("rapsInReview"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (id)_userInterfaceIdiom
{
  UIUserInterfaceIdiom v2;

  v2 = -[UITraitCollection userInterfaceIdiom](self->_traitCollection, "userInterfaceIdiom");
  if ((unint64_t)(v2 + 1) > 7)
    return CFSTR("phone");
  else
    return off_1E2E02C70[v2 + 1];
}

- (id)_osVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "osAndBuildVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_environment
{
  if (+[MapsUIUtilities isMapsProcess](MapsUIUtilities, "isMapsProcess"))
    return CFSTR("Maps");
  if (+[MapsUIUtilities isSafariProcess](MapsUIUtilities, "isSafariProcess"))
    return CFSTR("Safari");
  if (+[MapsUIUtilities isSiriProcess](MapsUIUtilities, "isSiriProcess"))
    return CFSTR("Siri");
  if (+[MapsUIUtilities isSpotlightProcess](MapsUIUtilities, "isSpotlightProcess"))
    return CFSTR("Spotlight");
  return &stru_1E2E05448;
}

- (id)_userGuides
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_guides;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v8, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

        objc_msgSend(v8, "guideID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("guideID"));

        objc_msgSend(v8, "image");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("image"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v8, "numberOfPlaces"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("numberOfPlaces"));
        objc_msgSend(v3, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

- (id)_userRapsInReview
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_userIcon, CFSTR("userImage"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_numberOfReportsInReview);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("count"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

- (id)_formattedPhoneNumber
{
  void *v2;
  MUContactLabeledValue *v3;
  __CFString *v4;
  _OWORD v6[4];
  _BYTE v7[128];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[CNContact phoneNumbers](self->_contact, "phoneNumbers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v6, 0, sizeof(v6));
  if (objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", v6, v7, 16))
  {
    v3 = -[MUContactLabeledValue initWithContactLabeledValue:type:]([MUContactLabeledValue alloc], "initWithContactLabeledValue:type:", **((_QWORD **)&v6[0] + 1), 1);
    -[MUContactLabeledValue valueString](v3, "valueString");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1E2E05448;
  }

  return v4;
}

- (id)_userArpRating
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)_userArpPhotos
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)_userNotes
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)_userArpSuggestions
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_userIcon, 0);
  objc_storeStrong((id *)&self->_guides, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_locationAddress, 0);
  objc_storeStrong((id *)&self->_formattedAddressLines, 0);
  objc_storeStrong((id *)&self->_mapItemString, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
