@implementation IOPMAssertionCreateWithProperties

uint64_t __IOPMAssertionCreateWithProperties_block_invoke()
{
  IOPMAssertionID AssertionID;

  AssertionID = 0;
  return IOPMAssertionCreateWithProperties((CFDictionaryRef)IOPMAssertionCreateWithProperties_resyncCopy, &AssertionID);
}

@end
