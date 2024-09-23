@implementation FCNewsTabiRecommendedIssuesInputOutputConfiguration

- (FCNewsTabiRecommendedIssuesInputOutputConfiguration)initWithDictionary:(id)a3
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
  FCNewsTabiRecommendedIssuesInputOutputConfiguration *v14;
  id *p_isa;
  FCNewsTabiRecommendedIssuesInputOutputConfiguration *v16;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("contextFeatureKey"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("recommendedIssuePublisherOutputName"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("recommendedIssuePublisherScoreOutputName"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
        v18.receiver = self;
        v18.super_class = (Class)FCNewsTabiRecommendedIssuesInputOutputConfiguration;
        v14 = -[FCNewsTabiRecommendedIssuesInputOutputConfiguration init](&v18, sel_init);
        p_isa = (id *)&v14->super.isa;
        if (v14)
        {
          objc_storeStrong((id *)&v14->_contextFeatureKey, v6);
          objc_storeStrong(p_isa + 2, v9);
          objc_storeStrong(p_isa + 3, v12);
        }
        self = p_isa;

        v16 = self;
      }
      else
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke_7;
        v19[3] = &unk_1E463B350;
        v20 = v4;
        __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke_7((uint64_t)v19);
        v16 = (FCNewsTabiRecommendedIssuesInputOutputConfiguration *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke_6;
      v21[3] = &unk_1E463B350;
      v22 = v4;
      __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke_6((uint64_t)v21);
      v16 = (FCNewsTabiRecommendedIssuesInputOutputConfiguration *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke;
    v23[3] = &unk_1E463B350;
    v24 = v4;
    __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke((uint64_t)v23);
    v16 = (FCNewsTabiRecommendedIssuesInputOutputConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedIssuePublisherScoreOutputName, 0);
  objc_storeStrong((id *)&self->_recommendedIssuePublisherOutputName, 0);
  objc_storeStrong((id *)&self->_contextFeatureKey, 0);
}

- (FCNewsTabiRecommendedIssuesInputOutputConfiguration)init
{
  return -[FCNewsTabiRecommendedIssuesInputOutputConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

uint64_t __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedIssuesInputOutputConfiguration due to failure to decode contextFeatureKey from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke_6(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedIssuesInputOutputConfiguration due to failure to decode recommendedIssuePublisherOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke_7(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedIssuesInputOutputConfiguration due to failure to decode recommendedIssuePublisherScoreOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsTabiRecommendedIssuesInputOutputConfiguration contextFeatureKey](self, "contextFeatureKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tcontextFeatureKey: %@;"), v4);

  -[FCNewsTabiRecommendedIssuesInputOutputConfiguration recommendedIssuePublisherOutputName](self, "recommendedIssuePublisherOutputName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\trecommendedIssuePublisherOutputName: %@;"), v5);

  -[FCNewsTabiRecommendedIssuesInputOutputConfiguration recommendedIssuePublisherScoreOutputName](self, "recommendedIssuePublisherScoreOutputName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\trecommendedIssuePublisherScoreOutputName: %@;"), v6);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (NSString)contextFeatureKey
{
  return self->_contextFeatureKey;
}

- (void)setContextFeatureKey:(id)a3
{
  objc_storeStrong((id *)&self->_contextFeatureKey, a3);
}

- (NSString)recommendedIssuePublisherOutputName
{
  return self->_recommendedIssuePublisherOutputName;
}

- (void)setRecommendedIssuePublisherOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedIssuePublisherOutputName, a3);
}

- (NSString)recommendedIssuePublisherScoreOutputName
{
  return self->_recommendedIssuePublisherScoreOutputName;
}

- (void)setRecommendedIssuePublisherScoreOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedIssuePublisherScoreOutputName, a3);
}

@end
