@implementation FCNewsTabiTagSuggestionsOutputConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicScoresOutputName, 0);
  objc_storeStrong((id *)&self->_channelScoresOutputName, 0);
  objc_storeStrong((id *)&self->_topicIDsOutputName, 0);
  objc_storeStrong((id *)&self->_channelIDsOutputName, 0);
}

- (FCNewsTabiTagSuggestionsOutputConfiguration)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  FCNewsTabiTagSuggestionsOutputConfiguration *v17;
  id *p_isa;
  FCNewsTabiTagSuggestionsOutputConfiguration *v19;
  objc_super v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v4 = a3;
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("channelIDsOutputName"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("topicIDsOutputName"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("channelScoresOutputName"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
        FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("topicScoresOutputName"), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
          v21.receiver = self;
          v21.super_class = (Class)FCNewsTabiTagSuggestionsOutputConfiguration;
          v17 = -[FCNewsTabiTagSuggestionsOutputConfiguration init](&v21, sel_init);
          p_isa = (id *)&v17->super.isa;
          if (v17)
          {
            objc_storeStrong((id *)&v17->_channelIDsOutputName, v6);
            objc_storeStrong(p_isa + 2, v9);
            objc_storeStrong(p_isa + 3, v12);
            objc_storeStrong(p_isa + 4, v15);
          }
          self = p_isa;

          v19 = self;
        }
        else
        {
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_10;
          v22[3] = &unk_1E463B350;
          v23 = v4;
          __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_10((uint64_t)v22);
          v19 = (FCNewsTabiTagSuggestionsOutputConfiguration *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_9;
        v24[3] = &unk_1E463B350;
        v25 = v4;
        __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_9((uint64_t)v24);
        v19 = (FCNewsTabiTagSuggestionsOutputConfiguration *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_8;
      v26[3] = &unk_1E463B350;
      v27 = v4;
      __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_8((uint64_t)v26);
      v19 = (FCNewsTabiTagSuggestionsOutputConfiguration *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke;
    v28[3] = &unk_1E463B350;
    v29 = v4;
    __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke((uint64_t)v28);
    v19 = (FCNewsTabiTagSuggestionsOutputConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

uint64_t __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagSuggestionsOutputConfiguration due to failure to decode channelIDsOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_8(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagSuggestionsOutputConfiguration due to failure to decode topicIDsOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_9(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagSuggestionsOutputConfiguration due to failure to decode channelScoresOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_10(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagSuggestionsOutputConfiguration due to failure to decode topicScoresOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);

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
  -[FCNewsTabiTagSuggestionsOutputConfiguration channelIDsOutputName](self, "channelIDsOutputName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tchannelIDsOutputName: %@;"), v4);

  -[FCNewsTabiTagSuggestionsOutputConfiguration topicIDsOutputName](self, "topicIDsOutputName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttopicIDsOutputName: %@;"), v5);

  -[FCNewsTabiTagSuggestionsOutputConfiguration channelScoresOutputName](self, "channelScoresOutputName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tchannelScoresOutputName: %@;"), v6);

  -[FCNewsTabiTagSuggestionsOutputConfiguration topicScoresOutputName](self, "topicScoresOutputName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttopicScoresOutputName: %@;"), v7);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (NSString)channelIDsOutputName
{
  return self->_channelIDsOutputName;
}

- (void)setChannelIDsOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_channelIDsOutputName, a3);
}

- (NSString)topicIDsOutputName
{
  return self->_topicIDsOutputName;
}

- (void)setTopicIDsOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_topicIDsOutputName, a3);
}

- (NSString)channelScoresOutputName
{
  return self->_channelScoresOutputName;
}

- (void)setChannelScoresOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_channelScoresOutputName, a3);
}

- (NSString)topicScoresOutputName
{
  return self->_topicScoresOutputName;
}

- (void)setTopicScoresOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_topicScoresOutputName, a3);
}

@end
