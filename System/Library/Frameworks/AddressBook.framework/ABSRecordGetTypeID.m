@implementation ABSRecordGetTypeID

uint64_t __ABSRecordGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kABCRecordTypeID = result;
  return result;
}

@end
