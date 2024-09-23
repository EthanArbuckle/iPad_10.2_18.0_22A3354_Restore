@implementation NSBundle(SafariServicesExtras)

+ (id)_sf_safariServicesBundle
{
  if (_sf_safariServicesBundle_onceToken != -1)
    dispatch_once(&_sf_safariServicesBundle_onceToken, &__block_literal_global_77);
  return (id)_sf_safariServicesBundle_bundle;
}

@end
