@implementation CKQuickLookThumbnailAttachmentItem

+ (id)UTITypes
{
  return +[CKQuickLookThumbnailMediaObject UTITypes](CKQuickLookThumbnailMediaObject, "UTITypes");
}

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 100.0;
  v3 = 100.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "defaultSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)generatePreviewWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  CKQuickLookThumbnailAttachmentItem *v15;
  void (**v16)(id, void *);
  _QWORD v17[7];

  v4 = (void (**)(id, void *))a3;
  objc_msgSend((id)objc_opt_class(), "previewCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CKAttachmentPreviewCacheKey(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v5, "cachedPreviewForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v4[2](v4, v11);
  }
  else if ((objc_msgSend(v5, "isGeneratingPreviewForKey:", v6) & 1) == 0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke;
    v17[3] = &unk_1E274DD58;
    v17[4] = self;
    v17[5] = v8;
    v17[6] = v10;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke_2;
    v12[3] = &unk_1E274CF80;
    v13 = v5;
    v14 = v6;
    v15 = self;
    v16 = v4;
    objc_msgSend(v13, "enqueueGenerationBlock:completion:withPriority:forKey:", v17, v12, 1, v14);

  }
}

id __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  id v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = a2;
  if (_IMWillLog())
    _IMAlwaysLog();
  v4 = objc_alloc(MEMORY[0x1E0CD32C8]);
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = (void *)objc_msgSend(v4, "initWithFileAtURL:size:scale:representationTypes:", v5, 4, *(double *)(a1 + 40), *(double *)(a1 + 48), v7);

  objc_msgSend(v8, "setShouldUseRestrictedExtension:", 1);
  if (_IMWillLog())
    _IMAlwaysLog();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__54;
  v22 = __Block_byref_object_dispose__54;
  v23 = 0;
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  objc_msgSend(MEMORY[0x1E0CD32D0], "sharedGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke_28;
  v15[3] = &unk_1E2757790;
  v17 = &v18;
  v11 = v9;
  v16 = v11;
  objc_msgSend(v10, "generateBestRepresentationForRequest:completionHandler:", v8, v15);

  v12 = dispatch_time(0, 20000000000);
  if (dispatch_group_wait(v11, v12))
    _IMWarn();
  v13 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "UIImage");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (_IMWillLog())
    _IMAlwaysLog();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke_3;
  v5[3] = &unk_1E274CF80;
  v6 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v7 = v2;
  v8 = v3;
  v9 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __68__CKQuickLookThumbnailAttachmentItem_generatePreviewWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "cachedPreviewForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "_savePreview:", v2);
    v2 = v4;
  }
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v2);
    v2 = v4;
  }

}

@end
