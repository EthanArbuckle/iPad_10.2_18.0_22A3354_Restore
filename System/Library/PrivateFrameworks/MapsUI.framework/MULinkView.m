@implementation MULinkView

- (MULinkView)initWithFrame:(CGRect)a3
{
  MULinkView *v3;
  objc_class *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MULinkView;
  v3 = -[MULinkView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULinkView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", v5);

    -[MULinkView _setupLinkView](v3, "_setupLinkView");
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULinkView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", v7);

  }
  return v3;
}

- (void)_setupLinkView
{
  UITextView *v3;
  UITextView *textView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MUEdgeLayout *v9;
  UITextView *v10;
  void *v11;
  MUEdgeLayout *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3E50], "_mapsui_defaultTextView");
  v3 = (UITextView *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  self->_textView = v3;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](self->_textView, "setTextColor:", v6);

  -[UITextView setDelegate:](self->_textView, "setDelegate:", self);
  -[UITextView setAccessibilityIdentifier:](self->_textView, "setAccessibilityIdentifier:", CFSTR("LinkViewTextView"));
  -[UITextView textContainer](self->_textView, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineBreakMode:", 4);

  -[MULinkView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  -[UITextView setInsetsLayoutMarginsFromSafeArea:](self->_textView, "setInsetsLayoutMarginsFromSafeArea:", 0);
  -[UITextView setAdjustsFontForContentSizeCategory:](self->_textView, "setAdjustsFontForContentSizeCategory:", 1);
  -[MULinkView _updateForButtonShapeStatusChange](self, "_updateForButtonShapeStatusChange");
  -[MULinkView _updateTintColor](self, "_updateTintColor");
  MURegisterForButtonShapeEnablementChanges(self, (uint64_t)sel__updateForButtonShapeStatusChange);
  -[MULinkView addSubview:](self, "addSubview:", self->_textView);
  v8 = (void *)MEMORY[0x1E0CB3718];
  v9 = [MUEdgeLayout alloc];
  v10 = self->_textView;
  -[MULinkView layoutMarginsGuide](self, "layoutMarginsGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MUEdgeLayout initWithItem:container:](v9, "initWithItem:container:", v10, v11);
  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_mapsui_activateLayouts:", v13);

  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)-[MULinkView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v15, sel__updateTintColor);

}

- (void)setAttributedText:(id)a3
{
  -[UITextView set_mapsui_attributedText:](self->_textView, "set_mapsui_attributedText:", a3);
}

- (NSAttributedString)attributedText
{
  return -[UITextView _mapsui_attributedText](self->_textView, "_mapsui_attributedText");
}

- (void)setNumberOfLines:(unint64_t)a3
{
  id v4;

  -[UITextView textContainer](self->_textView, "textContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumNumberOfLines:", a3);

}

- (unint64_t)numberOfLines
{
  void *v2;
  unint64_t v3;

  -[UITextView textContainer](self->_textView, "textContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumNumberOfLines");

  return v3;
}

- (void)_updateTintColor
{
  id v3;

  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextView setTintColor:](self->_textView, "setTintColor:", v3);

}

- (void)_updateForButtonShapeStatusChange
{
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (UIAccessibilityButtonShapesEnabled())
  {
    v4 = *MEMORY[0x1E0DC1248];
    v5[0] = &unk_1E2E55698;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setLinkTextAttributes:](self->_textView, "setLinkTextAttributes:", v3);

  }
  else
  {
    -[UITextView setLinkTextAttributes:](self->_textView, "setLinkTextAttributes:", 0);
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v9;
  id v10;
  void (**selectionBlock)(id, MULinkView *);

  v9 = a3;
  v10 = a4;
  if (!a6)
  {
    selectionBlock = (void (**)(id, MULinkView *))self->_selectionBlock;
    if (selectionBlock)
      selectionBlock[2](selectionBlock, self);
  }

  return 0;
}

- (void)textViewDidChangeSelection:(id)a3
{
  objc_msgSend(a3, "setSelectedTextRange:", 0);
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  return 0;
}

- (id)selectionBlock
{
  return self->_selectionBlock;
}

- (void)setSelectionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionBlock, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
