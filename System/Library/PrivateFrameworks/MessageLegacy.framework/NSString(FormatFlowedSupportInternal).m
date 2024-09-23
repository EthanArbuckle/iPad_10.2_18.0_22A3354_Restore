@implementation NSString(FormatFlowedSupportInternal)

- (uint64_t)mf_lineBreakBeforeIndex:()FormatFlowedSupportInternal withinRange:
{
  CFIndex v6;
  UniChar *v7;
  UniChar *v8;
  uint64_t v9;
  int v11;
  CFRange v13;

  v6 = -[__CFString length](a1, "length") - a4;
  if (CFStringGetCharactersPtr(a1))
  {
    v7 = 0;
  }
  else
  {
    v8 = (UniChar *)malloc_type_malloc(2 * v6, 0x1000040BDFB0063uLL);
    v13.location = a4;
    v13.length = v6;
    CFStringGetCharacters(a1, v13, v8);
    v7 = v8;
  }
  _GetTextBreakLocale();
  ubrk_open();
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = ubrk_preceding();
  if (v11 != -1 && v7 != 0)
    v9 = a4 + v11;
  ubrk_close();
  if (v7)
    free(v7);
  return v9;
}

- (uint64_t)mf_nextWordFromIndex:()FormatFlowedSupportInternal forward:
{
  CFIndex v6;
  CFIndex v7;
  UniChar *v8;
  uint64_t v9;
  UniChar *v10;
  int v12;
  CFRange v14;

  if (!a4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = a3 + 1;
  v7 = -[__CFString length](a1, "length") - (a3 + 1);
  if (CFStringGetCharactersPtr(a1))
  {
    v8 = 0;
  }
  else
  {
    v10 = (UniChar *)malloc_type_malloc(2 * v7, 0x1000040BDFB0063uLL);
    v14.location = v6;
    v14.length = v7;
    CFStringGetCharacters(a1, v14, v10);
    v8 = v10;
  }
  _GetTextBreakLocale();
  ubrk_open();
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = ubrk_following();
  if (v12 != -1 && v8 != 0)
    v9 = a3 + v12 + 2;
  ubrk_close();
  if (v8)
    free(v8);
  return v9;
}

@end
