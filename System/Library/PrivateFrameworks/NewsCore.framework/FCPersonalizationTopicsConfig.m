@implementation FCPersonalizationTopicsConfig

void __62__FCPersonalizationTopicsConfig_initWithConfig_defaultConfig___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  FCPersonalizationTopicConfig *v5;
  FCPersonalizationTopicConfig *v6;
  FCPersonalizationTopicConfig *v7;
  FCPersonalizationTopicConfig *v8;
  id v9;

  v9 = a2;
  FCAppConfigurationStringValue(v9, (uint64_t)CFSTR("topicId"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [FCPersonalizationTopicConfig alloc];
    v6 = v5;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
      v7 = (FCPersonalizationTopicConfig *)objc_claimAutoreleasedReturnValue();
      v8 = -[FCPersonalizationTopicConfig initWithConfigDictionary:defaultConfig:](v6, "initWithConfigDictionary:defaultConfig:", v9, v7);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v3);

    }
    else
    {
      v7 = -[FCPersonalizationTopicConfig initWithConfigDictionary:](v5, "initWithConfigDictionary:", v9);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v3);
    }

  }
}

- (FCPersonalizationTopicsConfig)initWithConfig:(id)a3 defaultConfig:(id)a4
{
  id v6;
  id v7;
  FCPersonalizationTopicsConfig *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)FCPersonalizationTopicsConfig;
  v8 = -[FCPersonalizationTopicsConfig init](&v27, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v7, "topicsConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "topicID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v15, "topicID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v17);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v12);
    }

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __62__FCPersonalizationTopicsConfig_initWithConfig_defaultConfig___block_invoke;
    v21[3] = &unk_1E46459B0;
    v22 = v9;
    v18 = v9;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v21);
    objc_msgSend(v18, "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[FCPersonalizationTopicsConfig initWithTopicsConfig:](v8, "initWithTopicsConfig:", v19);

  }
  return v8;
}

- (FCPersonalizationTopicsConfig)initWithTopicsConfig:(id)a3
{
  id v5;
  FCPersonalizationTopicsConfig *v6;
  FCPersonalizationTopicsConfig *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPersonalizationTopicsConfig;
  v6 = -[FCPersonalizationTopicsConfig init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_topicsConfig, a3);

  return v7;
}

- (NSArray)topicsConfig
{
  return self->_topicsConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicsConfig, 0);
}

FCPersonalizationTopicConfig *__48__FCPersonalizationTopicsConfig_initWithConfig___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FCPersonalizationTopicConfig *v3;

  v2 = a2;
  v3 = -[FCPersonalizationTopicConfig initWithConfigDictionary:]([FCPersonalizationTopicConfig alloc], "initWithConfigDictionary:", v2);

  return v3;
}

- (FCPersonalizationTopicsConfig)initWithConfig:(id)a3
{
  id v4;
  FCPersonalizationTopicsConfig *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FCPersonalizationTopicsConfig;
  v5 = -[FCPersonalizationTopicsConfig init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_163);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[FCPersonalizationTopicsConfig initWithTopicsConfig:](v5, "initWithTopicsConfig:", v6);

  }
  return v5;
}

- (FCPersonalizationTopicsConfig)init
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
    v8 = "-[FCPersonalizationTopicsConfig init]";
    v9 = 2080;
    v10 = "FCPersonalizationTopicsConfig.m";
    v11 = 1024;
    v12 = 17;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPersonalizationTopicsConfig init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationTopicsConfig)initWithCoder:(id)a3
{
  void *v4;
  FCPersonalizationTopicsConfig *v5;

  objc_msgSend(a3, "decodeObjectForKey:", CFSTR("topicsConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCPersonalizationTopicsConfig initWithTopicsConfig:](self, "initWithTopicsConfig:", v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCPersonalizationTopicsConfig topicsConfig](self, "topicsConfig");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("topicsConfig"));

}

- (void)setTopicsConfig:(id)a3
{
  objc_storeStrong((id *)&self->_topicsConfig, a3);
}

@end
