@implementation GEOGuideLocation

- (GEOGuideLocation)initWithChildAction:(id)a3
{
  id *v4;
  id *v5;
  GEOGuideLocation *v6;
  id *v7;
  uint64_t v8;
  GEOPDGuidesLocationEntry *guideLocation;
  NSObject *v10;
  void *v11;
  void *v12;
  GEOGuideLocation *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = v4;
  if (v4 && (-[GEOPDChildAction _readChildActionGuides]((uint64_t)v4), v5[6]))
  {
    v15.receiver = self;
    v15.super_class = (Class)GEOGuideLocation;
    v6 = -[GEOGuideLocation init](&v15, sel_init);
    if (v6)
    {
      -[GEOPDChildAction childActionGuides](v5);
      v7 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDChildActionGuides guidesLocationEntry](v7);
      v8 = objc_claimAutoreleasedReturnValue();
      guideLocation = v6->_guideLocation;
      v6->_guideLocation = (GEOPDGuidesLocationEntry *)v8;

      GEOGetCuratedCollectionsLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        -[GEOPDGuidesLocationEntry placeId]((id *)&v6->_guideLocation->super.super.isa);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDEntity bestLocalizedName](v6->_placeEntity, "bestLocalizedName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v11;
        v18 = 2112;
        v19 = v12;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "Succesfully initialized Guide Location with Id: %@, Title: %@", buf, 0x16u);

      }
    }
    self = v6;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (GEOGuideLocation)initWithWorldwideGuideLocation:(id)a3
{
  id *v4;
  _BOOL4 v5;
  uint64_t v6;
  _QWORD *v7;
  _BOOL4 v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  GEOGuideLocation *v13;
  uint64_t v14;
  GEOPDGuidesLocationEntryTypeWorldWide *worldwideGuideLocation;
  GEOGuideLocation *v16;
  NSObject *v17;
  const char *v18;
  const char *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  if (-[GEOPDGuidesLocationEntry type]((uint64_t)v4) != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: guideLocation.type == GEOPDGuidesLocationEntry_GuidesLocationEntryType_GUIDES_LOCATION_ENTRY_TYPE_WORLDWIDE", buf, 2u);
    }
    goto LABEL_23;
  }
  if (v4)
  {
    -[GEOPDGuidesLocationEntry _readWorldwide]((uint64_t)v4);
    v5 = v4[9] != 0;
  }
  else
  {
    v5 = 0;
  }
  -[GEOPDGuidesLocationEntry worldwide](v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (_QWORD *)v6;
  if (v6)
  {
    -[GEOPDGuidesLocationEntryTypeWorldWide _readName](v6);
    v8 = v7[4] != 0;
  }
  else
  {
    v8 = 0;
  }

  -[GEOPDGuidesLocationEntry worldwide](v4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (_QWORD *)v9,
        -[GEOPDGuidesLocationEntryTypeWorldWide _readPhoto](v9),
        v11 = v10[5],
        v10,
        !v11))
  {
    GEOGetCuratedCollectionsLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "NO";
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "Worldwide Guide Location is missing some data .\n, hasPhoto: %s", buf, 0xCu);
    }

  }
  if (!v5 || !v8)
  {
    GEOGetCuratedCollectionsLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = "NO";
      if (v5)
        v19 = "YES";
      else
        v19 = "NO";
      if (v8)
        v18 = "YES";
      *(_DWORD *)buf = 136315394;
      v23 = v19;
      v24 = 2080;
      v25 = v18;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "Worldwide Guide Location could not be initialized because some data is missing.\n, hasWorldwide:%s, hasName: %s", buf, 0x16u);
    }

LABEL_23:
    v16 = 0;
    goto LABEL_24;
  }
  v21.receiver = self;
  v21.super_class = (Class)GEOGuideLocation;
  v13 = -[GEOGuideLocation init](&v21, sel_init);
  if (v13)
  {
    -[GEOPDGuidesLocationEntry worldwide](v4);
    v14 = objc_claimAutoreleasedReturnValue();
    worldwideGuideLocation = v13->_worldwideGuideLocation;
    v13->_worldwideGuideLocation = (GEOPDGuidesLocationEntryTypeWorldWide *)v14;

  }
  self = v13;
  v16 = self;
LABEL_24:

  return v16;
}

