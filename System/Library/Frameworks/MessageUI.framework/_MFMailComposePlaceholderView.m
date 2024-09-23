@implementation _MFMailComposePlaceholderView

- (_MFMailComposePlaceholderView)initWithFrame:(CGRect)a3
{
  _MFMailComposePlaceholderView *v3;
  _MFMailComposePlaceholderView *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  MFMailComposeHeaderView *v11;
  double v12;
  double v13;
  uint64_t v14;
  MFMailComposeHeaderView *toField;
  MFMailComposeHeaderView *v16;
  MFMailComposeHeaderView *multiView;
  MFComposeSubjectView *v18;
  MFComposeSubjectView *subjectView;
  MFMailComposeHeaderView *v20;
  void *v21;
  void *v22;
  MFMailComposeHeaderView *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)_MFMailComposePlaceholderView;
  v3 = -[_MFMailComposePlaceholderView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_MFMailComposePlaceholderView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "mailGeneralBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFMailComposePlaceholderView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    +[MFMailComposeView preferredHeaderHeight](MFMailComposeView, "preferredHeaderHeight");
    v10 = v9;

    v11 = [MFMailComposeHeaderView alloc];
    v12 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v14 = -[MFMailComposeHeaderView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D538], v13, v8, v10);
    toField = v4->_toField;
    v4->_toField = (MFMailComposeHeaderView *)v14;

    v16 = -[MFMailComposeHeaderView initWithFrame:]([MFMailComposeHeaderView alloc], "initWithFrame:", v12, v13, v8, v10);
    multiView = v4->_multiView;
    v4->_multiView = v16;

    v18 = -[MFComposeSubjectView initWithFrame:]([MFComposeSubjectView alloc], "initWithFrame:", v12, v13, v8, v10);
    subjectView = v4->_subjectView;
    v4->_subjectView = v18;

    v20 = v4->_toField;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("TO"), &stru_1E5A6A588, CFSTR("Main"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeHeaderView setLabel:](v20, "setLabel:", v22);

    v23 = v4->_multiView;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CC/BCC"), &stru_1E5A6A588, CFSTR("Main"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeHeaderView setLabel:](v23, "setLabel:", v25);

    -[MFComposeSubjectView textView](v4->_subjectView, "textView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setUserInteractionEnabled:", 0);

    -[_MFMailComposePlaceholderView addSubview:](v4, "addSubview:", v4->_toField);
    -[_MFMailComposePlaceholderView addSubview:](v4, "addSubview:", v4->_multiView);
    -[_MFMailComposePlaceholderView addSubview:](v4, "addSubview:", v4->_subjectView);
  }
  return v4;
}

- (void)setSubject:(id)a3
{
  -[MFComposeSubjectView setText:](self->_subjectView, "setText:", a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;

  +[MFMailComposeView preferredHeaderHeight](MFMailComposeView, "preferredHeaderHeight");
  v4 = v3;
  -[_MFMailComposePlaceholderView bounds](self, "bounds");
  v6 = v5;
  -[MFMailComposeHeaderView setFrame:](self->_toField, "setFrame:", 0.0, 0.0);
  -[MFMailComposeHeaderView setFrame:](self->_multiView, "setFrame:", 0.0, v4 + 0.0, v6, v4);
  -[MFComposeSubjectView setFrame:](self->_subjectView, "setFrame:", 0.0, v4 + v4 + 0.0, v6, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectView, 0);
  objc_storeStrong((id *)&self->_multiView, 0);
  objc_storeStrong((id *)&self->_toField, 0);
}

@end
