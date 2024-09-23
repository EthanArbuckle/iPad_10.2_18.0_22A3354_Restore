@implementation FCTopStoriesConfiguration

- (NSDictionary)styleConfigurations
{
  return self->_styleConfigurations;
}

- (int64_t)storyTypeTimeout
{
  return self->_storyTypeTimeout;
}

- (FCTopStoriesConfiguration)initWithConfigDictionary:(id)a3
{
  id v5;
  FCTopStoriesConfiguration *v6;
  FCTopStoriesConfiguration *v7;
  uint64_t v8;
  NSString *channelID;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCTopStoriesConfiguration;
  v6 = -[FCTopStoriesConfiguration init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configDict, a3);
    v7->_promotingEnabled = FCAppConfigurationBoolValue(v5, (uint64_t)CFSTR("promotingEnabled"), 1);
    FCAppConfigurationStringValue(v5, (uint64_t)CFSTR("channelId"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    channelID = v7->_channelID;
    v7->_channelID = (NSString *)v8;

    v7->_storyTypeTimeout = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("badgesTimeout"), 21600);
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("styleConfigs"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v7->_styleConfigurations, (id)objc_msgSend(v10, "fc_dictionaryWithKeyBlock:valueBlock:", &__block_literal_global_219, &__block_literal_global_223));

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleConfigurations, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_configDict, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    v7 = objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", self->_configDict, v6[1]);
  else
    v7 = 0;

  return v7;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_configDict, "hash");
}

- (BOOL)isPromotingEnabled
{
  return self->_promotingEnabled;
}

- (NSString)channelID
{
  return self->_channelID;
}

@end
