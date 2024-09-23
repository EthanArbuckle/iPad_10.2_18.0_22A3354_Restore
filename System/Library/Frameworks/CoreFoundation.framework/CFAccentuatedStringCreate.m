@implementation CFAccentuatedStringCreate

void ___CFAccentuatedStringCreate_block_invoke()
{
  __CFCharacterSet *Mutable;
  const __CFCharacterSet *Predefined;
  const __CFCharacterSet *v2;
  const __CFCharacterSet *v3;
  const __CFCharacterSet *v4;
  const __CFCharacterSet *v5;
  const __CFCharacterSet *v6;

  Mutable = CFCharacterSetCreateMutable(0);
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetControl);
  CFCharacterSetUnion(Mutable, Predefined);
  v2 = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  CFCharacterSetUnion(Mutable, v2);
  v3 = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  CFCharacterSetUnion(Mutable, v3);
  v4 = CFCharacterSetGetPredefined(kCFCharacterSetSymbol);
  CFCharacterSetUnion(Mutable, v4);
  v5 = CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
  CFCharacterSetUnion(Mutable, v5);
  v6 = CFCharacterSetGetPredefined(kCFCharacterSetNonBase);
  CFCharacterSetUnion(Mutable, v6);
  _CFAccentuatedStringCreate_charsToSkip = (uint64_t)CFCharacterSetCreateCopy(0, Mutable);
  CFRelease(Mutable);
}

void ___CFAccentuatedStringCreate_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t *a3, unsigned __int16 a4)
{
  uint64_t v4;

  v4 = *a3 + 1;
  *(_WORD *)(a2 + 2 * *a3) = _CFAccentuatedStringCreate_acceptableAccentChars[a4 % 6u];
  *a3 = v4;
}

@end
