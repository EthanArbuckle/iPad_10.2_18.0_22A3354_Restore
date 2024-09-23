@implementation APConnectivityHelperGetTypeID

uint64_t __APConnectivityHelperGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gAPConnectivityHelperTypeID = result;
  return result;
}

@end
