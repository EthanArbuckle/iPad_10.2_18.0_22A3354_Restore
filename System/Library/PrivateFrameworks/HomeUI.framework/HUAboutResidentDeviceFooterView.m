@implementation HUAboutResidentDeviceFooterView

- (HUAboutResidentDeviceFooterView)initWithReuseIdentifier:(id)a3
{
  HUAboutResidentDeviceFooterView *v3;
  HUAboutResidentDeviceFooterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUAboutResidentDeviceFooterView;
  v3 = -[HUAboutResidentDeviceFooterView initWithReuseIdentifier:](&v6, sel_initWithReuseIdentifier_, a3);
  v4 = v3;
  if (v3)
    -[HUAboutResidentDeviceFooterView _setupViews](v3, "_setupViews");
  return v4;
}

- (HUAboutResidentDeviceFooterView)initWithCoder:(id)a3
{
  HUAboutResidentDeviceFooterView *v3;
  HUAboutResidentDeviceFooterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUAboutResidentDeviceFooterView;
  v3 = -[HUAboutResidentDeviceFooterView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[HUAboutResidentDeviceFooterView _setupViews](v3, "_setupViews");
  return v4;
}

- (HUAboutResidentDeviceFooterView)init
{
  return -[HUAboutResidentDeviceFooterView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (HUAboutResidentDeviceFooterView)initWithFrame:(CGRect)a3
{
  HUAboutResidentDeviceFooterView *v3;
  HUAboutResidentDeviceFooterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUAboutResidentDeviceFooterView;
  v3 = -[HUAboutResidentDeviceFooterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HUAboutResidentDeviceFooterView _setupViews](v3, "_setupViews");
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HUAboutResidentDeviceFooterView messageInsets](self, "messageInsets");
  v7 = v6;
  -[HUAboutResidentDeviceFooterView messageInsets](self, "messageInsets");
  v9 = width - (v7 + v8);
  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeThatFits:", v9, height);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)setMessageInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_messageInsets.left
    || a3.top != self->_messageInsets.top
    || a3.right != self->_messageInsets.right
    || a3.bottom != self->_messageInsets.bottom)
  {
    self->_messageInsets = a3;
    -[HUAboutResidentDeviceFooterView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  -[HUAboutResidentDeviceFooterView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[HUAboutResidentDeviceFooterView constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    -[HUAboutResidentDeviceFooterView constraints](self, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");
  }
  else
  {
    v6 = (void *)objc_opt_new();
    -[HUAboutResidentDeviceFooterView setConstraints:](self, "setConstraints:", v6);
  }

  -[HUAboutResidentDeviceFooterView constraints](self, "constraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceFooterView contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceFooterView messageInsets](self, "messageInsets");
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v13);

  -[HUAboutResidentDeviceFooterView constraints](self, "constraints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceFooterView contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceFooterView messageInsets](self, "messageInsets");
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, -v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v20);

  -[HUAboutResidentDeviceFooterView constraints](self, "constraints");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceFooterView contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v26);

  -[HUAboutResidentDeviceFooterView constraints](self, "constraints");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceFooterView contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v32);

  v33 = (void *)MEMORY[0x1E0CB3718];
  -[HUAboutResidentDeviceFooterView constraints](self, "constraints");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v34);

  v35.receiver = self;
  v35.super_class = (Class)HUAboutResidentDeviceFooterView;
  -[HUAboutResidentDeviceFooterView updateConstraints](&v35, sel_updateConstraints);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  id WeakRetained;
  int v11;
  HUAboutResidentDeviceFooterView *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v11, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "learnMoreLinkTapped:", self);

  return 0;
}

- (void)_setupViews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v3 = objc_alloc(MEMORY[0x1E0CEAB18]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HUAboutResidentDeviceFooterView setMessageView:](self, "setMessageView:", v4);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = *MEMORY[0x1E0CEB4B0];
  v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v9 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v10 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentInset:", v7, v8, v9, v10);

  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineFragmentPadding:", 0.0);

  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEditable:", 0);

  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setScrollEnabled:", 0);

  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_setInteractiveTextSelectionDisabled:", 1);

  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersAccessWithoutRemoteCapabilityFooter"), CFSTR("HUUsersAccessWithoutRemoteCapabilityFooter"), 1);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersAccessWithoutRemoteCapabilityFooterLearnMore"), CFSTR("HUUsersAccessWithoutRemoteCapabilityFooterLearnMore"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceFooterView _textAttributes](self, "_textAttributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v28, v21);
  -[HUAboutResidentDeviceFooterView _linkTextAttributes](self, "_linkTextAttributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addEntriesFromDictionary:", v23);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v19, v21);
  objc_msgSend(v22, "appendAttributedString:", v24);
  -[UITextView setAttributedText:](self->_messageView, "setAttributedText:", v22);
  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLinkTextAttributes:", v23);

  -[HUAboutResidentDeviceFooterView contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAboutResidentDeviceFooterView messageView](self, "messageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v27);

}

- (id)_textAttributes
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CEA230]);
  objc_msgSend(v2, "setAlignment:", 4);
  v9[0] = *MEMORY[0x1E0CEA098];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CEA0D0];
  v10[0] = v3;
  v10[1] = v2;
  v5 = *MEMORY[0x1E0CEA0A0];
  v9[1] = v4;
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_linkTextAttributes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CEA180];
  v9[0] = v2;
  v9[1] = &unk_1E70411D0;
  v4 = *MEMORY[0x1E0CEA0C0];
  v8[1] = v3;
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0D31970], "aboutResidentDeviceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HUAboutResidentDeviceFooterViewDelegate)delegate
{
  return (HUAboutResidentDeviceFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIEdgeInsets)messageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_messageInsets.top;
  left = self->_messageInsets.left;
  bottom = self->_messageInsets.bottom;
  right = self->_messageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UITextView)messageView
{
  return self->_messageView;
}

- (void)setMessageView:(id)a3
{
  objc_storeStrong((id *)&self->_messageView, a3);
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
