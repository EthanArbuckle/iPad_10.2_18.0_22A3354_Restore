@implementation FPFetchThumbnailsOperation

- (FPFetchThumbnailsOperation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPFetchThumbnailsOperation.m"), 282, CFSTR("UNREACHABLE: Use FPItemManager to create %@."), objc_opt_class());

  return 0;
}

- (FPFetchThumbnailsOperation)initWithItems:(id)a3 desiredSize:(CGSize)a4 screenScale:(double)a5 itemManager:(id)a6
{
  double height;
  double width;
  id v12;
  id v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  FPFetchThumbnailsOperation *v18;
  uint64_t v19;
  NSMutableDictionary *dictionary;
  NSMutableArray *v21;
  NSMutableArray *appLibraryItems;
  NSMutableArray *v23;
  NSMutableArray *placeHoldersItems;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  NSMutableArray *v31;
  void *v32;
  id v33;
  void *v34;
  NSMutableDictionary *v35;
  void *v36;
  NSOperationQueue *v37;
  NSOperationQueue *subOperationQueue;
  FPFetchThumbnailsOperation *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  uint64_t v51;
  NSSize v52;

  height = a4.height;
  width = a4.width;
  v51 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = objc_msgSend(v12, "count");
  if (!v13
    || (a5 >= 1.0 ? (v15 = v14 == 0) : (v15 = 1),
        !v15 ? (v16 = width < 1.0) : (v16 = 1),
        !v16 ? (v17 = height < 1.0) : (v17 = 1),
        v17))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_opt_class();
    v52.width = width;
    v52.height = height;
    NSStringFromSize(v52);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPFetchThumbnailsOperation.m"), 298, CFSTR("invalid parameter to initialize %@ (items:%@, desiredSize:%@, screenScale:%f, itemManager:%@)"), v41, v12, v42, *(_QWORD *)&a5, v13);

    v39 = 0;
    goto LABEL_30;
  }
  v49.receiver = self;
  v49.super_class = (Class)FPFetchThumbnailsOperation;
  v18 = -[FPOperation init](&v49, sel_init);
  if (!v18)
    goto LABEL_28;
  v44 = v13;
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v12, "count"));
  dictionary = v18->_dictionary;
  v18->_dictionary = (NSMutableDictionary *)v19;

  v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  appLibraryItems = v18->_appLibraryItems;
  v18->_appLibraryItems = v21;

  v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  placeHoldersItems = v18->_placeHoldersItems;
  v18->_placeHoldersItems = v23;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v25 = v12;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (!v26)
    goto LABEL_27;
  v27 = v26;
  v28 = *(_QWORD *)v46;
  do
  {
    for (i = 0; i != v27; ++i)
    {
      if (*(_QWORD *)v46 != v28)
        objc_enumerationMutation(v25);
      v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      if (objc_msgSend(v30, "isPlaceholder"))
      {
        v31 = v18->_placeHoldersItems;
LABEL_23:
        -[NSMutableArray addObject:](v31, "addObject:", v30);
        continue;
      }
      +[FPAppRegistry sharedRegistry](FPAppRegistry, "sharedRegistry");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (id)objc_msgSend(v32, "promoteItemToAppLibraryIfNeeded:", v30);

      if (objc_msgSend(v30, "isContainer"))
      {
        objc_msgSend(v30, "fp_appContainerBundleIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          v31 = v18->_appLibraryItems;
          goto LABEL_23;
        }
      }
      v35 = v18->_dictionary;
      objc_msgSend(v30, "itemID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], v36);

    }
    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  }
  while (v27);
LABEL_27:

  v18->_desiredSize.width = width;
  v18->_desiredSize.height = height;
  v18->_screenScale = a5;
  objc_storeStrong((id *)&v18->_itemManager, a6);
  v37 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
  subOperationQueue = v18->_subOperationQueue;
  v18->_subOperationQueue = v37;

  -[NSOperationQueue setName:](v18->_subOperationQueue, "setName:", CFSTR("com.apple.FileProvider.FetchThumbnailsOperation"));
  -[NSOperationQueue setMaxConcurrentOperationCount:](v18->_subOperationQueue, "setMaxConcurrentOperationCount:", 2);
  v13 = v44;
LABEL_28:
  self = v18;
  v39 = self;
LABEL_30:

  return v39;
}

