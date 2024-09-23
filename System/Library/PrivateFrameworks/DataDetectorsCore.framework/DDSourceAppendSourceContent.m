@implementation DDSourceAppendSourceContent

void ___DDSourceAppendSourceContent_block_invoke(_QWORD *a1, const __CFString *a2, char *a3, uint64_t a4)
{
  uint64_t v7;

  DDLookupTrieInsertKeyWithExtra(*(unsigned int **)(a1[5] + 56), a2, a1[6], a3);
  if (a4 && a2)
  {
    v7 = a1[4];
    if (v7)
      (*(void (**)(uint64_t, const __CFString *, uint64_t))(v7 + 16))(v7, a2, a4);
  }
}

void ___DDSourceAppendSourceContent_block_invoke_2(uint64_t a1, CFStringRef theString, char *a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;

  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(unsigned int **)(v6 + 64);
  if (!v7)
  {
    v7 = (unsigned int *)malloc_type_calloc(1uLL, 0x38uLL, 0x1022040E9E2EC27uLL);
    *v7 |= 0x1000u;
    *((_QWORD *)v7 + 2) = 0;
    *((_QWORD *)v7 + 4) = 0;
    *(_QWORD *)(v6 + 64) = v7;
  }
  DDLookupTrieInsertKeyWithExtra(v7, theString, v5, a3);
}

@end
