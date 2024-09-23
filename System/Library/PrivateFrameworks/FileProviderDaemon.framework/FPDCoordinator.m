@implementation FPDCoordinator

- (FPDCoordinator)initWithExtensionManager:(id)a3 callbackQueue:(id)a4
{
  id v6;
  id v7;
  FPDCoordinator *v8;
  uint64_t v9;
  NSFileCoordinator *fileCoordinator;
  uint64_t v11;
  NSOperationQueue *coordinationQueue;
  uint64_t v13;
  NSMutableSet *currentlyAccessedURLs;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FPDCoordinator;
  v8 = -[FPDCoordinator init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_opt_new();
    fileCoordinator = v8->_fileCoordinator;
    v8->_fileCoordinator = (NSFileCoordinator *)v9;

    objc_storeStrong((id *)&v8->_callbackQueue, a4);
    v11 = objc_opt_new();
    coordinationQueue = v8->_coordinationQueue;
    v8->_coordinationQueue = (NSOperationQueue *)v11;

    -[NSOperationQueue setUnderlyingQueue:](v8->_coordinationQueue, "setUnderlyingQueue:", v7);
    objc_storeWeak((id *)&v8->_extensionManager, v6);
    v13 = objc_opt_new();
    currentlyAccessedURLs = v8->_currentlyAccessedURLs;
    v8->_currentlyAccessedURLs = (NSMutableSet *)v13;

  }
  return v8;
}

- (void)cancel
{
  -[NSFileCoordinator cancel](self->_fileCoordinator, "cancel");
}

- (void)dealloc
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CF55F000, log, OS_LOG_TYPE_ERROR, "[ERROR] someone forgot to call -stopAccessingAllURLs", v1, 2u);
}

- (void)startAccessingURLForAtomDuration:(id)a3
{
  NSMutableSet *v4;
  id v5;

  v5 = a3;
  v4 = self->_currentlyAccessedURLs;
  objc_sync_enter(v4);
  if ((-[NSMutableSet containsObject:](self->_currentlyAccessedURLs, "containsObject:", v5) & 1) == 0
    && objc_msgSend(v5, "startAccessingSecurityScopedResource"))
  {
    -[NSMutableSet addObject:](self->_currentlyAccessedURLs, "addObject:", v5);
  }
  objc_sync_exit(v4);

}

- (void)stopAccessingURL:(id)a3
{
  NSMutableSet *v4;
  id v5;

  v5 = a3;
  v4 = self->_currentlyAccessedURLs;
  objc_sync_enter(v4);
  objc_msgSend(v5, "stopAccessingSecurityScopedResource");
  -[NSMutableSet removeObject:](self->_currentlyAccessedURLs, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)stopAccessingAllURLs
{
  NSMutableSet *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = self->_currentlyAccessedURLs;
  objc_sync_enter(v3);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_currentlyAccessedURLs;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "stopAccessingSecurityScopedResource", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_currentlyAccessedURLs, "removeAllObjects");
  objc_sync_exit(v3);

}

- (void)resolveItem:(id)a3 recursively:(BOOL)a4 request:(id)a5 andCoordinateWithHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__FPDCoordinator_resolveItem_recursively_request_andCoordinateWithHandler___block_invoke;
  v14[3] = &unk_1E8C76C38;
  v15 = v10;
  v16 = v11;
  v17 = a4;
  v14[4] = self;
  v12 = v10;
  v13 = v11;
  -[FPDCoordinator resolveItem:completion:](self, "resolveItem:completion:", a3, v14);

}

void __75__FPDCoordinator_resolveItem_recursively_request_andCoordinateWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = *(_QWORD **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v6, "coordinateAtURL:recursively:request:handler:", a2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v7 = v6[4];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75__FPDCoordinator_resolveItem_recursively_request_andCoordinateWithHandler___block_invoke_2;
    v8[3] = &unk_1E8C76C10;
    v10 = *(id *)(a1 + 48);
    v9 = v5;
    dispatch_async(v7, v8);

  }
}

uint64_t __75__FPDCoordinator_resolveItem_recursively_request_andCoordinateWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), &__block_literal_global_11);
}

- (void)resolveItem:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  void (**v19)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v6, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDCoordinator startAccessingURLForAtomDuration:](self, "startAccessingURLForAtomDuration:", v9);

    objc_msgSend(v6, "fileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10, 0);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_extensionManager);
    objc_msgSend(v6, "itemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "domainFromItemID:reason:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "defaultBackend");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __41__FPDCoordinator_resolveItem_completion___block_invoke;
    v17[3] = &unk_1E8C76C88;
    v17[4] = self;
    v18 = v6;
    v19 = v7;
    objc_msgSend(v14, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:forBookmarkResolution:request:completionHandler:", v15, 1, 1, 0, v16, v17);

  }
}

