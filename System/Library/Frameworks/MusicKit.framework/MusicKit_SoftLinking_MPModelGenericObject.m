@implementation MusicKit_SoftLinking_MPModelGenericObject

+ (int64_t)typeForRawValue:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0x15)
    return 0;
  else
    return a3;
}

+ (int64_t)rawValueForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0x15)
    return 0;
  else
    return a3;
}

@end
