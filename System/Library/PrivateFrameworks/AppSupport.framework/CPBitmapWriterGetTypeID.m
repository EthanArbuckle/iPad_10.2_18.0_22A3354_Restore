@implementation CPBitmapWriterGetTypeID

uint64_t __CPBitmapWriterGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  CPBitmapWriterGetTypeID_typeID = result;
  return result;
}

@end
