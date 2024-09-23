@implementation SOSFullPeerInfoReplaceEscrowRecords

const void *__SOSFullPeerInfoReplaceEscrowRecords_block_invoke(uint64_t a1, uint64_t a2, __SecKey *a3, CFTypeRef *a4)
{
  const __CFAllocator *v4;
  uint64_t v5;
  _QWORD v7[5];

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __SOSPeerInfoCopyWithReplacedEscrowRecords_block_invoke;
  v7[3] = &__block_descriptor_40_e170_B24__0____OpaqueSOSPeerInfo____CFRuntimeBase_QAQ_____CFDictionary_____CFData_____CFDictionary_____CFString_____CFString_q____CFString_BB____CFDictionary__8_____CFError_16l;
  v7[4] = v5;
  return SOSPeerInfoCopyWithModification(v4, a2, a3, a4, v7);
}

@end