- (GEOGuideLocation)initWithGuideLocation:(id)a3
{
  id v5;
  GEOGuideLocation *v6;
  GEOGuideLocation *v7;
  GEOGuideLocation *v8;
  objc_super v10;

  v5 = a3;
  if (-[GEOPDGuidesLocationEntry type]((uint64_t)v5) == 2)
  {
    v6 = -[GEOGuideLocation initWithWorldwideGuideLocation:](self, "initWithWorldwideGuideLocation:", v5);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOGuideLocation;
    v7 = -[GEOGuideLocation init](&v10, sel_init);
    v6 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_guideLocation, a3);
  }
  v8 = v6;

  return v8;
}

- (GEOGuideLocation)initWithGuideLocation:(id)a3 mapsResult:(id)a4
{
  id *v7;
  id v8;
  GEOGuideLocation *v9;
  void *v10;
  GEOMapItemIdentifier *v11;
  GEOMapItemIdentifier *v12;
  void *v13;
  GEOMapItemIdentifier *v14;
  _BOOL4 v15;
  uint64_t v16;
  id *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  GEOGuideLocation *v23;
  id *p_isa;
  id *p_placeEntity;
  NSObject *v26;
  void *v27;
  void *v28;
  char *v29;
  NSObject *v30;
  char *v31;
  void *v32;
  void *v33;
  char *v34;
  NSObject *p_super;
  NSObject *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  GEOMapItemIdentifier *v42;
  GEOMapItemIdentifier *v43;
  id *obj;
  objc_super v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = (id *)a3;
  v8 = a4;
  if (-[GEOPDGuidesLocationEntry type]((uint64_t)v7) == 2)
  {
    self = -[GEOGuideLocation initWithWorldwideGuideLocation:](self, "initWithWorldwideGuideLocation:", v7);
    v9 = self;
  }
  else
  {
    objc_msgSend(v8, "place");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[GEOMapItemIdentifier initWithPlace:]([GEOMapItemIdentifier alloc], "initWithPlace:", v10);
      v12 = [GEOMapItemIdentifier alloc];
      -[GEOPDGuidesLocationEntry placeId](v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v12, "initWithMapsIdentifier:", v13);

      v42 = v14;
      v43 = v11;
      v15 = -[GEOMapItemIdentifier isEqual:](v14, "isEqual:", v11);
      +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", v10);
      v16 = objc_claimAutoreleasedReturnValue();
      +[GEOPDGuideGroup guideGroupComponentFromPlaceData:](GEOPDGuideGroup, "guideGroupComponentFromPlaceData:", v10);
      v17 = (id *)objc_claimAutoreleasedReturnValue();
      +[GEOAddressObject addressObjectForPlaceData:](GEOAddressObject, "addressObjectForPlaceData:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "countryName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v17;
      -[GEOPDGuideGroup guideLocationImages](v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      v22 = (void *)v16;
      if (v15 && v16 && v19)
      {
        v45.receiver = self;
        v45.super_class = (Class)GEOGuideLocation;
        v23 = -[GEOGuideLocation init](&v45, sel_init);
        p_isa = (id *)&v23->super.isa;
        if (v23)
        {
          p_placeEntity = (id *)&v23->_placeEntity;
          objc_storeStrong((id *)&v23->_placeEntity, v22);
          objc_storeStrong(p_isa + 4, obj);
          objc_storeStrong(p_isa + 5, v19);
          objc_storeStrong(p_isa + 1, a3);
          if (!v21)
          {
            GEOGetCuratedCollectionsLog();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(p_isa, "description");
              v27 = v19;
              v28 = v22;
              v29 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v47 = v29;
              _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_INFO, "Warning. %@ does not contain any photos.", buf, 0xCu);

              v22 = v28;
              v19 = v27;
              p_placeEntity = p_isa + 3;
            }

          }
          GEOGetCuratedCollectionsLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            -[GEOPDGuidesLocationEntry placeId]((id *)p_isa[1]);
            v31 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*p_placeEntity, "bestLocalizedName");
            v32 = v19;
            v33 = v22;
            v34 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v47 = v31;
            v48 = 2112;
            v49 = v34;
            _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_DEBUG, "Succesfully initialized Guide Location with Id: %@, Title: %@", buf, 0x16u);

            v22 = v33;
            v19 = v32;

          }
        }
        self = p_isa;
        v9 = self;
      }
      else
      {
        GEOGetCuratedCollectionsLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = "NO";
          if (v15)
            v38 = "YES";
          else
            v38 = "NO";
          if (v16)
            v39 = "YES";
          else
            v39 = "NO";
          *(_DWORD *)buf = 136315906;
          v47 = v38;
          if (v21)
            v40 = "YES";
          else
            v40 = "NO";
          v48 = 2080;
          v49 = v39;
          v50 = 2080;
          v51 = v40;
          if (v19)
            v37 = "YES";
          v52 = 2080;
          v53 = v37;
          _os_log_impl(&dword_1885A9000, v36, OS_LOG_TYPE_ERROR, "Guide Location could not be initialized because some data is missing.\n Guide Location hasCorrectIdentifiers: %s, hasEntity: %s, hasPhotos: %s, hasCountry: %s", buf, 0x2Au);
        }

        v9 = 0;
      }

      p_super = &v43->super;
    }
    else
    {
      GEOGetCuratedCollectionsLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, p_super, OS_LOG_TYPE_ERROR, "Guide Location could not be initialized because some data is missing.\n Guide Location hasPlace: NO", buf, 2u);
      }
      v9 = 0;
    }

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  GEOGuideLocation *v4;
  GEOGuideLocation *v5;
  GEOGuideLocation *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = (GEOGuideLocation *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (-[GEOGuideLocation type](self, "type") == 2 && -[GEOGuideLocation type](v6, "type") == 2)
    {
      v7 = 1;
    }
    else
    {
      -[GEOGuideLocation guideLocationIdentifier](self, "guideLocationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOGuideLocation guideLocationIdentifier](v6, "guideLocationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqualToGEOMapItemIdentifier:", v9);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOGuideLocation guideLocationIdentifier](self, "guideLocationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "muid");
  -[GEOGuideLocation title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Guide Location: %llu : %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)type
{
  if (self->_worldwideGuideLocation)
    return 2;
  else
    return 1;
}

- (id)pdWorldwideLocationEntry
{
  return self->_worldwideGuideLocation;
}

- (id)pdLocationEntry
{
  return self->_guideLocation;
}

- (NSString)title
{
  GEOPDGuidesLocationEntryTypeWorldWide *worldwideGuideLocation;

  worldwideGuideLocation = self->_worldwideGuideLocation;
  if (worldwideGuideLocation)
    -[GEOPDGuidesLocationEntryTypeWorldWide name]((id *)&worldwideGuideLocation->super.super.isa);
  else
    -[GEOPDEntity bestLocalizedString](self->_placeEntity, "bestLocalizedString");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)numberOfGuides
{
  GEOPDGuidesLocationEntry *guideLocation;

  if (self->_worldwideGuideLocation)
    return 0;
  guideLocation = self->_guideLocation;
  if (!guideLocation)
    return 0;
  else
    return guideLocation->_numGuides;
}

- (id)photosForType:(int64_t)a3
{
  int v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  _GEOPlaceDataPhoto *v12;
  _GEOPlaceDataPhoto *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  BOOL (*v18)(uint64_t, uint64_t);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL (*v23)(uint64_t, uint64_t);
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = 2;
  else
    v4 = 1;
  if (-[GEOGuideLocation type](self, "type") == 2)
  {
    -[GEOPDGuidesLocationEntryTypeWorldWide guideLocationImages]((id *)&self->_worldwideGuideLocation->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3880];
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __34__GEOGuideLocation_photosForType___block_invoke;
    v24 = &__block_descriptor_36_e50_B24__0__GEOPDGuideLocationImage_8__NSDictionary_16l;
    LODWORD(v25) = v4;
    v7 = &v21;
  }
  else
  {
    -[GEOPDGuideGroup guideLocationImages]((id *)&self->_guideGroup->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3880];
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __34__GEOGuideLocation_photosForType___block_invoke_2;
    v19 = &__block_descriptor_36_e50_B24__0__GEOPDGuideLocationImage_8__NSDictionary_16l;
    LODWORD(v20) = v4;
    v7 = &v16;
  }
  objc_msgSend(v6, "predicateWithBlock:", v7, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGuideLocationImage image](v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && (v12 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:]([_GEOPlaceDataPhoto alloc], "initWithCaptionedPhoto:", v11)) != 0)
  {
    v13 = v12;
    v26[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

BOOL __34__GEOGuideLocation_photosForType___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;

  if (a2 && (*(_BYTE *)(a2 + 28) & 1) != 0)
    v2 = *(_DWORD *)(a2 + 24);
  else
    v2 = 0;
  return v2 == *(_DWORD *)(a1 + 32);
}

BOOL __34__GEOGuideLocation_photosForType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v2;

  if (a2 && (*(_BYTE *)(a2 + 28) & 1) != 0)
    v2 = *(_DWORD *)(a2 + 24);
  else
    v2 = 0;
  return v2 == *(_DWORD *)(a1 + 32);
}

- (GEOMapItemIdentifier)guideLocationIdentifier
{
  GEOMapItemIdentifier *v2;
  GEOMapItemIdentifier *v4;
  void *v5;

  if (self->_worldwideGuideLocation)
  {
    v2 = 0;
  }
  else
  {
    v4 = [GEOMapItemIdentifier alloc];
    -[GEOPDGuidesLocationEntry placeId]((id *)&self->_guideLocation->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v4, "initWithMapsIdentifier:", v5);

  }
  return v2;
}

+ (id)guideLocationsForEntries:(id)a3 mapsResults:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  GEOGuideLocation *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  objc_msgSend(v5, "firstObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8 && (v9 = (_QWORD *)v8, -[GEOPDGuidesLocationEntry _readWorldwide](v8), v10 = v9[9], v9, v10))
  {
    objc_msgSend(v5, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[GEOGuideLocation initWithGuideLocation:mapsResult:]([GEOGuideLocation alloc], "initWithGuideLocation:mapsResult:", v11, 0);
    if (v12)
      objc_msgSend(v7, "addObject:", v12);
    v13 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __57__GEOGuideLocation_guideLocationsForEntries_mapsResults___block_invoke_2;
    v28[3] = &unk_1E1BFF5A0;
    v17 = v15;
    v29 = v17;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v28);
    v26[0] = v16;
    v26[1] = 3221225472;
    v26[2] = __57__GEOGuideLocation_guideLocationsForEntries_mapsResults___block_invoke_3;
    v26[3] = &unk_1E1BFF5C8;
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v27 = v18;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v26);
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __57__GEOGuideLocation_guideLocationsForEntries_mapsResults___block_invoke_4;
    v22[3] = &unk_1E1BFF5F0;
    v23 = v18;
    v24 = v17;
    v19 = v7;
    v25 = v19;
    v12 = (GEOGuideLocation *)v17;
    v20 = v18;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v22);
    v13 = (id)objc_msgSend(v19, "copy");

  }
  return v13;
}

