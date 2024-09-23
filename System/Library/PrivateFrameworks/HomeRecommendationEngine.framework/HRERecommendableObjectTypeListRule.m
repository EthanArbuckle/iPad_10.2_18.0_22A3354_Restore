@implementation HRERecommendableObjectTypeListRule

- (HRERecommendableObjectTypeListRule)initWithRequiredTypeGroup:(id)a3
{
  id v4;
  HRERecommendableObjectTypeListRule *v5;
  uint64_t v6;
  NSSet *typesSatisfyingRequirement;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRERecommendableObjectTypeListRule;
  v5 = -[HRERule _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    typesSatisfyingRequirement = v5->_typesSatisfyingRequirement;
    v5->_typesSatisfyingRequirement = (NSSet *)v6;

  }
  return v5;
}

+ (id)ruleRequiringOneOfTypes:(id)a3
{
  id v3;
  HRERecommendableObjectTypeListRule *v4;

  v3 = a3;
  v4 = -[HRERecommendableObjectTypeListRule initWithRequiredTypeGroup:]([HRERecommendableObjectTypeListRule alloc], "initWithRequiredTypeGroup:", v3);

  return v4;
}

- (BOOL)passesWithHomeObjects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[HRERecommendableObjectTypeListRule typesSatisfyingRequirement](self, "typesSatisfyingRequirement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_types:notMatchedByObjects:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  -[HRERecommendableObjectTypeListRule typesSatisfyingRequirement](self, "typesSatisfyingRequirement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = v8 < objc_msgSend(v9, "count");

  return v8;
}

- (NSSet)typesSatisfyingRequirement
{
  return self->_typesSatisfyingRequirement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typesSatisfyingRequirement, 0);
}

@end
