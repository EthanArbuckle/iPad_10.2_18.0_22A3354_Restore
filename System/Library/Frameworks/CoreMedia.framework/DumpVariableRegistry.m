@implementation DumpVariableRegistry

void __DumpVariableRegistry_block_invoke(uint64_t a1)
{
  void (*v1)(uint64_t, CFArrayRef, uint64_t);

  if (*(_BYTE *)(a1 + 32))
    v1 = DumpNonDefaultRegisteredVariablesDictionaryApplierFunction;
  else
    v1 = DumpAllRegisteredVariablesDictionaryApplierFunction;
  CFDictionaryApplyFunction((CFDictionaryRef)gFigNoteVariableRegistry_1, (CFDictionaryApplierFunction)DumpVariableAppIDDictionaryApplierFunction, v1);
}

@end
