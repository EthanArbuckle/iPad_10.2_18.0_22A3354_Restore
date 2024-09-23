@implementation GEOSearchSectionList

- (GEOSearchSectionList)init
{
  GEOSearchSectionList *result;

  result = (GEOSearchSectionList *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOSearchSectionList)initWithSearchSections:(id)a3
{
  id v4;
  GEOSearchSectionList *v5;
  uint64_t v6;
  NSArray *searchSections;
  uint64_t v8;
  NSArray *geoMapItemIdentifiers;
  GEOSearchSectionList *v10;
  objc_super v12;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOSearchSectionList;
    v5 = -[GEOSearchSectionList init](&v12, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      searchSections = v5->_searchSections;
      v5->_searchSections = (NSArray *)v6;

      objc_msgSend((id)objc_opt_class(), "identifiersWithSearchSections:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
      geoMapItemIdentifiers = v5->_geoMapItemIdentifiers;
      v5->_geoMapItemIdentifiers = (NSArray *)v8;

    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (GEOSearchSectionList)initWithSearchSectionList:(id)a3 mapsResults:(id)a4
{
  id *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  GEOSearchSection *v19;
  GEOSearchSection *v20;
  GEOSearchSectionList *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = a4;
  -[GEOPDSearchSectionList sections](v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[GEOPDSearchSectionList sections](v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[GEOPDSearchSectionList sections](v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17);
          v19 = [GEOSearchSection alloc];
          v20 = -[GEOSearchSection initWithSearchSection:mapsResults:](v19, "initWithSearchSection:mapsResults:", v18, v7, (_QWORD)v23);
          if (v20)
            objc_msgSend(v12, "addObject:", v20);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

    self = -[GEOSearchSectionList initWithSearchSections:](self, "initWithSearchSections:", v12);
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)identifiersWithSearchSections:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v10, "sectionType", (_QWORD)v18) == 1)
          {
            objc_msgSend(v10, "sectionPlace");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "mapItemIds");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "count");

            if (v13)
            {
              objc_msgSend(v10, "sectionPlace");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "mapItemIds");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObjectsFromArray:", v15);

            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v4, "count"))
      v16 = (void *)objc_msgSend(v4, "copy");
    else
      v16 = 0;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)indexOfItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[GEOSearchSectionList geoMapItemIdentifiers](self, "geoMapItemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (NSArray)searchSections
{
  return self->_searchSections;
}

- (NSArray)geoMapItemIdentifiers
{
  return self->_geoMapItemIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoMapItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_searchSections, 0);
}

@end
