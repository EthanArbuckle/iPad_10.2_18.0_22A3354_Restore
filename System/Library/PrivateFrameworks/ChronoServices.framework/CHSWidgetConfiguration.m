@implementation CHSWidgetConfiguration

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CHSWidgetConfiguration.m"), 26, CFSTR("use initWithContainerDescriptors:metricsSpecification:"));

  return 0;
}

- (CHSWidgetConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSWidgetConfiguration.m"), 31, CFSTR("use initWithContainerDescriptors:metricsSpecification:"));

  return 0;
}

- (CHSWidgetConfiguration)initWithContainerDescriptors:(id)a3 metricsSpecification:(id)a4
{
  id v6;
  id v7;
  CHSWidgetConfiguration *v8;
  uint64_t v9;
  NSArray *containerDescriptors;
  uint64_t v11;
  CHSWidgetMetricsSpecification *metricsSpecification;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHSWidgetConfiguration;
  v8 = -[CHSWidgetConfiguration init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    containerDescriptors = v8->_containerDescriptors;
    v8->_containerDescriptors = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    metricsSpecification = v8->_metricsSpecification;
    v8->_metricsSpecification = (CHSWidgetMetricsSpecification *)v11;

  }
  return v8;
}

- (CHSWidgetConfiguration)initWithConfiguration:(id)a3
{
  id *v4;
  CHSWidgetConfiguration *v5;
  uint64_t v6;
  NSArray *containerDescriptors;
  uint64_t v8;
  CHSWidgetMetricsSpecification *metricsSpecification;
  uint64_t v10;
  NSSet *rateLimitPolicies;
  objc_super v13;

  v4 = (id *)a3;
  v13.receiver = self;
  v13.super_class = (Class)CHSWidgetConfiguration;
  v5 = -[CHSWidgetConfiguration init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4[1], "copy");
    containerDescriptors = v5->_containerDescriptors;
    v5->_containerDescriptors = (NSArray *)v6;

    v8 = objc_msgSend(v4[2], "copy");
    metricsSpecification = v5->_metricsSpecification;
    v5->_metricsSpecification = (CHSWidgetMetricsSpecification *)v8;

    v10 = objc_msgSend(v4[3], "copy");
    rateLimitPolicies = v5->_rateLimitPolicies;
    v5->_rateLimitPolicies = (NSSet *)v10;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  NSArray *containerDescriptors;
  uint64_t v11;
  id v12;
  id v13;
  CHSWidgetMetricsSpecification *metricsSpecification;
  id v15;
  id v16;
  NSSet *rateLimitPolicies;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  containerDescriptors = self->_containerDescriptors;
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __34__CHSWidgetConfiguration_isEqual___block_invoke;
  v25[3] = &unk_1E2A5A218;
  v12 = v9;
  v26 = v12;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", containerDescriptors, v25);
  metricsSpecification = self->_metricsSpecification;
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __34__CHSWidgetConfiguration_isEqual___block_invoke_2;
  v23[3] = &unk_1E2A5A240;
  v15 = v12;
  v24 = v15;
  v16 = (id)objc_msgSend(v5, "appendObject:counterpart:", metricsSpecification, v23);
  rateLimitPolicies = self->_rateLimitPolicies;
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __34__CHSWidgetConfiguration_isEqual___block_invoke_3;
  v21[3] = &unk_1E2A5A268;
  v18 = v15;
  v22 = v18;
  v19 = (id)objc_msgSend(v5, "appendObject:counterpart:", rateLimitPolicies, v21);
  LOBYTE(v15) = objc_msgSend(v5, "isEqual");

  return (char)v15;
}

uint64_t __34__CHSWidgetConfiguration_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "containerDescriptors");
}

uint64_t __34__CHSWidgetConfiguration_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "metricsSpecification");
}

uint64_t __34__CHSWidgetConfiguration_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rateLimitPolicies");
}

- (unint64_t)hash
{
  return 23 * -[NSArray hash](self->_containerDescriptors, "hash");
}

