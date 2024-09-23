@implementation DMCEnrollmentTableViewTextCell

- (DMCEnrollmentTableViewTextCell)initWithText:(id)a3 bold:(BOOL)a4
{
  return -[DMCEnrollmentTableViewTextCell initWithText:bold:subText:layoutStyle:](self, "initWithText:bold:subText:layoutStyle:", a3, a4, 0, 0);
}

- (DMCEnrollmentTableViewTextCell)initWithText:(id)a3 bold:(BOOL)a4 subText:(id)a5 layoutStyle:(unint64_t)a6
{
  _BOOL8 v8;
  id v10;
  objc_class *v11;
  void *v12;
  DMCEnrollmentTableViewTextCell *v13;
  void *v14;
  uint64_t v15;
  UIButton *button;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  UILabel *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UILabel *subLabel;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSString *text;
  void *v51;
  id v52;
  id v54;
  _QWORD v55[4];
  id v56;
  id location;
  objc_super v58;
  uint64_t v59;
  _QWORD v60[2];
  _QWORD v61[2];
  const __CFString *v62;
  _QWORD v63[3];

  v8 = a4;
  v63[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v54 = a5;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58.receiver = self;
  v58.super_class = (Class)DMCEnrollmentTableViewTextCell;
  v13 = -[DMCEnrollmentTableViewTextCell initWithStyle:reuseIdentifier:](&v58, sel_initWithStyle_reuseIdentifier_, 0, v12);

  if (v13)
  {
    -[DMCEnrollmentTableViewTextCell setSelectionStyle:](v13, "setSelectionStyle:", 0);
    -[DMCEnrollmentTableViewTextCell setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTableViewTextCell setBackgroundColor:](v13, "setBackgroundColor:", v14);

    v13->_shouldCalculateLinkTextLineBreak = 1;
    v13->_layoutStyle = a6;
    v13->_textAlignment = 1;
    v13->_bold = v8;
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
    button = v13->_button;
    v13->_button = (UIButton *)v15;

    -[UIButton setHidden:](v13->_button, "setHidden:", 1);
    -[DMCEnrollmentTableViewTextCell contentView](v13, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v13->_button);

    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v18, "setNumberOfLines:", 0);
    -[DMCEnrollmentTableViewTextCell _textFontIsBold:](v13, "_textFontIsBold:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v19);

    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v20);

    objc_msgSend(v18, "setTextAlignment:", v13->_textAlignment);
    objc_msgSend(v18, "setText:", v10);
    -[DMCEnrollmentTableViewTextCell contentView](v13, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v18);

    -[DMCEnrollmentTableViewTextCell _horizontalMargin](v13, "_horizontalMargin");
    v23 = v22;
    -[DMCEnrollmentTableViewTextCell _verticalMargin](v13, "_verticalMargin");
    v25 = v24;
    if (v54)
    {
      v26 = (UILabel *)objc_opt_new();
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel setNumberOfLines:](v26, "setNumberOfLines:", 1);
      -[DMCEnrollmentTableViewTextCell _subTextFont](v13, "_subTextFont");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v26, "setFont:", v27);

      objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v26, "setTextColor:", v28);

      -[UILabel setTextAlignment:](v26, "setTextAlignment:", v13->_textAlignment);
      -[UILabel setText:](v26, "setText:", v54);
      -[UILabel sizeToFit](v26, "sizeToFit");
      -[DMCEnrollmentTableViewTextCell contentView](v13, "contentView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addSubview:", v26);

      v60[0] = CFSTR("label");
      v60[1] = CFSTR("subLabel");
      v61[0] = v18;
      v61[1] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("|-%f-[label]-%f-|"), v23, v23);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintsWithVisualFormat:options:metrics:views:", v32, 0, 0, v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("|-[subLabel]-|"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintsWithVisualFormat:options:metrics:views:", v35, 0, 0, v30);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("V:|-%f-[label]-0-[subLabel]-%f-|"), v25, v25);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintsWithVisualFormat:options:metrics:views:", v38, 0, 0, v30);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      -[DMCEnrollmentTableViewTextCell contentView](v13, "contentView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addConstraints:", v33);

      -[DMCEnrollmentTableViewTextCell contentView](v13, "contentView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addConstraints:", v36);

      -[DMCEnrollmentTableViewTextCell contentView](v13, "contentView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addConstraints:", v39);

      subLabel = v13->_subLabel;
      v13->_subLabel = v26;

    }
    else
    {
      v62 = CFSTR("label");
      v63[0] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("|-%f-[label]-%f-|"), v23, v23);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintsWithVisualFormat:options:metrics:views:", v45, 0, 0, v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("V:|-%f-[label]-%f-|"), v25, v25);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintsWithVisualFormat:options:metrics:views:", v47, 0, 0, v30);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      -[DMCEnrollmentTableViewTextCell contentView](v13, "contentView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addConstraints:", v33);

      -[DMCEnrollmentTableViewTextCell contentView](v13, "contentView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addConstraints:", v36);
    }

    v49 = objc_msgSend(v10, "copy");
    text = v13->_text;
    v13->_text = (NSString *)v49;

    objc_storeStrong((id *)&v13->_label, v18);
    objc_initWeak(&location, v13);
    v59 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __72__DMCEnrollmentTableViewTextCell_initWithText_bold_subText_layoutStyle___block_invoke;
    v55[3] = &unk_24D52E2D0;
    objc_copyWeak(&v56, &location);
    v52 = (id)-[DMCEnrollmentTableViewTextCell registerForTraitChanges:withHandler:](v13, "registerForTraitChanges:withHandler:", v51, v55);

    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);

  }
  return v13;
}

