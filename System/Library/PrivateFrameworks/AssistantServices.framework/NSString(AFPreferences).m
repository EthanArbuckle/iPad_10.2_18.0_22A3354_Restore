@implementation NSString(AFPreferences)

- (uint64_t)_afpreferences_isLanguageCodePrefix
{
  return objc_msgSend(a1, "containsString:", CFSTR("-")) ^ 1;
}

- (uint64_t)_afpreferences_languageCodePrefix
{
  return objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "rangeOfString:", CFSTR("-")));
}

@end
