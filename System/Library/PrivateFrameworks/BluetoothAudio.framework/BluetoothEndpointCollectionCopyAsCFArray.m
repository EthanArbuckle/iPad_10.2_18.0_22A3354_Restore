@implementation BluetoothEndpointCollectionCopyAsCFArray

void __BluetoothEndpointCollectionCopyAsCFArray_block_invoke(uint64_t a1)
{
  CFIndex Count;
  BOOL v3;
  CFIndex v4;
  const void **ValueAtIndex;

  Count = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(*(CFAllocatorRef *)(a1 + 48), Count, MEMORY[0x24BDBD690]);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    v3 = Count < 1;
  else
    v3 = 1;
  if (!v3)
  {
    v4 = 0;
    do
    {
      ValueAtIndex = (const void **)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 32), v4);
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *ValueAtIndex);
      ++v4;
    }
    while (Count != v4);
  }
}

@end
