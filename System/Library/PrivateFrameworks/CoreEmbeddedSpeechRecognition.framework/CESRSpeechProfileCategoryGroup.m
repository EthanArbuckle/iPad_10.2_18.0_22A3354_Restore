@implementation CESRSpeechProfileCategoryGroup

- (CESRSpeechProfileCategoryGroup)initWithItemTypes:(id)a3 speechCategories:(id)a4
{
  id v7;
  id v8;
  CESRSpeechProfileCategoryGroup *v9;
  CESRSpeechProfileCategoryGroup *v10;
  CESRSpeechProfileCategoryGroup *v11;
  void *v12;
  NSObject *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CESRSpeechProfileCategoryGroup;
  v9 = -[CESRSpeechProfileCategoryGroup init](&v16, sel_init);
  v10 = v9;
  if (!v9
    || (objc_storeStrong((id *)&v9->_itemTypes, a3), objc_storeStrong((id *)&v10->_speechCategories, a4),
                                                     v10->_itemTypes)
    && v10->_speechCategories)
  {
    v11 = v10;
  }
  else
  {
    v12 = (void *)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v14 = v12;
      -[CESRSpeechProfileCategoryGroup description](v10, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v18 = "-[CESRSpeechProfileCategoryGroup initWithItemTypes:speechCategories:]";
      v19 = 2112;
      v20 = v15;
      _os_log_error_impl(&dword_1B3E5F000, v14, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);

    }
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  NSSet *v4;
  void *v5;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = self->_itemTypes;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSSet count](v4, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "unsignedShortValue");
        objc_msgSend(MEMORY[0x1E0D3E4C0], "descriptionForTypeIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _speechCategoriesDescription(self->_speechCategories);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{itemTypes: [%@], speechCategories: [%@]}"), v13, v14, (_QWORD)v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)speechCategoriesDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  _speechCategoriesDescription(self->_speechCategories);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[%@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CESRSpeechProfileCategoryGroup *v4;
  CESRSpeechProfileCategoryGroup *v5;
  BOOL v6;

  v4 = (CESRSpeechProfileCategoryGroup *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CESRSpeechProfileCategoryGroup isEqualToSpeechCategoryGroup:](self, "isEqualToSpeechCategoryGroup:", v5);

  return v6;
}

- (BOOL)isEqualToSpeechCategoryGroup:(id)a3
{
  id v4;
  NSSet *itemTypes;
  void *v6;
  NSSet *speechCategories;
  void *v8;
  char v9;

  v4 = a3;
  itemTypes = self->_itemTypes;
  objc_msgSend(v4, "itemTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSSet isEqual:](itemTypes, "isEqual:", v6))
  {
    speechCategories = self->_speechCategories;
    objc_msgSend(v4, "speechCategories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSSet isEqual:](speechCategories, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSSet hash](self->_itemTypes, "hash");
  return -[NSSet hash](self->_speechCategories, "hash") ^ v3;
}

- (NSSet)itemTypes
{
  return self->_itemTypes;
}

- (NSSet)speechCategories
{
  return self->_speechCategories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechCategories, 0);
  objc_storeStrong((id *)&self->_itemTypes, 0);
}

+ (void)_buildCachesFromBaseMap:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)speechCategoryToItemTypeCache;
  speechCategoryToItemTypeCache = v4;

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = (void *)itemTypeToSpeechCategoryCache;
  itemTypeToSpeechCategoryCache = (uint64_t)v6;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v32;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(obj);
        v25 = v8;
        v9 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v8);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v3, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
        if (v11)
        {
          v12 = v11;
          v13 = 0;
          v14 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v28 != v14)
                objc_enumerationMutation(v10);
              v16 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "unsignedShortValue");
              v26 = 0;
              v17 = objc_msgSend(MEMORY[0x1E0D3E4C0], "itemTypeForFieldType:error:", v16, &v26);
              v18 = v26;
              if ((_DWORD)v17)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v17);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v13)
                {
                  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                  objc_msgSend((id)speechCategoryToItemTypeCache, "setObject:forKey:", v13, v9);
                }
                objc_msgSend(v13, "addObject:", v19);
                objc_msgSend((id)itemTypeToSpeechCategoryCache, "objectForKey:", v19);
                v20 = (id)objc_claimAutoreleasedReturnValue();
                if (!v20)
                {
                  v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                  objc_msgSend((id)itemTypeToSpeechCategoryCache, "setObject:forKey:", v20, v19);
                }
                objc_msgSend(v20, "addObject:", v9);

              }
              else
              {
                v21 = *MEMORY[0x1E0CFE6C0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v36 = "+[CESRSpeechProfileCategoryGroup _buildCachesFromBaseMap:]";
                  v37 = 2112;
                  v38 = v18;
                  _os_log_error_impl(&dword_1B3E5F000, v21, OS_LOG_TYPE_ERROR, "%s Failed to resolve item type for field type, error: %@", buf, 0x16u);
                }
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
          }
          while (v12);
        }
        else
        {
          v13 = 0;
        }

        v8 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v24);
  }

}

