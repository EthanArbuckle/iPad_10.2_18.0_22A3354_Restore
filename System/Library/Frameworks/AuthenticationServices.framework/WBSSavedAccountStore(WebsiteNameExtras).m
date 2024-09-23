@implementation WBSSavedAccountStore(WebsiteNameExtras)

- (id)websiteNameProvider
{
  if (websiteNameProvider_once != -1)
    dispatch_once(&websiteNameProvider_once, &__block_literal_global_40_0);
  return (id)websiteNameProvider_websiteNameProvider;
}

@end
