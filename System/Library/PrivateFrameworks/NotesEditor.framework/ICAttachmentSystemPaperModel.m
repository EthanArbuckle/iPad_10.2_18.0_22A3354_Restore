@implementation ICAttachmentSystemPaperModel

void __142__ICAttachmentSystemPaperModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  dispatch_semaphore_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  ICPaperKitTextFindingResult *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  ICPaperKitTextFindingResult *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  NSObject *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  if (!*(_QWORD *)(a1 + 32))
  {
    v13 = 0;
    goto LABEL_16;
  }
  v4 = dispatch_semaphore_create(0);
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__20;
  v48 = __Block_byref_object_dispose__20;
  v49 = 0;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(unsigned __int8 *)(a1 + 72);
  v8 = *(_BYTE *)(a1 + 73) == 0;
  v41[0] = v3;
  v41[1] = 3221225472;
  v41[2] = __142__ICAttachmentSystemPaperModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2;
  v41[3] = &unk_1EA7E0BC0;
  v43 = &v44;
  v9 = v4;
  v42 = v9;
  objc_msgSend(v5, "performSearchQuery:fullWordsOnly:caseMatchingOnly:withBlock:", v6, v7, v8, v41);
  v10 = dispatch_time(0, 5000000000);
  v30 = v9;
  if (dispatch_semaphore_wait(v9, v10))
  {
    v11 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v53 = v12;
      _os_log_impl(&dword_1DD7B0000, v11, OS_LOG_TYPE_DEFAULT, "Timed out performing search query for paper drawing %@", buf, 0xCu);
    }
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v11 = (id)v45[5];
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    if (v14)
    {
      v15 = 0;
      v16 = *(_QWORD *)v38;
      do
      {
        v17 = 0;
        v18 = v15;
        do
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(v11);
          v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v17);
          v20 = objc_alloc_init(ICPaperKitTextFindingResult);
          objc_msgSend(v19, "bounds");
          -[ICPaperKitTextFindingResult setSearchResultRect:](v20, "setSearchResultRect:");
          -[ICPaperKitTextFindingResult setOrder:](v20, "setOrder:", v18 + v17);
          objc_msgSend(v2, "addObject:", v20);

          ++v17;
        }
        while (v14 != v17);
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
        v15 = v18 + v17;
      }
      while (v14);
      v13 = v18 + v17;
      goto LABEL_15;
    }
  }
  v13 = 0;
LABEL_15:

  _Block_object_dispose(&v44, 8);
LABEL_16:
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "searchWithQuery:", *(_QWORD *)(a1 + 40));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v50, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v26 = objc_alloc_init(ICPaperKitTextFindingResult);
        objc_msgSend(v25, "ic_rectValue");
        -[ICPaperKitTextFindingResult setSearchResultRect:](v26, "setSearchResultRect:");
        -[ICPaperKitTextFindingResult setOrder:](v26, "setOrder:", v13 + i);
        objc_msgSend(v2, "addObject:", v26);

      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v50, 16);
      v13 += i;
    }
    while (v22);
  }
  v27 = *(void **)(a1 + 56);
  if (v27)
  {
    v32 = v27;
    v31 = v2;
    performBlockOnMainThread();

  }
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v29 = *(void **)(v28 + 40);
  if (v29)
  {
    *(_QWORD *)(v28 + 40) = 0;

  }
}

void __142__ICAttachmentSystemPaperModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __142__ICAttachmentSystemPaperModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_12(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __72__ICAttachmentSystemPaperModel_TextFinding__systemPaperTextFindingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.notes.systemPaperTextFinding", MEMORY[0x1E0C80D50]);
  v1 = (void *)systemPaperTextFindingQueue_sSystemPaperFindingQueue;
  systemPaperTextFindingQueue_sSystemPaperFindingQueue = (uint64_t)v0;

}

@end
