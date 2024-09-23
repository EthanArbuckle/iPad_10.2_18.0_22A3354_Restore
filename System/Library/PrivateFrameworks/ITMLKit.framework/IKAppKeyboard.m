@implementation IKAppKeyboard

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3;
  IKJSKeyboard *v4;
  void *v5;
  IKJSKeyboard *v6;

  v3 = a3;
  v4 = [IKJSKeyboard alloc];
  objc_msgSend(v3, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKJSObject initWithAppContext:](v4, "initWithAppContext:", v5);

  -[IKJSKeyboard setAppBridge:](v6, "setAppBridge:", v3);
  objc_msgSend(v3, "setJSKeyboard:", v6);

  return v6;
}

- (IKAppKeyboard)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6;
  id v7;
  IKAppKeyboard *v8;
  void *v9;
  uint64_t v10;
  NSString *featureName;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IKAppKeyboard;
  v8 = -[IKAppKeyboard init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_appContext, v9);

    v10 = objc_msgSend(v7, "copy");
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v10;

    *(_DWORD *)&v8->_jsShowDefaultHint = 16843009;
    *(_DWORD *)&v8->_showDefaultHint = 16843009;
  }

  return v8;
}

- (void)setText:(id)a3
{
  __CFString *text;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v8 = (__CFString *)a3;
  text = (__CFString *)self->_text;
  if (!text)
    text = &stru_1E9F50578;
  v5 = text;
  if (v8)
    v6 = v8;
  else
    v6 = &stru_1E9F50578;
  v7 = v6;
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", v7) & 1) == 0)
    -[IKAppKeyboard _setText:then:](self, "_setText:then:", v8, &__block_literal_global_10);

}

void __25__IKAppKeyboard_setText___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "jsKeyboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsTextDidChange");

}

- (void)didSelectHintWithText:(id)a3 searchTerm:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__IKAppKeyboard_didSelectHintWithText_searchTerm___block_invoke;
  v10[3] = &unk_1E9F4D2D0;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[IKAppKeyboard _setText:then:](self, "_setText:then:", v8, v10);

}

void __50__IKAppKeyboard_didSelectHintWithText_searchTerm___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(a2, "jsKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
    v4 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v3, "jsDidSelectHint:", v4);

}