void __41__FPDCoordinator_resolveItem_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__FPDCoordinator_resolveItem_completion___block_invoke_2;
  block[3] = &unk_1E8C76C60;
  v14 = v5;
  v15 = v7;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v16 = v6;
  v17 = v10;
  v18 = v9;
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, block);

}

void __41__FPDCoordinator_resolveItem_completion___block_invoke_2(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  id v4;

  v2 = (id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __41__FPDCoordinator_resolveItem_completion___block_invoke_2_cold_1(a1, v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "url");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "startAccessingURLForAtomDuration:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

- (void)resolveItemOrURL:(id)a3 recursively:(BOOL)a4 request:(id)a5 andCoordinateWithHandler:(id)a6
{
  -[FPDCoordinator resolveItemOrURL:recursively:coordinateIfExport:request:handler:](self, "resolveItemOrURL:recursively:coordinateIfExport:request:handler:", a3, a4, 1, a5, a6);
}

- (void)resolveItemOrURL:(id)a3 recursively:(BOOL)a4 coordinateIfExport:(BOOL)a5 request:(id)a6 handler:(id)a7
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v12;
  void (**v13)(id, void *, _QWORD, void *);
  void *v14;
  void *v15;
  id v16;

  v9 = a5;
  v10 = a4;
  v16 = a3;
  v12 = a6;
  v13 = (void (**)(id, void *, _QWORD, void *))a7;
  if (objc_msgSend(v16, "isProviderItem"))
  {
    objc_msgSend(v16, "asFPItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDCoordinator resolveItem:recursively:request:andCoordinateWithHandler:](self, "resolveItem:recursively:request:andCoordinateWithHandler:", v14, v10, v12, v13);
  }
  else
  {
    objc_msgSend(v16, "asURL");
    if (v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDCoordinator startAccessingURLForAtomDuration:](self, "startAccessingURLForAtomDuration:", v14);
      objc_msgSend(v16, "asURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDCoordinator coordinateAtURL:recursively:request:handler:](self, "coordinateAtURL:recursively:request:handler:", v15, v10, v12, v13);

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v14, 0, &__block_literal_global_8_0);
    }
  }

}

- (void)coordinateAtURL:(id)a3 recursively:(BOOL)a4 request:(id)a5 handler:(id)a6
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSFileCoordinator *fileCoordinator;
  void *v19;
  NSOperationQueue *coordinationQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  FPDCoordinator *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[2];

  v8 = a4;
  v32[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDCoordinator.m"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  if (v8)
    v14 = 2;
  else
    v14 = 1;
  -[FPDCoordinator _readingIntentWithURL:materializeOption:](self, "_readingIntentWithURL:materializeOption:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[FPDCoordinator coordinateAtURL:recursively:request:handler:].cold.1(v8, (uint64_t)v11, v16);

  objc_msgSend(MEMORY[0x1E0CB3600], "_nextClaimIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  registerClaim(v17, v12);
  fileCoordinator = self->_fileCoordinator;
  v32[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  coordinationQueue = self->_coordinationQueue;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke;
  v26[3] = &unk_1E8C76CD0;
  v27 = v17;
  v28 = self;
  v29 = v15;
  v30 = v11;
  v31 = v13;
  v21 = v13;
  v22 = v11;
  v23 = v15;
  v24 = v17;
  -[NSFileCoordinator coordinateAccessWithIntents:queue:byAccessor:](fileCoordinator, "coordinateAccessWithIntents:queue:byAccessor:", v19, coordinationQueue, v26);

}

void __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;

  v3 = a2;
  unregisterClaim(*(void **)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "retainAccess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke_2;
  v12[3] = &unk_1E8C75240;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 40);
  v13 = v5;
  v14 = v6;
  v7 = v4;
  v15 = v7;
  v8 = (void *)MEMORY[0x1D17D1C84](v12);
  if (v3)
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke_cold_1(a1, v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 48), "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, void *))(v10 + 16))(v10, v11, 0, v8);

  }
}

uint64_t __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke_2_cold_1(a1, v2);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "releaseAccess:", *(_QWORD *)(a1 + 48));
}

