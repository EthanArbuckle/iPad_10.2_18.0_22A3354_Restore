@implementation GEOResultRefinementSort

- (GEOResultRefinementSort)initWithDisplayName:(id)a3 sorts:(id)a4 selectedElementIndex:(id)a5 defaultSelectedElementIndex:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GEOResultRefinementSort *v14;
  uint64_t v15;
  NSString *displayName;
  uint64_t v17;
  NSArray *sorts;
  GEOResultRefinementSort *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "count"))
  {
    v21.receiver = self;
    v21.super_class = (Class)GEOResultRefinementSort;
    v14 = -[GEOResultRefinementSort init](&v21, sel_init);
    if (v14)
    {
      v15 = objc_msgSend(v10, "copy");
      displayName = v14->_displayName;
      v14->_displayName = (NSString *)v15;

      v17 = objc_msgSend(v11, "copy");
      sorts = v14->_sorts;
      v14->_sorts = (NSArray *)v17;

      objc_storeStrong((id *)&v14->_selectedElementIndex, a5);
      objc_storeStrong((id *)&v14->_defaultSelectedElementIndex, a6);
    }
    self = v14;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (GEOResultRefinementSort)initWithResultRefinementSort:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  GEOResultRefinementSort *v11;

  v4 = (id *)a3;
  -[GEOPDResultRefinementSort sorts](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_geo_compactMap:", &__block_literal_global_27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (*((_BYTE *)v4 + 60) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v4 + 14));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[GEOPDResultRefinementSort displayName](v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v9 = *((unsigned int *)v4 + 13);
  else
    v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[GEOResultRefinementSort initWithDisplayName:sorts:selectedElementIndex:defaultSelectedElementIndex:](self, "initWithDisplayName:sorts:selectedElementIndex:defaultSelectedElementIndex:", v8, v6, v7, v10);

  return v11;
}

GEOResultRefinementSortElement *__56__GEOResultRefinementSort_initWithResultRefinementSort___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEOResultRefinementSortElement *v3;

  v2 = a2;
  v3 = -[GEOResultRefinementSortElement initWithResultRefinementSortElement:]([GEOResultRefinementSortElement alloc], "initWithResultRefinementSortElement:", v2);

  return v3;
}

- (id)convertToGEOPDResultRefinementSort
{
  GEOPDResultRefinementSort *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(GEOPDResultRefinementSort);
  -[GEOResultRefinementSort displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementSort setDisplayName:]((uint64_t)v3, v4);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[GEOResultRefinementSort sorts](self, "sorts", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9), "convertToGEOPDResultRefinementSortElement");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDResultRefinementSort addSort:]((uint64_t)v3, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  -[GEOResultRefinementSort selectedElementIndex](self, "selectedElementIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[GEOResultRefinementSort selectedElementIndex](self, "selectedElementIndex");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntValue");
    if (v3)
    {
      *(_BYTE *)&v3->_flags |= 0x20u;
      *(_BYTE *)&v3->_flags |= 2u;
      v3->_selectedElementIndex = v13;
    }

  }
  -[GEOResultRefinementSort defaultSelectedElementIndex](self, "defaultSelectedElementIndex");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntValue");
  if (v3)
  {
    *(_BYTE *)&v3->_flags |= 0x20u;
    *(_BYTE *)&v3->_flags |= 1u;
    v3->_defaultSelectedElementIndex = v15;
  }

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)sorts
{
  return self->_sorts;
}

- (void)setSorts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)selectedElementIndex
{
  return self->_selectedElementIndex;
}

- (void)setSelectedElementIndex:(id)a3
{
  objc_storeStrong((id *)&self->_selectedElementIndex, a3);
}

- (NSNumber)defaultSelectedElementIndex
{
  return self->_defaultSelectedElementIndex;
}

- (void)setDefaultSelectedElementIndex:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSelectedElementIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSelectedElementIndex, 0);
  objc_storeStrong((id *)&self->_selectedElementIndex, 0);
  objc_storeStrong((id *)&self->_sorts, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
