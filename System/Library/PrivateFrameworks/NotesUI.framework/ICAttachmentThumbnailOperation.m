@implementation ICAttachmentThumbnailOperation

- (ICAttachmentThumbnailOperation)initWithAttachment:(id)a3 size:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6 cache:(id)a7 cacheKey:(id)a8 processingBlock:(id)a9 completionBlock:(id)a10 fallbackBlock:(id)a11 queue:(id)a12
{
  double height;
  double width;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  ICAttachmentThumbnailOperation *v29;
  ICAttachmentThumbnailOperation *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  objc_super v41;

  height = a4.height;
  width = a4.width;
  v21 = a3;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a9;
  v26 = a10;
  v27 = a11;
  v28 = a12;
  v41.receiver = self;
  v41.super_class = (Class)ICAttachmentThumbnailOperation;
  v29 = -[ICAttachmentThumbnailOperation init](&v41, sel_init);
  v30 = v29;
  if (v29)
  {
    -[ICAttachmentThumbnailOperation setMinSize:](v29, "setMinSize:", width, height);
    -[ICAttachmentThumbnailOperation setScale:](v30, "setScale:", a5);
    -[ICAttachmentThumbnailOperation setAppearanceInfo:](v30, "setAppearanceInfo:", v22);
    -[ICAttachmentThumbnailOperation setCache:](v30, "setCache:", v23);
    -[ICAttachmentThumbnailOperation setCacheKey:](v30, "setCacheKey:", v24);
    -[ICAttachmentThumbnailOperation setFallbackBlock:](v30, "setFallbackBlock:", v27);
    -[ICAttachmentThumbnailOperation setProcessingBlock:](v30, "setProcessingBlock:", v25);
    v40 = v25;
    v31 = v24;
    v32 = v23;
    v33 = v22;
    v34 = (void *)MEMORY[0x1E0C99DE8];
    v35 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v34, "arrayWithObject:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentThumbnailOperation setCompletionBlocks:](v30, "setCompletionBlocks:", v36);

    v22 = v33;
    v23 = v32;
    v24 = v31;
    v25 = v40;

    -[ICAttachmentThumbnailOperation setQueue:](v30, "setQueue:", v28);
    objc_msgSend(v21, "objectID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentThumbnailOperation setAttachmentID:](v30, "setAttachmentID:", v37);

    objc_msgSend(v21, "note");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
      -[ICAttachmentThumbnailOperation capturePropertiesFromAttachment:](v30, "capturePropertiesFromAttachment:", v21);
  }

  return v30;
}

- (void)capturePropertiesFromAttachment:(id)a3
{
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPreviews");

  if (v5)
  {
    -[ICAttachmentThumbnailOperation minSize](self, "minSize");
    v7 = v6;
    v9 = v8;
    -[ICAttachmentThumbnailOperation scale](self, "scale");
    v11 = v10;
    -[ICAttachmentThumbnailOperation appearanceInfo](self, "appearanceInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:", objc_msgSend(v12, "type"), 1, v7, v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(v13, "newImageLoaderForUpdatingImageOnCompletion:", 1);
    -[ICAttachmentThumbnailOperation setAttachmentPreviewImageLoader:](self, "setAttachmentPreviewImageLoader:", v14);

    -[ICAttachmentThumbnailOperation setImageScaling:](self, "setImageScaling:", objc_msgSend(v13, "scaleWhenDrawing"));
  }
  else
  {
    objc_msgSend(v19, "media");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mediaURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentThumbnailOperation setMediaURL:](self, "setMediaURL:", v16);

    -[ICAttachmentThumbnailOperation setImageScaling:](self, "setImageScaling:", 2);
    -[ICAttachmentThumbnailOperation setShowAsFileIcon:](self, "setShowAsFileIcon:", 1);
  }
  -[ICAttachmentThumbnailOperation attachmentPreviewImageLoader](self, "attachmentPreviewImageLoader");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

LABEL_7:
    -[ICAttachmentThumbnailOperation setIsMovie:](self, "setIsMovie:", objc_msgSend(v19, "attachmentType") == 5);
    goto LABEL_8;
  }
  -[ICAttachmentThumbnailOperation mediaURL](self, "mediaURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    goto LABEL_7;
LABEL_8:
  -[ICAttachmentThumbnailOperation setAttachmentPropertiesCaptured:](self, "setAttachmentPropertiesCaptured:", 1);

}

- (BOOL)isMatchingOperationForCacheKey:(id)a3 cache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  BOOL v11;

  v6 = a4;
  v7 = a3;
  -[ICAttachmentThumbnailOperation cacheKey](self, "cacheKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[ICAttachmentThumbnailOperation cache](self, "cache");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10 == v6;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)addCompletionBlock:(id)a3
{
  id v3;
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  v3 = v4;
  performBlockOnMainThreadAndWait();

}

void __53__ICAttachmentThumbnailOperation_addCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "completionBlocks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v3, "addObject:", v2);

}

- (void)main
{
  BOOL v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  ICAttachmentThumbnailOperation *v22;
  _QWORD v23[4];
  id v24;
  ICAttachmentThumbnailOperation *v25;

  v3 = -[ICAttachmentThumbnailOperation attachmentPropertiesCaptured](self, "attachmentPropertiesCaptured");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "workerManagedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = v4;
    v23[1] = 3221225472;
    v23[2] = __38__ICAttachmentThumbnailOperation_main__block_invoke;
    v23[3] = &unk_1E5C1D9A8;
    v5 = v7;
    v24 = v5;
    v25 = self;
    objc_msgSend(v5, "performBlockAndWait:", v23);

  }
  -[ICAttachmentThumbnailOperation attachmentPreviewImageLoader](self, "attachmentPreviewImageLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canLoadImage");

  if (v9)
  {
    -[ICAttachmentThumbnailOperation attachmentPreviewImageLoader](self, "attachmentPreviewImageLoader");
    v10 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadOrientedImage");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICAttachmentThumbnailOperation mediaURL](self, "mediaURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[ICAttachmentThumbnailOperation requestThumbnail](self, "requestThumbnail");
      goto LABEL_14;
    }
    -[ICAttachmentThumbnailOperation fallbackBlock](self, "fallbackBlock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_14;
    -[ICAttachmentThumbnailOperation fallbackBlock](self, "fallbackBlock");
    v10 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    -[ICAttachmentThumbnailOperation scale](self, "scale");
    v10[2](v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;

  if (v14)
  {
    -[ICAttachmentThumbnailOperation processingBlock](self, "processingBlock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[ICAttachmentThumbnailOperation processingBlock](self, "processingBlock");
      v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, unint64_t, BOOL, BOOL))v16)[2](v16, v14, -[ICAttachmentThumbnailOperation imageScaling](self, "imageScaling"), -[ICAttachmentThumbnailOperation showAsFileIcon](self, "showAsFileIcon"), -[ICAttachmentThumbnailOperation isMovie](self, "isMovie"));
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v17;
    }
  }
  objc_msgSend(v14, "ic_decodeInBackground");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __38__ICAttachmentThumbnailOperation_main__block_invoke_10;
  v20[3] = &unk_1E5C1D9A8;
  v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D63CE8]), "initWithImage:imageScaling:showAsFileIcon:isMovie:", v18, -[ICAttachmentThumbnailOperation imageScaling](self, "imageScaling"), -[ICAttachmentThumbnailOperation showAsFileIcon](self, "showAsFileIcon"), -[ICAttachmentThumbnailOperation isMovie](self, "isMovie"));
  v22 = self;
  v19 = v21;
  dispatch_async(MEMORY[0x1E0C80D38], v20);

