@implementation CFBundleSearchForLocalizedString

uint64_t ___CFBundleSearchForLocalizedString_block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  __int128 v4;
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___CFBundleSearchForLocalizedString_block_invoke_2;
  v6[3] = &unk_1E1335BD8;
  v9 = a2;
  v10 = a4;
  v4 = *(_OWORD *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 48);
  v7 = v4;
  return CFDictionaryApply(a3, (uint64_t)v6);
}

uint64_t ___CFBundleSearchForLocalizedString_block_invoke_2(uint64_t a1, const void *a2, CFTypeRef cf1, _BYTE *a4)
{
  uint64_t result;

  result = CFEqual(cf1, *(CFTypeRef *)(a1 + 40));
  if ((_DWORD)result)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      result = (uint64_t)CFRetain(a2);
      **(_QWORD **)(a1 + 48) = result;
    }
    if (*(_QWORD *)(a1 + 56))
    {
      result = (uint64_t)CFRetain(*(CFTypeRef *)(a1 + 64));
      **(_QWORD **)(a1 + 56) = result;
    }
    *a4 = 1;
    **(_BYTE **)(a1 + 72) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

@end
