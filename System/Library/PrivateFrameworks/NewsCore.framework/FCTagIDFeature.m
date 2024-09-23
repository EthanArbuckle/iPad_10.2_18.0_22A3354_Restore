@implementation FCTagIDFeature

- (FCTagIDFeature)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[FCTagIDFeature initWithTagID:](self, "initWithTagID:", &stru_1E464BC40);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTagIDFeature init]";
    v9 = 2080;
    v10 = "FCPersonalizationFeature.m";
    v11 = 1024;
    v12 = 700;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTagIDFeature init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCTagIDFeature)initWithTagID:(id)a3
{
  id v5;
  FCTagIDFeature *v6;
  FCTagIDFeature *v7;
  uint64_t v8;
  NSString *personalizationIdentifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCTagIDFeature;
  v6 = -[FCPersonalizationFeature init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->super._tagID, a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("f3"), CFSTR("+"), v5);
    v8 = objc_claimAutoreleasedReturnValue();
    personalizationIdentifier = v7->super._personalizationIdentifier;
    v7->super._personalizationIdentifier = (NSString *)v8;

  }
  return v7;
}

- (FCTagIDFeature)initWithPersonalizationIdentifier:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  FCTagIDFeature *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = objc_msgSend(CFSTR("f3"), "length");
  if (v5 <= objc_msgSend(CFSTR("+"), "length") + v6)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("+"), "length") + objc_msgSend(CFSTR("f3"), "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[FCTagIDFeature initWithTagID:](self, "initWithTagID:", v7);

    v8 = self;
  }

  return v8;
}

- (BOOL)shouldBeBoosted
{
  return 1;
}

- (double)featureWeightWithConfigurableValues:(id)a3 publisherID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  double v10;
  double v11;

  v6 = a3;
  v7 = a4;
  -[FCPersonalizationFeature tagID](self, "tagID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  v10 = 1.0;
  if (v9)
  {
    objc_msgSend(v6, "publisherAggregateWeight");
    v10 = v11;
  }

  return v10;
}

@end