- (void)coordinateForCopyingFromURL:(id)a3 toURL:(id)a4 request:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSFileCoordinator *fileCoordinator;
  void *v18;
  NSOperationQueue *coordinationQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  FPDCoordinator *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  -[FPDCoordinator _readingIntentWithURL:materializeOption:](self, "_readingIntentWithURL:materializeOption:", v10, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35F8], "writingIntentWithURL:options:", v11, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3600], "_nextClaimIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  registerClaim(v16, v13);

  fileCoordinator = self->_fileCoordinator;
  v34[0] = v14;
  v34[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  coordinationQueue = self->_coordinationQueue;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __68__FPDCoordinator_coordinateForCopyingFromURL_toURL_request_handler___block_invoke;
  v26[3] = &unk_1E8C76D18;
  v27 = v16;
  v28 = self;
  v29 = v10;
  v30 = v11;
  v32 = v15;
  v33 = v12;
  v31 = v14;
  v20 = v15;
  v21 = v14;
  v22 = v12;
  v23 = v11;
  v24 = v10;
  v25 = v16;
  -[NSFileCoordinator coordinateAccessWithIntents:queue:byAccessor:](fileCoordinator, "coordinateAccessWithIntents:queue:byAccessor:", v18, coordinationQueue, v26);

}

void __68__FPDCoordinator_coordinateForCopyingFromURL_toURL_request_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  id v16;

  v3 = a2;
  unregisterClaim(*(void **)(a1 + 32));
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__FPDCoordinator_coordinateForCopyingFromURL_toURL_request_handler___block_invoke_cold_1(a1, v3);

    v5 = &__block_literal_global_22;
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "retainAccess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __68__FPDCoordinator_coordinateForCopyingFromURL_toURL_request_handler___block_invoke_3;
    v14 = &unk_1E8C75850;
    v15 = *(_QWORD *)(a1 + 40);
    v16 = v6;
    v7 = v6;
    v5 = (void *)MEMORY[0x1D17D1C84](&v11);

    v8 = *(_QWORD *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 64), "URL", v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD, void *))(v8 + 16))(v8, v9, v10, 0, v5);

  }
}

uint64_t __68__FPDCoordinator_coordinateForCopyingFromURL_toURL_request_handler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "releaseAccess:", *(_QWORD *)(a1 + 40));
}

- (id)_readingIntentWithURL:(id)a3 materializeOption:(unint64_t)a4
{
  uint64_t v4;

  if (!a4)
    return 0;
  if (a4 == 2)
    v4 = 131073;
  else
    v4 = 1;
  objc_msgSend(MEMORY[0x1E0CB35F8], "readingIntentWithURL:options:", a3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)coordinateForMovingFromURL:(id)a3 toURL:(id)a4 toTargetFolderURL:(id)a5 targetMaterializeOption:(unint64_t)a6 sourceMaterializeOption:(unint64_t)a7 request:(id)a8 handler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSFileCoordinator *fileCoordinator;
  NSOperationQueue *coordinationQueue;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v38 = a9;
  v17 = a8;
  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB35F8], "writingIntentWithURL:options:", v14, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v19);
  objc_msgSend(MEMORY[0x1E0CB35F8], "writingIntentWithURL:options:", v15, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v20);
  v21 = a6;
  -[FPDCoordinator _readingIntentWithURL:materializeOption:](self, "_readingIntentWithURL:materializeOption:", v16, a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v18, "addObject:", v22);
  v39 = v18;
  fp_current_or_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v50 = v14;
    v51 = 2112;
    v52 = v16;
    v53 = 2112;
    v54 = v37;
    v55 = 2112;
    v56 = v34;
    v57 = 2048;
    v58 = objc_msgSend(v39, "count");
    _os_log_debug_impl(&dword_1CF55F000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Request to coordinateForMoving %@ to %@; sourceMaterializeOption %@ targetMaterializeOption %@. Intents (%lu)",
      buf,
      0x34u);

  }
  objc_msgSend(MEMORY[0x1E0CB3600], "_nextClaimIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  registerClaim(v24, v17);

  fileCoordinator = self->_fileCoordinator;
  coordinationQueue = self->_coordinationQueue;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __133__FPDCoordinator_coordinateForMovingFromURL_toURL_toTargetFolderURL_targetMaterializeOption_sourceMaterializeOption_request_handler___block_invoke;
  v40[3] = &unk_1E8C76D40;
  v41 = v24;
  v42 = v14;
  v43 = v15;
  v44 = v16;
  v45 = v19;
  v46 = v20;
  v47 = v22;
  v48 = v38;
  v36 = v22;
  v27 = v20;
  v28 = v19;
  v29 = v38;
  v30 = v16;
  v31 = v15;
  v32 = v14;
  v33 = v24;
  -[NSFileCoordinator coordinateAccessWithIntents:queue:byAccessor:](fileCoordinator, "coordinateAccessWithIntents:queue:byAccessor:", v39, coordinationQueue, v40);

}

