@implementation BluetoothEndpointCollectionGetCount

CFIndex __BluetoothEndpointCollectionGetCount_block_invoke(uint64_t a1)
{
  CFIndex result;

  result = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
