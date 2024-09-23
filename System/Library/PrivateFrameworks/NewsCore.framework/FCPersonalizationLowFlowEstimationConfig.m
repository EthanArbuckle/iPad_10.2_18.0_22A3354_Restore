@implementation FCPersonalizationLowFlowEstimationConfig

- (FCPersonalizationLowFlowEstimationConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCPersonalizationLowFlowEstimationConfig *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPersonalizationLowFlowEstimationConfig;
  v5 = -[FCPersonalizationLowFlowEstimationConfig init](&v14, sel_init);
  if (v5)
  {
    v6 = 0.5;
    v7 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("exponent"), 0.5);
    if (v7 >= 0.0)
      v6 = v7;
    v8 = 10.0;
    v9 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("padding"), 10.0);
    if (v9 >= 0.0)
      v8 = v9;
    v10 = FCAppConfigurationDoubleValue(v4, (uint64_t)CFSTR("prior"), 0.1);
    if (v10 > 1.0 || v10 < 0.0)
      v12 = 0.1;
    else
      v12 = v10;
    v5 = -[FCPersonalizationLowFlowEstimationConfig initWithExponent:padding:prior:](v5, "initWithExponent:padding:prior:", v6, v8, v12);
  }

  return v5;
}

- (FCPersonalizationLowFlowEstimationConfig)initWithExponent:(double)a3 padding:(double)a4 prior:(double)a5
{
  FCPersonalizationLowFlowEstimationConfig *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FCPersonalizationLowFlowEstimationConfig;
  result = -[FCPersonalizationLowFlowEstimationConfig init](&v9, sel_init);
  if (result)
  {
    result->_exponent = a3;
    result->_padding = a4;
    result->_prior = a5;
  }
  return result;
}

- (double)prior
{
  return self->_prior;
}

- (double)padding
{
  return self->_padding;
}

- (double)exponent
{
  return self->_exponent;
}

- (FCPersonalizationLowFlowEstimationConfig)init
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
    v8 = "-[FCPersonalizationLowFlowEstimationConfig init]";
    v9 = 2080;
    v10 = "FCPersonalizationLowFlowEstimationConfig.m";
    v11 = 1024;
    v12 = 18;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPersonalizationLowFlowEstimationConfig init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationLowFlowEstimationConfig)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("exponent"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("padding"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("prior"));
  v10 = v9;

  return -[FCPersonalizationLowFlowEstimationConfig initWithExponent:padding:prior:](self, "initWithExponent:padding:prior:", v6, v8, v10);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[FCPersonalizationLowFlowEstimationConfig exponent](self, "exponent");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("exponent"));
  -[FCPersonalizationLowFlowEstimationConfig padding](self, "padding");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("padding"));
  -[FCPersonalizationLowFlowEstimationConfig prior](self, "prior");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("prior"));

}

- (void)setExponent:(double)a3
{
  self->_exponent = a3;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (void)setPrior:(double)a3
{
  self->_prior = a3;
}

@end
