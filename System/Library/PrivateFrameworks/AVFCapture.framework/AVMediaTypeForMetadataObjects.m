@implementation AVMediaTypeForMetadataObjects

void __AVMediaTypeForMetadataObjects_block_invoke()
{
  uint64_t *v0;
  int v1;

  if (dyld_get_active_platform() == 1)
  {
    v0 = (uint64_t *)MEMORY[0x1E0CF2B78];
  }
  else
  {
    v1 = dyld_program_sdk_at_least();
    v0 = (uint64_t *)MEMORY[0x1E0CF2B78];
    if (v1)
    {
      if (AVCaptureMetadataObjectsOnly_onceToken != -1)
      {
        dispatch_once(&AVCaptureMetadataObjectsOnly_onceToken, &__block_literal_global_11);
        v0 = (uint64_t *)MEMORY[0x1E0CF2B78];
      }
      if (!AVCaptureMetadataObjectsOnly_answer)
        v0 = (uint64_t *)MEMORY[0x1E0CF2B80];
    }
  }
  AVMediaTypeForMetadataObjects_sCorrectedAVMediaTypeMetadata = *v0;
}

@end
