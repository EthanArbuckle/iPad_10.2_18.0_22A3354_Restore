@implementation LSApplicationRecordEnumerator

BOOL __96___LSApplicationRecordEnumerator_Private___applicationRecordWithContext_bundleIdentifierOrUnit___block_invoke_2(uint64_t a1, int a2, LSContext *a3, uint64_t a4)
{
  return evaluateBundleNoIOCommon(a3, a4, *(const LSBundleData **)(*(_QWORD *)(a1 + 32) + 96));
}

BOOL __96___LSApplicationRecordEnumerator_Private___applicationRecordWithContext_bundleIdentifierOrUnit___block_invoke(uint64_t a1, int a2, _DWORD *a3, _QWORD *a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _BOOL8 v13;
  _QWORD v15[5];
  _OWORD v16[2];
  uint64_t v17;

  v7 = a1;
  v17 = *MEMORY[0x1E0C80C00];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96___LSApplicationRecordEnumerator_Private___applicationRecordWithContext_bundleIdentifierOrUnit___block_invoke_2;
  v15[3] = &unk_1E103FD68;
  v15[4] = *(_QWORD *)(a1 + 32);
  v8 = (void *)MEMORY[0x186DAE9BC](v15);
  v10 = *(void **)(v7 + 40);
  v9 = *(_QWORD *)(v7 + 48);
  memset(v16, 0, sizeof(v16));
  LODWORD(v7) = *(_DWORD *)(v7 + 56);
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _LSBundleFindWithInfoAndNo_IOFilter(v9, 0, v10, 0, v16, v7, a2, v12, v8, a3, a4, 0);

  return v13;
}

void __60___LSApplicationRecordEnumerator__prepareWithContext_error___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  _DWORD *v4;
  _QWORD *v5;
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  int v15;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32) + 104;
    v4 = *(_DWORD **)(*(_QWORD *)(a1 + 32) + 112);
    v5 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
    if ((unint64_t)v4 >= *v5)
    {
      v7 = *(_DWORD **)v3;
      v8 = ((uint64_t)v4 - *(_QWORD *)v3) >> 2;
      v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) >> 62)
        abort();
      v10 = *v5 - (_QWORD)v7;
      if (v10 >> 1 > v9)
        v9 = v10 >> 1;
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL)
        v11 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v11 = v9;
      if (v11)
      {
        v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)v5, v11);
        v7 = *(_DWORD **)v3;
        v4 = *(_DWORD **)(v3 + 8);
      }
      else
      {
        v12 = 0;
      }
      v13 = &v12[4 * v8];
      v14 = &v12[4 * v11];
      *(_DWORD *)v13 = a2;
      v6 = v13 + 4;
      while (v4 != v7)
      {
        v15 = *--v4;
        *((_DWORD *)v13 - 1) = v15;
        v13 -= 4;
      }
      *(_QWORD *)v3 = v13;
      *(_QWORD *)(v3 + 8) = v6;
      *(_QWORD *)(v3 + 16) = v14;
      if (v7)
        operator delete(v7);
    }
    else
    {
      *v4 = a2;
      v6 = v4 + 1;
    }
    *(_QWORD *)(v3 + 8) = v6;
  }
}

void __60___LSApplicationRecordEnumerator__prepareWithContext_error___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _DWORD *v11;
  _DWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  int v20;

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(a3 + 168) == *(_DWORD *)(v3 + 132))
  {
    v5 = v3 + 104;
    v6 = *(_DWORD **)(v3 + 112);
    v7 = v3 + 104;
    v10 = *(_QWORD *)(v7 + 16);
    v8 = v7 + 16;
    v9 = v10;
    if ((unint64_t)v6 >= v10)
    {
      v12 = *(_DWORD **)v5;
      v13 = ((uint64_t)v6 - *(_QWORD *)v5) >> 2;
      v14 = v13 + 1;
      if ((unint64_t)(v13 + 1) >> 62)
        abort();
      v15 = v9 - (_QWORD)v12;
      if (v15 >> 1 > v14)
        v14 = v15 >> 1;
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL)
        v16 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v16 = v14;
      if (v16)
      {
        v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v8, v16);
        v12 = *(_DWORD **)v5;
        v6 = *(_DWORD **)(v5 + 8);
      }
      else
      {
        v17 = 0;
      }
      v18 = &v17[4 * v13];
      v19 = &v17[4 * v16];
      *(_DWORD *)v18 = a2;
      v11 = v18 + 4;
      while (v6 != v12)
      {
        v20 = *--v6;
        *((_DWORD *)v18 - 1) = v20;
        v18 -= 4;
      }
      *(_QWORD *)v5 = v18;
      *(_QWORD *)(v5 + 8) = v11;
      *(_QWORD *)(v5 + 16) = v19;
      if (v12)
        operator delete(v12);
    }
    else
    {
      *v6 = a2;
      v11 = v6 + 1;
    }
    *(_QWORD *)(v5 + 8) = v11;
  }
}

@end
