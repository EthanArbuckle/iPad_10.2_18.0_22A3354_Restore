@implementation FCNewsTabiAdSegmentsEndpoint

- (FCNewsTabiAdSegmentsEndpoint)init
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
    v8 = "-[FCNewsTabiAdSegmentsEndpoint init]";
    v9 = 2080;
    v10 = "FCNewsTabiAdSegmentsConfiguration.m";
    v11 = 1024;
    v12 = 23;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCNewsTabiAdSegmentsEndpoint init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCNewsTabiAdSegmentsEndpoint)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  FCNewsTabiAdSegmentsEndpoint *v11;
  FCNewsTabiAdSegmentsEndpoint *v12;
  FCNewsTabiAdSegmentsEndpoint *v13;
  void *v14;
  FCNewsTabiEventAggregationOutputsConfiguration *v15;
  FCNewsTabiEventAggregationOutputsConfiguration *eventAggregationOutputs;
  FCNewsTabiAdSegmentsEndpoint *v17;
  objc_super v19;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("packageAssetID"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("adSegmentsOutputName"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
      v20.receiver = self;
      v20.super_class = (Class)FCNewsTabiAdSegmentsEndpoint;
      v11 = -[FCNewsTabiAdSegmentsEndpoint init](&v20, sel_init);
      if (v11)
      {
        v19.receiver = v11;
        v19.super_class = (Class)FCNewsTabiAdSegmentsEndpoint;
        v12 = -[FCNewsTabiAdSegmentsEndpoint init](&v19, sel_init);
        v13 = v12;
        if (v12)
        {
          objc_storeStrong((id *)&v12->_packageAssetID, v6);
          objc_storeStrong((id *)&v13->_adSegmentsOutputName, v9);
          FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("eventAggregationOutputs"), 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = -[FCNewsTabiEventAggregationOutputsConfiguration initWithDictionary:]([FCNewsTabiEventAggregationOutputsConfiguration alloc], "initWithDictionary:", v14);
            eventAggregationOutputs = v13->_eventAggregationOutputs;
            v13->_eventAggregationOutputs = v15;

          }
        }
      }
      else
      {
        v13 = 0;
      }
      self = v13;

      v17 = self;
    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __51__FCNewsTabiAdSegmentsEndpoint_initWithDictionary___block_invoke_12;
      v21[3] = &unk_1E463B350;
      v22 = v4;
      __51__FCNewsTabiAdSegmentsEndpoint_initWithDictionary___block_invoke_12((uint64_t)v21);
      v17 = (FCNewsTabiAdSegmentsEndpoint *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __51__FCNewsTabiAdSegmentsEndpoint_initWithDictionary___block_invoke;
    v23[3] = &unk_1E463B350;
    v24 = v4;
    __51__FCNewsTabiAdSegmentsEndpoint_initWithDictionary___block_invoke((uint64_t)v23);
    v17 = (FCNewsTabiAdSegmentsEndpoint *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

uint64_t __51__FCNewsTabiAdSegmentsEndpoint_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiAdSegmentsEndpoint due to failure to decode packageAssetID from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __51__FCNewsTabiAdSegmentsEndpoint_initWithDictionary___block_invoke_12(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiAdSegmentsEndpoint due to failure to decode adSegmentsOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsTabiAdSegmentsEndpoint packageAssetID](self, "packageAssetID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tpackageAssetID: %@;"), v4);

  -[FCNewsTabiAdSegmentsEndpoint adSegmentsOutputName](self, "adSegmentsOutputName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tadSegmentsOutputName: %@;"), v5);

  -[FCNewsTabiAdSegmentsEndpoint eventAggregationOutputs](self, "eventAggregationOutputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indentedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\teventAggregationOutputs: %@;"), v7);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (NSString)packageAssetID
{
  return self->_packageAssetID;
}

- (NSString)adSegmentsOutputName
{
  return self->_adSegmentsOutputName;
}

- (FCNewsTabiEventAggregationOutputsConfiguration)eventAggregationOutputs
{
  return self->_eventAggregationOutputs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventAggregationOutputs, 0);
  objc_storeStrong((id *)&self->_adSegmentsOutputName, 0);
  objc_storeStrong((id *)&self->_packageAssetID, 0);
}

@end
