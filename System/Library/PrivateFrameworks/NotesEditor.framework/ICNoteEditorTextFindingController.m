@implementation ICNoteEditorTextFindingController

+ (OS_dispatch_queue)textFindingQueue
{
  if (textFindingQueue_onceToken != -1)
    dispatch_once(&textFindingQueue_onceToken, &__block_literal_global_15);
  return (OS_dispatch_queue *)(id)textFindingQueue_sTextFindingQueue;
}

void __53__ICNoteEditorTextFindingController_textFindingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.notes.textFinding", v2);
  v1 = (void *)textFindingQueue_sTextFindingQueue;
  textFindingQueue_sTextFindingQueue = (uint64_t)v0;

}

+ (id)textFindingResultsForPattern:(id)a3 textView:(id)a4 textStorage:(id)a5 ignoreCase:(BOOL)a6 wholeWords:(BOOL)a7
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  os_log_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  ICTextFindingResult *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  dispatch_group_t v36;
  id v37;
  NSObject *v38;
  dispatch_time_t v39;
  NSObject *v40;
  void *v41;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  const char *aSelector;
  _BOOL4 v48;
  id v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  NSObject *v54;
  id v55;
  id v56;
  uint64_t *v57;
  BOOL v58;
  BOOL v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _BYTE v71[16];
  _BYTE v72[128];
  uint64_t v73;

  v7 = a7;
  v48 = a6;
  aSelector = a2;
  v73 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v49 = a4;
  v11 = a5;
  v50 = v10;
  if (objc_msgSend(v10, "length")
    && (objc_msgSend(v11, "string"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "length"),
        v12,
        v13))
  {
    v65 = 0;
    v66 = &v65;
    v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__11;
    v69 = __Block_byref_object_dispose__11;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v70 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    v64 = 0;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v14, v48, &v64);
    v16 = v64;
    v43 = v14;
    v45 = v16;
    v46 = v15;
    if (v15)
    {
      objc_msgSend(v11, "string", v14, v16, v15, aSelector);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "matchesInString:options:range:", v17, 0, 0, objc_msgSend(v11, "length"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v19 = v18;
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v61 != v21)
              objc_enumerationMutation(v19);
            v23 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
            if (v7)
            {
              objc_msgSend(v11, "string");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v23, "range");
              v27 = objc_msgSend(v24, "ic_rangeEncapsulatesWord:", v25, v26);

              if ((v27 & 1) == 0)
                continue;
            }
            v28 = objc_alloc_init(ICTextFindingResult);
            v29 = objc_msgSend(v23, "range");
            -[ICTextFindingResult setRange:](v28, "setRange:", v29, v30);
            objc_msgSend((id)v66[5], "addObject:", v28);

          }
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
        }
        while (v20);
      }

    }
    else
    {
      v32 = (uint64_t)v16;
      v19 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[ICNoteEditorTextFindingController textFindingResultsForPattern:textView:textStorage:ignoreCase:wholeWords:].cold.2(v32, v19, v33);
    }

    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "managedObjectContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = dispatch_group_create();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __109__ICNoteEditorTextFindingController_textFindingResultsForPattern_textView_textStorage_ignoreCase_wholeWords___block_invoke;
    v51[3] = &unk_1EA7DFC28;
    v52 = v11;
    v37 = v35;
    v53 = v37;
    v38 = v36;
    v54 = v38;
    v57 = &v65;
    v55 = v50;
    v56 = v49;
    v58 = v48;
    v59 = v7;
    objc_msgSend(v37, "performBlockAndWait:", v51);
    v39 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(v38, v39))
    {
      v40 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICNoteEditorTextFindingController textFindingResultsForPattern:textView:textStorage:ignoreCase:wholeWords:].cold.1(v41, (uint64_t)v71, v40);
      }

    }
    objc_msgSend((id)v66[5], "sortedArrayUsingSelector:", sel_compare_, v43);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v65, 8);
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

void __109__ICNoteEditorTextFindingController_textFindingResultsForPattern_textView_textStorage_ignoreCase_wholeWords___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  __int16 v14;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_msgSend(v2, "ic_range");
  v6 = v5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __109__ICNoteEditorTextFindingController_textFindingResultsForPattern_textView_textStorage_ignoreCase_wholeWords___block_invoke_2;
  v9[3] = &unk_1EA7DFC00;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 72);
  v10 = v7;
  v13 = v8;
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v14 = *(_WORD *)(a1 + 80);
  objc_msgSend(v2, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v3, v4, v6, 0, v9);

}

void __109__ICNoteEditorTextFindingController_textFindingResultsForPattern_textView_textStorage_ignoreCase_wholeWords___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t aBlock;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v7 = *(NSObject **)(a1 + 32);
  v8 = a2;
  dispatch_group_enter(v7);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __109__ICNoteEditorTextFindingController_textFindingResultsForPattern_textView_textStorage_ignoreCase_wholeWords___block_invoke_3;
  v19 = &unk_1EA7DFBD8;
  v23 = a3;
  v24 = a4;
  v10 = *(_QWORD *)(a1 + 56);
  v20 = v9;
  v22 = v10;
  v21 = *(id *)(a1 + 32);
  v11 = v9;
  v12 = _Block_copy(&aBlock);
  objc_opt_class();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textFindingResultsMatchingString:textView:ignoreCase:wholeWords:startsWith:usePattern:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), 0, 0, v12, aBlock, v17, v18, v19);

  objc_opt_class();
  ICDynamicCast();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "attachmentModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textFindingResultsMatchingString:textView:ignoreCase:wholeWords:startsWith:usePattern:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), 0, 0, v12);

}

void __109__ICNoteEditorTextFindingController_textFindingResultsForPattern_textView_textStorage_ignoreCase_wholeWords___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(a1 + 56);
        v9 = *(_QWORD *)(a1 + 64);
        v10 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(v10, "setRange:", v8, v9);
        objc_msgSend(v10, "setAttachmentResult:", 1);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "ic_addObjectsFromNonNilArray:", *(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

+ (void)textFindingResultsForPattern:(NSObject *)a3 textView:textStorage:ignoreCase:wholeWords:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1DD7B0000, a3, (uint64_t)a3, "%@ timed out finding text", (uint8_t *)a2);

}

+ (void)textFindingResultsForPattern:(uint64_t)a3 textView:textStorage:ignoreCase:wholeWords:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1DD7B0000, a2, a3, "Error creating plaintext regular expression: %@", (uint8_t *)&v3);
}

@end
