@implementation NSString(MAExtensions)

- (__CFString)ma_normalizedString
{
  __CFString *v1;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFStringNormalize(v1, kCFStringNormalizationFormD);
  CFStringFold(v1, 0x181uLL, 0);
  return v1;
}

@end