void __72__DMCEnrollmentTableViewTextCell_initWithText_bold_subText_layoutStyle___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_textFontIsBold:", objc_msgSend(WeakRetained, "bold"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "label");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFont:", v1);

    objc_msgSend(WeakRetained, "_subTextFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "subLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v3);

    if (WeakRetained[134])
    {
      objc_msgSend(WeakRetained, "label");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "font");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "hiddenTextView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFont:", v6);

    }
    objc_msgSend(WeakRetained, "_updateTextFont");
  }

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  CGFloat v12;
  void *v13;
  double previousWidth;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v31.receiver = self;
  v31.super_class = (Class)DMCEnrollmentTableViewTextCell;
  -[DMCEnrollmentTableViewTextCell layoutSubviews](&v31, sel_layoutSubviews);
  -[DMCEnrollmentTableViewTextCell bounds](self, "bounds");
  -[DMCEnrollmentTableViewTextCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, CGRectGetWidth(v32), 0.0, 0.0);
  -[DMCEnrollmentTableViewTextCell linkText](self, "linkText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DMCEnrollmentTableViewTextCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    if (self->_hiddenTextView)
    {
      -[DMCEnrollmentTableViewTextCell label](self, "label");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "frame");
      v6 = v5;
      v8 = v7;
      v10 = v9;

      -[DMCEnrollmentTableViewTextCell contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v12 = CGRectGetHeight(v33) - v8;

      -[DMCEnrollmentTableViewTextCell hiddenTextView](self, "hiddenTextView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFrame:", v6 + -5.0, v8, v10 + 10.0, v12);

    }
    previousWidth = self->_previousWidth;
    -[DMCEnrollmentTableViewTextCell bounds](self, "bounds");
    if (previousWidth != CGRectGetWidth(v34))
    {
      -[DMCEnrollmentTableViewTextCell bounds](self, "bounds");
      self->_previousWidth = CGRectGetWidth(v35);
      if (-[DMCEnrollmentTableViewTextCell shouldCalculateLinkTextLineBreak](self, "shouldCalculateLinkTextLineBreak"))
        -[DMCEnrollmentTableViewTextCell setLinkTextOnNextLine:](self, "setLinkTextOnNextLine:", 0);
    }
    -[DMCEnrollmentTableViewTextCell _rectsOfLinkText](self, "_rectsOfLinkText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DMCEnrollmentTableViewTextCell shouldCalculateLinkTextLineBreak](self, "shouldCalculateLinkTextLineBreak"))
      -[DMCEnrollmentTableViewTextCell setLinkTextOnNextLine:](self, "setLinkTextOnNextLine:", -[DMCEnrollmentTableViewTextCell isMultipleLines:](self, "isMultipleLines:", v15) | -[DMCEnrollmentTableViewTextCell linkTextOnNextLine](self, "linkTextOnNextLine"));
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rect");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    -[DMCEnrollmentTableViewTextCell _horizontalMargin](self, "_horizontalMargin");
    v26 = v25 + v18 + -15.0;
    -[DMCEnrollmentTableViewTextCell _verticalMargin](self, "_verticalMargin");
    v28 = v20 + -10.0 + v27;
    -[DMCEnrollmentTableViewTextCell button](self, "button");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", v26, v28, v22 + 20.0, v24 + 20.0);

    -[DMCEnrollmentTableViewTextCell button](self, "button");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setHidden:", 0);

  }
  else
  {
    -[DMCEnrollmentTableViewTextCell button](self, "button");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 1);
  }

}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:");
  }
}

