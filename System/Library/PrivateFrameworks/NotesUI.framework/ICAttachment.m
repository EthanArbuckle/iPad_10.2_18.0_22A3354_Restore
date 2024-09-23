@implementation ICAttachment

uint64_t __68__ICAttachment_UI__loadImage_aboutToLoadHandler_forceFullSizeImage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "media");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "imageCacheKey");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "attachmentType");
  result = objc_msgSend(*(id *)(a1 + 32), "isUnsupportedOnCurrentPlatform");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

uint64_t __46__ICAttachment_UI__imageLoadingOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)imageLoadingOperationQueue_imageLoadingOperationQueue;
  imageLoadingOperationQueue_imageLoadingOperationQueue = (uint64_t)v0;

  objc_msgSend((id)imageLoadingOperationQueue_imageLoadingOperationQueue, "setName:", CFSTR("com.apple.notes.attachment-image-loading-queue"));
  return objc_msgSend((id)imageLoadingOperationQueue_imageLoadingOperationQueue, "setMaxConcurrentOperationCount:", 2);
}

void __51__ICAttachment_PDFGalleryVersion__docCamPDFVersion__block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "modificationDate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (uint64_t)v2;

}

void __61__ICAttachment_SearchIndexable_UI__fileURLForTypeIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __61__ICAttachment_SearchIndexable_UI__fileURLForTypeIdentifier___block_invoke_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 40), "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLForTypeIdentifier:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "shortLoggingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_debug_impl(&dword_1AC7A1000, v7, OS_LOG_TYPE_DEBUG, "Got file URL (%@) for %@ %@", (uint8_t *)&v11, 0x20u);

  }
}

void __58__ICAttachment_SearchIndexable_UI__dataForTypeIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__ICAttachment_SearchIndexable_UI__dataForTypeIdentifier___block_invoke_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 40), "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataForTypeIdentifier:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length");
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "shortLoggingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218498;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_debug_impl(&dword_1AC7A1000, v7, OS_LOG_TYPE_DEBUG, "Got %ld bytes for %@ %@", (uint8_t *)&v11, 0x20u);

  }
}

void __54__ICAttachment_LinkPresentation__retrieveLinkMetadata__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "linkPresentationArchivedMetadata");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (objc_msgSend(*(id *)(a1 + 32), "attachmentType") == 2)
  {
    objc_msgSend(WeakRetained, "title");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __54__ICAttachment_LinkPresentation__persistLinkMetadata___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setLinkPresentationArchivedMetadata:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_save");

}

void __48__ICAttachment_LinkPresentation__metadataExists__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "linkPresentationArchivedMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2 != 0;

}

void __55__ICAttachment_LinkPresentation__requestRemoteMetadata__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "attachmentModel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "generatePreviewsInOperation:", 0);

}

uint64_t __64__ICAttachment_LinkPresentation__requestFileMetadataIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "generatePreviewsInOperation:", 0);
}

void __60__ICAttachment_LinkPresentation__filePreviewGenerationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.mobilenotes.filePreviewGenerationQueue", 0);
  v1 = (void *)filePreviewGenerationQueue_queue;
  filePreviewGenerationQueue_queue = (uint64_t)v0;

}

void __59__ICAttachment_LinkPresentation__webPreviewGenerationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.mobilenotes.webPreviewGenerationQueue", 0);
  v1 = (void *)webPreviewGenerationQueue_queue;
  webPreviewGenerationQueue_queue = (uint64_t)v0;

}

void __59__ICAttachment_LinkPresentation__mapPreviewGenerationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.mobilenotes.mapPreviewGenerationQueue", 0);
  v1 = (void *)mapPreviewGenerationQueue_queue;
  mapPreviewGenerationQueue_queue = (uint64_t)v0;

}

uint64_t __43__ICAttachment_UI__thumbnailOperationQueue__block_invoke()
{
  ICAttachmentThumbnailOperationQueue *v0;
  void *v1;

  v0 = objc_alloc_init(ICAttachmentThumbnailOperationQueue);
  v1 = (void *)thumbnailOperationQueue_thumbnailOperationQueue;
  thumbnailOperationQueue_thumbnailOperationQueue = (uint64_t)v0;

  objc_msgSend((id)thumbnailOperationQueue_thumbnailOperationQueue, "setName:", CFSTR("com.apple.notes.attachment-thumbnail-queue"));
  return objc_msgSend((id)thumbnailOperationQueue_thumbnailOperationQueue, "setMaxConcurrentOperationCount:", 2);
}

void __25__ICAttachment_UI__image__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __68__ICAttachment_UI__loadImage_aboutToLoadHandler_forceFullSizeImage___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained, "removeCompletionHandler:cancelIfNoneLeft:", v3, 1);
      WeakRetained = v4;
    }
  }

}

void __30__ICAttachment_UI__imageCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D641C0]);
  v1 = (void *)imageCache_imageCache_2;
  imageCache_imageCache_2 = (uint64_t)v0;

}

void __36__ICAttachment_UI__attributedString__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);

    if (v9 == v10)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      *(_QWORD *)(v11 + 32) = a3;
      *(_QWORD *)(v11 + 40) = a4;
      *a5 = 1;
    }
  }

}

void __67__ICAttachment_UI__deviceInfosWithoutPreviewImagesFromDeviceInfos___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D63C20], "previewDeviceInfoForPreviewImage:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_removeNonNilObject:", v3);

}

void __152__ICAttachment_UI__fetchThumbnailImageWithMinSize_scale_appearanceInfo_cache_cacheKey_processingBlock_completionBlock_fallbackBlock_aboutToLoadHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "image");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, v3, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "imageScaling"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "showAsFileIcon"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isMovie"));

}

void __101__ICAttachment_InlineAttachmentManagement_UI__filterInlineAttachmentsInTableColumnTextStorage_range___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v7 = a2;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "inlineAttachmentFromObject:createIfNecessary:", v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_opt_class();
      ICDynamicCast();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        && +[ICTextAttachment textAttachmentIsContent:](ICTextAttachment, "textAttachmentIsContent:", v7))
      {
        +[ICInlineTextAttachment textAttachmentWithAttachment:](ICInlineTextAttachment, "textAttachmentWithAttachment:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0DC10F8], v11, a3, a4);
        }
        else
        {
          v12 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            __101__ICAttachment_InlineAttachmentManagement_UI__filterInlineAttachmentsInTableColumnTextStorage_range___block_invoke_cold_1(v9, a3, a4);

          objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E0DC10F8], a3, a4);
        }

      }
      goto LABEL_14;
    }
    if (objc_msgSend((id)objc_opt_class(), "isInlineAttachment:", v7))
    {
      objc_msgSend(*(id *)(a1 + 32), "inlineAttachmentFromObject:createIfNecessary:", v7, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNeedsInitialFetchFromCloud:", 1);
LABEL_14:

    }
  }

}

void __61__ICAttachment_SearchIndexable_UI__fileURLForTypeIdentifier___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v2, v3, "Getting %@ file URL for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __58__ICAttachment_SearchIndexable_UI__dataForTypeIdentifier___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v2, v3, "Getting %@ data for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

void __101__ICAttachment_InlineAttachmentManagement_UI__filterInlineAttachmentsInTableColumnTextStorage_range___block_invoke_cold_1(void *a1, NSUInteger a2, NSUInteger a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSRange v13;

  objc_msgSend(a1, "shortLoggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13.location = a2;
  v13.length = a3;
  NSStringFromRange(v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v6, v7, "Table: Found a token text attachment that we could not create a text attachment for: %@ at %@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_4();
}

@end
