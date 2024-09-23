@implementation ICNote

void __91__ICNote_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;

  v3 = a2;
  objc_opt_class();
  v4 = a1[4];
  v14 = 0;
  objc_msgSend(v3, "existingObjectWithID:error:", v4, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v14;
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __91__ICNote_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(v7);

    objc_msgSend(v7, "prepareForCopyingData");
    objc_msgSend(v7, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    objc_msgSend(v7, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copyDataForUTI:range:persistenceHelper:", a1[5], 0, v10, v7);

  }
  else
  {
    v12 = 0;
  }
  v13 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __91__ICNote_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(v12, v13);

  (*(void (**)(void))(a1[6] + 16))();
}

void __104__ICNote_ItemProviderWriting___loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  objc_opt_class();
  v4 = a1[4];
  v14 = 0;
  objc_msgSend(v3, "existingObjectWithID:error:", v4, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v14;
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_6;
  v8 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __104__ICNote_ItemProviderWriting___loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(v7);

  objc_msgSend(v7, "prepareForCopyingData");
  objc_msgSend(v7, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  objc_msgSend(v7, "textStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filteredAttributedStringForUTI:range:", a1[5], 0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (id)objc_msgSend(v12, "_loadFileRepresentationOfTypeIdentifier:forItemProviderCompletionHandler:", a1[5], a1[6]);

  }
  else
  {
LABEL_6:
    (*(void (**)(void))(a1[6] + 16))();
  }

}

void __91__ICNote_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "length");
  _os_log_debug_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_DEBUG, "Returning data for, length: %lu", (uint8_t *)&v3, 0xCu);
}

void __91__ICNote_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1DD7B0000, v2, v3, "About to copy data for note: %@, uti: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

void __104__ICNote_ItemProviderWriting___loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1DD7B0000, v2, v3, "About to load file for note: %@, uti: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
