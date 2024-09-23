@implementation APDBluetoothHelperGetTypeID

uint64_t __APDBluetoothHelperGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gAPDBluetoothHelperTypeID = result;
  return result;
}

@end
