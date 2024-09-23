@implementation ATXClientModelSuggestionRouter

- (BOOL)shouldRouteClientToInfoSuggestionEngine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_routingConfig, "objectForKeyedSubscript:", CFSTR("InfoClients"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("shouldRoute"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("shouldRoute"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = objc_msgSend(v10, "BOOLValue");

    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }

  return (char)v6;
}

- (ATXClientModelSuggestionRouter)init
{
  ATXClientModelSuggestionRouter *v2;
  uint64_t v3;
  NSDictionary *routingConfig;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXClientModelSuggestionRouter;
  v2 = -[ATXClientModelSuggestionRouter init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryWithLegacyPathForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    routingConfig = v2->_routingConfig;
    v2->_routingConfig = (NSDictionary *)v3;

  }
  return v2;
}

- (BOOL)isRoutingConfigurationLoaded
{
  NSDictionary *routingConfig;
  void *v3;
  BOOL v4;

  routingConfig = self->_routingConfig;
  if (!routingConfig)
    return 0;
  -[NSDictionary objectForKeyedSubscript:](routingConfig, "objectForKeyedSubscript:", CFSTR("InfoClients"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)shouldPersistCacheForClientModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_routingConfig, "objectForKeyedSubscript:", CFSTR("InfoClients"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("shouldPersistCache"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("shouldPersistCache"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = objc_msgSend(v10, "BOOLValue");

    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }

  return (char)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingConfig, 0);
}

@end
