@implementation _DKAudioMetadataKey

+ (id)portType
{
  return CFSTR("_DKAudioMetadataKey-portType");
}

+ (id)portName
{
  return CFSTR("_DKAudioMetadataKey-portName");
}

+ (id)identifier
{
  return CFSTR("_DKAudioMetadataKey-identifier");
}

+ (id)channels
{
  return CFSTR("_DKAudioMetadataKey-channels");
}

+ (id)dataSources
{
  return CFSTR("_DKAudioMetadataKey-dataSources");
}

+ (id)selectedDataSource
{
  return CFSTR("_DKAudioMetadataKey-selectedDataSource");
}

+ (id)preferredDataSource
{
  return CFSTR("_DKAudioMetadataKey-preferredDataSource");
}

+ (id)routeChangeReason
{
  return CFSTR("_DKAudioMetadataKey-routeChangeReason");
}

@end
