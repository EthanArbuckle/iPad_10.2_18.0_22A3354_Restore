@implementation SFBrowserASCLockupViewGenerator

+ (SFBrowserASCLockupViewGenerator)sharedGenerator
{
  if (sharedGenerator_onceToken != -1)
    dispatch_once(&sharedGenerator_onceToken, &__block_literal_global_69);
  return (SFBrowserASCLockupViewGenerator *)(id)sharedGenerator_sharedGenerator;
}

void __50__SFBrowserASCLockupViewGenerator_sharedGenerator__block_invoke()
{
  SFBrowserASCLockupViewGenerator *v0;
  void *v1;

  v0 = objc_alloc_init(SFBrowserASCLockupViewGenerator);
  v1 = (void *)sharedGenerator_sharedGenerator;
  sharedGenerator_sharedGenerator = (uint64_t)v0;

}

+ (id)lockupViewGroup
{
  if (lockupViewGroup_onceToken != -1)
    dispatch_once(&lockupViewGroup_onceToken, &__block_literal_global_1_0);
  return (id)lockupViewGroup_group;
}

void __50__SFBrowserASCLockupViewGenerator_lockupViewGroup__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF9BD0]), "initWithName:", CFSTR("BrowserLockups"));
  v1 = (void *)lockupViewGroup_group;
  lockupViewGroup_group = v0;

}

- (void)generateLockupViewsWithDelegate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSTimer *v13;
  NSTimer *requestTimeout;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  SFBrowserASCLockupViewGenerator *v22;
  id v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!AppStoreComponentsLibraryCore_frameworkLibrary_0)
  {
    v24 = xmmword_1E4AC7938;
    v25 = 0;
    AppStoreComponentsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (AppStoreComponentsLibraryCore_frameworkLibrary_0 && getASCLockupContextWebBrowserSymbolLoc())
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSTimer invalidate](self->_requestTimeout, "invalidate");
    v9 = (void *)MEMORY[0x1E0C99E88];
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __85__SFBrowserASCLockupViewGenerator_generateLockupViewsWithDelegate_completionHandler___block_invoke;
    v20[3] = &unk_1E4AC78F0;
    v11 = v8;
    v21 = v11;
    v12 = v7;
    v22 = self;
    v23 = v12;
    objc_msgSend(v9, "scheduledTimerWithTimeInterval:repeats:block:", 0, v20, 15.0);
    v13 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    requestTimeout = self->_requestTimeout;
    self->_requestTimeout = v13;

    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __85__SFBrowserASCLockupViewGenerator_generateLockupViewsWithDelegate_completionHandler___block_invoke_2;
    block[3] = &unk_1E4AC48B0;
    block[4] = self;
    v17 = v6;
    v18 = v11;
    v19 = v12;
    v15 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __85__SFBrowserASCLockupViewGenerator_generateLockupViewsWithDelegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

void __85__SFBrowserASCLockupViewGenerator_generateLockupViewsWithDelegate_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  id *v3;
  void *v4;
  id v5;
  _QWORD *ASCLockupContextWebBrowserSymbolLoc;
  void *v7;
  void *v8;
  void *v9;
  _Unwind_Exception *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = objc_alloc(MEMORY[0x1E0CF9BA0]);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v3 = (id *)getASCCollectionIDWebBrowsersSymbolLoc_ptr;
  v18 = getASCCollectionIDWebBrowsersSymbolLoc_ptr;
  if (!getASCCollectionIDWebBrowsersSymbolLoc_ptr)
  {
    v4 = (void *)AppStoreComponentsLibrary_0();
    v3 = (id *)dlsym(v4, "ASCCollectionIDWebBrowsers");
    v16[3] = (uint64_t)v3;
    getASCCollectionIDWebBrowsersSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v15, 8);
  if (!v3)
  {
    -[SFDefaultBrowserListView productDetailsUserDidInteractWithApp:interactionType:].cold.1();
LABEL_7:
    v10 = (_Unwind_Exception *)-[SFDefaultBrowserListView productDetailsUserDidInteractWithApp:interactionType:].cold.1();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v10);
  }
  v5 = *v3;
  ASCLockupContextWebBrowserSymbolLoc = getASCLockupContextWebBrowserSymbolLoc();
  if (!ASCLockupContextWebBrowserSymbolLoc)
    goto LABEL_7;
  v7 = (void *)objc_msgSend(v2, "initWithID:kind:context:limit:", v5, *MEMORY[0x1E0CF9B38], *ASCLockupContextWebBrowserSymbolLoc, 20);

  objc_msgSend((id)objc_opt_class(), "lockupViewGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__SFBrowserASCLockupViewGenerator_generateLockupViewsWithDelegate_completionHandler___block_invoke_3;
  v11[3] = &unk_1E4AC7918;
  v9 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v8, "_cacheLockupsWithCollectionRequest:withCompletionBlock:", v7, v11);

}

void __85__SFBrowserASCLockupViewGenerator_generateLockupViewsWithDelegate_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (*v22)(void);
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

  if (v3 && objc_msgSend(v3, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      v10 = *MEMORY[0x1E0C9D648];
      v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v16 = objc_alloc(MEMORY[0x1E0CF9BC8]);
          v17 = (void *)objc_msgSend(v16, "initWithFrame:", v10, v11, v12, v13, (_QWORD)v23);
          objc_msgSend(v17, "setDelegate:", *(_QWORD *)(a1 + 40));
          objc_msgSend((id)objc_opt_class(), "lockupViewGroup");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setGroup:", v18);

          v19 = (void *)objc_msgSend(v15, "copy");
          objc_msgSend(v17, "setRequest:", v19);

          objc_msgSend(v17, "setShowsPlaceholderContent:", 1);
          objc_msgSend(v17, "lockup");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lockupWithOffer:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setLockup:", v21);

          objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

    v22 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    v22 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v22();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTimeout, 0);
}

@end
