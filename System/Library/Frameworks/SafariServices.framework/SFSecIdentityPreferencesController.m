@implementation SFSecIdentityPreferencesController

void __87___SFSecIdentityPreferencesController_sharedPersistentSecIdentityPreferencesController__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_SFSecIdentityPreferencesController _initUsingEphemeralStorage:]([_SFSecIdentityPreferencesController alloc], "_initUsingEphemeralStorage:", 0);
  v1 = (void *)sharedPersistentSecIdentityPreferencesController_sharedInstance;
  sharedPersistentSecIdentityPreferencesController_sharedInstance = (uint64_t)v0;

}

@end
