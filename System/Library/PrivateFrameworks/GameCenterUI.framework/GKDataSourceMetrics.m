@implementation GKDataSourceMetrics

+ (GKDataSourceMetrics)dataSourceMetricsWithMetrics:(id)a3 dataSource:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMetrics:dataSource:", v6, v5);

  return (GKDataSourceMetrics *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *sectionToMetrics;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setGlobalSectionRange:", self->_globalSectionRange.location, self->_globalSectionRange.length);
    objc_msgSend(v5, "setLocalSectionRange:", self->_localSectionRange.location, self->_localSectionRange.length);
    sectionToMetrics = self->_sectionToMetrics;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__GKDataSourceMetrics_copyWithZone___block_invoke;
    v10[3] = &unk_1E59C4B38;
    v7 = v5;
    v11 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sectionToMetrics, "enumerateKeysAndObjectsUsingBlock:", v10);
    -[NSArray _gkMapWithBlock:](self->_childMetrics, "_gkMapWithBlock:", &__block_literal_global_5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setChildMetrics:", v8);

    objc_msgSend(v7, "setDataSource:", self->_dataSource);
    objc_msgSend(v7, "setCachedKey:", self->_cachedKey);

  }
  return v5;
}

void __36__GKDataSourceMetrics_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "sectionToMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v5);

}

