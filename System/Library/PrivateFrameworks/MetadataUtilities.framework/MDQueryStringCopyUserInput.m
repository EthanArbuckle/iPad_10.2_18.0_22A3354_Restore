@implementation MDQueryStringCopyUserInput

uint64_t ____MDQueryStringCopyUserInput_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  const char *v6;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_QWORD *)(v3 + 24) && *(_WORD *)(a2 + 40) == 4)
  {
    v4 = *(_QWORD *)(a2 + 16);
    if (v4)
    {
      v5 = *(const char **)v4;
      if (*(_QWORD *)v4)
      {
        v6 = *(const char **)(v4 + 72);
        if (v6)
        {
          if (*(_DWORD *)(v4 + 24) <= 8u && (!strcmp(v5, "**") || !strcmp(v5, "*")))
            *(_QWORD *)(v3 + 24) = strdup(v6);
        }
      }
    }
  }
  return a2;
}

@end
