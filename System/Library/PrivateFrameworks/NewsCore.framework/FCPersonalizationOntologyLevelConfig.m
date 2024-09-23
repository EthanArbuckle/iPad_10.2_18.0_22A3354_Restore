@implementation FCPersonalizationOntologyLevelConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagWeightMapping, 0);
}

id __69__FCPersonalizationOntologyLevelConfig_initWithConfig_defaultConfig___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "integerValue"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (FCPersonalizationOntologyLevelConfig)initWithConfig:(id)a3
{
  id v4;
  FCPersonalizationOntologyLevelConfig *v5;
  void *v6;
  void *v7;
  FCPersonalizationOntologyLevelConfig *v8;
  FCPersonalizationOntologyLevelConfig *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCPersonalizationOntologyLevelConfig;
  v5 = -[FCPersonalizationOntologyLevelConfig init](&v11, sel_init);
  if (v5)
  {
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("tagWeightMapping"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "fc_dictionaryByTransformingKeysWithBlock:", &__block_literal_global_103);
      v8 = (FCPersonalizationOntologyLevelConfig *)objc_claimAutoreleasedReturnValue();
      v9 = -[FCPersonalizationOntologyLevelConfig initWithTagWeightMapping:](v5, "initWithTagWeightMapping:", v8);
      v5 = v9;
    }
    else
    {
      v8 = v5;
      v5 = -[FCPersonalizationOntologyLevelConfig initWithTagWeightMapping:](v8, "initWithTagWeightMapping:", MEMORY[0x1E0C9AA70]);
      v9 = v8;
    }

  }
  return v5;
}

- (FCPersonalizationOntologyLevelConfig)initWithConfig:(id)a3 defaultConfig:(id)a4
{
  id v6;
  id v7;
  FCPersonalizationOntologyLevelConfig *v8;
  void *v9;
  void *v10;
  void *v11;
  FCPersonalizationOntologyLevelConfig *v12;
  FCPersonalizationOntologyLevelConfig *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FCPersonalizationOntologyLevelConfig;
  v8 = -[FCPersonalizationOntologyLevelConfig init](&v15, sel_init);
  if (v8)
  {
    FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("tagWeightMapping"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      FCAppConfigurationDictionaryValueWithDefaultValue(v6, (uint64_t)CFSTR("tagWeightMapping"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "fc_dictionaryByTransformingKeysWithBlock:", &__block_literal_global_10_1);
        v12 = (FCPersonalizationOntologyLevelConfig *)objc_claimAutoreleasedReturnValue();
        v13 = -[FCPersonalizationOntologyLevelConfig initWithTagWeightMapping:](v8, "initWithTagWeightMapping:", v12);
        v8 = v13;
      }
      else
      {
        v12 = v8;
        v8 = -[FCPersonalizationOntologyLevelConfig initWithTagWeightMapping:](v12, "initWithTagWeightMapping:", MEMORY[0x1E0C9AA70]);
        v13 = v12;
      }

    }
    else
    {
      objc_msgSend(v7, "tagWeightMapping");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[FCPersonalizationOntologyLevelConfig initWithTagWeightMapping:](v8, "initWithTagWeightMapping:", v11);
      v8 = v13;
    }

  }
  return v8;
}

- (FCPersonalizationOntologyLevelConfig)initWithTagWeightMapping:(id)a3
{
  id v5;
  FCPersonalizationOntologyLevelConfig *v6;
  FCPersonalizationOntologyLevelConfig *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPersonalizationOntologyLevelConfig;
  v6 = -[FCPersonalizationOntologyLevelConfig init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tagWeightMapping, a3);

  return v7;
}

- (NSDictionary)tagWeightMapping
{
  return self->_tagWeightMapping;
}

- (FCPersonalizationOntologyLevelConfig)init
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
    v8 = "-[FCPersonalizationOntologyLevelConfig init]";
    v9 = 2080;
    v10 = "FCPersonalizationOntologyLevelConfig.m";
    v11 = 1024;
    v12 = 17;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPersonalizationOntologyLevelConfig init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

id __55__FCPersonalizationOntologyLevelConfig_initWithConfig___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "integerValue"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationOntologyLevelConfig)initWithCoder:(id)a3
{
  void *v4;
  FCPersonalizationOntologyLevelConfig *v5;

  objc_msgSend(a3, "decodeObjectForKey:", CFSTR("tagWeightMapping"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCPersonalizationOntologyLevelConfig initWithTagWeightMapping:](self, "initWithTagWeightMapping:", v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCPersonalizationOntologyLevelConfig tagWeightMapping](self, "tagWeightMapping");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tagWeightMapping"));

}

- (void)setTagWeightMapping:(id)a3
{
  objc_storeStrong((id *)&self->_tagWeightMapping, a3);
}

@end
