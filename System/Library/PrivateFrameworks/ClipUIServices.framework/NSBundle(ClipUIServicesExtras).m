@implementation NSBundle(ClipUIServicesExtras)

+ (id)cps_clipUIServicesBundle
{
  if (cps_clipUIServicesBundle_onceToken != -1)
    dispatch_once(&cps_clipUIServicesBundle_onceToken, &__block_literal_global);
  return (id)cps_clipUIServicesBundle_bundle;
}

@end
