@implementation MFFontMetricCache

void __42__MFFontMetricCache_sharedFontMetricCache__block_invoke()
{
  MFFontMetricCache *v0;
  void *v1;

  v0 = objc_alloc_init(MFFontMetricCache);
  v1 = (void *)sharedFontMetricCache_sharedFontMetricCache;
  sharedFontMetricCache_sharedFontMetricCache = (uint64_t)v0;

}

- (MFFontMetricCache)init
{
  MFFontMetricCache *v2;
  void *v3;
  uint64_t v4;
  NSString *preferredSizeValidationKey;
  NSMutableDictionary *v6;
  NSMutableDictionary *metricCacheDictionary;
  NSMutableDictionary *v8;
  NSMutableDictionary *bodyLeadingDictionary;
  NSMutableDictionary *v10;
  NSMutableDictionary *defaultBodyLeadingDictionary;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MFFontMetricCache;
  v2 = -[MFFontMetricCache init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = objc_claimAutoreleasedReturnValue();
    preferredSizeValidationKey = v2->_preferredSizeValidationKey;
    v2->_preferredSizeValidationKey = (NSString *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    metricCacheDictionary = v2->_metricCacheDictionary;
    v2->_metricCacheDictionary = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    bodyLeadingDictionary = v2->_bodyLeadingDictionary;
    v2->_bodyLeadingDictionary = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    defaultBodyLeadingDictionary = v2->_defaultBodyLeadingDictionary;
    v2->_defaultBodyLeadingDictionary = v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel__didReceivePreferredFontChangedNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v2;
}

- (id)cachedPreferredFontForStyle:(id)a3 maximumContentSizeCategory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  +[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v8 = v5;
  v14 = v8;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v8, "stringByAppendingString:", v9, v13, 3221225472, __76__MFFontMetricCache_cachedPreferredFontForStyle_maximumContentSizeCategory___block_invoke, &unk_1E5A67308);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedFont:forKey:", &v13, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)sharedFontMetricCache
{
  if (sharedFontMetricCache_onceToken != -1)
    dispatch_once(&sharedFontMetricCache_onceToken, &__block_literal_global_18);
  return (id)sharedFontMetricCache_sharedFontMetricCache;
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

uint64_t __76__MFFontMetricCache_cachedPreferredFontForStyle_maximumContentSizeCategory___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)cachedPreferredFontForStyle:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  +[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__MFFontMetricCache_cachedPreferredFontForStyle___block_invoke;
  v8[3] = &unk_1E5A672E0;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "cachedFont:forKey:", v8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __49__MFFontMetricCache_cachedPreferredFontForStyle___block_invoke(uint64_t a1)
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
  +[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__MFFontMetricCache_cachedScaledFloatWithValue_forKey___block_invoke;
  v11[3] = &unk_1E5A67330;
  v12 = v6;
  v13 = a3;
  v7 = v6;
  objc_msgSend(v7, "cachedFloat:forKey:", v11, v5);
  v9 = v8;

  return v9;
}

double __55__MFFontMetricCache_cachedScaledFloatWithValue_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "cachedPreferredFontForStyle:", *MEMORY[0x1E0DC4A88]);
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
  void *v8;
  NSMutableDictionary *bodyLeadingDictionary;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *defaultBodyLeadingDictionary;
  void *v14;
  double v15;
  double v16;

  v5 = a4;
  -[NSMutableDictionary objectForKey:](self->_bodyLeadingDictionary, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
  }
  else
  {
    -[MFFontMetricCache cachedPreferredFontForStyle:](self, "cachedPreferredFontForStyle:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_bodyLeading");
    bodyLeadingDictionary = self->_bodyLeadingDictionary;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](bodyLeadingDictionary, "setValue:forKey:", v10, v5);

  }
  -[NSMutableDictionary objectForKey:](self->_defaultBodyLeadingDictionary, "objectForKey:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "doubleValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_bodyLeading");
    defaultBodyLeadingDictionary = self->_defaultBodyLeadingDictionary;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](defaultBodyLeadingDictionary, "setValue:forKey:", v14, v5);

  }
  UIRoundToViewScale();
  v16 = v15;

  return v16;
}

- (double)cachedScaledFloatWithValue:(double)a3 fontStyle:(id)a4 maximumContentSizeCategory:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *defaultBodyLeadingDictionary;
  void *v13;
  double v14;
  double v15;

  v7 = a4;
  -[MFFontMetricCache cachedPreferredFontForStyle:maximumContentSizeCategory:](self, "cachedPreferredFontForStyle:maximumContentSizeCategory:", v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_bodyLeading");
  -[NSMutableDictionary objectForKey:](self->_defaultBodyLeadingDictionary, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_bodyLeading");
    defaultBodyLeadingDictionary = self->_defaultBodyLeadingDictionary;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](defaultBodyLeadingDictionary, "setValue:forKey:", v13, v7);

  }
  UIRoundToViewScale();
  v15 = v14;

  return v15;
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
    -[NSMutableDictionary setValue:forKey:](self->_metricCacheDictionary, "setValue:forKey:");
  }
  objc_msgSend(v8, "floatValue");
  v12 = v11;

  return v12;
}

- (id)cachedImage:(id)a3 forKey:(id)a4
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

- (void)_invalidateCache
{
  id v3;

  -[NSMutableDictionary removeAllObjects](self->_metricCacheDictionary, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_bodyLeadingDictionary, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MFFontMetricCacheInvalidationNotification"), self);

}

- (BOOL)ensureCacheIsValid
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isEqualToString:", self->_preferredSizeValidationKey);
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredSizeValidationKey, v4);
    -[MFFontMetricCache _invalidateCache](self, "_invalidateCache");
  }

  return v5;
}

- (void)_didReceivePreferredFontChangedNotification:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *preferredSizeValidationKey;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4928]);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredSizeValidationKey = self->_preferredSizeValidationKey;
  self->_preferredSizeValidationKey = v5;

  -[MFFontMetricCache _invalidateCache](self, "_invalidateCache");
}

- (id)metricCacheDictionary
{
  return self->_metricCacheDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBodyLeadingDictionary, 0);
  objc_storeStrong((id *)&self->_bodyLeadingDictionary, 0);
  objc_storeStrong((id *)&self->_metricCacheDictionary, 0);
  objc_storeStrong((id *)&self->_preferredSizeValidationKey, 0);
}

@end
