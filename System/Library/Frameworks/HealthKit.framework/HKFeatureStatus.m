@implementation HKFeatureStatus

- (HKFeatureStatus)initWithOnboardingRecord:(id)a3 requirementsEvaluationByContext:(id)a4
{
  id v6;
  id v7;
  HKFeatureStatus *v8;
  uint64_t v9;
  HKFeatureOnboardingRecord *onboardingRecord;
  uint64_t v11;
  NSDictionary *requirementsEvaluationByContext;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKFeatureStatus;
  v8 = -[HKFeatureStatus init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    onboardingRecord = v8->_onboardingRecord;
    v8->_onboardingRecord = (HKFeatureOnboardingRecord *)v9;

    v11 = objc_msgSend(v7, "copy");
    requirementsEvaluationByContext = v8->_requirementsEvaluationByContext;
    v8->_requirementsEvaluationByContext = (NSDictionary *)v11;

  }
  return v8;
}

- (BOOL)isOnboardingRecordPresent
{
  return -[HKFeatureOnboardingRecord isOnboardingPresent](self->_onboardingRecord, "isOnboardingPresent");
}

- (BOOL)includesContext:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSDictionary objectForKeyedSubscript:](self->_requirementsEvaluationByContext, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  HKFeatureAvailabilityRequirementsEvaluation *v6;
  NSObject *v7;
  HKFeatureAvailabilityRequirementsEvaluation *v8;
  void *v9;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_requirementsEvaluationByContext, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_requirementsEvaluationByContext, "objectForKeyedSubscript:", v4);
    v6 = (HKFeatureAvailabilityRequirementsEvaluation *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[HKFeatureStatus objectForKeyedSubscript:].cold.1((uint64_t)self, (uint64_t)v4, v7);

    v8 = [HKFeatureAvailabilityRequirementsEvaluation alloc];
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", CFSTR("InvalidRequirement"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HKFeatureAvailabilityRequirementsEvaluation initWithRequirementIdentifiersOrderedByPriority:satisfactionByRequirementIdentifier:](v8, "initWithRequirementIdentifiersOrderedByPriority:satisfactionByRequirementIdentifier:", v9, &unk_1E389D300);

  }
  return v6;
}

- (id)copyUpdatingRequirement:(id)a3 fromRequirements:(id)a4 isSatisfied:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  NSDictionary *requirementsEvaluationByContext;
  HKFeatureOnboardingRecord *onboardingRecord;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  BOOL v21;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc((Class)objc_opt_class());
  onboardingRecord = self->_onboardingRecord;
  requirementsEvaluationByContext = self->_requirementsEvaluationByContext;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__HKFeatureStatus_copyUpdatingRequirement_fromRequirements_isSatisfied___block_invoke;
  v18[3] = &unk_1E37EB0D8;
  v19 = v9;
  v20 = v8;
  v21 = a5;
  v13 = v8;
  v14 = v9;
  -[NSDictionary hk_map:](requirementsEvaluationByContext, "hk_map:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v10, "initWithOnboardingRecord:requirementsEvaluationByContext:", onboardingRecord, v15);

  return v16;
}

void __72__HKFeatureStatus_copyUpdatingRequirement_fromRequirements_isSatisfied___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, id, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "requirementsByContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v7, "copyUpdatingRequirementForIdentifier:isSatisfied:", v12, *(unsigned __int8 *)(a1 + 48));

    v8[2](v8, v14, v13);
  }
  else
  {
    v8[2](v8, v14, v7);
  }

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
    if (-[HKFeatureOnboardingRecord isEqual:](self->_onboardingRecord, "isEqual:", v5[1]))
      v6 = -[NSDictionary isEqualToDictionary:](self->_requirementsEvaluationByContext, "isEqualToDictionary:", v5[2]);
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
  unint64_t v3;

  v3 = -[HKFeatureOnboardingRecord hash](self->_onboardingRecord, "hash");
  return -[NSDictionary hash](self->_requirementsEvaluationByContext, "hash") ^ v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p record:%@ evaluationByContext:%@>"), objc_opt_class(), self, self->_onboardingRecord, self->_requirementsEvaluationByContext);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFeatureStatus)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HKFeatureStatus *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureOnboardingRecord"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "hk_typesForDictionaryMapping:to:", v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("requirementsEvaluationByContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HKFeatureStatus initWithOnboardingRecord:requirementsEvaluationByContext:](self, "initWithOnboardingRecord:requirementsEvaluationByContext:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  HKFeatureOnboardingRecord *onboardingRecord;
  id v5;

  onboardingRecord = self->_onboardingRecord;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", onboardingRecord, CFSTR("featureOnboardingRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requirementsEvaluationByContext, CFSTR("requirementsEvaluationByContext"));

}

- (HKFeatureOnboardingRecord)onboardingRecord
{
  return self->_onboardingRecord;
}

- (NSDictionary)requirementsEvaluationByContext
{
  return self->_requirementsEvaluationByContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirementsEvaluationByContext, 0);
  objc_storeStrong((id *)&self->_onboardingRecord, 0);
}

- (void)objectForKeyedSubscript:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a2;
  v5 = v7;
  _os_log_fault_impl(&dword_19A0E6000, a3, OS_LOG_TYPE_FAULT, "[%{public}@]: Subscripted with unknown context %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
