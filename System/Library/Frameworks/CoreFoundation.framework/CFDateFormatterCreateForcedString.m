@implementation CFDateFormatterCreateForcedString

CFCharacterSetRef ____CFDateFormatterCreateForcedString_block_invoke()
{
  CFCharacterSetRef result;

  result = CFCharacterSetCreateWithCharactersInString((CFAllocatorRef)&__kCFAllocatorSystemDefault, CFSTR("hHkK"));
  __CFDateFormatterCreateForcedString_hourCharacters = (uint64_t)result;
  return result;
}

void ____CFDateFormatterCreateForcedString_block_invoke_2(uint64_t a1)
{
  CFIndex Length;
  uint64_t v3;
  CFIndex v4;
  size_t v5;
  char *v6;
  UniChar *v7;
  uint64_t v8;
  UniChar v9[256];
  uint64_t v10;
  CFRange v11;

  v10 = *MEMORY[0x1E0C80C00];
  Length = CFStringGetLength(*(CFStringRef *)(a1 + 48));
  v4 = Length;
  v5 = 2 * Length;
  if ((unint64_t)(2 * Length) < 0x101)
  {
    if (Length < 1)
    {
      v6 = 0;
    }
    else
    {
      MEMORY[0x1E0C80A78](Length, v3);
      v6 = (char *)&v9[-4] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v6, v5);
    }
  }
  else
  {
    v6 = (char *)malloc_type_malloc(2 * Length, 0x1000040BDFB0063uLL);
  }
  if (!CFStringGetCharactersPtr(*(CFStringRef *)(a1 + 48)))
  {
    v11.location = 0;
    v11.length = v4;
    CFStringGetCharacters(*(CFStringRef *)(a1 + 48), v11, (UniChar *)v6);
  }
  HIDWORD(v8) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = uadatpg_remapPatternWithOptions();
  if (SHIDWORD(v8) <= 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFStringCreateWithCharacters((CFAllocatorRef)&__kCFAllocatorSystemDefault, v9, *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 24));
  }
  else if (HIDWORD(v8) == 15)
  {
    HIDWORD(v8) = 0;
    v7 = (UniChar *)malloc_type_calloc(*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 1, 2uLL, 0x1000040BDFB0063uLL);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = uadatpg_remapPatternWithOptions();
    if (SHIDWORD(v8) <= 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFStringCreateWithCharacters((CFAllocatorRef)&__kCFAllocatorSystemDefault, v7, *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 24));
    free(v7);
  }
  if (v5 >= 0x101)
    free(v6);
}

@end
