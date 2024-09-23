@implementation GEOResultRefinementMultiSelect

- (GEOResultRefinementMultiSelect)initWithDisplayName:(id)a3 multiSelect:(id)a4 maximumNumberOfSelectElements:(unsigned int)a5 clauseType:(int64_t)a6 showEqualWidthButtonsOnFilterView:(BOOL)a7 displayNameForMultiSelected:(id)a8 multiSelectIdentifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  GEOResultRefinementMultiSelect *v20;
  GEOResultRefinementMultiSelect *v21;
  uint64_t v22;
  NSString *displayName;
  uint64_t v24;
  NSArray *multiSelect;
  uint64_t v26;
  NSString *displayNameForMultiSelected;
  uint64_t v28;
  NSString *multiSelectIdentifier;
  objc_super v31;

  v15 = a3;
  v16 = a4;
  v17 = a8;
  v18 = a9;
  v19 = objc_msgSend(v16, "count");
  v20 = 0;
  if (a5 && v19)
  {
    v31.receiver = self;
    v31.super_class = (Class)GEOResultRefinementMultiSelect;
    v21 = -[GEOResultRefinementMultiSelect init](&v31, sel_init);
    if (v21)
    {
      v22 = objc_msgSend(v15, "copy");
      displayName = v21->_displayName;
      v21->_displayName = (NSString *)v22;

      v24 = objc_msgSend(v16, "copy");
      multiSelect = v21->_multiSelect;
      v21->_multiSelect = (NSArray *)v24;

      v21->_maximumNumberOfSelectElements = a5;
      v21->_clauseType = a6;
      v21->_showEqualWidthButtonsOnFilterView = a7;
      v26 = objc_msgSend(v17, "copy");
      displayNameForMultiSelected = v21->_displayNameForMultiSelected;
      v21->_displayNameForMultiSelected = (NSString *)v26;

      v28 = objc_msgSend(v18, "copy");
      multiSelectIdentifier = v21->_multiSelectIdentifier;
      v21->_multiSelectIdentifier = (NSString *)v28;

    }
    self = v21;
    v20 = self;
  }

  return v20;
}

- (GEOResultRefinementMultiSelect)initWithResultRefinementMultiSelect:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  GEOResultRefinementMultiSelect *v13;

  v4 = (id *)a3;
  -[GEOPDResultRefinementMultiSelect multiSelects](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_geo_compactMap:", &__block_literal_global_199);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[GEOPDResultRefinementMultiSelect clauseType]((uint64_t)v4);
  -[GEOPDResultRefinementMultiSelect displayName](v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = *((unsigned int *)v4 + 18);
    v10 = *((_BYTE *)v4 + 76) != 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  -[GEOPDResultRefinementMultiSelect displayNameForMultiSelected](v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementMultiSelect multiSelectIdentifier](v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[GEOResultRefinementMultiSelect initWithDisplayName:multiSelect:maximumNumberOfSelectElements:clauseType:showEqualWidthButtonsOnFilterView:displayNameForMultiSelected:multiSelectIdentifier:](self, "initWithDisplayName:multiSelect:maximumNumberOfSelectElements:clauseType:showEqualWidthButtonsOnFilterView:displayNameForMultiSelected:multiSelectIdentifier:", v8, v6, v9, v7 == 1, v10, v11, v12);
  return v13;
}

GEOResultRefinementMultiSelectElement *__70__GEOResultRefinementMultiSelect_initWithResultRefinementMultiSelect___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEOResultRefinementMultiSelectElement *v3;

  v2 = a2;
  v3 = -[GEOResultRefinementMultiSelectElement initWithResultRefinementMultiSelectElement:]([GEOResultRefinementMultiSelectElement alloc], "initWithResultRefinementMultiSelectElement:", v2);

  return v3;
}

- (id)convertToGEOPDResultRefinementMultiSelect
{
  GEOPDResultRefinementMultiSelect *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unsigned int v11;
  _BOOL4 v12;
  BOOL v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(GEOPDResultRefinementMultiSelect);
  -[GEOResultRefinementMultiSelect displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementMultiSelect setDisplayName:]((uint64_t)v3, v4);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[GEOResultRefinementMultiSelect multiSelect](self, "multiSelect", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "convertToGEOPDResultRefinementMultiSelectElement");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDResultRefinementMultiSelect addMultiSelect:]((uint64_t)v3, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v11 = -[GEOResultRefinementMultiSelect maximumNumberOfSelectElements](self, "maximumNumberOfSelectElements");
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x100u;
    *(_WORD *)&v3->_flags |= 2u;
    v3->_maxNumSelectElements = v11;
    v12 = -[GEOResultRefinementMultiSelect clauseType](self, "clauseType") == 1;
    *(_WORD *)&v3->_flags |= 0x100u;
    *(_WORD *)&v3->_flags |= 1u;
    v3->_clauseType = v12;
    v13 = -[GEOResultRefinementMultiSelect showEqualWidthButtonsOnFilterView](self, "showEqualWidthButtonsOnFilterView");
    *(_WORD *)&v3->_flags |= 0x100u;
    *(_WORD *)&v3->_flags |= 4u;
    v3->_showEqualWidthButtonsOnFilterView = v13;
  }
  else
  {
    -[GEOResultRefinementMultiSelect clauseType](self, "clauseType");
    -[GEOResultRefinementMultiSelect showEqualWidthButtonsOnFilterView](self, "showEqualWidthButtonsOnFilterView");
  }
  -[GEOResultRefinementMultiSelect displayNameForMultiSelected](self, "displayNameForMultiSelected");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementMultiSelect setDisplayNameForMultiSelected:]((uint64_t)v3, v14);

  -[GEOResultRefinementMultiSelect multiSelectIdentifier](self, "multiSelectIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementMultiSelect setMultiSelectIdentifier:]((uint64_t)v3, v15);

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)multiSelect
{
  return self->_multiSelect;
}

- (void)setMultiSelect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)maximumNumberOfSelectElements
{
  return self->_maximumNumberOfSelectElements;
}

- (void)setMaximumNumberOfSelectElements:(unsigned int)a3
{
  self->_maximumNumberOfSelectElements = a3;
}

- (BOOL)showEqualWidthButtonsOnFilterView
{
  return self->_showEqualWidthButtonsOnFilterView;
}

- (int64_t)clauseType
{
  return self->_clauseType;
}

- (void)setClauseType:(int64_t)a3
{
  self->_clauseType = a3;
}

- (NSString)displayNameForMultiSelected
{
  return self->_displayNameForMultiSelected;
}

- (NSString)multiSelectIdentifier
{
  return self->_multiSelectIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiSelectIdentifier, 0);
  objc_storeStrong((id *)&self->_displayNameForMultiSelected, 0);
  objc_storeStrong((id *)&self->_multiSelect, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
