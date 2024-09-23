@implementation MXExtension

uint64_t __87___MXExtension_MXExtensionRequestHandling__handleRequest_requestDispatcher_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "disconnectExtension");
}

void __104___MXExtension_ridesharing_willBeDepreicatedSoon__startExtensionServiceWithInputItems_begin_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = v5;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v4 = v5;
  }

}

uint64_t __70___MXExtension_INIntent__resolveIntentSlot_forIntent_completionBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "completeTransactionWithIntentIdentifier:completion:", *(_QWORD *)(a1 + 40), 0);
}

void __75___MXExtension_INIntent__confirmIntent_expectResponseClass_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (_shouldDeserializeCacheItems)
    objc_msgSend(*(id *)(a1 + 32), "_loadCacheItems:", v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "completeTransactionWithIntentIdentifier:completion:", *(_QWORD *)(a1 + 48), 0);

}

void __74___MXExtension_INIntent__handleIntent_expectResponseClass_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (_shouldDeserializeCacheItems)
    objc_msgSend(*(id *)(a1 + 32), "_loadCacheItems:", v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "completeTransactionWithIntentIdentifier:completion:", *(_QWORD *)(a1 + 48), 0);

}

void __42___MXExtension_INIntent___loadCacheItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  double v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v9, "_identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v10)
            goto LABEL_14;
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "scale");
          v13 = v12;

          objc_msgSend(v9, "_imageData");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v17 = (void *)MEMORY[0x1E0CEA638];
            objc_msgSend(v9, "_imageData");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "imageWithData:scale:", v18, v13);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "provider");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v25[0] = MEMORY[0x1E0C809B0];
            v25[1] = 3221225472;
            v25[2] = __42___MXExtension_INIntent___loadCacheItems___block_invoke_2;
            v25[3] = &unk_1E20DF880;
            v26 = v19;
            v21 = v19;
            objc_msgSend(v20, "loadImageForKey:withBlock:", v10, v25);

LABEL_14:
            goto LABEL_15;
          }
          objc_msgSend(MEMORY[0x1E0CBD960], "sharedConnection");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __42___MXExtension_INIntent___loadCacheItems___block_invoke_3;
          v22[3] = &unk_1E20DF8A8;
          v24 = v13;
          v22[4] = *(_QWORD *)(a1 + 32);
          v23 = v10;
          v16 = v10;
          objc_msgSend(v15, "loadImageDataAndSizeForImage:reply:", v9, v22);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_15:

}

id __42___MXExtension_INIntent___loadCacheItems___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __42___MXExtension_INIntent___loadCacheItems___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  if (a3)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(a2, "_imageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithData:scale:", v6, *(double *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42___MXExtension_INIntent___loadCacheItems___block_invoke_4;
  v10[3] = &unk_1E20DF880;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v7, "loadImageForKey:withBlock:", v8, v10);

}

id __42___MXExtension_INIntent___loadCacheItems___block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
