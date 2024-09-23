@implementation CHSWidgetMetricsSpecification

- (CHSWidgetMetricsSpecification)init
{
  void *v3;
  void *v4;
  CHSWidgetMetricsSpecification *v5;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CHSWidgetMetricsSpecification _initWithMetricsByFamily:alternates:](self, "_initWithMetricsByFamily:alternates:", v3, v4);

  return v5;
}

- (CHSWidgetMetricsSpecification)initWithMetricsSpecification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CHSWidgetMetricsSpecification *v7;

  v4 = a3;
  objc_msgSend(v4, "metricsByFamily");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternatesByFamily");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CHSWidgetMetricsSpecification _initWithMetricsByFamily:alternates:](self, "_initWithMetricsByFamily:alternates:", v5, v6);

  return v7;
}

- (id)_initWithMetricsByFamily:(id)a3 alternates:(id)a4
{
  id v7;
  id v8;
  CHSWidgetMetricsSpecification *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHSWidgetMetricsSpecification;
  v9 = -[CHSWidgetMetricsSpecification init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metricsByFamily, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (unint64_t)families
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CHSWidgetMetricsSpecification metricsByFamily](self, "metricsByFamily", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v4 |= CHSWidgetFamilyMaskFromWidgetFamily(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "integerValue"));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return v4;
}

- (id)metricsForFamily:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CHSWidgetMetricsSpecification metricsByFamily](self, "metricsByFamily");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)alternateMetricsForFamily:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CHSWidgetMetricsSpecification alternatesByFamily](self, "alternatesByFamily");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CHSWidgetMetricsSpecification *v4;
  CHSWidgetMetricsSpecification *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (CHSWidgetMetricsSpecification *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CHSWidgetMetricsSpecification metricsByFamily](self, "metricsByFamily");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHSWidgetMetricsSpecification metricsByFamily](v5, "metricsByFamily");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        -[CHSWidgetMetricsSpecification alternatesByFamily](self, "alternatesByFamily");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CHSWidgetMetricsSpecification alternatesByFamily](v5, "alternatesByFamily");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  return 3 * -[NSDictionary hash](self->_metricsByFamily, "hash");
}

- (NSString)description
{
  return (NSString *)-[CHSWidgetMetricsSpecification descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSWidgetMetricsSpecification succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  _QWORD v7[4];
  id v8;
  CHSWidgetMetricsSpecification *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CHSWidgetMetricsSpecification_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E2A5A290;
  v4 = v3;
  v8 = v4;
  v9 = self;
  objc_msgSend(v4, "appendProem:block:", self, v7);
  v5 = v4;

  return v5;
}

void __59__CHSWidgetMetricsSpecification_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  CHSWidgetFamilyMaskDescription(objc_msgSend(*(id *)(a1 + 40), "families"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:withName:");

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSWidgetMetricsSpecification descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__CHSWidgetMetricsSpecification_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E2A5A290;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __71__CHSWidgetMetricsSpecification_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__CHSWidgetMetricsSpecification_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v3[3] = &unk_1E2A5B5A0;
  v4 = v1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __71__CHSWidgetMetricsSpecification_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(a3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CHSWidgetFamilyDescription(objc_msgSend(v8, "integerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, v7);

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHSWidgetMetricsSpecification initWithMetricsSpecification:](+[CHSMutableWidgetMetricsSpecification allocWithZone:](CHSMutableWidgetMetricsSpecification, "allocWithZone:", a3), "initWithMetricsSpecification:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a3;
  -[CHSWidgetMetricsSpecification metricsByFamily](self, "metricsByFamily");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("metricsByFamily"));

  v5 = (void *)MEMORY[0x1E0C99E08];
  -[CHSWidgetMetricsSpecification alternatesByFamily](self, "alternatesByFamily");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CHSWidgetMetricsSpecification alternatesByFamily](self, "alternatesByFamily");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__CHSWidgetMetricsSpecification_encodeWithCoder___block_invoke;
  v11[3] = &unk_1E2A5B5C8;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("alternatesByFamily"));
}

void __49__CHSWidgetMetricsSpecification_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

- (CHSWidgetMetricsSpecification)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  id v18;
  id v19;
  CHSWidgetMetricsSpecification *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t);
  void *v25;
  id v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v5, objc_opt_class(), CFSTR("metricsByFamily"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E20];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  v27[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setByAddingObject:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = v9;
  v12 = v11;
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("alternatesByFamily"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nextObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v13, "count"));
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __47__CHSWidgetMetricsSpecification_initWithCoder___block_invoke;
    v25 = &unk_1E2A5B5F0;
    v18 = v17;
    v26 = v18;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", &v22);
    v19 = (id)objc_msgSend(v18, "copy", v22, v23, v24, v25);

  }
  else
  {
    v19 = v13;
  }
  v20 = 0;
  if (v6 && v19)
  {
    self = (CHSWidgetMetricsSpecification *)-[CHSWidgetMetricsSpecification _initWithMetricsByFamily:alternates:](self, "_initWithMetricsByFamily:alternates:", v6, v19);
    v20 = self;
  }

  return v20;
}

void __47__CHSWidgetMetricsSpecification_initWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

- (NSDictionary)metricsByFamily
{
  return self->_metricsByFamily;
}

- (NSDictionary)alternatesByFamily
{
  return self->_alternatesByFamily;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternatesByFamily, 0);
  objc_storeStrong((id *)&self->_metricsByFamily, 0);
}

@end
