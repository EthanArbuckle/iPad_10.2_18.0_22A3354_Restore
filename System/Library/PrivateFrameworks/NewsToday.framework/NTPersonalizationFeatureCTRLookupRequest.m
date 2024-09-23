@implementation NTPersonalizationFeatureCTRLookupRequest

- (NTPersonalizationFeatureCTRLookupRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPersonalizationFeatureCTRLookupRequest;
  return -[NTPersonalizationFeatureCTRLookupRequest init](&v3, sel_init);
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
    v9 = "-[NTPersonalizationFeatureCTRLookupRequest copyWithZone:]";
    v10 = 2080;
    v11 = "NTPersonalizationFeatureCTRLookupOperation.m";
    v12 = 1024;
    v13 = 21;
    v14 = 2114;
    v15 = v3;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTPersonalizationFeatureCTRLookupRequest copyWithZone:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (FCPersonalizationFeature)personalizationFeature
{
  return self->_personalizationFeature;
}

- (void)setPersonalizationFeature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)clickPrior
{
  return self->_clickPrior;
}

- (void)setClickPrior:(double)a3
{
  self->_clickPrior = a3;
}

- (double)impressionPrior
{
  return self->_impressionPrior;
}

- (void)setImpressionPrior:(double)a3
{
  self->_impressionPrior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizationFeature, 0);
}

@end
