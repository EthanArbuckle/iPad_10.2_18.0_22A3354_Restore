@implementation CFPropertyListKeyPassesFilterSet

void ____CFPropertyListKeyPassesFilterSet_block_invoke(uint64_t a1, CFStringRef theString, _BYTE *a3)
{
  const __CFString *v6;
  CFIndex Length;
  CFIndex v8;
  const __CFString *v9;
  int HasPrefix;
  CFRange v11;

  v6 = *(const __CFString **)(a1 + 40);
  Length = CFStringGetLength(theString);
  v8 = Length - 1;
  if (Length == 1)
  {
    if (CFStringGetCharacterAtIndex(theString, 0) != 42)
    {
      if (CFStringGetLength(v6) != 1)
        return;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (Length < 2 || CFStringGetCharacterAtIndex(theString, v8) != 42)
  {
LABEL_9:
    if (!CFEqual(v6, theString))
      return;
    goto LABEL_10;
  }
  v11.location = 0;
  v11.length = v8;
  v9 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, theString, v11);
  HasPrefix = CFStringHasPrefix(v6, v9);
  CFRelease(v9);
  if (HasPrefix)
  {
LABEL_10:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

@end
