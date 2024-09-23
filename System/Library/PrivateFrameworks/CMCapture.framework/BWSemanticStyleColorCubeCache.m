@implementation BWSemanticStyleColorCubeCache

- (BWSemanticStyleColorCubeCache)initWithColorLookupCache:(id)a3
{
  BWSemanticStyleColorCubeCache *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWSemanticStyleColorCubeCache;
  v4 = -[BWSemanticStyleColorCubeCache init](&v6, sel_init);
  if (v4)
  {
    v4->_cubeFilterCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_recentFilterCacheKeys = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_filterCacheLock._os_unfair_lock_opaque = 0;
    v4->_cachingEnabled = 1;
    v4->_colorLookupCache = (BWColorLookupCache *)a3;
    v4->_cacheMaxSize = 10;
  }
  return v4;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSemanticStyleColorCubeCache;
  -[BWSemanticStyleColorCubeCache dealloc](&v3, sel_dealloc);
}

- (id)filtersForSemanticStyle:(id)a3 sceneType:(int)a4 personSegmentationEnabled:(BOOL)a5 maskVisualizationEnabled:(BOOL)a6 applyStyleBackgroundToEntireFrame:(BOOL)a7 filtersToCombine:(id)a8
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t i;
  void *v17;
  void *v18;
  __CFString *v19;
  const __CFString *v20;
  float v21;
  double v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  _BOOL4 v30;
  _BOOL4 v32;
  _BOOL4 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v32 = a6;
  v33 = a7;
  v30 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v11, "appendString:", CFSTR("{"));
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = objc_msgSend(a8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    v15 = 1;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(a8);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if ((v15 & 1) == 0)
          objc_msgSend(v11, "appendString:", CFSTR(","));
        objc_msgSend(v11, "appendString:", objc_msgSend(v17, "name"));
        v15 = 0;
      }
      v13 = objc_msgSend(a8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v15 = 0;
    }
    while (v13);
  }
  objc_msgSend(v11, "appendString:", CFSTR("}"));
  v18 = (void *)MEMORY[0x1E0CB3940];
  if (a4 > 3)
    v19 = CFSTR("semanticStyleSceneType-unknown");
  else
    v19 = off_1E491EA90[a4];
  if (v32 || v33)
  {
    if (v32)
      v20 = CFSTR("-mask-visualization");
    else
      v20 = CFSTR("-forced-to-background");
    v19 = (__CFString *)-[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v20);
  }
  objc_msgSend(a3, "toneBias");
  v22 = v21;
  objc_msgSend(a3, "warmthBias");
  v24 = objc_msgSend(v18, "stringWithFormat:", CFSTR("%@-%f,%f,%@"), v19, *(_QWORD *)&v22, v23, v11);
  if (!a3 || !self->_cachingEnabled || !v30)
    return BWSemanticStyleFiltersForSemanticStyleAndFilterToCombine(a3, a4, v30, v32, v33, self->_colorLookupCache, (uint64_t)a8);
  v25 = v24;
  os_unfair_lock_lock(&self->_filterCacheLock);
  v26 = -[NSMutableDictionary objectForKeyedSubscript:](self->_cubeFilterCache, "objectForKeyedSubscript:", v25);
  if (v26)
  {
    v27 = (void *)v26;
    -[NSMutableArray removeObject:](self->_recentFilterCacheKeys, "removeObject:", v25);
    -[NSMutableArray addObject:](self->_recentFilterCacheKeys, "addObject:", v25);
  }
  else
  {
    os_unfair_lock_unlock(&self->_filterCacheLock);
    v27 = BWSemanticStyleFiltersForSemanticStyleAndFilterToCombine(a3, a4, 1, v32, v33, self->_colorLookupCache, (uint64_t)a8);
    os_unfair_lock_lock(&self->_filterCacheLock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cubeFilterCache, "setObject:forKeyedSubscript:", v27, v25);
    -[NSMutableArray addObject:](self->_recentFilterCacheKeys, "addObject:", v25);
    if (-[NSMutableArray count](self->_recentFilterCacheKeys, "count") > self->_cacheMaxSize)
    {
      v28 = (id)-[NSMutableArray firstObject](self->_recentFilterCacheKeys, "firstObject");
      -[NSMutableArray removeObjectAtIndex:](self->_recentFilterCacheKeys, "removeObjectAtIndex:", 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cubeFilterCache, "setObject:forKeyedSubscript:", 0, v28);
    }
  }
  os_unfair_lock_unlock(&self->_filterCacheLock);
  return v27;
}

@end
