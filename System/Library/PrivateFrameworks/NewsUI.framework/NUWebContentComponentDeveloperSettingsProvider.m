@implementation NUWebContentComponentDeveloperSettingsProvider

- (NUWebContentComponentDeveloperSettingsProvider)initWithHeadline:(id)a3
{
  id v5;
  NUWebContentComponentDeveloperSettingsProvider *v6;
  NUWebContentComponentDeveloperSettingsProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUWebContentComponentDeveloperSettingsProvider;
  v6 = -[NUWebContentComponentDeveloperSettingsProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_headline, a3);

  return v7;
}

- (id)developerSettings
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  uint64_t v7;

  -[NUWebContentComponentDeveloperSettingsProvider headline](self, "headline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isDraft") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[NUWebContentComponentDeveloperSettingsProvider headline](self, "headline");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isLocalDraft");

  }
  v6 = objc_alloc(MEMORY[0x24BE90790]);
  if ((v4 & 1) != 0)
    v7 = 1;
  else
    v7 = NFInternalBuild();
  return (id)objc_msgSend(v6, "initWithAllowRemoteInspection:", v7);
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
