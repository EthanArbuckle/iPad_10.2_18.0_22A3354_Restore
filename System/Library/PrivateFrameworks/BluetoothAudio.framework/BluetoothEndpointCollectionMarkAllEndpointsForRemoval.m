@implementation BluetoothEndpointCollectionMarkAllEndpointsForRemoval

void __BluetoothEndpointCollectionMarkAllEndpointsForRemoval_block_invoke(uint64_t a1)
{
  CFIndex Count;
  unint64_t v3;
  const void **ValueAtIndex;

  Count = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 32));
  if (Count >= 1)
  {
    v3 = Count + 1;
    do
    {
      ValueAtIndex = (const void **)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 32), 0);
      collection_removeEntry(*(_QWORD *)(a1 + 32), ValueAtIndex, 0);
      --v3;
    }
    while (v3 > 1);
  }
}

@end
