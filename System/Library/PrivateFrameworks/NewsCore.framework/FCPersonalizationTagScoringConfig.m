@implementation FCPersonalizationTagScoringConfig

- (FCPersonalizationTagScoringConfig)initWithConfigDictionary:(id)a3 defaultConfig:(id)a4
{
  id v6;
  id v7;
  FCPersonalizationTagScoringConfig *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v40;
  objc_super v41;

  v6 = a3;
  v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)FCPersonalizationTagScoringConfig;
  v8 = -[FCPersonalizationTagScoringConfig init](&v41, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "channelTopicMappingWeight");
    v10 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("channelTopicMappingWeight"), v9);
    objc_msgSend(v7, "channelTopicMappingWeight");
    if (v10 >= 0.0)
      v11 = v10;
    v40 = v11;
    objc_msgSend(v7, "democratizationFactor");
    v13 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("democratizationFactor"), v12);
    objc_msgSend(v7, "democratizationFactor");
    if (v13 > 1.0 || v13 < 0.0)
      v13 = v14;
    objc_msgSend(v7, "locationScoreDecayFactor");
    v17 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("locationScoreDecayFactor"), v16);
    objc_msgSend(v7, "locationScoreDecayFactor");
    if (v17 > 1.0 || v17 < 0.0)
      v17 = v18;
    objc_msgSend(v7, "locationWeight");
    v21 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("locationWeight"), v20);
    objc_msgSend(v7, "locationWeight");
    if (v21 < 0.0)
      v21 = v22;
    objc_msgSend(v7, "maxDistanceThreshold");
    v24 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("maxDistanceThreshold"), v23);
    objc_msgSend(v7, "maxDistanceThreshold");
    if (v24 < 0.0)
      v24 = v25;
    v26 = FCAppConfigurationIntegerValue(v6, (uint64_t)CFSTR("maxLocationsToConsider"), objc_msgSend(v7, "maxLocationsToConsider"));
    objc_msgSend(v7, "popularityMultiplierBoost");
    v28 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("popularityMultiplierBoost"), v27);
    objc_msgSend(v7, "popularityMultiplierBoost");
    if (v28 < 0.0)
      v28 = v29;
    objc_msgSend(v7, "popularityMultiplierExponent");
    v31 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("popularityMultiplierExponent"), v30);
    objc_msgSend(v7, "popularityMultiplierExponent");
    if (v31 < 0.0)
      v31 = v32;
    objc_msgSend(v7, "topicTopicMappingWeight");
    v34 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("topicTopicMappingWeight"), v33);
    objc_msgSend(v7, "topicTopicMappingWeight");
    if (v34 < 0.0)
      v34 = v35;
    objc_msgSend(v7, "userMembershipWeight");
    v37 = FCAppConfigurationDoubleValue(v6, (uint64_t)CFSTR("userMembershipWeight"), v36);
    objc_msgSend(v7, "userMembershipWeight");
    if (v37 >= 0.0)
      v38 = v37;
    v8 = -[FCPersonalizationTagScoringConfig initWithChannelTopicMappingWeight:democratizationFactor:locationScoreDecayFactor:locationWeight:maxDistanceThreshold:maxLocationsToConsider:popularityMultiplierBoost:popularityMultiplierExponent:topicTopicMappingWeight:userMembershipWeight:](v8, "initWithChannelTopicMappingWeight:democratizationFactor:locationScoreDecayFactor:locationWeight:maxDistanceThreshold:maxLocationsToConsider:popularityMultiplierBoost:popularityMultiplierExponent:topicTopicMappingWeight:userMembershipWeight:", v26, v40, v13, v17, v21, v24, v28, v31, v34, *(_QWORD *)&v38);
  }

  return v8;
}

- (double)userMembershipWeight
{
  return self->_userMembershipWeight;
}

- (double)topicTopicMappingWeight
{
  return self->_topicTopicMappingWeight;
}

- (double)popularityMultiplierExponent
{
  return self->_popularityMultiplierExponent;
}

- (double)popularityMultiplierBoost
{
  return self->_popularityMultiplierBoost;
}

- (double)maxDistanceThreshold
{
  return self->_maxDistanceThreshold;
}

