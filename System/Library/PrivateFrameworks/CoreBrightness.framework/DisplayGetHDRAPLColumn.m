@implementation DisplayGetHDRAPLColumn

uint64_t __DisplayGetHDRAPLColumn_block_invoke(uint64_t a1)
{
  uint64_t result;
  CFTypeRef v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = a1;
  v4 = a1;
  v3 = 0;
  v2 = IORegistryEntrySearchCFProperty(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 108), "IOService", CFSTR("cpms-hdr-apl-column"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3u);
  result = _DisplayGetUint32FromCFDataAndRelease(v2, &v3);
  if ((result & 1) != 0)
    DisplayGetHDRAPLColumn_hdrColumn = v3;
  return result;
}

@end
