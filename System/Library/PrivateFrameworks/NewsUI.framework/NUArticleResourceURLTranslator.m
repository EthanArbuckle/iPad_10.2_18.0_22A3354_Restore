@implementation NUArticleResourceURLTranslator

- (NUArticleResourceURLTranslator)initWithAppConfigurationManager:(id)a3
{
  id v5;
  NUArticleResourceURLTranslator *v6;
  NUArticleResourceURLTranslator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUArticleResourceURLTranslator;
  v6 = -[NUArticleResourceURLTranslator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appConfigurationManager, a3);

  return v7;
}

- (id)translateFileURLForURL:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v4 = a3;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NUArticleResourceURLTranslator endpointForScheme:](self, "endpointForScheme:", v5);

  -[NUArticleResourceURLTranslator appConfigurationManager](self, "appConfigurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "endpointConfigsByEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", FCDefaultsReadEndpointEnvironment());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == 2)
  {
    objc_msgSend(v11, "remoteDataSourceBaseURLString");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6 != 1)
    {
LABEL_6:
      -[NUArticleResourceURLTranslator defaultURLForEndpoint:](self, "defaultURLForEndpoint:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v11, "staticAssetBaseURLString");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  if (!v12)
    goto LABEL_6;
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "host");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("/%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "path");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v4, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "length");

    if (v21)
    {
      objc_msgSend(v4, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingString:", v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v23;
    }
  }
  objc_msgSend(v14, "setPath:", v17);
  objc_msgSend(v14, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (int64_t)endpointForScheme:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("news-static-asset")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("news-remote-data")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)defaultURLForEndpoint:(int64_t)a3
{
  unint64_t v3;
  __CFString **v4;

  if (a3 == 1)
  {
    v3 = FCDefaultsReadEndpointEnvironment() - 1;
    if (v3 < 6)
    {
      v4 = off_24D5A2C70;
      return v4[v3];
    }
  }
  else if (a3 == 2)
  {
    v3 = FCDefaultsReadEndpointEnvironment() - 1;
    if (v3 < 6)
    {
      v4 = off_24D5A2C40;
      return v4[v3];
    }
  }
  return 0;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
}

@end
