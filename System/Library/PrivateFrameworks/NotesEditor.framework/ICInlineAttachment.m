@implementation ICInlineAttachment

ICInlineTextFindingResult *__105__ICInlineAttachment_TextFinding__textFindingResultsMatchingExpression_ignoreCase_wholeWords_startsWith___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  ICInlineTextFindingResult *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "range");
    v7 = objc_msgSend(v4, "ic_rangeEncapsulatesWord:", v5, v6);

    if (!v7)
      goto LABEL_6;
  }
  if (*(_BYTE *)(a1 + 49)
    && (objc_msgSend(*(id *)(a1 + 32), "string"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v3, "range"),
        v11 = objc_msgSend(v8, "ic_startsWithDelimeter:", v9, v10),
        v8,
        !v11))
  {
LABEL_6:
    v12 = 0;
  }
  else
  {
    v12 = objc_alloc_init(ICInlineTextFindingResult);
    -[ICInlineTextFindingResult setAttachment:](v12, "setAttachment:", *(_QWORD *)(a1 + 40));
    -[ICInlineTextFindingResult setFindableString:](v12, "setFindableString:", *(_QWORD *)(a1 + 32));
    v13 = objc_msgSend(v3, "range");
    -[ICInlineTextFindingResult setDisplayTextRange:](v12, "setDisplayTextRange:", v13, v14);
  }

  return v12;
}

@end
