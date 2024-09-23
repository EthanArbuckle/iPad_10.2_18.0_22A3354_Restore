@implementation ZN8CSStore210Dictionary15removeAllValuesEv

CSStore2::Store *___ZN8CSStore210Dictionary15removeAllValuesEv_block_invoke(uint64_t a1, unsigned int a2, CSStore2::Store *a3)
{
  uint64_t v4;
  Unit v6[4];
  char v7;

  v4 = *(_QWORD *)(a1 + 32);
  CSStore2::String::Get(v6, *(CSStore2::Store **)v4, a2);
  if (v7)
    CSStore2::String::release(v6);
  return CSStore2::Dictionary::_RelinquishOwnershipOfValue(*(CSStore2::Store **)v4, a3, *(unsigned __int8 *)(*(_QWORD *)(v4 + 8) + 1));
}

@end
