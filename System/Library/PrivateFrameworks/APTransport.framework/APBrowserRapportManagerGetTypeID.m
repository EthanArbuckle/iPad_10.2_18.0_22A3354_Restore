@implementation APBrowserRapportManagerGetTypeID

uint64_t __APBrowserRapportManagerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gAPBrowserRapportManagerTypeID = result;
  return result;
}

@end
