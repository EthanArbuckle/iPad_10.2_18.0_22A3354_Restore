@implementation SOSFullPeerInfoSetCKKS4AllSupport

const void *__SOSFullPeerInfoSetCKKS4AllSupport_block_invoke(uint64_t a1, uint64_t a2, __SecKey *a3, CFTypeRef *a4)
{
  const __CFAllocator *v4;
  _QWORD v6[4];
  char v7;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __SOSFullPeerInfoSetCKKS4AllSupport_block_invoke_2;
  v6[3] = &__block_descriptor_33_e170_B24__0____OpaqueSOSPeerInfo____CFRuntimeBase_QAQ_____CFDictionary_____CFData_____CFDictionary_____CFString_____CFString_q____CFString_BB____CFDictionary__8_____CFError_16l;
  v7 = *(_BYTE *)(a1 + 32);
  return SOSPeerInfoCopyWithModification(v4, a2, a3, a4, v6);
}

uint64_t __SOSFullPeerInfoSetCKKS4AllSupport_block_invoke_2(uint64_t a1, uint64_t a2)
{
  const void **v2;

  if (*(_BYTE *)(a1 + 32))
    v2 = (const void **)MEMORY[0x1E0C9AE50];
  else
    v2 = (const void **)MEMORY[0x1E0C9AE40];
  SOSPeerInfoV2DictionarySetValue(a2, (const void *)sCKKSForAll, *v2);
  return 1;
}

@end
