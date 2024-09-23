@implementation SOSBackupSliceKeyBagCopyPeerNames

void __SOSBackupSliceKeyBagCopyPeerNames_block_invoke(uint64_t a1, uint64_t a2)
{
  __CFSet *v2;
  const void *Value;

  v2 = *(__CFSet **)(a1 + 32);
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 32), CFSTR("ComputerName"));
  CFSetAddValue(v2, Value);
}

@end
