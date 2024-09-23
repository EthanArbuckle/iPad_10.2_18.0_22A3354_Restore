@implementation HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff

- (HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff)initWithFeatureIdentifier:(id)a3
{
  return (HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff *)-[HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff initWithFeatureIdentifier:context:]((id *)&self->super.super.isa, a3, CFSTR("MutualExclusivityEnforcement"));
}

- (id)initWithFeatureIdentifier:(void *)a3 context:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("MutuallyExclusiveFeatureIsOff");
}

- (NSString)requirementDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ must have at least one unsatisfied requirement in %@"), self->_featureIdentifier, self->_context);
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "featureStatusForFeatureWithIdentifier:context:error:", self->_featureIdentifier, self->_context, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff _isSatisfiedWithFeatureStatus:]((uint64_t)self, v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_isSatisfiedWithFeatureStatus:(uint64_t)a1
{
  void *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 16));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areAllRequirementsSatisfied") ^ 1;

  return v3;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v7;
  id v8;
  HKFeatureIdentifierAndContext *v9;
  void *v10;
  _QWORD v11[6];

  v7 = a4;
  v8 = a3;
  v9 = -[HKFeatureIdentifierAndContext initWithFeatureIdentifier:context:]([HKFeatureIdentifierAndContext alloc], "initWithFeatureIdentifier:context:", self->_featureIdentifier, self->_context);
  objc_msgSend(v7, "featureStatusProvidingDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96__HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff_registerObserver_forDataSource___block_invoke;
  v11[3] = &unk_1E37EE9C8;
  v11[4] = self;
  v11[5] = a2;
  objc_msgSend(v10, "registerObserver:forKey:newValueHandler:", v8, v9, v11);

}

void __96__HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff.m"), 79, CFSTR("[%@] Feature status should never be nil"), objc_opt_class());

  }
  objc_msgSend(v7, "featureAvailabilityRequirement:didUpdateSatisfaction:", *(_QWORD *)(a1 + 32), -[HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff _isSatisfiedWithFeatureStatus:](*(_QWORD *)(a1 + 32), v5));

}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HKFeatureIdentifierAndContext *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[HKFeatureIdentifierAndContext initWithFeatureIdentifier:context:]([HKFeatureIdentifierAndContext alloc], "initWithFeatureIdentifier:context:", self->_featureIdentifier, self->_context);
  objc_msgSend(v6, "featureStatusProvidingDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "unregisterObserver:forKey:", v7, v9);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[NSString isEqualToString:](self->_featureIdentifier, "isEqualToString:", v5[1]))
      v6 = -[NSString isEqualToString:](self->_context, "isEqualToString:", v5[2]);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_featureIdentifier, "hash");
  return -[NSString hash](self->_context, "hash") ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *featureIdentifier;
  id v5;

  featureIdentifier = self->_featureIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", featureIdentifier, CFSTR("featureIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_context, CFSTR("context"));

}

- (HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff *)-[HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff initWithFeatureIdentifier:context:]((id *)&self->super.super.isa, v5, v6);
  return v7;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
