@implementation NUWebContentContentRuleProvider

- (NUWebContentContentRuleProvider)initWithAppConfigurationManager:(id)a3 headline:(id)a4
{
  id v7;
  id v8;
  NUWebContentContentRuleProvider *v9;
  NUWebContentContentRuleProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUWebContentContentRuleProvider;
  v9 = -[NUWebContentContentRuleProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appConfigurationManager, a3);
    objc_storeStrong((id *)&v10->_headline, a4);
  }

  return v10;
}

- (id)contentRules
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("newsarticles.anf.content_blockers_enabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "BOOLValue") & 1) == 0 && (NFInternalBuild() & 1) != 0
    || (-[NUWebContentContentRuleProvider headline](self, "headline"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isLocalDraft"),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    -[NUWebContentContentRuleProvider appConfigurationManager](self, "appConfigurationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "webEmbedContentBlockers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v26 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v12, 0, &v26);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v10, "addObjectsFromArray:", v13);
      }

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "webEmbedContentBlockerOverrides");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dataUsingEncoding:", 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v25 = 0;
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v15, 0, &v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v16, "objectForKey:", CFSTR("channels"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[NUWebContentContentRuleProvider headline](self, "headline");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "sourceChannel");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKey:", v19);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v10, "addObjectsFromArray:", v22);

            }
          }
        }

      }
    }
    v24 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v10, 0, &v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v20, 4);
    else
      v7 = 0;

  }
  return v7;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
}

@end