- (FPFetchThumbnailsOperation)initWithItem:(id)a3 versions:(id)a4 desiredSize:(CGSize)a5 screenScale:(double)a6 itemManager:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  FPFetchThumbnailsOperation *v18;
  NSMutableDictionary *dictionary;
  void *v20;
  id v22;
  uint64_t v23;

  height = a5.height;
  width = a5.width;
  v23 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v22 = v13;
  v15 = (void *)MEMORY[0x1E0C99D20];
  v16 = a7;
  objc_msgSend(v15, "arrayWithObjects:count:", &v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[FPFetchThumbnailsOperation initWithItems:desiredSize:screenScale:itemManager:](self, "initWithItems:desiredSize:screenScale:itemManager:", v17, v16, width, height, a6, v22, v23);

  if (v18)
  {
    dictionary = v18->_dictionary;
    objc_msgSend(v13, "itemID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](dictionary, "setObject:forKeyedSubscript:", v14, v20);

  }
  return v18;
}

- (void)main
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *subOperations;
  double width;
  FPFetchAppLibraryIconsOperation *v16;
  FPFetchAppLibraryIconsOperation *v17;
  FPFetchRegularItemThumbnailsOperation *v18;
  FPFetchRegularItemThumbnailsOperation *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[6];
  _QWORD v37[6];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  __int128 buf;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v4 = self->_placeHoldersItems;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        fp_current_or_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v8;
          _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring request for %@ because it's a placeholder", (uint8_t *)&buf, 0xCu);
        }

        objc_msgSend(v8, "itemID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPFetchThumbnailsOperation _perItemCompletionBlockFor:version:thumbnailURL:thumbnailData:contentType:metadata:error:](self, "_perItemCompletionBlockFor:version:thumbnailURL:thumbnailData:contentType:metadata:error:", v11, 0, 0, 0, 0, 0, 0);

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v5);
  }

  if (self->_subOperations)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPFetchThumbnailsOperation.m"), 366, CFSTR("no sub operations should have been crated before this point"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  subOperations = self->_subOperations;
  self->_subOperations = v13;

  if (-[NSMutableArray count](self->_appLibraryItems, "count"))
  {
    if (self->_desiredSize.width >= self->_desiredSize.height)
      width = self->_desiredSize.width;
    else
      width = self->_desiredSize.height;
    v16 = -[FPFetchAppLibraryIconsOperation initWithAppLibraryItems:desiredSize:screenScale:]([FPFetchAppLibraryIconsOperation alloc], "initWithAppLibraryItems:desiredSize:screenScale:", self->_appLibraryItems, width, width, self->_screenScale);
    v17 = v16;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("can't fetch app-library icons for %@"), self->_appLibraryItems);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v28);

      return;
    }
    -[FPFetchAppLibraryIconsOperation setDelegate:](v16, "setDelegate:", self);
    -[NSMutableArray addObject:](self->_subOperations, "addObject:", v17);

  }
  if (-[NSMutableDictionary count](self->_dictionary, "count"))
  {
    v18 = -[FPFetchRegularItemThumbnailsOperation initWithDictionary:desiredSizeToScale:itemManager:]([FPFetchRegularItemThumbnailsOperation alloc], "initWithDictionary:desiredSizeToScale:itemManager:", self->_dictionary, self->_itemManager, self->_desiredSize.width * self->_screenScale, self->_screenScale * self->_desiredSize.height);
    v19 = v18;
    if (!v18)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      -[NSMutableDictionary allKeys](self->_dictionary, "allKeys");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fp_invalidArgumentError:", CFSTR("can't fetch thumbnails for %@"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      -[FPOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v31);
      return;
    }
    -[FPFetchRegularItemThumbnailsOperation setDelegate:](v18, "setDelegate:", self);
    -[NSMutableArray addObject:](self->_subOperations, "addObject:", v19);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__4;
  v46 = __Block_byref_object_dispose__4;
  v47 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __34__FPFetchThumbnailsOperation_main__block_invoke;
  v37[3] = &unk_1E444B8D8;
  v37[4] = self;
  v37[5] = &buf;
  v21 = (void *)MEMORY[0x1A1B00850](v37);
  v36[0] = v20;
  v36[1] = 3221225472;
  v36[2] = __34__FPFetchThumbnailsOperation_main__block_invoke_2;
  v36[3] = &unk_1E444B900;
  v36[4] = self;
  v36[5] = &buf;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v36);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = self->_subOperations;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v27, "setFinishedBlock:", v21);
        objc_msgSend(v22, "addDependency:", v27);
        -[NSOperationQueue addOperation:](self->_subOperationQueue, "addOperation:", v27);
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v24);
  }

  -[NSOperationQueue addOperation:](self->_subOperationQueue, "addOperation:", v22);
  _Block_object_dispose(&buf, 8);

}

