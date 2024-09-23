@implementation GEOTrail

- (GEOTrail)initWithTrail:(id)a3
{
  id *v4;
  GEOTrail *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *factoids;
  void *v10;
  void *v11;
  void *v12;
  GEOMapItemIdentifier *v13;
  GEOMapItemIdentifier *trailIdentifier;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *name;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *categoryName;
  void *v24;
  _GEOPlaceDataPhoto *v25;
  void *v26;
  uint64_t v27;
  GEOMapItemPhoto *photo;
  void *v29;
  void *v30;
  GEOFeatureStyleAttributes *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  GEOFeatureStyleAttributes *styleAttributes;
  BOOL v36;
  GEOTrail *v37;
  uint8_t v39[16];
  objc_super v40;

  v4 = (id *)a3;
  v40.receiver = self;
  v40.super_class = (Class)GEOTrail;
  v5 = -[GEOTrail init](&v40, sel_init);
  if (!v5)
  {
LABEL_10:
    v37 = v5;
    goto LABEL_11;
  }
  v6 = (void *)objc_opt_class();
  -[GEOPDTrail factoid](v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "factoidsFromFactoidData:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  factoids = v5->_factoids;
  v5->_factoids = (NSArray *)v8;

  -[GEOPDTrail mapsIds](v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "shardedId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_trailId = objc_msgSend(v12, "muid");

    v13 = -[GEOMapItemIdentifier initWithMapsIdentifier:]([GEOMapItemIdentifier alloc], "initWithMapsIdentifier:", v11);
    trailIdentifier = v5->_trailIdentifier;
    v5->_trailIdentifier = v13;

    -[GEOPDTrail entity](v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bestLocalizedName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringValue");
    v17 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v17;

    -[GEOPDTrail entity](v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedCategorys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bestLocalizedCategoryName");
    v22 = objc_claimAutoreleasedReturnValue();
    categoryName = v5->_categoryName;
    v5->_categoryName = (NSString *)v22;

    -[GEOPDTrail photo](v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [_GEOPlaceDataPhoto alloc];
      -[GEOPDTrail photo](v4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[_GEOPlaceDataPhoto initWithPhoto:](v25, "initWithPhoto:", v26);
      photo = v5->_photo;
      v5->_photo = (GEOMapItemPhoto *)v27;

    }
    -[GEOPDTrail entity](v4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "styleAttributes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [GEOFeatureStyleAttributes alloc];
      -[GEOPDTrail entity](v4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "styleAttributes");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[GEOFeatureStyleAttributes initWithPlaceDataStyleAttributes:](v31, "initWithPlaceDataStyleAttributes:", v33);
      styleAttributes = v5->_styleAttributes;
      v5->_styleAttributes = (GEOFeatureStyleAttributes *)v34;

    }
    if (v4)
      v36 = *((_BYTE *)v4 + 84) != 0;
    else
      v36 = 0;
    v5->_shouldHighlight = v36;

    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v39 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: identifier != ((void *)0)", v39, 2u);
  }
  v37 = 0;
LABEL_11:

  return v37;
}

+ (id)factoidsFromFactoidData:(id)a3
{
  id *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  GEOFactoid *v13;
  GEOFactoid *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (id *)a3;
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if (v3)
    v5 = objc_msgSend(v3[2], "count");
  else
    v5 = 0;
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", v5);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[GEOPDTrailHeadTrailFactoidData factoids](v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v13 = [GEOFactoid alloc];
        v14 = -[GEOFactoid initWithFactoid:](v13, "initWithFactoid:", v12, (_QWORD)v16);
        if (v14)
          objc_msgSend(v6, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (NSArray)factoids
{
  return self->_factoids;
}

- (unint64_t)trailId
{
  return self->_trailId;
}

- (NSString)name
{
  return self->_name;
}

- (GEOMapItemPhoto)photo
{
  return self->_photo;
}

- (GEOMapItemIdentifier)trailIdentifier
{
  return self->_trailIdentifier;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (BOOL)shouldHighlight
{
  return self->_shouldHighlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
  objc_storeStrong((id *)&self->_trailIdentifier, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_factoids, 0);
}

@end
