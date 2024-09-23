@implementation GEORelatedEntitySection

- (GEORelatedEntitySection)init
{
  GEORelatedEntitySection *result;

  result = (GEORelatedEntitySection *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEORelatedEntitySection)initWithRelatedEntitySection:(id)a3 mapsResults:(id)a4
{
  id v6;
  id v7;
  GEORelatedEntitySection *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  NSString *name;
  void *v13;
  id v14;
  GEORelatedCollectionSection *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  GEORelatedCollectionSection *relatedCollectionSection;
  uint64_t v20;
  NSArray *relatedPlaceCollections;
  _QWORD v23[4];
  id v24;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)GEORelatedEntitySection;
  v8 = -[GEORelatedEntitySection init](&v25, sel_init);
  if (!v8)
    goto LABEL_10;
  v9 = -[GEOPDRelatedEntitySection sectionType]((uint64_t)v6);
  if (v9)
  {
    if (v9 != 1)
      goto LABEL_7;
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  v8->_sectionType = v10;
LABEL_7:
  -[GEOPDRelatedEntitySection name]((id *)v6);
  v11 = objc_claimAutoreleasedReturnValue();
  name = v8->_name;
  v8->_name = (NSString *)v11;

  if (v6)
  {
    v8->_index = *((_DWORD *)v6 + 13);
    -[GEOPDRelatedEntitySection _readRelatedCollectionSection]((uint64_t)v6);
    if (*((_QWORD *)v6 + 4))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __68__GEORelatedEntitySection_initWithRelatedEntitySection_mapsResults___block_invoke;
      v23[3] = &unk_1E1BFF5C8;
      v24 = v13;
      v14 = v13;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v23);
      v15 = [GEORelatedCollectionSection alloc];
      -[GEOPDRelatedEntitySection relatedCollectionSection]((id *)v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "copy");
      v18 = -[GEORelatedCollectionSection initWithRelatedCollectionSection:mapsResults:](v15, "initWithRelatedCollectionSection:mapsResults:", v16, v17);
      relatedCollectionSection = v8->_relatedCollectionSection;
      v8->_relatedCollectionSection = (GEORelatedCollectionSection *)v18;

      -[GEORelatedEntitySection placeCollectionsWithCollectionSection:](v8, "placeCollectionsWithCollectionSection:", v8->_relatedCollectionSection);
      v20 = objc_claimAutoreleasedReturnValue();
      relatedPlaceCollections = v8->_relatedPlaceCollections;
      v8->_relatedPlaceCollections = (NSArray *)v20;

    }
  }
  else
  {
    v8->_index = 0;
  }
LABEL_10:

  return v8;
}

void __68__GEORelatedEntitySection_initWithRelatedEntitySection_mapsResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "resultType") == 2 && objc_msgSend(v3, "hasCollection"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)placeCollectionsWithCollectionSection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "collections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "collections", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "collection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v6, "copy");
  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)index
{
  return self->_index;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (GEORelatedCollectionSection)relatedCollectionSection
{
  return self->_relatedCollectionSection;
}

- (NSArray)relatedPlaceCollections
{
  return self->_relatedPlaceCollections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedPlaceCollections, 0);
  objc_storeStrong((id *)&self->_relatedCollectionSection, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
