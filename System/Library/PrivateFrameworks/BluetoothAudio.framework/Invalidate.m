@implementation Invalidate

void __manager_Invalidate_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)v1)
  {
    *(_BYTE *)v1 = 1;
    BluetoothEndpointCollectionDelete(*(CFMutableArrayRef **)(v1 + 32));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
}

@end