void __34__FPFetchThumbnailsOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  if (v5)
  {
    v7 = v5;
    v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    objc_sync_exit(v6);

    v5 = v7;
  }

}

uint64_t __34__FPFetchThumbnailsOperation_main__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)cancel
{
  objc_super v3;

  -[NSMutableArray makeObjectsPerformSelector:](self->_subOperations, "makeObjectsPerformSelector:", sel_cancel);
  v3.receiver = self;
  v3.super_class = (Class)FPFetchThumbnailsOperation;
  -[FPOperation cancel](&v3, sel_cancel);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[FPFetchThumbnailsOperation thumbnailsFetchCompletionBlock](self, "thumbnailsFetchCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    -[FPFetchThumbnailsOperation setThumbnailsFetchCompletionBlock:](self, "setThumbnailsFetchCompletionBlock:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)FPFetchThumbnailsOperation;
  -[FPOperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v7, v6);

}

- (void)operation:(id)a3 didReceiveProgressInfo:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  FPFetchThumbnailsOperation *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;

  v7 = a4;
  v8 = a5;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      fp_current_or_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[FPFetchThumbnailsOperation operation:didReceiveProgressInfo:error:].cold.1((uint64_t)self, v10);
      goto LABEL_42;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        fp_current_or_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[FPFetchThumbnailsOperation operation:didReceiveProgressInfo:error:].cold.7();
        goto LABEL_41;
      }
    }
    if (v8)
    {
      -[FPFetchThumbnailsOperation _perItemCompletionBlockFor:version:thumbnailURL:thumbnailData:contentType:metadata:error:](self, "_perItemCompletionBlockFor:version:thumbnailURL:thumbnailData:contentType:metadata:error:", v9, v10, 0, 0, 0, 0, v8);
LABEL_42:

      goto LABEL_43;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("thumbnailData"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        fp_current_or_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[FPFetchThumbnailsOperation operation:didReceiveProgressInfo:error:].cold.6();
        goto LABEL_40;
      }
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("thumbnailDataURLWrapper"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        fp_current_or_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[FPFetchThumbnailsOperation operation:didReceiveProgressInfo:error:].cold.5();
        goto LABEL_39;
      }
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("contentType"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        fp_current_or_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[FPFetchThumbnailsOperation operation:didReceiveProgressInfo:error:].cold.4();
        goto LABEL_38;
      }
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("thumbnailMetaData"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[FPFetchThumbnailsOperation operation:didReceiveProgressInfo:error:].cold.3();
    }
    else
    {
      if (-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("com.apple.fileprovider.serialized-if-image")))
      {
        v26 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", getIFImageClass(), v11, &v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v26;
        if (v15)
        {
          v23 = v15;
          v16 = objc_opt_new();
          objc_msgSend((id)*MEMORY[0x1E0CEC600], "identifier");
          v24 = v16;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = _CGImageDestinationCreateWithData(v16, (uint64_t)v22);
          if (v17)
          {
            v18 = (const void *)v17;
            _CGImageDestinationAddImage(v17, objc_msgSend(v23, "CGImage"));
            _CGImageDestinationFinalize((uint64_t)v18);
            CFRelease(v18);
          }
          v19 = self;
          v20 = v24;
          -[FPFetchThumbnailsOperation _perItemCompletionBlockFor:version:thumbnailURL:thumbnailData:contentType:metadata:error:](v19, "_perItemCompletionBlockFor:version:thumbnailURL:thumbnailData:contentType:metadata:error:", v9, v10, 0, v24, v22, v14, 0);

          v15 = v23;
        }
        else
        {
          fp_current_or_default_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            -[FPFetchThumbnailsOperation operation:didReceiveProgressInfo:error:].cold.2();
        }

        goto LABEL_38;
      }
      -[NSObject url](v12, "url");
      v21 = objc_claimAutoreleasedReturnValue();
      -[FPFetchThumbnailsOperation _perItemCompletionBlockFor:version:thumbnailURL:thumbnailData:contentType:metadata:error:](self, "_perItemCompletionBlockFor:version:thumbnailURL:thumbnailData:contentType:metadata:error:", v9, v10, v21, v11, v13, v14, 0);
    }

LABEL_38:
LABEL_39:

LABEL_40:
LABEL_41:

    goto LABEL_42;
  }
LABEL_43:

}

