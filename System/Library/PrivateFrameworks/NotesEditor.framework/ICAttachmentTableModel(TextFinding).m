@implementation ICAttachmentTableModel(TextFinding)

- (ICTableTextFindingResult)textFindingResultForMatchingRange:()TextFinding findableAttributedString:queryString:ignoreCase:wholeWords:startsWith:row:column:
{
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  ICTableTextFindingResult *v29;
  void *v30;
  void *v31;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v16 = a5;
  v17 = a6;
  if (a8)
  {
    objc_msgSend(v16, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "ic_rangeEncapsulatesWord:", a3, a4);

    if (!v19)
      goto LABEL_6;
  }
  if (a9
    && (objc_msgSend(v16, "string"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "ic_startsWithDelimeter:", a3, a4),
        v20,
        !v21))
  {
LABEL_6:
    v29 = 0;
  }
  else
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v16);
    v34[0] = CFSTR("SearchTableRow");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = CFSTR("SearchTableColumn");
    v35[0] = v23;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v25 = a7;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v22, "ic_range");
    objc_msgSend(v22, "addAttributes:range:", v26, v27, v28);

    v29 = objc_alloc_init(ICTableTextFindingResult);
    objc_msgSend(a1, "attachment");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableTextFindingResult setAttachment:](v29, "setAttachment:", v30);

    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v22);
    -[ICTableTextFindingResult setFindableString:](v29, "setFindableString:", v31);

    -[ICTableTextFindingResult setRangeInFindableString:](v29, "setRangeInFindableString:", a3, a4);
    -[ICTableTextFindingResult setQueryString:](v29, "setQueryString:", v17);
    -[ICTableTextFindingResult setIgnoreCase:](v29, "setIgnoreCase:", v25);
    -[ICTableTextFindingResult setRow:](v29, "setRow:", a10);
    -[ICTableTextFindingResult setColumn:](v29, "setColumn:", a11);

  }
  return v29;
}

- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:
{
  id v14;
  void (**v15)(id, void *);
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v30;
  _QWORD v31[4];
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  char v37;
  char v38;
  char v39;

  v14 = a3;
  v30 = a4;
  v15 = a9;
  if (a8)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  if (a5)
    v18 = 1;
  else
    v18 = 1024;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v16, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attachment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "managedObjectContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "table");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke;
  v31[3] = &unk_1EA7E0540;
  v24 = v19;
  v32 = v24;
  v33 = a1;
  v28 = v14;
  v34 = v28;
  v37 = a5;
  v38 = a6;
  v39 = a7;
  v25 = v22;
  v35 = v25;
  v26 = v21;
  v36 = v26;
  objc_msgSend(v23, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", 0, 0, 0, v31);

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v27);

  }
}

- (void)undoablyReplaceAllOccurrencesOfQueryString:()TextFinding textView:ignoreCase:wholeWords:startsWith:withText:tableViewController:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id location;

  v15 = a3;
  v16 = a4;
  v17 = a8;
  v18 = a9;
  objc_msgSend(v18, "beginEditing");
  objc_initWeak(&location, a1);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __153__ICAttachmentTableModel_TextFinding__undoablyReplaceAllOccurrencesOfQueryString_textView_ignoreCase_wholeWords_startsWith_withText_tableViewController___block_invoke;
  v24[3] = &unk_1EA7E0568;
  objc_copyWeak(&v27, &location);
  v19 = v17;
  v25 = v19;
  v20 = v18;
  v26 = v20;
  objc_msgSend(a1, "textFindingResultsMatchingString:textView:ignoreCase:wholeWords:startsWith:usePattern:completion:", v15, v16, a5, a6, a7, 0, v24);
  objc_msgSend(v20, "endEditing");
  objc_msgSend(v20, "saveOnMainThread");
  objc_msgSend(v20, "undoManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Replace All"), &stru_1EA7E9860, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActionName:", v23);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

- (void)undoablyReplaceTextFindingResult:()TextFinding withReplacementString:tableViewController:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "beginEditing");
  objc_msgSend(a1, "replaceTextFindingResult:withReplacementString:tableViewController:", v10, v9, v8);

  objc_msgSend(v8, "endEditing");
  objc_msgSend(v8, "saveOnMainThread");
  objc_msgSend(v8, "undoManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Replace"), &stru_1EA7E9860, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActionName:", v12);

}

- (void)replaceTextFindingResult:()TextFinding withReplacementString:tableViewController:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "row") == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v11, "column") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ICAttachmentTableModel(TextFinding) replaceTextFindingResult:withReplacementString:tableViewController:].cold.2((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
    }
    else
    {
      objc_msgSend(v11, "inlineTextFindingResult");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        goto LABEL_10;
      objc_msgSend(v9, "table");
      v12 = objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v11, "row");
      v21 = objc_msgSend(v11, "column");
      v27 = objc_msgSend(v11, "rangeInFindableString");
      v23 = v22;
      objc_msgSend(v9, "undoTarget");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "undoManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject textStorageForCellAtColumnIndex:rowIndex:undoTarget:undoManager:](v12, "textStorageForCellAtColumnIndex:rowIndex:undoTarget:undoManager:", v21, v20, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "replaceCharactersInRange:withString:", v27, v23, v8);
    }
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ICAttachmentTableModel(TextFinding) replaceTextFindingResult:withReplacementString:tableViewController:].cold.1((uint64_t)v7, v12);

  }
LABEL_10:

}

- (void)replaceTextFindingResult:()TextFinding withReplacementString:tableViewController:.cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_ERROR, "Cannot cast findingResult %@ to type %@", (uint8_t *)&v6, 0x16u);

}

- (void)replaceTextFindingResult:()TextFinding withReplacementString:tableViewController:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, a2, a3, "Cannot retrieve the row and column numbers for tableFindingResult: %@", a5, a6, a7, a8, 2u);
}

@end
