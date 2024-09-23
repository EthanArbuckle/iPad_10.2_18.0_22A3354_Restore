@implementation APAdvertiserBTLEManagerGetTypeID

uint64_t __APAdvertiserBTLEManagerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gAPAdvertiserBTLEManagerTypeID = result;
  return result;
}

@end
