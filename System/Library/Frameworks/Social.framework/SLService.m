@implementation SLService

+ (id)serviceForServiceType:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  +[SLRemoteService remoteServiceForTypeIdentifier:](SLRemoteService, "remoteServiceForTypeIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

+ (id)allServices
{
  void *v2;
  void *v3;
  void *v4;

  +[SLRemoteService remoteServices](SLRemoteService, "remoteServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("serviceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

- (BOOL)hasAccounts
{
  void *v2;
  int v3;
  id v4;

  -[SLService accountTypeIdentifier](self, "accountTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(MEMORY[0x1E0C8F2B8], "accountsWithAccountTypeIdentifierExist:", v2);
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    v3 = objc_msgSend(v4, "updateExistenceCacheOfAccountWithTypeIdentifier:", v2);

  }
  return v3 != 2;
}

- (BOOL)isFirstClassService
{
  return 1;
}

- (id)serviceType
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Someone didn't override -serviceType"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)accountType
{
  return 0;
}

- (int64_t)maximumURLCount
{
  return -1;
}

- (int64_t)maximumImageCount
{
  return -1;
}

- (int64_t)maximumImageDataSize
{
  return -1;
}

- (int64_t)maximumVideoCount
{
  return -1;
}

- (int64_t)maximumVideoDataSize
{
  return -1;
}

- (int64_t)maximumVideoTimeLimit
{
  return -1;
}

- (BOOL)supportsImageURL:(id)a3
{
  return 0;
}

- (BOOL)supportsVideoURL:(id)a3
{
  return 0;
}

- (id)activityTitle
{
  return 0;
}

- (id)activityImage
{
  return 0;
}

- (id)composeViewController
{
  return 0;
}

@end
