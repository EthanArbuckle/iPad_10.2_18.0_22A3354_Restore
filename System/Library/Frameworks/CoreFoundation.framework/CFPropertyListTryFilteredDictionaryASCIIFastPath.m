@implementation CFPropertyListTryFilteredDictionaryASCIIFastPath

uint64_t ____CFPropertyListTryFilteredDictionaryASCIIFastPath_block_invoke(uint64_t a1, UInt8 *a2, CFIndex a3)
{
  if (__CFPropertyListKeyBufferMatchesFilterBuffer(a2, a3, *(_BYTE **)(a1 + 32), *(_QWORD *)(a1 + 40)))
    **(_QWORD **)(a1 + 48) = CFStringCreateWithBytes(*(CFAllocatorRef *)(a1 + 56), a2, a3, 0x600u, 0);
  return 1;
}

@end
