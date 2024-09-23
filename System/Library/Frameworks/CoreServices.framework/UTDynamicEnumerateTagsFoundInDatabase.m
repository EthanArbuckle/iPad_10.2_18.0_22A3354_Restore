@implementation UTDynamicEnumerateTagsFoundInDatabase

void ___UTDynamicEnumerateTagsFoundInDatabase_block_invoke(uint64_t a1, const __CFString *a2, void *a3, _BYTE *a4)
{
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (_LSDatabaseGetStringForCFString(*(void **)(a1 + 32), a2, 1))
  {
    v8 = UTTypeConformsTo(a2, CFSTR("public.case-insensitive-text"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = a3;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      v12 = v8 != 0;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          if (_LSDatabaseGetStringForCFString(*(void **)(a1 + 32), *(const __CFString **)(*((_QWORD *)&v14 + 1) + 8 * v13), v12))
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
            *a4 = 0;
          }
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

@end
