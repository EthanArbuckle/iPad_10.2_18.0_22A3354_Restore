@implementation NSBundle(NTKAdditions)

- (uint64_t)ntk_localizedMarkdownStringForKey:()NTKAdditions value:table:
{
  return objc_msgSend(a1, "_localizedStringNoCacheNoMarkdownParsingForKey:value:table:localizations:actualTableURL:formatSpecifierConfiguration:", a3, a4, a5, 0, 0, 0);
}

@end
