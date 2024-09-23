@implementation FPGetPausedFilesList

void __FPGetPausedFilesList_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v24[0] = CFSTR("NSFileProviderInternalErrorDomain");
    v24[1] = CFSTR("NSFileProviderErrorDomain");
    v7 = *MEMORY[0x1E0CB2FE0];
    v24[2] = *MEMORY[0x1E0CB28A8];
    v24[3] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fp_unwrappedErrorForDomains:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("NSFileProviderInternalErrorDomain")))
    {
      v11 = objc_msgSend(v9, "code");

      if (v11 != 16)
      {
        v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_15:
        v12();

        goto LABEL_16;
      }
    }
    else
    {

    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_15;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v5);
        v17 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "url");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

      }
      v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_16:

}

@end
