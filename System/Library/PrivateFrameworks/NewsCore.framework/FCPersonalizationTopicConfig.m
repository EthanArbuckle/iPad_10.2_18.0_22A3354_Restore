@implementation FCPersonalizationTopicConfig

- (FCPersonalizationTopicConfig)initWithConfigDictionary:(id)a3 defaultConfig:(id)a4
{
  id v6;
  id v7;
  FCPersonalizationTopicConfig *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)FCPersonalizationTopicConfig;
  v8 = -[FCPersonalizationTopicConfig init](&v29, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "topicID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("topicId"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scoreMultiplier");
    v12 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("scoreMultiplier"), v11);
    objc_msgSend(v7, "scoreMultiplier");
    if (v12 < 0.0)
      v12 = v13;
    objc_msgSend(v7, "tagWeight");
    v15 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("tagWeight"), v14);
    objc_msgSend(v7, "tagWeight");
    if (v15 < 0.0)
      v15 = v16;
    v17 = FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("capAtBaseline"), objc_msgSend(v7, "capAtBaseline"));
    v18 = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("limitInGroup"), objc_msgSend(v7, "limitInGroup"));
    v19 = FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("shouldLimitInGroup"), objc_msgSend(v7, "shouldLimitInGroup"));
    objc_msgSend(v7, "publisherTopicWeight");
    v21 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("publisherTopicWeight"), v20);
    objc_msgSend(v7, "publisherTopicWeight");
    if (v21 < 0.0)
      v21 = v22;
    v23 = FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("useHalfLifeCoefficientOverride"), objc_msgSend(v7, "useHalfLifeCoefficientOverride"));
    objc_msgSend(v7, "halfLifeCoefficientOverride");
    v25 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("halfLifeCoefficientOverride"), v24);
    objc_msgSend(v7, "halfLifeCoefficientOverride");
    if (v25 <= 0.0)
      v27 = v26;
    else
      v27 = v25;
    v8 = -[FCPersonalizationTopicConfig initWithTopicID:scoreMultiplier:tagWeight:capAtBaseline:limitInGroup:shouldLimitInGroup:publisherTopicWeight:useHalfLifeCoefficientOverride:halfLifeCoefficientOverride:](v8, "initWithTopicID:scoreMultiplier:tagWeight:capAtBaseline:limitInGroup:shouldLimitInGroup:publisherTopicWeight:useHalfLifeCoefficientOverride:halfLifeCoefficientOverride:", v10, v17, v18, v19, v23, v12, v15, v21, v27);

  }
  return v8;
}

- (double)scoreMultiplier
{
  return self->_scoreMultiplier;
}

- (double)tagWeight
{
  return self->_tagWeight;
}

- (double)publisherTopicWeight
{
  return self->_publisherTopicWeight;
}

- (double)halfLifeCoefficientOverride
{
  return self->_halfLifeCoefficientOverride;
}

- (FCPersonalizationTopicConfig)initWithTopicID:(id)a3 scoreMultiplier:(double)a4 tagWeight:(double)a5 capAtBaseline:(BOOL)a6 limitInGroup:(int64_t)a7 shouldLimitInGroup:(BOOL)a8 publisherTopicWeight:(double)a9 useHalfLifeCoefficientOverride:(BOOL)a10 halfLifeCoefficientOverride:(double)a11
{
  id v21;
  FCPersonalizationTopicConfig *v22;
  FCPersonalizationTopicConfig *v23;
  objc_super v25;

  v21 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FCPersonalizationTopicConfig;
  v22 = -[FCPersonalizationTopicConfig init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_topicID, a3);
    v23->_scoreMultiplier = a4;
    v23->_tagWeight = a5;
    v23->_capAtBaseline = a6;
    v23->_limitInGroup = a7;
    v23->_shouldLimitInGroup = a8;
    v23->_useHalfLifeCoefficientOverride = a10;
    v23->_publisherTopicWeight = a9;
    v23->_halfLifeCoefficientOverride = a11;
  }

  return v23;
}

- (BOOL)useHalfLifeCoefficientOverride
{
  return self->_useHalfLifeCoefficientOverride;
}

- (BOOL)shouldLimitInGroup
{
  return self->_shouldLimitInGroup;
}

- (int64_t)limitInGroup
{
  return self->_limitInGroup;
}

- (BOOL)capAtBaseline
{
  return self->_capAtBaseline;
}

- (NSString)topicID
{
  return self->_topicID;
}

