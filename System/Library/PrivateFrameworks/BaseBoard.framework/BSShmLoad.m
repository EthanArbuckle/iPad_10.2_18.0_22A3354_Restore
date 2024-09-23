@implementation BSShmLoad

uint64_t __BSShmLoad_block_invoke(_QWORD *a1, void *a2, size_t a3)
{
  void *v6;
  void *v7;
  unint64_t v8;
  size_t v9;
  size_t v10;
  int *v11;
  uint64_t result;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)_block_invoke");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("BSSharedMemoryStore.m"), 452, CFSTR("buf cannot be nil"));

  }
  v6 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)_block_invoke");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("BSSharedMemoryStore.m"), 453, CFSTR("readBlock cannot be called on a different thread"));

  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)_block_invoke");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("BSSharedMemoryStore.m"), 454, CFSTR("readBlock must be called in scope"));

  }
  v8 = a1[8];
  v9 = v8 - a3;
  if (v8 >= a3 && (v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), v10 <= v9))
  {
    if (a3)
    {
      memcpy(a2, (const void *)(a1[9] + a1[10] + v10), a3);
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += a3;
    }
    return 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    v11 = __error();
    result = 0;
    *v11 = 14;
  }
  return result;
}

@end
