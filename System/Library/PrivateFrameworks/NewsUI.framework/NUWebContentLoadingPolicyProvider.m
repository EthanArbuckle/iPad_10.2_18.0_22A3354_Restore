@implementation NUWebContentLoadingPolicyProvider

- (NUWebContentLoadingPolicyProvider)initWithHeadline:(id)a3
{
  id v5;
  NUWebContentLoadingPolicyProvider *v6;
  NUWebContentLoadingPolicyProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUWebContentLoadingPolicyProvider;
  v6 = -[NUWebContentLoadingPolicyProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_headline, a3);

  return v7;
}

- (unint64_t)loadingPolicy
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;

  -[NUWebContentLoadingPolicyProvider headline](self, "headline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "webEmbedsEnabled"))
  {

  }
  else
  {
    -[NUWebContentLoadingPolicyProvider headline](self, "headline");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDraft");

    if (!v5)
      return 2;
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLForKey:", CFSTR("newsarticles.anf.embed_source_url")))
  {

    return 1;
  }
  -[NUWebContentLoadingPolicyProvider headline](self, "headline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDraft");

  return v8 != 0;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headline, 0);
}

@end
