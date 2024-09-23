@implementation GKGridLayoutMetrics

+ (id)metrics
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *locationToKeyList;
  uint64_t v7;
  id v8;
  NSMutableDictionary *keyToMetrics;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    locationToKeyList = self->_locationToKeyList;
    v7 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __36__GKGridLayoutMetrics_copyWithZone___block_invoke;
    v18[3] = &unk_1E59C4B38;
    v8 = v4;
    v19 = v8;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](locationToKeyList, "enumerateKeysAndObjectsUsingBlock:", v18);
    keyToMetrics = self->_keyToMetrics;
    v13 = v7;
    v14 = 3221225472;
    v15 = __36__GKGridLayoutMetrics_copyWithZone___block_invoke_2;
    v16 = &unk_1E59C4B38;
    v10 = v8;
    v17 = v10;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyToMetrics, "enumerateKeysAndObjectsUsingBlock:", &v13);
    -[GKGridLayoutMetrics layoutKey](self, "layoutKey", v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLayoutKey:", v11);

  }
  return v5;
}

void __36__GKGridLayoutMetrics_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "locationToKeyList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v5);

}

void __36__GKGridLayoutMetrics_copyWithZone___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a2;
  v6 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("metrics"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("metrics"));

  objc_msgSend(*(id *)(a1 + 32), "keyToMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v5);

}

- (GKGridLayoutMetrics)init
{
  GKGridLayoutMetrics *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *locationToKeyList;
  NSMutableDictionary *v5;
  NSMutableDictionary *keyToMetrics;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKGridLayoutMetrics;
  v2 = -[GKGridLayoutMetrics init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    locationToKeyList = v2->_locationToKeyList;
    v2->_locationToKeyList = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    keyToMetrics = v2->_keyToMetrics;
    v2->_keyToMetrics = v5;

  }
  return v2;
}

- (id)localDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKGridLayoutMetrics;
  -[GKGridLayoutMetrics description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  return -[GKGridLayoutMetrics _gkDescriptionWithChildren:](self, "_gkDescriptionWithChildren:", 0);
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;
  objc_super v16;

  _gkTabStringForTabLevel();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)GKGridLayoutMetrics;
  -[GKGridLayoutMetrics description](&v16, sel_description);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (self->_layoutKey)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" layoutKey:%@"), self->_layoutKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@%@%@ {\n"), v4, v7, v8);

  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("%@%@%@ {\n"), v4, v6, &stru_1E59EB978);
  }

  if (-[NSMutableDictionary count](self->_keyToMetrics, "count"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__GKGridLayoutMetrics__gkDescriptionWithChildren___block_invoke;
    v13[3] = &unk_1E59C4B60;
    v13[4] = self;
    v9 = v5;
    v14 = v9;
    v10 = v4;
    v15 = v10;
    -[GKGridLayoutMetrics enumerateSupplementaryLocations:](self, "enumerateSupplementaryLocations:", v13);
    objc_msgSend(v9, "appendFormat:", CFSTR("%@}\n"), v10);

  }
  else
  {
    -[GKGridLayoutMetrics localDescription](self, "localDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@    --- SECTION : %@\n"), v4, v11);

  }
  return v5;
}

void __50__GKGridLayoutMetrics__gkDescriptionWithChildren___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a2)
  {
    case 0:
      v7 = CFSTR("header");
      break;
    case 1:
      v8 = *(void **)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "localDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("%@    --- SECTION : %@\n"), v9, v10);

      v7 = CFSTR("footer");
      break;
    case 2:
      v7 = CFSTR("overlay");
      break;
    case 3:
      v7 = CFSTR("segmented-box");
      break;
    case 4:
      v7 = CFSTR("content-box");
      break;
    default:
      v7 = 0;
      break;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v6;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("metrics"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = *(void **)(a1 + 40);
        v18 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v17, "localDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "appendFormat:", CFSTR("%@    %@ - %@\t:\t%@\n"), v18, v7, v15, v20);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

}

- (id)_gkDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKGridLayoutMetrics;
  -[GKGridLayoutMetrics description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)enumerateSupplementaryLocations:(id)a3
{
  void *v4;
  uint64_t v5;
  NSMutableDictionary *locationToKeyList;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a3;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    locationToKeyList = self->_locationToKeyList;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__GKGridLayoutMetrics_enumerateSupplementaryLocations___block_invoke;
    v11[3] = &unk_1E59C4B88;
    v12 = v4;
    v7 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](locationToKeyList, "enumerateKeysAndObjectsUsingBlock:", v11);
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __55__GKGridLayoutMetrics_enumerateSupplementaryLocations___block_invoke_2;
    v9[3] = &unk_1E59C4BB0;
    v10 = v8;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v9);

  }
}

uint64_t __55__GKGridLayoutMetrics_enumerateSupplementaryLocations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "integerValue"));
}

