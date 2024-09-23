@implementation ICAttachmentInlineDrawingModel

void __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  id v33;
  _OWORD v34[3];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D639F0], "ic_existingObjectWithID:context:", a1[4], a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D639F0], "typeUTIIsInlineDrawing:", a1[5]))
  {
    v31 = a1;
    v4 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(v3);

    objc_opt_class();
    v32 = v3;
    objc_msgSend(v3, "attachmentModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "newDrawingFromMergeableData");

    v33 = objc_alloc_init(MEMORY[0x1E0CD1158]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v30 = v7;
    objc_msgSend(v7, "strokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v36;
      v12 = *MEMORY[0x1E0CD1300];
      v13 = (_OWORD *)MEMORY[0x1E0C9BAA8];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v15, "ink");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v12);

          if ((v18 & 1) == 0)
          {
            v19 = v13[1];
            v34[0] = *v13;
            v34[1] = v19;
            v34[2] = v13[2];

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v10);
    }

    objc_msgSend(v30, "_canvasBounds");
    objc_msgSend(v33, "set_canvasBounds:");
    v20 = v31[6];
    objc_msgSend(v33, "serialize");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v20 + 16))(v20, v21, 0);

    v3 = v32;
    goto LABEL_26;
  }
  v22 = (void *)a1[5];
  objc_msgSend(MEMORY[0x1E0D639F0], "fallbackImageUTI");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = objc_msgSend(v22, "isEqualToString:", v23);

  if (!(_DWORD)v22)
  {
    v29 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_4(v3, (uint64_t)(a1 + 5), v29);

    goto LABEL_25;
  }
  v24 = objc_msgSend(v3, "hasFallbackImage");
  v25 = os_log_create("com.apple.notes", "DragAndDrop");
  v26 = v25;
  if (!v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_3(v3, v26);

LABEL_25:
    (*(void (**)(void))(a1[6] + 16))();
    goto LABEL_26;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(v3);

  v27 = a1[6];
  objc_msgSend(v3, "fallbackImageData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v27 + 16))(v27, v28, 0);

LABEL_26:
}

void __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(unsigned __int8 *)(a1 + 88);
  v6 = *(_BYTE *)(a1 + 89) == 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2;
  v13[3] = &unk_1EA7DF5A0;
  v14 = *(id *)(a1 + 48);
  v17 = *(_OWORD *)(a1 + 72);
  v7 = v2;
  v15 = v7;
  v16 = *(id *)(a1 + 56);
  objc_msgSend(v3, "performSearchQuery:fullWordsOnly:caseMatchingOnly:withBlock:", v4, v5, v6, v13);
  v8 = *(NSObject **)(a1 + 56);
  v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    v10 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1DD7B0000, v10, OS_LOG_TYPE_DEFAULT, "Timed out performing search query for inline drawing %@", buf, 0xCu);
    }

  }
  v12 = *(_QWORD *)(a1 + 64);
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v7);

}

void __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  __int128 v7;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2_cold_1(a1, v3, v4);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_9;
  v5[3] = &unk_1EA7DF578;
  v7 = *(_OWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  ICPencilKitTextFindingResult *v6;

  v5 = a2;
  v6 = objc_alloc_init(ICPencilKitTextFindingResult);
  -[ICPencilKitTextFindingResult setSearchQueryItem:](v6, "setSearchQueryItem:", v5);

  -[ICPencilKitTextFindingResult setOrder:](v6, "setOrder:", a3);
  -[ICPencilKitTextFindingResult setDrawingSize:](v6, "setDrawingSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __76__ICAttachmentInlineDrawingModel_TextFinding__inlineDrawingTextFindingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.notes.inlineDrawingTextFinding", MEMORY[0x1E0C80D50]);
  v1 = (void *)inlineDrawingTextFindingQueue_sDrawingFindingQueue;
  inlineDrawingTextFindingQueue_sDrawingFindingQueue = (uint64_t)v0;

}

void __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v2, v3, "Providing drawing data for attachment: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v2, v3, "Providing fallback image for attachment: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_ERROR, "Fallback image missing for attachment: %@", v4, 0xCu);

  OUTLINED_FUNCTION_3();
}

void __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  v7 = 2112;
  v8 = v5;
  _os_log_error_impl(&dword_1DD7B0000, a3, OS_LOG_TYPE_ERROR, "Unexpected typeIdentifier for attachment: %@, %@", v6, 0x16u);

  OUTLINED_FUNCTION_0_0();
}

void __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = 138412546;
  v6 = v4;
  v7 = 2048;
  v8 = objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_1DD7B0000, a3, OS_LOG_TYPE_DEBUG, "Finished search query in %@ with %ld results", (uint8_t *)&v5, 0x16u);
}

@end
