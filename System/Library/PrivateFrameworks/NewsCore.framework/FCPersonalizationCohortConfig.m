@implementation FCPersonalizationCohortConfig

- (FCPersonalizationCohortConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCPersonalizationCohortConfig *v5;
  uint64_t v6;
  double v7;
  uint64_t v9;
  double v10;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v29;
  double v31;
  double v32;
  double v33;
  double v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)FCPersonalizationCohortConfig;
  v5 = -[FCPersonalizationCohortConfig init](&v35, sel_init);
  if (v5)
  {
    v6 = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("considerPublisherTopicAggregates"), 0);
    v7 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("dilutionFactor"), 1.0);
    if (v7 > 1.0 || v7 < 0.0)
      v7 = 1.0;
    v34 = v7;
    v9 = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("enableUndampening"), 0);
    v10 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("favoritedBoost"), 0.3);
    if (v10 > 1.0 || v10 < 0.0)
      v10 = 0.3;
    v33 = v10;
    v12 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("exponentialFavoritedBoost"), 1.0);
    if (v12 < 0.0)
      v12 = 1.0;
    v32 = v12;
    v13 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("globalWeight"), 0.2);
    if (v13 > 1.0 || v13 < 0.0)
      v13 = 0.2;
    v31 = v13;
    v15 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("globalWeightHalfLife"), 5.0);
    if (v15 < 0.0)
      v16 = 5.0;
    else
      v16 = v15;
    v17 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("globalWeightInitialMultiplier"), 0.0);
    if (v17 < 0.0)
      v18 = 0.0;
    else
      v18 = v17;
    v19 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("paddingFactor"), 0.0);
    if (v19 < 0.0)
      v20 = 0.0;
    else
      v20 = v19;
    v21 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("preBaselineCurvature"), 2.0);
    if (v21 <= 0.0)
      v22 = 2.0;
    else
      v22 = v21;
    v23 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("postBaselineCurvature"), 2.0);
    if (v23 <= 0.0)
      v24 = 2.0;
    else
      v24 = v23;
    v25 = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("undampenOnlyAboveBaselineMembership"), 1);
    v26 = 0.05;
    v27 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("userBaseline"), 0.05);
    if (v27 <= 1.0 && v27 >= 0.0)
      v26 = v27;
    v29 = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("useRelativePersonalizationValue"), 0);
    v5 = -[FCPersonalizationCohortConfig initWithConsiderPublisherTopicAggregates:dilutionFactor:enableUndampening:favoritedBoost:exponentialFavoritedBoost:globalWeight:globalWeightHalfLife:globalWeightInitialMultiplier:paddingFactor:preBaselineCurvature:postBaselineCurvature:undampenOnlyAboveBaselineMembership:userBaseline:useRelativePersonalizationValue:useExponentialFavoritedBoost:](v5, "initWithConsiderPublisherTopicAggregates:dilutionFactor:enableUndampening:favoritedBoost:exponentialFavoritedBoost:globalWeight:globalWeightHalfLife:globalWeightInitialMultiplier:paddingFactor:preBaselineCurvature:postBaselineCurvature:undampenOnlyAboveBaselineMembership:userBaseline:useRelativePersonalizationValue:useExponentialFavoritedBoost:", v6, v9, v25, v29, FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("useExponentialFavoritedBoost"), 0), v34, v33, v32, v31, v16, v18, v20, v22, *(_QWORD *)&v24,
           *(_QWORD *)&v26);
  }

  return v5;
}