uint64_t __55__GKGridLayoutMetrics_enumerateSupplementaryLocations___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateSupplementaryMetricsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__GKGridLayoutMetrics_enumerateSupplementaryMetricsUsingBlock___block_invoke;
  v6[3] = &unk_1E59C4BD8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[GKGridLayoutMetrics enumerateSupplementaryLocations:](self, "enumerateSupplementaryLocations:", v6);

}

void __63__GKGridLayoutMetrics_enumerateSupplementaryMetricsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("metrics"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (id)keyListForLocation:(unint64_t)a3
{
  NSMutableDictionary *locationToKeyList;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;

  locationToKeyList = self->_locationToKeyList;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](locationToKeyList, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_locationToKeyList;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (id)listForLocation:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[GKGridLayoutMetrics keyListForLocation:](self, "keyListForLocation:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__GKGridLayoutMetrics_listForLocation___block_invoke;
  v7[3] = &unk_1E59C4C00;
  v7[4] = self;
  objc_msgSend(v4, "_gkMapWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __39__GKGridLayoutMetrics_listForLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("metrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)insertSupplementaryMetrics:(id)a3 forKey:(id)a4 atLocation:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ ([metrics isKindOfClass:[GKSupplementaryViewMetrics class]])\n[%s (%s:%d)]"), v11, "-[GKGridLayoutMetrics insertSupplementaryMetrics:forKey:atLocation:]", objc_msgSend(v13, "UTF8String"), 254);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }
  -[GKGridLayoutMetrics keyListForLocation:](self, "keyListForLocation:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyToMetrics, "objectForKeyedSubscript:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[NSMutableDictionary objectForKeyedSubscript:](self->_keyToMetrics, "objectForKeyedSubscript:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("attempted to insert key %@ that already exists: %@"), v9, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastPathComponent");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ (_keyToMetrics[key] == nil)\n[%s (%s:%d)]"), v19, "-[GKGridLayoutMetrics insertSupplementaryMetrics:forKey:atLocation:]", objc_msgSend(v21, "UTF8String"), 256);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v22);
  }
  objc_msgSend(v15, "insertObject:atIndex:", v9, 0);
  v25[0] = CFSTR("metrics");
  v25[1] = CFSTR("location");
  v26[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyToMetrics, "setObject:forKeyedSubscript:", v24, v9);

}

- (void)addSupplementaryMetrics:(id)a3 forKey:(id)a4 atLocation:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ ([metrics isKindOfClass:[GKSupplementaryViewMetrics class]])\n[%s (%s:%d)]"), v11, "-[GKGridLayoutMetrics addSupplementaryMetrics:forKey:atLocation:]", objc_msgSend(v13, "UTF8String"), 263);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }
  -[GKGridLayoutMetrics keyListForLocation:](self, "keyListForLocation:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyToMetrics, "objectForKeyedSubscript:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[NSMutableDictionary objectForKeyedSubscript:](self->_keyToMetrics, "objectForKeyedSubscript:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("attempted to add key %@ that already exists: %@"), v9, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastPathComponent");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ (_keyToMetrics[key] == nil)\n[%s (%s:%d)]"), v19, "-[GKGridLayoutMetrics addSupplementaryMetrics:forKey:atLocation:]", objc_msgSend(v21, "UTF8String"), 265);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v22);
  }
  objc_msgSend(v15, "addObject:", v9);
  v25[0] = CFSTR("metrics");
  v25[1] = CFSTR("location");
  v26[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyToMetrics, "setObject:forKeyedSubscript:", v24, v9);

}

- (void)mergeSupplementaryMetricsFromEnclosingMetrics:(id)a3 atLocation:(unint64_t)a4 globalRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  length = a5.length;
  location = a5.location;
  v37 = a3;
  objc_msgSend(v37, "keyListForLocation:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = v10;
  switch(a4)
  {
    case 0uLL:
      if (v10 >= 1)
      {
        v22 = v10 + 1;
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v22 - 2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "keyToMetrics");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("metrics"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setGlobalSectionRange:", location, length);
          -[GKGridLayoutMetrics insertSupplementaryMetrics:forKey:atLocation:](self, "insertSupplementaryMetrics:forKey:atLocation:", v26, v23, 0);

          --v22;
        }
        while (v22 > 1);
      }
      break;
    case 1uLL:
      if (v10 >= 1)
      {
        v27 = 0;
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "keyToMetrics");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("metrics"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setGlobalSectionRange:", location, length);
          -[GKGridLayoutMetrics addSupplementaryMetrics:forKey:atLocation:](self, "addSupplementaryMetrics:forKey:atLocation:", v31, v28, 0);
          ++v27;

        }
        while (v11 != v27);
      }
      break;
    case 2uLL:
      if (v10 >= 1)
      {
        v32 = v10 + 1;
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v32 - 2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "keyToMetrics");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("metrics"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setGlobalSectionRange:", location, length);
          -[GKGridLayoutMetrics insertSupplementaryMetrics:forKey:atLocation:](self, "insertSupplementaryMetrics:forKey:atLocation:", v36, v33, 2);

          --v32;
        }
        while (v32 > 1);
      }
      break;
    case 3uLL:
    case 4uLL:
      if (v10 >= 1)
      {
        v12 = v10 + 1;
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v12 - 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "keyToMetrics");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("metrics"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setGlobalSectionRange:", location, length);
          -[GKGridLayoutMetrics insertSupplementaryMetrics:forKey:atLocation:](self, "insertSupplementaryMetrics:forKey:atLocation:", v16, v13, a4);

          --v12;
        }
        while (v12 > 1);
      }
      break;
    default:
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown location %ld encountered"), a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ (nil)\n[%s (%s:%d)]"), v18, "-[GKGridLayoutMetrics mergeSupplementaryMetricsFromEnclosingMetrics:atLocation:globalRange:]", objc_msgSend(v20, "UTF8String"), 315);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v21);
      break;
  }

}