id __36__GKDataSourceMetrics_copyWithZone___block_invoke_2(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

- (GKDataSourceMetrics)initWithMetrics:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  GKDataSourceMetrics *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *sectionToMetrics;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[GKGridLayoutMetrics init](self, "init");
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sectionToMetrics = v8->_sectionToMetrics;
    v8->_sectionToMetrics = v9;

    if (v6)
    {
      v11 = (void *)objc_msgSend(v6, "copy");

      objc_msgSend(v11, "keyToMetrics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKGridLayoutMetrics setKeyToMetrics:](v8, "setKeyToMetrics:", v12);

      objc_msgSend(v11, "locationToKeyList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKGridLayoutMetrics setLocationToKeyList:](v8, "setLocationToKeyList:", v13);

      v6 = v11;
    }
    objc_storeStrong((id *)&v8->_dataSource, a4);
  }

  return v8;
}

- (id)description
{
  return -[GKDataSourceMetrics _gkDescriptionWithChildren:](self, "_gkDescriptionWithChildren:", 0);
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSUInteger v26;
  void *v27;
  uint64_t v28;
  id *p_isa;
  void *v30;
  void *v31;
  unint64_t v32;
  NSMutableDictionary *sectionToMetrics;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id obj;
  id obja;
  GKDataSourceMetrics *v54;
  void *v55;
  void *v56;
  _QWORD v57[5];
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  _gkTabStringForTabLevel();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v68.receiver = self;
  v68.super_class = (Class)GKDataSourceMetrics;
  -[GKGridLayoutMetrics localDescription](&v68, sel_localDescription);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _gkRangeFromToDescription(CFSTR(" global:"), self->_globalSectionRange.location, self->_globalSectionRange.length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _gkRangeFromToDescription(CFSTR(" local:"), self->_localSectionRange.location, self->_localSectionRange.length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@%@%@%@"), v4, v6, v7, v8);

  -[GKGridLayoutMetrics layoutKey](self, "layoutKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[GKGridLayoutMetrics layoutKey](self, "layoutKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" layoutKey:'%@'"), v10);

  }
  -[GKGridLayoutMetrics locationToKeyList](self, "locationToKeyList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  v55 = v4;
  v56 = v5;
  v54 = self;
  if (v12 <= 0)
  {
    -[GKDataSourceMetrics sectionToMetrics](self, "sectionToMetrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
    {

    }
    else
    {
      v26 = -[NSArray count](self->_childMetrics, "count");

      if (!v26)
        goto LABEL_34;
    }
    objc_msgSend(v5, "appendString:", CFSTR("{\n"));
  }
  else
  {
    objc_msgSend(v5, "appendString:", CFSTR("{\n"));
    -[GKGridLayoutMetrics locationToKeyList](self, "locationToKeyList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1E5A5DDA0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count"))
    {
      v66 = 0u;
      v67 = 0u;
      v65 = 0u;
      v64 = 0u;
      obj = v14;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v65 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
            -[GKGridLayoutMetrics keyToMetrics](self, "keyToMetrics");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("metrics"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "localDescription");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "appendFormat:", CFSTR("%@    header - %@\t:\t%@\n"), v55, v20, v24);

            self = v54;
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
        }
        while (v17);
      }

      v4 = v55;
      objc_msgSend(v5, "appendFormat:", CFSTR("%@    ---\n"), v55);
      v14 = obj;
    }

  }
  -[GKDataSourceMetrics sectionToMetrics](self, "sectionToMetrics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  p_isa = (id *)&v54->super.super.isa;
  if (v28)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("%@    sectionMetrics: {\n"), v4);
    v30 = v5;
    v31 = v4;
    if (-[NSMutableDictionary count](v54->_sectionToMetrics, "count"))
    {
      v32 = 0;
      do
      {
        sectionToMetrics = v54->_sectionToMetrics;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](sectionToMetrics, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "_gkDescriptionWithChildren:", a3 + 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringByTrimmingCharactersInSet:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "appendFormat:", CFSTR("%@        section %@ - %@"), v31, v39, v38);

        p_isa = (id *)&v54->super.super.isa;
        ++v32;
      }
      while (v32 < -[NSMutableDictionary count](v54->_sectionToMetrics, "count"));
    }
    objc_msgSend(v30, "appendFormat:", CFSTR("%@    }\n"), v31);
    v5 = v30;
    v4 = v31;
  }
  if (!objc_msgSend(p_isa[5], "count"))
    goto LABEL_32;
  objc_msgSend(v5, "appendFormat:", CFSTR("%@    children: {\n"), v4);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obja = p_isa[5];
  v40 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (v40)
  {
    v41 = v40;
    v42 = 0;
    v43 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v61 != v43)
          objc_enumerationMutation(obja);
        objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "_gkDescriptionWithChildren:", a3 + 2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringByTrimmingCharactersInSet:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v42 + j);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v55;
        v5 = v56;
        objc_msgSend(v56, "appendFormat:", CFSTR("%@        child %@ - %@"), v55, v48, v47);

      }
      v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      v42 += j;
    }
    while (v41);
  }

  objc_msgSend(v5, "appendFormat:", CFSTR("%@    }\n"), v4);
  p_isa = (id *)&v54->super.super.isa;
  if (v54)
  {
LABEL_32:
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __50__GKDataSourceMetrics__gkDescriptionWithChildren___block_invoke;
    v57[3] = &unk_1E59C4B60;
    v57[4] = p_isa;
    v58 = v5;
    v59 = v4;
    objc_msgSend(p_isa, "enumerateSupplementaryLocations:", v57);

  }
  objc_msgSend(v5, "appendFormat:", CFSTR("%@}"), v4);
LABEL_34:
  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  v49 = (id)_gkUnicodifyDescription();

  return v5;
}

void __50__GKDataSourceMetrics__gkDescriptionWithChildren___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "locationToKeyList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  v22 = a2;
  if (a2 && v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("%@    ---\n"), *(_QWORD *)(a1 + 48));
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "keyToMetrics");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("metrics"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 > 4)
            v16 = 0;
          else
            v16 = off_1E59C5078[v22 - 1];
          v18 = *(void **)(a1 + 40);
          v17 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v15, "localDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "appendFormat:", CFSTR("%@    %@ - %@\t:\t%@\n"), v17, v16, v12, v19);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    v6 = v20;
  }

}

- (id)metricsForSection:(int64_t)a3
{
  NSMutableDictionary *sectionToMetrics;
  void *v4;
  void *v5;

  sectionToMetrics = self->_sectionToMetrics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sectionToMetrics, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setMetrics:(id)a3 forSection:(int64_t)a4
{
  NSMutableDictionary *sectionToMetrics;
  void *v6;
  id v7;
  id v8;

  sectionToMetrics = self->_sectionToMetrics;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](sectionToMetrics, "setObject:forKeyedSubscript:", v7, v8);

}

