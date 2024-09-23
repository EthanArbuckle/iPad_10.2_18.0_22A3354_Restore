@implementation _DKMicroLocationMetadataKey

+ (id)domain
{
  return CFSTR("_DKMicroLocationMetadataKey-domain");
}

+ (id)probabilityVector
{
  return CFSTR("_DKMicroLocationMetadataKey-probabilityVector");
}

+ (id)locationDistribution
{
  return CFSTR("_DKMicroLocationMetadataKey-locationDistribution");
}

+ (id)microLocationDistribution
{
  return CFSTR("_DKMicroLocationMetadataKey-microLocationDistribution");
}

+ (id)microLocationIsStable
{
  return CFSTR("_DKMicroLocationMetadataKey-microLocationIsStable");
}

@end
