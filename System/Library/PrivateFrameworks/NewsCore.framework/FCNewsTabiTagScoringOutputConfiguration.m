@implementation FCNewsTabiTagScoringOutputConfiguration

- (FCNewsTabiTagScoringOutputConfiguration)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  FCNewsTabiTagScoringOutputConfiguration *v8;
  FCNewsTabiTagScoringOutputConfiguration *v9;
  FCNewsTabiTagScoringOutputConfiguration *v10;
  objc_super v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("scoredTagsOutputName"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v12.receiver = self;
    v12.super_class = (Class)FCNewsTabiTagScoringOutputConfiguration;
    v8 = -[FCNewsTabiTagScoringOutputConfiguration init](&v12, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_scoredTagsOutputName, v6);
    self = v9;

    v10 = self;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__FCNewsTabiTagScoringOutputConfiguration_initWithDictionary___block_invoke;
    v13[3] = &unk_1E463B350;
    v14 = v4;
    __62__FCNewsTabiTagScoringOutputConfiguration_initWithDictionary___block_invoke((uint64_t)v13);
    v10 = (FCNewsTabiTagScoringOutputConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

uint64_t __62__FCNewsTabiTagScoringOutputConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagScoringOutputConfiguration due to failure to decode scoredTagsOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsTabiTagScoringOutputConfiguration scoredTagsOutputName](self, "scoredTagsOutputName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tscoredTagsOutputName: %@;"), v4);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (NSString)scoredTagsOutputName
{
  return self->_scoredTagsOutputName;
}

- (void)setScoredTagsOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_scoredTagsOutputName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredTagsOutputName, 0);
}

@end
