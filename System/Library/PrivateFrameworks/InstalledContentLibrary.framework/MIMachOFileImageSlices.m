@implementation MIMachOFileImageSlices

uint64_t __MIMachOFileImageSlices_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  MIMachOImageSlice *v7;

  v6 = *(void **)(a1 + 32);
  v7 = -[MIMachOImageSlice initWithCPUType:cpuSubtype:platform:sdkVersion:minOSVersion:]([MIMachOImageSlice alloc], "initWithCPUType:cpuSubtype:platform:sdkVersion:minOSVersion:", a2, a3, a4, a5, a6);
  objc_msgSend(v6, "addObject:", v7);

  return 1;
}

@end
