@implementation ICAttachmentTableModel

uint64_t __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  __int16 v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  __int16 v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "attributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "ic_range");
    objc_msgSend(v9, "matchesInString:options:range:", v10, 0, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_15;
    v38[3] = &unk_1EA7E04F0;
    v38[4] = *(_QWORD *)(a1 + 40);
    v14 = v8;
    v39 = v14;
    v15 = *(id *)(a1 + 48);
    v43 = *(_BYTE *)(a1 + 72);
    v44 = *(_WORD *)(a1 + 73);
    v40 = v15;
    v41 = a4;
    v42 = a3;
    -[NSObject ic_compactMap:](v13, "ic_compactMap:", v38);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v26);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0DC10F8];
    v18 = objc_msgSend(v14, "ic_range");
    v20 = v19;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2;
    v27[3] = &unk_1EA7E0518;
    v28 = *(id *)(a1 + 64);
    v21 = *(id *)(a1 + 32);
    v36 = *(_BYTE *)(a1 + 72);
    v37 = *(_WORD *)(a1 + 73);
    v22 = *(_QWORD *)(a1 + 40);
    v29 = v21;
    v30 = v22;
    v31 = v14;
    v23 = *(id *)(a1 + 48);
    v34 = a4;
    v35 = a3;
    v32 = v23;
    v33 = v16;
    v24 = v16;
    objc_msgSend(v31, "enumerateAttribute:inRange:options:usingBlock:", v17, v18, v20, 0, v27);
    objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v24);

  }
  else
  {
    v13 = os_log_create("com.apple.notes", "Find");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v46 = a3;
      v47 = 2048;
      v48 = a4;
      _os_log_impl(&dword_1DD7B0000, v13, OS_LOG_TYPE_INFO, "Skipping finding in table because attributed string is nil at column %lu row %lu.", buf, 0x16u);
    }
  }

  return 0;
}

uint64_t __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_15(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(a2, "range");
  LOBYTE(v7) = *(_BYTE *)(a1 + 74);
  return objc_msgSend(v3, "textFindingResultForMatchingRange:findableAttributedString:queryString:ignoreCase:wholeWords:startsWith:row:column:", v4, v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (v7 && objc_msgSend(MEMORY[0x1E0D63C60], "isInlineAttachment:", v7))
  {
    objc_msgSend(v7, "inlineAttachmentInContext:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "textFindingResultsMatchingExpression:ignoreCase:wholeWords:startsWith:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 96), *(unsigned __int8 *)(a1 + 97), *(unsigned __int8 *)(a1 + 98));
      v10 = objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v11)
      {
        v12 = v11;
        v24 = v9;
        v13 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v26 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            LOBYTE(v23) = *(_BYTE *)(a1 + 98);
            objc_msgSend(*(id *)(a1 + 48), "textFindingResultForMatchingRange:findableAttributedString:queryString:ignoreCase:wholeWords:startsWith:row:column:", a3, a4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 96), *(unsigned __int8 *)(a1 + 97), v23, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setInlineTextFindingResult:", v15);
            objc_msgSend(*(id *)(a1 + 72), "addObject:", v16);

          }
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v12);
        v9 = v24;
      }
    }
    else
    {
      v10 = os_log_create("com.apple.notes", "Find");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2_cold_1((uint64_t)v7, v10, v17, v18, v19, v20, v21, v22);
    }

  }
}

void __153__ICAttachmentTableModel_TextFinding__undoablyReplaceAllOccurrencesOfQueryString_textView_ignoreCase_wholeWords_startsWith_withText_tableViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(WeakRetained, "replaceTextFindingResult:withReplacementString:tableViewController:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

void __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, a2, a3, "Unable to get inline attachment for ttAttachment: %@", a5, a6, a7, a8, 2u);
}

@end
