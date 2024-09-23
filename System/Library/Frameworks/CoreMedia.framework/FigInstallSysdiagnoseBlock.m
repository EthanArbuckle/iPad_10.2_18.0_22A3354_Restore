@implementation FigInstallSysdiagnoseBlock

void __FigInstallSysdiagnoseBlock_block_invoke(uint64_t a1)
{
  const void *v1;
  const void *v2;

  v2 = *(const void **)(a1 + 32);
  v1 = *(const void **)(a1 + 40);
  if (v2)
    CFDictionarySetValue((CFMutableDictionaryRef)gFigSysdiagnoseBlockRegistry_1, v1, v2);
  else
    CFDictionaryRemoveValue((CFMutableDictionaryRef)gFigSysdiagnoseBlockRegistry_1, v1);
}

@end
