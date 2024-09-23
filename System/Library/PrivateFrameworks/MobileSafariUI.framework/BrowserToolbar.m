@implementation BrowserToolbar

- (void)_updateItemsForReplacementToolbar
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BrowserToolbar items](self, "items", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (self->_replacementToolbar)
          v11 = 0.0;
        else
          v11 = 1.0;
        objc_msgSend(v9, "setAlpha:", v11);

        objc_msgSend(v8, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setExclusiveTouch:", 1);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  -[BrowserToolbar items](self, "items");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 != v6 && (objc_msgSend(v7, "isEqualToArray:", v6) & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)BrowserToolbar;
    -[_SFToolbar setItems:animated:](&v9, sel_setItems_animated_, v6, v4);
    -[BrowserToolbar _updateItemsForReplacementToolbar](self, "_updateItemsForReplacementToolbar");
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BrowserToolbar;
  -[_SFToolbar layoutSubviews](&v3, sel_layoutSubviews);
  -[BrowserToolbar _updateItemsForReplacementToolbar](self, "_updateItemsForReplacementToolbar");
}

- (BrowserToolbar)initWithPlacement:(int64_t)a3 hideBackground:(BOOL)a4
{
  BrowserToolbar *v4;
  void *v5;
  void *v6;
  BrowserToolbar *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BrowserToolbar;
  v4 = -[_SFToolbar initWithPlacement:hideBackground:](&v9, sel_initWithPlacement_hideBackground_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BrowserToolbar setTintColor:](v4, "setTintColor:", v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__sceneDidEnterBackground_, *MEMORY[0x1E0DC5318], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__sceneWillEnterForeground_, *MEMORY[0x1E0DC5338], 0);
    v7 = v4;

  }
  return v4;
}

- (void)_sceneWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BrowserToolbar window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
    -[_SFToolbar setUsesLegacyDarkBackdrop:](self, "setUsesLegacyDarkBackdrop:", 0);
}

- (void)setReplacementToolbar:(id)a3 tintStyle:(int64_t)a4 withAnimationDelay:(double)a5
{
  UIToolbar *v9;
  UIToolbar *replacementToolbar;
  UIToolbar *v11;
  uint64_t v12;
  void *v13;
  UIToolbar *v14;
  void *v15;
  UIToolbar *v16;
  void *v17;
  _QWORD v18[5];
  UIToolbar *v19;
  _QWORD v20[4];
  UIToolbar *v21;
  UIToolbar *v22;
  BrowserToolbar *v23;
  int64_t v24;
  _QWORD v25[5];
  UIToolbar *v26;

  v9 = (UIToolbar *)a3;
  replacementToolbar = self->_replacementToolbar;
  if (replacementToolbar == v9)
  {
    objc_msgSend(MEMORY[0x1E0D4EF20], "themeWithBarTintStyle:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFToolbar setTheme:](self, "setTheme:", v17);

  }
  else
  {
    v11 = replacementToolbar;
    objc_storeStrong((id *)&self->_replacementToolbar, a3);
    -[UIToolbar setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    -[BrowserToolbar addSubview:](self, "addSubview:", v9);
    v12 = MEMORY[0x1E0C809B0];
    v13 = (void *)MEMORY[0x1E0DC3F10];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __69__BrowserToolbar_setReplacementToolbar_tintStyle_withAnimationDelay___block_invoke;
    v25[3] = &unk_1E9CF1830;
    v25[4] = self;
    v14 = v9;
    v26 = v14;
    objc_msgSend(v13, "performWithoutAnimation:", v25);
    v15 = (void *)MEMORY[0x1E0DC3F10];
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __69__BrowserToolbar_setReplacementToolbar_tintStyle_withAnimationDelay___block_invoke_2;
    v20[3] = &unk_1E9CF2B48;
    v21 = v11;
    v22 = v14;
    v23 = self;
    v24 = a4;
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __69__BrowserToolbar_setReplacementToolbar_tintStyle_withAnimationDelay___block_invoke_3;
    v18[3] = &unk_1E9CF4650;
    v18[4] = self;
    v19 = v21;
    v16 = v21;
    objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", 0, v20, v18, 0.0, a5);

  }
}

uint64_t __69__BrowserToolbar_setReplacementToolbar_tintStyle_withAnimationDelay___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[79])
  {
    objc_msgSend(v2, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUsesLegacyDarkBackdrop:", objc_msgSend(v4, "activationState") == 2);

  }
  else
  {
    objc_msgSend(v2, "setUsesLegacyDarkBackdrop:", 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  return objc_msgSend(v5, "setFrame:");
}

void __69__BrowserToolbar_setReplacementToolbar_tintStyle_withAnimationDelay___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 48), "_updateItemsForReplacementToolbar");
  objc_msgSend(MEMORY[0x1E0D4EF20], "themeWithBarTintStyle:", *(_QWORD *)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setTheme:", v2);

}

void *__69__BrowserToolbar_setReplacementToolbar_tintStyle_withAnimationDelay___block_invoke_3(uint64_t a1)
{
  void *result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v2 + 632) != result)
    return (void *)objc_msgSend(result, "removeFromSuperview");
  return result;
}

- (void)_sceneDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BrowserToolbar window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
    -[_SFToolbar setUsesLegacyDarkBackdrop:](self, "setUsesLegacyDarkBackdrop:", self->_replacementToolbar != 0);
}

- (double)alpha
{
  void *v3;
  double v4;
  double v5;
  objc_super v7;

  -[BrowserToolbar delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_isHitTesting
    || (objc_opt_respondsToSelector() & 1) == 0
    || (v4 = 1.0, (objc_msgSend(v3, "browserToolbarShouldHitTestAsOpaque:", self) & 1) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)BrowserToolbar;
    -[BrowserToolbar alpha](&v7, sel_alpha);
    v4 = v5;
  }

  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v7;

  self->_isHitTesting = 1;
  v7.receiver = self;
  v7.super_class = (Class)BrowserToolbar;
  -[BrowserToolbar hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isHitTesting = 0;
  return v5;
}

- (UIToolbar)replacementToolbar
{
  return self->_replacementToolbar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementToolbar, 0);
}

@end
