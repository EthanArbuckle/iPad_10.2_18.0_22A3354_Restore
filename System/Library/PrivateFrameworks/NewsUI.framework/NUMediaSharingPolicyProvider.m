@implementation NUMediaSharingPolicyProvider

- (NUMediaSharingPolicyProvider)initWithHeadline:(id)a3 appConfigurationManager:(id)a4
{
  id v7;
  id v8;
  NUMediaSharingPolicyProvider *v9;
  NUMediaSharingPolicyProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUMediaSharingPolicyProvider;
  v9 = -[NUMediaSharingPolicyProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_headline, a3);
    objc_storeStrong((id *)&v10->_appConfigurationManager, a4);
  }

  return v10;
}

- (unint64_t)mediaSharingPolicy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  -[NUMediaSharingPolicyProvider headline](self, "headline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceChannelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUMediaSharingPolicyProvider appConfigurationManager](self, "appConfigurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaSharingBlacklistedChannelIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v4);

  return v8;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_headline, 0);
}

@end