- (void)configureLinkText:(id)a3 forceLineBreak:(BOOL)a4 linkAction:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;

  v6 = a4;
  v9 = a3;
  v8 = a5;
  if (v6)
  {
    -[DMCEnrollmentTableViewTextCell setShouldCalculateLinkTextLineBreak:](self, "setShouldCalculateLinkTextLineBreak:", 0);
    -[DMCEnrollmentTableViewTextCell setLinkTextOnNextLine:](self, "setLinkTextOnNextLine:", 1);
  }
  -[DMCEnrollmentTableViewTextCell setLinkText:](self, "setLinkText:", v9);
  -[DMCEnrollmentTableViewTextCell setLinkAction:](self, "setLinkAction:", v8);

}

- (void)setLinkText:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_linkText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_linkText, a3);
    -[DMCEnrollmentTableViewTextCell _updateTextFont](self, "_updateTextFont");
  }

}

- (void)setLinkAction:(id)a3
{
  id v4;
  void *v5;
  id linkAction;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x2199F7854]();
  linkAction = self->_linkAction;
  self->_linkAction = v5;

  if (v4)
  {
    -[DMCEnrollmentTableViewTextCell button](self, "button");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDF67B8];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__DMCEnrollmentTableViewTextCell_setLinkAction___block_invoke;
    v10[3] = &unk_24D52EB18;
    v11 = v4;
    objc_msgSend(v8, "actionWithHandler:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:forControlEvents:", v9, 64);

  }
}

