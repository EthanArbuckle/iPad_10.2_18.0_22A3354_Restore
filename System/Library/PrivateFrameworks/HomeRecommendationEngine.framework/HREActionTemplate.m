@implementation HREActionTemplate

- (NSDictionary)actionMap
{
  NSDictionary *actionMap;
  NSDictionary *v4;
  NSDictionary *v5;

  actionMap = self->_actionMap;
  if (!actionMap)
  {
    -[HREActionTemplate _lazy_actionMap](self, "_lazy_actionMap");
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_actionMap;
    self->_actionMap = v4;

    actionMap = self->_actionMap;
  }
  return actionMap;
}

- (id)_lazy_actionMap
{
  return 0;
}

- (HREActionVarianceCollection)allowedVariance
{
  HREActionVarianceCollection *allowedVariance;
  HREActionVarianceCollection *v4;
  HREActionVarianceCollection *v5;

  allowedVariance = self->_allowedVariance;
  if (!allowedVariance)
  {
    -[HREActionTemplate _lazy_allowedVariance](self, "_lazy_allowedVariance");
    v4 = (HREActionVarianceCollection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_allowedVariance;
    self->_allowedVariance = v4;

    allowedVariance = self->_allowedVariance;
  }
  return allowedVariance;
}

- (id)_lazy_allowedVariance
{
  return 0;
}

- (id)createStarterRecommendationInHome:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HREActionTemplate;
  -[HRETemplate createStarterRecommendationInHome:](&v9, sel_createStarterRecommendationInHome_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_255A52378))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HREActionTemplate allowedVariance](self, "allowedVariance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowedVariance:", v7);

  }
  return v4;
}

- (id)involvedAccessoryTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[HREActionTemplate actionMap](self, "actionMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HREActionTemplate extraInvolvedTypes](self, "extraInvolvedTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)extraInvolvedTypes
{
  return self->_extraInvolvedTypes;
}

- (void)setExtraInvolvedTypes:(id)a3
{
  objc_storeStrong((id *)&self->_extraInvolvedTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraInvolvedTypes, 0);
  objc_storeStrong((id *)&self->_allowedVariance, 0);
  objc_storeStrong((id *)&self->_actionMap, 0);
}

@end
