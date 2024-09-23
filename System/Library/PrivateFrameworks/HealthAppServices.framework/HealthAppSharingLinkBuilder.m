@implementation HealthAppSharingLinkBuilder

- (id)URLForSharingOverview
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  +[HAServicesDefines internalHealthAppURLScheme](HAServicesDefines, "internalHealthAppURLScheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScheme:", v4);

  +[HAServicesDefines sharingOverviewHostName](HAServicesDefines, "sharingOverviewHostName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHost:", v5);

  -[HealthAppLinkBuilder profileIdentifier](self, "profileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 == 2)
  {
    objc_msgSend(v3, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HealthAppLinkBuilder profileIdentifier](self, "profileIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_hk_appendProfileIdentifier:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v7 == 1)
  {
    objc_msgSend(v3, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
