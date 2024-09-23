@implementation NSExtension(CX)

- (id)localizedName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_plugIn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)localizedContainingAppName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_plugIn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedContainingName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)containingAppURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_plugIn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "containingUrl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)plugInKitProxy
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CA58F0];
  objc_msgSend(a1, "_plugIn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pluginKitProxyForUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEnabledViaPlugInKit
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_plugIn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userElection") == 1;

  return v2;
}

@end
