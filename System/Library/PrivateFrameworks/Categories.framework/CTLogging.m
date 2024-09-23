@implementation CTLogging

+ (id)appHandle
{
  if (appHandle_onceToken != -1)
    dispatch_once(&appHandle_onceToken, &__block_literal_global_0);
  return (id)appHandle_handle;
}

void __22__CTLogging_appHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CTCategories", "App");
  v1 = (void *)appHandle_handle;
  appHandle_handle = (uint64_t)v0;

}

+ (id)domainHandle
{
  if (domainHandle_onceToken != -1)
    dispatch_once(&domainHandle_onceToken, &__block_literal_global_3);
  return (id)domainHandle_handle;
}

void __25__CTLogging_domainHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CTCategories", "Domain");
  v1 = (void *)domainHandle_handle;
  domainHandle_handle = (uint64_t)v0;

}

+ (id)contextKitHandle
{
  if (contextKitHandle_onceToken != -1)
    dispatch_once(&contextKitHandle_onceToken, &__block_literal_global_5);
  return (id)contextKitHandle_handle;
}

void __29__CTLogging_contextKitHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CTCategories", "ContextKit");
  v1 = (void *)contextKitHandle_handle;
  contextKitHandle_handle = (uint64_t)v0;

}

@end
