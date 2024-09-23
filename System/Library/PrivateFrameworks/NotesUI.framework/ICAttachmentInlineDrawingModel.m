@implementation ICAttachmentInlineDrawingModel

void __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeableData");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "ic_sha256");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortLoggingDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v14;
    _os_log_debug_impl(&dword_1AC7A1000, v6, OS_LOG_TYPE_DEBUG, "Merging PencilKit drawing %@ into current data %@ for %@", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "typeUTI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D63680]);
  v10 = 1;
  if (v9)
    v10 = 2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;

}

void __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_11(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "handwritingRecognitionDrawing");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeWithDrawing:", *(_QWORD *)(a1 + 40));

}

void __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_2_cold_1(a1, v2);

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMergeableData:", v3);

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreviewUpdateDate:", 0);

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "ic_postNotificationOnMainThreadAfterSaveWithName:", *MEMORY[0x1E0D63640]);

}

void __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shortLoggingDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1AC7A1000, v2, OS_LOG_TYPE_DEFAULT, "Failed to merge PencilKit data into %@", (uint8_t *)&v5, 0xCu);

  }
}

void __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_13(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_13_cold_1(a1, v2);

}

void __58__ICAttachmentInlineDrawingModel_UI__imageForActivityItem__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fallbackImageData");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortLoggingDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke_25(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD block[4];
  __int128 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "handwritingRecognitionDrawing");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke_2;
  block[3] = &unk_1E5C1D9F8;
  v7 = *(_QWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1268]), "initWithDrawing:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 32), "setTitleQuery:", v2);

    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "titleQuery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", v3);

    objc_msgSend(*(id *)(a1 + 32), "titleQuery");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "start");

  }
  else
  {
    v5 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke_2_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);

  }
}

void __67__ICAttachmentInlineDrawingModel_UI__titleQuery_didUpdateWithItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D639F0], "ic_existingObjectWithID:context:", *(_QWORD *)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __67__ICAttachmentInlineDrawingModel_UI__titleQuery_didUpdateWithItem___block_invoke_cold_1(v4, v5);

  objc_msgSend(v4, "setTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "updateChangeCountWithReason:", CFSTR("Updated title from query"));
  objc_msgSend(v4, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "regenerateTitle:snippet:", 1, 1);

  if (v7)
  {
    objc_msgSend(v4, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markShareDirtyIfNeededWithReason:", CFSTR("Updated title from query"));

    objc_msgSend(v4, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateChangeCountWithReason:", CFSTR("Updated title from query"));

  }
  objc_msgSend(v3, "ic_save");

}

void __56__ICAttachmentInlineDrawingModel_UI__drawPreviewInRect___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "newDrawingFromMergeableData");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __122__ICAttachmentInlineDrawingModel_PreviewGeneration__generateImageForAttachment_fromDrawing_fullResolution_appearanceInfo___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  CGContext *v18;
  double v19;
  void *v20;
  NSObject *v21;
  dispatch_semaphore_t v22;
  uint64_t v23;
  NSObject *v24;
  CGFloat v25;
  double v26;
  double v27;
  double x;
  double width;
  double height;
  CGImage *v31;
  void *v32;
  void *v33;
  CGImageRef Image;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  CGFloat v38;
  double sx;
  double v40;
  double v41;
  CGAffineTransform v42;
  _QWORD v43[4];
  NSObject *v44;
  _BYTE *v45;
  _BYTE buf[24];
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = safeCanvasBoundsForDrawing(v2);
    v7 = v5 == *MEMORY[0x1E0C9D820];
    v8 = v6 == *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v7 && v8)
    {
      v6 = 100.0;
      v5 = 100.0;
      v9 = 0.0;
    }
    else
    {
      v9 = v4;
    }
    if (v7 && v8)
      v10 = 0.0;
    else
      v10 = v3;
    if (v5 >= 1.0)
      v11 = v5;
    else
      v11 = 1.0;
    sx = 1.0;
    if (v6 >= 1.0)
      v12 = v6;
    else
      v12 = 1.0;
    v51.origin.x = v10;
    v51.origin.y = v9;
    v51.size.width = v11;
    v51.size.height = v12;
    CGRectGetMaxX(v51);
    v52.origin.x = v10;
    v52.origin.y = v9;
    v52.size.width = v11;
    v52.size.height = v12;
    v13 = ceil(CGRectGetHeight(v52));
    v14 = 16384.0;
    if (!*(_BYTE *)(a1 + 56))
      v14 = 1536.0;
    if (v13 > v14)
    {
      sx = v14 / v13;
      v13 = ceil(v13 * (v14 / v13));
    }
    if (v12 <= 256.0)
      v15 = v12;
    else
      v15 = 256.0;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD11A0]), "initWithSize:scale:", v11, v15, 2.0);
    objc_msgSend(v16, "setInvertColors:", objc_msgSend(*(id *)(a1 + 40), "type") == 1);
    v41 = v13;
    v17 = TSUCreateRGBABitmapContext();
    if (v17)
    {
      v18 = (CGContext *)v17;
      v53.origin.x = v10;
      v53.origin.y = v9;
      v53.size.width = v11;
      v53.size.height = v12;
      if (v9 < CGRectGetMaxY(v53))
      {
        v38 = v12;
        v19 = v9;
        do
        {
          v20 = (void *)MEMORY[0x1AF445E78]();
          v21 = os_log_create("com.apple.notes", "PencilKit");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            v58.origin.x = v10;
            v58.origin.y = v19;
            v58.size.width = v11;
            v58.size.height = v15;
            NSStringFromCGRect(v58);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v59.origin.x = v10;
            v59.origin.y = v9;
            v59.size.width = v11;
            v59.size.height = v12;
            NSStringFromCGRect(v59);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v32;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v33;
            _os_log_debug_impl(&dword_1AC7A1000, v21, OS_LOG_TYPE_DEBUG, "Rendering inline sketch tile: %@, %@", buf, 0x16u);

          }
          v22 = dispatch_semaphore_create(0);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v47 = __Block_byref_object_copy__80;
          v48 = __Block_byref_object_dispose__80;
          v49 = 0;
          v23 = *(_QWORD *)(a1 + 32);
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __122__ICAttachmentInlineDrawingModel_PreviewGeneration__generateImageForAttachment_fromDrawing_fullResolution_appearanceInfo___block_invoke_15;
          v43[3] = &unk_1E5C1DE68;
          v45 = buf;
          v24 = v22;
          v44 = v24;
          objc_msgSend(v16, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", v23, v43, v10, v19, v11, v15, 1.0);
          v25 = v11;
          dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
          v26 = v9;
          v40 = v19;
          CGAffineTransformMakeScale(&v42, sx, sx);
          v27 = v10;
          v54.origin.x = v10;
          v54.origin.y = v19 - v9;
          v54.size.width = v25;
          v54.size.height = v15;
          v55 = CGRectApplyAffineTransform(v54, &v42);
          x = v55.origin.x;
          width = v55.size.width;
          height = v55.size.height;
          v31 = (CGImage *)objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "ic_CGImage");
          v56.size.height = ceil(height);
          v56.size.width = ceil(width);
          v56.origin.x = floor(x);
          v41 = v41 - v56.size.height;
          v56.origin.y = v41 + 1.0;
          CGContextDrawImage(v18, v56, v31);

          v9 = v26;
          v12 = v38;
          v10 = v27;
          v11 = v25;
          _Block_object_dispose(buf, 8);

          objc_autoreleasePoolPop(v20);
          v57.origin.x = v10;
          v57.origin.y = v9;
          v57.size.width = v25;
          v57.size.height = v38;
          v19 = v40 + 256.0;
        }
        while (v40 + 256.0 < CGRectGetMaxY(v57));
      }
      Image = CGBitmapContextCreateImage(v18);
      if (Image)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithCGImage:", Image);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v37 = *(void **)(v36 + 40);
        *(_QWORD *)(v36 + 40) = v35;

        CFRelease(Image);
      }
      CGContextRelease(v18);
    }

  }
}

