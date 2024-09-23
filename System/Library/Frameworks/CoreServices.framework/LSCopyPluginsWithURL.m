@implementation LSCopyPluginsWithURL

void ___LSCopyPluginsWithURL_block_invoke(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  __CFArray *v7;

  v6 = (void *)MEMORY[0x186DAE7A0]();
  if (_LSAliasMatchesPath_NoIO(**(void ***)(a1 + 48), *a3, *(void **)(a1 + 32), 2 * (*(_BYTE *)(a1 + 56) != 0)))
  {
    v7 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (!v7)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      v7 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
    CFArrayAppendValue(v7, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2));
  }
  objc_autoreleasePoolPop(v6);
}

@end