BOOL __57__GEOGuideLocation_guideLocationsForEntries_mapsResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resultType") == 1;
}

void __57__GEOGuideLocation_guideLocationsForEntries_mapsResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  GEOMapItemIdentifier *v4;
  void *v5;
  GEOMapItemIdentifier *v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v7 = v3;
    -[GEOPDGuidesLocationEntry _readPlaceId]((uint64_t)v3);
    v3 = v7;
    if (*((_QWORD *)v7 + 8))
    {
      v4 = [GEOMapItemIdentifier alloc];
      -[GEOPDGuidesLocationEntry placeId]((id *)v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v4, "initWithMapsIdentifier:", v5);

      if (v6)
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v7);

      v3 = v7;
    }
  }

}

void __57__GEOGuideLocation_guideLocationsForEntries_mapsResults___block_invoke_3(uint64_t a1, void *a2)
{
  GEOMapItemIdentifier *v3;
  void *v4;
  void *v5;
  GEOMapItemIdentifier *v6;
  id v7;

  v7 = a2;
  v3 = [GEOMapItemIdentifier alloc];
  objc_msgSend(v7, "place");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapsId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v3, "initWithMapsIdentifier:", v5);

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v6);

}

void __57__GEOGuideLocation_guideLocationsForEntries_mapsResults___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  GEOGuideLocation *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[GEOGuideLocation initWithGuideLocation:mapsResult:]([GEOGuideLocation alloc], "initWithGuideLocation:mapsResult:", v3, v6);
    if (v7)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

  }
  else
  {
    GEOGetCuratedCollectionsLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Missing place map result for guide location entry: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (NSString)country
{
  return self->_country;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_guideGroup, 0);
  objc_storeStrong((id *)&self->_placeEntity, 0);
  objc_storeStrong((id *)&self->_worldwideGuideLocation, 0);
  objc_storeStrong((id *)&self->_guideLocation, 0);
}

@end
