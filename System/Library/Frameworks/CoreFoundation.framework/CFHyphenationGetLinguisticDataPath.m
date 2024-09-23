@implementation CFHyphenationGetLinguisticDataPath

void ___CFHyphenationGetLinguisticDataPath_block_invoke()
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  CFStringAppend(Mutable, CFSTR("/System/Library/LinguisticData/"));
  _CFDefaultHyphenationLinguisticDataPath = (uint64_t)Mutable;
}

@end
