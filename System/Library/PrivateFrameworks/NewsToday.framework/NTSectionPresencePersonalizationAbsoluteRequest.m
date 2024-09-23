@implementation NTSectionPresencePersonalizationAbsoluteRequest

- (NTSectionPresencePersonalizationAbsoluteRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTSectionPresencePersonalizationAbsoluteRequest;
  return -[NTSectionPresencePersonalizationAbsoluteRequest init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v9 = "-[NTSectionPresencePersonalizationAbsoluteRequest copyWithZone:]";
    v10 = 2080;
    v11 = "NTSectionPresencePersonalizationOperation.m";
    v12 = 1024;
    v13 = 23;
    v14 = 2114;
    v15 = v3;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTSectionPresencePersonalizationAbsoluteRequest copyWithZone:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (FCPersonalizationFeature)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)featureClickPrior
{
  return self->_featureClickPrior;
}

- (void)setFeatureClickPrior:(double)a3
{
  self->_featureClickPrior = a3;
}

- (double)featureImpressionPrior
{
  return self->_featureImpressionPrior;
}

- (void)setFeatureImpressionPrior:(double)a3
{
  self->_featureImpressionPrior = a3;
}

- (NTAbsolutePersonalizedSectionPresenceConfig)absolutePresenceConfig
{
  return self->_absolutePresenceConfig;
}

- (void)setAbsolutePresenceConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_absolutePresenceConfig, 0);
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
