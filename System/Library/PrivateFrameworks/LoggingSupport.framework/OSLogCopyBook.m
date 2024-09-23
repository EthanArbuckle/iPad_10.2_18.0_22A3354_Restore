@implementation OSLogCopyBook

BOOL ___OSLogCopyBook_block_invoke(uint64_t a1, uint64_t a2, char *__s)
{
  char *v6;
  _BOOL8 result;
  const char *v8;
  char *v9;
  const char *v10;
  uint64_t v11;
  int *v12;
  char __str[1024];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = strrchr(__s, 46);
  if (!v6 || strcmp(v6, ".tracev3"))
    return 1;
  v8 = *(const char **)(a1 + 88);
  v9 = strrchr(__s, 47);
  if (v9)
    v10 = v9 + 1;
  else
    v10 = __s;
  snprintf(__str, 0x400uLL, "%s/%s", v8, v10);
  v11 = _OSLogCopyTraceFile(a2, (uint64_t)__str, *(_QWORD ***)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 112));
  if (v11 < 1)
  {
    if (v11 < 0)
    {
      v12 = __error();
      result = 0;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *v12;
      return result;
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += v11;
  }
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) < *(_QWORD *)(a1 + 120);
}

@end
