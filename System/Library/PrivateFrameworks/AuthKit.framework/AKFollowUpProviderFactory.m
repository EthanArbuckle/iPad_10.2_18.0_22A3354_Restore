@implementation AKFollowUpProviderFactory

+ (id)sharedAuthKitFollowupProvider
{
  if (sharedAuthKitFollowupProvider_onceToken != -1)
    dispatch_once(&sharedAuthKitFollowupProvider_onceToken, &__block_literal_global_12);
  return (id)sharedAuthKitFollowupProvider_followupController;
}

void __58__AKFollowUpProviderFactory_sharedAuthKitFollowupProvider__block_invoke()
{
  AKFollowUpController *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [AKFollowUpController alloc];
  +[AKFLFollowUpController sharedInstance](AKFLFollowUpController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[AKFollowUpController initWithFLFollowupController:](v0, "initWithFLFollowupController:", v3);
  v2 = (void *)sharedAuthKitFollowupProvider_followupController;
  sharedAuthKitFollowupProvider_followupController = v1;

}

@end
