@implementation SFAutoFillStrongPasswordContainerInputView

- (SFAutoFillStrongPasswordContainerInputView)initWithInputViewStyle:(int64_t)a3 containingView:(id)a4
{
  id v7;
  SFAutoFillStrongPasswordContainerInputView *v8;
  SFAutoFillStrongPasswordContainerInputView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SFAutoFillStrongPasswordContainerInputView *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SFAutoFillStrongPasswordContainerInputView;
  v8 = -[UIInputView initWithFrame:inputViewStyle:](&v26, sel_initWithFrame_inputViewStyle_, a3, 0.0, 0.0, 100.0, 100.0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_containingView, a4);
    -[SFAutoFillStrongPasswordContainerInputView addSubview:](v9, "addSubview:", v7);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v7, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAutoFillStrongPasswordContainerInputView leadingAnchor](v9, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    objc_msgSend(v7, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAutoFillStrongPasswordContainerInputView trailingAnchor](v9, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v10;
    objc_msgSend(v7, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAutoFillStrongPasswordContainerInputView topAnchor](v9, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v13;
    objc_msgSend(v7, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAutoFillStrongPasswordContainerInputView bottomAnchor](v9, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v17);

    v18 = v9;
  }

  return v9;
}

- (BOOL)allowsSelfSizing
{
  return 1;
}

- (CGSize)intrinsicContentSize
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputViewSizing);
  if (-[SFAutoFillStrongPasswordContainerInputView allowsSelfSizing](self, "allowsSelfSizing") && WeakRetained)
  {
    objc_msgSend(WeakRetained, "intrinsicContentSizeForInputView:", self);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SFAutoFillStrongPasswordContainerInputView;
    -[SFAutoFillStrongPasswordContainerInputView intrinsicContentSize](&v10, sel_intrinsicContentSize);
  }
  v6 = v4;
  v7 = v5;

  v8 = v6;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (SFAutomaticPasswordInputViewSizing)inputViewSizing
{
  return (SFAutomaticPasswordInputViewSizing *)objc_loadWeakRetained((id *)&self->_inputViewSizing);
}

- (void)setInputViewSizing:(id)a3
{
  objc_storeWeak((id *)&self->_inputViewSizing, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputViewSizing);
  objc_storeStrong((id *)&self->_containingView, 0);
}

@end
