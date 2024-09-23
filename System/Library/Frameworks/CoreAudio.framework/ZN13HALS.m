@implementation ZN13HALS

__int32 *___ZN13HALS_PDPlugIn23ObjectPropertiesChangedEjjPK26AudioObjectPropertyAddressP11HALS_Client_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int32 *v3;
  __int32 *result;
  __int32 *v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(__int32 **)(v2 + 552);
  result = wmemchr(*(__int32 **)(v2 + 544), *(_DWORD *)(a1 + 48), ((uint64_t)v3 - *(_QWORD *)(v2 + 544)) >> 2);
  if (result)
    v5 = result;
  else
    v5 = v3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5 != *(__int32 **)(v2 + 552);
  return result;
}

@end
