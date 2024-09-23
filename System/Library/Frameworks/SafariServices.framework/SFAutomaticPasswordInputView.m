@implementation SFAutomaticPasswordInputView

- (SFAutomaticPasswordInputView)initWithInputViewStyle:(int64_t)a3 keyboardType:(int64_t)a4
{
  SFAutomaticPasswordInputView *v5;
  SFAutomaticPasswordInputView *v6;
  SFAutomaticPasswordExplanationView *v7;
  SFAutomaticPasswordExplanationView *explanationView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SFAutomaticPasswordInputView *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)SFAutomaticPasswordInputView;
  v5 = -[UIInputView initWithFrame:inputViewStyle:](&v26, sel_initWithFrame_inputViewStyle_, a3, 0.0, 0.0, 100.0, 100.0);
  v6 = v5;
  if (v5)
  {
    v5->_keyboardType = a4;
    v7 = -[SFAutomaticPasswordExplanationView initWithKeyboardType:]([SFAutomaticPasswordExplanationView alloc], "initWithKeyboardType:", v5->_keyboardType);
    explanationView = v6->_explanationView;
    v6->_explanationView = v7;

    -[SFAutomaticPasswordExplanationView setTranslatesAutoresizingMaskIntoConstraints:](v6->_explanationView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFAutomaticPasswordInputView addSubview:](v6, "addSubview:", v6->_explanationView);
    -[SFAutomaticPasswordExplanationView useStrongPasswordButton](v6->_explanationView, "useStrongPasswordButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", v6, sel__useStrongPasswordButtonAction_, 0x2000);

    v21 = (void *)MEMORY[0x1E0CB3718];
    -[SFAutomaticPasswordExplanationView topAnchor](v6->_explanationView, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAutomaticPasswordInputView topAnchor](v6, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    -[SFAutomaticPasswordExplanationView leadingAnchor](v6->_explanationView, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAutomaticPasswordInputView leadingAnchor](v6, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v11;
    -[SFAutomaticPasswordExplanationView trailingAnchor](v6->_explanationView, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAutomaticPasswordInputView trailingAnchor](v6, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v14;
    -[SFAutomaticPasswordExplanationView bottomAnchor](v6->_explanationView, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAutomaticPasswordInputView bottomAnchor](v6, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v18);

    -[SFAutomaticPasswordInputView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("SFAutomaticPasswordInputView"));
    v19 = v6;
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    objc_msgSend(obj, "inputViewControllerOtherOptionsMenu:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAutomaticPasswordExplanationView useOtherPasswordButton](self->_explanationView, "useOtherPasswordButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMenu:", v5);

    -[SFAutomaticPasswordExplanationView useOtherPasswordButton](self->_explanationView, "useOtherPasswordButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowsMenuAsPrimaryAction:", 1);

  }
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  -[SFAutomaticPasswordExplanationView setKeyboardAppearance:](self->_explanationView, "setKeyboardAppearance:", a3);
}

- (int64_t)keyboardAppearance
{
  return -[SFAutomaticPasswordExplanationView keyboardAppearance](self->_explanationView, "keyboardAppearance");
}

- (void)_useStrongPasswordButtonAction:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "inputViewControllerDidSelectUseStrongPassword:", self);

}

- (CGSize)intrinsicContentSize
{
  id WeakRetained;
  void *v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputViewSizing);
  v4 = WeakRetained;
  if (!self->_shouldAllowSelfSizing || WeakRetained == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)SFAutomaticPasswordInputView;
    -[SFAutomaticPasswordInputView intrinsicContentSize](&v12, sel_intrinsicContentSize);
  }
  else
  {
    objc_msgSend(WeakRetained, "intrinsicContentSizeForInputView:", self);
  }
  v8 = v6;
  v9 = v7;

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)allowsSelfSizing
{
  return self->_shouldAllowSelfSizing;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (SFAutomaticPasswordInputViewDelegate)delegate
{
  return (SFAutomaticPasswordInputViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SFAutomaticPasswordInputViewSizing)inputViewSizing
{
  return (SFAutomaticPasswordInputViewSizing *)objc_loadWeakRetained((id *)&self->_inputViewSizing);
}

- (void)setInputViewSizing:(id)a3
{
  objc_storeWeak((id *)&self->_inputViewSizing, a3);
}

- (BOOL)shouldAllowSelfSizing
{
  return self->_shouldAllowSelfSizing;
}

- (void)setShouldAllowSelfSizing:(BOOL)a3
{
  self->_shouldAllowSelfSizing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputViewSizing);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_explanationView, 0);
}

@end
