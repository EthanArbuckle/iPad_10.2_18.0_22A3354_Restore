@implementation HKIncrementalSearchBar

- (HKIncrementalSearchBar)init
{
  HKIncrementalSearchBar *v2;
  _SearchBarContent *v3;
  _SearchBarContent *searchBarContent;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKIncrementalSearchBar;
  v2 = -[HKIncrementalSearchBar initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = -[_SearchBarContent initWithSearchBar:]([_SearchBarContent alloc], "initWithSearchBar:", v2);
    searchBarContent = v2->_searchBarContent;
    v2->_searchBarContent = v3;

    -[HKIncrementalSearchBar setUpEnabled:](v2, "setUpEnabled:", 0);
    -[HKIncrementalSearchBar setDownEnabled:](v2, "setDownEnabled:", 0);
    -[HKIncrementalSearchBar activateSearch:](v2, "activateSearch:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKIncrementalSearchBar setBackgroundColor:](v2, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_searchKeyboardDidHide_, *MEMORY[0x1E0DC4E68], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKIncrementalSearchBar;
  -[HKIncrementalSearchBar dealloc](&v4, sel_dealloc);
}

- (BOOL)keyboardIsUp
{
  void *v2;
  char v3;

  -[_SearchBarContent searchEntry](self->_searchBarContent, "searchEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (BOOL)searchIsActive
{
  return -[HKIncrementalSearchBar keyboardIsUp](self, "keyboardIsUp")
      || -[HKIncrementalSearchBar keyboardIsDown](self, "keyboardIsDown");
}

- (void)searchKeyboardDidHide:(id)a3
{
  void *v4;
  id v5;

  if (!-[HKIncrementalSearchBar searchIsActive](self, "searchIsActive", a3))
  {
    -[_SearchBarContent searchBarDelegate](self->_searchBarContent, "searchBarDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_SearchBarContent searchBarDelegate](self->_searchBarContent, "searchBarDelegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchBarDoneAction:", self);

    }
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)inputAccessoryView
{
  return self->_searchBarContent;
}

- (HKIncrementalSearchBarDelegate)searchBarDelegate
{
  return -[_SearchBarContent searchBarDelegate](self->_searchBarContent, "searchBarDelegate");
}

- (void)setSearchBarDelegate:(id)a3
{
  -[_SearchBarContent setSearchBarDelegate:](self->_searchBarContent, "setSearchBarDelegate:", a3);
}

- (void)setUpEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_SearchBarContent upBarButton](self->_searchBarContent, "upBarButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)setDownEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_SearchBarContent downBarButton](self->_searchBarContent, "downBarButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (NSString)searchText
{
  void *v2;
  void *v3;

  -[_SearchBarContent searchEntry](self->_searchBarContent, "searchEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSearchText:(id)a3
{
  _SearchBarContent *searchBarContent;
  id v4;
  id v5;

  searchBarContent = self->_searchBarContent;
  v4 = a3;
  -[_SearchBarContent searchEntry](searchBarContent, "searchEntry");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setMatchDisplayText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_matchDisplayText, a3);
  v5 = a3;
  -[_SearchBarContent searchEntry](self->_searchBarContent, "searchEntry");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMatchDisplayString:", v5);

}

- (void)setMatchDisplayVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_SearchBarContent searchEntry](self->_searchBarContent, "searchEntry");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchDisplayVisible:", v3);

}

- (void)activateSearch:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    if (!-[HKIncrementalSearchBar searchIsActive](self, "searchIsActive"))
    {
      -[HKIncrementalSearchBar becomeFirstResponder](self, "becomeFirstResponder");
      -[_SearchBarContent searchEntry](self->_searchBarContent, "searchEntry");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "becomeFirstResponder");

    }
  }
  else
  {
    -[_SearchBarContent searchEntry](self->_searchBarContent, "searchEntry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resignFirstResponder");

    -[HKIncrementalSearchBar resignFirstResponder](self, "resignFirstResponder");
    -[HKIncrementalSearchBar setUpEnabled:](self, "setUpEnabled:", 0);
    -[HKIncrementalSearchBar setDownEnabled:](self, "setDownEnabled:", 0);
    -[HKIncrementalSearchBar setSearchText:](self, "setSearchText:", &stru_1E9C4C428);
    -[HKIncrementalSearchBar setMatchDisplayText:](self, "setMatchDisplayText:", &stru_1E9C4C428);
    -[HKIncrementalSearchBar setMatchDisplayVisible:](self, "setMatchDisplayVisible:", 0);
  }
}

- (void)_lowerKeyboard
{
  if (-[HKIncrementalSearchBar keyboardIsUp](self, "keyboardIsUp"))
    -[HKIncrementalSearchBar becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)doneAction:(id)a3
{
  void *v4;

  -[_SearchBarContent searchEntry](self->_searchBarContent, "searchEntry", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  -[HKIncrementalSearchBar resignFirstResponder](self, "resignFirstResponder");
}

+ (BOOL)_hasUppercaseCharacters:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "uppercaseLetterCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v5);

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)_patternFromSearchString:(id)a3 quoteForJavascript:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\\'"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v10 = objc_msgSend(v8, "length");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__HKIncrementalSearchBar__patternFromSearchString_quoteForJavascript___block_invoke;
  v17[3] = &unk_1E9C46100;
  v21 = &v23;
  v11 = v6;
  v18 = v11;
  v22 = v4;
  v12 = v9;
  v19 = v12;
  v13 = v7;
  v20 = v13;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 2, v17);
  if (*((_BYTE *)v24 + 24))
  {
    if (v4)
      objc_msgSend(v12, "appendString:", CFSTR("\\"));
    objc_msgSend(v12, "appendString:", CFSTR("\\s+"));
  }
  v14 = v20;
  v15 = v12;

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __70__HKIncrementalSearchBar__patternFromSearchString_quoteForJavascript___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v12 = v3;
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v4)
  {
    if (v6)
    {
      if (*(_BYTE *)(a1 + 64))
        objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\\"));
      objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\\s+"));
      objc_msgSend(*(id *)(a1 + 40), "appendString:", v12);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
  }
  else if (v6)
  {
    v7 = v12;
    if (*(_BYTE *)(a1 + 64)
      && (objc_msgSend(v12, "stringByTrimmingCharactersInSet:", *(_QWORD *)(a1 + 48)),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "length"),
          v8,
          v7 = v12,
          !v9))
    {
      objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\\"));
      v10 = *(void **)(a1 + 40);
      v11 = v12;
    }
    else
    {
      v10 = *(void **)(a1 + 40);
      v11 = v7;
    }
    objc_msgSend(v10, "appendString:", v11);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

+ (id)regularExpressionFromString:(id)a3 quoteForJavascript:(BOOL)a4 caseless:(BOOL *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  if (a5)
    *a5 = !+[HKIncrementalSearchBar _hasUppercaseCharacters:](HKIncrementalSearchBar, "_hasUppercaseCharacters:", v7);
  +[HKIncrementalSearchBar _patternFromSearchString:quoteForJavascript:](HKIncrementalSearchBar, "_patternFromSearchString:quoteForJavascript:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)matchDisplayText
{
  return self->_matchDisplayText;
}

- (_SearchBarContent)searchBarContent
{
  return self->_searchBarContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarContent, 0);
  objc_storeStrong((id *)&self->_matchDisplayText, 0);
}

@end
