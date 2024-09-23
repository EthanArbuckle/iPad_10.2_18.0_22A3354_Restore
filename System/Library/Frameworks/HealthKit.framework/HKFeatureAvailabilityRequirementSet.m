@implementation HKFeatureAvailabilityRequirementSet

- (HKFeatureAvailabilityRequirementSet)initWithRequirementsByContext:(id)a3
{
  void *v4;
  HKFeatureAvailabilityRequirementSet *v5;

  objc_msgSend(a3, "hk_map:", &__block_literal_global_54);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (HKFeatureAvailabilityRequirementSet *)-[HKFeatureAvailabilityRequirementSet _initWithRequirementsByContext:](self, v4);

  return v5;
}

void __69__HKFeatureAvailabilityRequirementSet_initWithRequirementsByContext___block_invoke(uint64_t a1, void *a2, void *a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;
  id v9;

  v7 = a4;
  v8 = a2;
  objc_msgSend(a3, "_hk_featureAvailabilityRequirements");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))a4)[2](v7, v8, v9);

}

- (_QWORD)_initWithRequirementsByContext:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)HKFeatureAvailabilityRequirementSet;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

    }
  }

  return a1;
}

+ (id)noRequirements
{
  HKFeatureAvailabilityRequirementSet *v2;

  v2 = [HKFeatureAvailabilityRequirementSet alloc];
  return -[HKFeatureAvailabilityRequirementSet _initWithRequirementsByContext:](v2, MEMORY[0x1E0C9AA70]);
}

- (id)evaluationByContextWithDataSource:(void *)a3 overrides:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__23;
    v29 = __Block_byref_object_dispose__23;
    v30 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v9 = *(void **)(a1 + 8);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __89__HKFeatureAvailabilityRequirementSet_evaluationByContextWithDataSource_overrides_error___block_invoke;
    v16[3] = &unk_1E37EEED8;
    v16[4] = a1;
    v17 = v7;
    v18 = v8;
    v19 = &v25;
    v20 = &v21;
    objc_msgSend(v9, "hk_map:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (*((_BYTE *)v22 + 24))
    {
      v12 = (id)v26[5];
      v13 = v12;
      if (v12)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v12);
        else
          _HKLogDroppedError(v12);
      }

      v14 = 0;
    }
    else
    {
      v14 = v10;
    }

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __89__HKFeatureAvailabilityRequirementSet_evaluationByContextWithDataSource_overrides_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void (**v7)(id, id, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id obj;

  v6 = a2;
  v7 = a4;
  v8 = a1[4];
  v9 = (void *)a1[5];
  v10 = (void *)a1[6];
  v11 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v11 + 40);
  -[HKFeatureAvailabilityRequirementSet evaluationForContext:dataSource:overrides:error:](v8, (uint64_t)v6, v9, v10, (uint64_t)&obj);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
    v7[2](v7, v6, v12);
  else
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;

}

- (id)evaluationForContext:(void *)a3 dataSource:(void *)a4 overrides:(uint64_t)a5 error:
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  if (a1)
  {
    v8 = *(void **)(a1 + 8);
    v9 = a4;
    v10 = a3;
    objc_msgSend(v8, "objectForKeyedSubscript:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKFeatureAvailabilityRequirementsEvaluation evaluationOfRequirements:dataSource:overrides:error:](HKFeatureAvailabilityRequirementsEvaluation, "evaluationOfRequirements:dataSource:overrides:error:", v11, v10, v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)allRequirementIdentifiers
{
  void *v2;
  void *v3;

  -[HKFeatureAvailabilityRequirementSet allRequirements](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_7_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_QWORD)allRequirements
{
  _QWORD *v1;
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)v1[1];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__HKFeatureAvailabilityRequirementSet_allRequirements__block_invoke;
    v6[3] = &unk_1E37EEF20;
    v7 = v2;
    v4 = v2;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v4);
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

uint64_t __64__HKFeatureAvailabilityRequirementSet_allRequirementIdentifiers__block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
}

uint64_t __54__HKFeatureAvailabilityRequirementSet_allRequirements__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (_QWORD)allObservableRequirements
{
  _QWORD *v1;
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)v1[1];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__HKFeatureAvailabilityRequirementSet_allObservableRequirements__block_invoke;
    v6[3] = &unk_1E37EEF20;
    v7 = v2;
    v4 = v2;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v4);
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

void __64__HKFeatureAvailabilityRequirementSet_allObservableRequirements__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE3AB2A0))
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (_QWORD)allHealthDataRequirements
{
  _QWORD *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v1 = a1;
  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[HKFeatureAvailabilityRequirementSet allRequirements](v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v2, "addObject:", v8, (_QWORD)v10);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    v1 = (_QWORD *)objc_msgSend(v2, "copy");
  }
  return v1;
}

- (uint64_t)copyApplyingContextConstraint:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc((Class)objc_opt_class());
    v5 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__HKFeatureAvailabilityRequirementSet_copyApplyingContextConstraint___block_invoke;
    v8[3] = &unk_1E37EEF48;
    v9 = v3;
    objc_msgSend(v5, "hk_filter:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = objc_msgSend(v4, "initWithRequirementsByContext:", v6);

  }
  return a1;
}

uint64_t __69__HKFeatureAvailabilityRequirementSet_copyApplyingContextConstraint___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "acceptsContext:", a2);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[NSDictionary isEqualToDictionary:](self->_requirementsByContext, "isEqualToDictionary:", v4[1]);

  return v5;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_requirementsByContext, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFeatureAvailabilityRequirementSet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKFeatureAvailabilityRequirementSet *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKAllFeatureAvailabilityRequirementTypes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("requirementsByContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (HKFeatureAvailabilityRequirementSet *)-[HKFeatureAvailabilityRequirementSet _initWithRequirementsByContext:](self, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_requirementsByContext, CFSTR("requirementsByContext"));
}

- (NSDictionary)requirementsByContext
{
  return self->_requirementsByContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirementsByContext, 0);
}

@end
