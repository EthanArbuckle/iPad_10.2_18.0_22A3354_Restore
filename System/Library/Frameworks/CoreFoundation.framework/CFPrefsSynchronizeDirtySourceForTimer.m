@implementation CFPrefsSynchronizeDirtySourceForTimer

uint64_t ___CFPrefsSynchronizeDirtySourceForTimer_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "createDiskWrite");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end
