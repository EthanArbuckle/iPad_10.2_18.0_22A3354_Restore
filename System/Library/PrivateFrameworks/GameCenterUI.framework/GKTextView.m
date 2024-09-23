@implementation GKTextView

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  v6[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appearanceWhenContainedInInstancesOfClasses:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0D25B38]);
  objc_msgSend(v4, "set_baseStyle:", v5);

}

- (GKTextView)initWithFrame:(CGRect)a3
{
  GKTextView *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  Class *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKTextView;
  v3 = -[GKTextView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 != 1 || (*MEMORY[0x1E0D253F8] ? (v6 = *MEMORY[0x1E0D25B68] == 0) : (v6 = 0), v6))
      v7 = (Class *)0x1E0D25B38;
    else
      v7 = (Class *)0x1E0D25B30;
    v8 = objc_alloc_init(*v7);
    objc_storeStrong((id *)&v3->__baseStyle, v8);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKTextView;
  -[GKTextView dealloc](&v4, sel_dealloc);
}

- (void)updatePlaceholderVisibility
{
  _BOOL8 v3;
  void *v4;
  id v5;

  -[GKTextView text](self, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "length") != 0;
  -[GKTextView placeholderLabel](self, "placeholderLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKTextView;
  -[GKTextView setText:](&v4, sel_setText_, a3);
  -[GKTextView replayAndApplyStyle](self, "replayAndApplyStyle");
}

- (void)setAttributedText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKTextView;
  -[GKTextView setAttributedText:](&v4, sel_setAttributedText_, a3);
  -[GKTextView replayAndApplyStyle](self, "replayAndApplyStyle");
}

- (void)setPlaceholderText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0D25B28];
  v5 = a3;
  objc_msgSend(v4, "textStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composeMessage");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_gkAttributedStringByApplyingStyle:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKTextView setAttributedPlaceholderText:](self, "setAttributedPlaceholderText:", v7);
}

- (void)setAttributedPlaceholderText:(id)a3
{
  GKLabel *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[GKTextView placeholderLabel](self, "placeholderLabel");
  v4 = (GKLabel *)objc_claimAutoreleasedReturnValue();
  if (v8 && !v4)
  {
    v4 = objc_alloc_init(GKLabel);
    -[GKTextView addSubview:](self, "addSubview:", v4);
    -[GKTextView setPlaceholderLabel:](self, "setPlaceholderLabel:", v4);
    -[GKTextView updatePlaceholderVisibility](self, "updatePlaceholderVisibility");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0DC1230];
    -[GKTextView textStorage](self, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_textStorageDidChangeNotification_, v6, v7);

  }
  -[GKLabel setAttributedText:](v4, "setAttributedText:", v8);
  -[GKTextView setNeedsLayout](self, "setNeedsLayout");

}

- (NSString)placeholderText
{
  void *v2;
  void *v3;

  -[GKTextView placeholderLabel](self, "placeholderLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSAttributedString)attributedPlaceholderText
{
  void *v2;
  void *v3;

  -[GKTextView placeholderLabel](self, "placeholderLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)GKTextView;
  -[GKTextView layoutSubviews](&v17, sel_layoutSubviews);
  -[GKTextView placeholderLabel](self, "placeholderLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GKTextView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(v3, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "_gkIsNaturallyRTL"))
      v13 = 2;
    else
      v13 = 0;
    objc_msgSend(v3, "setTextAlignment:", v13);

    objc_msgSend(v3, "setNumberOfLines:", 0);
    objc_msgSend(v3, "setOpaque:", 0);
    objc_msgSend(v3, "setBackgroundColor:", 0);
    -[GKTextView textContainerInset](self, "textContainerInset");
    v15 = v7 + v14;
    objc_msgSend(v3, "sizeThatFits:", v9, v11);
    objc_msgSend(v3, "setFrame:", v5 + 5.0, v15, v9 + -12.0, v16);
  }

}

- (void)set_baseStyle:(id)a3
{
  GKTextStyle *v5;
  GKTextStyle *v6;

  v5 = (GKTextStyle *)a3;
  if (self->__baseStyle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__baseStyle, a3);
    -[GKTextView replayAndApplyStyle](self, "replayAndApplyStyle");
    v5 = v6;
  }

}

- (void)applyTextStyle:(id)a3
{
  GKTextStyle **p_appliedStyle;
  GKTextStyle *v6;
  GKTextStyle *v7;

  p_appliedStyle = &self->_appliedStyle;
  v6 = (GKTextStyle *)a3;
  v7 = v6;
  if (*p_appliedStyle != v6)
  {
    objc_storeStrong((id *)&self->_appliedStyle, a3);
    v6 = *p_appliedStyle;
  }
  if (v6)
    -[GKTextView replayAndApplyStyle](self, "replayAndApplyStyle");

}

- (void)replayAndApplyStyle
{
  GKTextStyle *v3;
  GKTextStyle *appliedStyle;
  uint64_t v5;
  void *v6;
  GKTextStyle *v7;
  GKTextStyle *v8;

  v3 = self->__baseStyle;
  appliedStyle = self->_appliedStyle;
  if (appliedStyle)
  {
    v7 = v3;
    -[GKTextStyle replayOnBaseStyle:systemContentSizeDidChange:](appliedStyle, "replayOnBaseStyle:systemContentSizeDidChange:", self->__baseStyle, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (GKTextStyle *)v5;
  }
  if (v3)
  {
    v8 = v3;
    -[GKTextStyle attributes](v3, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTextView setTypingAttributes:](self, "setTypingAttributes:", v6);

    v3 = v8;
  }

}

- (id)insertDictationResultPlaceholder
{
  void *v3;
  objc_super v5;

  -[GKTextView placeholderLabel](self, "placeholderLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  v5.receiver = self;
  v5.super_class = (Class)GKTextView;
  -[GKTextView insertDictationResultPlaceholder](&v5, sel_insertDictationResultPlaceholder);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  -[GKTextView placeholderLabel](self, "placeholderLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 1.0);

  v8.receiver = self;
  v8.super_class = (Class)GKTextView;
  -[GKTextView removeDictationResultPlaceholder:willInsertResult:](&v8, sel_removeDictationResultPlaceholder_willInsertResult_, v6, v4);

}

- (GKTextStyle)_baseStyle
{
  return self->__baseStyle;
}

- (GKTextStyle)appliedStyle
{
  return self->_appliedStyle;
}

- (void)setAppliedStyle:(id)a3
{
  objc_storeStrong((id *)&self->_appliedStyle, a3);
}

- (GKLabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (void)setPlaceholderLabel:(id)a3
{
  self->_placeholderLabel = (GKLabel *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appliedStyle, 0);
  objc_storeStrong((id *)&self->__baseStyle, 0);
}

@end
