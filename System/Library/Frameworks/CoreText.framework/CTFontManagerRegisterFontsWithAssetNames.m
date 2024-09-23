@implementation CTFontManagerRegisterFontsWithAssetNames

uint64_t __CTFontManagerRegisterFontsWithAssetNames_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48))
  {
    v6 = TransformErrorsWithURLKeyIntoKey(a2, (uint64_t)CFSTR("CTFontManagerErrorFontAssetNameKey"), *(void **)(a1 + 32));
    if (v6)
      v7 = v6;
    else
      v7 = a2;
    (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v7, a3);
  }
  if ((_DWORD)a3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = *(void **)(a1 + 40);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), 0);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
  }
  return 1;
}

@end
