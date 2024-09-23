@implementation FCVideoGroupsConfig

- (FCVideoGroupsConfig)initWithVideoGroupsConfig:(id)a3
{
  id v4;
  FCVideoGroupsConfig *v5;
  uint64_t v6;
  NTPBVideoGroupsConfig *pbVideoGroupsConfig;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCVideoGroupsConfig;
  v5 = -[FCVideoGroupsConfig init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    pbVideoGroupsConfig = v5->_pbVideoGroupsConfig;
    v5->_pbVideoGroupsConfig = (NTPBVideoGroupsConfig *)v6;

  }
  return v5;
}

- (FCVideoGroupsConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCVideoGroupsConfig *v5;
  uint64_t v6;
  NSDictionary *configDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCVideoGroupsConfig;
  v5 = -[FCVideoGroupsConfig init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configDictionary = v5->_configDictionary;
    v5->_configDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (BOOL)playsMutedByDefault
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "playsMutedByDefault");
  }
  else
  {
    -[FCVideoGroupsConfig configDictionary](self, "configDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("playsMutedByDefault"), 0);
  }
  v6 = v5;

  return v6;
}

- (int64_t)nowPlayingBarTime
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "nowPlayingBarTime");
  }
  else
  {
    -[FCVideoGroupsConfig configDictionary](self, "configDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("nowPlayingBarTime"), 2);
  }
  v6 = v5;

  return v6;
}

- (int64_t)upNextBarTime
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "upNextBarTime");
  }
  else
  {
    -[FCVideoGroupsConfig configDictionary](self, "configDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("upNextBarTime"), 4);
  }
  v6 = v5;

  return v6;
}

- (int64_t)moreFromPublisherBarTime
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "moreFromPublisherBarTime");
  }
  else
  {
    -[FCVideoGroupsConfig configDictionary](self, "configDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("moreFromPublisherBarTime"), 2);
  }
  v6 = v5;

  return v6;
}

- (BOOL)moreFromPublisherBarEnabled
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "moreFromPublisherBarEnabled");
  }
  else
  {
    -[FCVideoGroupsConfig configDictionary](self, "configDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("moreFromPublisherBarEnabled"), 1);
  }
  v6 = v5;

  return v6;
}

- (unint64_t)moreVideosGroupSortOption
{
  void *v3;
  void *v4;
  int v5;
  unint64_t v6;
  void *v7;

  -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "moreVideosGroupSortOption");
    if (v5 == 2)
      v6 = 2;
    else
      v6 = v5 == 1;
  }
  else
  {
    -[FCVideoGroupsConfig configDictionary](self, "configDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("moreVideosGroupSortOption"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = FCSortOptionForStringSortOption(v7);

  }
  return v6;
}

- (unint64_t)moreVideosGroupFilterOption
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;

  -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "moreVideosGroupFilterOption") != 0;
  }
  else
  {
    -[FCVideoGroupsConfig configDictionary](self, "configDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("moreVideosGroupFilterOption"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("VideoGroupFilterOptionWatched"));

  }
  return v5;
}

- (int64_t)moreVideosGroupMinNumberOfVideos
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "moreVideosGroupMinNumberOfVideos");
  }
  else
  {
    -[FCVideoGroupsConfig configDictionary](self, "configDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("moreVideosGroupMinNumberOfVideos"), 6);
  }
  v6 = v5;

  return v6;
}

- (int64_t)moreVideosGroupMaxNumberOfVideos
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "moreVideosGroupMaxNumberOfVideos");
  }
  else
  {
    -[FCVideoGroupsConfig configDictionary](self, "configDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("moreVideosGroupMaxNumberOfVideos"), 20);
  }
  v6 = v5;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FCVideoGroupsConfig *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(FCVideoGroupsConfig);
  -[FCVideoGroupsConfig configDictionary](self, "configDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCVideoGroupsConfig setConfigDictionary:](v4, "setConfigDictionary:", v5);

  -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCVideoGroupsConfig setPbVideoGroupsConfig:](v4, "setPbVideoGroupsConfig:", v6);

  return v4;
}

- (FCVideoGroupsConfig)initWithCoder:(id)a3
{
  id v4;
  FCVideoGroupsConfig *v5;
  uint64_t v6;
  NTPBVideoGroupsConfig *pbVideoGroupsConfig;
  uint64_t v8;
  NSDictionary *configDictionary;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCVideoGroupsConfig;
  v5 = -[FCVideoGroupsConfig init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pbVideoGroupsConfig"));
    v6 = objc_claimAutoreleasedReturnValue();
    pbVideoGroupsConfig = v5->_pbVideoGroupsConfig;
    v5->_pbVideoGroupsConfig = (NTPBVideoGroupsConfig *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configDictionary"));
    v8 = objc_claimAutoreleasedReturnValue();
    configDictionary = v5->_configDictionary;
    v5->_configDictionary = (NSDictionary *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCVideoGroupsConfig pbVideoGroupsConfig](self, "pbVideoGroupsConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pbVideoGroupsConfig"));

  -[FCVideoGroupsConfig configDictionary](self, "configDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("configDictionary"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setMoreVideosGroupSortOption:(unint64_t)a3
{
  self->_moreVideosGroupSortOption = a3;
}

- (void)setMoreVideosGroupFilterOption:(unint64_t)a3
{
  self->_moreVideosGroupFilterOption = a3;
}

- (NTPBVideoGroupsConfig)pbVideoGroupsConfig
{
  return self->_pbVideoGroupsConfig;
}

- (void)setPbVideoGroupsConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)configDictionary
{
  return self->_configDictionary;
}

- (void)setConfigDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configDictionary, 0);
  objc_storeStrong((id *)&self->_pbVideoGroupsConfig, 0);
}

@end
