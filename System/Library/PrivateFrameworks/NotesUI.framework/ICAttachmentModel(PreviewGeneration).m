@implementation ICAttachmentModel(PreviewGeneration)

- (BOOL)needToGeneratePreviews
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  NSObject *v9;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "hasPreviews"))
  {
    objc_msgSend(a1, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewUpdateDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "attachment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "previewImages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count") == 0;

    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }
  v9 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(a1, "hasPreviews");
    objc_msgSend(a1, "attachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "previewUpdateDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "previewImages");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    v27 = 1024;
    v28 = v8;
    v29 = 1024;
    v30 = v15;
    v31 = 2112;
    v32 = v17;
    v33 = 2048;
    v34 = objc_msgSend(v19, "count");
    _os_log_debug_impl(&dword_1AC7A1000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d hasPreviews %d self.attachment.previewUpdateDate %@ self.attachment.previewImages.count %lu", buf, 0x40u);

  }
  return v8;
}

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  return 0;
}

- (uint64_t)generateAsynchronousPreviews
{
  return 0;
}

- (uint64_t)generatePreviewsDuringCloudActivity
{
  return 1;
}

- (uint64_t)requiresNetworkToGeneratePreview
{
  return 0;
}

- (uint64_t)didCancelPreviewGeneratorOperation
{
  return objc_msgSend(a1, "setPreviewGenerationOperationCancelled:", 1);
}

- (uint64_t)needToPostProcessAttachment
{
  return 0;
}

- (uint64_t)tooLargeForPreviewGeneration
{
  return 0;
}

@end
