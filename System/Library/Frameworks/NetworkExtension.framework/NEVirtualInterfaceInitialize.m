@implementation NEVirtualInterfaceInitialize

uint64_t ____NEVirtualInterfaceInitialize_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kNEVirtualInterfaceTypeID = result;
  return result;
}

@end
