@implementation APAdvertiserCopyAssistedModeInfo

uint64_t ___APAdvertiserCopyAssistedModeInfo_block_invoke(uint64_t a1)
{
  const void *v2;

  _APAdvertiserEnsureAssistedModeInfoCreated(*(_QWORD *)(a1 + 32), 0);
  if (*MEMORY[0x24BDBD270])
    v2 = (const void *)*MEMORY[0x24BDBD270];
  else
    v2 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), CFSTR("AssistedOverAWDL"), v2);
  CFDictionarySetCString();
  CFDictionarySetCString();
  return CFDictionarySetCString();
}

@end
