@implementation SOSCircleLogState

void __SOSCircleLogState_block_invoke(_QWORD *a1, CFDictionaryRef *a2)
{
  const char *v3;
  __SecKey *v4;
  const void *v5;
  int v6;

  v3 = (const char *)a1[4];
  v4 = (__SecKey *)a1[6];
  v5 = (const void *)a1[7];
  if (SOSCircleVerifyPeerSignatureExists(a1[5], a2))
    v6 = 86;
  else
    v6 = 118;
  SOSPeerInfoLogState(v3, (uint64_t)a2, v4, v5, v6);
}

void __SOSCircleLogState_block_invoke_2(_QWORD *a1, CFDictionaryRef *a2)
{
  const char *v3;
  __SecKey *v4;
  const void *v5;
  int v6;

  v3 = (const char *)a1[4];
  v4 = (__SecKey *)a1[6];
  v5 = (const void *)a1[7];
  if (SOSCircleVerifyPeerSignatureExists(a1[5], a2))
    v6 = 86;
  else
    v6 = 118;
  SOSPeerInfoLogState(v3, (uint64_t)a2, v4, v5, v6);
}

void __SOSCircleLogState_block_invoke_3(_QWORD *a1, CFDictionaryRef *a2)
{
  const char *v3;
  __SecKey *v4;
  const void *v5;
  int v6;

  v3 = (const char *)a1[4];
  v4 = (__SecKey *)a1[6];
  v5 = (const void *)a1[7];
  if (SOSCircleVerifyPeerSignatureExists(a1[5], a2))
    v6 = 86;
  else
    v6 = 118;
  SOSPeerInfoLogState(v3, (uint64_t)a2, v4, v5, v6);
}

void __SOSCircleLogState_block_invoke_75(uint64_t a1, uint64_t a2)
{
  SOSPeerInfoLogState(*(const char **)(a1 + 32), a2, *(__SecKey **)(a1 + 40), *(const void **)(a1 + 48), 118);
}

void __SOSCircleLogState_block_invoke_77(uint64_t a1, uint64_t a2)
{
  SOSPeerInfoLogState(*(const char **)(a1 + 32), a2, *(__SecKey **)(a1 + 40), *(const void **)(a1 + 48), 118);
}

@end
