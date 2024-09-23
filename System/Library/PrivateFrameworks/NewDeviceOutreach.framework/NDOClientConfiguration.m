@implementation NDOClientConfiguration

- (NDOClientConfiguration)initWithConfigDictionary:(id)a3
{
  id v4;
  NDOClientConfiguration *v5;
  NDOClientConfiguration *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDOClientConfiguration;
  v5 = -[NDOClientConfiguration init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[NDOClientConfiguration setGeneralAboutPolicy:](v5, "setGeneralAboutPolicy:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("alwaysRefreshGeneralAbout"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[NDOClientConfiguration setGeneralAboutPolicy:](v6, "setGeneralAboutPolicy:", 2);

    }
  }

  return v6;
}

- (unint64_t)generalAboutPolicy
{
  return self->_generalAboutPolicy;
}

- (void)setGeneralAboutPolicy:(unint64_t)a3
{
  self->_generalAboutPolicy = a3;
}

@end
