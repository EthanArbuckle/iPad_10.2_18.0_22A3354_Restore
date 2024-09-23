@implementation DDSAttributeFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
}

- (void)addAllowedValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  if (a3)
  {
    v6 = a3;
    -[DDSAttributeFilter _setForKey:](self, "_setForKey:", a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v6);

  }
}

+ (id)attributeFilter
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (DDS_LOG_REDACTED())
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[DDSAttributeFilter filters](self, "filters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<filter: %@>"), v4);
  }
  else
  {
    -[DDSAttributeFilter filters](self, "filters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v4, "objectForKey:", CFSTR("AssetRegion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("<redacted>"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("AssetRegion"));

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<filter: %@>"), v4);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (DDSAttributeFilter)initWithDictionary:(id)a3
{
  id v4;
  DDSAttributeFilter *v5;
  uint64_t v6;
  NSMutableDictionary *filters;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDSAttributeFilter;
  v5 = -[DDSAttributeFilter init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    filters = v5->_filters;
    v5->_filters = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_opt_class();
  -[DDSAttributeFilter filters](self, "filters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hashObject:", v4);

  return v5;
}

- (id)_setForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[DDSAttributeFilter filters](self, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSAttributeFilter filters](self, "filters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v4);

  }
  return v6;
}

- (NSMutableDictionary)filters
{
  return self->_filters;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DDSAttributeFilter *v4;
  void *v5;
  void *v6;
  DDSAttributeFilter *v7;

  v4 = [DDSAttributeFilter alloc];
  -[DDSAttributeFilter filters](self, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = -[DDSAttributeFilter initWithDictionary:](v4, "initWithDictionary:", v6);

  return v7;
}

+ (unint64_t)hashSet:(id)a3
{
  unint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = 77239;
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 *= objc_msgSend((id)objc_opt_class(), "hashObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

void __37__DDSAttributeFilter_hashDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v6 = a3;
  v7 = a2;
  v8 = objc_msgSend((id)objc_opt_class(), "hashObject:", v7);

  v9 = objc_msgSend((id)objc_opt_class(), "hashObject:", v6);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8 * v5 * v9;
}

+ (unint64_t)hashObject:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend((id)objc_opt_class(), "hashDictionary:", v3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = objc_msgSend((id)objc_opt_class(), "hashSet:", v3);
    else
      v4 = objc_msgSend(v3, "hash");
  }
  if (v4)
    v5 = 57097 * v4;
  else
    v5 = 0x1A2CCD34BLL;

  return v5;
}

+ (unint64_t)hashDictionary:(id)a3
{
  id v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 65537;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__DDSAttributeFilter_hashDictionary___block_invoke;
  v7[3] = &unk_1EA141470;
  v7[4] = &v8;
  v7[5] = a1;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (id)attributeFilterWithDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

- (DDSAttributeFilter)init
{

  return 0;
}

- (id)allowedValuesForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DDSAttributeFilter filters](self, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enumerateAllowedValuesAndKeys:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[DDSAttributeFilter filters](self, "filters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__DDSAttributeFilter_enumerateAllowedValuesAndKeys___block_invoke;
    v6[3] = &unk_1EA1413D0;
    v7 = v5;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
}

uint64_t __52__DDSAttributeFilter_enumerateAllowedValuesAndKeys___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addEntriesFromFilter:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__DDSAttributeFilter_addEntriesFromFilter___block_invoke;
  v3[3] = &unk_1EA1413F8;
  v3[4] = self;
  objc_msgSend(a3, "enumerateAllowedValuesAndKeys:", v3);
}

uint64_t __43__DDSAttributeFilter_addEntriesFromFilter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAllowedValues:forKey:", a3, a2);
}

- (id)entriesMatchingAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__DDSAttributeFilter_entriesMatchingAttributes___block_invoke;
  v11[3] = &unk_1EA141420;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  -[DDSAttributeFilter enumerateAllowedValuesAndKeys:](self, "enumerateAllowedValuesAndKeys:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

void __48__DDSAttributeFilter_entriesMatchingAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "containsObject:", v7);

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v8);

}

- (BOOL)doesContainAttributes:(id)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__DDSAttributeFilter_doesContainAttributes___block_invoke;
  v6[3] = &unk_1EA141448;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

void __44__DDSAttributeFilter_doesContainAttributes___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "allowedValuesForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || (objc_msgSend(v7, "containsObject:", v9) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (void)addAllowedValues:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "count"))
  {
    -[DDSAttributeFilter _setForKey:](self, "_setForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", v8);

  }
}

- (void)removeAllowedValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  if (a3)
  {
    v6 = a3;
    -[DDSAttributeFilter _setForKey:](self, "_setForKey:", a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v6);

  }
}

- (void)removeAllowedValues:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "count"))
  {
    -[DDSAttributeFilter _setForKey:](self, "_setForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minusSet:", v8);

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DDSAttributeFilter filters](self, "filters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_filters);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (DDSAttributeFilter)initWithCoder:(id)a3
{
  id v4;
  DDSAttributeFilter *v5;
  DDSAttributeFilter *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSMutableDictionary *filters;
  NSObject *v14;
  DDSAttributeFilter *v15;
  id v17;
  objc_super v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DDSAttributeFilter;
  v5 = -[DDSAttributeFilter init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromSelector(sel_filters);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v9, v10, &v17);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v17;
    filters = v5->_filters;
    v5->_filters = (NSMutableDictionary *)v11;

    v6 = v5;
    if (v12)
    {
      DefaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[DDSAttributeFilter initWithCoder:].cold.1(sel_filters, v14);

      v6 = 0;
    }

  }
  v15 = v6;

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dumpDescription
{
  void *v3;
  void *v4;
  __CFString *v5;

  if (DDS_IS_INTERNAL_INSTALL())
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[DDSAttributeFilter filters](self, "filters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<filter: %@>"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1EA1420B0;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[DDSAttributeFilter isEqualToQueryFilter:](self, "isEqualToQueryFilter:", v4);

  return v5;
}

- (BOOL)isEqualToQueryFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DDSAttributeFilter filters](self, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = DDSObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6);
  return (char)v4;
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);
}

- (void)initWithCoder:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1DA990000, a2, OS_LOG_TYPE_ERROR, "Error decoding object for key %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
