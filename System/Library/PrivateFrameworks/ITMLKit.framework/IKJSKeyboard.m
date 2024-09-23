@implementation IKJSKeyboard

- (id)asPrivateIKJSKeyboard
{
  IKJSKeyboard *v3;

  if (-[IKJSKeyboard conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01E8948))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IKJSKeyboard appBridge](self, "appBridge");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setJSText:", v4);

}

- (NSString)text
{
  void *v2;
  void *v3;

  -[IKJSKeyboard appBridge](self, "appBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSuggestions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IKJSKeyboard appBridge](self, "appBridge");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setJSHints:", v4);

}

- (JSValue)suggestions
{
  void *v2;
  void *v3;

  -[IKJSKeyboard appBridge](self, "appBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsHints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (JSValue *)v3;
}

- (void)setHints:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IKJSKeyboard appBridge](self, "appBridge");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setJSHints:", v4);

}

- (JSValue)hints
{
  void *v2;
  void *v3;

  -[IKJSKeyboard appBridge](self, "appBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsHints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (JSValue *)v3;
}

- (void)setShowDefaultHint:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IKJSKeyboard appBridge](self, "appBridge");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setJSShowDefaultHint:", v3);

}

- (BOOL)showDefaultHint
{
  void *v2;
  char v3;

  -[IKJSKeyboard appBridge](self, "appBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "jsShowDefaultHint");

  return v3;
}

- (void)setClearHintsOnSelection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IKJSKeyboard appBridge](self, "appBridge");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setJSClearHintsOnSelection:", v3);

}

- (BOOL)clearHintsOnSelection
{
  void *v2;
  char v3;

  -[IKJSKeyboard appBridge](self, "appBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "jsClearHintsOnSelection");

  return v3;
}

- (void)setShowSearchHintPreview:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IKJSKeyboard appBridge](self, "appBridge");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setJSShowHintPreview:", v3);

}

- (BOOL)showSearchHintPreview
{
  void *v2;
  char v3;

  -[IKJSKeyboard appBridge](self, "appBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "jsShowHintPreview");

  return v3;
}

- (void)setUpdateSearchTextOnHintSelection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IKJSKeyboard appBridge](self, "appBridge");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setJSUpdateSearchTextOnHintSelection:", v3);

}

- (BOOL)updateSearchTextOnHintSelection
{
  void *v2;
  char v3;

  -[IKJSKeyboard appBridge](self, "appBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "jsUpdateSearchTextOnHintSelection");

  return v3;
}

- (void)setHintRowTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IKJSKeyboard appBridge](self, "appBridge");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setJSHintRowTitle:", v4);

}

- (NSString)hintRowTitle
{
  void *v2;
  void *v3;

  -[IKJSKeyboard appBridge](self, "appBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsHintRowTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)jsTextDidChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (+[IKUtilites isAppTrusted](IKUtilites, "isAppTrusted"))
  {
    -[IKJSKeyboard appBridge](self, "appBridge");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "jsText");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = &stru_1E9F50578;
    if (v4)
      v6 = (const __CFString *)v4;
    v12[0] = v6;
    -[IKJSKeyboard appBridge](self, "appBridge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "jsSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)

  }
  else
  {
    v10 = 0;
  }
  v11 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onTextChange"), v10);

}

- (void)jsDidSelectHint:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onSuggestionSelected"), v6, v9, v10);
  v8 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onHintSelected"), v6);

}

- (IKAppKeyboardBridge)appBridge
{
  return self->_appBridge;
}

- (void)setAppBridge:(id)a3
{
  objc_storeStrong((id *)&self->_appBridge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBridge, 0);
}

@end
