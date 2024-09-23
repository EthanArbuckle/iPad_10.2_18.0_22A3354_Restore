@implementation C3DDynamicBatchingSystemGetTypeID

uint64_t __C3DDynamicBatchingSystemGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DDynamicBatchingSystemGetTypeID_typeID = result;
  return result;
}

@end
