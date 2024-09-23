@implementation NSStringFromCHSColorSchemes

uint64_t __NSStringFromCHSColorSchemes_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  const __CFString *v4;

  v3 = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    result = objc_msgSend(*(id *)(result + 32), "appendString:", CFSTR(", "));
  if (a2 == 1)
  {
    v4 = CFSTR("light");
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    v4 = CFSTR("dark");
LABEL_7:
    result = objc_msgSend(*(id *)(v3 + 32), "appendString:", v4);
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24);
  return result;
}

@end
