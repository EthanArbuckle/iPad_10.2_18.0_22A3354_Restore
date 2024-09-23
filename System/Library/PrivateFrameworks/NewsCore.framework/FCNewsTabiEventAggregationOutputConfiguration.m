@implementation FCNewsTabiEventAggregationOutputConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNames, 0);
}

- (FCNewsTabiEventAggregationOutputConfiguration)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  FCNewsTabiEventAggregationOutputConfiguration *v8;
  FCNewsTabiEventAggregationOutputConfiguration *v9;
  FCNewsTabiEventAggregationOutputConfiguration *v10;
  objc_super v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("outputNames"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v12.receiver = self;
    v12.super_class = (Class)FCNewsTabiEventAggregationOutputConfiguration;
    v8 = -[FCNewsTabiEventAggregationOutputConfiguration init](&v12, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_outputNames, v6);
    self = v9;

    v10 = self;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__FCNewsTabiEventAggregationOutputConfiguration_initWithDictionary___block_invoke;
    v13[3] = &unk_1E463B350;
    v14 = v4;
    __68__FCNewsTabiEventAggregationOutputConfiguration_initWithDictionary___block_invoke((uint64_t)v13);
    v10 = (FCNewsTabiEventAggregationOutputConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (FCNewsTabiEventAggregationOutputConfiguration)init
{
  return -[FCNewsTabiEventAggregationOutputConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

uint64_t __68__FCNewsTabiEventAggregationOutputConfiguration_initWithDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationOutputConfiguration due to failure to decode outputNames from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (FCNewsTabiEventAggregationOutputConfiguration)initWithOutputs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  FCNewsTabiEventAggregationOutputConfiguration *v8;
  uint64_t v9;
  NSArray *outputNames;
  FCNewsTabiEventAggregationOutputConfiguration *v11;
  NSObject *v12;
  objc_super v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__FCNewsTabiEventAggregationOutputConfiguration_initWithOutputs___block_invoke;
  v15[3] = &unk_1E463AE18;
  v6 = v4;
  v16 = v6;
  objc_msgSend(v5, "fc_set:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v14.receiver = self;
    v14.super_class = (Class)FCNewsTabiEventAggregationOutputConfiguration;
    v8 = -[FCNewsTabiEventAggregationOutputConfiguration init](&v14, sel_init);
    if (v8)
    {
      objc_msgSend(v7, "allObjects");
      v9 = objc_claimAutoreleasedReturnValue();
      outputNames = v8->_outputNames;
      v8->_outputNames = (NSArray *)v9;

    }
    self = v8;
    v11 = self;
  }
  else
  {
    v12 = FCTabiConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationOutputConfiguration from external outputs due to their being no outputs specified", buf, 2u);
    }
    v11 = 0;
  }

  return v11;
}

void __65__FCNewsTabiEventAggregationOutputConfiguration_initWithOutputs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "outputNames", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fc_safelyAddObjects:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsTabiEventAggregationOutputConfiguration outputNames](self, "outputNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indentedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\toutputNames: %@;"), v5);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (void)setOutputNames:(id)a3
{
  objc_storeStrong((id *)&self->_outputNames, a3);
}

@end
