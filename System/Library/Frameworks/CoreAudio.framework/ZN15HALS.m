@implementation ZN15HALS

__int32 *___ZN15HALS_AHPManager23ObjectPropertiesChangedEjjPK26AudioObjectPropertyAddressP11HALS_Client_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int32 *v3;
  __int32 *result;
  __int32 *v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(__int32 **)(v2 + 392);
  result = wmemchr(*(__int32 **)(v2 + 384), *(_DWORD *)(a1 + 48), ((uint64_t)v3 - *(_QWORD *)(v2 + 384)) >> 2);
  if (result)
    v5 = result;
  else
    v5 = v3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5 != *(__int32 **)(v2 + 392);
  return result;
}

_DWORD *___ZN15HALS_IOA2Device15SetPropertyDataEjRK26AudioObjectPropertyAddressjPKvjS4_P11HALS_Client_block_invoke_97(uint64_t a1)
{
  _DWORD *result;

  result = HALS_IOA2Device::_FindCustomControlForDeviceAddress(*(HALS_IOA2Device **)(a1 + 48), *(const AudioObjectPropertyAddress **)(a1 + 56), (AudioObjectPropertyAddress *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