+ (void)_buildCaches
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CESRSpeechProfileCategoryGroup__buildCaches__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_buildCaches_onceToken != -1)
    dispatch_once(&_buildCaches_onceToken, block);
}

+ (id)groupForSets:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v20;
  id obj;
  id v22;
  uint64_t v23;
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
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = a1;
  objc_msgSend((id)objc_opt_class(), "_buildCaches");
  v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v23 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v8), "itemType", v20));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)itemTypeToSpeechCategoryCache, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[CESRSpeechProfileCategoryGroup _addAssociatedSpeechCategories:](CESRSpeechProfileCategoryGroup, "_addAssociatedSpeechCategories:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(v22, "unionSet:", v11);
          objc_msgSend(v5, "addObject:", v9);
        }
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v25;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v25 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend((id)speechCategoryToItemTypeCache, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
                objc_msgSend(v5, "unionSet:", v17);

              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v14);
        }

        ++v8;
      }
      while (v8 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }

  v18 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithItemTypes:speechCategories:", v5, v22);
  return v18;
}

+ (id)groupForSpeechCategories:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_buildCaches");
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[CESRSpeechProfileCategoryGroup _addAssociatedSpeechCategories:](CESRSpeechProfileCategoryGroup, "_addAssociatedSpeechCategories:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend((id)speechCategoryToItemTypeCache, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10), (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v8);
  }

  if (!objc_msgSend(v4, "count"))
  {
    v12 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CESRSpeechProfileCategoryGroup groupForSpeechCategories:]";
      v22 = 2112;
      v23 = v6;
      _os_log_error_impl(&dword_1B3E5F000, v12, OS_LOG_TYPE_ERROR, "%s Categories (%@) matched no item types", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "set", (_QWORD)v16);
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v13;
  }
  v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithItemTypes:speechCategories:", v4, v6);

  return v14;
}

+ (id)_addAssociatedSpeechCategories:(id)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", CFSTR("\\NT-contact")) & 1) != 0
    || objc_msgSend(v3, "containsObject:", CFSTR("\\NT-appcontact")))
  {
    objc_msgSend(v3, "addObject:", CFSTR("\\NT-contact"));
    objc_msgSend(v3, "addObject:", CFSTR("\\NT-appcontact"));
  }
  return v3;
}

+ (id)all
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CESRSpeechProfileCategoryGroup_all__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (all_onceToken != -1)
    dispatch_once(&all_onceToken, block);
  return (id)all_all;
}

+ (id)_all
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend((id)objc_opt_class(), "_buildCaches");
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)speechCategoryToItemTypeCache, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)itemTypeToSpeechCategoryCache, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithItemTypes:speechCategories:", v7, v4);
  return v8;
}

+ (id)mergeGroups:(id)a3
{
  id v3;
  CESRSpeechProfileCategoryGroup *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
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
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (CESRSpeechProfileCategoryGroup *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "itemTypes", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "allObjects");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v14);

          objc_msgSend(v12, "speechCategories");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "allObjects");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v16);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v4 = -[CESRSpeechProfileCategoryGroup initWithItemTypes:speechCategories:]([CESRSpeechProfileCategoryGroup alloc], "initWithItemTypes:speechCategories:", v5, v6);
  }

  return v4;
}

void __37__CESRSpeechProfileCategoryGroup_all__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend((id)objc_opt_class(), "_all");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)all_all;
  all_all = v0;

}

void __46__CESRSpeechProfileCategoryGroup__buildCaches__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)objc_opt_class();
  +[CESRSpeechProfileBuilder categoryToFieldTypeMap](CESRSpeechProfileBuilder, "categoryToFieldTypeMap");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_buildCachesFromBaseMap:", v1);

}

@end
