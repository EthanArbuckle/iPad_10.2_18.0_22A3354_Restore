@implementation HKLargePlainTextViewController

- (HKLargePlainTextViewController)initWithData:(id)a3
{
  id v5;
  HKLargePlainTextViewController *v6;
  HKLargePlainTextViewController *v7;
  uint64_t v8;
  NSString *dataAsString;
  UITextView *textView;
  HKIncrementalSearchBar *incrementalSearchBar;
  NSOperationQueue *v12;
  NSOperationQueue *searchQueue;
  _IncrementalSearchOperation *currentSearch;
  NSMutableArray *v15;
  NSMutableArray *currentRanges;
  uint64_t v17;
  UIColor *normalTextViewBackground;
  uint64_t v19;
  UIColor *selectedTextViewBackground;
  uint64_t v21;
  UIColor *currentSelectionForeground;
  uint64_t v23;
  UIColor *currentSelectionBackground;
  uint64_t v25;
  UIColor *otherSelectionForeground;
  uint64_t v27;
  UIColor *otherSelectionBackground;
  objc_super v30;

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HKLargePlainTextViewController;
  v6 = -[HKLargePlainTextViewController init](&v30, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
    dataAsString = v7->_dataAsString;
    v7->_dataAsString = (NSString *)v8;

    textView = v7->_textView;
    v7->_textView = 0;

    incrementalSearchBar = v7->_incrementalSearchBar;
    v7->_incrementalSearchBar = 0;

    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    searchQueue = v7->_searchQueue;
    v7->_searchQueue = v12;

    currentSearch = v7->_currentSearch;
    v7->_currentSearch = 0;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    currentRanges = v7->_currentRanges;
    v7->_currentRanges = v15;

    v7->_currentSearchItem = 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v17 = objc_claimAutoreleasedReturnValue();
    normalTextViewBackground = v7->_normalTextViewBackground;
    v7->_normalTextViewBackground = (UIColor *)v17;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
    v19 = objc_claimAutoreleasedReturnValue();
    selectedTextViewBackground = v7->_selectedTextViewBackground;
    v7->_selectedTextViewBackground = (UIColor *)v19;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
    v21 = objc_claimAutoreleasedReturnValue();
    currentSelectionForeground = v7->_currentSelectionForeground;
    v7->_currentSelectionForeground = (UIColor *)v21;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v23 = objc_claimAutoreleasedReturnValue();
    currentSelectionBackground = v7->_currentSelectionBackground;
    v7->_currentSelectionBackground = (UIColor *)v23;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v25 = objc_claimAutoreleasedReturnValue();
    otherSelectionForeground = v7->_otherSelectionForeground;
    v7->_otherSelectionForeground = (UIColor *)v25;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v27 = objc_claimAutoreleasedReturnValue();
    otherSelectionBackground = v7->_otherSelectionBackground;
    v7->_otherSelectionBackground = (UIColor *)v27;

    v7->_currentKeyboardHeight = 0.0;
  }

  return v7;
}