- (NSString)description
{
  return (NSString *)-[CHSWidgetConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSWidgetConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  CHSWidgetConfiguration *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__CHSWidgetConfiguration_succinctDescriptionBuilder__block_invoke;
  v8[3] = &unk_1E2A5A290;
  v4 = v3;
  v9 = v4;
  v10 = self;
  v5 = (id)objc_msgSend(v4, "modifyProem:", v8);
  v6 = v4;

  return v6;
}

id __52__CHSWidgetConfiguration_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 40;
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "count"), CFSTR("containerCount"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(*(_QWORD *)v2 + 8);
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "widgets", (_QWORD)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        v5 += v10;
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", v5, CFSTR("widgets"));
  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "succinctDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v12, "appendObject:withName:", v13, CFSTR("metrics"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count"), CFSTR("rateLimitCount"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSWidgetConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CHSWidgetConfiguration *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__CHSWidgetConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E2A5A290;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  return v7;
}

id __64__CHSWidgetConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a1 + 40;
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("metricsSpecification"));
  v5 = (id)objc_msgSend(*v2, "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)v3 + 8), "count"), CFSTR("containerCount"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = *(id *)(*(_QWORD *)v3 + 8);
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "widgets", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        v7 += v12;
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", v7, CFSTR("widgets"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("rateLimits"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHSWidgetConfiguration initWithConfiguration:](+[CHSMutableWidgetConfiguration allocWithZone:](CHSMutableWidgetConfiguration, "allocWithZone:", a3), "initWithConfiguration:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSArray *obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  CHSWidgetConfiguration *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v35 = (void *)objc_opt_new();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v34 = self;
  v4 = self->_rateLimitPolicies;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v45 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v8, v9);

      }
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v5);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v34->_containerDescriptors;
  v31 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v41 != v30)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v10, "widgets");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v37;
          do
          {
            for (k = 0; k != v12; ++k)
            {
              if (*(_QWORD *)v37 != v13)
                objc_enumerationMutation(v11);
              v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * k);
              objc_msgSend(v15, "refreshStrategy");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v17 = v16;
                objc_msgSend(v17, "rateLimitIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = v18 == 0;

                if (!v19)
                {
                  objc_msgSend(v17, "rateLimitIdentifier");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "objectForKeyedSubscript:", v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = v21 == 0;

                  if (v22)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "rateLimitIdentifier");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    CHSLogChronoServices();
                    v25 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
                    {
                      objc_msgSend(v17, "rateLimitIdentifier");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v49 = v15;
                      v50 = 2114;
                      v51 = v26;

                    }
                  }
                }

              }
            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
          }
          while (v12);
        }

      }
      v31 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    }
    while (v31);
  }

  objc_msgSend(v28, "encodeObject:forKey:", v34->_containerDescriptors, CFSTR("_containerDescriptors"));
  objc_msgSend(v28, "encodeObject:forKey:", v34->_metricsSpecification, CFSTR("_metricsSpecification"));
  -[NSSet allObjects](v34->_rateLimitPolicies, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v27, CFSTR("rateLimits2"));

}

- (CHSWidgetConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  CHSWidgetConfiguration *v17;
  CHSWidgetConfiguration *v18;
  CHSWidgetConfiguration *v19;
  uint64_t v20;
  NSSet *rateLimitPolicies;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("_containerDescriptors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_metricsSpecification"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("rateLimits2")))
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("rateLimits2"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("rateLimits")))
    {
      v13 = 0;
      goto LABEL_7;
    }
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("rateLimits"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:
  v17 = 0;
  if (v8 && v9)
  {
    v18 = -[CHSWidgetConfiguration initWithContainerDescriptors:metricsSpecification:](self, "initWithContainerDescriptors:metricsSpecification:", v8, v9);
    v19 = v18;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
      v20 = objc_claimAutoreleasedReturnValue();
      rateLimitPolicies = v19->_rateLimitPolicies;
      v19->_rateLimitPolicies = (NSSet *)v20;
    }
    else
    {
      rateLimitPolicies = v18->_rateLimitPolicies;
      v18->_rateLimitPolicies = 0;
    }

    self = v19;
    v17 = self;
  }

  return v17;
}

- (NSArray)containerDescriptors
{
  return self->_containerDescriptors;
}

- (CHSWidgetMetricsSpecification)metricsSpecification
{
  return self->_metricsSpecification;
}

- (NSSet)rateLimitPolicies
{
  return self->_rateLimitPolicies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimitPolicies, 0);
  objc_storeStrong((id *)&self->_metricsSpecification, 0);
  objc_storeStrong((id *)&self->_containerDescriptors, 0);
}

@end