- (id)globalLayoutKey
{
  NSString *cachedKey;
  NSString *v4;
  NSString *v5;

  cachedKey = self->_cachedKey;
  if (!cachedKey)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self->_dataSource);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedKey;
    self->_cachedKey = v4;

    cachedKey = self->_cachedKey;
  }
  return cachedKey;
}

- (id)globalLayoutKeyForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[GKDataSourceMetrics globalLayoutKey](self, "globalLayoutKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ - %ld"), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_NSRange)globalSectionRange
{
  _NSRange *p_globalSectionRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_globalSectionRange = &self->_globalSectionRange;
  location = self->_globalSectionRange.location;
  length = p_globalSectionRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setGlobalSectionRange:(_NSRange)a3
{
  self->_globalSectionRange = a3;
}

- (_NSRange)localSectionRange
{
  _NSRange *p_localSectionRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_localSectionRange = &self->_localSectionRange;
  location = self->_localSectionRange.location;
  length = p_localSectionRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLocalSectionRange:(_NSRange)a3
{
  self->_localSectionRange = a3;
}

- (NSMutableDictionary)sectionToMetrics
{
  return self->_sectionToMetrics;
}

- (void)setSectionToMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_sectionToMetrics, a3);
}

- (NSArray)childMetrics
{
  return self->_childMetrics;
}

- (void)setChildMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_childMetrics, a3);
}

- (GKCollectionViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSString)cachedKey
{
  return self->_cachedKey;
}

- (void)setCachedKey:(id)a3
{
  objc_storeStrong((id *)&self->_cachedKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedKey, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_childMetrics, 0);
  objc_storeStrong((id *)&self->_sectionToMetrics, 0);
}

- (void)computeGlobalSectionRangesWithBaseIndex:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[6];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[GKDataSourceMetrics localSectionRange](self, "localSectionRange");
  v6 = v5;
  -[GKDataSourceMetrics setGlobalSectionRange:](self, "setGlobalSectionRange:", a3, v5);
  -[GKDataSourceMetrics globalLayoutKey](self, "globalLayoutKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGridLayoutMetrics setLayoutKey:](self, "setLayoutKey:", v7);

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __84__GKDataSourceMetrics_GKGridLayoutPrivate__computeGlobalSectionRangesWithBaseIndex___block_invoke;
  v20[3] = &__block_descriptor_48_e56_v40__0__GKSupplementaryViewMetrics_8__NSString_16Q24_B32l;
  v20[4] = a3;
  v20[5] = v6;
  -[GKGridLayoutMetrics enumerateSupplementaryMetricsUsingBlock:](self, "enumerateSupplementaryMetricsUsingBlock:", v20);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[GKDataSourceMetrics childMetrics](self, "childMetrics", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "computeGlobalSectionRangesWithBaseIndex:", a3);
        v14 = objc_msgSend(v13, "globalSectionRange");
        a3 = v14 + v15;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v10);
  }

}