- (void)setJSText:(id)a3
{
  NSString *v4;
  NSString *jsText;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = (NSString *)a3;
  jsText = self->_jsText;
  if (jsText != v4 && !-[NSString isEqualToString:](jsText, "isEqualToString:", v4))
  {
    v6 = (void *)-[NSString copy](v4, "copy");
    objc_storeStrong((id *)&self->_jsText, v6);
    objc_initWeak(&location, self);
    -[IKAppKeyboard appContext](self, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __27__IKAppKeyboard_setJSText___block_invoke;
    v9[3] = &unk_1E9F4D2F8;
    objc_copyWeak(&v11, &location);
    v8 = v6;
    v10 = v8;
    objc_msgSend(v7, "evaluateDelegateBlockSync:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

void __27__IKAppKeyboard_setJSText___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_storeStrong(WeakRetained + 10, *(id *)(a1 + 32));
    objc_msgSend(v4, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textDidChangeForKeyboard:", v4);

    WeakRetained = v4;
  }

}

- (void)setJSHints:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  IKAppKeyboardHint *v16;
  void *v17;
  IKAppKeyboard *v18;
  void *v19;
  uint64_t v20;
  JSManagedValue *jsHints;
  void *v22;
  id v23;
  IKAppKeyboard *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;

  v24 = self;
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isArray"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    if (v6 >= 1)
    {
      v7 = 0;
      v25 = v6;
      do
      {
        objc_msgSend(v3, "valueAtIndex:", v7, v24);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isObject"))
        {
          v9 = v3;
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("badge"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("text"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("searchTerm"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isString"))
          {
            objc_msgSend(v10, "toString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = 0;
          }
          v14 = &stru_1E9F50578;
          if (objc_msgSend(v11, "isString"))
          {
            objc_msgSend(v11, "toString");
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          if (objc_msgSend(v12, "isString"))
          {
            objc_msgSend(v12, "toString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = 0;
          }
          v16 = -[IKAppKeyboardHint initWithBadge:text:searchTerm:]([IKAppKeyboardHint alloc], "initWithBadge:text:searchTerm:", v13, v14, v15);
          objc_msgSend(v26, "addObject:", v16);

          v3 = v9;
          v6 = v25;
        }

        ++v7;
      }
      while (v6 != v7);
    }
  }
  v17 = (void *)MEMORY[0x1E0CBE0F8];
  v18 = v24;
  -[IKAppKeyboard jsKeyboard](v24, "jsKeyboard", v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "managedValueWithValue:andOwner:", v3, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  jsHints = v18->_jsHints;
  v18->_jsHints = (JSManagedValue *)v20;

  objc_initWeak(&location, v18);
  -[IKAppKeyboard appContext](v18, "appContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __28__IKAppKeyboard_setJSHints___block_invoke;
  v27[3] = &unk_1E9F4D2F8;
  objc_copyWeak(&v29, &location);
  v23 = v26;
  v28 = v23;
  objc_msgSend(v22, "evaluateDelegateBlockSync:", v27);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __28__IKAppKeyboard_setJSHints___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
      v4 = (void *)v8[11];
      v8[11] = v3;
    }
    else
    {
      v4 = (void *)v8[11];
      v8[11] = 0;
    }

    objc_msgSend(v8, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    WeakRetained = v8;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v8, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hintsDidChangeForKeyboard:", v8);

      WeakRetained = v8;
    }
  }

}

- (JSValue)jsHints
{
  return -[JSManagedValue value](self->_jsHints, "value");
}

- (void)setJSShowDefaultHint:(BOOL)a3
{
  void *v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;
  id location;

  if (self->_jsShowDefaultHint != a3)
  {
    self->_jsShowDefaultHint = a3;
    objc_initWeak(&location, self);
    -[IKAppKeyboard appContext](self, "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__IKAppKeyboard_setJSShowDefaultHint___block_invoke;
    v6[3] = &unk_1E9F4D320;
    objc_copyWeak(&v7, &location);
    v8 = a3;
    objc_msgSend(v5, "evaluateDelegateBlockSync:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __38__IKAppKeyboard_setJSShowDefaultHint___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[32] = *(_BYTE *)(a1 + 40);

}

- (BOOL)jsShowDefaultHint
{
  return self->_jsShowDefaultHint;
}

- (void)setJSClearHintsOnSelection:(BOOL)a3
{
  void *v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;
  id location;

  if (self->_jsClearHintsOnSelection != a3)
  {
    self->_jsClearHintsOnSelection = a3;
    objc_initWeak(&location, self);
    -[IKAppKeyboard appContext](self, "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__IKAppKeyboard_setJSClearHintsOnSelection___block_invoke;
    v6[3] = &unk_1E9F4D320;
    objc_copyWeak(&v7, &location);
    v8 = a3;
    objc_msgSend(v5, "evaluateDelegateBlockSync:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __44__IKAppKeyboard_setJSClearHintsOnSelection___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[33] = *(_BYTE *)(a1 + 40);

}

- (BOOL)jsClearHintsOnSelection
{
  return self->_jsClearHintsOnSelection;
}

- (void)setJSShowHintPreview:(BOOL)a3
{
  void *v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;
  id location;

  if (self->_jsShowHintPreview != a3)
  {
    self->_jsShowHintPreview = a3;
    objc_initWeak(&location, self);
    -[IKAppKeyboard appContext](self, "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__IKAppKeyboard_setJSShowHintPreview___block_invoke;
    v6[3] = &unk_1E9F4D320;
    objc_copyWeak(&v7, &location);
    v8 = a3;
    objc_msgSend(v5, "evaluateDelegateBlockSync:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __38__IKAppKeyboard_setJSShowHintPreview___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[34] = *(_BYTE *)(a1 + 40);

}

- (BOOL)jsShowHintPreview
{
  return self->_jsShowHintPreview;
}

- (void)setJSUpdateSearchTextOnHintSelection:(BOOL)a3
{
  void *v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;
  id location;

  if (self->_jsUpdateSearchTextOnHintSelection != a3)
  {
    self->_jsUpdateSearchTextOnHintSelection = a3;
    objc_initWeak(&location, self);
    -[IKAppKeyboard appContext](self, "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__IKAppKeyboard_setJSUpdateSearchTextOnHintSelection___block_invoke;
    v6[3] = &unk_1E9F4D320;
    objc_copyWeak(&v7, &location);
    v8 = a3;
    objc_msgSend(v5, "evaluateDelegateBlockSync:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __54__IKAppKeyboard_setJSUpdateSearchTextOnHintSelection___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[35] = *(_BYTE *)(a1 + 40);

}

- (BOOL)jsUpdateSearchTextOnHintSelection
{
  return self->_jsUpdateSearchTextOnHintSelection;
}

- (void)setJSHintRowTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *jsHintRowTitle;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (!-[NSString isEqualToString:](self->_jsHintRowTitle, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    jsHintRowTitle = self->_jsHintRowTitle;
    self->_jsHintRowTitle = v5;

    objc_initWeak(&location, self);
    -[IKAppKeyboard appContext](self, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __35__IKAppKeyboard_setJSHintRowTitle___block_invoke;
    v8[3] = &unk_1E9F4D2F8;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    objc_msgSend(v7, "evaluateDelegateBlockSync:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __35__IKAppKeyboard_setJSHintRowTitle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v3 = (void *)WeakRetained[14];
    WeakRetained[14] = v2;

  }
}

- (NSString)jsHintRowTitle
{
  return self->_jsHintRowTitle;
}

- (void)_setText:(id)a3 then:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  -[IKAppKeyboard _source](self, "_source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "copy");
  objc_storeStrong((id *)&self->_text, v9);
  objc_initWeak(&location, self);
  -[IKAppKeyboard appContext](self, "appContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __31__IKAppKeyboard__setText_then___block_invoke;
  v14[3] = &unk_1E9F4D348;
  objc_copyWeak(&v18, &location);
  v11 = v9;
  v15 = v11;
  v12 = v8;
  v16 = v12;
  v13 = v7;
  v17 = v13;
  objc_msgSend(v10, "evaluate:completionBlock:", v14, 0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __31__IKAppKeyboard__setText_then___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_storeStrong(WeakRetained + 5, *(id *)(a1 + 32));
    objc_storeStrong(v5 + 6, *(id *)(a1 + 40));
    v3 = v5;
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      (*(void (**)(uint64_t, id *))(v4 + 16))(v4, v5);
      v3 = v5;
    }
  }

}

- (NSString)jsText
{
  return self->_jsText;
}

- (NSString)jsSource
{
  return self->_jsSource;
}

- (void)setJSSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (IKAppKeyboardDelegate)delegate
{
  return (IKAppKeyboardDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)text
{
  return self->_text;
}

- (NSArray)hints
{
  return self->_hints;
}

- (IKJSKeyboard)jsKeyboard
{
  return (IKJSKeyboard *)objc_loadWeakRetained((id *)&self->_jsKeyboard);
}

- (void)setJSKeyboard:(id)a3
{
  objc_storeWeak((id *)&self->_jsKeyboard, a3);
}

- (NSString)_source
{
  return self->_source;
}

- (void)_setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)_showDefaultHint
{
  return self->_showDefaultHint;
}

- (void)_setShowDefaultHint:(BOOL)a3
{
  self->_showDefaultHint = a3;
}

- (BOOL)_clearHintsOnSelection
{
  return self->_clearHintsOnSelection;
}

- (void)_setClearHintsOnSelection:(BOOL)a3
{
  self->_clearHintsOnSelection = a3;
}

- (BOOL)_showSearchHintPreview
{
  return self->_showSearchHintPreview;
}

- (void)_setShowSearchHintPreview:(BOOL)a3
{
  self->_showSearchHintPreview = a3;
}

- (BOOL)_updateSearchTextOnHintSelection
{
  return self->_updateSearchTextOnHintSelection;
}

- (void)_setUpdateSearchTextOnHintSelection:(BOOL)a3
{
  self->_updateSearchTextOnHintSelection = a3;
}

- (NSString)_hintRowTitle
{
  return self->_hintRowTitle;
}

- (void)_setHintRowTitle:(id)a3
{
  objc_storeStrong((id *)&self->_hintRowTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintRowTitle, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_destroyWeak((id *)&self->_jsKeyboard);
  objc_storeStrong((id *)&self->_hints, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_jsSource, 0);
  objc_storeStrong((id *)&self->_jsText, 0);
  objc_storeStrong((id *)&self->_jsHintRowTitle, 0);
  objc_storeStrong((id *)&self->_jsHints, 0);
}

@end
