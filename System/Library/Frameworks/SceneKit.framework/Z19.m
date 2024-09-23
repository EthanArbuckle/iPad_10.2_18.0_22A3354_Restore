@implementation Z19

_QWORD *___Z19_addLightsInFrustumP19SCNMTLClusterSystem11scn_frustumhRKN13SCNMTLCluster7ContextEPNS_4InfoE_block_invoke(_QWORD *result, unsigned int a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v4 = a2;
    do
    {
      v5 = *(unsigned int *)(*(_QWORD *)(result[4] + 8) + 24);
      if (v5 > 0xFF)
        break;
      v6 = *a4++;
      *(_QWORD *)(result[5] + 8 * v5) = v6;
      v7 = *a3++;
      v8 = result[6];
      v9 = *(_QWORD *)(result[4] + 8);
      v10 = *(unsigned int *)(v9 + 24);
      *(_DWORD *)(v9 + 24) = v10 + 1;
      *(_QWORD *)(v8 + 8 * v10) = v7;
      --v4;
    }
    while (v4);
  }
  return result;
}

@end
