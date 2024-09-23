@implementation ICUnsupportedNoteView

- (ICUnsupportedNoteView)init
{
  return -[ICUnsupportedNoteView initWithReason:](self, "initWithReason:", 0);
}

- (ICUnsupportedNoteView)initWithReason:(unint64_t)a3
{
  ICUnsupportedNoteView *v4;
  ICUnsupportedNoteView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICUnsupportedNoteView;
  v4 = -[ICUnsupportedNoteView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_reason = a3;
    -[ICUnsupportedNoteView createLayout](v4, "createLayout");
  }
  return v5;
}

- (UIStackView)stackView
{
  UIStackView *stackView;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIStackView *v8;
  UIStackView *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  stackView = self->_stackView;
  if (!stackView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    -[ICUnsupportedNoteView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    -[ICUnsupportedNoteView summaryLabel](self, "summaryLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIStackView *)objc_msgSend(v4, "initWithArrangedSubviews:", v7);
    v9 = self->_stackView;
    self->_stackView = v8;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
    -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
    -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 3);
    -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 9.0);
    stackView = self->_stackView;
  }
  return stackView;
}

- (id)title
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v3 = -[ICUnsupportedNoteView reason](self, "reason");
  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("Can’t View Note");
    goto LABEL_5;
  }
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("Unsupported Note");
LABEL_5:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1EA7E9860, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (UILabel)titleLabel
{
  UILabel *titleLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  double v8;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICUnsupportedNoteView title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v6);

    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForStyle:symbolicTraits:", *MEMORY[0x1E0DC4B60], 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_titleLabel, "setFont:", v7);

    -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setMaximumContentSizeCategory:](self->_titleLabel, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48D0]);
    LODWORD(v8) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (id)summary
{
  void *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v3 = -[ICUnsupportedNoteView reason](self, "reason");
  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("This note can’t be viewed because the encryption key wasn’t found in iCloud Keychain. Resetting your end-to-end encrypted data can cause this.");
LABEL_9:
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1EA7E9860, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    return v2;
  }
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 6)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("This note uses unsupported features. To view or edit it, upgrade to the latest version of visionOS.");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == 1)
      {
        v7 = v6;
        v8 = CFSTR("This note uses unsupported features. To view or edit it, upgrade to the latest version of iPadOS.");
      }
      else
      {
        v7 = v6;
        v8 = CFSTR("This note uses unsupported features. To view or edit it, upgrade to the latest version of iOS.");
      }
    }
    goto LABEL_9;
  }
  return v2;
}

- (UILabel)summaryLabel
{
  UILabel *summaryLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  summaryLabel = self->_summaryLabel;
  if (!summaryLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_summaryLabel;
    self->_summaryLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_summaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICUnsupportedNoteView summary](self, "summary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_summaryLabel, "setText:", v6);

    -[UILabel setTextAlignment:](self->_summaryLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_summaryLabel, "setTextColor:", v7);

    -[UILabel setNumberOfLines:](self->_summaryLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_fontWithSingleLineA");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_summaryLabel, "setFont:", v9);

    -[UILabel setAdjustsFontForContentSizeCategory:](self->_summaryLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setMaximumContentSizeCategory:](self->_summaryLabel, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48D0]);
    LODWORD(v10) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_summaryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v10);
    summaryLabel = self->_summaryLabel;
  }
  return summaryLabel;
}

- (id)action
{
  void *v2;
  void *v3;

  if (-[ICUnsupportedNoteView reason](self, "reason") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Delete Note"), &stru_1EA7E9860, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isActionDestructive
{
  return -[ICUnsupportedNoteView reason](self, "reason") != 0;
}

- (UIButton)actionButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIButton *v8;
  UIButton *actionButton;
  void *v10;
  void *v11;
  double v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  if (!self->_actionButton)
  {
    -[ICUnsupportedNoteView action](self, "action");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_initWeak(&location, self);
      v4 = (void *)MEMORY[0x1E0DC3428];
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __37__ICUnsupportedNoteView_actionButton__block_invoke;
      v17 = &unk_1EA7DF3F8;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v4, "actionWithHandler:", &v14);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3520], "borderlessButtonConfiguration", v14, v15, v16, v17);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICUnsupportedNoteView action](self, "action");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitle:", v7);

      objc_msgSend(v6, "setButtonSize:", 2);
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v6, v5);
      v8 = (UIButton *)objc_claimAutoreleasedReturnValue();
      actionButton = self->_actionButton;
      self->_actionButton = v8;

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIButton titleLabel](self->_actionButton, "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

      if (-[ICUnsupportedNoteView isActionDestructive](self, "isActionDestructive"))
        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](self->_actionButton, "setTintColor:", v11);

      -[UIButton setShowsLargeContentViewer:](self->_actionButton, "setShowsLargeContentViewer:", 1);
      LODWORD(v12) = 1148846080;
      -[UIButton setContentCompressionResistancePriority:forAxis:](self->_actionButton, "setContentCompressionResistancePriority:forAxis:", 0, v12);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
  return self->_actionButton;
}

void __37__ICUnsupportedNoteView_actionButton__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void (**v4)(void);
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didTapActionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "didTapActionButton");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)createLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[ICUnsupportedNoteView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICUnsupportedNoteView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[ICUnsupportedNoteView stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICUnsupportedNoteView addSubview:](self, "addSubview:", v4);

  -[ICUnsupportedNoteView stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_addAnchorsToFillSuperview");

  -[ICUnsupportedNoteView actionButton](self, "actionButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICUnsupportedNoteView stackView](self, "stackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICUnsupportedNoteView actionButton](self, "actionButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addArrangedSubview:", v8);

    -[ICUnsupportedNoteView stackView](self, "stackView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUnsupportedNoteView summaryLabel](self, "summaryLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCustomSpacing:afterView:", v9, 16.0);

  }
}

- (unint64_t)reason
{
  return self->_reason;
}

- (id)didTapActionButton
{
  return self->_didTapActionButton;
}

- (void)setDidTapActionButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didTapActionButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