- (double)locationWeight
{
  return self->_locationWeight;
}

- (double)locationScoreDecayFactor
{
  return self->_locationScoreDecayFactor;
}

- (double)democratizationFactor
{
  return self->_democratizationFactor;
}

- (double)channelTopicMappingWeight
{
  return self->_channelTopicMappingWeight;
}

- (FCPersonalizationTagScoringConfig)initWithChannelTopicMappingWeight:(double)a3 democratizationFactor:(double)a4 locationScoreDecayFactor:(double)a5 locationWeight:(double)a6 maxDistanceThreshold:(double)a7 maxLocationsToConsider:(int64_t)a8 popularityMultiplierBoost:(double)a9 popularityMultiplierExponent:(double)a10 topicTopicMappingWeight:(double)a11 userMembershipWeight:(double)a12
{
  FCPersonalizationTagScoringConfig *result;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)FCPersonalizationTagScoringConfig;
  result = -[FCPersonalizationTagScoringConfig init](&v22, sel_init);
  if (result)
  {
    result->_channelTopicMappingWeight = a3;
    result->_democratizationFactor = a4;
    result->_locationScoreDecayFactor = a5;
    result->_locationWeight = a6;
    result->_maxDistanceThreshold = a7;
    result->_maxLocationsToConsider = a8;
    result->_popularityMultiplierBoost = a9;
    result->_popularityMultiplierExponent = a10;
    result->_topicTopicMappingWeight = a11;
    result->_userMembershipWeight = a12;
  }
  return result;
}

- (int64_t)maxLocationsToConsider
{
  return self->_maxLocationsToConsider;
}

- (FCPersonalizationTagScoringConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCPersonalizationTagScoringConfig *v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)FCPersonalizationTagScoringConfig;
  v5 = -[FCPersonalizationTagScoringConfig init](&v27, sel_init);
  if (v5)
  {
    v6 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("channelTopicMappingWeight"), 1.0);
    if (v6 < 0.0)
      v6 = 1.0;
    v26 = v6;
    v7 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("democratizationFactor"), 1.0);
    v8 = 0.0;
    if (v7 > 1.0 || v7 < 0.0)
      v10 = 1.0;
    else
      v10 = v7;
    v11 = 0.1;
    v12 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("locationScoreDecayFactor"), 0.1);
    if (v12 <= 1.0 && v12 >= 0.0)
      v11 = v12;
    v14 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("locationWeight"), 1.0);
    if (v14 < 0.0)
      v15 = 1.0;
    else
      v15 = v14;
    v16 = 1000.0;
    v17 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("maxDistanceThreshold"), 1000.0);
    if (v17 >= 0.0)
      v16 = v17;
    v18 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("maxLocationsToConsider"), 10);
    v19 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("popularityMultiplierBoost"), 0.0);
    if (v19 >= 0.0)
      v8 = v19;
    v20 = 0.5;
    v21 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("popularityMultiplierExponent"), 0.5);
    if (v21 >= 0.0)
      v20 = v21;
    v22 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("topicTopicMappingWeight"), 1.0);
    if (v22 < 0.0)
      v23 = 1.0;
    else
      v23 = v22;
    v24 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("userMembershipWeight"), 1.0);
    if (v24 < 0.0)
      v24 = 1.0;
    v5 = -[FCPersonalizationTagScoringConfig initWithChannelTopicMappingWeight:democratizationFactor:locationScoreDecayFactor:locationWeight:maxDistanceThreshold:maxLocationsToConsider:popularityMultiplierBoost:popularityMultiplierExponent:topicTopicMappingWeight:userMembershipWeight:](v5, "initWithChannelTopicMappingWeight:democratizationFactor:locationScoreDecayFactor:locationWeight:maxDistanceThreshold:maxLocationsToConsider:popularityMultiplierBoost:popularityMultiplierExponent:topicTopicMappingWeight:userMembershipWeight:", v18, v26, v10, v11, v15, v16, v8, v20, v23, *(_QWORD *)&v24);
  }

  return v5;
}

