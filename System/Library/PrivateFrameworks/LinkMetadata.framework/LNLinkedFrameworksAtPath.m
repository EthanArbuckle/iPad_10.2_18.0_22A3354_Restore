@implementation LNLinkedFrameworksAtPath

void __LNLinkedFrameworksAtPath_block_invoke(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  int v6;
  int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int *v11;
  int v12;
  BOOL v13;
  BOOL v14;
  uint64_t *v15;
  unsigned int v16;
  int v17;
  unsigned int i;
  int v19;
  BOOL v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;

  v6 = mh_validate(a2, a4);
  *__error() = v6;
  if (!v6)
  {
    v7 = a2 + 8;
    v8 = a2[4];
    if (v8)
    {
      v9 = 0;
      v10 = 0;
      v11 = a2 + 8;
      do
      {
        v12 = *v11;
        v13 = (*v11 + 2147483624) > 0xB || ((1 << (*v11 - 24)) & 0x881) == 0;
        if (!v13 || (v12 != 32 ? (v14 = v12 == 12) : (v14 = 1), v14))
        {
          if (!mh_cmdstr((uint64_t)v11))
            return;
          ++v9;
          v8 = a2[4];
        }
        ++v10;
        v11 = (int *)((char *)v11 + v11[1]);
      }
      while (v10 < v8);
    }
    else
    {
      v9 = 0;
    }
    v15 = (uint64_t *)malloc_type_malloc(8 * (v9 + 1), 0x10040436913F5uLL);
    v16 = a2[4];
    if (v16)
    {
      v17 = 0;
      for (i = 0; i < v16; ++i)
      {
        v19 = *v7;
        v20 = (*v7 + 2147483624) > 0xB || ((1 << (*v7 - 24)) & 0x881) == 0;
        if (!v20 || (v19 != 32 ? (v21 = v19 == 12) : (v21 = 1), v21))
        {
          v15[v17++] = mh_cmdstr((uint64_t)v7);
          v16 = a2[4];
        }
        v7 = (int *)((char *)v7 + v7[1]);
      }
    }
    else
    {
      v17 = 0;
    }
    v15[v17] = 0;
    strlist_to_array(v15, v9);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "if_compactMap:", &__block_literal_global_75);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
}

id __LNLinkedFrameworksAtPath_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR(".framework"));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v2, "substringWithRange:", 0, v3 + v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
