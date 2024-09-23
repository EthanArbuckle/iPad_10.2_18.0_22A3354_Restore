@implementation GEOPOIEventCategory

+ (id)poiEventCategoriesForEventCategories:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOPOIEventCategory *v11;
  GEOPOIEventCategory *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = [GEOPOIEventCategory alloc];
        v12 = -[GEOPOIEventCategory initWithEventCategory:](v11, "initWithEventCategory:", v10, (_QWORD)v16);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    v13 = v4;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOPOIEventCategory)init
{
  GEOPOIEventCategory *result;

  result = (GEOPOIEventCategory *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOPOIEventCategory)initWithEventCategory:(id)a3
{
  id *v4;
  GEOPOIEventCategory *v5;
  GEOPOIEventCategory *v6;
  uint64_t v7;
  NSString *category;
  void *v9;
  uint64_t v10;
  NSArray *localizedNames;
  objc_super v13;

  v4 = (id *)a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOPOIEventCategory;
  v5 = -[GEOPOIEventCategory init](&v13, sel_init);
  if (!v5)
    goto LABEL_6;
  if (v4 && (*((_BYTE *)v4 + 28) & 1) != 0)
  {
    _GEOSpatialEventLookupCategoryForPDCategory(*((_DWORD *)v4 + 6));
    v7 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v7;

    -[GEOPDEventCategory localizedCategorys](v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPOIEventCategory parsePDCategories:](v5, "parsePDCategories:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    localizedNames = v5->_localizedNames;
    v5->_localizedNames = (NSArray *)v10;

LABEL_6:
    v6 = v5;
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (GEOPOIEventCategory)initWithCategory:(id)a3 localizedNames:(id)a4
{
  id v7;
  id v8;
  GEOPOIEventCategory *v9;
  GEOPOIEventCategory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOPOIEventCategory;
  v9 = -[GEOPOIEventCategory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_category, a3);
    objc_storeStrong((id *)&v10->_localizedNames, a4);
  }

  return v10;
}

- (GEOPOIEventCategory)initWithCoder:(id)a3
{
  id v4;
  GEOPOIEventCategory *v5;
  uint64_t v6;
  NSString *category;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *localizedNames;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOPOIEventCategory;
  v5 = -[GEOPOIEventCategory init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEOPOIEventCategoryType"));
    v6 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v6;

    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("GEOPOIEventCategoryNames"));
    v11 = objc_claimAutoreleasedReturnValue();
    localizedNames = v5->_localizedNames;
    v5->_localizedNames = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *category;
  id v5;

  category = self->_category;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", category, CFSTR("GEOPOIEventCategoryType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedNames, CFSTR("GEOPOIEventCategoryNames"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[GEOPOIEventCategory isEqualToPOIEventCategory:](self, "isEqualToPOIEventCategory:", v4);

  return v5;
}

- (BOOL)isEqualToPOIEventCategory:(id)a3
{
  id v4;
  NSString *category;
  void *v6;
  NSArray *localizedNames;
  void *v8;
  BOOL v9;

  v4 = a3;
  category = self->_category;
  objc_msgSend(v4, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqual:](category, "isEqual:", v6))
  {
    localizedNames = self->_localizedNames;
    objc_msgSend(v4, "localizedNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSArray isEqualToArray:](localizedNames, "isEqualToArray:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)parsePDCategories:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
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
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "localizedNames", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "stringValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSString)category
{
  return self->_category;
}

- (NSArray)localizedNames
{
  return self->_localizedNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNames, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
