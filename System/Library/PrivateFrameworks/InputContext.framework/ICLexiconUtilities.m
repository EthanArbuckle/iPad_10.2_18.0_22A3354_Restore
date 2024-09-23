@implementation ICLexiconUtilities

void __54___ICLexiconUtilities_lexiconContainsEntry_forString___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  const __CFString *v5;

  v5 = (const __CFString *)LXEntryCopyString();
  if (CFStringCompare(v5, *(CFStringRef *)(a1 + 40), 0) == kCFCompareEqualTo)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  CFRelease(v5);
}

void __52___ICLexiconUtilities_sortKeyEquivalents_forString___block_invoke(uint64_t a1)
{
  const void *v2;

  v2 = (const void *)LXEntryCopyString();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
  CFRelease(v2);
}

void __43___ICLexiconUtilities_copyEntry_forString___block_invoke(uint64_t a1, const void *a2, _BYTE *a3)
{
  const __CFString *v6;

  v6 = (const __CFString *)LXEntryCopyString();
  if (CFStringCompare(v6, *(CFStringRef *)(a1 + 40), 0) == kCFCompareEqualTo)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFRetain(a2);
    *a3 = 1;
  }
  CFRelease(v6);
}

@end
