@implementation FPFetchServiceEndpointCreatorByNameForItemAtURL

void __FPFetchServiceEndpointCreatorByNameForItemAtURL_block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __FPFetchServiceEndpointCreatorByNameForItemAtURL_block_invoke_2;
  v4[3] = &unk_1E444F8C0;
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  if (v3)
    FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously(v2, v4);
  else
    FPFileProviderServiceEndpointCreatingForItemAtURL(v2, v4);

}

void __FPFetchServiceEndpointCreatorByNameForItemAtURL_block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16), "isEqualToString:", *(_QWORD *)(a1 + 32), (_QWORD)v18))
          {
            (*(void (**)(_QWORD, id, void (**)(_QWORD), _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v9, v11, 0);
            goto LABEL_13;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v14)
          continue;
        break;
      }
    }

    v11[2](v11);
    v17 = *(_QWORD *)(a1 + 40);
    FPNotSupportedError();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v17 + 16))(v17, 0, 0, v12);
LABEL_13:

  }
}

void __FPFetchServiceEndpointCreatorByNameForItemAtURL_block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  unint64_t v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7 | v9)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2_cold_1();
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2_cold_2(a1);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "callNextOverrides");
  }

}

@end
