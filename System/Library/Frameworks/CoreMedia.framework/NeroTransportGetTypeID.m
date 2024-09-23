@implementation NeroTransportGetTypeID

uint64_t __NeroTransportGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  NeroTransportGetTypeID_sNeroTransportTypeID = result;
  return result;
}

@end