void __122__ICAttachmentInlineDrawingModel_PreviewGeneration__generateImageForAttachment_fromDrawing_fullResolution_appearanceInfo___block_invoke_15(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __95__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsForAttachment_fromDrawing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CGContext *v16;
  CGContext *v17;
  CGImageRef Image;
  CGImageRef v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__80;
    v45 = __Block_byref_object_dispose__80;
    v46 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__80;
    v39 = __Block_byref_object_dispose__80;
    objc_msgSend(*(id *)(a1 + 40), "previewImages");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (id)objc_msgSend(v2, "mutableCopy");

    v3 = (void *)MEMORY[0x1E0D639E8];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __95__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsForAttachment_fromDrawing___block_invoke_2;
    v29[3] = &unk_1E5C243E8;
    v4 = *(void **)(a1 + 40);
    v34 = *(_QWORD *)(a1 + 48);
    v30 = v4;
    v31 = *(id *)(a1 + 32);
    v32 = &v41;
    v33 = &v35;
    objc_msgSend(v3, "enumerateAppearanceTypesUsingBlock:", v29);
    v5 = (void *)v42[5];
    if (v5)
    {
      v6 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0D639F0], "fallbackImageUTI");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ic_imageDataWithUTType:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "writeFallbackImageData:", v8);

    }
    if (objc_msgSend((id)v36[5], "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "removePreviewImages:", v36[5]);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v9 = (id)v36[5];
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v47, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v26;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v9);
            v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12);
            objc_msgSend(*(id *)(a1 + 40), "managedObjectContext", (_QWORD)v25);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "deleteObject:", v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v47, 16);
        }
        while (v10);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date", (_QWORD)v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setPreviewUpdateDate:", v15);

    objc_msgSend(*(id *)(a1 + 40), "updateChangeCountWithReason:", CFSTR("Generated previews from drawing"));
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&v41, 8);
  }
  else
  {
    v16 = (CGContext *)TSUCreateRGBABitmapContext();
    if (v16)
    {
      v17 = v16;
      Image = CGBitmapContextCreateImage(v16);
      if (Image)
      {
        v19 = Image;
        objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithCGImage:", Image);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(v19);
        if (objc_msgSend(*(id *)(a1 + 40), "attachmentType") == 10)
        {
          objc_msgSend(v20, "size");
          objc_msgSend(*(id *)(a1 + 40), "setSizeWidth:");
          objc_msgSend(v20, "size");
          objc_msgSend(*(id *)(a1 + 40), "setSizeHeight:", v21);
        }
        v22 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0D639F0], "fallbackImageUTI");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "ic_imageDataWithUTType:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "writeFallbackImageData:", v24);

        objc_msgSend(*(id *)(a1 + 40), "updateChangeCountWithReason:", CFSTR("Generated previews from drawing"));
      }
      CGContextRelease(v17);
    }
  }
}

