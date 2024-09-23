@implementation GetSpatialMetadataSPI

void *__GetSpatialMetadataSPI_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/libAudioDSP.dylib", 1);
  if (result)
  {
    result = dlsym(result, "gSpatialMetadataSPI");
    GetSpatialMetadataSPI_sSpatialMetadataSPI = (uint64_t)result;
  }
  return result;
}

@end
