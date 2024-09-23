@implementation _DKLocationMetadataKey

+ (id)latitude
{
  return CFSTR("_DKLocationMetadataKey-latitude");
}

+ (id)longitude
{
  return CFSTR("_DKLocationMetadataKey-longitude");
}

+ (id)altitude
{
  return CFSTR("_DKLocationMetadataKey-altitude");
}

+ (id)identifier
{
  return CFSTR("_DKLocationMetadataKey-identifier");
}

@end
