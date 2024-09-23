@implementation ReleaseOldCryptorAndMagicCookie

uint64_t __audioHoseManagerBuffered_ReleaseOldCryptorAndMagicCookie_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  __int128 v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = audioHoseManagerBuffered_releaseCryptors(v2, (uint64_t)&v5);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    return APSLogErrorAt();
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = audioHoseManagerBuffered_releaseMagicCookies(v3, (uint64_t)&v5);
  result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

@end
