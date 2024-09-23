@implementation GEOSearchCategory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOSearchCategory)initWithBrowseCategory:(id)a3
{
  id *v5;
  GEOSearchCategory *v6;
  GEOSearchCategory *v7;
  id v8;
  NSArray *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  GEOSearchCategory *v16;
  GEOSearchCategory *v17;
  NSArray *subcategories;
  GEOSearchCategory *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  v25.receiver = self;
  v25.super_class = (Class)GEOSearchCategory;
  v6 = -[GEOSearchCategory init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_browseCategory, a3);
    if (v5)
    {
      -[GEOPDBrowseCategory _readSubCategorys]((uint64_t)v5);
      if (objc_msgSend(v5[7], "count"))
      {
        v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
        -[GEOPDBrowseCategory _readSubCategorys]((uint64_t)v5);
        v9 = (NSArray *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v5[7], "count"));
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        -[GEOPDBrowseCategory subCategorys](v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
              v16 = [GEOSearchCategory alloc];
              v17 = -[GEOSearchCategory initWithBrowseCategory:](v16, "initWithBrowseCategory:", v15, (_QWORD)v21);
              if (v17)
                -[NSArray addObject:](v9, "addObject:", v17);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          }
          while (v12);
        }

        subcategories = v7->_subcategories;
        v7->_subcategories = v9;

      }
    }
    v19 = v7;
  }

  return v7;
}

