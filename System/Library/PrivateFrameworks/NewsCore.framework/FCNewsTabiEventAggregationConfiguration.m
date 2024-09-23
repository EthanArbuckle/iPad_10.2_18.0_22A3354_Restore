@implementation FCNewsTabiEventAggregationConfiguration

- (FCNewsTabiEventAggregationConfiguration)initWithDictionary:(id)a3
{
  return -[FCNewsTabiEventAggregationConfiguration initWithDictionary:outputs:](self, "initWithDictionary:outputs:", a3, MEMORY[0x1E0C9AA60]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventConditions, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (FCNewsTabiEventAggregationConfiguration)init
{
  return -[FCNewsTabiEventAggregationConfiguration initWithDictionary:outputs:](self, "initWithDictionary:outputs:", 0, MEMORY[0x1E0C9AA60]);
}

- (FCNewsTabiEventAggregationConfiguration)initWithDictionary:(id)a3 outputs:(id)a4
{
  id v7;
  id v8;
  FCNewsTabiEventAggregationConditions *v9;
  void *v10;
  FCNewsTabiEventAggregationConditions *v11;
  FCNewsTabiEventAggregationConditions *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  FCNewsTabiEventAggregationConfiguration *v23;
  FCNewsTabiEventAggregationConfiguration *v24;
  FCNewsTabiEventAggregationConfiguration *v25;
  void *v26;
  void *v27;
  id v29;
  id obj;
  void *v31;
  FCNewsTabiEventAggregationConditions *v32;
  id v33;
  void *v34;
  id v35;
  objc_super v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;

  v7 = a3;
  v8 = a4;
  v9 = [FCNewsTabiEventAggregationConditions alloc];
  FCAppConfigurationDictionaryValueWithDefaultValue(v7, (uint64_t)CFSTR("eventConditions"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FCNewsTabiEventAggregationConditions initWithDictionary:](v9, "initWithDictionary:", v10);

  if (v11)
  {
    v12 = v11;
    FCAppConfigurationNumberValue(v7, (uint64_t)CFSTR("fullBodyEmbeddingDimension"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
      FCAppConfigurationNumberValue(v7, (uint64_t)CFSTR("maxTopicIds"), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v35 = v16;
        FCAppConfigurationNumberValue(v7, (uint64_t)CFSTR("maxSessionEvents"), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v34 = v15;
          v32 = v12;
          v33 = v18;
          v20 = MEMORY[0x1E0C809B0];
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_19;
          v41[3] = &unk_1E463F888;
          v21 = v7;
          v42 = v21;
          v43 = v8;
          __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_19((uint64_t)v41);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            obj = v22;
            v29 = v22;
            FCAppConfigurationNumberValue(v21, (uint64_t)CFSTR("titleEmbeddingDimension"), 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              v36.receiver = self;
              v36.super_class = (Class)FCNewsTabiEventAggregationConfiguration;
              v23 = -[FCNewsTabiEventAggregationConfiguration init](&v36, sel_init, v29);
              v24 = v23;
              if (v23)
              {
                objc_storeStrong((id *)&v23->_dictionary, a3);
                objc_storeStrong((id *)&v24->_eventConditions, v11);
                v24->_fullBodyEmbeddingDimension = (int)objc_msgSend(v34, "intValue");
                v24->_maxTopicIds = (int)objc_msgSend(v35, "intValue");
                v24->_maxSessionEvents = (int)objc_msgSend(v33, "intValue");
                objc_storeStrong((id *)&v24->_outputs, obj);
                v24->_titleEmbeddingDimension = (int)objc_msgSend(v31, "intValue");
              }
              self = v24;
              v25 = self;
            }
            else
            {
              v37[0] = v20;
              v37[1] = 3221225472;
              v37[2] = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_24;
              v37[3] = &unk_1E463B350;
              v38 = v21;
              __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_24((uint64_t)v37);
              v25 = (FCNewsTabiEventAggregationConfiguration *)objc_claimAutoreleasedReturnValue();

            }
            v12 = v32;

            v27 = obj;
          }
          else
          {
            v39[0] = v20;
            v39[1] = 3221225472;
            v39[2] = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_3;
            v39[3] = &unk_1E463B350;
            v27 = 0;
            v40 = v21;
            __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_3((uint64_t)v39);
            v25 = (FCNewsTabiEventAggregationConfiguration *)objc_claimAutoreleasedReturnValue();

            v12 = v32;
          }

          v15 = v34;
        }
        else
        {
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_18;
          v44[3] = &unk_1E463B350;
          v45 = v7;
          __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_18((uint64_t)v44);
          v25 = (FCNewsTabiEventAggregationConfiguration *)objc_claimAutoreleasedReturnValue();

        }
        v26 = v35;
      }
      else
      {
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_17;
        v46[3] = &unk_1E463B350;
        v47 = v7;
        __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_17((uint64_t)v46);
        v25 = (FCNewsTabiEventAggregationConfiguration *)objc_claimAutoreleasedReturnValue();
        v26 = v47;
      }

    }
    else
    {
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_16;
      v48[3] = &unk_1E463B350;
      v49 = v7;
      __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_16((uint64_t)v48);
      v25 = (FCNewsTabiEventAggregationConfiguration *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke;
    v50[3] = &unk_1E463B350;
    v51 = v7;
    __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke((uint64_t)v50);
    v25 = (FCNewsTabiEventAggregationConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v25;
}

uint64_t __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationConfiguration due to failure to decode eventConditions from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_16(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationConfiguration due to failure to decode fullBodyEmbeddingDimension from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_17(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationConfiguration due to failure to decode maxTopicIDs from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_18(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationConfiguration due to failure to decode maxSessionEvents from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

FCNewsTabiEventAggregationOutputsConfiguration *__70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_19(uint64_t a1)
{
  FCNewsTabiEventAggregationOutputsConfiguration *v2;
  void *v3;
  FCNewsTabiEventAggregationOutputsConfiguration *v4;
  void *v5;
  FCNewsTabiEventAggregationOutputsConfiguration *v6;
  void *v7;
  FCNewsTabiEventAggregationOutputsConfiguration *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  FCNewsTabiEventAggregationOutputsConfiguration *v15;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("bundleOutputConfiguration"));
  v2 = (FCNewsTabiEventAggregationOutputsConfiguration *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("nonBundleOutputConfiguration"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      v2 = -[FCNewsTabiEventAggregationOutputsConfiguration initWithDictionary:]([FCNewsTabiEventAggregationOutputsConfiguration alloc], "initWithDictionary:", *(_QWORD *)(a1 + 32));
    else
      v2 = 0;
  }
  v4 = [FCNewsTabiEventAggregationOutputsConfiguration alloc];
  v5 = (void *)MEMORY[0x1E0C99D20];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_2;
  v13 = &unk_1E463EFB0;
  v14 = *(id *)(a1 + 40);
  v15 = v2;
  v6 = v2;
  objc_msgSend(v5, "fc_array:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCNewsTabiEventAggregationOutputsConfiguration initWithOutputs:](v4, "initWithOutputs:", v7, v10, v11, v12, v13);

  return v8;
}

void __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "fc_safelyAddObjectsFromArray:", v3);
  objc_msgSend(v4, "fc_safelyAddObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_3(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationConfiguration due to failure to decode bundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_24(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationConfiguration due to failure to decode titleEmbeddingDimension from configuration %{public}@", (uint8_t *)&v7, 0xCu);

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
  -[FCNewsTabiEventAggregationConfiguration eventConditions](self, "eventConditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indentedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\teventConditions: %@;"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tfullBodyEmbeddingDimension: %lu;"),
    -[FCNewsTabiEventAggregationConfiguration fullBodyEmbeddingDimension](self, "fullBodyEmbeddingDimension"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmaxTopicIds: %lu;"),
    -[FCNewsTabiEventAggregationConfiguration maxTopicIds](self, "maxTopicIds"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmaxSessionEvents: %lu;"),
    -[FCNewsTabiEventAggregationConfiguration maxSessionEvents](self, "maxSessionEvents"));
  -[FCNewsTabiEventAggregationConfiguration outputs](self, "outputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indentedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\toutputs: %@;"), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttitleEmbeddingDimension: %lu;"),
    -[FCNewsTabiEventAggregationConfiguration titleEmbeddingDimension](self, "titleEmbeddingDimension"));
  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (int64_t)maxTopicIds
{
  return self->_maxTopicIds;
}

- (void)setMaxTopicIds:(int64_t)a3
{
  self->_maxTopicIds = a3;
}

- (int64_t)maxSessionEvents
{
  return self->_maxSessionEvents;
}

- (void)setMaxSessionEvents:(int64_t)a3
{
  self->_maxSessionEvents = a3;
}

- (int64_t)titleEmbeddingDimension
{
  return self->_titleEmbeddingDimension;
}

- (void)setTitleEmbeddingDimension:(int64_t)a3
{
  self->_titleEmbeddingDimension = a3;
}

- (int64_t)fullBodyEmbeddingDimension
{
  return self->_fullBodyEmbeddingDimension;
}

- (void)setFullBodyEmbeddingDimension:(int64_t)a3
{
  self->_fullBodyEmbeddingDimension = a3;
}

- (FCNewsTabiEventAggregationOutputsConfiguration)outputs
{
  return self->_outputs;
}

- (void)setOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_outputs, a3);
}

- (FCNewsTabiEventAggregationConditions)eventConditions
{
  return self->_eventConditions;
}

- (void)setEventConditions:(id)a3
{
  objc_storeStrong((id *)&self->_eventConditions, a3);
}

@end
