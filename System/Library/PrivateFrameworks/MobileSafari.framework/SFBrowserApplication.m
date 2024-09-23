@implementation SFBrowserApplication

+ (void)initialize
{
  objc_msgSend(MEMORY[0x1E0CB35C8], "safari_setUpCloudKitPrivacyPreservingUserInfoProvider");
}

- (SFBrowserApplicationProxy)proxy
{
  return self->_proxy;
}

- (WBSTabEntityDataSource)tabEntityDataSource
{
  return self->_tabEntityDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabEntityDataSource, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