- (void)startIncrementalSearch
{
  id v3;

  -[HKIncrementalSearchBar activateSearch:](self->_incrementalSearchBar, "activateSearch:", 1);
  -[HKLargePlainTextViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)loadView
{
  id v3;
  id v4;
  UITextView *v5;
  UITextView *textView;
  void *v7;
  HKIncrementalSearchBar *v8;
  HKIncrementalSearchBar *incrementalSearchBar;
  double v10;
  id v11;

  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v11 = (id)objc_msgSend(v3, "initWithArrangedSubviews:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v11, "setAxis:", 1);
  v4 = objc_alloc(MEMORY[0x1E0DC3E50]);
  v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  textView = self->_textView;
  self->_textView = v5;

  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  -[HKLargePlainTextViewController searchBodyWithAttributes](self, "searchBodyWithAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v7);
  objc_msgSend(v11, "addArrangedSubview:", self->_textView);
  v8 = objc_alloc_init(HKIncrementalSearchBar);
  incrementalSearchBar = self->_incrementalSearchBar;
  self->_incrementalSearchBar = v8;

  -[HKIncrementalSearchBar setSearchBarDelegate:](self->_incrementalSearchBar, "setSearchBarDelegate:", self);
  LODWORD(v10) = 1148846080;
  -[HKIncrementalSearchBar setContentHuggingPriority:forAxis:](self->_incrementalSearchBar, "setContentHuggingPriority:forAxis:", 1, v10);
  objc_msgSend(v11, "addArrangedSubview:", self->_incrementalSearchBar);
  -[HKLargePlainTextViewController setView:](self, "setView:", v11);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKLargePlainTextViewController;
  -[HKLargePlainTextViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[HKLargePlainTextViewController searchBarDoneAction:](self, "searchBarDoneAction:", self);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (id)_standardPlainTextFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "fontWithName:size:", CFSTR("Courier"), 12.0);
}

- (id)_selectionAttributes:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  int *v7;
  void *v8;
  int *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v3 = a3;
  v18[3] = *MEMORY[0x1E0C80C00];
  -[HKLargePlainTextViewController _standardPlainTextFont](self, "_standardPlainTextFont");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &OBJC_IVAR___HKLargePlainTextViewController__otherSelectionForeground;
  if (v3)
    v7 = &OBJC_IVAR___HKLargePlainTextViewController__currentSelectionForeground;
  v8 = *(Class *)((char *)&self->super.super.super.super.isa + *v7);
  v9 = &OBJC_IVAR___HKLargePlainTextViewController__otherSelectionBackground;
  if (v3)
    v9 = &OBJC_IVAR___HKLargePlainTextViewController__currentSelectionBackground;
  v10 = *(Class *)((char *)&self->super.super.super.super.isa + *v9);
  v11 = *MEMORY[0x1E0DC1140];
  v17[0] = *MEMORY[0x1E0DC1138];
  v17[1] = v11;
  v18[0] = v5;
  v18[1] = v8;
  v17[2] = *MEMORY[0x1E0DC1100];
  v18[2] = v10;
  v12 = (void *)MEMORY[0x1E0C99D80];
  v13 = v10;
  v14 = v8;
  objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)searchBodyWithAttributes
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  -[HKLargePlainTextViewController _standardPlainTextFont](self, "_standardPlainTextFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC1140];
  v22[0] = *MEMORY[0x1E0DC1138];
  v22[1] = v4;
  v23[0] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", self->_dataAsString, v6);
  -[HKLargePlainTextViewController _selectionAttributes:](self, "_selectionAttributes:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_currentRanges;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "rangeValue", (_QWORD)v17);
        objc_msgSend(v7, "addAttributes:range:", v8, v14, v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v7;
}

- (void)resetSearchResults
{
  id v3;

  -[NSMutableArray removeAllObjects](self->_currentRanges, "removeAllObjects");
  -[HKLargePlainTextViewController searchBodyWithAttributes](self, "searchBodyWithAttributes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v3);

}

- (void)endSearchResults
{
  if (-[NSMutableArray count](self->_currentRanges, "count"))
    -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", self->_normalTextViewBackground);
  -[HKLargePlainTextViewController cancelCurrentSearch](self, "cancelCurrentSearch");
  -[HKLargePlainTextViewController resetCurrentSearchItem](self, "resetCurrentSearchItem");
}

- (void)finishSearchResults
{
  if (!-[NSMutableArray count](self->_currentRanges, "count"))
  {
    -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", self->_normalTextViewBackground);
    -[HKLargePlainTextViewController resetCurrentSearchItem](self, "resetCurrentSearchItem");
  }
}

- (void)cancelCurrentSearch
{
  _IncrementalSearchOperation *currentSearch;
  _IncrementalSearchOperation *v4;

  currentSearch = self->_currentSearch;
  if (currentSearch)
  {
    -[_IncrementalSearchOperation cancel](currentSearch, "cancel");
    -[HKLargePlainTextViewController resetSearchResults](self, "resetSearchResults");
    v4 = self->_currentSearch;
    self->_currentSearch = 0;

  }
}

- (void)addSearchResults:(IncrementalSearchResultsDefn *)a3
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSUInteger *p_length;
  void *v11;
  uint64_t v12;
  id v13;

  v5 = -[NSMutableArray count](self->_currentRanges, "count");
  v6 = -[NSMutableArray count](self->_currentRanges, "count");
  -[UITextView textStorage](self->_textView, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  v13 = v7;
  if (v6 > 0x3FF)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "beginEditing");
    -[HKLargePlainTextViewController _selectionAttributes:](self, "_selectionAttributes:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a3->var0)
  {
    v9 = 0;
    p_length = &a3->var1[0].length;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", *(p_length - 1), *p_length, v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_currentRanges, "addObject:", v11);
      if (v6 <= 0x3FF)
        objc_msgSend(v13, "addAttributes:range:", v8, *(p_length - 1), *p_length);

      ++v9;
      p_length += 2;
    }
    while (a3->var0 > v9);
  }
  if (v6 < 0x400)
    objc_msgSend(v13, "endEditing");
  if (v12)
  {
    -[HKLargePlainTextViewController _updateCurrentSearchItem:hitsChanged:resetSearch:](self, "_updateCurrentSearchItem:hitsChanged:resetSearch:", self->_currentSearchItem, 1, 0);
  }
  else
  {
    -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", self->_selectedTextViewBackground);
    -[HKLargePlainTextViewController resetCurrentSearchItem](self, "resetCurrentSearchItem");
  }

}

- (void)incrementalSearchOperation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _IncrementalSearchOperation *v8;
  _IncrementalSearchOperation *currentSearch;
  _QWORD v10[5];
  id v11;
  _QWORD aBlock[5];
  id v13;
  id location;

  v4 = a3;
  -[HKLargePlainTextViewController cancelCurrentSearch](self, "cancelCurrentSearch");
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke;
  aBlock[3] = &unk_1E9C458A0;
  aBlock[4] = self;
  objc_copyWeak(&v13, &location);
  v6 = _Block_copy(aBlock);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke_3;
  v10[3] = &unk_1E9C458C8;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  v7 = _Block_copy(v10);
  if (v4 && objc_msgSend(v4, "length"))
  {
    v8 = -[_IncrementalSearchOperation initWithSearchString:searchBody:resultsBlock:finishedBlock:]([_IncrementalSearchOperation alloc], "initWithSearchString:searchBody:resultsBlock:finishedBlock:", v4, self->_dataAsString, v6, v7);
    currentSearch = self->_currentSearch;
    self->_currentSearch = v8;

    -[NSOperationQueue addOperation:](self->_searchQueue, "addOperation:", self->_currentSearch);
  }
  else
  {
    -[HKLargePlainTextViewController finishSearchResults](self, "finishSearchResults");
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  _QWORD v4[4];
  id v5;
  _BYTE v6[1032];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008) == a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke_2;
    v4[3] = &unk_1E9C45878;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    memcpy(v6, a3, sizeof(v6));
    dispatch_async(MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
  }
}

void __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _BYTE __dst[1032];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  memcpy(__dst, (const void *)(a1 + 40), sizeof(__dst));
  objc_msgSend(WeakRetained, "addSearchResults:", __dst);

}

void __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke_3(uint64_t a1, uint64_t a2)
{
  _QWORD block[4];
  id v3;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008) == a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke_4;
    block[3] = &unk_1E9C40600;
    objc_copyWeak(&v3, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v3);
  }
}

