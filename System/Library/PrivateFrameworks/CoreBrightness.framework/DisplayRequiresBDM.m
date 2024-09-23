@implementation DisplayRequiresBDM

uint64_t __DisplayRequiresBDM_block_invoke(uint64_t a1)
{
  uint64_t result;
  CFTypeRef v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = a1;
  v4 = a1;
  v3 = 0;
  v2 = IORegistryEntrySearchCFProperty(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 80), "IOService", CFSTR("use-bright-dot-mitigation"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3u);
  result = _DisplayGetUint32FromCFDataAndRelease(v2, &v3);
  if ((result & 1) != 0)
    DisplayRequiresBDM_requiresBDM = v3 != 0;
  return result;
}

@end
