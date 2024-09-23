@implementation CNAutocompleteFontMetricCache

+ (id)sharedFontMetricCache
{
  id v2;
  CNAutocompleteFontMetricCache *v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!sharedFontMetricCache_sharedFontMetricCache)
  {
    v3 = objc_alloc_init(CNAutocompleteFontMetricCache);
    v4 = (void *)sharedFontMetricCache_sharedFontMetricCache;
    sharedFontMetricCache_sharedFontMetricCache = (uint64_t)v3;

  }
  objc_sync_exit(v2);

  return (id)sharedFontMetricCache_sharedFontMetricCache;
}

- (CNAutocompleteFontMetricCache)init
{
  CNAutocompleteFontMetricCache *v2;
  void *v3;
  uint64_t v4;
  NSString *preferredSizeValidationKey;
  NSMutableDictionary *v6;
  NSMutableDictionary *metricCacheDictionary;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNAutocompleteFontMetricCache;
  v2 = -[CNAutocompleteFontMetricCache init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = objc_claimAutoreleasedReturnValue();
    preferredSizeValidationKey = v2->_preferredSizeValidationKey;
    v2->_preferredSizeValidationKey = (NSString *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    metricCacheDictionary = v2->_metricCacheDictionary;
    v2->_metricCacheDictionary = v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__didReceivePreferredFontChangedNotification_, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v2;
}

- (id)cachedPreferredFontForStyle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  id v11;

  v3 = a3;
  +[CNAutocompleteFontMetricCache sharedFontMetricCache](CNAutocompleteFontMetricCache, "sharedFontMetricCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = v3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = v3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("preferredFont.%@"), v6, v10, 3221225472, __61__CNAutocompleteFontMetricCache_cachedPreferredFontForStyle___block_invoke, &unk_1E62BFC38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedFont:forKey:", &v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __61__CNAutocompleteFontMetricCache_cachedPreferredFontForStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *(_QWORD *)(a1 + 32));
}

- (double)cachedScaledFloatWithValue:(double)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  _QWORD v11[4];
  id v12;
  double v13;

  v5 = a4;
  +[CNAutocompleteFontMetricCache sharedFontMetricCache](CNAutocompleteFontMetricCache, "sharedFontMetricCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__CNAutocompleteFontMetricCache_cachedScaledFloatWithValue_forKey___block_invoke;
  v11[3] = &unk_1E62BFC60;
  v12 = v6;
  v13 = a3;
  v7 = v6;
  objc_msgSend(v7, "cachedFloat:forKey:", v11, v5);
  v9 = v8;

  return v9;
}

double __67__CNAutocompleteFontMetricCache_cachedScaledFloatWithValue_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "cachedPreferredFontForStyle:", *MEMORY[0x1E0CEB538]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", *(double *)(a1 + 40));
  UIRoundToViewScale();
  v4 = v3;

  return v4;
}

- (double)cachedScaledFloatWithValue:(double)a3 fontStyle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  _QWORD v13[4];
  id v14;
  id v15;
  double v16;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("preferredFont.%@.float.%.1f"), v5, *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteFontMetricCache sharedFontMetricCache](CNAutocompleteFontMetricCache, "sharedFontMetricCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__CNAutocompleteFontMetricCache_cachedScaledFloatWithValue_fontStyle___block_invoke;
  v13[3] = &unk_1E62BFC88;
  v14 = v7;
  v15 = v5;
  v16 = a3;
  v8 = v5;
  v9 = v7;
  objc_msgSend(v9, "cachedFloat:forKey:", v13, v6);
  v11 = v10;

  return v11;
}

double __70__CNAutocompleteFontMetricCache_cachedScaledFloatWithValue_fontStyle___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "cachedPreferredFontForStyle:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", *(double *)(a1 + 48));
  UIRoundToViewScale();
  v4 = v3;

  return v4;
}

- (id)cachedFont:(id)a3 forKey:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_metricCacheDictionary, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v6[2](v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_metricCacheDictionary, "setObject:forKey:", v8, v7);
  }

  return v8;
}

- (double)cachedFloat:(id)a3 forKey:(id)a4
{
  double (**v6)(_QWORD);
  id v7;
  void *v8;
  void *v9;
  double v10;
  float v11;
  double v12;

  v6 = (double (**)(_QWORD))a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_metricCacheDictionary, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = v6[2](v6);
    *(float *)&v10 = v10;
    objc_msgSend(v9, "numberWithFloat:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](self->_metricCacheDictionary, "setValue:forKey:", v8, v7);
  }
  objc_msgSend(v8, "floatValue");
  v12 = v11;

  return v12;
}

- (void)invalidateCache
{
  id v3;

  -[NSMutableDictionary removeAllObjects](self->_metricCacheDictionary, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("CNComposeFontMetricCacheInvalidationNotification"), self);

}

- (BOOL)ensureCacheIsValid
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isEqualToString:", self->_preferredSizeValidationKey);
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredSizeValidationKey, v4);
    -[CNAutocompleteFontMetricCache invalidateCache](self, "invalidateCache");
  }

  return v5;
}

- (void)_didReceivePreferredFontChangedNotification:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *preferredSizeValidationKey;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CEB430]);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredSizeValidationKey = self->_preferredSizeValidationKey;
  self->_preferredSizeValidationKey = v5;

  -[CNAutocompleteFontMetricCache invalidateCache](self, "invalidateCache");
}

- (id)metricCacheDictionary
{
  return self->_metricCacheDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricCacheDictionary, 0);
  objc_storeStrong((id *)&self->_preferredSizeValidationKey, 0);
}

@end
