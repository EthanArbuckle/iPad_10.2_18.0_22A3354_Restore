@implementation CGImageProviderAuxInfo

void __CGImageProviderAuxInfo_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C9DAF0];
  v3[0] = *MEMORY[0x1E0C9AE50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CGImageProviderAuxInfo_auxiliaryInfo;
  CGImageProviderAuxInfo_auxiliaryInfo = v0;

}

@end
