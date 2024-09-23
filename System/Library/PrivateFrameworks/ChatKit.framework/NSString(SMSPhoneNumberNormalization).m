@implementation NSString(SMSPhoneNumberNormalization)

- (id)unformattedPhoneNumber
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;

  v2 = objc_msgSend(a1, "length");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", v2);
  if (v2)
  {
    v4 = 0;
    v5 = MEMORY[0x1E0C80978];
    do
    {
      v6 = objc_msgSend(a1, "characterAtIndex:", v4);
      v7 = v6;
      if (v6 > 0x7F)
        v8 = __maskrune(v6, 0x500uLL);
      else
        v8 = *(_DWORD *)(v5 + 4 * v6 + 60) & 0x500;
      if ((v7 & 0xFFFE) == 0x2A || v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

      }
      ++v4;
    }
    while (v2 != v4);
  }
  return v3;
}

@end