- (void)_perItemCompletionBlockFor:(id)a3 version:(id)a4 thumbnailURL:(id)a5 thumbnailData:(id)a6 contentType:(id)a7 metadata:(id)a8 error:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if ((-[FPFetchThumbnailsOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[FPFetchThumbnailsOperation perThumbnailCompletionBlock](self, "perThumbnailCompletionBlock");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {

LABEL_5:
      -[FPOperation callbackQueue](self, "callbackQueue");
      v24 = objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __119__FPFetchThumbnailsOperation__perItemCompletionBlockFor_version_thumbnailURL_thumbnailData_contentType_metadata_error___block_invoke;
      v25[3] = &unk_1E444B928;
      v25[4] = self;
      v26 = v18;
      v27 = v17;
      v28 = v15;
      v29 = v19;
      v30 = v21;
      v31 = v16;
      v32 = v20;
      dispatch_async(v24, v25);

      goto LABEL_6;
    }
    -[FPFetchThumbnailsOperation perThumbnailWithVersionCompletionBlock](self, "perThumbnailWithVersionCompletionBlock");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      goto LABEL_5;
  }
LABEL_6:

}

void __119__FPFetchThumbnailsOperation__perItemCompletionBlockFor_version_thumbnailURL_thumbnailData_contentType_metadata_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "perThumbnailCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(id *)(a1 + 40);
    if (!v3)
    {
      v3 = *(id *)(a1 + 48);
      if (v3)
      {
        v7 = objc_msgSend(v3, "startAccessingSecurityScopedResource");
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", *(_QWORD *)(a1 + 48), 1, 0);
        v3 = (id)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v9 = v3;
          objc_msgSend(*(id *)(a1 + 48), "stopAccessingSecurityScopedResource");
          v3 = v9;
        }
      }
    }
    v8 = v3;
    objc_msgSend(*(id *)(a1 + 32), "perThumbnailCompletionBlock");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id, _QWORD, _QWORD))v4)[2](v4, *(_QWORD *)(a1 + 56), v8, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

    goto LABEL_4;
  }
  objc_msgSend(*(id *)(a1 + 32), "perThumbnailWithVersionCompletionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "perThumbnailWithVersionCompletionBlock");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 72));

    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeItemAtURL:error:", *(_QWORD *)(a1 + 48), 0);
LABEL_4:

    }
  }
}

- (id)perThumbnailCompletionBlock
{
  return self->_perThumbnailCompletionBlock;
}

- (void)setPerThumbnailCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (id)perThumbnailWithVersionCompletionBlock
{
  return self->_perThumbnailWithVersionCompletionBlock;
}

- (void)setPerThumbnailWithVersionCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (id)thumbnailsFetchCompletionBlock
{
  return self->_thumbnailsFetchCompletionBlock;
}

- (void)setThumbnailsFetchCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_thumbnailsFetchCompletionBlock, 0);
  objc_storeStrong(&self->_perThumbnailWithVersionCompletionBlock, 0);
  objc_storeStrong(&self->_perThumbnailCompletionBlock, 0);
  objc_storeStrong((id *)&self->_subOperations, 0);
  objc_storeStrong((id *)&self->_subOperationQueue, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_placeHoldersItems, 0);
  objc_storeStrong((id *)&self->_appLibraryItems, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (void)operation:(uint64_t)a1 didReceiveProgressInfo:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint8_t v4[14];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_7_3();
  v5 = a1;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] <%@:%p>: identifier required to call per item completion block", v4, 0x16u);
  OUTLINED_FUNCTION_6_1();
}

- (void)operation:didReceiveProgressInfo:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_0_7(&dword_1A0A34000, v0, v1, "[DEBUG] <%@:%p>: failed to unarchive IFImage (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_1();
}

- (void)operation:didReceiveProgressInfo:error:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_0_7(&dword_1A0A34000, v0, v1, "[DEBUG] <%@:%p>: thumbnail metadata provided is of an invalid type (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_1();
}

- (void)operation:didReceiveProgressInfo:error:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_0_7(&dword_1A0A34000, v0, v1, "[DEBUG] <%@:%p>: contentType provided is of an invalid type (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_1();
}

- (void)operation:didReceiveProgressInfo:error:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_0_7(&dword_1A0A34000, v0, v1, "[DEBUG] <%@:%p>: thumbnail data url provided is of an invalid type (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_1();
}

- (void)operation:didReceiveProgressInfo:error:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_0_7(&dword_1A0A34000, v0, v1, "[DEBUG] <%@:%p>: thumbnail data provided is of an invalid type (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_1();
}

- (void)operation:didReceiveProgressInfo:error:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_0_7(&dword_1A0A34000, v0, v1, "[DEBUG] <%@:%p>: version provided is of an invalid type (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11_1();
}

@end
