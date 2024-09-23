@implementation NLTaggerCopyAvailableTagSchemes

void __NLTaggerCopyAvailableTagSchemes_block_invoke(uint64_t a1, uint64_t *a2, CFStringRef theString1)
{
  const __CFString *v5;
  uint64_t v6;
  const __CFArray *v7;
  __CFString **v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFArray *v12;
  CFRange v13;
  CFRange v14;

  if (CFStringCompare(theString1, CFSTR("Tagging"), 0) == kCFCompareEqualTo)
  {
    v5 = (const __CFString *)corelm::util::Matrix<float>::numCols(*a2);
    if (!CFStringHasPrefix(v5, CFSTR("pos"))
      || (v6 = a1 + 32,
          v7 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24),
          v13.length = CFArrayGetCount(v7),
          v8 = kNLTagSchemeLexicalClass,
          v13.location = 0,
          CFArrayContainsValue(v7, v13, kNLTagSchemeLexicalClass[0])))
    {
      v9 = (const __CFString *)corelm::util::Matrix<float>::numCols(*a2);
      if (!CFStringHasPrefix(v9, CFSTR("ner")))
        return;
      v11 = *(_QWORD *)(a1 + 32);
      v10 = a1 + 32;
      v12 = *(const __CFArray **)(*(_QWORD *)(v11 + 8) + 24);
      v14.length = CFArrayGetCount(v12);
      v8 = kNLTagSchemeNamedEntity;
      v14.location = 0;
      if (CFArrayContainsValue(v12, v14, kNLTagSchemeNamedEntity[0]))
        return;
      v6 = v10;
    }
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 24), *v8);
  }
}

@end
