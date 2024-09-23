@implementation FCLocalAreasMapping

- (FCLocalAreasMapping)initWithData:(id)a3
{
  id v4;
  FCLocalAreasMapping *v5;
  FCLocalAreasMapping *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *regionMap;
  void *v13;
  uint64_t v14;
  NSArray *areas;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v28;
  void *v29;
  id v30;
  NSArray *obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  objc_super v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)FCLocalAreasMapping;
  v5 = -[FCLocalAreasMapping init](&v42, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v30 = v4;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v7, (uint64_t)CFSTR("regions"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", &__block_literal_global_132);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0C99D80];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __36__FCLocalAreasMapping_initWithData___block_invoke_2;
    v40[3] = &unk_1E463AA78;
    v28 = v9;
    v41 = v28;
    objc_msgSend(v10, "fc_dictionary:", v40);
    v11 = objc_claimAutoreleasedReturnValue();
    regionMap = v6->_regionMap;
    v6->_regionMap = (NSDictionary *)v11;

    v29 = v7;
    FCAppConfigurationArrayValueWithDefaultValue(v7, (uint64_t)CFSTR("areas"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fc_arrayByTransformingWithBlock:", &__block_literal_global_9_2);
    v14 = objc_claimAutoreleasedReturnValue();
    areas = v6->_areas;
    v6->_areas = (NSArray *)v14;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v6->_areas;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v37;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v19);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          objc_msgSend(v20, "regionIds");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v33;
            do
            {
              v25 = 0;
              do
              {
                if (*(_QWORD *)v33 != v24)
                  objc_enumerationMutation(v21);
                -[NSDictionary objectForKeyedSubscript:](v6->_regionMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v25));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addLocalArea:", v20);

                ++v25;
              }
              while (v23 != v25);
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
            }
            while (v23);
          }

          ++v19;
        }
        while (v19 != v17);
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v17);
    }

    v4 = v30;
  }

  return v6;
}

FCLocalRegion *__36__FCLocalAreasMapping_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FCLocalRegion *v3;

  v2 = a2;
  v3 = -[FCLocalRegion initWithDictionary:]([FCLocalRegion alloc], "initWithDictionary:", v2);

  return v3;
}

void __36__FCLocalAreasMapping_initWithData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
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
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "identifier", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setValue:forKey:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

FCLocalArea *__36__FCLocalAreasMapping_initWithData___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  FCLocalArea *v3;

  v2 = a2;
  v3 = -[FCLocalArea initWithDictionary:]([FCLocalArea alloc], "initWithDictionary:", v2);

  return v3;
}

- (FCLocalAreasMapping)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCLocalAreasMapping init]";
    v9 = 2080;
    v10 = "FCLocalAreasMapping.m";
    v11 = 1024;
    v12 = 67;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCLocalAreasMapping init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (unint64_t)count
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  -[FCLocalAreasMapping regionMap](self, "regionMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[FCLocalAreasMapping areas](self, "areas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") + v5;

  return v7;
}

- (id)regionsForLocation:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  if (v4)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[FCLocalAreasMapping areas](self, "areas");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      v22 = *(_QWORD *)v30;
      do
      {
        v9 = 0;
        v23 = v7;
        do
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
          if (objc_msgSend(v10, "containsLocation:", v4))
          {
            v11 = v4;
            v27 = 0u;
            v28 = 0u;
            v25 = 0u;
            v26 = 0u;
            objc_msgSend(v10, "regionIds");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v26;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v26 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
                  -[FCLocalAreasMapping regionMap](self, "regionMap");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "objectForKeyedSubscript:", v17);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "addObject:", v19);

                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              }
              while (v14);
            }

            v4 = v11;
            v8 = v22;
            v7 = v23;
          }
          ++v9;
        }
        while (v9 != v7);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v7);
    }

  }
  objc_msgSend(v5, "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)areasForLocation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[FCLocalAreasMapping areas](self, "areas", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "containsLocation:", v4))
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  objc_msgSend(v5, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)autoFavoriteTagIDsForLocation:(id)a3
{
  return -[FCLocalAreasMapping autoFavoriteTagIDsForLocation:searchOption:](self, "autoFavoriteTagIDsForLocation:searchOption:", a3, 1);
}

- (id)autoFavoriteTagIDsForLocation:(id)a3 searchOption:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];

  -[FCLocalAreasMapping regionsForLocation:](self, "regionsForLocation:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCLocalAreasMapping filterOuterRegions:](self, "filterOuterRegions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__FCLocalAreasMapping_autoFavoriteTagIDsForLocation_searchOption___block_invoke;
  v13[3] = &__block_descriptor_40_e30___NSSet_16__0__FCLocalRegion_8l;
  v13[4] = a4;
  objc_msgSend(v7, "fc_setByCollectingObjectsWithBlock:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

id __66__FCLocalAreasMapping_autoFavoriteTagIDsForLocation_searchOption___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v3, "localVersionedTagIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObjects:", v5);

  if (*(_QWORD *)(a1 + 32) == 1)
  {
    objc_msgSend(v3, "autoFavoriteTagIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fc_safelyAddObjects:", v6);

  }
  return v4;
}

