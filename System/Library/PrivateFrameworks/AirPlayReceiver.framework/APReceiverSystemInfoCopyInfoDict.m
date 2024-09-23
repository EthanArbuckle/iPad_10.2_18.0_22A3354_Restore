@implementation APReceiverSystemInfoCopyInfoDict

uint64_t __APReceiverSystemInfoCopyInfoDict_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = sysInfo_copyInfoDictInternal(*(_QWORD *)(a1 + 40), *(const __CFArray **)(a1 + 48), *(CFAllocatorRef *)(a1 + 56), *(__CFDictionary ***)(a1 + 64));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
