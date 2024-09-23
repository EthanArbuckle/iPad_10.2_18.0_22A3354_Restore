@implementation GKSignInVisibilityManager

void __49__GKSignInVisibilityManager_UISingletons__shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BE3A298]), "initWithPersistence");
  v1 = (void *)shared_sharedInstance_0;
  shared_sharedInstance_0 = v0;

}

void __67__GKSignInVisibilityManager_UISingletons__sharedWithoutPersistence__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BE3A298]), "initWithoutPersistence");
  v1 = (void *)sharedWithoutPersistence_sharedInstance;
  sharedWithoutPersistence_sharedInstance = v0;

}

@end
