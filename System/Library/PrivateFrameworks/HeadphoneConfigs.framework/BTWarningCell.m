@implementation BTWarningCell

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  return 1;
}

+ (int64_t)cellStyle
{
  return 0;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BTWarningCell;
  -[PSTableCell layoutSubviews](&v3, sel_layoutSubviews);
  -[BTWarningCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (BTWarningCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  BTWarningCell *v4;
  uint64_t v5;
  UITextView *titleTextView;
  uint64_t v7;
  UITextView *bodyTextView;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BTWarningCell;
  v4 = -[BTWarningCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, 0);
  if (v4)
  {
    createWarningCellTitle();
    v5 = objc_claimAutoreleasedReturnValue();
    titleTextView = v4->_titleTextView;
    v4->_titleTextView = (UITextView *)v5;

    createWarningCellBody();
    v7 = objc_claimAutoreleasedReturnValue();
    bodyTextView = v4->_bodyTextView;
    v4->_bodyTextView = (UITextView *)v7;

    -[UITextView setDelegate:](v4->_bodyTextView, "setDelegate:", v4);
    -[BTWarningCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_titleTextView);
    objc_msgSend(v9, "addSubview:", v4->_bodyTextView);
    -[BTWarningCell layoutSubviews](v4, "layoutSubviews");

  }
  return v4;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)BTWarningCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v24, sel_refreshCellContentsWithSpecifier_, a3);
  v4 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80600]);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("warning-cell-title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained(v4);
  objc_msgSend(v8, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("warning-cell-body-link-text"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_loadWeakRetained(v4);
  objc_msgSend(v11, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("warning-cell-body-url"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextView setText:](self->_titleTextView, "setText:", v7);
  v14 = objc_loadWeakRetained(v4);
  objc_msgSend(v14, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("warning-cell-body"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v13)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v16);
    objc_msgSend(v17, "setAsLink:linkURL:", v10, v13);
    v18 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAttribute:value:range:", v18, v19, 0, objc_msgSend(v17, "length"));

    v20 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "textColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "addAttribute:value:range:", v20, v23, 0, objc_msgSend(v17, "length"));
    if (!v22)

    -[UITextView setAttributedText:](self->_bodyTextView, "setAttributedText:", v17);
  }
  else
  {
    -[UITextView setText:](self->_bodyTextView, "setText:", v16);
  }

  -[BTWarningCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *constraints;
  objc_super v10;

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
  _NSDictionaryOfVariableBindings(CFSTR("_titleTextView, _bodyTextView"), self->_titleTextView, self->_bodyTextView, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_titleTextView]-|"), 0, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_bodyTextView]-|"), 0, 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-11-[_titleTextView]-[_bodyTextView]-11-|"), 0, 0, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v6);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v8;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
  v10.receiver = self;
  v10.super_class = (Class)BTWarningCell;
  -[BTWarningCell updateConstraints](&v10, sel_updateConstraints);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_bodyTextView, 0);
  objc_storeStrong((id *)&self->_titleTextView, 0);
}

@end
