@implementation GKNicknameController

- (GKNicknameController)init
{
  GKNicknameController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKNicknameController;
  v2 = -[GKNicknameController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D253B8], "_gkReachabilityForInternetConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKNicknameController setReachability:](v2, "setReachability:", v3);

    -[GKNicknameController setShouldUseSuggestedNicknameOnDefaultNickname:](v2, "setShouldUseSuggestedNicknameOnDefaultNickname:", 0);
  }
  return v2;
}

- (void)setNickname:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_nickname, a3);
  v7 = a3;
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](self->_nickname, "setPlaceholder:", v6);

  -[UITextField setDelegate:](self->_nickname, "setDelegate:", self);
}

- (void)updateReturnKeyEnabledState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  -[GKNicknameController nickname](self, "nickname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "length") < 3)
  {
    v7 = 0;
  }
  else
  {
    -[GKNicknameController nickname](self, "nickname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (unint64_t)objc_msgSend(v6, "length") < 0x10;

  }
  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReturnKeyEnabled:", v7);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  -[GKNicknameController displayNicknameSuggestions](self, "displayNicknameSuggestions", a3, a4.location, a4.length, a5);
  return 1;
}

- (void)stopObservingKeyboardEvents
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54D0], 0);

}

- (void)startObservingKeyboardEvents
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_nicknameTextChanged_, *MEMORY[0x1E0DC54D0], 0);

}

- (void)commitNicknameChanges:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  -[GKNicknameController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[GKNicknameController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nicknameWillbeginUpdating");

  }
  -[GKNicknameController activityIndicator](self, "activityIndicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startAnimating");

  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profileServicePrivate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNicknameController nickname](self, "nickname");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__GKNicknameController_commitNicknameChanges___block_invoke;
  v14[3] = &unk_1E59C5200;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v10, "setPlayerNickname:suggestionsCount:handler:", v12, 3, v14);

}

void __46__GKNicknameController_commitNicknameChanges___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v7 = a2;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__GKNicknameController_commitNicknameChanges___block_invoke_2;
  block[3] = &unk_1E59C51D8;
  v9 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v15 = v9;
  v16 = a3;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __46__GKNicknameController_commitNicknameChanges___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  objc_msgSend(*(id *)(a1 + 32), "activityIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (!v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "nickname");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D25330], "local");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlias:", v6);

      v3 = *(_QWORD *)(a1 + 56);
      v4 = *(_QWORD *)(a1 + 40);
    }
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
  }
  if (*(_QWORD *)(a1 + 40) || *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "setSuggestedNicknames:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "displayNicknameSuggestions");
    v8 = objc_msgSend(*(id *)(a1 + 32), "shouldShakeTextFieldOnError");
    v9 = *(void **)(a1 + 32);
    if (v8)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __46__GKNicknameController_commitNicknameChanges___block_invoke_3;
      v18[3] = &unk_1E59C4148;
      v18[4] = v9;
      objc_msgSend(v9, "shakeNicknameTextFieldWithCompletionBlock:", v18);
    }
    else
    {
      objc_msgSend(v9, "reset");
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      GKGameCenterUIFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "nicknameUpdateRequestCompletedWithStatus:error:", v15, *(_QWORD *)(a1 + 40));

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setNicknameChangeWasCommitted:", 1);
    objc_msgSend(*(id *)(a1 + 32), "nickname");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resignFirstResponder");

    objc_msgSend(MEMORY[0x1E0D25330], "local");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__GKNicknameController_commitNicknameChanges___block_invoke_4;
    v17[3] = &unk_1E59C4148;
    v17[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v13, "deleteMonogramsWithHandler:", v17);

  }
}

uint64_t __46__GKNicknameController_commitNicknameChanges___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

void __46__GKNicknameController_commitNicknameChanges___block_invoke_4(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nicknameUpdateRequestCompletedWithStatus:error:", 0, 0);

  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  -[GKNicknameController nickname](self, "nickname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNicknameController defaultNickname](self, "defaultNickname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportEvent:type:", *MEMORY[0x1E0D250A0], *MEMORY[0x1E0D25118]);

  }
  -[GKNicknameController reachability](self, "reachability");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_gkCurrentReachabilityStatus");

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0D25330], "local");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "alias");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKNicknameController nickname](self, "nickname");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

    goto LABEL_7;
  }
  -[GKNicknameController nickname](self, "nickname");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alias");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "isEqualToString:", v15);

  if ((v16 & 1) != 0)
  {
LABEL_7:
    objc_msgSend(v4, "resignFirstResponder");
    v17 = 1;
    goto LABEL_8;
  }
  -[GKNicknameController setNicknameWasEdited:](self, "setNicknameWasEdited:", 1);
  -[GKNicknameController commitNicknameChanges:](self, "commitNicknameChanges:", 0);
  v17 = 0;
