@implementation NSArray(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  char v20[16];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (v6)
  {
    if ((a3 & 1) == 0)
    {
      (*((void (**)(id, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
      strcpy(v20, "{NSArray=#}");
      ((void (**)(_QWORD, char *, uint64_t))v7)[2](v7, v20, 12);
      v6 = (id)((uint64_t (*)(_QWORD, void *, uint64_t))v7[2])(v7, &AFSecurityDigestibleChunksProviderData, 4);
    }
    v8 = (void *)MEMORY[0x1A1AC0A74](v6);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = a1;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 0, v7, (_QWORD)v15);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    objc_autoreleasePoolPop(v8);
    if ((a3 & 1) == 0)
      ((void (**)(_QWORD, void *, uint64_t))v7)[2](v7, &AFSecurityDigestibleChunksProviderEnd, 4);
  }

}

@end
