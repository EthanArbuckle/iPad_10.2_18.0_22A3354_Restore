@implementation CalculationResultCompletionItem

- (CalculationResultCompletionItem)initWithQuery:(id)a3 calculationResult:(id)a4
{
  id v7;
  id v8;
  CalculationResultCompletionItem *v9;
  CalculationResultCompletionItem *v10;
  CalculationResultCompletionItem *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CalculationResultCompletionItem;
  v9 = -[CalculationResultCompletionItem init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_query, a3);
    v10->_parsecQueryID = objc_msgSend(v7, "queryID");
    objc_storeStrong((id *)&v10->_calculationResult, a4);
    v11 = v10;
  }

  return v10;
}

- (void)acceptCompletionWithActionHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[WBSCalculationResult isCurrencyConversion](self->_calculationResult, "isCurrencyConversion"))
  {
    objc_msgSend(v5, "goToURLString:", *MEMORY[0x1E0D8B788]);
  }
  else
  {
    -[WBSCalculationResult formattedExpression](self->_calculationResult, "formattedExpression");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "search:", v4);

  }
}

- (void)auditAcceptedCompletionWithRank:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didAcceptCompletionItemOfType:atRank:", 1, a3);

}

- (id)completionTableViewCellForCompletionList:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v5 = (void *)getSearchUIClass_softClass;
  v16 = getSearchUIClass_softClass;
  if (!getSearchUIClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getSearchUIClass_block_invoke;
    v12[3] = &unk_1E9CF1780;
    v12[4] = &v13;
    __getSearchUIClass_block_invoke((uint64_t)v12);
    v5 = (void *)v14[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v13, 8);
  -[CalculationResultCompletionItem sfSearchResultValue](self, "sfSearchResultValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowViewsForResults:feedbackDelegate:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)completionTableViewCellReuseIdentifier
{
  return CFSTR("CalculationResultCell");
}

- (id)reflectedStringForUserTypedString:(id)a3
{
  return (id)-[WBSCalculationResult reflectedStringForQueryString:](self->_calculationResult, "reflectedStringForQueryString:", a3);
}

- (SFSearchResult)sfSearchResultValue
{
  SFSearchResult *sfSearchResultValue;
  SFSearchResult *v3;
  SFSearchResult *v5;
  SFSearchResult *v6;
  void *v7;
  void *v8;
  void *v9;
  WBSCalculationResult **p_calculationResult;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  _QWORD v49[2];
  void *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  sfSearchResultValue = self->_sfSearchResultValue;
  if (sfSearchResultValue)
  {
    v3 = sfSearchResultValue;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8C6A8], "safari_sfSearchResultWithUniqueIdentifier");
    v5 = (SFSearchResult *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sfSearchResultValue;
    self->_sfSearchResultValue = v5;

    -[WBSCompletionQuery queryString](self->_query, "queryString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setUserInput:](self->_sfSearchResultValue, "setUserInput:", v7);

    -[SFSearchResult setQueryId:](self->_sfSearchResultValue, "setQueryId:", -[WBSCompletionQuery queryID](self->_query, "queryID"));
    objc_msgSend(CFSTR("com.apple.Safari.CompletionList."), "stringByAppendingString:", CFSTR("CalculationResult"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setResultBundleId:](self->_sfSearchResultValue, "setResultBundleId:", v8);
    -[SFSearchResult setSectionBundleIdentifier:](self->_sfSearchResultValue, "setSectionBundleIdentifier:", v8);
    v9 = (void *)MEMORY[0x1E0D8C7A8];
    p_calculationResult = &self->_calculationResult;
    -[WBSCalculationResult formattedEquation](self->_calculationResult, "formattedEquation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setTitle:](self->_sfSearchResultValue, "setTitle:", v12);

    if (-[WBSCalculationResult isCalculation](self->_calculationResult, "isCalculation"))
      v13 = 6;
    else
      v13 = 7;
    -[SFSearchResult setType:](self->_sfSearchResultValue, "setType:", v13);
    v14 = objc_alloc_init(MEMORY[0x1E0D8C668]);
    v15 = (void *)MEMORY[0x1E0CB3940];
    -[WBSCalculationResult formattedExpression](*p_calculationResult, "formattedExpression");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ ="), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v17);

    -[WBSCalculationResult formattedResult](*p_calculationResult, "formattedResult");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSubtitle:", v18);

    objc_msgSend(v14, "setSubtitleIsEmphasized:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v19 = objc_alloc_init(MEMORY[0x1E0D8C7C8]);
      -[WBSCalculationResult formattedResult](self->_calculationResult, "formattedResult");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setCopyableString:", v20);

      v21 = objc_alloc_init(MEMORY[0x1E0D8C2D8]);
      objc_msgSend(v21, "setCopyableItem:", v19);
      v22 = objc_alloc_init(MEMORY[0x1E0D8C2A0]);
      objc_msgSend(v22, "setCommand:", v21);
      v51[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setButtonItems:", v23);

    }
    v44 = 0;
    v45 = &v44;
    v46 = 0x2050000000;
    v24 = (void *)getSFCardClass_softClass;
    v47 = getSFCardClass_softClass;
    if (!getSFCardClass_softClass)
    {
      v39 = MEMORY[0x1E0C809B0];
      v40 = 3221225472;
      v41 = __getSFCardClass_block_invoke;
      v42 = &unk_1E9CF1780;
      v43 = &v44;
      __getSFCardClass_block_invoke((uint64_t)&v39);
      v24 = (void *)v45[3];
    }
    v25 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v44, 8);
    v26 = (void *)objc_msgSend([v25 alloc], "init");
    if (-[WBSCalculationResult isCurrencyConversion](self->_calculationResult, "isCurrencyConversion"))
    {
      objc_msgSend(v14, "setSeparatorStyle:", 1);
      v44 = 0;
      v45 = &v44;
      v46 = 0x2050000000;
      v27 = (void *)getSFLocalImageClass_softClass;
      v47 = getSFLocalImageClass_softClass;
      if (!getSFLocalImageClass_softClass)
      {
        v39 = MEMORY[0x1E0C809B0];
        v40 = 3221225472;
        v41 = __getSFLocalImageClass_block_invoke;
        v42 = &unk_1E9CF1780;
        v43 = &v44;
        __getSFLocalImageClass_block_invoke((uint64_t)&v39);
        v27 = (void *)v45[3];
      }
      v28 = objc_retainAutorelease(v27);
      _Block_object_dispose(&v44, 8);
      v29 = (void *)objc_msgSend([v28 alloc], "init");
      objc_msgSend(v29, "setLocalImageType:", 3);
      objc_msgSend(v29, "setSize:", 78.0, 12.0);
      v44 = 0;
      v45 = &v44;
      v46 = 0x2050000000;
      v30 = (void *)getSFRichTextClass_softClass;
      v47 = getSFRichTextClass_softClass;
      if (!getSFRichTextClass_softClass)
      {
        v39 = MEMORY[0x1E0C809B0];
        v40 = 3221225472;
        v41 = __getSFRichTextClass_block_invoke;
        v42 = &unk_1E9CF1780;
        v43 = &v44;
        __getSFRichTextClass_block_invoke((uint64_t)&v39);
        v30 = (void *)v45[3];
      }
      v31 = objc_retainAutorelease(v30);
      _Block_object_dispose(&v44, 8);
      v32 = (void *)objc_msgSend([v31 alloc], "init");
      v50 = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setIcons:", v33);

      v44 = 0;
      v45 = &v44;
      v46 = 0x2050000000;
      v34 = (void *)getSFAttributionFooterCardSectionClass_softClass;
      v47 = getSFAttributionFooterCardSectionClass_softClass;
      if (!getSFAttributionFooterCardSectionClass_softClass)
      {
        v39 = MEMORY[0x1E0C809B0];
        v40 = 3221225472;
        v41 = __getSFAttributionFooterCardSectionClass_block_invoke;
        v42 = &unk_1E9CF1780;
        v43 = &v44;
        __getSFAttributionFooterCardSectionClass_block_invoke((uint64_t)&v39);
        v34 = (void *)v45[3];
      }
      v35 = objc_retainAutorelease(v34);
      _Block_object_dispose(&v44, 8);
      v36 = (void *)objc_msgSend([v35 alloc], "init");
      objc_msgSend(v36, "setTrailingAttribution:", v32);
      v49[0] = v14;
      v49[1] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setCardSections:", v37);

    }
    else
    {
      v48 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setCardSections:", v29);
    }

    -[SFSearchResult setInlineCard:](self->_sfSearchResultValue, "setInlineCard:", v26);
    v3 = self->_sfSearchResultValue;

  }
  return v3;
}

- (unint64_t)engagementDestination
{
  return 2;
}

- (NSString)parsecDomainIdentifier
{
  return 0;
}

- (NSString)titleForHistoryServiceCompletionList
{
  return (NSString *)-[WBSCalculationResult formattedResult](self->_calculationResult, "formattedResult");
}

- (BOOL)isEquivalentTo:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WBSCalculationResult formattedExpression](self->_calculationResult, "formattedExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[4], "formattedExpression");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)completionCellBackgroundModeInTopSection
{
  return 1;
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(int64_t)a3
{
  self->_parsecQueryID = a3;
}

- (WBSCalculationResult)calculationResult
{
  return self->_calculationResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calculationResult, 0);
  objc_storeStrong((id *)&self->_sfSearchResultValue, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