LABEL_8:

  return v17;
}

- (void)displayNicknameSuggestions
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  -[GKNicknameController suggestedNicknames](self, "suggestedNicknames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 1)
      v7 = 3;
    else
      v7 = 2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKNicknameController suggestedNicknames](self, "suggestedNicknames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__GKNicknameController_displayNicknameSuggestions__block_invoke;
    v13[3] = &unk_1E59C5228;
    v14 = v8;
    v15 = v7;
    v12 = v8;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

    -[GKNicknameController nickname](self, "nickname");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textInputSuggestionDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSuggestions:", v12);

  }
}

void __50__GKNicknameController_displayNicknameSuggestions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3E40], "textSuggestionWithInputText:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= *(_QWORD *)(a1 + 40))
    *a4 = 1;

}

- (void)didSelectSuggestion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKNicknameController nickname](self, "nickname");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)reset
{
  -[GKNicknameController setNicknameWasEdited:](self, "setNicknameWasEdited:", 0);
  -[GKNicknameController updateReturnKeyEnabledState](self, "updateReturnKeyEnabledState");
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[GKNicknameController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 1;
  -[GKNicknameController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "nicknameShouldBeginEditing");

  return v7;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[GKNicknameController nickname](self, "nickname", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNicknameController setDefaultNickname:](self, "setDefaultNickname:", v5);

  -[GKNicknameController reset](self, "reset");
  -[GKNicknameController nickname](self, "nickname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputSuggestionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E40], "textSuggestionWithInputText:", &stru_1E59EB978);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSuggestions:", v9);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__GKNicknameController_textFieldDidBeginEditing___block_invoke;
  v10[3] = &unk_1E59C4148;
  v10[4] = self;
  -[GKNicknameController loadSuggestedNicknames:](self, "loadSuggestedNicknames:", v10);
}

uint64_t __49__GKNicknameController_textFieldDidBeginEditing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayNicknameSuggestions");
}

- (void)nicknameTextChanged:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;

  -[GKNicknameController updateReturnKeyEnabledState](self, "updateReturnKeyEnabledState", a3);
  -[GKNicknameController nickname](self, "nickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 < 0x10)
  {
    v17 = 0;
  }
  else
  {
    -[GKNicknameController nickname](self, "nickname");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "substringToIndex:", 15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKNicknameController nickname](self, "nickname");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

    v11 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v13, &unk_1E5A5DDB8, &unk_1E5A5DDD0);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[GKNicknameController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[GKNicknameController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "nicknameTextDidChangeWithMessage:", v17);

  }
  -[GKNicknameController displayNicknameSuggestions](self, "displayNicknameSuggestions");

}

- (void)shakeNicknameTextFieldWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemovedOnCompletion:", 1);
  v6 = (void *)MEMORY[0x1E0CB3B18];
  -[GKNicknameController nickname](self, "nickname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "position");
  v10 = v9 + -5.0;
  -[GKNicknameController nickname](self, "nickname");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "position");
  *(double *)v32 = v10;
  v32[1] = v13;
  objc_msgSend(v6, "valueWithBytes:objCType:", v32, "{CGPoint=dd}");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", v14);

  v15 = (void *)MEMORY[0x1E0CB3B18];
  -[GKNicknameController nickname](self, "nickname");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "position");
  v19 = v18 + 5.0;
  -[GKNicknameController nickname](self, "nickname");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "position");
  *(double *)v31 = v19;
  v31[1] = v22;
  objc_msgSend(v15, "valueWithBytes:objCType:", v31, "{CGPoint=dd}");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToValue:", v23);

  objc_msgSend(v5, "setDuration:", 0.05);
  LODWORD(v24) = 4.0;
  objc_msgSend(v5, "setRepeatCount:", v24);
  objc_msgSend(v5, "setAutoreverses:", 1);
  v25 = (void *)MEMORY[0x1E0CD28B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __66__GKNicknameController_shakeNicknameTextFieldWithCompletionBlock___block_invoke;
  v29[3] = &unk_1E59C4DA8;
  v30 = v4;
  v26 = v4;
  objc_msgSend(v25, "setCompletionBlock:", v29);
  -[GKNicknameController nickname](self, "nickname");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addAnimation:forKey:", v5, CFSTR("shake"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __66__GKNicknameController_shakeNicknameTextFieldWithCompletionBlock___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__GKNicknameController_shakeNicknameTextFieldWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E59C4DA8;
    v4 = *(id *)(a1 + 32);
    dispatch_after(v2, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __66__GKNicknameController_shakeNicknameTextFieldWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)keyboardWillShow:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKNicknameController nickname](self, "nickname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFirstResponder");

  if (v6)
  {
    -[GKNicknameController nickname](self, "nickname");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textInputSuggestionDelegate");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E40], "textSuggestionWithInputText:", &stru_1E59EB978);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "setSuggestions:", v10);

    -[GKNicknameController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[GKNicknameController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "keyboardWillShow:", v4);

    }
  }

}

