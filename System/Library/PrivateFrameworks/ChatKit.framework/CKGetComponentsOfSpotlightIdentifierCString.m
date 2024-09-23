@implementation CKGetComponentsOfSpotlightIdentifierCString

uint64_t __CKGetComponentsOfSpotlightIdentifierCString_block_invoke(int a1, char **__endptr, _DWORD *a3)
{
  char *v3;
  unsigned int v6;
  const char *v7;
  unsigned int v8;
  uint64_t result;

  v3 = *__endptr;
  if (!**__endptr)
    return 0;
  v8 = v3[1];
  v7 = v3 + 1;
  v6 = v8;
  if ((v8 & 0x80000000) != 0)
  {
    result = __maskrune(v6, 0x400uLL);
    if (!(_DWORD)result)
      return result;
    goto LABEL_7;
  }
  result = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v6 + 60) & 0x400;
  if ((_DWORD)result)
  {
LABEL_7:
    *a3 = strtol(v7, __endptr, 10);
    return 1;
  }
  return result;
}

@end
