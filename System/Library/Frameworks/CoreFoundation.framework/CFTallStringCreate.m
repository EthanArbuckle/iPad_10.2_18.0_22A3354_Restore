@implementation CFTallStringCreate

uint64_t ___CFTallStringCreate_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3, UniChar a4)
{
  uint64_t v7;
  const __CFCharacterSet *Predefined;
  uint64_t result;
  uint64_t i;
  uint64_t v11;

  v7 = *a3;
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  result = CFCharacterSetIsCharacterMember(Predefined, a4);
  if ((_DWORD)result)
  {
    for (i = 0; i != 7; ++i)
      *(_WORD *)(a2 + 2 * v7 + 2 * i) = _CFTallStringCreate_tallCharacters[i];
    v11 = a2 + 2 * v7;
    v7 += 8;
    *(_WORD *)(v11 + 14) = 32;
  }
  *a3 = v7;
  return result;
}

@end