- (FCPersonalizationTagScoringConfig)init
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
    v8 = "-[FCPersonalizationTagScoringConfig init]";
    v9 = 2080;
    v10 = "FCPersonalizationTagScoringConfig.m";
    v11 = 1024;
    v12 = 16;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPersonalizationTagScoringConfig init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationTagScoringConfig)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v24;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("channelTopicMappingWeight"));
  v24 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("democratizationFactor"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("locationScoreDecayFactor"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("locationWeight"));
  v11 = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxDistanceThreshold"));
  v13 = v12;
  v14 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("maxLocationsToConsider"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("popularityMultiplierBoost"));
  v16 = v15;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("popularityMultiplierExponent"));
  v18 = v17;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("topicTopicMappingWeight"));
  v20 = v19;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("userMembershipWeight"));
  v22 = v21;

  return -[FCPersonalizationTagScoringConfig initWithChannelTopicMappingWeight:democratizationFactor:locationScoreDecayFactor:locationWeight:maxDistanceThreshold:maxLocationsToConsider:popularityMultiplierBoost:popularityMultiplierExponent:topicTopicMappingWeight:userMembershipWeight:](self, "initWithChannelTopicMappingWeight:democratizationFactor:locationScoreDecayFactor:locationWeight:maxDistanceThreshold:maxLocationsToConsider:popularityMultiplierBoost:popularityMultiplierExponent:topicTopicMappingWeight:userMembershipWeight:", v14, v24, v7, v9, v11, v13, v16, v18, v20, v22);
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  -[FCPersonalizationTagScoringConfig channelTopicMappingWeight](self, "channelTopicMappingWeight");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("channelTopicMappingWeight"));
  -[FCPersonalizationTagScoringConfig democratizationFactor](self, "democratizationFactor");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("democratizationFactor"));
  -[FCPersonalizationTagScoringConfig locationScoreDecayFactor](self, "locationScoreDecayFactor");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("locationScoreDecayFactor"));
  -[FCPersonalizationTagScoringConfig locationWeight](self, "locationWeight");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("locationWeight"));
  -[FCPersonalizationTagScoringConfig maxDistanceThreshold](self, "maxDistanceThreshold");
  objc_msgSend(v5, "encodeInt64:forKey:", (uint64_t)v4, CFSTR("maxDistanceThreshold"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("maxLocationsToConsider"), (double)-[FCPersonalizationTagScoringConfig maxLocationsToConsider](self, "maxLocationsToConsider"));
  -[FCPersonalizationTagScoringConfig popularityMultiplierBoost](self, "popularityMultiplierBoost");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("popularityMultiplierBoost"));
  -[FCPersonalizationTagScoringConfig popularityMultiplierExponent](self, "popularityMultiplierExponent");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("popularityMultiplierExponent"));
  -[FCPersonalizationTagScoringConfig topicTopicMappingWeight](self, "topicTopicMappingWeight");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("topicTopicMappingWeight"));
  -[FCPersonalizationTagScoringConfig userMembershipWeight](self, "userMembershipWeight");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("userMembershipWeight"));

}

- (void)setChannelTopicMappingWeight:(double)a3
{
  self->_channelTopicMappingWeight = a3;
}

- (void)setDemocratizationFactor:(double)a3
{
  self->_democratizationFactor = a3;
}

- (void)setLocationScoreDecayFactor:(double)a3
{
  self->_locationScoreDecayFactor = a3;
}

- (void)setLocationWeight:(double)a3
{
  self->_locationWeight = a3;
}

- (void)setMaxDistanceThreshold:(double)a3
{
  self->_maxDistanceThreshold = a3;
}

- (void)setMaxLocationsToConsider:(int64_t)a3
{
  self->_maxLocationsToConsider = a3;
}

- (void)setPopularityMultiplierBoost:(double)a3
{
  self->_popularityMultiplierBoost = a3;
}

- (void)setPopularityMultiplierExponent:(double)a3
{
  self->_popularityMultiplierExponent = a3;
}

- (void)setTopicTopicMappingWeight:(double)a3
{
  self->_topicTopicMappingWeight = a3;
}

- (void)setUserMembershipWeight:(double)a3
{
  self->_userMembershipWeight = a3;
}

@end
