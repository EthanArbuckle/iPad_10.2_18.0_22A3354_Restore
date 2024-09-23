@implementation APBrowserBTLEManagerGetTypeID

uint64_t __APBrowserBTLEManagerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gAPBrowserBTLEManagerTypeID = result;
  return result;
}

@end
