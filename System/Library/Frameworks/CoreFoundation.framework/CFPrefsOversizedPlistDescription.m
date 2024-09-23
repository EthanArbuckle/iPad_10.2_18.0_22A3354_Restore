@implementation CFPrefsOversizedPlistDescription

void __79___CFPrefsOversizedPlistDescription__descriptionOfDictionary_withKeyRedaction___block_invoke(uint64_t a1, const __CFString *a2, __CFString *cf)
{
  uint64_t v5;
  const void *v6;
  CFRange v7;
  uint64_t v8;
  CFIndex v9;
  CFIndex Length;
  CFIndex v11;
  CFIndex v12;
  CFStringRef v13;
  CFTypeRef v14;
  uint64_t CharacterAtIndex;
  uint64_t v16;
  CFIndex v17;
  CFStringRef v18;
  uint64_t v19;
  CFTypeRef cfa[2];

  cfa[1] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  cfa[0] = 0;
  v5 = _approximateSizeOfPlistValue(cf, (CFStringRef *)cfa, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v5;
  if (cfa[0])
  {
    v6 = (const void *)v5;
    if (CFArrayGetCount(*(CFArrayRef *)(a1 + 40)) > 9)
      v7.length = 10;
    else
      v7.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 40));
    v7.location = 0;
    v8 = CFArrayBSearchValues(*(CFArrayRef *)(a1 + 40), v7, v6, (CFComparatorFunction)_compareSizes, 0);
    if (v8 <= 9)
    {
      v9 = v8;
      CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a1 + 40), v8, v6);
      if (*(_BYTE *)(a1 + 56))
      {
        Length = CFStringGetLength(a2);
        v11 = Length;
        v12 = Length - 1;
        if (Length > 1)
        {
          CharacterAtIndex = CFStringGetCharacterAtIndex(a2, 0);
          v16 = CharacterAtIndex;
          v17 = v11 - 2;
          if (v17)
          {
            v19 = CFStringGetCharacterAtIndex(a2, v12);
            v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%C{%ld}%C"), v16, v17, v19);
          }
          else
          {
            v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%C{1}"), CharacterAtIndex);
          }
        }
        else
        {
          v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("{%ld}"), Length);
        }
        v14 = v13;
      }
      else
      {
        v14 = CFRetain(a2);
      }
      v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: %@"), v14, cfa[0]);
      CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a1 + 48), v9, v18);
      CFRelease(v18);
      CFRelease(v14);
    }
    CFRelease(cfa[0]);
  }
}

void __79___CFPrefsOversizedPlistDescription__descriptionOfDictionary_withKeyRedaction___block_invoke_2(uint64_t a1, const __CFString *a2)
{
  CFStringAppend(*(CFMutableStringRef *)(a1 + 32), a2);
  CFStringAppend(*(CFMutableStringRef *)(a1 + 32), CFSTR("\n"));
}

@end
