@implementation ICAttachmentPaperBundleModel

void __70__ICAttachmentPaperBundleModel_PreviewGeneration__generateFallbackPDF__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;

  v1 = (id *)(a1 + 32);
  *(_BYTE *)(*((_QWORD *)v1[3] + 1) + 24) = objc_msgSend(*(id *)(a1 + 32), "writeFallbackPDFData:", *(_QWORD *)(a1 + 40));
  objc_msgSend((id)objc_opt_class(), "generateImagePreviewsForAttachment:withFallbackPDFData:", *v1, v1[1]);
  if (*(_BYTE *)(*((_QWORD *)v1[3] + 1) + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "setPreviewUpdateDate:", v2);

    objc_msgSend(*v1, "updateChangeCountWithReason:", CFSTR("Regenerated paper document fallback PDF and preview images"));
    objc_msgSend(*v1, "modificationDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "previewUpdateDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "compare:", v4);

    if (v5 == 1)
    {
      v6 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __70__ICAttachmentPaperBundleModel_PreviewGeneration__generateFallbackPDF__block_invoke_cold_1(v1, v6);

      objc_msgSend(*v1, "previewUpdateDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v1, "setModificationDate:", v7);

    }
    else
    {
      objc_msgSend(*v1, "modificationDate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v1, "setModificationDate:", v8);

    }
  }
}

void __79__ICAttachmentPaperBundleModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "paperBundleURL");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_loggingIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __70__ICAttachmentPaperBundleModel_PreviewGeneration__generateFallbackPDF__block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "ic_loggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "modificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Attachment's modificationDate was later than its previewUpdateDate. Using previewUpdateDate as modificationDate so we don't end up in a preview loop (Attachment: %@, modificationDate: %@, previewUpdateDate: %@).", (uint8_t *)&v7, 0x20u);

}

@end
