@implementation AEFileSystem

+ (NSURL)assessmentAgentContainerURL
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AEFileSystem.m"), 53, CFSTR("%@ is unimplemented on iOS"), v5);

  return 0;
}

+ (NSURL)assessmentAgentPolicyStoreDirectoryURL
{
  void *v2;
  void *v3;

  +[AEFileSystem baseURLForGloballyAvailableFiles]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("PolicyStore"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (id)baseURLForGloballyAvailableFiles
{
  void *v0;
  void *v1;
  void *v2;

  objc_opt_self();
  objc_opt_self();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/private/var/mobile"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.assessmentagent"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (NSURL)assessmentModeFileURL
{
  void *v2;
  void *v3;

  +[AEFileSystem baseURLForGloballyAvailableFiles]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("ModeActive"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

@end
