@implementation GEOMiniBrowseCategories

- (GEOMiniBrowseCategories)initWithMiniPDBrowseCategories:(id)a3 topChildNames:(id)a4
{
  id v6;
  id v7;
  GEOMiniBrowseCategories *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  GEOFeatureStyleAttributes *v16;
  uint64_t v17;
  NSArray *categoriesStyleAttributes;
  GEOMiniBrowseCategories *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)GEOMiniBrowseCategories;
  v8 = -[GEOMiniBrowseCategories init](&v26, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          -[GEOPDMiniBrowseCategory styleAttributes](*(id **)(*((_QWORD *)&v22 + 1) + 8 * i));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = -[GEOFeatureStyleAttributes initWithPlaceDataStyleAttributes:]([GEOFeatureStyleAttributes alloc], "initWithPlaceDataStyleAttributes:", v15);
            objc_msgSend(v9, "addObject:", v16);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v12);
    }

    v17 = objc_msgSend(v9, "copy");
    categoriesStyleAttributes = v8->_categoriesStyleAttributes;
    v8->_categoriesStyleAttributes = (NSArray *)v17;

    objc_storeStrong((id *)&v8->_topChildNames, a4);
    v19 = v8;

    v6 = v21;
  }

  return v8;
}

- (NSArray)categoriesStyleAttributes
{
  return self->_categoriesStyleAttributes;
}

- (NSArray)topChildNames
{
  return self->_topChildNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topChildNames, 0);
  objc_storeStrong((id *)&self->_categoriesStyleAttributes, 0);
}

@end