- (FCPersonalizationTopicConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCPersonalizationTopicConfig *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FCPersonalizationTopicConfig;
  v5 = -[FCPersonalizationTopicConfig init](&v20, sel_init);
  if (v5)
  {
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("topicId"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("scoreMultiplier"), 1.0);
    if (v7 < 0.0)
      v8 = 1.0;
    else
      v8 = v7;
    v9 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("tagWeight"), 1.0);
    if (v9 < 0.0)
      v10 = 1.0;
    else
      v10 = v9;
    v11 = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("capAtBaseline"), 0);
    v12 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("limitInGroup"), 100);
    v13 = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("shouldLimitInGroup"), 0);
    v14 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("publisherTopicWeight"), 1.0);
    if (v14 < 0.0)
      v15 = 1.0;
    else
      v15 = v14;
    v16 = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("useHalfLifeCoefficientOverride"), 0);
    v17 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("halfLifeCoefficientOverride"), 1.0);
    if (v17 <= 0.0)
      v18 = 1.0;
    else
      v18 = v17;
    v5 = -[FCPersonalizationTopicConfig initWithTopicID:scoreMultiplier:tagWeight:capAtBaseline:limitInGroup:shouldLimitInGroup:publisherTopicWeight:useHalfLifeCoefficientOverride:halfLifeCoefficientOverride:](v5, "initWithTopicID:scoreMultiplier:tagWeight:capAtBaseline:limitInGroup:shouldLimitInGroup:publisherTopicWeight:useHalfLifeCoefficientOverride:halfLifeCoefficientOverride:", v6, v11, v12, v13, v16, v8, v10, v15, v18);

  }
  return v5;
}

- (FCPersonalizationTopicConfig)init
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
    v8 = "-[FCPersonalizationTopicConfig init]";
    v9 = 2080;
    v10 = "FCPersonalizationTopicConfig.m";
    v11 = 1024;
    v12 = 16;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPersonalizationTopicConfig init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationTopicConfig)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  FCPersonalizationTopicConfig *v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("topicId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scoreMultiplier"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tagWeight"));
  v9 = v8;
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("capAtBaseline"));
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limitInGroup"));
  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldLimitInGroup"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("publisherTopicWeight"));
  v14 = v13;
  v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useHalfLifeCoefficientOverride"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("halfLifeCoefficientOverride"));
  v17 = v16;

  v18 = -[FCPersonalizationTopicConfig initWithTopicID:scoreMultiplier:tagWeight:capAtBaseline:limitInGroup:shouldLimitInGroup:publisherTopicWeight:useHalfLifeCoefficientOverride:halfLifeCoefficientOverride:](self, "initWithTopicID:scoreMultiplier:tagWeight:capAtBaseline:limitInGroup:shouldLimitInGroup:publisherTopicWeight:useHalfLifeCoefficientOverride:halfLifeCoefficientOverride:", v5, v10, v11, v12, v15, v7, v9, v14, v17);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FCPersonalizationTopicConfig topicID](self, "topicID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("topicId"));

  -[FCPersonalizationTopicConfig scoreMultiplier](self, "scoreMultiplier");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("scoreMultiplier"));
  -[FCPersonalizationTopicConfig tagWeight](self, "tagWeight");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("tagWeight"));
  objc_msgSend(v5, "encodeBool:forKey:", -[FCPersonalizationTopicConfig capAtBaseline](self, "capAtBaseline"), CFSTR("capAtBaseline"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[FCPersonalizationTopicConfig limitInGroup](self, "limitInGroup"), CFSTR("limitInGroup"));
  objc_msgSend(v5, "encodeBool:forKey:", -[FCPersonalizationTopicConfig shouldLimitInGroup](self, "shouldLimitInGroup"), CFSTR("shouldLimitInGroup"));
  -[FCPersonalizationTopicConfig publisherTopicWeight](self, "publisherTopicWeight");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("publisherTopicWeight"));
  objc_msgSend(v5, "encodeBool:forKey:", -[FCPersonalizationTopicConfig useHalfLifeCoefficientOverride](self, "useHalfLifeCoefficientOverride"), CFSTR("useHalfLifeCoefficientOverride"));
  -[FCPersonalizationTopicConfig halfLifeCoefficientOverride](self, "halfLifeCoefficientOverride");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("halfLifeCoefficientOverride"));

}

- (void)setTopicID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setScoreMultiplier:(double)a3
{
  self->_scoreMultiplier = a3;
}

- (void)setTagWeight:(double)a3
{
  self->_tagWeight = a3;
}

- (void)setCapAtBaseline:(BOOL)a3
{
  self->_capAtBaseline = a3;
}

- (void)setLimitInGroup:(int64_t)a3
{
  self->_limitInGroup = a3;
}

- (void)setShouldLimitInGroup:(BOOL)a3
{
  self->_shouldLimitInGroup = a3;
}

- (void)setPublisherTopicWeight:(double)a3
{
  self->_publisherTopicWeight = a3;
}

- (void)setUseHalfLifeCoefficientOverride:(BOOL)a3
{
  self->_useHalfLifeCoefficientOverride = a3;
}

- (void)setHalfLifeCoefficientOverride:(double)a3
{
  self->_halfLifeCoefficientOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicID, 0);
}

@end
