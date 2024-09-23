@implementation AVMetadataItemFilter

+ (AVMetadataItemFilter)metadataItemFilterForSharing
{
  if (metadataItemFilterForSharing_onceToken != -1)
    dispatch_once(&metadataItemFilterForSharing_onceToken, &__block_literal_global_358);
  return (AVMetadataItemFilter *)metadataItemFilterForSharing_sSharingFilter;
}

AVMetadataItemFilterForSharing *__52__AVMetadataItemFilter_metadataItemFilterForSharing__block_invoke()
{
  AVMetadataItemFilterForSharing *result;

  result = objc_alloc_init(AVMetadataItemFilterForSharing);
  metadataItemFilterForSharing_sSharingFilter = (uint64_t)result;
  return result;
}

- (NSDictionary)whitelist
{
  return 0;
}

@end
