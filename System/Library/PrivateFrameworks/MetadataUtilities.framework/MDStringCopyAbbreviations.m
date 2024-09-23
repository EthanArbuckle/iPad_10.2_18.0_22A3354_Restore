@implementation MDStringCopyAbbreviations

void ___MDStringCopyAbbreviations_block_invoke()
{
  __CFCharacterSet *Mutable;
  const __CFCharacterSet *Predefined;
  __CFCharacterSet *v2;
  const __CFCharacterSet *v3;
  __CFCharacterSet *v4;
  const __CFCharacterSet *v5;

  Mutable = CFCharacterSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  _MDStringCopyAbbreviations_characterSet = (uint64_t)Mutable;
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetSymbol);
  CFCharacterSetUnion(Mutable, Predefined);
  v2 = (__CFCharacterSet *)_MDStringCopyAbbreviations_characterSet;
  v3 = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  CFCharacterSetUnion(v2, v3);
  v4 = (__CFCharacterSet *)_MDStringCopyAbbreviations_characterSet;
  v5 = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  CFCharacterSetUnion(v4, v5);
}

@end