- (FCPersonalizationCohortConfig)initWithConsiderPublisherTopicAggregates:(BOOL)a3 dilutionFactor:(double)a4 enableUndampening:(BOOL)a5 favoritedBoost:(double)a6 exponentialFavoritedBoost:(double)a7 globalWeight:(double)a8 globalWeightHalfLife:(double)a9 globalWeightInitialMultiplier:(double)a10 paddingFactor:(double)a11 preBaselineCurvature:(double)a12 postBaselineCurvature:(double)a13 undampenOnlyAboveBaselineMembership:(BOOL)a14 userBaseline:(double)a15 useRelativePersonalizationValue:(BOOL)a16 useExponentialFavoritedBoost:(BOOL)a17
{
  FCPersonalizationCohortConfig *result;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)FCPersonalizationCohortConfig;
  result = -[FCPersonalizationCohortConfig init](&v31, sel_init);
  if (result)
  {
    result->_considerPublisherTopicAggregates = a3;
    result->_enableUndampening = a5;
    result->_dilutionFactor = a4;
    result->_favoritedBoost = a6;
    result->_exponentialFavoritedBoost = a7;
    result->_globalWeight = a8;
    result->_globalWeightHalfLife = a9;
    result->_globalWeightInitialMultiplier = a10;
    result->_paddingFactor = a11;
    result->_preBaselineCurvature = a12;
    result->_undampenOnlyAboveBaselineMembership = a14;
    result->_postBaselineCurvature = a13;
    result->_userBaseline = a15;
    result->_useRelativePersonalizationValue = a16;
    result->_useExponentialFavoritedBoost = a17;
  }
  return result;
}

- (double)userBaseline
{
  return self->_userBaseline;
}

- (BOOL)useRelativePersonalizationValue
{
  return self->_useRelativePersonalizationValue;
}

- (BOOL)useExponentialFavoritedBoost
{
  return self->_useExponentialFavoritedBoost;
}

- (BOOL)undampenOnlyAboveBaselineMembership
{
  return self->_undampenOnlyAboveBaselineMembership;
}

- (double)preBaselineCurvature
{
  return self->_preBaselineCurvature;
}

- (double)postBaselineCurvature
{
  return self->_postBaselineCurvature;
}

- (double)paddingFactor
{
  return self->_paddingFactor;
}

- (double)globalWeight
{
  return self->_globalWeight;
}

- (double)globalWeightInitialMultiplier
{
  return self->_globalWeightInitialMultiplier;
}

- (double)globalWeightHalfLife
{
  return self->_globalWeightHalfLife;
}

- (double)favoritedBoost
{
  return self->_favoritedBoost;
}

- (double)exponentialFavoritedBoost
{
  return self->_exponentialFavoritedBoost;
}

- (BOOL)enableUndampening
{
  return self->_enableUndampening;
}

- (double)dilutionFactor
{
  return self->_dilutionFactor;
}

- (BOOL)considerPublisherTopicAggregates
{
  return self->_considerPublisherTopicAggregates;
}

