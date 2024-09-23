@implementation CGImageWriteSessionGetTypeID

uint64_t __CGImageWriteSessionGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  CGImageWriteSessionGetTypeID::id = result;
  return result;
}

@end