void __61__HKLargePlainTextViewController_incrementalSearchOperation___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishSearchResults");

}

- (BOOL)_updateMatchDisplayString:(unint64_t)a3 numMatches:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  if (a4)
  {
    if (a4 == 1)
    {
      HKLocalizedStringForNumberWithTemplate(&unk_1E9CED1D8, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("INCREMENTAL_SEARCH_ONE_MATCH %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3 + 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HKLocalizedStringForNumberWithTemplate(v13, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4 > 0x3FF)
      {
        HKLocalizedStringForNumberWithTemplate(&unk_1E9CED1F0, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v16;
        v17 = CFSTR("INCREMENTAL_SEARCH_MAX_ITEM %@ %@");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        HKLocalizedStringForNumberWithTemplate(v14, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v16;
        v17 = CFSTR("INCREMENTAL_SEARCH_MATCH_ITEM %@ %@");
      }
      objc_msgSend(v16, "localizedStringForKey:value:table:", v17, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v18, v6, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_11;
  }
  -[HKIncrementalSearchBar searchText](self->_incrementalSearchBar, "searchText", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("INCREMENTAL_SEARCH_NO_MATCHES"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

    -[HKIncrementalSearchBar setMatchDisplayText:](self->_incrementalSearchBar, "setMatchDisplayText:", v10);
    return 1;
  }
  return 0;
}

- (void)_updateCurrentSearchItem:(unint64_t)a3 hitsChanged:(BOOL)a4 resetSearch:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v8;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v5 = a5;
  v8 = -[NSMutableArray count](self->_currentRanges, "count", a3, a4);
  if (self->_currentSearchItem != a3 || v5)
  {
    -[UITextView textStorage](self->_textView, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_currentSearchItem >= v8)
    {
      v11 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_currentRanges, "objectAtIndexedSubscript:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26 = v11;
    v12 = objc_msgSend(v11, "rangeValue");
    v22 = v13;
    v24 = v12;
    if (v8 <= a3)
    {
      v14 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_currentRanges, "objectAtIndexedSubscript:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "rangeValue", v22, v24);
    v17 = v16;
    -[HKLargePlainTextViewController _selectionAttributes:](self, "_selectionAttributes:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLargePlainTextViewController _selectionAttributes:](self, "_selectionAttributes:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "beginEditing");
    if (self->_currentSearchItem < v8)
      objc_msgSend(v10, "setAttributes:range:", v18, v25, v23);
    if (v8 <= a3)
    {
      objc_msgSend(v10, "endEditing");
    }
    else
    {
      objc_msgSend(v10, "setAttributes:range:", v19, v15, v17);
      objc_msgSend(v10, "endEditing");
      -[UITextView scrollRangeToVisible:](self->_textView, "scrollRangeToVisible:", v15, v17);
    }

  }
  if (v8)
    v20 = a3 != 0;
  else
    v20 = 0;
  -[HKIncrementalSearchBar setUpEnabled:](self->_incrementalSearchBar, "setUpEnabled:", v20);
  v21 = v8 - 1 > a3 && v8 != 0;
  -[HKIncrementalSearchBar setDownEnabled:](self->_incrementalSearchBar, "setDownEnabled:", v21);
  -[HKIncrementalSearchBar setMatchDisplayVisible:](self->_incrementalSearchBar, "setMatchDisplayVisible:", -[HKLargePlainTextViewController _updateMatchDisplayString:numMatches:](self, "_updateMatchDisplayString:numMatches:", a3, v8));
  if (v8 > a3)
    self->_currentSearchItem = a3;
}

- (void)resetCurrentSearchItem
{
  -[HKLargePlainTextViewController _updateCurrentSearchItem:hitsChanged:resetSearch:](self, "_updateCurrentSearchItem:hitsChanged:resetSearch:", 0, 1, 1);
}

- (void)searchBarUpAction:(id)a3
{
  int64_t currentSearchItem;

  currentSearchItem = self->_currentSearchItem;
  if (currentSearchItem >= 1)
    -[HKLargePlainTextViewController _updateCurrentSearchItem:hitsChanged:resetSearch:](self, "_updateCurrentSearchItem:hitsChanged:resetSearch:", currentSearchItem - 1, 0, 0);
}

- (void)searchBarDownAction:(id)a3
{
  -[HKLargePlainTextViewController _updateCurrentSearchItem:hitsChanged:resetSearch:](self, "_updateCurrentSearchItem:hitsChanged:resetSearch:", self->_currentSearchItem + 1, 0, 0);
}

- (void)searchBarDoneAction:(id)a3
{
  -[HKIncrementalSearchBar activateSearch:](self->_incrementalSearchBar, "activateSearch:", 0);
  -[HKLargePlainTextViewController endSearchResults](self, "endSearchResults");
}

- (void)searchBarChangeSearch:(id)a3 searchString:(id)a4
{
  -[HKLargePlainTextViewController incrementalSearchOperation:](self, "incrementalSearchOperation:", a4);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 968, 1);
}

- (NSString)dataAsString
{
  return self->_dataAsString;
}

- (UITextView)textView
{
  return self->_textView;
}

- (HKIncrementalSearchBar)incrementalSearchBar
{
  return self->_incrementalSearchBar;
}

- (NSOperationQueue)searchQueue
{
  return self->_searchQueue;
}

- (_IncrementalSearchOperation)currentSearch
{
  return (_IncrementalSearchOperation *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setCurrentSearch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (NSMutableArray)currentRanges
{
  return self->_currentRanges;
}

- (void)setCurrentRanges:(id)a3
{
  objc_storeStrong((id *)&self->_currentRanges, a3);
}

- (int64_t)currentSearchItem
{
  return self->_currentSearchItem;
}

- (void)setCurrentSearchItem:(int64_t)a3
{
  self->_currentSearchItem = a3;
}

- (UIColor)normalTextViewBackground
{
  return self->_normalTextViewBackground;
}

- (UIColor)selectedTextViewBackground
{
  return self->_selectedTextViewBackground;
}

- (UIColor)currentSelectionForeground
{
  return self->_currentSelectionForeground;
}

- (UIColor)currentSelectionBackground
{
  return self->_currentSelectionBackground;
}

- (UIColor)otherSelectionForeground
{
  return self->_otherSelectionForeground;
}

- (UIColor)otherSelectionBackground
{
  return self->_otherSelectionBackground;
}

- (double)currentKeyboardHeight
{
  return self->_currentKeyboardHeight;
}

- (void)setCurrentKeyboardHeight:(double)a3
{
  self->_currentKeyboardHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherSelectionBackground, 0);
  objc_storeStrong((id *)&self->_otherSelectionForeground, 0);
  objc_storeStrong((id *)&self->_currentSelectionBackground, 0);
  objc_storeStrong((id *)&self->_currentSelectionForeground, 0);
  objc_storeStrong((id *)&self->_selectedTextViewBackground, 0);
  objc_storeStrong((id *)&self->_normalTextViewBackground, 0);
  objc_storeStrong((id *)&self->_currentRanges, 0);
  objc_storeStrong((id *)&self->_currentSearch, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_incrementalSearchBar, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_dataAsString, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
