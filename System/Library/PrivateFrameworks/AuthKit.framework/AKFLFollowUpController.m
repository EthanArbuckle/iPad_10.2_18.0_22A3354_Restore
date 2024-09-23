@implementation AKFLFollowUpController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_controller;
}

void __40__AKFLFollowUpController_sharedInstance__block_invoke()
{
  objc_class *FLFollowUpControllerClass;
  uint64_t v1;
  void *v2;

  FLFollowUpControllerClass = (objc_class *)CoreFollowUpLibraryCore();
  if (FLFollowUpControllerClass)
    FLFollowUpControllerClass = (objc_class *)getFLFollowUpControllerClass();
  v1 = objc_msgSend([FLFollowUpControllerClass alloc], "initWithClientIdentifier:", CFSTR("com.apple.authkit"));
  v2 = (void *)sharedInstance_controller;
  sharedInstance_controller = v1;

}

@end
