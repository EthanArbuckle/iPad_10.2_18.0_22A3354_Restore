@implementation CMContinuityCaptureGetActivateGenerationID

uint64_t __CMContinuityCaptureGetActivateGenerationID_block_invoke()
{
  uint64_t result;

  result = arc4random_uniform(0x2710u);
  atomic_store(result, &__activateGenerationID);
  return result;
}

@end
