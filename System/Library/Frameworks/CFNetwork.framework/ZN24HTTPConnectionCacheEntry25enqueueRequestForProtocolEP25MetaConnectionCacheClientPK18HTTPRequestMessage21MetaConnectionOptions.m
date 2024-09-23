@implementation ZN24HTTPConnectionCacheEntry25enqueueRequestForProtocolEP25MetaConnectionCacheClientPK18HTTPRequestMessage21MetaConnectionOptions

_QWORD *___ZN24HTTPConnectionCacheEntry25enqueueRequestForProtocolEP25MetaConnectionCacheClientPK18HTTPRequestMessage21MetaConnectionOptions_block_invoke(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = result;
  if (*(_DWORD *)(a2 + 220) == 5)
  {
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(a2 + 288);
  }
  v3 = *(_QWORD *)(result[6] + 8);
  if (*(_BYTE *)(v3 + 24))
  {
    result = *(_QWORD **)(a2 + 136);
    if (result)
    {
      v4 = v2[7];
      if (v4)
        v5 = v4 - 176;
      else
        v5 = 0;
      result = (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD, uint64_t, _QWORD))(*result + 280))(result, *(_QWORD *)(v5 + 80), 4, 0);
      v3 = *(_QWORD *)(v2[6] + 8);
    }
    *(_BYTE *)(v3 + 24) = 0;
  }
  return result;
}

@end
