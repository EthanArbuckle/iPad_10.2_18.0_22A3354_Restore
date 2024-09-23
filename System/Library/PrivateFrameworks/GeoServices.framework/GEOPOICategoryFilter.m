@implementation GEOPOICategoryFilter

+ (id)filterIncludingAllCategories
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCategoriesToInclude:categoriesToExclude:", 0, MEMORY[0x1E0C9AA60]);
}

+ (id)filterExcludingAllCategories
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCategoriesToInclude:categoriesToExclude:", MEMORY[0x1E0C9AA60], 0);
}

- (GEOPOICategoryFilter)initWithCategoriesToInclude:(id)a3 categoriesToExclude:(id)a4
{
  id v6;
  id v7;
  GEOPOICategoryFilter *v8;
  uint64_t v9;
  NSArray *categoriesToInclude;
  uint64_t v11;
  NSArray *categoriesToExclude;
  GEOPOICategoryFilter *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOPOICategoryFilter;
  v8 = -[GEOPOICategoryFilter init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    categoriesToInclude = v8->_categoriesToInclude;
    v8->_categoriesToInclude = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    categoriesToExclude = v8->_categoriesToExclude;
    v8->_categoriesToExclude = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (void)applyFilterToPlaceParameters:(id)a3
{
  id v4;
  GEOPDPoiIconCategoryFilter *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray count](self->_categoriesToInclude, "count") || -[NSArray count](self->_categoriesToExclude, "count"))
  {
    v5 = objc_alloc_init(GEOPDPoiIconCategoryFilter);
    if (self->_categoriesToInclude)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      +[GEOPOITypeMapping sharedMapping](GEOPOITypeMapping, "sharedMapping");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "typesForPOICategories:", self->_categoriesToInclude);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v23;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "unsignedIntValue");
            -[GEOPDPoiIconCategoryFilter addIncludeCategoryFilter:]((uint64_t)v5);
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v9);
      }

    }
    if (self->_categoriesToExclude)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      +[GEOPOITypeMapping sharedMapping](GEOPOITypeMapping, "sharedMapping", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typesForPOICategories:", self->_categoriesToExclude);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v19;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17), "unsignedIntValue");
            -[GEOPDPoiIconCategoryFilter addExcludeCategoryFilter:]((uint64_t)v5);
            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v15);
      }

    }
    -[GEOPDSpatialPlaceLookupParameters setPoiIconCategoryFilter:]((uint64_t)v4, v5);

  }
  else
  {
    -[GEOPDSpatialPlaceLookupParameters setPoiIconCategoryFilter:]((uint64_t)v4, 0);
  }

}

- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4
{
  id v6;
  GEOPDAutocompleteFilter *v7;
  GEOPDPoiIconCategoryFilter *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  BOOL v22;
  NSArray *categoriesToInclude;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  void *v32;
  int v33;
  void *v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _DWORD *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  int v45;
  void *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "hasAutocompleteFilter") & 1) == 0)
  {
    v7 = objc_alloc_init(GEOPDAutocompleteFilter);
    objc_msgSend(v6, "setAutocompleteFilter:", v7);

  }
  if (self->_categoriesToExclude
    || (categoriesToInclude = self->_categoriesToInclude) == 0
    || -[NSArray count](categoriesToInclude, "count"))
  {
    if (!self->_categoriesToInclude && !self->_categoriesToExclude)
      goto LABEL_26;
    v8 = objc_alloc_init(GEOPDPoiIconCategoryFilter);
    if (self->_categoriesToInclude)
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      +[GEOPOITypeMapping sharedMapping](GEOPOITypeMapping, "sharedMapping");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "typesForPOICategories:", self->_categoriesToInclude);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v55 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "unsignedIntValue");
            -[GEOPDPoiIconCategoryFilter addIncludeCategoryFilter:]((uint64_t)v8);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        }
        while (v12);
      }

    }
    if (self->_categoriesToExclude)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      +[GEOPOITypeMapping sharedMapping](GEOPOITypeMapping, "sharedMapping", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "typesForPOICategories:", self->_categoriesToExclude);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v51;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v51 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "unsignedIntValue");
            -[GEOPDPoiIconCategoryFilter addExcludeCategoryFilter:]((uint64_t)v8);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        }
        while (v18);
      }

    }
    objc_msgSend(v6, "autocompleteFilter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPoiIconCategoryFilter:", v8);

