@implementation PUPickerCompoundFilter

- (PUPickerCompoundFilter)initWithFilterType:(int64_t)a3 subfilters:(id)a4
{
  id v7;
  void *v8;
  PUPickerCompoundFilter *v9;
  PUPickerCompoundFilter *v10;
  PUPickerCompoundFilter *v11;
  PUPickerCompoundFilter *v12;
  PUPickerCompoundFilter *v14;
  SEL v15;
  id v16;
  objc_super v17;

  v7 = a4;
  if (!v7)
  {
    _PFAssertFailHandler();
    goto LABEL_10;
  }
  v8 = v7;
  if (!objc_msgSend(v7, "count"))
  {
LABEL_10:
    v14 = (PUPickerCompoundFilter *)_PFAssertFailHandler();
    return (PUPickerCompoundFilter *)-[PUPickerCompoundFilter isEqual:](v14, v15, v16);
  }
  v17.receiver = self;
  v17.super_class = (Class)PUPickerCompoundFilter;
  v9 = -[PUPickerCompoundFilter init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_filterType = a3;
    objc_storeStrong((id *)&v9->_subfilters, a4);
  }
  if (-[PUPickerCompoundFilter isValidFilter](v10, "isValidFilter"))
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  PUPickerCompoundFilter *v4;
  PUPickerCompoundFilter *v5;
  objc_class *v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;
  objc_class *v12;
  objc_class *v13;
  PUPickerCompoundFilter *v14;
  SEL v15;

  v4 = (PUPickerCompoundFilter *)a3;
  if (self == v4)
  {
    v10 = 1;
LABEL_14:

    return v10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_14;
  }
  v5 = v4;
  v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PUPickerCompoundFilter filterType](self, "filterType");
      if (v7 == -[PUPickerCompoundFilter filterType](v5, "filterType"))
      {
        -[PUPickerCompoundFilter subfilters](self, "subfilters");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPickerCompoundFilter subfilters](v5, "subfilters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v9)
          v10 = 1;
        else
          v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

      goto LABEL_14;
    }
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  v14 = (PUPickerCompoundFilter *)_PFAssertFailHandler();
  return -[PUPickerCompoundFilter hash](v14, v15);
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[PUPickerCompoundFilter filterType](self, "filterType");
  -[PUPickerCompoundFilter subfilters](self, "subfilters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + 193 * v3 + 37249;

  return v5;
}

- (BOOL)isValidFilter
{
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = -[PUPickerCompoundFilter filterType](self, "filterType");
  v4 = v3 < 3;
  if (v3 >= 3)
  {
    v5 = v3;
    PLPickerGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v5;
      _os_log_impl(&dword_20D1E2000, v6, OS_LOG_TYPE_ERROR, "PUPickerCompoundFilter: invalid filter type: %ld", buf, 0xCu);
    }

  }
  -[PUPickerCompoundFilter subfilters](self, "subfilters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    PLPickerGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134217984;
      v24 = v9;
      _os_log_impl(&dword_20D1E2000, v8, OS_LOG_TYPE_ERROR, "PUPickerCompoundFilter: invalid subfilters count: %lu", buf, 0xCu);
    }

    v4 = 0;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isValidFilter", (_QWORD)v18) & 1) == 0)
        {
          PLPickerGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v24 = (unint64_t)v15;
            _os_log_impl(&dword_20D1E2000, v16, OS_LOG_TYPE_ERROR, "PUPickerCompoundFilter: invalid subfilter: %@", buf, 0xCu);
          }

          v4 = 0;
          goto LABEL_21;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_21:

  return v4;
}

- (BOOL)allowsSearchSuggestions
{
  int64_t v3;
  void *v4;
  char v5;
  int v7;
  void *v8;

  v3 = -[PUPickerCompoundFilter filterType](self, "filterType");
  switch(v3)
  {
    case 2:
      LOBYTE(v7) = 1;
      break;
    case 1:
      -[PUPickerCompoundFilter subfilters](self, "subfilters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = PFExists() ^ 1;

      break;
    case 0:
      -[PUPickerCompoundFilter subfilters](self, "subfilters");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = PFExists();

      return v5;
    default:
      LOBYTE(v7) = 0;
      break;
  }
  return v7;
}

- (BOOL)allowsAlbums
{
  int64_t v3;
  void *v4;
  char v5;
  int v7;
  void *v8;

  v3 = -[PUPickerCompoundFilter filterType](self, "filterType");
  switch(v3)
  {
    case 2:
      LOBYTE(v7) = 1;
      break;
    case 1:
      -[PUPickerCompoundFilter subfilters](self, "subfilters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = PFExists() ^ 1;

      break;
    case 0:
      -[PUPickerCompoundFilter subfilters](self, "subfilters");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = PFExists();

      return v5;
    default:
      LOBYTE(v7) = 0;
      break;
  }
  return v7;
}

- (BOOL)containsFilter:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[PUPickerCompoundFilter isEqual:](self, "isEqual:", v4))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[PUPickerCompoundFilter subfilters](self, "subfilters", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "containsFilter:", v4) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v5;
}

