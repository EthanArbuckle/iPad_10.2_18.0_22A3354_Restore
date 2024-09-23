@implementation CNFeatureFlagsTestDouble

- (CNFeatureFlagsTestDouble)initWithFeatureFlags:(id)a3
{
  id v4;
  CNFeatureFlagsTestDouble *v5;
  uint64_t v6;
  NSMutableDictionary *featureFlags;
  CNFeatureFlags *v8;
  CNFeatureFlags *fallback;
  CNFeatureFlagsTestDouble *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNFeatureFlagsTestDouble;
  v5 = -[CNFeatureFlagsTestDouble init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    featureFlags = v5->_featureFlags;
    v5->_featureFlags = (NSMutableDictionary *)v6;

    v8 = objc_alloc_init(CNFeatureFlags);
    fallback = v5->_fallback;
    v5->_fallback = v8;

    v10 = v5;
  }

  return v5;
}

- (BOOL)isFeatureEnabled:(unint64_t)a3
{
  NSMutableDictionary *featureFlags;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;

  featureFlags = self->_featureFlags;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](featureFlags, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "BOOLValue");
  else
    v8 = -[CNFeatureFlags isFeatureEnabled:](self->_fallback, "isFeatureEnabled:", a3);
  v9 = v8;

  return v9;
}

- (void)setFeatureEnabled:(BOOL)a3 forFeature:(unint64_t)a4
{
  NSMutableDictionary *featureFlags;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  featureFlags = self->_featureFlags;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](featureFlags, "setObject:forKeyedSubscript:", v8, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallback, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end
