@implementation BluetoothEndpointManagerHandleRemove

void __BluetoothEndpointManagerHandleRemove_block_invoke(uint64_t a1)
{
  char v2;

  v2 = 0;
  BluetoothEndpointCollectionMarkEndpointForRemoval(*(NSObject ***)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40), (uint64_t)&v2);
  if (v2)
    manager_postEndpointsChangedNotification(*(const void **)(a1 + 48));
}

@end
