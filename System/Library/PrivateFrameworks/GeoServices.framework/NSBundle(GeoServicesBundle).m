@implementation NSBundle(GeoServicesBundle)

+ (id)__geoBundle
{
  if (qword_1ECDBC5F8 != -1)
    dispatch_once(&qword_1ECDBC5F8, &__block_literal_global_149);
  return (id)_MergedGlobals_287;
}

@end
