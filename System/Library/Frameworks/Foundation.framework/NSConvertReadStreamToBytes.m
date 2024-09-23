@implementation NSConvertReadStreamToBytes

void ___NSConvertReadStreamToBytes_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  if (a2)
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E0C9AE30], a2);
  *a3 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

@end
