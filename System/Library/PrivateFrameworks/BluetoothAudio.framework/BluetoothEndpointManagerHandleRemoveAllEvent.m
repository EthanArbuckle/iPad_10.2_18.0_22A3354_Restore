@implementation BluetoothEndpointManagerHandleRemoveAllEvent

void __BluetoothEndpointManagerHandleRemoveAllEvent_block_invoke(uint64_t a1)
{
  BluetoothEndpointCollectionMarkAllEndpointsForRemoval(*(NSObject ***)(*(_QWORD *)(a1 + 32) + 32));
  manager_postEndpointsChangedNotification(*(const void **)(a1 + 40));
}

@end
