@implementation LSBundleDataIsIncomplete

void ___LSBundleDataIsIncomplete_block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, _BYTE *a4)
{
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = _LSGetPlugin(*(_QWORD *)(a1 + 32), a3);
  if (v7 && !*(_DWORD *)(v7 + 140))
  {
    if ((*(_BYTE *)(v7 + 164) & 1) != 0 && *(_DWORD *)(v7 + 12))
    {
      _LSDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)_CSStringCopyCFString();
        v10 = 134218242;
        v11 = a3;
        v12 = 2114;
        v13 = v9;
        _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEFAULT, "First-party plugin %llx (%{public}@) is malformed. Skipping during incompleteness check.", (uint8_t *)&v10, 0x16u);

      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

@end
