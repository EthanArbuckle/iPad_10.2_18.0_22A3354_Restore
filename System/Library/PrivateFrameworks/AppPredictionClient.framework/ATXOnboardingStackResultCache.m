@implementation ATXOnboardingStackResultCache

- (ATXOnboardingStackResultCache)initWithUnknownBatteryDrainResult:(id)a3 lightBatteryDrainResult:(id)a4 mediumBatteryDrainResult:(id)a5 heavyBatteryDrainResult:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXOnboardingStackResultCache *v15;
  ATXOnboardingStackResultCache *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXOnboardingStackResultCache;
  v15 = -[ATXOnboardingStackResultCache init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_unknownBatteryDrainResult, a3);
    objc_storeStrong((id *)&v16->_lightBatteryDrainResult, a4);
    objc_storeStrong((id *)&v16->_mediumBatteryDrainResult, a5);
    objc_storeStrong((id *)&v16->_heavyBatteryDrainResult, a6);
  }

  return v16;
}

- (id)resultForClassification:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0uLL:
      -[ATXOnboardingStackResultCache unknownBatteryDrainResult](self, "unknownBatteryDrainResult", v3, v4);
      self = (ATXOnboardingStackResultCache *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      -[ATXOnboardingStackResultCache lightBatteryDrainResult](self, "lightBatteryDrainResult", v3, v4);
      self = (ATXOnboardingStackResultCache *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      -[ATXOnboardingStackResultCache mediumBatteryDrainResult](self, "mediumBatteryDrainResult", v3, v4);
      self = (ATXOnboardingStackResultCache *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      -[ATXOnboardingStackResultCache heavyBatteryDrainResult](self, "heavyBatteryDrainResult", v3, v4);
      self = (ATXOnboardingStackResultCache *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return self;
  }
  return self;
}

- (ATXOnboardingStackResultCache)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  ATXOnboardingStackResultCache *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unknownBatteryDrainResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lightBatteryDrainResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediumBatteryDrainResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("heavyBatteryDrainResult"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0 || v8 == 0)
    v12 = 0;
  else
    v12 = (ATXOnboardingStackResultCache *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUnknownBatteryDrainResult:lightBatteryDrainResult:mediumBatteryDrainResult:heavyBatteryDrainResult:", v5, v6, v7, v8);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ATXOnboardingStackResult *unknownBatteryDrainResult;
  id v5;

  unknownBatteryDrainResult = self->_unknownBatteryDrainResult;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", unknownBatteryDrainResult, CFSTR("unknownBatteryDrainResult"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lightBatteryDrainResult, CFSTR("lightBatteryDrainResult"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediumBatteryDrainResult, CFSTR("mediumBatteryDrainResult"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_heavyBatteryDrainResult, CFSTR("heavyBatteryDrainResult"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUnknownBatteryDrainResult:lightBatteryDrainResult:mediumBatteryDrainResult:heavyBatteryDrainResult:", self->_unknownBatteryDrainResult, self->_lightBatteryDrainResult, self->_mediumBatteryDrainResult, self->_heavyBatteryDrainResult);
}

- (ATXOnboardingStackResult)unknownBatteryDrainResult
{
  return self->_unknownBatteryDrainResult;
}

- (void)setUnknownBatteryDrainResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ATXOnboardingStackResult)lightBatteryDrainResult
{
  return self->_lightBatteryDrainResult;
}

- (void)setLightBatteryDrainResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ATXOnboardingStackResult)mediumBatteryDrainResult
{
  return self->_mediumBatteryDrainResult;
}

- (void)setMediumBatteryDrainResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ATXOnboardingStackResult)heavyBatteryDrainResult
{
  return self->_heavyBatteryDrainResult;
}

- (void)setHeavyBatteryDrainResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heavyBatteryDrainResult, 0);
  objc_storeStrong((id *)&self->_mediumBatteryDrainResult, 0);
  objc_storeStrong((id *)&self->_lightBatteryDrainResult, 0);
  objc_storeStrong((id *)&self->_unknownBatteryDrainResult, 0);
}

@end
