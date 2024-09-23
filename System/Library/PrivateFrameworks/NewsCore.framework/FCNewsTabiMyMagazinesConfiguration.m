@implementation FCNewsTabiMyMagazinesConfiguration

- (FCNewsTabiMyMagazinesConfiguration)initWithDictionary:(id)a3
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
  FCNewsTabiMyMagazinesConfiguration *v17;
  FCNewsTabiMyMagazinesConfiguration *v18;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v4 = a3;
  FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("maxTopicIds"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("titleEmbeddingDimension"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
      FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("fullBodyEmbeddingDimension"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
        FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("scoreOutputName"), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
          v20.receiver = self;
          v20.super_class = (Class)FCNewsTabiMyMagazinesConfiguration;
          v17 = -[FCNewsTabiMyMagazinesConfiguration init](&v20, sel_init);
          if (v17)
          {
            v17->_maxTopicIds = (int)objc_msgSend(v7, "intValue");
            v17->_titleEmbeddingDimension = (int)objc_msgSend(v10, "intValue");
            v17->_fullBodyEmbeddingDimension = (int)objc_msgSend(v13, "intValue");
            objc_storeStrong((id *)&v17->_scoreOutputName, v15);
          }
          self = v17;

          v18 = self;
        }
        else
        {
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_51;
          v21[3] = &unk_1E463B350;
          v22 = v4;
          __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_51((uint64_t)v21);
          v18 = (FCNewsTabiMyMagazinesConfiguration *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_50;
        v23[3] = &unk_1E463B350;
        v24 = v4;
        __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_50((uint64_t)v23);
        v18 = (FCNewsTabiMyMagazinesConfiguration *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_49;
      v25[3] = &unk_1E463B350;
      v26 = v4;
      __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_49((uint64_t)v25);
      v18 = (FCNewsTabiMyMagazinesConfiguration *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke;
    v27[3] = &unk_1E463B350;
    v28 = v4;
    __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke((uint64_t)v27);
    v18 = (FCNewsTabiMyMagazinesConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

uint64_t __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiMyMagazinesConfiguration due to failure to decode maxTopicIds from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_49(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiMyMagazinesConfiguration due to failure to decode titleEmbeddingDimension from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_50(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiMyMagazinesConfiguration due to failure to decode fullBodyEmbeddingDimension from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_51(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiMyMagazinesConfiguration due to failure to decode scoreOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmaxTopicIds: %lu"), -[FCNewsTabiMyMagazinesConfiguration maxTopicIds](self, "maxTopicIds"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttitleEmbeddingDimension: %lu"), -[FCNewsTabiMyMagazinesConfiguration titleEmbeddingDimension](self, "titleEmbeddingDimension"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tfullBodyEmbeddingDimension: %lu"), -[FCNewsTabiMyMagazinesConfiguration fullBodyEmbeddingDimension](self, "fullBodyEmbeddingDimension"));
  -[FCNewsTabiMyMagazinesConfiguration scoreOutputName](self, "scoreOutputName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tscoreOutputName: %@;"), v4);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (int64_t)maxTopicIds
{
  return self->_maxTopicIds;
}

- (void)setMaxTopicIds:(int64_t)a3
{
  self->_maxTopicIds = a3;
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

- (NSString)scoreOutputName
{
  return self->_scoreOutputName;
}

- (void)setScoreOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_scoreOutputName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreOutputName, 0);
}

@end
