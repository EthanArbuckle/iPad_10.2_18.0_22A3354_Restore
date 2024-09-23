@implementation AXDeviceRemoteScreenIsBluetoothOn

void __AXDeviceRemoteScreenIsBluetoothOn_block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(getBluetoothManagerClass(), "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "powered");

}

@end