LABEL_14:
}

void __38__ICAttachmentThumbnailOperation_main__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  id v8;

  v1 = (id *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "attachmentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v4)
    v6 = 1;
  else
    v6 = v5 == 0;
  if (!v6)
  {
    v7 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __38__ICAttachmentThumbnailOperation_main__block_invoke_cold_1(v1, v7);

  }
  objc_msgSend(*v1, "capturePropertiesFromAttachment:", v4);

}

void __38__ICAttachmentThumbnailOperation_main__block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "cache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "cacheKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setThumbnailData:forKey:", v4, v5);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "completionBlocks", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "image");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, v12, objc_msgSend(*(id *)(a1 + 32), "imageScaling"), objc_msgSend(*(id *)(a1 + 32), "showAsFileIcon"), objc_msgSend(*(id *)(a1 + 32), "isMovie"));

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)requestThumbnail
{
  ICAttachmentThumbnailPostProcessingOperation *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ICAttachmentThumbnailPostProcessingOperation *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  ICAttachmentThumbnailPostProcessingOperation *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  ICAttachmentThumbnailPostProcessingOperation *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v3 = [ICAttachmentThumbnailPostProcessingOperation alloc];
  -[ICAttachmentThumbnailOperation minSize](self, "minSize");
  v5 = v4;
  v7 = v6;
  -[ICAttachmentThumbnailOperation scale](self, "scale");
  v9 = v8;
  -[ICAttachmentThumbnailOperation appearanceInfo](self, "appearanceInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentThumbnailOperation cache](self, "cache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentThumbnailOperation cacheKey](self, "cacheKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentThumbnailOperation processingBlock](self, "processingBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentThumbnailOperation completionBlocks](self, "completionBlocks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentThumbnailOperation fallbackBlock](self, "fallbackBlock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ICAttachmentThumbnailPostProcessingOperation initWithSize:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlocks:fallbackBlock:](v3, "initWithSize:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlocks:fallbackBlock:", v10, v11, v12, v13, v14, v15, v5, v7, v9);

  -[ICAttachmentThumbnailOperation mediaURL](self, "mediaURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentThumbnailOperation minSize](self, "minSize");
  v19 = v18;
  v21 = v20;
  -[ICAttachmentThumbnailOperation scale](self, "scale");
  v22 = (void *)MEMORY[0x1E0CB34C8];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __50__ICAttachmentThumbnailOperation_requestThumbnail__block_invoke;
  v29[3] = &unk_1E5C1F878;
  v32 = v19;
  v33 = v21;
  v34 = v23;
  v30 = v17;
  v31 = v16;
  v24 = v16;
  v25 = v17;
  objc_msgSend(v22, "blockOperationWithBlock:", v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentThumbnailPostProcessingOperation addDependency:](v24, "addDependency:", v26);
  -[ICAttachmentThumbnailOperation queue](self, "queue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addOperation:", v26);

  -[ICAttachmentThumbnailOperation queue](self, "queue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addOperation:", v24);

}

void __50__ICAttachmentThumbnailOperation_requestThumbnail__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  dispatch_semaphore_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v2 = (void *)getQLThumbnailGenerationRequestClass_softClass;
  v22 = getQLThumbnailGenerationRequestClass_softClass;
  v3 = MEMORY[0x1E0C809B0];
  if (!getQLThumbnailGenerationRequestClass_softClass)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __getQLThumbnailGenerationRequestClass_block_invoke;
    v17 = &unk_1E5C1DE18;
    v18 = &v19;
    __getQLThumbnailGenerationRequestClass_block_invoke((uint64_t)&v14);
    v2 = (void *)v20[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v19, 8);
  v5 = (void *)objc_msgSend([v4 alloc], "initWithFileAtURL:size:scale:representationTypes:", *(_QWORD *)(a1 + 32), -1, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v6 = (void *)getQLThumbnailGeneratorClass_softClass;
  v22 = getQLThumbnailGeneratorClass_softClass;
  if (!getQLThumbnailGeneratorClass_softClass)
  {
    v14 = v3;
    v15 = 3221225472;
    v16 = __getQLThumbnailGeneratorClass_block_invoke;
    v17 = &unk_1E5C1DE18;
    v18 = &v19;
    __getQLThumbnailGeneratorClass_block_invoke((uint64_t)&v14);
    v6 = (void *)v20[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v7, "sharedGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_semaphore_create(0);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __50__ICAttachmentThumbnailOperation_requestThumbnail__block_invoke_2;
  v11[3] = &unk_1E5C1F850;
  v12 = *(id *)(a1 + 40);
  v13 = v9;
  v10 = v9;
  objc_msgSend(v8, "generateBestRepresentationForRequest:completionHandler:", v5, v11);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

}

void __50__ICAttachmentThumbnailOperation_requestThumbnail__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a3;
  objc_msgSend(a2, "UIImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setImage:", v6);

  if (v5)
  {
    v7 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __50__ICAttachmentThumbnailOperation_requestThumbnail__block_invoke_2_cold_1((uint64_t)v5, v7, v8);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (CGSize)minSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minSize.width;
  height = self->_minSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinSize:(CGSize)a3
{
  self->_minSize = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (ICAppearanceInfo)appearanceInfo
{
  return self->_appearanceInfo;
}

- (void)setAppearanceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceInfo, a3);
}

- (ICThumbnailDataCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_cacheKey, a3);
}

- (id)fallbackBlock
{
  return self->_fallbackBlock;
}

- (void)setFallbackBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (id)processingBlock
{
  return self->_processingBlock;
}

- (void)setProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (ICAttachmentThumbnailOperationQueue)queue
{
  return (ICAttachmentThumbnailOperationQueue *)objc_loadWeakRetained((id *)&self->_queue);
}

- (void)setQueue:(id)a3
{
  objc_storeWeak((id *)&self->_queue, a3);
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_completionBlocks, a3);
}

- (NSManagedObjectID)attachmentID
{
  return self->_attachmentID;
}

- (void)setAttachmentID:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentID, a3);
}

