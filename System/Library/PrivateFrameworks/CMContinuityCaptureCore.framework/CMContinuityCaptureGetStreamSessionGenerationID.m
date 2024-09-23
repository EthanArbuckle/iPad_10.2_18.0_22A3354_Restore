@implementation CMContinuityCaptureGetStreamSessionGenerationID

uint64_t __CMContinuityCaptureGetStreamSessionGenerationID_block_invoke()
{
  uint64_t result;

  result = arc4random_uniform(0x2710u);
  atomic_store(result, &__streamSessionGenerationID);
  return result;
}

@end
