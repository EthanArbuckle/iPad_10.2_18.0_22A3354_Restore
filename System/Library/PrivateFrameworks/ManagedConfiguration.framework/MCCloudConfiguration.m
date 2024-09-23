@implementation MCCloudConfiguration

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1)
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global_36);
  return (id)sharedConfiguration_config;
}

void __43__MCCloudConfiguration_sharedConfiguration__block_invoke()
{
  MCCloudConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(MCCloudConfiguration);
  v1 = (void *)sharedConfiguration_config;
  sharedConfiguration_config = (uint64_t)v0;

}

- (void)refreshDetailsFromDisk
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshDetailsFromDisk");

}

- (NSDictionary)details
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setDetails:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D44768];
  v4 = a3;
  objc_msgSend(v3, "sharedConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetails:", v4);

}

- (NSDictionary)setAsideDetails
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAsideDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setSetAsideDetails:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D44768];
  v4 = a3;
  objc_msgSend(v3, "sharedConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetAsideDetails:", v4);

}

- (BOOL)isSupervised
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSupervised");

  return v3;
}

- (BOOL)isTeslaEnrolled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTeslaEnrolled");

  return v3;
}

- (BOOL)isAwaitingConfiguration
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAwaitingConfiguration");

  return v3;
}

- (id)mdmVersionProtocol
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mdmVersionProtocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)diagnosticsUploadURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diagnosticsUploadURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)MAIDUsername
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MAIDUsername");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasMAIDCredential
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasMAIDCredential");

  return v3;
}

- (BOOL)alreadySignedIntoFaceTime
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "alreadySignedIntoFaceTime");

  return v3;
}

- (id)language
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "language");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)region
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)languageScript
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageScript");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isProvisionallyEnrolled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isProvisionallyEnrolled");

  return v3;
}

- (id)provisionalEnrollmentExpirationDate
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provisionalEnrollmentExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tvProviderUserToken
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tvProviderUserToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)skipSetupKeys
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "skipSetupKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
