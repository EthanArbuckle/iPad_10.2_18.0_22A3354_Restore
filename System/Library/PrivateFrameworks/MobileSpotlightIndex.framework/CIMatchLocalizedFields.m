@implementation CIMatchLocalizedFields

_QWORD *___CIMatchLocalizedFields_block_invoke(_QWORD *result, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  _DWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  char *v13;
  char *v14;
  const char *v15;
  char *v16;
  const char *v17;
  uint64_t v18;

  if (a3)
  {
    v5 = a3;
    v6 = result;
    while ((*(_BYTE *)v5 & 1) == 0)
    {
      v7 = *(_QWORD *)(v6[4] + 8);
      v8 = *(_DWORD *)(v7 + 24);
      v9 = *(_QWORD *)(v6[5] + 8);
      if (v8 >= *(_DWORD *)(v9 + 24))
      {
        if (v8)
          v11 = 2 * v8;
        else
          v11 = 64;
        *(_DWORD *)(v9 + 24) = v11;
        result = malloc_type_realloc(*(void **)(*(_QWORD *)(v6[6] + 8) + 24), 4 * *(unsigned int *)(*(_QWORD *)(v6[5] + 8) + 24), 0x1051303uLL);
        *(_QWORD *)(*(_QWORD *)(v6[6] + 8) + 24) = result;
        v10 = *(_QWORD *)(*(_QWORD *)(v6[6] + 8) + 24);
        if (!v10)
        {
          v16 = __si_assert_copy_extra_268();
          v14 = v16;
          v17 = "";
          if (v16)
            v17 = v16;
          __message_assert("%s:%u: failed assertion '%s' %s ", "CIQuery.c", 1237, "fields", v17);
          goto LABEL_20;
        }
        v7 = *(_QWORD *)(v6[4] + 8);
        v8 = *(_DWORD *)(v7 + 24);
      }
      else
      {
        v10 = *(_QWORD *)(*(_QWORD *)(v6[6] + 8) + 24);
      }
      v12 = v5[2];
      *(_DWORD *)(v7 + 24) = v8 + 1;
      *(_DWORD *)(v10 + 4 * v8) = v12;
      if (*v5 >= 2u)
      {
        v5 = (_DWORD *)(a4 + 12 * (*v5 >> 1));
        if (a4)
          continue;
      }
      return result;
    }
    v13 = __si_assert_copy_extra_268();
    v14 = v13;
    v15 = "";
    if (v13)
      v15 = v13;
    __message_assert("%s:%u: failed assertion '%s' %s ", "CIQuery.c", 1232, "0", v15);
LABEL_20:
    free(v14);
    if (__valid_fs(-1))
      v18 = 2989;
    else
      v18 = 3072;
    *(_DWORD *)v18 = -559038737;
    abort();
  }
  return result;
}

@end
