@implementation ICInlineAttachment(TextFinding)

- (id)textFindingResultsMatchingExpression:()TextFinding ignoreCase:wholeWords:startsWith:
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  void *v21;
  char v22;
  char v23;

  v9 = a3;
  objc_msgSend(a1, "uiModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributedStringWithSurroundingAttributes:formatter:", MEMORY[0x1E0C9AA70], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "ic_range");
  objc_msgSend(v9, "matchesInString:options:range:", v12, 0, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __105__ICInlineAttachment_TextFinding__textFindingResultsMatchingExpression_ignoreCase_wholeWords_startsWith___block_invoke;
  v19[3] = &unk_1EA7E0B28;
  v22 = a5;
  v23 = a6;
  v20 = v11;
  v21 = a1;
  v16 = v11;
  objc_msgSend(v15, "ic_compactMap:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:
{
  id v15;
  void (**v16)(id, void *);
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v15 = a4;
  v16 = a9;
  if (a8)
  {
    v17 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", v22);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  if ((_DWORD)a5)
    v19 = 1;
  else
    v19 = 1024;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v17, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textFindingResultsMatchingExpression:ignoreCase:wholeWords:startsWith:", v20, a5, a6, a7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v16[2](v16, v21);

}

@end
