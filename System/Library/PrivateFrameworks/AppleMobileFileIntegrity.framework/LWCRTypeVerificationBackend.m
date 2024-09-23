@implementation LWCRTypeVerificationBackend

BOOL __LWCRTypeVerificationBackend_verifyLWCR_block_invoke(_QWORD *a1, const char *a2, uint64_t a3)
{
  void (*v6)(void);
  _BOOL8 result;
  int v8;
  int *v9;
  int v10;
  uint64_t v12;
  BOOL v13;
  char v14;

  (*(void (**)(void))(a1[7] + 56))();
  if (!strcmp(a2, "vers") || !strcmp(a2, "comp") || !strcmp(a2, "ccat"))
  {
    if (((*(uint64_t (**)(uint64_t))(a1[7] + 16))(a3) & 2) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
      v6 = *(void (**)(void))(a1[7] + 72);
      goto LABEL_8;
    }
    v8 = strcmp(a2, "ccat");
    v9 = (int *)a1[7];
    if (v8)
      goto LABEL_10;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = (*((uint64_t (**)(uint64_t))v9 + 3))(a3);
    v9 = (int *)a1[7];
    v10 = *v9;
    if (*v9 == 8 || v10 == 4)
    {
      if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
        goto LABEL_10;
    }
    else
    {
      if (v10 != 2)
        goto LABEL_10;
      v12 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      v13 = !v12 || v12 == 17;
      if (v13 || v12 == 127)
        goto LABEL_10;
    }
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    v6 = (void (*)(void))*((_QWORD *)v9 + 9);
    goto LABEL_8;
  }
  if (strcmp(a2, "reqs"))
  {
    v6 = *(void (**)(void))(a1[7] + 72);
LABEL_8:
    v6();
    return 0;
  }
  result = verifyAndOrDictionary(a1[7], a3, &v14);
  if (!result)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    return result;
  }
  v9 = (int *)a1[7];
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
LABEL_10:
  (*((void (**)(void))v9 + 8))();
  return 1;
}

@end