- (BOOL)attachmentPropertiesCaptured
{
  return self->_attachmentPropertiesCaptured;
}

- (void)setAttachmentPropertiesCaptured:(BOOL)a3
{
  self->_attachmentPropertiesCaptured = a3;
}

- (ICAttachmentPreviewImageLoader)attachmentPreviewImageLoader
{
  return self->_attachmentPreviewImageLoader;
}

- (void)setAttachmentPreviewImageLoader:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentPreviewImageLoader, a3);
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (void)setMediaURL:(id)a3
{
  objc_storeStrong((id *)&self->_mediaURL, a3);
}

- (unint64_t)imageScaling
{
  return self->_imageScaling;
}

- (void)setImageScaling:(unint64_t)a3
{
  self->_imageScaling = a3;
}

- (BOOL)showAsFileIcon
{
  return self->_showAsFileIcon;
}

- (void)setShowAsFileIcon:(BOOL)a3
{
  self->_showAsFileIcon = a3;
}

- (BOOL)isMovie
{
  return self->_isMovie;
}

- (void)setIsMovie:(BOOL)a3
{
  self->_isMovie = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_attachmentPreviewImageLoader, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_destroyWeak((id *)&self->_queue);
  objc_storeStrong(&self->_processingBlock, 0);
  objc_storeStrong(&self->_fallbackBlock, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_appearanceInfo, 0);
}

void __38__ICAttachmentThumbnailOperation_main__block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "attachmentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1AC7A1000, a2, v4, "Error getting attachment from object ID %@ in attachment thumbnail operation", (uint8_t *)&v5);

}

void __50__ICAttachmentThumbnailOperation_requestThumbnail__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1AC7A1000, a2, a3, "Error getting thumbnail %@", (uint8_t *)&v3);
}

@end
