@implementation AceObject(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *context;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (v6)
  {
    if ((a3 & 1) != 0)
    {
      v27 = (void *)MEMORY[0x1A1AC0A74]();
      objc_msgSend(a1, "dictionary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 0, v7);

      objc_autoreleasePoolPop(v27);
    }
    else
    {
      (*((void (**)(id, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
      objc_msgSend(a1, "groupIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 1, v7);

      objc_msgSend(a1, "encodedClassName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 1, v7);

      ((void (**)(_QWORD, void *, uint64_t))v7)[2](v7, &AFSecurityDigestibleChunksProviderAceId, 4);
      objc_msgSend(a1, "aceId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 1, v7);

      ((void (**)(_QWORD, const char *, uint64_t))v7)[2](v7, "!FER", 4);
      objc_msgSend(a1, "refId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 1, v7);

      v30 = v7;
      v12 = ((uint64_t (*)(_QWORD, void *, uint64_t))v7[2])(v7, &AFSecurityDigestibleChunksProviderData, 4);
      context = (void *)MEMORY[0x1A1AC0A74](v12);
      objc_msgSend(a1, "dictionary");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v33;
        v19 = *MEMORY[0x1E0D87F28];
        v20 = *MEMORY[0x1E0D87F20];
        v21 = *MEMORY[0x1E0D87F30];
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v33 != v18)
              objc_enumerationMutation(v15);
            v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v22);
            v24 = (void *)MEMORY[0x1A1AC0A74]();
            if ((objc_msgSend(v23, "isEqualToString:", v19) & 1) == 0
              && (objc_msgSend(v23, "isEqualToString:", v20) & 1) == 0
              && (objc_msgSend(v23, "isEqualToString:", CFSTR("aceId")) & 1) == 0
              && (objc_msgSend(v23, "isEqualToString:", v21) & 1) == 0)
            {
              v25 = v21;
              objc_msgSend(v31, "objectForKey:", v23);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v23, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 0, v30);
                objc_msgSend(v26, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 0, v30);
              }

              v21 = v25;
            }
            objc_autoreleasePoolPop(v24);
            ++v22;
          }
          while (v17 != v22);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v17);
      }

      objc_autoreleasePoolPop(context);
      v7 = v30;
      ((void (**)(_QWORD, void *, uint64_t))v30)[2](v30, &AFSecurityDigestibleChunksProviderEnd, 4);
    }
  }

}

@end
