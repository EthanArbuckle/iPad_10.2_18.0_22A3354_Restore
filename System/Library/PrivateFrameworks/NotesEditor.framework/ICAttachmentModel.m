@implementation ICAttachmentModel

uint64_t __81__ICAttachmentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__ICAttachmentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2;
  v7[3] = &unk_1EA7DD328;
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "performSnapshotBackgroundTask:", v7);

  return 0;
}

void __81__ICAttachmentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D639F0], "ic_existingObjectWithID:context:", *(_QWORD *)(a1 + 32), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __81__ICAttachmentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2_cold_1(v3);

  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "attachmentModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemProviderWritingURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, _QWORD))(v5 + 16))(v5, v7, 1, 0);

}

void __102__ICAttachmentModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D639F0], "ic_existingObjectWithID:context:", *(_QWORD *)(a1 + 32), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x1E0D637F0]))
  {
    objc_msgSend(v3, "pasteboardData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistenceData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __102__ICAttachmentModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(v3);
  }
  else
  {
    objc_msgSend(v3, "attachmentModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemProviderWritingData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __102__ICAttachmentModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __81__ICAttachmentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2_cold_1(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemProviderWritingURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1DD7B0000, v5, v6, "Providing media url for attachment: %@ => %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_0();
}

void __102__ICAttachmentModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(void *a1)
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
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1(&dword_1DD7B0000, v2, v3, "Providing data attachment: %@ => %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

void __102__ICAttachmentModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(void *a1)
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
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1(&dword_1DD7B0000, v2, v3, "Providing pasteboard data attachment: %@ => %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
