@implementation GEOComposedRouteAdvisory

- (GEOComposedRouteAdvisory)initWithGeoAdvisoryNotice:(id)a3 incidents:(id)a4
{
  id v6;
  id v7;
  GEOComposedRouteAdvisory *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  GEOComposedRouteAdvisoryItem *v19;
  uint64_t v20;
  NSArray *advisoryItems;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)GEOComposedRouteAdvisory;
  v8 = -[GEOComposedRouteAdvisory init](&v28, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "noticeArtwork");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_fallbackAdvisoryArtwork");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    -[GEOComposedRouteAdvisory _commonInitWithAdvisoryNotice:artwork:](v8, "_commonInitWithAdvisoryNotice:artwork:", v6, v12);
    v13 = (void *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v23 = v6;
    objc_msgSend(v6, "advisoryItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v19 = -[GEOComposedRouteAdvisoryItem initWithAdvisoryItem:routeIncidents:fallbackIcon:]([GEOComposedRouteAdvisoryItem alloc], "initWithAdvisoryItem:routeIncidents:fallbackIcon:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), v7, v12);
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v16);
    }

    v20 = objc_msgSend(v13, "copy");
    advisoryItems = v8->_advisoryItems;
    v8->_advisoryItems = (NSArray *)v20;

    v6 = v23;
  }

  return v8;
}

- (GEOComposedRouteAdvisory)initWithGeoAdvisoryNotice:(id)a3 transitIncidents:(id)a4
{
  id v6;
  id v7;
  GEOComposedRouteAdvisory *v8;
  GEOComposedRouteAdvisory *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  GEOComposedRouteAdvisoryItem *v20;
  uint64_t v21;
  NSArray *advisoryItems;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)GEOComposedRouteAdvisory;
  v8 = -[GEOComposedRouteAdvisory init](&v29, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_initialisedForTransit = 1;
    objc_msgSend(v6, "noticeArtwork");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_fallbackAdvisoryArtwork");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    -[GEOComposedRouteAdvisory _commonInitWithAdvisoryNotice:artwork:](v9, "_commonInitWithAdvisoryNotice:artwork:", v6, v13);
    v14 = (void *)objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = v6;
    objc_msgSend(v6, "advisoryItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = -[GEOComposedRouteAdvisoryItem initWithAdvisoryItem:transitIncidents:fallbackIcon:]([GEOComposedRouteAdvisoryItem alloc], "initWithAdvisoryItem:transitIncidents:fallbackIcon:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), v7, v13);
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v17);
    }

    v21 = objc_msgSend(v14, "copy");
    advisoryItems = v9->_advisoryItems;
    v9->_advisoryItems = (NSArray *)v21;

    v6 = v24;
  }

  return v9;
}

