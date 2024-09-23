@implementation APCarPlayControlServerGetTypeID

uint64_t __APCarPlayControlServerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  APCarPlayControlServerGetTypeID_carPlayControlServerTypeID = result;
  return result;
}

@end