- (GEOSearchCategory)initWithAutocompleteEntry:(id)a3
{
  id v5;
  GEOSearchCategory *v6;
  GEOSearchCategory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOSearchCategory;
  v6 = -[GEOSearchCategory init](&v9, sel_init);
  if (v6 && objc_msgSend(v5, "type") == 3 && objc_msgSend(v5, "hasCategory"))
  {
    objc_storeStrong((id *)&v6->_autocompleteEntry, a3);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (GEOSearchCategory)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  GEOSearchCategoryStorage *v6;
  GEOSearchCategory *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CategoryStorage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[GEOSearchCategoryStorage initWithData:]([GEOSearchCategoryStorage alloc], "initWithData:", v5);
    self = -[GEOSearchCategory initWithStorage:](self, "initWithStorage:", v6);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  GEOSearchCategoryStorage *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[GEOSearchCategoryStorage initWithSearchCategory:]([GEOSearchCategoryStorage alloc], "initWithSearchCategory:", self);
  -[GEOSearchCategoryStorage data](v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("CategoryStorage"));

}

- (BOOL)isEqual:(id)a3
{
  GEOSearchCategory *v4;
  BOOL v5;

  v4 = (GEOSearchCategory *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[GEOPDBrowseCategory isEqual:](self->_browseCategory, "isEqual:", v4->_browseCategory);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[GEOPDBrowseCategory hash](self->_browseCategory, "hash");
}

- (NSString)displayString
{
  GEOPDAutocompleteEntry *autocompleteEntry;
  void *v4;
  void *v5;
  void *v6;

  autocompleteEntry = self->_autocompleteEntry;
  if (autocompleteEntry)
  {
    -[GEOPDAutocompleteEntry category](autocompleteEntry, "category");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[GEOPDBrowseCategory displayString]((id *)&self->_browseCategory->super.super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (NSString)shortDisplayString
{
  GEOPDBrowseCategory *browseCategory;
  void *v4;

  browseCategory = self->_browseCategory;
  if (browseCategory
    && (-[GEOPDBrowseCategory _readShortDisplayString]((uint64_t)self->_browseCategory),
        browseCategory->_shortDisplayString))
  {
    -[GEOPDBrowseCategory shortDisplayString]((id *)&self->_browseCategory->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GEOSearchCategory displayString](self, "displayString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (NSString)popularTokenString
{
  GEOPDBrowseCategory *browseCategory;
  void *v4;

  browseCategory = self->_browseCategory;
  if (browseCategory
    && (-[GEOPDBrowseCategory _readPopularDisplayToken]((uint64_t)self->_browseCategory),
        browseCategory->_popularDisplayToken))
  {
    -[GEOPDBrowseCategory popularDisplayToken]((id *)&self->_browseCategory->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GEOSearchCategory displayString](self, "displayString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (NSData)_suggestionEntryMetadata
{
  GEOPDAutocompleteEntry *autocompleteEntry;
  void *v4;
  void *v5;

  autocompleteEntry = self->_autocompleteEntry;
  if (autocompleteEntry)
  {
    -[GEOPDAutocompleteEntry category](autocompleteEntry, "category");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionEntryMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[GEOPDBrowseCategory suggestionEntryMetadata]((id *)&self->_browseCategory->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)v5;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  GEOPDAutocompleteEntry *autocompleteEntry;
  void *v4;
  void *v5;
  GEOFeatureStyleAttributes *v6;

  autocompleteEntry = self->_autocompleteEntry;
  if (!autocompleteEntry)
  {
    -[GEOPDBrowseCategory styleAttributes]((id *)&self->_browseCategory->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  -[GEOPDAutocompleteEntry category](autocompleteEntry, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_5;
LABEL_3:
  v6 = -[GEOFeatureStyleAttributes initWithPlaceDataStyleAttributes:]([GEOFeatureStyleAttributes alloc], "initWithPlaceDataStyleAttributes:", v5);
LABEL_6:

  return v6;
}

- (GEOVenueIdentifier)venueIdentifier
{
  void *v3;
  void *v4;
  GEOVenueIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  GEOVenueIdentifier *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[GEOPDAutocompleteEntry category](self->_autocompleteEntry, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "venueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return (GEOVenueIdentifier *)0;
  v5 = [GEOVenueIdentifier alloc];
  -[GEOPDAutocompleteEntry category](self->_autocompleteEntry, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "venueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GEOVenueIdentifier initWithVenueIdentifiers:](v5, "initWithVenueIdentifiers:", v8);

  return v9;
}

- (NSURL)mapsURL
{
  GEOPDBrowseCategory *browseCategory;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  browseCategory = self->_browseCategory;
  if (browseCategory)
  {
    -[GEOPDBrowseCategory data](browseCategory, "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-maps-category://?category=%@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSURL *)v6;
}

+ (id)categoryForURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  GEOUserSessionEntity *v17;
  void *v18;
  void *v19;
  void *v20;
  GEOPDBrowseCategory *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v3;
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "resourceSpecifier");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v25 = v4;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("&"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v12, "count") >= 2)
        {
          objc_msgSend(v12, "subarrayWithRange:", 1, objc_msgSend(v12, "count") - 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "componentsJoinedByString:", CFSTR("="));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("user_session_entity"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = -[GEOUserSessionEntity initWithSessionEntityString:]([GEOUserSessionEntity alloc], "initWithSessionEntityString:", v16);
    +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMapsUserSessionEntity:", v17);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v19, 0);
    if (v20)
    {
      v21 = -[GEOPDBrowseCategory initWithData:]([GEOPDBrowseCategory alloc], "initWithData:", v20);
      if (v21)
        v22 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBrowseCategory:", v21);
      else
        v22 = 0;
      v23 = v25;

    }
    else
    {
      v22 = 0;
      v23 = v25;
    }

  }
  else
  {
    v22 = 0;
    v23 = v25;
  }

  return v22;
}

- (id)_browseCategory
{
  return self->_browseCategory;
}

- (int)displayMode
{
  int v2;
  int v3;

  v2 = -[GEOPDBrowseCategory displayMode]((uint64_t)self->_browseCategory);
  if (v2 == 2)
    v3 = 2;
  else
    v3 = 1;
  if (v2)
    return v3;
  else
    return 0;
}

- (int)sortOrder
{
  int v2;
  int v3;

  v2 = -[GEOPDBrowseCategory sortOrder]((uint64_t)self->_browseCategory);
  if (v2 == 2)
    v3 = 2;
  else
    v3 = 1;
  if (v2)
    return v3;
  else
    return 0;
}

- (int)subCategoryType
{
  int v2;
  int v3;

  v2 = -[GEOPDBrowseCategory subCategoryType]((uint64_t)self->_browseCategory);
  if (v2 == 2)
    v3 = 2;
  else
    v3 = 1;
  if (v2)
    return v3;
  else
    return 0;
}

- (BOOL)isSubCategorySameAsTopLevel
{
  GEOPDBrowseCategory *browseCategory;

  browseCategory = self->_browseCategory;
  return browseCategory && browseCategory->_isSubCategorySameAsTopLevel;
}

- (GEOPDAutocompleteEntry)_autocompleteEntry
{
  return self->_autocompleteEntry;
}

- (NSArray)subcategories
{
  return self->_subcategories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcategories, 0);
  objc_storeStrong((id *)&self->_autocompleteEntry, 0);
  objc_storeStrong((id *)&self->_browseCategory, 0);
}

- (GEOSearchCategory)initWithStorage:(id)a3
{
  id v4;
  void *v5;
  GEOSearchCategory *v6;
  GEOSearchCategory *v7;

  v4 = a3;
  if (objc_msgSend(v4, "hasBrowseCategory"))
  {
    objc_msgSend(v4, "browseCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[GEOSearchCategory initWithBrowseCategory:](self, "initWithBrowseCategory:", v5);
  }
  else
  {
    objc_msgSend(v4, "autocompleteEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[GEOSearchCategory initWithAutocompleteEntry:](self, "initWithAutocompleteEntry:", v5);
  }
  v7 = v6;

  return v7;
}

+ (void)sendFeedbackForVisibleCategories:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_suggestionEntryMetadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          if (!v6)
            v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
          objc_msgSend(v6, "addObject:", v9);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_lock_with_options();
  v10 = (void *)qword_1ECDBC258;
  qword_1ECDBC258 = (uint64_t)v6;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_259);
}

- (id)serverMetadata
{
  id v3;
  GEOMapsServerMetadata *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock_with_options();
  v3 = (id)qword_1ECDBC258;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_259);
  v4 = objc_alloc_init(GEOMapsServerMetadata);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[GEOMapsServerMetadata addSuggestionEntryMetadataDisplayed:](v4, "addSuggestionEntryMetadataDisplayed:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), (_QWORD)v12);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[GEOSearchCategory _suggestionEntryMetadata](self, "_suggestionEntryMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapsServerMetadata setSuggestionEntryMetadataTappedOn:](v4, "setSuggestionEntryMetadataTappedOn:", v10);

  return v4;
}

@end
