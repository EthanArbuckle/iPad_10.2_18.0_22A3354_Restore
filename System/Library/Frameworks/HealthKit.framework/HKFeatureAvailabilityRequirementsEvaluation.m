@implementation HKFeatureAvailabilityRequirementsEvaluation

- (HKFeatureAvailabilityRequirementsEvaluation)initWithRequirementIdentifiersOrderedByPriority:(id)a3 satisfactionByRequirementIdentifier:(id)a4
{
  id v6;
  id v7;
  HKFeatureAvailabilityRequirementsEvaluation *v8;
  uint64_t v9;
  NSOrderedSet *requirementIdentifiersOrderedByPriority;
  uint64_t v11;
  NSDictionary *satisfactionByRequirementIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKFeatureAvailabilityRequirementsEvaluation;
  v8 = -[HKFeatureAvailabilityRequirementsEvaluation init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    requirementIdentifiersOrderedByPriority = v8->_requirementIdentifiersOrderedByPriority;
    v8->_requirementIdentifiersOrderedByPriority = (NSOrderedSet *)v9;

    v11 = objc_msgSend(v7, "copy");
    satisfactionByRequirementIdentifier = v8->_satisfactionByRequirementIdentifier;
    v8->_satisfactionByRequirementIdentifier = (NSDictionary *)v11;

  }
  return v8;
}

+ (id)evaluationOfRequirements:(id)a3 dataSource:(id)a4 overrides:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v40;
  Class v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v44 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v47 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "overriddenSatisfactionOfRequirementWithIdentifier:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = v18;
          v21 = 0;
        }
        else
        {
          v45 = 0;
          objc_msgSend(v16, "isSatisfiedWithDataSource:error:", v44, &v45);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v22 = v45;
          v21 = v22;
          if (!v20)
          {
            v28 = (void *)MEMORY[0x1E0CB35C8];
            if (v22)
            {
              objc_msgSend(v22, "domain");
              v43 = (Class)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v21, "code");
              objc_msgSend(v21, "userInfo");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = CFSTR("HKFeatureAvailabilityRequirementIdentifier");
              v53 = v17;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "hk_dictionaryByAddingEntriesFromDictionary:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v28;
              v33 = v43;
              objc_msgSend(v32, "errorWithDomain:code:userInfo:", v43, v29, v31);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v50 = CFSTR("HKFeatureAvailabilityRequirementIdentifier");
              v51 = v17;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
              v35 = objc_claimAutoreleasedReturnValue();
              v36 = v28;
              v33 = (void *)v35;
              objc_msgSend(v36, "hk_error:userInfo:", 2000, v35);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
            }

            v37 = v34;
            v38 = v37;
            if (v37)
            {
              if (a6)
                *a6 = objc_retainAutorelease(v37);
              else
                _HKLogDroppedError(v37);
            }

            v27 = 0;
            v25 = v11;
            goto LABEL_20;
          }
        }
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v13)
        continue;
      break;
    }
  }

  v23 = objc_alloc(MEMORY[0x1E0C99E40]);
  objc_msgSend(v11, "hk_map:", &__block_literal_global_16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithArray:", v24);

  v26 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "initWithRequirementIdentifiersOrderedByPriority:satisfactionByRequirementIdentifier:", v25, v17);
LABEL_20:

  return v27;
}

uint64_t __99__HKFeatureAvailabilityRequirementsEvaluation_evaluationOfRequirements_dataSource_overrides_error___block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
}

+ (id)emptyEvaluation
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithRequirementIdentifiersOrderedByPriority:satisfactionByRequirementIdentifier:", v3, MEMORY[0x1E0C9AA70]);

  return v4;
}

- (NSString)highestPriorityUnsatisfiedRequirement
{
  NSOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_requirementIdentifiersOrderedByPriority;
  v4 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_satisfactionByRequirementIdentifier, "objectForKeyedSubscript:", v8, (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

        if (!v10)
        {
          v11 = v8;
          goto LABEL_11;
        }
      }
      v5 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return (NSString *)v11;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKFeatureAvailabilityRequirementsEvaluation isRequirementSatisfiedWithIdentifier:](self, "isRequirementSatisfiedWithIdentifier:", a3));
}

- (BOOL)isRequirementSatisfiedWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_satisfactionByRequirementIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_satisfactionByRequirementIdentifier, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[HKFeatureAvailabilityRequirementsEvaluation isRequirementSatisfiedWithIdentifier:].cold.1((uint64_t)v4, v8);

    v7 = 0;
  }

  return v7;
}

