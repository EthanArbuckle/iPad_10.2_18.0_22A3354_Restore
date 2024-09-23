@implementation BCSetupAssistantDependencyAdapter

+ (void)preloadResourcesWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[BCPreloader shared](BCPreloader, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preloadResourcesWithCompletion:", v3);

}

+ (id)viewControllerWithDismissHandler:(id)a3
{
  id v3;
  BCConfigurationViewController *v4;

  v3 = a3;
  v4 = -[BCConfigurationViewController initWithMode:dismissHandler:]([BCConfigurationViewController alloc], "initWithMode:dismissHandler:", 0, v3);

  return v4;
}

@end
