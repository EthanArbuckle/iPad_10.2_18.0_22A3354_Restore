@implementation ICAttachmentThumbnailOperationQueue

- (void)addOperationWithAttachment:(id)a3 size:(CGSize)a4 scale:(double)a5 appearanceInfo:(id)a6 cache:(id)a7 cacheKey:(id)a8 processingBlock:(id)a9 completionBlock:(id)a10 fallbackBlock:(id)a11
{
  double height;
  double width;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  ICAttachmentThumbnailOperation *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  height = a4.height;
  width = a4.width;
  v45 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v38 = a6;
  v20 = a7;
  v21 = a8;
  v37 = a9;
  v22 = a10;
  v36 = a11;
  -[ICAttachmentThumbnailOperationQueue setSuspended:](self, "setSuspended:", 1);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[ICAttachmentThumbnailOperationQueue operations](self, "operations");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
    while (2)
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v23);
        ICProtocolCast();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28 && objc_msgSend(v28, "isMatchingOperationForCacheKey:cache:", v21, v20))
        {
          objc_msgSend(v29, "addCompletionBlock:", v22);

          -[ICAttachmentThumbnailOperationQueue setSuspended:](self, "setSuspended:", 0);
          v34 = v38;
          v30 = v39;
          v33 = v36;
          v32 = v37;
          goto LABEL_12;
        }

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v25)
        continue;
      break;
    }
  }

  -[ICAttachmentThumbnailOperationQueue setSuspended:](self, "setSuspended:", 0);
  v30 = v39;
  -[ICAttachmentThumbnailOperationQueue checkPreviewImagesIntegrityOperationForAttachment:](self, "checkPreviewImagesIntegrityOperationForAttachment:", v39);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v36;
  v32 = v37;
  v34 = v38;
  v35 = -[ICAttachmentThumbnailOperation initWithAttachment:size:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:queue:]([ICAttachmentThumbnailOperation alloc], "initWithAttachment:size:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:queue:", v39, v38, v20, v21, v37, v22, width, height, a5, v36, self);
  -[ICAttachmentThumbnailOperation addDependency:](v35, "addDependency:", v31);
  -[ICAttachmentThumbnailOperationQueue addOperation:](self, "addOperation:", v31);
  -[ICAttachmentThumbnailOperationQueue addOperation:](self, "addOperation:", v35);

LABEL_12:
}

- (id)checkPreviewImagesIntegrityOperationForAttachment:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a3, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB34C8];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__ICAttachmentThumbnailOperationQueue_checkPreviewImagesIntegrityOperationForAttachment___block_invoke;
  v8[3] = &unk_1E5C1D540;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "blockOperationWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __89__ICAttachmentThumbnailOperationQueue_checkPreviewImagesIntegrityOperationForAttachment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workerManagedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__69;
  v9[4] = __Block_byref_object_dispose__69;
  v10 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__ICAttachmentThumbnailOperationQueue_checkPreviewImagesIntegrityOperationForAttachment___block_invoke_11;
  v5[3] = &unk_1E5C1E190;
  v8 = v9;
  v4 = v3;
  v6 = v4;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "performBlockAndWait:", v5);

  _Block_object_dispose(v9, 8);
}

void __89__ICAttachmentThumbnailOperationQueue_checkPreviewImagesIntegrityOperationForAttachment___block_invoke_11(_QWORD *a1)
{
  uint64_t v2;
  uint64_t *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  id v12;

  v3 = a1 + 5;
  v2 = a1[5];
  v4 = (void *)a1[4];
  v12 = 0;
  objc_msgSend(v4, "existingObjectWithID:error:", v2, &v12);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v7 = *(_QWORD *)(v3[1] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  v9 = *(void **)(*(_QWORD *)(v3[1] + 8) + 40);
  if (v9)
    v10 = 1;
  else
    v10 = v6 == 0;
  if (!v10)
  {
    v11 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __89__ICAttachmentThumbnailOperationQueue_checkPreviewImagesIntegrityOperationForAttachment___block_invoke_11_cold_1(v3, v11);

    v9 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  }
  objc_msgSend(v9, "checkPreviewImagesIntegrity");

}

void __89__ICAttachmentThumbnailOperationQueue_checkPreviewImagesIntegrityOperationForAttachment___block_invoke_11_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Failed to find attachment with object ID %@ for checking preview image integrity", (uint8_t *)&v3, 0xCu);
}

@end