void __133__FPDCoordinator_coordinateForMovingFromURL_toURL_toTargetFolderURL_targetMaterializeOption_sourceMaterializeOption_request_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  unregisterClaim(*(void **)(a1 + 32));
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __133__FPDCoordinator_coordinateForMovingFromURL_toURL_toTargetFolderURL_targetMaterializeOption_sourceMaterializeOption_request_handler___block_invoke_cold_1((_QWORD *)a1, v3, v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 88);
    objc_msgSend(*(id *)(a1 + 64), "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 80), "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *, _QWORD))(v5 + 16))(v5, v6, v7, v8, 0);

  }
}

- (void)coordinateForMovingFromURL:(id)a3 toURL:(id)a4 request:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSFileCoordinator *fileCoordinator;
  void *v19;
  NSOperationQueue *coordinationQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0CB35F8];
  v14 = a5;
  objc_msgSend(v13, "writingIntentWithURL:options:", v10, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35F8], "writingIntentWithURL:options:", v11, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3600], "_nextClaimIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  registerClaim(v17, v14);

  fileCoordinator = self->_fileCoordinator;
  v34[0] = v15;
  v34[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  coordinationQueue = self->_coordinationQueue;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __67__FPDCoordinator_coordinateForMovingFromURL_toURL_request_handler___block_invoke;
  v27[3] = &unk_1E8C76D68;
  v28 = v17;
  v29 = v10;
  v30 = v11;
  v31 = v15;
  v32 = v16;
  v33 = v12;
  v21 = v16;
  v22 = v15;
  v23 = v12;
  v24 = v11;
  v25 = v10;
  v26 = v17;
  -[NSFileCoordinator coordinateAccessWithIntents:queue:byAccessor:](fileCoordinator, "coordinateAccessWithIntents:queue:byAccessor:", v19, coordinationQueue, v27);

}

void __67__FPDCoordinator_coordinateForMovingFromURL_toURL_request_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  unregisterClaim(*(void **)(a1 + 32));
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__FPDCoordinator_coordinateForMovingFromURL_toURL_request_handler___block_invoke_cold_1(a1, v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 56), "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD))(v5 + 16))(v5, v6, v7, 0);

  }
}

+ (id)requestForClaimID:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (initRequestDictionary_onceToken != -1)
    dispatch_once(&initRequestDictionary_onceToken, &__block_literal_global_65);
  v4 = (id)requestPerClaimID;
  objc_sync_enter(v4);
  objc_msgSend((id)requestPerClaimID, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  return v5;
}

- (FPDExtensionManager)extensionManager
{
  return (FPDExtensionManager *)objc_loadWeakRetained((id *)&self->_extensionManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionManager);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_coordinationQueue, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
  objc_storeStrong((id *)&self->_currentlyAccessedURLs, 0);
}

void __41__FPDCoordinator_resolveItem_completion___block_invoke_2_cold_1(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a2, "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v3, v4, "[ERROR] couldn't resolve item to URL, item: %@; %@",
    v5,
    v6,
    v7,
    v8,
    v9);

  OUTLINED_FUNCTION_2();
}

- (void)coordinateAtURL:(os_log_t)log recursively:request:handler:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("yes");
  if ((a1 & 1) == 0)
    v3 = CFSTR("no");
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1CF55F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDCoordinator, going to materialize recursively ? %@ readURL %@", (uint8_t *)&v4, 0x16u);
}

void __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(*(id *)(a1 + 56), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v5, v6, "[ERROR] couldn't coordinate at %@: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __62__FPDCoordinator_coordinateAtURL_recursively_request_handler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDCoordinator: Releasing file coordinator for intent %@", (uint8_t *)&v3, 0xCu);
}

void __68__FPDCoordinator_coordinateForCopyingFromURL_toURL_request_handler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_6(&dword_1CF55F000, v3, v4, "[ERROR] couldn't coordinate at %@ -> %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4_2();
}

void __133__FPDCoordinator_coordinateForMovingFromURL_toURL_toTargetFolderURL_targetMaterializeOption_sourceMaterializeOption_request_handler___block_invoke_cold_1(_QWORD *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  objc_msgSend(a2, "fp_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138413058;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  v12 = 2112;
  v13 = v6;
  v14 = 2112;
  v15 = v7;
  _os_log_error_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_ERROR, "[ERROR] couldn't coordinate at %@ / %@ / %@: %@", (uint8_t *)&v8, 0x2Au);

}

void __67__FPDCoordinator_coordinateForMovingFromURL_toURL_request_handler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_6(&dword_1CF55F000, v3, v4, "[ERROR] couldn't coordinate at %@ / %@ : %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4_2();
}

@end
