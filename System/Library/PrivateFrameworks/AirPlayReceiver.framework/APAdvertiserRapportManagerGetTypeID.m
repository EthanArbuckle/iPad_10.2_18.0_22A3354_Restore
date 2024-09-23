@implementation APAdvertiserRapportManagerGetTypeID

uint64_t __APAdvertiserRapportManagerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gAPAdvertiserRapportManagerTypeID = result;
  return result;
}

@end
