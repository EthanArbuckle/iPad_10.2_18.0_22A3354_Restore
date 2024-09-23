@implementation AAAppleAccountInformationCache

- (AAAppleAccountInformationCache)init
{
  AAAppleAccountInformationCache *v2;
  uint64_t v3;
  NSString *accountFullName;
  uint64_t v5;
  NSString *accountUsername;
  uint64_t v7;
  NSString *profilePictureCacheURL;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AAAppleAccountInformationCache;
  v2 = -[AAAppleAccountInformationCache init](&v10, sel_init);
  if (v2)
  {
    CFPreferencesCopyAppValue(CFSTR("AAAccountFullName"), CFSTR("com.apple.appleaccount"));
    v3 = objc_claimAutoreleasedReturnValue();
    accountFullName = v2->_accountFullName;
    v2->_accountFullName = (NSString *)v3;

    CFPreferencesCopyAppValue(CFSTR("AAAccountUsername"), CFSTR("com.apple.appleaccount"));
    v5 = objc_claimAutoreleasedReturnValue();
    accountUsername = v2->_accountUsername;
    v2->_accountUsername = (NSString *)v5;

    v2->_isSignedIn = CFPreferencesCopyAppValue(CFSTR("AAIsAccountSignedIn"), CFSTR("com.apple.appleaccount")) != 0;
    CFPreferencesCopyAppValue(CFSTR("AAProfilePictureCacheURL"), CFSTR("com.apple.appleaccount"));
    v7 = objc_claimAutoreleasedReturnValue();
    profilePictureCacheURL = v2->_profilePictureCacheURL;
    v2->_profilePictureCacheURL = (NSString *)v7;

  }
  return v2;
}

- (BOOL)isSignedIn
{
  return self->_isSignedIn;
}

- (NSString)accountFullName
{
  return self->_accountFullName;
}

- (NSString)accountUsername
{
  return self->_accountUsername;
}

- (NSString)profilePictureCacheURL
{
  return self->_profilePictureCacheURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilePictureCacheURL, 0);
  objc_storeStrong((id *)&self->_accountUsername, 0);
  objc_storeStrong((id *)&self->_accountFullName, 0);
}

@end