- (FCPersonalizationCohortConfig)init
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
    v8 = "-[FCPersonalizationCohortConfig init]";
    v9 = 2080;
    v10 = "FCPersonalizationCohortConfig.m";
    v11 = 1024;
    v12 = 18;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPersonalizationCohortConfig init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationCohortConfig)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v29;
  double v30;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("considerPublisherTopicAggregates"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("dilutionFactor"));
  v30 = v6;
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableUndampening"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("favoritedBoost"));
  v29 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("exponentialFavoritedBoost"));
  v10 = v9;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("globalWeight"));
  v12 = v11;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("globalWeightHalfLife"));
  v14 = v13;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("globalWeightInitialMultiplier"));
  v16 = v15;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("paddingFactor"));
  v18 = v17;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("preBaselineCurvature"));
  v20 = v19;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("postBaselineCurvature"));
  v22 = v21;
  v23 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("undampenOnlyAboveBaselineMembership"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("userBaseline"));
  v25 = v24;
  v26 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useRelativePersonalizationValue"));
  v27 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useExponentialFavoritedBoost"));

  return -[FCPersonalizationCohortConfig initWithConsiderPublisherTopicAggregates:dilutionFactor:enableUndampening:favoritedBoost:exponentialFavoritedBoost:globalWeight:globalWeightHalfLife:globalWeightInitialMultiplier:paddingFactor:preBaselineCurvature:postBaselineCurvature:undampenOnlyAboveBaselineMembership:userBaseline:useRelativePersonalizationValue:useExponentialFavoritedBoost:](self, "initWithConsiderPublisherTopicAggregates:dilutionFactor:enableUndampening:favoritedBoost:exponentialFavoritedBoost:globalWeight:globalWeightHalfLife:globalWeightInitialMultiplier:paddingFactor:preBaselineCurvature:postBaselineCurvature:undampenOnlyAboveBaselineMembership:userBaseline:useRelativePersonalizationValue:useExponentialFavoritedBoost:", v5, v7, v23, v26, v27, v30, v29, v10, v12, v14, v16, v18, v20, v22,
           v25);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[FCPersonalizationCohortConfig considerPublisherTopicAggregates](self, "considerPublisherTopicAggregates"), CFSTR("considerPublisherTopicAggregates"));
  -[FCPersonalizationCohortConfig dilutionFactor](self, "dilutionFactor");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("dilutionFactor"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FCPersonalizationCohortConfig enableUndampening](self, "enableUndampening"), CFSTR("enableUndampening"));
  -[FCPersonalizationCohortConfig favoritedBoost](self, "favoritedBoost");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("favoritedBoost"));
  -[FCPersonalizationCohortConfig exponentialFavoritedBoost](self, "exponentialFavoritedBoost");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("exponentialFavoritedBoost"));
  -[FCPersonalizationCohortConfig globalWeight](self, "globalWeight");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("globalWeight"));
  -[FCPersonalizationCohortConfig globalWeightHalfLife](self, "globalWeightHalfLife");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("globalWeightHalfLife"));
  -[FCPersonalizationCohortConfig globalWeightInitialMultiplier](self, "globalWeightInitialMultiplier");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("globalWeightInitialMultiplier"));
  -[FCPersonalizationCohortConfig paddingFactor](self, "paddingFactor");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("paddingFactor"));
  -[FCPersonalizationCohortConfig preBaselineCurvature](self, "preBaselineCurvature");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("preBaselineCurvature"));
  -[FCPersonalizationCohortConfig postBaselineCurvature](self, "postBaselineCurvature");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("postBaselineCurvature"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FCPersonalizationCohortConfig undampenOnlyAboveBaselineMembership](self, "undampenOnlyAboveBaselineMembership"), CFSTR("undampenOnlyAboveBaselineMembership"));
  -[FCPersonalizationCohortConfig userBaseline](self, "userBaseline");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("userBaseline"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FCPersonalizationCohortConfig useRelativePersonalizationValue](self, "useRelativePersonalizationValue"), CFSTR("useRelativePersonalizationValue"));
  objc_msgSend(v4, "encodeBool:forKey:", -[FCPersonalizationCohortConfig useExponentialFavoritedBoost](self, "useExponentialFavoritedBoost"), CFSTR("useExponentialFavoritedBoost"));

}

- (void)setConsiderPublisherTopicAggregates:(BOOL)a3
{
  self->_considerPublisherTopicAggregates = a3;
}

- (void)setDilutionFactor:(double)a3
{
  self->_dilutionFactor = a3;
}

- (void)setEnableUndampening:(BOOL)a3
{
  self->_enableUndampening = a3;
}

- (void)setFavoritedBoost:(double)a3
{
  self->_favoritedBoost = a3;
}

- (void)setExponentialFavoritedBoost:(double)a3
{
  self->_exponentialFavoritedBoost = a3;
}

- (void)setGlobalWeight:(double)a3
{
  self->_globalWeight = a3;
}

- (void)setGlobalWeightHalfLife:(double)a3
{
  self->_globalWeightHalfLife = a3;
}

- (void)setGlobalWeightInitialMultiplier:(double)a3
{
  self->_globalWeightInitialMultiplier = a3;
}

- (void)setPaddingFactor:(double)a3
{
  self->_paddingFactor = a3;
}

- (void)setPreBaselineCurvature:(double)a3
{
  self->_preBaselineCurvature = a3;
}

- (void)setPostBaselineCurvature:(double)a3
{
  self->_postBaselineCurvature = a3;
}

- (void)setUndampenOnlyAboveBaselineMembership:(BOOL)a3
{
  self->_undampenOnlyAboveBaselineMembership = a3;
}

- (void)setUserBaseline:(double)a3
{
  self->_userBaseline = a3;
}

- (void)setUseRelativePersonalizationValue:(BOOL)a3
{
  self->_useRelativePersonalizationValue = a3;
}

- (void)setUseExponentialFavoritedBoost:(BOOL)a3
{
  self->_useExponentialFavoritedBoost = a3;
}

@end
