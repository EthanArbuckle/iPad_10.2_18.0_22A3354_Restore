@implementation AVCaptureMetadataObjectsOnly

uint64_t __AVCaptureMetadataObjectsOnly_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  if ((result & 1) == 0)
    AVCaptureMetadataObjectsOnly_answer = 1;
  return result;
}

@end