- (void)_commonInitWithAdvisoryNotice:(id)a3 artwork:(id)a4
{
  id v6;
  GEOPBTransitArtwork *v7;
  GEOServerFormattedString *v8;
  GEOServerFormattedString *title;
  GEOComposedString *v10;
  void *v11;
  GEOComposedString *v12;
  GEOComposedString *titleString;
  GEOPBTransitArtwork *artwork;
  GEOPBTransitArtwork *v15;
  void *v16;
  NSArray *v17;
  NSArray *analyticsMessageValues;
  uint8_t v19[16];

  v6 = a3;
  v7 = (GEOPBTransitArtwork *)a4;
  objc_msgSend(v6, "noticeText");
  v8 = (GEOServerFormattedString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v8;

  v10 = [GEOComposedString alloc];
  objc_msgSend(v6, "noticeText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[GEOComposedString initWithGeoFormattedString:](v10, "initWithGeoFormattedString:", v11);
  titleString = self->_titleString;
  self->_titleString = v12;

  if (!self->_titleString && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _titleString != nil", v19, 2u);
  }
  self->_isClickable = objc_msgSend(v6, "shouldAlwaysShowAdvisoryCard");
  artwork = self->_artwork;
  self->_artwork = v7;
  v15 = v7;

  objc_msgSend(v6, "analyticsMessageValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (NSArray *)objc_msgSend(v16, "copy");
  analyticsMessageValues = self->_analyticsMessageValues;
  self->_analyticsMessageValues = v17;

}

+ (id)_fallbackAdvisoryArtwork
{
  if (qword_1ECDBC758 != -1)
    dispatch_once(&qword_1ECDBC758, &__block_literal_global_163);
  return (id)_MergedGlobals_301;
}

void __52__GEOComposedRouteAdvisory__fallbackAdvisoryArtwork__block_invoke()
{
  GEOPBTransitArtwork *v0;
  GEOStyleAttributes *v1;
  GEOStyleAttribute *v2;
  void *v3;
  GEOPBTransitIcon *v4;

  v0 = objc_alloc_init(GEOPBTransitArtwork);
  v4 = objc_alloc_init(GEOPBTransitIcon);
  v1 = objc_alloc_init(GEOStyleAttributes);
  v2 = objc_alloc_init(GEOStyleAttribute);
  -[GEOStyleAttribute setKey:](v2, "setKey:", 65618);
  -[GEOStyleAttribute setValue:](v2, "setValue:", 4);
  -[GEOStyleAttributes addAttribute:](v1, "addAttribute:", v2);
  -[GEOPBTransitIcon setStyleAttributes:](v4, "setStyleAttributes:", v1);
  -[GEOPBTransitArtwork setIcon:](v0, "setIcon:", v4);
  v3 = (void *)_MergedGlobals_301;
  _MergedGlobals_301 = (uint64_t)v0;

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ title: %@, artwork: %@, isClickable: %d, advisoryItems: %@, analyticsMessageValues: %@, initialisedForTransit: %d>"), v5, self->_titleString, self->_artwork, self->_isClickable, self->_advisoryItems, self->_analyticsMessageValues, self->_initialisedForTransit);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteAdvisory)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteAdvisory *v5;
  uint64_t v6;
  GEOServerFormattedString *title;
  uint64_t v8;
  GEOComposedString *titleString;
  uint64_t v10;
  GEOPBTransitArtwork *artwork;
  uint64_t v12;
  NSArray *advisoryItems;
  uint64_t v14;
  NSArray *analyticsMessageValues;
  GEOComposedRouteAdvisory *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOComposedRouteAdvisory;
  v5 = -[GEOComposedRouteAdvisory init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (GEOServerFormattedString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_titleString"));
    v8 = objc_claimAutoreleasedReturnValue();
    titleString = v5->_titleString;
    v5->_titleString = (GEOComposedString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_artwork"));
    v10 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (GEOPBTransitArtwork *)v10;

    v5->_isClickable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isClickable"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_advisoryItems"));
    v12 = objc_claimAutoreleasedReturnValue();
    advisoryItems = v5->_advisoryItems;
    v5->_advisoryItems = (NSArray *)v12;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_analyticsMessageValues"));
    v14 = objc_claimAutoreleasedReturnValue();
    analyticsMessageValues = v5->_analyticsMessageValues;
    v5->_analyticsMessageValues = (NSArray *)v14;

    v5->_initialisedForTransit = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_initialisedForTransit"));
    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOServerFormattedString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_titleString, CFSTR("_titleString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artwork, CFSTR("_artwork"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isClickable, CFSTR("_isClickable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_advisoryItems, CFSTR("_advisoryItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_analyticsMessageValues, CFSTR("_analyticsMessageValues"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_initialisedForTransit, CFSTR("_initialisedForTransit"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 8), self->_title);
  v5 = -[GEOComposedString copy](self->_titleString, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  objc_storeStrong((id *)(v4 + 24), self->_artwork);
  *(_BYTE *)(v4 + 32) = self->_isClickable;
  v7 = -[NSArray copy](self->_advisoryItems, "copy");
  v8 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v7;

  v9 = -[NSArray copy](self->_analyticsMessageValues, "copy");
  v10 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v9;

  *(_BYTE *)(v4 + 48) = self->_initialisedForTransit;
  return (id)v4;
}

- (GEOServerFormattedString)title
{
  return self->_title;
}

- (GEOComposedString)titleString
{
  return self->_titleString;
}

- (GEOPBTransitArtwork)artwork
{
  return self->_artwork;
}

- (BOOL)isClickable
{
  return self->_isClickable;
}

- (NSArray)advisoryItems
{
  return self->_advisoryItems;
}

- (NSArray)analyticsMessageValues
{
  return self->_analyticsMessageValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsMessageValues, 0);
  objc_storeStrong((id *)&self->_advisoryItems, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
