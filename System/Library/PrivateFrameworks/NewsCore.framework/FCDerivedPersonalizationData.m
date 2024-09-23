@implementation FCDerivedPersonalizationData

- (unint64_t)scoringType
{
  return self->_scoringType;
}

- (FCDerivedPersonalizationData)initWithAggregates:(id)a3 scoringType:(unint64_t)a4 decayRate:(double)a5
{
  id v8;
  FCDerivedPersonalizationData *v9;
  FCDerivedPersonalizationData *v10;
  void *v11;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "aggregates");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCDerivedPersonalizationData initWithAggregates:scoringType:decayRate:]";
    v17 = 2080;
    v18 = "FCDerivedPersonalizationData.m";
    v19 = 1024;
    v20 = 31;
    v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v14.receiver = self;
  v14.super_class = (Class)FCDerivedPersonalizationData;
  v9 = -[FCDerivedPersonalizationData init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v8)
      v11 = v8;
    else
      v11 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v9->_aggregatesByFeatureKey, v11);
    v10->_scoringType = a4;
    v10->_decayRate = a5;
  }

  return v10;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregatesByFeatureKey, 0);
}

- (id)allAggregates
{
  if (self)
    self = (FCDerivedPersonalizationData *)self->_aggregatesByFeatureKey;
  return self;
}

- (id)aggregateForFeatureKey:(id)a3
{
  if (self)
    self = (FCDerivedPersonalizationData *)self->_aggregatesByFeatureKey;
  return (id)-[FCDerivedPersonalizationData objectForKeyedSubscript:](self, "objectForKeyedSubscript:", a3);
}

- (FCDerivedPersonalizationData)init
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
    v8 = "-[FCDerivedPersonalizationData init]";
    v9 = 2080;
    v10 = "FCDerivedPersonalizationData.m";
    v11 = 1024;
    v12 = 26;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCDerivedPersonalizationData init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCDerivedPersonalizationData)initWithAggregates:(id)a3 scoringType:(unint64_t)a4
{
  return -[FCDerivedPersonalizationData initWithAggregates:scoringType:decayRate:](self, "initWithAggregates:scoringType:decayRate:", a3, a4, 0.0);
}

- (id)aggregatesForFeatureKeys:(id)a3
{
  if (self)
    self = (FCDerivedPersonalizationData *)self->_aggregatesByFeatureKey;
  return (id)-[FCDerivedPersonalizationData fc_subdictionaryForKeys:](self, "fc_subdictionaryForKeys:", a3);
}

- (FCDerivedPersonalizationData)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  FCDerivedPersonalizationData *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scoringType"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("decayRate"));
  v8 = v7;
  if (v5 == 5)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("aggregatesByFeatureKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)objc_opt_new();
  }
  v14 = -[FCDerivedPersonalizationData initWithAggregates:scoringType:decayRate:](self, "initWithAggregates:scoringType:decayRate:", v13, v6, v8);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *aggregatesByFeatureKey;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", 5, CFSTR("version"));
  if (self)
    aggregatesByFeatureKey = self->_aggregatesByFeatureKey;
  else
    aggregatesByFeatureKey = 0;
  objc_msgSend(v5, "encodeObject:forKey:", aggregatesByFeatureKey, CFSTR("aggregatesByFeatureKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[FCDerivedPersonalizationData scoringType](self, "scoringType"), CFSTR("scoringType"));
  -[FCDerivedPersonalizationData decayRate](self, "decayRate");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("decayRate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
