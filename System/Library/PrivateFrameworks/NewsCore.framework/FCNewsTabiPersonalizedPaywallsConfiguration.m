@implementation FCNewsTabiPersonalizedPaywallsConfiguration

- (FCNewsTabiPersonalizedPaywallsConfiguration)initWithDictionary:(id)a3
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
  FCNewsTabiPersonalizedPaywallsConfiguration *v14;
  FCNewsTabiPersonalizedPaywallsConfiguration *v15;
  FCNewsTabiPersonalizedPaywallsConfiguration *v16;
  objc_super v18;

  v4 = a3;
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("contextFeatureKey"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("channelIDsOutputName"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
      FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("scoresOutputName"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
        v18.receiver = self;
        v18.super_class = (Class)FCNewsTabiPersonalizedPaywallsConfiguration;
        v14 = -[FCNewsTabiPersonalizedPaywallsConfiguration init](&v18, sel_init);
        v15 = v14;
        if (v14)
        {
          objc_storeStrong((id *)&v14->_contextFeatureKey, v6);
          objc_storeStrong((id *)&v15->_channelIDsOutputName, v9);
          v15->_omitHardFollows = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("omitHardFollows"), 0);
          objc_storeStrong((id *)&v15->_scoresOutputName, v12);
        }
        self = v15;

        v16 = self;
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoresOutputName, 0);
  objc_storeStrong((id *)&self->_channelIDsOutputName, 0);
  objc_storeStrong((id *)&self->_contextFeatureKey, 0);
}

- (FCNewsTabiPersonalizedPaywallsConfiguration)init
{
  return -[FCNewsTabiPersonalizedPaywallsConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsTabiPersonalizedPaywallsConfiguration contextFeatureKey](self, "contextFeatureKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tcontextFeatureKey: %@;"), v4);

  -[FCNewsTabiPersonalizedPaywallsConfiguration channelIDsOutputName](self, "channelIDsOutputName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tchannelIDsOutputName: %@;"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tomitHardFollows: %d"), -[FCNewsTabiPersonalizedPaywallsConfiguration omitHardFollows](self, "omitHardFollows"));
  -[FCNewsTabiPersonalizedPaywallsConfiguration scoresOutputName](self, "scoresOutputName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tscoresOutputName: %@;"), v6);

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

- (NSString)channelIDsOutputName
{
  return self->_channelIDsOutputName;
}

- (void)setChannelIDsOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_channelIDsOutputName, a3);
}

- (BOOL)omitHardFollows
{
  return self->_omitHardFollows;
}

- (void)setOmitHardFollows:(BOOL)a3
{
  self->_omitHardFollows = a3;
}

- (NSString)scoresOutputName
{
  return self->_scoresOutputName;
}

- (void)setScoresOutputName:(id)a3
{
  objc_storeStrong((id *)&self->_scoresOutputName, a3);
}

@end
