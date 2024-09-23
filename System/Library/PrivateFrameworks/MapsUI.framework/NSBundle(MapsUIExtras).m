@implementation NSBundle(MapsUIExtras)

+ (id)_mapsuiBundle
{
  if (qword_1ED01B508 != -1)
    dispatch_once(&qword_1ED01B508, &__block_literal_global_2);
  return (id)_MergedGlobals_114;
}

@end