uint64_t __84__GKDataSourceMetrics_GKGridLayoutPrivate__computeGlobalSectionRangesWithBaseIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGlobalSectionRange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)accumulateSections:(id)a3 layout:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  GKDataSourceMetrics *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[GKDataSourceMetrics globalSectionRange](self, "globalSectionRange");
  v10 = v9;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[GKDataSourceMetrics childMetrics](self, "childMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v11);
        v16 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "accumulateSections:layout:", v6, v7);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v13);
  }
  v28 = self;

  if (v10)
  {
    v17 = 0;
    while (1)
    {
      objc_msgSend(v7, "collectionView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "numberOfSections");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8 + v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 + v17 < v19)
        break;
      objc_msgSend(v6, "removeObjectForKey:", v20);
LABEL_20:

      if (v10 == ++v17)
        goto LABEL_23;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v7, "collectionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "numberOfItemsInSection:", v8 + v17);

      if (v23 > 0 || (objc_msgSend(v21, "shouldShowSectionHeadersWhenNoItems") & 1) != 0)
        goto LABEL_19;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8 + v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObjectForKey:", v24);
    }
    else
    {
      -[GKDataSourceMetrics metricsForSection:](v28, "metricsForSection:", v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v25, "copy");

      if (!v21)
      {
        v20 = 0;
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8 + v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, v26);

      -[GKDataSourceMetrics globalLayoutKeyForSection:](v28, "globalLayoutKeyForSection:", v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setLayoutKey:", v24);
    }

LABEL_19:
    v20 = v21;
    goto LABEL_20;
  }
LABEL_23:

  return v6;
}

- (id)applyDataSourceMetricsToSections:(id)a3 withParent:(id)a4 layout:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[GKDataSourceMetrics childMetrics](self, "childMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(v10);
        v15 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "applyDataSourceMetricsToSections:withParent:layout:", v8, self, v9);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v12);
  }

  v40 = -[GKDataSourceMetrics globalSectionRange](self, "globalSectionRange");
  if (v16)
  {
    v17 = v16;
    v39 = a4;
    v18 = 0;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    v20 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v21 = v40 + v18;
      objc_msgSend(v9, "collectionView", v39);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "numberOfSections");

      if (v40 + v18 < v23)
      {
        objc_msgSend(v9, "collectionView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "numberOfItemsInSection:", v21);

        if (v20 == 0x7FFFFFFFFFFFFFFFLL && v25 > 0)
          v20 = v40 + v18;
        if (v25 > 0)
          v19 = v40 + v18;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        objc_msgSend(v9, "defaultSectionMetricsInternal");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v29, "copy");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, v30);

        -[GKDataSourceMetrics globalLayoutKeyForSection:](self, "globalLayoutKeyForSection:", v18);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setLayoutKey:", v31);

      }
      ++v18;
    }
    while (v17 != v18);
    if (v39 && v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v32 = v19;
      v33 = v19 - v20;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "mergeSupplementaryMetricsFromEnclosingMetrics:atLocation:globalRange:", self, 0, v20, v33);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "mergeSupplementaryMetricsFromEnclosingMetrics:atLocation:globalRange:", self, 1, v20, v33);
    }
  }

  return v8;
}

- (void)generateMetricDataForLayout:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKDataSourceMetrics globalSectionRange](self, "globalSectionRange");
  v6 = v5;
  -[GKDataSourceMetrics localSectionRange](self, "localSectionRange");
  if (v6 != v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutPrivate.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (self.globalSectionRange.length == self.localSectionRange.length)\n[%s (%s:%d)]"), v9, "-[GKDataSourceMetrics(GKGridLayoutPrivate) generateMetricDataForLayout:]", objc_msgSend(v11, "UTF8String"), 212);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
  }
  v13 = (void *)MEMORY[0x1E0C99E08];
  -[GKDataSourceMetrics globalSectionRange](self, "globalSectionRange");
  objc_msgSend(v13, "dictionaryWithCapacity:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDataSourceMetrics accumulateSections:layout:](self, "accumulateSections:layout:", v15, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[GKDataSourceMetrics applyDataSourceMetricsToSections:withParent:layout:](self, "applyDataSourceMetricsToSections:withParent:layout:", v16, 0, v4);
  objc_msgSend(v16, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortedArrayUsingComparator:", &__block_literal_global_34);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "layoutKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "metricDataForKey:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setMetrics:", v26);
        objc_msgSend(v28, "setFilteredTotalItemCount:", -1);
        objc_msgSend(v4, "setMetricData:forSection:", v28, objc_msgSend(v25, "integerValue"));

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v22);
  }

  objc_msgSend(v4, "metricDataForKey:", CFSTR("GKGlobalSection"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetricData:forSection:", v29, 0x7FFFFFFFFFFFFFFFLL);

}

uint64_t __72__GKDataSourceMetrics_GKGridLayoutPrivate__generateMetricDataForLayout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)prepareLayout:(id)a3
{
  id v4;

  v4 = a3;
  -[GKDataSourceMetrics computeGlobalSectionRangesWithBaseIndex:](self, "computeGlobalSectionRangesWithBaseIndex:", -[GKDataSourceMetrics globalSectionRange](self, "globalSectionRange"));
  -[GKDataSourceMetrics generateMetricDataForLayout:](self, "generateMetricDataForLayout:", v4);

}

@end
