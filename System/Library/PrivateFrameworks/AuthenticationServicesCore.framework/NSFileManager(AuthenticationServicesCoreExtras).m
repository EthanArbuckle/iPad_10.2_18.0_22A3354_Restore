@implementation NSFileManager(AuthenticationServicesCoreExtras)

- (id)as_authenticationServicesManagedConfigurationURL
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "safari_mobileSafariContainerDirectoryURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:", CFSTR("Library/Safari"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("AuthenticationServicesManagedConfiguration.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
