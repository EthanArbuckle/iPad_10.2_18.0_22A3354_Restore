@implementation DisplayHasDCP

uint64_t __DisplayHasDCP_block_invoke(uint64_t a1)
{
  uint64_t result;
  CFTypeRef v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = a1;
  v4 = a1;
  v3 = 0;
  v2 = IORegistryEntrySearchCFProperty(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 80), "IOService", CFSTR("dcp-brightness-node"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3u);
  result = _DisplayGetUint32FromCFDataAndRelease(v2, &v3);
  if ((result & 1) != 0)
    DisplayHasDCP_hasDCP = v3 != 0;
  return result;
}

@end
