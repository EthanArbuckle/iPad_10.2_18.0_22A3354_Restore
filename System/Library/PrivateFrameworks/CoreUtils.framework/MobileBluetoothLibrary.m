@implementation MobileBluetoothLibrary

void *__MobileBluetoothLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MobileBluetooth.framework/MobileBluetooth", 2);
  MobileBluetoothLibrary_sLib = (uint64_t)result;
  return result;
}

void *__MobileBluetoothLibrary_block_invoke_1981()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MobileBluetooth.framework/MobileBluetooth", 2);
  MobileBluetoothLibrary_sLib_1978 = (uint64_t)result;
  return result;
}

@end
