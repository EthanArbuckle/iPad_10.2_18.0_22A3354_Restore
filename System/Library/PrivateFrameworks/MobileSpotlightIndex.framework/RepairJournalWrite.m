@implementation RepairJournalWrite

void __RepairJournalWrite_block_invoke(uint64_t a1, char *__s1, uint64_t a3)
{
  CFDictionaryRef v6;
  CFDictionaryRef v7;

  if (strcmp(__s1, "_kMDItemGroupId") && strcmp(__s1, "_kMDItemTextContentIndexExists"))
  {
    v6 = _decodeSDBField(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (unsigned __int16 *)a3, (unsigned __int8 *)(a3 + 13), 0, 0, 0, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    if (v6)
    {
      v7 = v6;
      _MDPlistContainerAddCString();
      _MDPlistContainerAddObject();
      CFRelease(v7);
    }
  }
}

@end