- (void)keyboardWillHide:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!-[GKNicknameController nicknameWasEdited](self, "nicknameWasEdited"))
  {
    objc_msgSend(MEMORY[0x1E0D25330], "local");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alias");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKNicknameController nickname](self, "nickname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

  }
  -[GKNicknameController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[GKNicknameController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keyboardWillHide:", v10);

  }
}

- (void)textFieldDidBecomeFirstResponder:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[GKNicknameController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[GKNicknameController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nicknameDidBecomeFirstResponder");

  }
}

- (void)textFieldDidResignFirstResponder:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[GKNicknameController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[GKNicknameController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nicknameDidResignFirstResponder");

  }
}

- (void)loadSuggestedNicknames:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileServicePrivate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNicknameController nickname](self, "nickname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__GKNicknameController_loadSuggestedNicknames___block_invoke;
  v10[3] = &unk_1E59C5250;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v6, "getSuggestionsForNickname:suggestionsCount:handler:", v8, 3, v10);

}

void __47__GKNicknameController_loadSuggestedNicknames___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD block[4];
  id v4;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setSuggestedNicknames:", a2);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__GKNicknameController_loadSuggestedNicknames___block_invoke_2;
    block[3] = &unk_1E59C4DA8;
    v4 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __47__GKNicknameController_loadSuggestedNicknames___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setShouldUseSuggestedNicknameOnDefaultNickname:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  _QWORD v7[5];

  self->_shouldUseSuggestedNicknameOnDefaultNickname = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D25330], "local");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isDefaultNickname");

    if (v6)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __71__GKNicknameController_setShouldUseSuggestedNicknameOnDefaultNickname___block_invoke;
      v7[3] = &unk_1E59C4148;
      v7[4] = self;
      -[GKNicknameController loadSuggestedNicknames:](self, "loadSuggestedNicknames:", v7);
    }
  }
}

void __71__GKNicknameController_setShouldUseSuggestedNicknameOnDefaultNickname___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "suggestedNicknames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "suggestedNicknames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "nickname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    objc_msgSend(*(id *)(a1 + 32), "setNicknameWasEdited:", 1);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "nickname");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nicknameUpdateAvatarImage:", v9);

    }
  }
}

- (UITextField)nickname
{
  return self->_nickname;
}

- (BOOL)nicknameWasEdited
{
  return self->_nicknameWasEdited;
}

- (void)setNicknameWasEdited:(BOOL)a3
{
  self->_nicknameWasEdited = a3;
}

- (BOOL)nicknameChangeWasCommitted
{
  return self->_nicknameChangeWasCommitted;
}

- (void)setNicknameChangeWasCommitted:(BOOL)a3
{
  self->_nicknameChangeWasCommitted = a3;
}

- (BOOL)shouldShakeTextFieldOnError
{
  return self->_shouldShakeTextFieldOnError;
}

- (void)setShouldShakeTextFieldOnError:(BOOL)a3
{
  self->_shouldShakeTextFieldOnError = a3;
}

- (BOOL)shouldUseSuggestedNicknameOnDefaultNickname
{
  return self->_shouldUseSuggestedNicknameOnDefaultNickname;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (GKNicknameControllerDelegate)delegate
{
  return (GKNicknameControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GKReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
  objc_storeStrong((id *)&self->_reachability, a3);
}

- (NSArray)suggestedNicknames
{
  return self->_suggestedNicknames;
}

- (void)setSuggestedNicknames:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedNicknames, a3);
}

- (NSString)defaultNickname
{
  return self->_defaultNickname;
}

- (void)setDefaultNickname:(id)a3
{
  objc_storeStrong((id *)&self->_defaultNickname, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultNickname, 0);
  objc_storeStrong((id *)&self->_suggestedNicknames, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
}

@end