LABEL_25:
LABEL_26:
    v22 = 1;
    goto LABEL_27;
  }
  objc_msgSend(v6, "autocompleteFilter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "requestedEntryTypesCount");

  objc_msgSend(v6, "autocompleteFilter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v26)
  {
    objc_msgSend(v27, "addRequestedEntryType:", 0);

    objc_msgSend(v6, "autocompleteFilter");
    v8 = (GEOPDPoiIconCategoryFilter *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPoiIconCategoryFilter addRequestedEntryType:](v8, "addRequestedEntryType:", 2);
    goto LABEL_25;
  }
  v29 = objc_msgSend(v27, "requestedEntryTypesCount");

  if (!v29)
    goto LABEL_26;
  v30 = 0;
  v31 = 0;
  do
  {
    objc_msgSend(v6, "autocompleteFilter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "requestedEntryTypeAtIndex:", v31);

    v30 |= v33 == 1;
    ++v31;
    objc_msgSend(v6, "autocompleteFilter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "requestedEntryTypesCount");

  }
  while (v31 < v35);
  if ((v30 & 1) == 0)
    goto LABEL_26;
  objc_msgSend(v6, "autocompleteFilter");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "requestedEntryTypesCount");

  if (v37 != 1)
  {
    objc_msgSend(v6, "autocompleteFilter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = malloc_type_malloc(4 * objc_msgSend(v38, "requestedEntryTypesCount") - 4, 0x100004052888210uLL);

    objc_msgSend(v6, "autocompleteFilter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "requestedEntryTypesCount");

    if (v41)
    {
      v42 = 0;
      v43 = 0;
      do
      {
        objc_msgSend(v6, "autocompleteFilter");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "requestedEntryTypeAtIndex:", v43);

        if (v45 != 1)
          v39[v42++] = v45;
        ++v43;
        objc_msgSend(v6, "autocompleteFilter");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "requestedEntryTypesCount");

      }
      while (v43 < v47);
    }
    objc_msgSend(v6, "autocompleteFilter");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "autocompleteFilter");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setRequestedEntryTypes:count:", v39, objc_msgSend(v49, "requestedEntryTypesCount") - 1);

    free(v39);
    goto LABEL_26;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -8);
    v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_27:

  return v22;
}

- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  GEOPDSSearchFilter *v8;
  GEOPDPoiIconCategoryFilter *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  BOOL v23;
  NSArray *categoriesToInclude;
  void *v26;
  int v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t)v6;
  if (!v6 || (-[GEOPDSearchParameters _readSearchFilter]((uint64_t)v6), !*(_QWORD *)(v7 + 240)))
  {
    v8 = objc_alloc_init(GEOPDSSearchFilter);
    -[GEOPDSearchParameters setSearchFilter:](v7, v8);

  }
  if (self->_categoriesToExclude
    || (categoriesToInclude = self->_categoriesToInclude) == 0
    || -[NSArray count](categoriesToInclude, "count"))
  {
    if (self->_categoriesToInclude || self->_categoriesToExclude)
    {
      v9 = objc_alloc_init(GEOPDPoiIconCategoryFilter);
      if (self->_categoriesToInclude)
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        +[GEOPOITypeMapping sharedMapping](GEOPOITypeMapping, "sharedMapping");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "typesForPOICategories:", self->_categoriesToInclude);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v34 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "unsignedIntValue");
              -[GEOPDPoiIconCategoryFilter addIncludeCategoryFilter:]((uint64_t)v9);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          }
          while (v13);
        }

      }
      if (self->_categoriesToExclude)
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        +[GEOPOITypeMapping sharedMapping](GEOPOITypeMapping, "sharedMapping", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "typesForPOICategories:", self->_categoriesToExclude);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v30 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "unsignedIntValue");
              -[GEOPDPoiIconCategoryFilter addExcludeCategoryFilter:]((uint64_t)v9);
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v19);
        }

      }
      -[GEOPDSearchParameters searchFilter]((id *)v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDSSearchFilter setPoiIconCategoryFilter:]((uint64_t)v22, v9);

    }
    goto LABEL_26;
  }
  -[GEOPDSearchParameters searchFilter]((id *)v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[GEOPDSSearchFilter searchIntentFilter]((uint64_t)v26);

  if (v27 == 3)
    goto LABEL_33;
  if (v27 != 1)
  {
    if (v27)
    {
LABEL_26:
      v23 = 1;
      goto LABEL_27;
    }
LABEL_33:
    -[GEOPDSearchParameters searchFilter]((id *)v7);
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      *(_WORD *)(v28 + 116) |= 0x400u;
      *(_WORD *)(v28 + 116) |= 1u;
      *(_DWORD *)(v28 + 108) = 1;
    }

    goto LABEL_26;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -8);
    v23 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
LABEL_27:

  return v23;
}

- (BOOL)shouldDisplayPOIWithType:(int)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSArray *categoriesToInclude;

  v3 = *(_QWORD *)&a3;
  if (!self->_categoriesToInclude && !self->_categoriesToExclude)
    goto LABEL_4;
  +[GEOPOITypeMapping sharedMapping](GEOPOITypeMapping, "sharedMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAlwaysVisiblePOIType:", v3);

  if ((v6 & 1) != 0)
    goto LABEL_4;
  if (!self->_categoriesToExclude)
  {
    categoriesToInclude = self->_categoriesToInclude;
    if (!categoriesToInclude)
      goto LABEL_4;
    v7 = -[NSArray count](categoriesToInclude, "count");
    if (!v7)
      return v7;
  }
  if (self->_categoriesToInclude)
  {
    +[GEOPOITypeMapping sharedMapping](GEOPOITypeMapping, "sharedMapping");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "typesForPOICategories:", self->_categoriesToInclude);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "containsObject:", v10);

    if (!v11)
    {
      LOBYTE(v7) = 0;
      return v7;
    }
  }
  if (self->_categoriesToExclude)
  {
    +[GEOPOITypeMapping sharedMapping](GEOPOITypeMapping, "sharedMapping");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "typesForPOICategories:", self->_categoriesToExclude);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "containsObject:", v14);

    LOBYTE(v7) = v15 ^ 1;
    return v7;
  }
LABEL_4:
  LOBYTE(v7) = 1;
  return v7;
}

- (NSArray)categoriesToInclude
{
  return self->_categoriesToInclude;
}

- (NSArray)categoriesToExclude
{
  return self->_categoriesToExclude;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoriesToExclude, 0);
  objc_storeStrong((id *)&self->_categoriesToInclude, 0);
}

@end