- (id)filterOuterRegions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    v5 = v3;
    v4 = v5;
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__FCLocalAreasMapping_filterOuterRegions___block_invoke_2;
    v7[3] = &unk_1E46478C0;
    v8 = v3;
    objc_msgSend(v3, "fc_arrayOfObjectsPassingTest:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
  }

  return v4;
}

uint64_t __42__FCLocalAreasMapping_filterOuterRegions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;
  CGRect v31;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "rectForEntireRegion");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = *(id *)(a1 + 32);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * v16);
        if (v17 != v3)
        {
          objc_msgSend(v17, "rectForEntireRegion", (_QWORD)v24);
          v31.origin.x = v18;
          v31.origin.y = v19;
          v31.size.width = v20;
          v31.size.height = v21;
          v30.origin.x = v5;
          v30.origin.y = v7;
          v30.size.width = v9;
          v30.size.height = v11;
          if (CGRectContainsRect(v30, v31))
          {
            v22 = 0;
            goto LABEL_12;
          }
        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
        continue;
      break;
    }
  }
  v22 = 1;
LABEL_12:

  return v22;
}

- (id)tagIDsForLocation:(id)a3 searchOption:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  FCLocalAreasMapping *v18;
  unint64_t v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  -[FCLocalAreasMapping regionMap](self, "regionMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__FCLocalAreasMapping_tagIDsForLocation_searchOption___block_invoke;
  v20[3] = &unk_1E46478E8;
  v21 = v6;
  v9 = v6;
  objc_msgSend(v7, "fc_dictionaryByTransformingValuesWithBlock:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "keysSortedByValueUsingComparator:", &__block_literal_global_28_2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99DE8];
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __54__FCLocalAreasMapping_tagIDsForLocation_searchOption___block_invoke_3;
  v16[3] = &unk_1E4647930;
  v18 = self;
  v19 = a4;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "fc_array:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __54__FCLocalAreasMapping_tagIDsForLocation_searchOption___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "centerLocationCoordinateForEntireRegion");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(void **)(a1 + 32);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v5, v6);
  objc_msgSend(v4, "distanceFromLocation:", v7);
  objc_msgSend(v3, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __54__FCLocalAreasMapping_tagIDsForLocation_searchOption___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __54__FCLocalAreasMapping_tagIDsForLocation_searchOption___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  id obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[7];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 32);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __54__FCLocalAreasMapping_tagIDsForLocation_searchOption___block_invoke_4;
        v23[3] = &unk_1E4647930;
        v10 = *(_QWORD *)(a1 + 40);
        v9 = *(_QWORD *)(a1 + 48);
        v23[5] = v8;
        v23[6] = v9;
        v23[4] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
              if ((objc_msgSend(v4, "containsObject:", v16) & 1) == 0)
              {
                objc_msgSend(v4, "addObject:", v16);
                objc_msgSend(v3, "addObject:", v16);
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
          }
          while (v13);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

}

void __54__FCLocalAreasMapping_tagIDsForLocation_searchOption___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 == 1)
  {
    v12 = v3;
    objc_msgSend(*(id *)(a1 + 32), "regionMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localVersionedTagIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v10);

    objc_msgSend(*(id *)(a1 + 32), "regionMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "autoFavoriteTagIDs");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v4)
  {
    v12 = v3;
    objc_msgSend(*(id *)(a1 + 32), "regionMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localVersionedTagIDs");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = (void *)v7;
    objc_msgSend(v12, "addObjectsFromArray:", v7);

    v3 = v12;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCLocalAreasMapping)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  FCLocalAreasMapping *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localAreasMapping"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[FCLocalAreasMapping initWithData:](self, "initWithData:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;

  data = self->_data;
  if (data)
    objc_msgSend(a3, "encodeObject:forKey:", data, CFSTR("localAreasMapping"));
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSDictionary)regionMap
{
  return self->_regionMap;
}

- (void)setRegionMap:(id)a3
{
  objc_storeStrong((id *)&self->_regionMap, a3);
}

- (NSArray)areas
{
  return self->_areas;
}

- (void)setAreas:(id)a3
{
  objc_storeStrong((id *)&self->_areas, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_areas, 0);
  objc_storeStrong((id *)&self->_regionMap, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
