@implementation ICAttachmentImageLoadingOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_attachmentObjectID, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)main
{
  OUTLINED_FUNCTION_0_5(&dword_1AC7A1000, a2, a3, "Had to fall back to cropping media for attachment: %@", a5, a6, a7, a8, 2u);
}

- (BOOL)forceFullSizeImage
{
  return self->_forceFullSizeImage;
}

void __41__ICAttachmentImageLoadingOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;

  v2 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(*(id *)(a1 + 32), "attachmentObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isUnsupportedOnCurrentPlatform");
  if (v10)
    LOBYTE(v10) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "hasFallbackImage");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v10;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "media");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "hasFile");
  }
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "imageFilterType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = (int)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 40), "orientation");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "markupModelData");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "isPasswordProtected");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "croppingQuad");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "attachmentModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "needsFullSizePreview");

  if (v21)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "sizeWidth");
    v23 = v22;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "sizeHeight");
    v25 = v24;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "attachmentPreviewImageWithMinSize:scale:", v23, v24, 1.0);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), "width");
    v30 = v29;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), "height");
    if (v30 >= v31)
      v31 = v30;
    if (v23 >= v25)
      v32 = v23;
    else
      v32 = v25;
    if (vabdd_f64(v31, v32) >= 0.00999999978)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = 0;
      if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "length"))
      {
        v33 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
        v34 = *(void **)(v33 + 40);
        *(_QWORD *)(v33 + 40) = 0;

      }
    }
  }
}

void __114__ICAttachmentImageLoadingOperation_initWithCache_attachment_attachmentType_forceFullSizeImage_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "media");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setMediaURL:", v2);

  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setAttachmentObjectID:", v3);

  objc_msgSend(*(id *)(a1 + 32), "imageCacheKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setCacheKey:", v4);

}

- (void)setMediaURL:(id)a3
{
  objc_storeStrong((id *)&self->_mediaURL, a3);
}

- (void)setForceFullSizeImage:(BOOL)a3
{
  self->_forceFullSizeImage = a3;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (void)setCacheKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void)setAttachmentType:(signed __int16)a3
{
  self->_attachmentType = a3;
}

- (void)setAttachmentObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentObjectID, a3);
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (ICAttachmentImageLoadingOperation)initWithCache:(id)a3 attachment:(id)a4 attachmentType:(signed __int16)a5 forceFullSizeImage:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  ICAttachmentImageLoadingOperation *v15;
  ICAttachmentImageLoadingOperation *v16;
  void *v17;
  ICAttachmentImageLoadingOperation *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  ICAttachmentImageLoadingOperation *v29;
  objc_super v30;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v30.receiver = self;
  v30.super_class = (Class)ICAttachmentImageLoadingOperation;
  v15 = -[ICAttachmentImageLoadingOperation init](&v30, sel_init);
  v16 = v15;
  if (v15)
  {
    -[ICAttachmentImageLoadingOperation setCache:](v15, "setCache:", v12);
    objc_msgSend(v13, "managedObjectContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __114__ICAttachmentImageLoadingOperation_initWithCache_attachment_attachmentType_forceFullSizeImage_completionHandler___block_invoke;
    v27 = &unk_1E5C1D9A8;
    v28 = v13;
    v18 = v16;
    v29 = v18;
    objc_msgSend(v17, "performBlockAndWait:", &v24);

    -[ICAttachmentImageLoadingOperation setAttachmentType:](v18, "setAttachmentType:", v9, v24, v25, v26, v27);
    -[ICAttachmentImageLoadingOperation setForceFullSizeImage:](v18, "setForceFullSizeImage:", v8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentImageLoadingOperation setCompletionHandlers:](v18, "setCompletionHandlers:", v19);

    if (v14)
    {
      -[ICAttachmentImageLoadingOperation completionHandlers](v18, "completionHandlers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v14, "copy");
      v22 = _Block_copy(v21);
      objc_msgSend(v20, "addObject:", v22);

    }
  }

  return v16;
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (NSCache)cache
{
  return self->_cache;
}

- (signed)attachmentType
{
  return self->_attachmentType;
}

- (NSManagedObjectID)attachmentObjectID
{
  return self->_attachmentObjectID;
}

- (id)addCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  -[ICAttachmentImageLoadingOperation completionHandlers](self, "completionHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  -[ICAttachmentImageLoadingOperation completionHandlers](self, "completionHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _Block_copy(v5);
  objc_msgSend(v7, "addObject:", v8);

  objc_sync_exit(v6);
  v9 = _Block_copy(v5);

  return v9;
}

- (void)removeCompletionHandler:(id)a3 cancelIfNoneLeft:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id aBlock;

  v4 = a4;
  aBlock = a3;
  -[ICAttachmentImageLoadingOperation completionHandlers](self, "completionHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  -[ICAttachmentImageLoadingOperation completionHandlers](self, "completionHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _Block_copy(aBlock);
  objc_msgSend(v7, "removeObject:", v8);

  if (v4)
  {
    -[ICAttachmentImageLoadingOperation completionHandlers](self, "completionHandlers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
      -[ICAttachmentImageLoadingOperation cancel](self, "cancel");
  }
  objc_sync_exit(v6);

}

void __41__ICAttachmentImageLoadingOperation_main__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "fallbackImageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = v6;
  }

}

intptr_t __41__ICAttachmentImageLoadingOperation_main__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("tracks"), 0) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "ic_previewImage");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __41__ICAttachmentImageLoadingOperation_main__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "orientedImage");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __41__ICAttachmentImageLoadingOperation_main__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "decryptedData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v5);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