- (BOOL)areAllRequirementsSatisfied
{
  void *v2;
  BOOL v3;

  -[HKFeatureAvailabilityRequirementsEvaluation highestPriorityUnsatisfiedRequirement](self, "highestPriorityUnsatisfiedRequirement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (NSArray)unsatisfiedRequirementIdentifiers
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[NSOrderedSet array](self->_requirementIdentifiersOrderedByPriority, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__HKFeatureAvailabilityRequirementsEvaluation_unsatisfiedRequirementIdentifiers__block_invoke;
  v6[3] = &unk_1E37EA180;
  v6[4] = self;
  objc_msgSend(v3, "hk_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __80__HKFeatureAvailabilityRequirementsEvaluation_unsatisfiedRequirementIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue") ^ 1;

  return v3;
}

- (id)copyUpdatingRequirementForIdentifier:(id)a3 isSatisfied:(BOOL)a4
{
  _BOOL8 v4;
  NSDictionary *satisfactionByRequirementIdentifier;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSOrderedSet *requirementIdentifiersOrderedByPriority;
  void *v14;
  void *v15;

  v4 = a4;
  satisfactionByRequirementIdentifier = self->_satisfactionByRequirementIdentifier;
  v7 = a3;
  -[NSDictionary objectForKeyedSubscript:](satisfactionByRequirementIdentifier, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[HKFeatureAvailabilityRequirementsEvaluation copyUpdatingRequirementForIdentifier:isSatisfied:].cold.1(v9);

  }
  v10 = (void *)-[NSDictionary mutableCopy](self->_satisfactionByRequirementIdentifier, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v7);

  v12 = objc_alloc((Class)objc_opt_class());
  requirementIdentifiersOrderedByPriority = self->_requirementIdentifiersOrderedByPriority;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithRequirementIdentifiersOrderedByPriority:satisfactionByRequirementIdentifier:", requirementIdentifiersOrderedByPriority, v14);

  return v15;
}

- (id)unsatisfiedRequirementIdentifiersDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[HKFeatureAvailabilityRequirementsEvaluation unsatisfiedRequirementIdentifiers](self, "unsatisfiedRequirementIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

__CFString *__91__HKFeatureAvailabilityRequirementsEvaluation_unsatisfiedRequirementIdentifiersDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  __CFString *v5;

  v2 = a2;
  if (HKFeatureAvailabilityRequirementIdentifierReflectsSensitiveData(v2)
    && (+[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "showSensitiveLogItems"),
        v3,
        !v4))
  {
    v5 = CFSTR("<sensitive>");
  }
  else
  {
    v5 = (__CFString *)v2;
  }

  return v5;
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
    if (-[NSOrderedSet isEqualToOrderedSet:](self->_requirementIdentifiersOrderedByPriority, "isEqualToOrderedSet:", v5[1]))
    {
      v6 = -[NSDictionary isEqualToDictionary:](self->_satisfactionByRequirementIdentifier, "isEqualToDictionary:", v5[2]);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSOrderedSet hash](self->_requirementIdentifiersOrderedByPriority, "hash");
  return -[NSDictionary hash](self->_satisfactionByRequirementIdentifier, "hash") ^ v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, self->_satisfactionByRequirementIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFeatureAvailabilityRequirementsEvaluation)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  HKFeatureAvailabilityRequirementsEvaluation *v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("requirementIdentifiersOrderedByPriority"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "hk_typesForDictionaryMapping:to:", v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("satisfactionByRequirementIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HKFeatureAvailabilityRequirementsEvaluation initWithRequirementIdentifiersOrderedByPriority:satisfactionByRequirementIdentifier:](self, "initWithRequirementIdentifiersOrderedByPriority:satisfactionByRequirementIdentifier:", v8, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSOrderedSet *requirementIdentifiersOrderedByPriority;
  id v5;

  requirementIdentifiersOrderedByPriority = self->_requirementIdentifiersOrderedByPriority;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requirementIdentifiersOrderedByPriority, CFSTR("requirementIdentifiersOrderedByPriority"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_satisfactionByRequirementIdentifier, CFSTR("satisfactionByRequirementIdentifier"));

}

- (NSOrderedSet)requirementIdentifiersOrderedByPriority
{
  return self->_requirementIdentifiersOrderedByPriority;
}

- (NSDictionary)satisfactionByRequirementIdentifier
{
  return self->_satisfactionByRequirementIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satisfactionByRequirementIdentifier, 0);
  objc_storeStrong((id *)&self->_requirementIdentifiersOrderedByPriority, 0);
}

- (void)isRequirementSatisfiedWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_FAULT, "Requesting satisfaction of unknown requirement with identifier %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)copyUpdatingRequirementForIdentifier:(os_log_t)log isSatisfied:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19A0E6000, log, OS_LOG_TYPE_FAULT, "Update requirements evaluation with a requirement not originally present", v1, 2u);
}

@end
