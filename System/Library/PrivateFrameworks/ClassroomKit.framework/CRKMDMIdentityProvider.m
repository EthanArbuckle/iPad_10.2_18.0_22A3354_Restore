@implementation CRKMDMIdentityProvider

+ (CRKIdentity)identity
{
  __CFBundle *v2;
  __CFBundle *v3;
  uint64_t (*FunctionPointerForName)(void);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v2 = CFBundleCreate(0, (CFURLRef)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/ManagedConfiguration.framework")));
  v3 = v2;
  if (v2)
  {
    if (CFBundleLoadExecutable(v2))
    {
      FunctionPointerForName = (uint64_t (*)(void))CFBundleGetFunctionPointerForName(v3, CFSTR("MCMDMFilePath"));
      if (FunctionPointerForName)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", FunctionPointerForName());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 0, 0, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForKey:", *MEMORY[0x24BE60F40]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          +[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "keychain");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identityWithPersistentID:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v10 = 0;
        }

LABEL_12:
        CFRelease(v3);
        return (CRKIdentity *)v10;
      }
    }
  }
  _CRKLogGeneral_4();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    +[CRKMDMIdentityProvider identity].cold.1(v11);

  v10 = 0;
  if (v3)
    goto LABEL_12;
  return (CRKIdentity *)v10;
}

- (CRKMDMIdentityProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKMDMIdentityProvider.m"), 83, CFSTR("%@ is unavailable for %@"), v5, self);

  return 0;
}

+ (id)new
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRKMDMIdentityProvider.m"), 88, CFSTR("%@ is unavailable for %@"), v5, a1);

  return 0;
}

+ (void)identity
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch the MDM identity %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
