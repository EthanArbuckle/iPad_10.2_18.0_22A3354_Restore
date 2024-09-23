@implementation FCSportsFavoritesSyncModalConfig

- (FCSportsFavoritesSyncModalConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCSportsFavoritesSyncModalConfig *v5;
  uint64_t v6;
  NSString *titleText;
  uint64_t v8;
  NSString *bodyText;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCSportsFavoritesSyncModalConfig;
  v5 = -[FCSportsFavoritesSyncModalConfig init](&v11, sel_init);
  if (v5)
  {
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("titleText"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    titleText = v5->_titleText;
    v5->_titleText = (NSString *)v6;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("bodyText"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    bodyText = v5->_bodyText;
    v5->_bodyText = (NSString *)v8;

  }
  return v5;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