- (id)supplementaryMetricsForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyToMetrics, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("metrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)replaceSupplementaryMetrics:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v39 = v6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ ([metrics isKindOfClass:[GKSupplementaryViewMetrics class]])\n[%s (%s:%d)]"), v9, "-[GKGridLayoutMetrics replaceSupplementaryMetrics:forKey:]", objc_msgSend(v11, "UTF8String"), 327);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyToMetrics, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to replace key %@ that does not exist"), v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastPathComponent");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ (_keyToMetrics[key] != nil)\n[%s (%s:%d)]"), v15, "-[GKGridLayoutMetrics replaceSupplementaryMetrics:forKey:]", objc_msgSend(v17, "UTF8String"), 328);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v18);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyToMetrics, "objectForKeyedSubscript:", v7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("location"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastPathComponent");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ (location != ((void *)0))\n[%s (%s:%d)]"), v21, "-[GKGridLayoutMetrics replaceSupplementaryMetrics:forKey:]", objc_msgSend(v23, "UTF8String"), 331);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v24);
  }
  -[GKGridLayoutMetrics keyListForLocation:](self, "keyListForLocation:", objc_msgSend(v19, "integerValue"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lastPathComponent");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%@ (keyList != ((void *)0))\n[%s (%s:%d)]"), v27, "-[GKGridLayoutMetrics replaceSupplementaryMetrics:forKey:]", objc_msgSend(v29, "UTF8String"), 333);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v30);
  }
  v31 = objc_msgSend(v25, "indexOfObject:", v7);
  if (v31 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Inconsistency: key lookup contains metrics but list doesn't"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "lastPathComponent");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v32, "stringWithFormat:", CFSTR("%@ (idx != NSNotFound)\n[%s (%s:%d)]"), v33, "-[GKGridLayoutMetrics replaceSupplementaryMetrics:forKey:]", objc_msgSend(v35, "UTF8String"), 335);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v36);
  }
  objc_msgSend(v25, "setObject:atIndexedSubscript:", v7, v31);
  v40[0] = CFSTR("metrics");
  v40[1] = CFSTR("location");
  v41[0] = v39;
  v41[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyToMetrics, "setObject:forKeyedSubscript:", v37, v7);

}

- (void)removeSupplementaryMetricsForKey:(id)a3
{
  -[GKGridLayoutMetrics replaceSupplementaryMetrics:forKey:](self, "replaceSupplementaryMetrics:forKey:", 0, a3);
}

- (void)configureCollectionView:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__GKGridLayoutMetrics_configureCollectionView___block_invoke;
  v6[3] = &unk_1E59C4C28;
  v7 = v4;
  v5 = v4;
  -[GKGridLayoutMetrics enumerateSupplementaryMetricsUsingBlock:](self, "enumerateSupplementaryMetricsUsingBlock:", v6);

}

void __47__GKGridLayoutMetrics_configureCollectionView___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend((id)objc_msgSend(v5, "reusableViewClass"), "isSubclassOfClass:", objc_opt_class()))
  {
    v3 = (void *)objc_msgSend(v5, "reusableViewClass");
    objc_msgSend(v5, "kind");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerSupplementaryViewClassesForKind:withCollectionView:", v4, *(_QWORD *)(a1 + 32));

  }
}

- (NSMutableDictionary)keyToMetrics
{
  return self->_keyToMetrics;
}

- (void)setKeyToMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_keyToMetrics, a3);
}

- (NSMutableDictionary)locationToKeyList
{
  return self->_locationToKeyList;
}

- (void)setLocationToKeyList:(id)a3
{
  objc_storeStrong((id *)&self->_locationToKeyList, a3);
}

- (NSString)layoutKey
{
  return self->_layoutKey;
}

- (void)setLayoutKey:(id)a3
{
  objc_storeStrong((id *)&self->_layoutKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutKey, 0);
  objc_storeStrong((id *)&self->_locationToKeyList, 0);
  objc_storeStrong((id *)&self->_keyToMetrics, 0);
}

- (int64_t)prepareLayout:(id)a3 startingAtSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSections") + a4;

  return v6;
}

@end