- (id)generatedAssetPredicate
{
  void *v3;
  void *v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[PUPickerCompoundFilter subfilters](self, "subfilters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PFMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PUPickerCompoundFilter filterType](self, "filterType");
  if (v5 == 2)
  {
    v7 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDD14C0], "orPredicateWithSubpredicates:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notPredicateWithSubpredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v5 == 1)
    {
      objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v5)
      {
        v9 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x24BDD14C0], "orPredicateWithSubpredicates:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v6;
  }
LABEL_9:

  return v9;
}

- (unint64_t)generatedPossibleAssetTypes
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t k;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = -[PUPickerCompoundFilter filterType](self, "filterType");
  switch(v3)
  {
    case 2:
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[PUPickerCompoundFilter subfilters](self, "subfilters", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v4);
            v12 |= objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "generatedRequiredAssetTypes");
          }
          v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
        }
        while (v11);
        v7 = ~v12 & 0x1FFFELL;
        goto LABEL_31;
      }
LABEL_29:
      v7 = 131070;
LABEL_31:

      return v7;
    case 1:
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[PUPickerCompoundFilter subfilters](self, "subfilters");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v25;
        v7 = 131070;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v4);
            v7 &= objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "generatedPossibleAssetTypes");
          }
          v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        }
        while (v16);
        goto LABEL_31;
      }
      goto LABEL_29;
    case 0:
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[PUPickerCompoundFilter subfilters](self, "subfilters");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v5)
      {
        v6 = v5;
        v7 = 0;
        v8 = *(_QWORD *)v29;
        do
        {
          for (k = 0; k != v6; ++k)
          {
            if (*(_QWORD *)v29 != v8)
              objc_enumerationMutation(v4);
            v7 |= objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * k), "generatedPossibleAssetTypes");
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v6);
      }
      else
      {
        v7 = 0;
      }
      goto LABEL_31;
  }
  return 0;
}

- (unint64_t)generatedRequiredAssetTypes
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t k;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = -[PUPickerCompoundFilter filterType](self, "filterType");
  switch(v3)
  {
    case 2:
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[PUPickerCompoundFilter subfilters](self, "subfilters", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v4);
            v12 |= objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "generatedPossibleAssetTypes");
          }
          v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
        }
        while (v11);
        v7 = ~v12 & 0x1FFFELL;
        goto LABEL_31;
      }
LABEL_29:
      v7 = 131070;
LABEL_31:

      return v7;
    case 1:
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[PUPickerCompoundFilter subfilters](self, "subfilters");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v25;
        v7 = 131070;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v4);
            v7 &= objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "generatedRequiredAssetTypes");
          }
          v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        }
        while (v16);
        goto LABEL_31;
      }
      goto LABEL_29;
    case 0:
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[PUPickerCompoundFilter subfilters](self, "subfilters");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v5)
      {
        v6 = v5;
        v7 = 0;
        v8 = *(_QWORD *)v29;
        do
        {
          for (k = 0; k != v6; ++k)
          {
            if (*(_QWORD *)v29 != v8)
              objc_enumerationMutation(v4);
            v7 |= objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * k), "generatedRequiredAssetTypes");
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v6);
      }
      else
      {
        v7 = 0;
      }
      goto LABEL_31;
  }
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  PUPickerCompoundFilter *v7;

  v4 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[PUPickerCompoundFilter subfilters](self, "subfilters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:copyItems:", v5, 1);

  v7 = -[PUPickerCompoundFilter initWithFilterType:subfilters:]([PUPickerCompoundFilter alloc], "initWithFilterType:subfilters:", -[PUPickerCompoundFilter filterType](self, "filterType"), v6);
  return v7;
}

- (PUPickerCompoundFilter)initWithCoder:(id)a3
{
  id v4;
  PUPickerCompoundFilter *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *subfilters;
  PUPickerCompoundFilter *v11;
  PUPickerCompoundFilter *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUPickerCompoundFilter;
  v5 = -[PUPickerCompoundFilter init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PUPickerCompoundFilterDictionaryFilterTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_filterType = objc_msgSend(v6, "integerValue");

    PUPickerFilterAvailableClasses();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObject:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("PUPickerCompoundFilterDictionarySubfiltersKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    subfilters = v5->_subfilters;
    v5->_subfilters = (NSArray *)v9;

  }
  if (-[PUPickerCompoundFilter isValidFilter](v5, "isValidFilter"))
    v11 = v5;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[PUPickerCompoundFilter filterType](self, "filterType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("PUPickerCompoundFilterDictionaryFilterTypeKey"));

  -[PUPickerCompoundFilter subfilters](self, "subfilters");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("PUPickerCompoundFilterDictionarySubfiltersKey"));

}

- (int64_t)filterType
{
  return self->_filterType;
}

- (NSArray)subfilters
{
  return self->_subfilters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subfilters, 0);
}

uint64_t __49__PUPickerCompoundFilter_generatedAssetPredicate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "generatedAssetPredicate");
}

uint64_t __38__PUPickerCompoundFilter_allowsAlbums__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allowsAlbums") ^ 1;
}

uint64_t __38__PUPickerCompoundFilter_allowsAlbums__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allowsAlbums");
}

uint64_t __49__PUPickerCompoundFilter_allowsSearchSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allowsSearchSuggestions") ^ 1;
}

uint64_t __49__PUPickerCompoundFilter_allowsSearchSuggestions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allowsSearchSuggestions");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