void __95__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsForAttachment_fromDrawing___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id *v26;
  uint64_t v27;
  unsigned int v28;
  BOOL v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v2 = a2;
  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D639E8], "appearanceInfoWithType:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 64), "generateImageForAttachment:fromDrawing:fullResolution:appearanceInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "attachmentType") == 10)
  {
    objc_msgSend(*(id *)(a1 + 64), "previewImageFromDrawing:fullImage:scale:", *(_QWORD *)(a1 + 40), objc_msgSend(v6, "ic_CGImage"), 2.0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;
  v9 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __95__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsForAttachment_fromDrawing___block_invoke_2_cold_1((id *)(a1 + 32), v6, v9);

  if (v6)
  {
    if (objc_msgSend(*v5, "attachmentType") == 10)
    {
      objc_msgSend(v6, "size");
      objc_msgSend(*v5, "setSizeWidth:");
      objc_msgSend(v6, "size");
      objc_msgSend(*v5, "setSizeHeight:", v10);
      if (v2)
      {
LABEL_9:
        if (!v8)
          goto LABEL_27;
LABEL_13:
        +[ICPreviewDeviceContext sharedContext](ICPreviewDeviceContext, "sharedContext", v6, v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "deviceInfoScalable:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        obj = v15;
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v36;
          v33 = *(_QWORD *)v36;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v36 != v18)
                objc_enumerationMutation(obj);
              v20 = *v5;
              objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v19), "scale");
              objc_msgSend(v20, "updateAttachmentPreviewImageWithImage:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:", v8, v2, 1, 0, 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeObject:", v21);
                if (objc_msgSend(*(id *)(a1 + 32), "attachmentType") == 9)
                {
                  objc_msgSend(v21, "setVersion:", (__int16)objc_msgSend((id)objc_opt_class(), "drawingPreviewVersion"));
                  objc_msgSend(*(id *)(a1 + 32), "drawingModel");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "drawingDocument");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = a1;
                  v25 = v8;
                  v26 = v5;
                  v27 = v2;
                  v28 = objc_msgSend(v23, "maxDocumentVersion");
                  v29 = v28 > objc_msgSend(MEMORY[0x1E0D63AF8], "serializationVersion");
                  v2 = v27;
                  v5 = v26;
                  v8 = v25;
                  a1 = v24;
                  v30 = v29;
                  objc_msgSend(v21, "setVersionOutOfDate:", v30);

                  v18 = v33;
                }
              }

              ++v19;
            }
            while (v17 != v19);
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          }
          while (v17);
        }

        v6 = v31;
        v4 = v32;
        goto LABEL_27;
      }
    }
    else if (v2)
    {
      goto LABEL_9;
    }
    +[ICAttachmentPreviewImageLoader orientedImage:withBackground:](ICAttachmentPreviewImageLoader, "orientedImage:withBackground:", v6, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    if (!v8)
      goto LABEL_27;
    goto LABEL_13;
  }
LABEL_27:

}

void __81__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "newDrawingFromMergeableData");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, v5, "Merged PencilKit data changes into %@", v6);

  OUTLINED_FUNCTION_4();
}

void __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_13_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, v5, "No changes to PencilKit data for %@", v6);

  OUTLINED_FUNCTION_4();
}

void __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, a2, a3, "No drawing when enabling title query for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __67__ICAttachmentInlineDrawingModel_UI__titleQuery_didUpdateWithItem___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, v4, "Title query updated title for %@", v5);

}

void __95__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsForAttachment_fromDrawing___block_invoke_2_cold_1(id *a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "shortLoggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "size");
  v7 = v6;
  objc_msgSend(a2, "size");
  v9 = 138412802;
  v10 = v5;
  v11 = 2048;
  v12 = v7;
  v13 = 2048;
  v14 = v8;
  _os_log_debug_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_DEBUG, "Generated inline sketch image: %@ => %g %g", (uint8_t *)&v9, 0x20u);

}

@end