uint64_t __48__DMCEnrollmentTableViewTextCell_setLinkAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  NSString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    text = self->_text;
    self->_text = v4;

    v6 = self->_text;
    -[DMCEnrollmentTableViewTextCell label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[DMCEnrollmentTableViewTextCell setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setLinkTextOnNextLine:(BOOL)a3
{
  _QWORD block[5];

  if (self->_linkTextOnNextLine != a3)
  {
    self->_linkTextOnNextLine = a3;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__DMCEnrollmentTableViewTextCell_setLinkTextOnNextLine___block_invoke;
    block[3] = &unk_24D52E500;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __56__DMCEnrollmentTableViewTextCell_setLinkTextOnNextLine___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTextFont");
}

- (void)setEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__DMCEnrollmentTableViewTextCell_setEnabled___block_invoke;
  v3[3] = &unk_24D52EB40;
  v3[4] = self;
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v3);
}

void __45__DMCEnrollmentTableViewTextCell_setEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", v2);

  objc_msgSend(*(id *)(a1 + 32), "button");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (double)cellHeight
{
  return *MEMORY[0x24BDF7DE0];
}

- (double)estimatedCellHeight
{
  return 100.0;
}

- (id)_rectsOfLinkText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[DMCEnrollmentTableViewTextCell hiddenTextView](self, "hiddenTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "positionFromPosition:offset:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "endOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTableViewTextCell linkText](self, "linkText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "positionFromPosition:offset:", v6, -objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "textRangeFromPosition:toPosition:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionRectsForRange:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UITextView)hiddenTextView
{
  UITextView *hiddenTextView;
  UITextView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UITextView *v12;

  hiddenTextView = self->_hiddenTextView;
  if (!hiddenTextView)
  {
    v4 = (UITextView *)objc_opt_new();
    -[UITextView setEditable:](v4, "setEditable:", 0);
    -[UITextView setScrollEnabled:](v4, "setScrollEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v4, "setTextColor:", v6);

    -[UITextView setTextAlignment:](v4, "setTextAlignment:", self->_textAlignment);
    -[DMCEnrollmentTableViewTextCell label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v4, "setFont:", v8);

    -[UITextView setTextContainerInset:](v4, "setTextContainerInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    -[DMCEnrollmentTableViewTextCell label](self, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    -[UITextView setFrame:](v4, "setFrame:");

    -[UITextView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[DMCEnrollmentTableViewTextCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v4);

    -[DMCEnrollmentTableViewTextCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendSubviewToBack:", v4);

    v12 = self->_hiddenTextView;
    self->_hiddenTextView = v4;

    hiddenTextView = self->_hiddenTextView;
  }
  return hiddenTextView;
}

- (void)_updateTextFont
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  const __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[2];
  uint64_t v49;
  _QWORD v50[3];
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[4];

  v53[2] = *MEMORY[0x24BDAC8D0];
  -[DMCEnrollmentTableViewTextCell text](self, "text");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_opt_new();
  v51 = *MEMORY[0x24BEBB360];
  v3 = v51;
  -[DMCEnrollmentTableViewTextCell _textFontIsBold:](self, "_textFontIsBold:", -[DMCEnrollmentTableViewTextCell bold](self, "bold"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v4;
  v52 = *MEMORY[0x24BEBB368];
  v5 = v52;
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v51, 2);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setLineBreakMode:", 4);
  v48[0] = v3;
  -[DMCEnrollmentTableViewTextCell _textFontIsBold:](self, "_textFontIsBold:", -[DMCEnrollmentTableViewTextCell bold](self, "bold"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v9;
  v48[1] = v5;
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = *MEMORY[0x24BEBB3A8];
  v11 = v49;
  v50[1] = v10;
  v50[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v48, 3);
  v42 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v7;
  v46[0] = v3;
  -[DMCEnrollmentTableViewTextCell _textFontIsBold:](self, "_textFontIsBold:", -[DMCEnrollmentTableViewTextCell bold](self, "bold"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v13;
  v46[1] = v5;
  objc_msgSend(MEMORY[0x24BDF6950], "placeholderTextColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v11;
  v47[1] = v14;
  v47[2] = v8;
  v40 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
  v41 = objc_claimAutoreleasedReturnValue();

  v44[0] = v3;
  -[DMCEnrollmentTableViewTextCell _textFontIsBold:](self, "_textFontIsBold:", -[DMCEnrollmentTableViewTextCell bold](self, "bold"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v5;
  v45[0] = v15;
  v16 = v39;
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v43, v12);
    objc_msgSend(v39, "appendAttributedString:", v19);

  }
  -[DMCEnrollmentTableViewTextCell linkText](self, "linkText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    if (-[DMCEnrollmentTableViewTextCell linkTextOnNextLine](self, "linkTextOnNextLine"))
      v22 = CFSTR("\n%@");
    else
      v22 = CFSTR(" %@");
    -[DMCEnrollmentTableViewTextCell linkText](self, "linkText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v22, v23);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v38, v18);
    objc_msgSend(v39, "appendAttributedString:", v24);

    v25 = objc_alloc(MEMORY[0x24BDD1458]);
    -[DMCEnrollmentTableViewTextCell linkText](self, "linkText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)v42;
    v28 = (void *)objc_msgSend(v25, "initWithString:attributes:", v26, v42);

    v29 = objc_alloc(MEMORY[0x24BDD1458]);
    -[DMCEnrollmentTableViewTextCell linkText](self, "linkText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v41;
    v32 = (void *)objc_msgSend(v29, "initWithString:attributes:", v30, v41);

    objc_msgSend(v39, "string");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTableViewTextCell hiddenTextView](self, "hiddenTextView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setText:", v33);

    v16 = v39;
  }
  else
  {
    v32 = 0;
    v28 = 0;
    v31 = (void *)v41;
    v27 = (void *)v42;
  }
  -[DMCEnrollmentTableViewTextCell label](self, "label");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAttributedText:", v16);

  -[DMCEnrollmentTableViewTextCell button](self, "button");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAttributedTitle:forState:", v28, 0);

  -[DMCEnrollmentTableViewTextCell button](self, "button");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setAttributedTitle:forState:", v32, 2);

  -[DMCEnrollmentTableViewTextCell setNeedsLayout](self, "setNeedsLayout");
}

- (id)_textFontIsBold:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = (void *)MEMORY[0x24BEBB520];
  if (v3)
    v7 = 2;
  else
    v7 = 0;
  objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_subTextFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77B8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isMultipleLines:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "rect");
        if (v8 > 0.0)
          ++v5;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
    LOBYTE(v4) = v5 > 1;
  }

  return v4;
}

- (double)_horizontalMargin
{
  double result;

  result = 5.0;
  if (self->_layoutStyle == 1)
    return 2.5;
  return result;
}

- (double)_verticalMargin
{
  double result;

  result = 10.0;
  if (self->_layoutStyle == 1)
    return 5.0;
  return result;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(unint64_t)a3
{
  self->_layoutStyle = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UILabel)subLabel
{
  return self->_subLabel;
}

- (void)setSubLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subLabel, a3);
}

- (void)setHiddenTextView:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenTextView, a3);
}

- (NSString)linkText
{
  return self->_linkText;
}

- (id)linkAction
{
  return self->_linkAction;
}

- (BOOL)bold
{
  return self->_bold;
}

- (void)setBold:(BOOL)a3
{
  self->_bold = a3;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (double)previousWidth
{
  return self->_previousWidth;
}

- (void)setPreviousWidth:(double)a3
{
  self->_previousWidth = a3;
}

- (BOOL)shouldCalculateLinkTextLineBreak
{
  return self->_shouldCalculateLinkTextLineBreak;
}

- (void)setShouldCalculateLinkTextLineBreak:(BOOL)a3
{
  self->_shouldCalculateLinkTextLineBreak = a3;
}

- (BOOL)linkTextOnNextLine
{
  return self->_linkTextOnNextLine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong(&self->_linkAction, 0);
  objc_storeStrong((id *)&self->_linkText, 0);
  objc_storeStrong((id *)&self->_hiddenTextView, 0);
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
