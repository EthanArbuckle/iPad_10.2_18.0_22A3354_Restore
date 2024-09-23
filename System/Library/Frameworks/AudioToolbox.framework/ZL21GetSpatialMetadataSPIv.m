@implementation ZL21GetSpatialMetadataSPIv

void *___ZL21GetSpatialMetadataSPIv_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/libAudioDSP.dylib", 1);
  if (result)
  {
    result = dlsym(result, "gSpatialMetadataSPI");
    GetSpatialMetadataSPI(void)::sSpatialMetadataSPI = (uint64_t)result;
  }
  return result;
}

void *___ZL21GetSpatialMetadataSPIv_block_invoke_16957()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/libAudioDSP.dylib", 1);
  if (result)
  {
    result = dlsym(result, "gSpatialMetadataSPI");
    GetSpatialMetadataSPI(void)::sSpatialMetadataSPI = (uint64_t)result;
  }
  return result;
}

@end
