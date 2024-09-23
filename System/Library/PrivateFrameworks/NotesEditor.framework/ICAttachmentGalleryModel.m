@implementation ICAttachmentGalleryModel

void __109__ICAttachmentGalleryModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D639F0], "ic_existingObjectWithID:context:", a1[4], a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __109__ICAttachmentGalleryModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(v3);

  v5 = a1[5];
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0D64BE0], "blockingGeneratePDFURLForAttachment:withProgress:error:", v3, v5, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v6)
  {
    v13 = v7;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v6, 1, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;

    (*(void (**)(void))(a1[6] + 16))();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v10, "removeItemAtURL:error:", v6, &v12);
    v7 = v12;

    if (v7)
    {
      v11 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_impl(&dword_1DD7B0000, v11, OS_LOG_TYPE_DEFAULT, "Failed to remove temporary file for attachment item provider: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }

}

id __88__ICAttachmentGalleryModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__ICAttachmentGalleryModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2;
  v11[3] = &unk_1EA7DD378;
  v12 = *(id *)(a1 + 32);
  v6 = v4;
  v13 = v6;
  v14 = v3;
  v7 = v3;
  objc_msgSend(v5, "performBackgroundTask:", v11);

  v8 = v14;
  v9 = v6;

  return v9;
}

void __88__ICAttachmentGalleryModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D639F0], "ic_existingObjectWithID:context:", a1[4], a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __88__ICAttachmentGalleryModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2_cold_1(v3);

  v5 = a1[5];
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0D64BE0], "blockingGeneratePDFURLForAttachment:withProgress:error:", v3, v5, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  (*(void (**)(void))(a1[6] + 16))();

}

void __109__ICAttachmentGalleryModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v2, v3, "Generating PDF data for attachment: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __88__ICAttachmentGalleryModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v2, v3, "Generating PDF file for attachment: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

@end
