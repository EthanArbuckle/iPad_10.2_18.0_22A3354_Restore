@implementation BluetoothEndpointManagerHandleUpdateEvent

void __BluetoothEndpointManagerHandleUpdateEvent_block_invoke(uint64_t a1)
{
  int updated;
  int v3;
  NSObject *v4;
  uint64_t v5;
  char v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  updated = BluetoothEndpointCollectionUpdateEndpoint(*(NSObject ***)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40), (uint64_t)&v6);
  if (v6)
  {
    v3 = updated;
    v4 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v8 = v5;
      v9 = 1024;
      v10 = v3;
      _os_log_impl(&dword_21B151000, v4, OS_LOG_TYPE_DEFAULT, "Update %@ err:%d", buf, 0x12u);
    }
    if (!v3)
      manager_postEndpointsChangedNotification(*(const void **)(a1 + 48));
  }
}

@end
